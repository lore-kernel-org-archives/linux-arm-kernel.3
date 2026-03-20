Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB71093170
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euot9GX9Psoi1WN6TxY1zgk1VpiBJA8QKwf2sKbBPeo=; b=Wyc1nH9SFiY7LZMS0Ify1egjvU
	vrD9PHeOpLwC6ASZRmu9NtHJhxruq1x2CmyPO6Q1JxaCfB1pjIan6Q1ns/F+XaPDrsELA4ly/j7ey
	WwFW1losUPhaAX2KTAYiKJ7oc1Zq5GLLYe0l7e6dm6xXG6tWP2EkR4InsJMBH4H4uGczNn+4Oj8WX
	0jowL2qNfUzZBkYxIv6P46TXD1aElQ+cjZtp5x11vxOI3soz2GiO73m3naMoD2oeDpN69XoH9aKi/
	iePqMrsK6fRjO38/qhixx99Ouahp6CyHRegXTqp+ncoTtQuZ0MWnwrdzq1rY3zxTIyf1wqCib7zJg
	GKCBcvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQo-0000000C0Lj-1A2F;
	Fri, 20 Mar 2026 03:21:50 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QQj-0000000C0Hr-0tLx;
	Fri, 20 Mar 2026 03:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773976902; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=euot9GX9Psoi1WN6TxY1zgk1VpiBJA8QKwf2sKbBPeo=;
	b=xN8Iggt6tX/tPExA1iJqoRuwWlq1s3yfKPpziSg4l0nFJBV9Ftikd1T9GCqLLi9FN3blhNDRjK5G0CwGeNh+/JEEitgwYhuAjvqPkzn7GgRjCRaR2nYk+a8JP8XYZXyqz/Oqs1//4EapqRxUxu53ZDxLzntxy5IE2mxhfuafp8U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R471e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.K7P-S_1773976899;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.K7P-S_1773976899 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 11:21:40 +0800
Message-ID: <ab7ea070-47c8-447a-8e9e-ac471063cf8d@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:21:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <20260319201839.2dfa704041b8f13d8dbbfd3b@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260319201839.2dfa704041b8f13d8dbbfd3b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_202145_429078_A764F09F 
X-CRM114-Status: UNSURE (   5.78  )
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



On 3/20/26 11:18 AM, Andrew Morton wrote:
> On Thu, 19 Mar 2026 11:23:59 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> This is a cleanup patchset to change all young flag check functions to
>> return bool, as discussed with David in the previous thread[1]. Since
>> callers only care about whether the young flag was set, returning bool
>> makes the intention clearer. No functional changes intended.
> 
> One observation from Sashiko.  Minorish, worth addressing:
> 	https://sashiko.dev/#/patchset/cover.1773890510.git.baolin.wang%40linux.alibaba.com

Yes, good catch. Will fix in next version. Thanks.

