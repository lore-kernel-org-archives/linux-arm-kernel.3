Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82576C02184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 02:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjVJp/Tn6fX3LEf8wmhADih2F2lTUv2YGcfXrVdHbPI=; b=b7fDpSwPMnGupDeTH5p00qRPkP
	aqrtdFVdxFDke40SArKw+aeNXxICqyl2/rEmh8/LHo8UMr8rzhls4RmXDLzEF6btbCRcZR4Gu7NSq
	yeLE/mnTUgJpT6+ZByrkDsw/GMCQYQjxg1AXLh9urA4oYhHrE4NrLVUeuJlsL/U+h4UUH6CZbdpR1
	tJtNhZoQc7Dk48+pcBgCXHWMHRTUiA9yJpMUIKLVA0FAMLF62Y4akajhUcWy/KEF0sFimW8xkSuim
	WCzMaqWR/6y7xj/OitVocbQ7On8wtkkBFynP8UZlUoVHfU+wtHclZu4Em7cb33BPYHHmb5zou9rTy
	WzCV5DEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXX7I-00000007IJ7-1kV2;
	Tue, 14 Jan 2025 02:57:20 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXX60-00000007IDk-3Pbh;
	Tue, 14 Jan 2025 02:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736823357; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IjVJp/Tn6fX3LEf8wmhADih2F2lTUv2YGcfXrVdHbPI=;
	b=xKc43jpSjQOY23+BGlHhUxgLxTSgC1hpJYQ7V22o6AkwzILClGNJVlTUP7YQcLSNmFO2vSgU/Dpgu1/l0y/52ZGAedhdFlsOC0QbWipJj2sX00KoNrEV3rrnGOlz+j2EPoM68Q3bIQldl4FlaCLqt+ak8ZnzxT3lt/2TVm1FmQk=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WNd8Wfg_1736823354 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jan 2025 10:55:55 +0800
Message-ID: <21fa516b-8828-40c5-b5cb-d97cdf01f0f2@linux.alibaba.com>
Date: Tue, 14 Jan 2025 10:55:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in
 try_to_unmap_one
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: chrisl@kernel.org, david@redhat.com, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-2-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250113033901.68951-2-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_185601_020337_7D85DA6F 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2025/1/13 11:38, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The refcount may be temporarily or long-term increased, but this does
> not change the fundamental nature of the folio already being lazy-
> freed. Therefore, we only reset 'swapbacked' when we are certain the
> folio is dirty and not droppable.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

LGTM. Feel free to add:
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

