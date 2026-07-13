Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTNZ4Yz6qyYKQTPFl4heAVyvFBX3BT4uZMkE2VVSeNE=; b=xtLDHwT4Rn/FFYGVmhA1dVGdIP
	j5gLXf1Q6G3qzRAjgkEW2SA5kfOc3+zrjJoZQ0gjEYBwB/ZPQJojd0VYvFmiur7yKQAdi0IVf1tpt
	igwnpYkd/l6HLkxJweoIaALo2sRcD+bWDk04o7j/1T6rNXY5yo6haRlG1htt7NYF4O+Mkx3+ogO0t
	+FcO0Li79fYVNqb1Sb+bRJN5fojjqdTp+iuBg4ZYUk0IGo4gljlSMIGhniikTM4ENMNgGlYoAduXz
	W4Yom+iJL4sYK38ssae/zUyruG69bOfd+IE7vWXv/J72gbVr1K8bo+0P0sIeqDOEoHVQDN2s3WCPw
	qb/V7rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBEz-00000008Sl1-2M19;
	Mon, 13 Jul 2026 07:38:13 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBEv-00000008Sj6-1gb7;
	Mon, 13 Jul 2026 07:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1783928275; x=1784533075; i=wahrenst@gmx.net;
	bh=BTNZ4Yz6qyYKQTPFl4heAVyvFBX3BT4uZMkE2VVSeNE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QqYt/YQ1L3hRFuHmIjzx48mUpngv/z5ygNvKyWxzx00tEhExI3k0nCNr0UsvsxmS
	 5yceyDe3YHWOBAia6tRp0yEqpb0xwL9TtNGY46198ZKRgvwyhgxjiDYRTDlWvHc/t
	 h3u3xLRwT47MkRwUbKTKIsQg5M3LPM2MkftJel1SlKTifcMgOWNHNPivGOLRd93Bp
	 yQSqEz3McztTSXTP/M+bfrYxecS2BHzyQFOVV93dmO4wo9961LDSFDn18OWoIJPLS
	 /7Swt2+fClgcgrlq2FhQeph7E/EfkhxYlwqbRkLFKuRsYNQYksACSO5QSWPzm4vsS
	 e2LxfAzs3b5qUJ/IKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QS2-1welNr26CW-00D06m; Mon, 13
 Jul 2026 09:37:55 +0200
Message-ID: <9ba00fc7-7211-4831-8fcb-c4f2d83beed6@gmx.net>
Date: Mon, 13 Jul 2026 09:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Raspberry Pi 5 (BCM2712) hangs at boot since
 d87773de9efe (arm_arch_timer: default to EL2 virtual timer under VHE)
To: Marc Zyngier <maz@kernel.org>, John <therealgraysky@proton.me>,
 kernel-list@raspberrypi.com
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>, Stanimir Varbanov
 <svarbanov@suse.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Gregor Herburger <gregor.herburger@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
References: <oTZ1wsFlcf4l8zMuD8DYCCvff35nVbFn7gTb5_vrUPSJtjVBSTmGti8S3KnbVdVWJEzP1QRbWma6UYYXyi6v2J0fl61khniPROEhsdxMIz8=@proton.me>
 <86h5mcp4em.wl-maz@kernel.org>
 <vUQ4-RaOlZaTlasD0DLGmWOWcVLQXYYK_yid3Tsqeyi53CPsTCpOvXSGZiz0RAyxsxCzWTXOe4zK8rzOLdtDXiVu-xBjp2VkPz9JRj9QUWA=@proton.me>
 <87tsq75kjb.wl-maz@kernel.org>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <87tsq75kjb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:73bU2UfqRXLe2yJlt8b1eSMeiDKjnjrU3fBN/7SreNDez4yGuHy
 l3ETixxxERoxwfGF9Riw5yuy/KEgRdKrQ49BTppKkrDqjbrTEJOLMPLasvec+WwRrEVYC8j
 9zow+3gRyiq6eMaPaPDe9ZH7XkCmtTFlSYYxAtlbnedCz5+7yRouKrRvgU1u/i1kDw3z++J
 mGlGR55WJCecwe+bL4ZZQ==
UI-OutboundReport: notjunk:1;M01:P0:DGHH25hoN98=;eqDt9J1ugPGPZAhTDpZ08HNBkAk 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 KVqRd7uUjKHHY/JVds8KoHk4zQGVtbC0jg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003809_822593_977FA9DD 
X-CRM114-Status: GOOD (  19.16  )
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

[Add Raspberry Pi maintenance]

Am 10.07.26 um 10:14 schrieb Marc Zyngier:
> On Mon, 06 Jul 2026 16:20:13 +0100,
> John <therealgraysky@proton.me> wrote:
>> On Monday, July 6th, 2026 at 10:40 AM, Marc Zyngier <maz@kernel.org> wrote:
>>
>>> On Mon, 06 Jul 2026 15:13:27 +0100,
>>> John <therealgraysky@proton.me> wrote:
>>>> Since commit d87773de9efe ("clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when running VHE"), the Raspberry Pi 5 (BCM2712, arm64) hangs during boot on v7.2-rc1 and later. Reverting that commit on top of v7.2-rc2 boots reliably. Found by bisection.
>>>>
>>>> Environment: - Raspberry Pi 5 Model B, arm64, device-tree boot (no ACPI) - CPUs start at EL2 with VHE - Mainline v7.2-rc1 and v7.2-rc2
>>>>
>>>> Symptom: - Silent hang early in driver probe; no panic or oops. Boot banner shows
>>>>    "arch_timer: cp15 timer running at 54.00MHz (hyp-virt)". The first blocking, timer-backed wait during probe never returns because the EL2 virtual timer's interrupt is not delivered on this SoC, so clockevents are dead. The softlockup/hung-task detectors can't fire either, since they depend on the same dead timer.
>>>>
>>> Is that a guess? Or do you know something we don't? Or worse, is this
>>> report entirely AI generated?
>> Hi Marc - I'm not a programmer, but I can use git. I performed the bisect, and verification steps by hand. I am convinced the bisect is correct based on the restoration of booting.
>>
>> My RPi5B freezes when booting into d87773de9e and reverting it gives a clean boot.
>>
>> I used Opus to analyze the result of the bisect in concert with the logs I captured from the serial console. I also used it to summarize everything into a concise bug report. I can't vouch for the accuracy of the interpretation, but I can confirm the problematic commit and restoration of function.
>>
>>
>>> Again, how do you know it isn't functional? Could it be, for example,
>>> that the firmware has not configured the interrupt correctly?
>> I cannot. In the future, when I use these tools, I will scope the ask to just factual content, rather than allowing them to speculate.
>>
>>> A proposed fix has been posted at [1]. Until we hear from the
>>> implementer about the state of the HW, it is difficult to do anything.
>>>
>>> 	M.
>>>
>>> [1] https://lore.kernel.org/all/878q898ulx.wl-maz@kernel.org/
>> Thank you for linking that! I applied it on top of 7.2-rc2 (with d87773de9efe intact) and got a clean boot.
> FWIW, and in the absence of any feedback from the SoC manufacturer,
> I've posted this patch[2]. There isn't much else I can do for this
> stuff.
>
> 	M.
>
> [2] https://lore.kernel.org/all/20260710080958.491620-1-maz@kernel.org/
>


