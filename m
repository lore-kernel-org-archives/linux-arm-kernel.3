Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C8CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=; b=qlCa3ZgRrnMUauRLCL0BsJp4LF
	AZf9NBGtmhQ7lYzqRMhbIRkhdOaUR9Olj+MJhc5s4ZlCDu8ety8mTgm/sfy4gKapQYUDeae1Ahny8
	zkHc3JWoR/Okv1WATFxouVesG3e73wKP3mhsFWgWvL74l6iJC0lrlgagZHv8c8aQmW0GHBD32tLrp
	Wiy6aHhZg0xHoOpOjOKJVCFVIDGIOco7HRDTgMkmdVuDyiT8lcWU+cg6cRzRFzWuE0hcn82EPfk+2
	caTRzwTVQqtcCadnw4dbnEL2/cx/VjjqVLvGLh+3j+2FoBtdpjMZoyO3haNgahXCJxChtA6uFIsWR
	8diqnmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnNM-00000001RP8-2ZJh;
	Mon, 06 Jan 2025 13:42:36 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnMA-00000001R9W-1PEH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 13:41:23 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3eb7ecc3c54so7260806b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 05:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736170881; x=1736775681; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=;
        b=QM027lZCN/aWy3ltuffSV50rgqrBxWEHk9XCy8Wv+t44HMTfVYDsk8VtvtTFAl/wmH
         lVWthLeFaFQNFxtQWACIHXtVkFn+6FsSS3rmTAi90NrYiFYZASSTEShokGPfwI8SSZry
         v5ekL7Wwj5cOQRRpmp4uWGCI80Q+E1h6CWTeqzmFKsDw9PYwCT6E3ea9U7fsU678l3MI
         fCrTdo6D6B/nrCc+L2EfCEDH/TetIIlzw0Weoc0SDXdAFo2RqzqURqelk1hH8IkDSN+Q
         YGlN8hnyr0op8zTjKzMx7IMFgDnnHFQ/SdlRn8zGG57CxilEUTW171foK1t43Cl53C5q
         B9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170881; x=1736775681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnrymAa/mjGJwijHsxfBgXeucmKCT/GD6DSYdMDGmO4=;
        b=KcVQMa0IBQaZOHOUW1utyupuHZ+jJDw9zaLbnIPRhwJb+VDHBd8Z7GosY9MurvsO5z
         Zzvl3EQmOfY3Bwhq/3ZlqVcBm02vXiypin6Qh5tTaasPNeZsGfZhhpDSB91N5YluRaZ7
         KQpJyfdLqT9u+QzJ61FJaiCEOYBH+ULLl6goiwC2EwX3gQOvCjeHSvG4dhVi++97kIHc
         u2A27n3Ge16uq6AdNUP02UnK1/Lo9+vX6WjcYWReo5ptq7KDZ43DCh2DEIcsc8KnByXa
         mQKv3yxrR+EWiZ636iepxNTpfOpG8Uv72isJ7GPqqx3ZxfDBYruk4K1ywAikJ+/aGdEM
         Oxnw==
X-Forwarded-Encrypted: i=1; AJvYcCWtsbjYPv+raPHR2OkyweafaomWQozM+ti3i9xcrN0JaaGSEYpn4uoStWm3eRAVL8PEv41w2ErZvCPeazb7Dp+x@lists.infradead.org
X-Gm-Message-State: AOJu0YxKEGR9VfJ61GWZK5R7Vv0hKIgKDVaCAiCuTjfFlNet0DWjR7pX
	rblk6BJ8ejb78bgt/QRVxVaAmZx79AJZHg7lHh43wIp9BHMCDx27lpFN/5WFVlJV4lmZzqr3V8S
	Obp7AxfrtWVIi71swtLiSbkBnUnmeqnJMswFcUA==
X-Gm-Gg: ASbGncsJNyX5A4vof9GPXp7o44QEW9zNXAzr7ehis0JescklaTYkXqyim8LUhp6QCUs
	qBQf7F5H0MQA+Fo47vbvJd9jBQgDfklcAwcS0EPk=
