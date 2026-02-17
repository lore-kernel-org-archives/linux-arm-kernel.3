Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE9EE909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6uiyg3agQofR68FFetwOQfg0L6dwRHbam23Zk7rdlc=; b=0Bus/KNiqlXRzfwAF8sU2yqNpQ
	JlyIutTYUptjq42SkUTjVDnEDMH9SphC+vtgXEHtEkQ48EQb035oTcaEEhsDutybUGAIALmvBWt/k
	XHn4x35S9oOoRF32eeCaiqF3A238hIGXHevF9/NQOUCN0Oi3+ZK6V+ey6mlxYrtzCWckvq4tXsGks
	8RE5X37hqz0A63GAYJcIDgPGR0CUehDs4C4V1bmsW2OIEwv+xO0cDtzU5XAuMHUG35Qj3DSxOFDug
	UQ8HNNsfYk6wJJ9PtGkuj9nPlEbog/apNdMEkOOrOSqj2Nwv872QjdiZc1iT04C6xgJ1iVCYxfH6Y
	hbufBQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLbA-00000008NkT-0Pbp;
	Tue, 17 Feb 2026 13:58:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLb7-00000008Nk1-3A7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:58:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9F501477;
	Tue, 17 Feb 2026 05:58:33 -0800 (PST)
Received: from [10.1.30.186] (XHFQ2J9959.cambridge.arm.com [10.1.30.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92D203F632;
	Tue, 17 Feb 2026 05:58:38 -0800 (PST)
Message-ID: <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
Date: Tue, 17 Feb 2026 13:58:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map
 creation
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jack Aboutboul <jaboutboul@microsoft.com>,
 Sharath George John <sgeorgejohn@microsoft.com>,
 Noah Meyerhans <nmeyerhans@microsoft.com>,
 Jim Perrin <Jim.Perrin@microsoft.com>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2026021700-chafe-jurist-cb24@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055841_841656_C6B65C9F 
X-CRM114-Status: GOOD (  13.30  )
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

On 17/02/2026 13:50, Greg KH wrote:
> On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
>> Hi All,
>>
>> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
>> some speed ups to enable significantly faster booting on systems with a lot of
>> memory. The patches were originally posted at:
>>
>>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
>>
>> ... and were originally merged upstream in v6.10-rc1.
>>
>> I'm requesting this be merged to stable on behalf of a partner who wants to get
>> the benefit of this series in Debian 12.
> 
> Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
> would be able to justify moving to a newer kernel for performance
> reasons, why enable them to stay on an older one, just delaying the
> inevitable upgrade they will have to do anyway in a year or so?

I can't answer this presicely, but I did ask and push for that approach. As I
understand it, they are stuck with Debian 12, which is stuck with kernel 6.1.
The Debian maintainer apparently requested that these go through stable in order
to get them into Debian 12.

Thanks,
Ryan

> 
> thanks,
> 
> greg k-h


