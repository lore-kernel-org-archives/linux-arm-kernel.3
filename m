Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOlmSYJ3Bodigk0NBMpwVog9MXgccJpLT4T6HuafC3M=; b=zkD/Glx+ZTBehs
	NQw6L+fel9VSOOL/c6Bu2ceVUWeG8vdXojC/WjGs4VY8KyaAdMZ/HDCuaGFM9xuT/ktgKYjbO1prH
	Or7e4yn67SzyUyvB7Zg9UaLpVk/Fu/SQf0+g9xGpMl2LqlTwoEpcuy8xlyYe60MLrzMGJGZT7HbsA
	sEVpN2lwZ2lPL0VnbnaptwUANtGhfosaEaYkCO6wxGyve8AicIEZJtGpSuUORUFKmJmLh0gAWZ2/N
	E9F6SV2wyHBKzt9q+6B+DVFQYEv2pKMwlMHI+fwq6B3xGod7MaIu5la7HeZjg8V3A5rohDVDy74b5
	yi/V1gSlGPeu2GhjNxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZiK-0000000BUJv-1rCT;
	Tue, 14 Jul 2026 09:46:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZiI-0000000BUJR-1mQD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:46:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84133497;
	Tue, 14 Jul 2026 02:45:59 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551EF3F93E;
	Tue, 14 Jul 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784022363; bh=AgAKhlhHGuretJsVXafbh6VgjP93LaJWk0WDL63crtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hTBLkju5IIZNSBZTdII7g2apKM4JZ8aXGioFmvYtQ/OxVLV9QiFQKBGqZEheNHAim
	 FcRV7fzhyGVmAvb28c5CrsmXKuEMkk9SQtcAlyGiWEk8B6yf2p+qyKg4tTMLyIuzOD
	 THqlc7QVY89LDKCaNpA8oGk9nkNIn44I/A1xmRbU=
Message-ID: <8f365d6e-ec4f-499a-8fa7-9b4717d786fc@arm.com>
Date: Tue, 14 Jul 2026 10:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/36] arm64: irq: introduce a helper for GIC priority
 initialization
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-7-vladimir.murzin@arm.com>
 <62c8be8d-224f-4db9-a91d-09f45ebe048e@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <62c8be8d-224f-4db9-a91d-09f45ebe048e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_024606_575719_BFD5DA1C 
X-CRM114-Status: UNSURE (   7.29  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 05:16, Jinjie Ruan wrote:
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
>> interrupt masking via DAIF and switch to masking via PMR.  This
>> depends on a very specific behaviour of `local_daif_restore()` which
>> will clear DAIF if masking interrupts via PMR, which will get removed
>> in the future.
>>
>> As `setup_arch()` cleared DA only earlier, introduce a dedicated
> Did you mean local_daif_restore(DAIF_PROCCTX_NOIRQ) in setup_arch()?

Yes, I can update commit message if it makes it clear.

Cheers
Vladimir

