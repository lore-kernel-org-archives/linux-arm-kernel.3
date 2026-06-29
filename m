Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070A0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4WWkUZBY002kkaRYjZIgIYzDJN/ZzYORwDbPhpFnlQ=; b=nfZbpeVmxF1M8ctq/MSYJpsCjC
	yWmJD/jJX9u/FXNldtH4gh6CBT7/mZFrtNA9HJjt18z9NixNVREgkxnls6fJARRPnNvxqK87T0nHq
	/Em1BYFILXEcPHa4p2tFZiQcIseJhE/CEBS2A+nmKPYh6lXkgL1ph+gOlMwSZ55cHwgfcVLtJnV6X
	Tzn+/mpLQKk/frCZfCtzGYj19jRO6eIS2zKSEgAxaZ8udimd37gIdovpPYtJkhd+2h9ofRAKsRarN
	GUcRjj9Ho5uBUjK+aUqPsxTMnQlYjkk8r+tZ1bVgG/IS3klAJB/7Ok/q0mZXk97pstKBz0F2k4IGC
	OSPS+JxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGMY-0000000FKU1-20Ja;
	Mon, 29 Jun 2026 18:05:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGMV-0000000FKTc-40js
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 18:05:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638DB3D64;
	Mon, 29 Jun 2026 11:05:33 -0700 (PDT)
Received: from [10.57.71.126] (unknown [10.57.71.126])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E60D3F905;
	Mon, 29 Jun 2026 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782756337; bh=qNZy8Tm8DWgGzmQrITM+Nja5UIflC5zFAWNSv/0dnTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T/Sn/dzS4QuIkaPLm65fIZnQLPrjIcHkm8uqSb96i4ObfjVMmWPcaQT03U99pIDGF
	 bSNHBKF/KjaDDv/xn6lqHOtUINnwUblb+OgNF7G+TUs84Y09XqLkRo7m6YKMdTO8xY
	 l0GE6Y5pYq0FzIEngbmWFxU4/lfaIwmrjIPlU/zw=
Message-ID: <8d72230b-d636-447c-873e-b95304457a5a@arm.com>
Date: Mon, 29 Jun 2026 19:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org
References: <20260629100953.385435-1-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260629100953.385435-1-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_110540_050830_32B00A50 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Mark,

On 6/29/26 11:09, Mark Rutland wrote:
> Will notes that the ARM64_WORKAROUND_REPEAT_TLBI name is potentially
> misleading, and that it would be nice to rename that and add some
> documentation. See:
> 
>   https://lore.kernel.org/linux-arm-kernel/ajKn_Pt50CmOUrsP@willie-the-truck/
> 
> To that end, I've renamed the Kconfig symbol and hwcap from:
> 
>   [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI
> 
> ... to:
> 
>   [CONFIG_]ARM64_WORKAROUND_REPEAT_TLBI_SYNC
> 
> ... and I've added some rationale alongside the Kconfig. As the Kconfig
> symbol isn't user selectable, the usual 'help' section won't appear in
> menuconfig, so I've added this as a comment.
> 

Although it won't appear in menuconfig, 3rd party tools that
index config symbols may still consume the help section.
I'm not sure how much we care about such tools...

Cheers
Vladimir


