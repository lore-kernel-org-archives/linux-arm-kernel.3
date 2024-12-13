Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BDCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRExllKY+4DGs0s+ZiFvrFQk9Bb6GpDeZ36Y1/rPLyI=; b=AsS3JWMQrUPMYe8+mIlyDDNi9W
	CrI4+lEOpcBZDEjQaAVzwcGkuoFYrhYmDhzSvCa8fokb9n1YID9hYTPzurGy/Is90eDiNjDtbPwJy
	t1402M2vusFqNecfXUY/cQhiUM1R+IOg4+TAqs/jp3hGufksNEogOtpCPjCDrWoMpFDStuLS6uREn
	UWlsrOVsOe6TfHFmF75xo41VateZZmHo2yLcE57LXsTQtEt0fsQU0RvM+gb6jKDcOT/uCVYUZS/93
	TUbklWEXMZkCi6N1whySNKkPQ6+m3vVSwq6QEKNEnIDvx+v+o7/gq0x2r2CktqNqlAm6GNXrdJ4vm
	dSgJTfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1ng-00000003DXZ-3vjO;
	Fri, 13 Dec 2024 09:17:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1la-00000003D7v-2Kma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BD51595;
	Fri, 13 Dec 2024 01:15:47 -0800 (PST)
Received: from [10.57.71.4] (unknown [10.57.71.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 515E63F5A1;
	Fri, 13 Dec 2024 01:15:17 -0800 (PST)
Message-ID: <b2b0f73e-ba2b-4402-afa6-4960814ea1fd@arm.com>
Date: Fri, 13 Dec 2024 10:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
To: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Dave.Martin@arm.com, will@kernel.org
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
 <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
 <Z1sY9tIsAZ84W93-@arm.com>
 <a70cd007-a2c8-477f-972e-fa1e9c362604@sirena.org.uk>
 <Z1siulo_PKdI3xC_@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z1siulo_PKdI3xC_@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011522_655776_3B93468A 
X-CRM114-Status: GOOD (  12.52  )
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

On 12/12/2024 18:51, Catalin Marinas wrote:
> On Thu, Dec 12, 2024 at 05:26:47PM +0000, Mark Brown wrote:
>> On Thu, Dec 12, 2024 at 05:10:14PM +0000, Catalin Marinas wrote:
>>> On Thu, Dec 12, 2024 at 04:47:46PM +0000, Mark Brown wrote:
>>>>> Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")
>>>> Presumably we also need a Fixes for whatever introduced the above copy.
>>> Hmm, it was like this from the beginning. If we are to do a cc stable to
>>> the oldest maintained LTS, I'd rather have a separate patch for
>>> copy_siginfo_to_user(), it doesn't make much sense to backport a GCS
>>> patch to early kernels.
>> Hrm, good point about it triggering backports.  I'm not sure it's worth
>> doing that TBH.
> I had the same thoughts. I think this was mostly triggered by the
> POR_EL0 changes when Will raised the point that the kernel might return
> with a more privileged value in this sysreg.

I don't think backporting would be worth it either, referencing the
original commit implementing signal support felt like overkill. The
copy_siginfo_to_user() issue is such a corner case that I doubt anyone
ever ran into it.

- Kevin

