Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08394C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XruWKhhR9RXxWQQGZb6YjloEQ5TMXEFiyTpXrOgv/AQ=; b=Pnj9uAWV8YSvyjuX+HiiZ2RaiA
	FNnb8CUZxly5hU2rJ++ylYwBKVssP7Ho64UqkysVOl4kjfzRf8K6kvRitJIhFXKuIHKbPVmE1Hsme
	rRbeGg3corELmxXgIm5Spkfu9CtCgrRG7BKgvklMP+OUQ2F844erKCz0oSHI275i5KOheR407c1DP
	77gALL0C9yMHeoRrIK8p9xInRh0e43HQuSbRhfonYRDZEgzdXY47yhW0WQrFoHhgETOLsmp6Gglgq
	UP957k3Rsl7ITNewxGw4t6w4AWv6yIlpXJ0GUSNH89dWCVrh1CVQryuXwxQDEwSrThVV3BXt/B6bk
	i3DYg66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG1a-00000007Qk8-3Yy6;
	Fri, 07 Aug 2026 08:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG1Z-00000007Qjt-1Pvz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XruWKhhR9RXxWQQGZb6YjloEQ5TMXEFiyTpXrOgv/AQ=; b=DFRmTwNBmBwQecSBA6xvNcb0Wy
	kwHUejIgSJIyuNraLG56+c1wXcoyumhLSn1Wub4jHz/3ESQqmlemUzoF7LAnV8CznJX7+eMkHB2yG
	rc3mWwHQShC3qadI+CxITnRnvIw2jF6rGOXkzI1/ZG8ctM3E5Wy6FypObBgT8dj/cGbPJYUqLmMe3
	0TcKAEj1Wtf5IcVJn+grU3LlR2/e2xfnpPue1D9szmCasrlKf6ceCkZpQCRIiRXGNWEEq6dOb23XZ
	2j4p6yCDE3s+AGm5WHZ99MGKfPtDWLVkmiPVbdCrqi5szjUakUzTRZhEeJeHXfvJTbl6R020neEym
	hihM3I5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG1V-0000000CCa7-2suU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:33:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20FF51476;
	Fri,  7 Aug 2026 01:33:42 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 298AF3F9A2;
	Fri,  7 Aug 2026 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786091626; bh=auV6kohfbzLvIADElReecvuYPKWgdpSR4ygLd8wb8BU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNr8JV7yzFKc7es6IpgQe0KGGB17SBUezerXdF5hG8KFNmSjg664X5nXXVB3JC/3f
	 5i53Nubvoekzi54xE+YrDh48x+ZTtplMss2IEMPC61gBamr/vlTlH3Tq4ne5PMWyE/
	 nIUlmlr2IAVU6xhDlGzsVY+S8JbAHk4kQKyWwAMI=
Message-ID: <e5141ba4-aa1c-4714-b74c-f10f242bb82e@arm.com>
Date: Fri, 7 Aug 2026 09:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, kernel-team@android.com, mark.rutland@arm.com,
 maz@kernel.org, ruanjinjie@huawei.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <178602166709.420813.3290777524014442521.b4-ty@kernel.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <178602166709.420813.3290777524014442521.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093350_017957_90D239B2 
X-CRM114-Status: GOOD (  11.47  )
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

On 8/6/26 18:11, Will Deacon wrote:
> On Mon, 27 Jul 2026 17:34:08 +0100, Vladimir Murzin wrote:
>> FEAT_NMI provides an architected mechanism for supporting non-maskable
>> interrupts (NMIs) and less-masked interrupts (LMIs).
>>
>> Since we already support pseudo-NMIs via priority masking, introducing
>> another flavour of NMI on top of the existing infrastructure could
>> easily become messy, making the code harder to follow and reason
>> about.
>>
>> [...]
> Applied first seven to arm64 (for-next/nmi), thanks!
> 
> [01/45] arm64: ptrace: Remove INIT_PSTATE_EL2
>         https://git.kernel.org/arm64/c/b7f741717d1e
> [02/45] arm64: debug: don't mask DAIF for mdscr_write()
>         https://git.kernel.org/arm64/c/7cf2d6efb86f
> [03/45] arm64: hibernate: mask DAIF before restoring hibernated kernel
>         https://git.kernel.org/arm64/c/684bde100117
> [04/45] arm64: hibernate: Restore DAIF state on error
>         https://git.kernel.org/arm64/c/541549827889
> [05/45] arm64: suspend: rely on daif helpers to handle PMR
>         https://git.kernel.org/arm64/c/630ca6c58fcf
> [06/45] arm64: suspend: Initialize PMR on resume
>         https://git.kernel.org/arm64/c/d3ebdc1772c0
> [07/45] arm64: entry: mask DAIF before returning from C EL1 handlers
>         https://git.kernel.org/arm64/c/0d774e0517f3
> 
> It's a bit of a drop in the ocean, but they seem like sensible
> improvements to me and there's no point in you carrying them out of
> tree.
> 

Thanks a lot!

Vladimir

> Cheers,
> -- Will https://fixes.arm64.dev https://next.arm64.dev https://will.arm64.dev
> 