X-Google-Smtp-Source: AGHT+IGHKiwrocjYAkZ/iOzeatUlUn2r26VhWPamSSinhyvoES0t4wnDgtP29xdNAxPt8Q+yAhE3L15ITeBiE/jrEBs=
X-Received: by 2002:a05:6808:3012:b0:3eb:5f1a:d083 with SMTP id
 5614622812f47-3ed88fe34f0mr33261669b6e.20.1736170880716; Mon, 06 Jan 2025
 05:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org> <CADrjBPre_zjh+i=_YKYiptiMWT74eWC6LDCveA=dJaQQVwkS0g@mail.gmail.com>
 <ce9408aa-96a4-498d-8603-01534d9632a2@kernel.org>
In-Reply-To: <ce9408aa-96a4-498d-8603-01534d9632a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 6 Jan 2025 13:41:09 +0000
Message-ID: <CADrjBPoLhc9Fy1FYr4w33n7bJH0XkddAyQL8zgHhj+7ONngu5Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_054122_374310_B37A0567 
X-CRM114-Status: GOOD (  32.13  )
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

Hi Krzysztof,

Thanks for your feedback!

On Fri, 3 Jan 2025 at 17:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/12/2024 10:10, Peter Griffin wrote:
> >
> >>
> >> Maybe you have here two devices, maybe only one. If it is only one, then
> >> it is not a syscon anymore, IMO.
> >
> > I was going to suggest modelling PMU_INTR_GEN as its own sycon node,
> > and then either: -
> >
> > 1) Updating exynos-pmu driver to additionally take a phandle to
> > pmu-intr-gen syscon, and register the hotplug callbacks.
> >
> > or
> >
> > 2) Create a new driver named something like exynos-pm or exynos-cpupm
> > which obtains the PMU regmap and also a phandle to PMU_INTR_GEN
> > syscon, and register the call backs.
> >
> > Is there any preference from your side over approach 1 or 2, or maybe
> > something else entirely?
>
> No preference, choose whatever results in simpler or more readable code.
>
> Option 1 assumes that exynos-pmu on GS101 will drop the "syscon"
> compatible, although it still might expose syscon through drivers. Just
> the standard binding syscon does not feel fit here.

I agree we should drop syscon compatible for gs101 as it requires a
"special" regmap. However other Exynos based SoCs will likely want to
re-use this pmu_intr_gen CPU pm code and they will likely have syscon
compatible in their exynos-pmu node (as protecting PMU registers from
Linux AFAIK was a Google hardening measure).

So just to clarify, dropping syscon compatible on option 1 is because
it's gs101 "special" regmap, or because exynos-pmu node now references
additional pmu_intr_gen syscon?

>
> I don't have the hardware/user manual, so I don't know what PMU_INTR_GEN
> really is.

There isn't much description in the manual, but AIUI pmu_intr_gen is
just a way for the OS to trigger an interrupt so that the APM programs
the PMU registers instead of the OS programming PMU registers
directly. It looks like the system could also be configured to not use
APM (it would need different firmware), in which case the OS would
just program PMU registers directly.

I only see these GRP(x)_INTR_BID_ENABLE / GRP(x)_INTR_BID_CLEAR
registers mentioned in downstream code in the context of
flexpmu_cal_system_gs101.h (which is basically lists of registers to
program for different power/sleep modes - which looks like what
exynos-pmu is currently doing for older chipsets) and
flexpmu_cal_cpu_gs101.h (which is used for cpu on/off) related things.

So even if I split the CPU pm parts into a separate driver, it looks
like programming pmu-intr-gen regs would still be required to
enter/exit sleep modes.

With that in mind I think it seems more natural to grow the exynos-pmu
node & driver.

> GS downstream code has something like PMUCAL, which looks
> like separate device.

PMUCAL is just the PMU registers with a whole bunch of layering. I
believe CAL just stands for Cpu Abstraction Layer and seems to be used
in downstream Samsung driver code when they have a bunch of "generic"
driver code and then what appears to be a lot of automatically
generated header files for a particular SoC for reading/writing all
the SFRs.

The CAL suffix is used for PMU and also for clocks (CMU). Most of the
PMUCAL code is just accessing PMU and pmu-intr-gen registers (if APM
is configured). There are some places like flexpmu_cal_system_gs101.h
where it seems to be used as a convenient place to read/write
registers all over the SoC memory map (CMU, SYSREG* etc). So unpicking
that into all the various subsystems will be interesting.

Thanks,

Peter

