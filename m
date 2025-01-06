Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBEEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFltLzutjLChajYcQ04RjwFDr7gm83e9w/SFboQ59lY=; b=SLn3uIx9BxBruCAnQa2aVNNppq
	AYFBlis9Qdd4teTkz2bF9vmi5dbVWUDY3M8aKd2maXJg972my9ovKzE4t80BlpPR8eSNriXHuSgZJ
	Z3AMAf5tSg7mnRksqsfRpwpTkYQIZTGDzWiaUXYTNUpL+MKE7GYR3lTVkcd+28OJd9byrh+uudU8D
	gmQI0mFOo5xPXbOKqWxF016t70seGRyBmEfxszj3e/lJO71i8wyNsJKZ1EQczHRHwb4GqvnKDZw/Y
	g9igDsJfPivXx6bgoIvhRRALUbgRzjlUP4UREpcM9RZfA7SO1zy0Q1F04Fws02tVcLtvU/g+iBirX
	SQA4p8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgoP-00000000Jdd-0dLd;
	Mon, 06 Jan 2025 06:42:05 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUgn8-00000000JVf-3ssY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 06:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736145644; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DFltLzutjLChajYcQ04RjwFDr7gm83e9w/SFboQ59lY=;
	b=tDR/2HMEFOCmGR4Ick8OK4/dwVGib3WXUTnqI8DPVQcOtZ71Y04nYHEiC20dhUGi0mPa68yL6Tz4Xi7taNdEVq3wCNvAhkj34i3ZCNdVDV521oOh46j6zvyfvUl/BYrkTk/DV9lN8yZAdvmvDkEwUAxVdH4xMVIq73xq3flJ5eg=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WN01L1._1736145641 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 06 Jan 2025 14:40:42 +0800
Message-ID: <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com>
Date: Mon, 6 Jan 2025 14:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in
 try_to_unmap_one
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, ioworker0@gmail.com, david@redhat.com,
 ryan.roberts@arm.com, zhengtangquan@oppo.com, ying.huang@intel.com,
 kasong@tencent.com, chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
References: <20250106031711.82855-1-21cnbao@gmail.com>
 <20250106031711.82855-2-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250106031711.82855-2-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_224047_311868_DC5F1FBE 
X-CRM114-Status: UNSURE (   8.59  )
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



On 2025/1/6 11:17, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> The refcount may be temporarily or long-term increased, but this does
> not change the fundamental nature of the folio already being lazy-
> freed. Therefore, we only reset 'swapbacked' when we are certain the
> folio is dirty and not droppable.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

The changes look good to me. While we are at it, could you also change 
the __discard_anon_folio_pmd_locked() to follow the same strategy for 
lazy-freed PMD-sized folio?

