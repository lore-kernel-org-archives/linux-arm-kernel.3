Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52201CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuDHMylOaR8g/JvAKh/yVTJ3Yy9MU0h2/4AVh9Q0YsE=; b=zANsf08ZOwAVIQimT5FF1DClJV
	5IqO0JbZ5I/Ah8p0Fn+ZkcvhKo1sfqYmW0nJ1x8KhYoSe42MiWGslHhSVpBQ0ihel1jHHqHB5ESva
	vDzjJknZsYAqR8gkQ5Lh429SqOn1HyOX4WQsMDBbbflMc/Y0gCVzUKDnyhw4sv5Lyi6yqcd8MNn3X
	PPigm9i8vznHgFJwi6HjIV17FxIRmczo3WAVlqvs6TOshc1h99ByqVGliYVMSLPczDFSYll6Hld3V
	ggVxgggw6B2Pe2G4JwYv3buOw8jWFDofUsy0QXyKgm7Onzl5sV5MbijYmygTxZFYkOi11u/yrBVcL
	FLS4GI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVcC-0000000BeEB-2pJV;
	Mon, 24 Nov 2025 12:24:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVcA-0000000BeDi-1QAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 12:24:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so40639385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763987056; x=1764591856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuDHMylOaR8g/JvAKh/yVTJ3Yy9MU0h2/4AVh9Q0YsE=;
        b=k9nvrvTK/WTl4yEGhn1VZBfB7EdofQI5niVVi5mrFeqtBGXuPP9h/TQaAbFcxTo8Gl
         2ScxfGgerWmBsCLwoSca+5Yv8ZGh0J7eycyzUBWOtyqhtr0CjSvWwdECEF7XI1sI+qaG
         m7XmJiFtzidTDds8KSURTicZQ6BKE7UuoCJARAtOAtnNNa0m60C8dTax7lQI/aunm3W1
         tpECul+X3+V5Mh7eDO7698igCsg0C7c6dsCfz2ve+xp6fOgcpTsfTP16Jv+CR9ma0P2p
         Brw49iarzi8tLcnnwrnuzWq9O3YGBJoSRjXGSj8JZCA3Q+/jN69GxCc1vGTqwAMVfno+
         CPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987056; x=1764591856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuDHMylOaR8g/JvAKh/yVTJ3Yy9MU0h2/4AVh9Q0YsE=;
        b=SBAKeA+C7lhIOrsJx5c0PYPk+9UwYhOZhcaTiwAV3LHgGSwWZPIz7JjbUL9ElSatCD
         NkrsBL4xmseb2vCVN+EGTAAkSn/e5qKCcPrRSXF2VprydLOPxRmvApRmeW3eyfD0j3Fw
         xH/AWI0P+QPZB/CPi3eWnQpfDKUz5WbFduJwmJnS9DIlhcXVsPvCYt9TI/+JpdjirP8+
         XLftoISwl9/d+cOCh+P78VWVSDfid+jK51R8x4kJ0ExzTGyJthZquY4ktrukP5ttDPT0
         1kk5GcfkL1pSjVys3Aau0LIGoy4OiMfzEed/1cFS4EutFh1BPBnUl0UICKsiXIGZlMYf
         LUNA==
X-Forwarded-Encrypted: i=1; AJvYcCVTAALduKhRLHILNoidS85T27/bA6Rr6pEWHMQ3uwlwnhWm7d2WVKWONMzedDRiOeiTfZ2vE9K7LgEOLuvof9HV@lists.infradead.org
X-Gm-Message-State: AOJu0YxyM48TNGvcFHi4Czzqg/KREB82tRVDDOr0miL0H1VmKDzy3HtI
	V/jnD6cazIWn24gV0wPPLrtsrggVwn2WKY9PTJJ2/QZvMXua+siYk1j70K37icxEq0w=
X-Gm-Gg: ASbGncskVCzfPSUiNdWmkF8kB0y+fBeajpJRQDJtPcRI7u4rqN3XrRann5LWu1xgwjQ
	asRwqli29to/UjHqau8465t+2ah3UdEly+5MdBm/QD+QwgV0SEOvCKOQTa7bFAej7cTr9J3QHPF
	BYFOvvseXQOgmZUYVh79AO61kwxtVA35Xx+hcSGeccFeVhtM8eAycFn580LULSd273JgWBGeIoP
	Aynhp/uTAT6EbS21F3XDmk5Ztlf9TwlTTW9srvof2LV4ggjBq357A5fGSWOTkiK7dzrGHcxOSWL
	Ihp+Lf8dUC44K5o1xJv/ZF/bZfkkEahmFYfJc8ShgRETW0zS9Izd3dlW0zw7w0SC8jO0lMXKRa6
	MIb23a9gDdXRVS8PT+fFvzM3BFnnkGVz03Zc9FaWcFyEVH/2PUIKk3KeI+OyWNWezFCGQy6p/5D
	MG1bcOZHj2Wpxy6urR
X-Google-Smtp-Source: AGHT+IG2uTxmSnqi9HaFJ7zlbUKITzVAUKbFdsMO7ekXsieDrVZoHZ7vGzCkFpr4leaIfxrvJJzZUQ==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr173574695e9.24.1763987056305;
        Mon, 24 Nov 2025 04:24:16 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1f365fsm195163025e9.8.2025.11.24.04.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 04:24:15 -0800 (PST)
Message-ID: <1baaae91-f712-4965-9105-4358a59ff1d1@linaro.org>
Date: Mon, 24 Nov 2025 14:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Daniel Lezcano' <daniel.lezcano@linaro.org>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, jyescas@google.com
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
 <12346382-7718-4942-a497-4de278b1d5a0@linaro.org>
 <000b01dc5d37$3f6f5e80$be4e1b80$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <000b01dc5d37$3f6f5e80$be4e1b80$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_042418_446672_4BF904EB 
X-CRM114-Status: GOOD (  14.66  )
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

Hi, Shin Son,

On 11/24/25 1:41 PM, 손신 wrote:
>> Shin, a bit unrelated with the patch, but I wanted to let you know that I
>> started looking at the GS101 TMU. I assume it's very similar with the TMU
>> on exynosautov920. Do you know if they share the same IP version?

I guess you omitted this question.

>>
>> I noticed GS101 uses ACPM calls to communicate with the TMU. Why did you
>> choose to not use ACPM for exynosautov920 TMU?

cut

> Regarding ACPM, I did not introduce it earlier because I was trying to align the implementation with the existing framework.
> However, if we move toward a separate driver, I will reconsider whether ACPM integration makes sense there.
> Would it be possible to get your feedback again when I prepare the next revision of the driver?

Yes, I'll try to review it. Add me to cc please.

> 
> Plus, the GS101 TMU driver isn't upstream yet, right?

It isn't. I started getting familiar with it, and will try to upstream it.
Given exynosautov9 and gs101 already share lots of IPs, I assume TMU is similar.
I will likely follow the ACPM route because that's what the downstream code does.

> Could you share where I can find the example code you mentioned? Thank you in advance.

Are you referring to the GS101 TMU driver code? Here it is:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/thermal/samsung/gs_tmu_v2.c

DT at:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/arch/arm64/boot/dts/google/gs101.dtsi#1453

Is the downstream exynosautov9 code publicly available? Can you provide some links?

Thanks!
ta

