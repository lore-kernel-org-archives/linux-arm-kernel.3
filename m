Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E5BC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcZ9xPvGi8ims+c2/a8qp2K7FN14062QE/zaFsTfD44=; b=Ee08Rl1a7OyNvMk3JWwb5Onbvl
	Sy23vfhwxI0bjKzyxY9Yjsai9wdNvPiWB0uf3NdVZp1Z9TiVSLi00LBUVKqaRI/SRV60M+zXcFtq+
	1M9J5/zZHiYEs3pyth9wg8eEP9zs5FSbUyptkRAUZaGKOkTqJiKQMLnW+x86CAAJ0uFI4GslrAkMi
	0aYOWJNShke7IRz0zRe/x2usp+l68YHzVpNS+8rxG/2WetIxZA2MMJUW8kFgxmtuhMHBPUof127cH
	YZJ+3H6FJKa0e5TmtfW2jxyfUhI8I9vcYw+jQGFOJmtE7xtQ4khza5e8yI6SiL8nO3ARkacutHtev
	0rg4SVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZa6-0000000E7X4-1nK0;
	Mon, 24 Feb 2025 14:37:14 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ6N-0000000E1QJ-0UxB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1740405986;
	bh=Rrh8Qdukg1Q9sg3ZBF4IlAc2JjQo/OBav10chUu9xTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jmEONay1YjesVmD43PDrADy6n0HTW47o9x/t2XoS4fWW1zGbhByHn22DUKQK94k3Z
	 grozc7DqlfBRUrY4nfTMcPJSf3onQTZfmkrSDSIXbIlsxOik88OeM8V5q6R97aTP6/
	 KM8Jp221QRGMYKWF5nVYzUD2kswWG7qAIEV5hPtz8YwYVQ8jI+Pg82qwnU8Ijf/dUw
	 I60JUZl/OaHZ+NKK1ms9wy514tv3c0i98UwrRqvUTBzuHCdU1XHpjD/6+VbLokH7ps
	 xeY8zPvO/7qalHjAVzy1xansu1NrGrP7Panrqoikstya4xlmaVbtnUALhozrpefRid
	 Sw80RGdW3Q2iA==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id C9FBB22AA6;
	Mon, 24 Feb 2025 15:06:26 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87B9442007;
	Mon, 24 Feb 2025 15:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1740405985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcZ9xPvGi8ims+c2/a8qp2K7FN14062QE/zaFsTfD44=;
	b=q6yWtIK0uB1F4ZZabwBCXXsjWOOxOlW2t+fe5bRDcn+aEtpmpYzdN9GOra+KUrMNU4m+dj
	G/2r1WlUJ3bnZTWdKLmuOwEva3zTlbKW94+y102nG4cujngUUMe1DeXF2zSFsh3i9vJHF8
	Q7IAOd+GezO7T1OhRYFnPbmPaHHYaYCMPuZUpniC6QmIjbYkC/eugwRz3NVsf6jTcijiJ8
	VCXx9bpSbythjTjNBO7tZ6zLS3CCZ5rqoyX+KXRIZcc5SHmLcNCiKV5aatu7RjoeBMBnH/
	bod68heInTNHMp57SExUN/MBLBAhxDgesmqCoHBiIUoiY9W8z9hEGcq0pONU0Q==
Message-ID: <7f673cea-8d85-404a-b380-4282c0e3c0ad@juszkiewicz.com.pl>
Date: Mon, 24 Feb 2025 15:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
To: Peter Chen <peter.chen@cixtech.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fugang Duan <fugang.duan@cixtech.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "will@kernel.org" <will@kernel.org>
References: <20250220084020.628704-7-peter.chen@cixtech.com>
 <068655e7-2ad7-4497-aca7-4100ad478d99@juszkiewicz.com.pl>
 <Z7xZwGTIKgj9_zNZ@nchen-desktop>
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Content-Language: pl-PL, en-GB
In-Reply-To: <Z7xZwGTIKgj9_zNZ@nchen-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060631_319498_81AB373E 
X-CRM114-Status: UNSURE (   9.50  )
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

W dniu 24.02.2025 o 12:36, Peter Chen pisze:
> On 25-02-23 04:05:10, Marcin Juszkiewicz wrote:
>>
>>> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
>>> new file mode 100644
>>> index 000000000000..d98735f782e0
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
>>> @@ -0,0 +1,264 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright 2025 Cix Technology Group Co., Ltd.
>>> + *
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>
>> [..]
>>
>>> +     arch_timer: timer {
>>> +             compatible = "arm,armv8-timer";
>>> +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>>> +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>>> +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>> +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>> +             clock-frequency = <1000000000>;
>>> +             interrupt-parent = <&gic>;
>>> +             arm,no-tick-in-suspend;
>>> +     };
>>
>> This is not Arm v8.0 SoC so where is non-secure EL2 virtual timer?
> 
> It is the Arm v9 SoC and back compatible with Arm v8.

Arm SoC has several timer interrupts:

PPI 10: Non-secure EL2 physical timer interrupt
PPI 11: Virtual timer interrupt
PPI 12: Non-secure EL2 virtual timer
PPI 13: Secure physical timer interrupt
PPI 14: Non-secure physical timer interrupt

You mention 10, 11, 13, 14 only like your SoC would be plain old Arm 
v8.0 one (Cortex-A53/A72).

Sky1 (CP/CA/CS8180) is Arm v9 so should also list PPI 12 which came with 
VHE (Virtualization host extensions) which is mandatory for each Arm cpu 
v8.1 or above (and is implemented in A520/A720 cores).

