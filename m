Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718F6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7qg/6GxjFXWiC5kQXeaivvG2EH2dCIS/N7d/lBrQ9Q=; b=sTfuvo5qKJ6G5EgWLzUOPLWLAx
	v3o5xdco+Wmzs0n0l69FTeO1UgU7MCNv35pLSmEQ0rkZB/hvU11mVmPL5X313Wt6rXXHF3FSPDmZ9
	qMBrGX3y5XxYnxEzVC7avIA/5fiBx/eGVGpuY0LbC3NtBrQYT2G12e6Pd9FoHcp+CYU2h6a2WJj6J
	qWK2eAxayKfktSRKVoae8/T/nFi7Q85kG4kjjdIoSublB5zWXOaBBT4KLZTdMll+82hMa9t/tmQ8u
	UTgByxOmtYZaVcnz82m6KwDWDomhTIpAtLC8RMX5r7FKgDalyBMZUQiY+b8hUzpzbz4vQd/b6msSP
	osGYMifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEryg-0000000CrBk-0VKA;
	Tue, 13 May 2025 15:55:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErss-0000000CqKq-1y2A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:49:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so43045985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151373; x=1747756173; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l7qg/6GxjFXWiC5kQXeaivvG2EH2dCIS/N7d/lBrQ9Q=;
        b=N0446Ob/gUjMFYDFJ3Y0GgJW7HbDrNW8DtprY7z9pDCkeEJl+6F31z/QNy2ovqC8BP
         Y9WSyq4yCWF6b/UlDreH/1l+Lthb7C4qHOdFRZfS9Z0vlcE3kVCdnfybhpFsD5kyK7ta
         g3Sa4dchZVmaSrJ+MMgH8uGJg/IJovO51DcRI+jHHHF0iLFGHUuf1Kc+ZqjYg69kQM2l
         DVHtl3bvNjDQsIsGhPPxbVrCcLL5Ighn+HVznbvIzVspbv/5WpO+BTrFXhdH6LCnTEVx
         4fwnSUmYoVyOuit3HG7+jozYHWZsTjftznn4u/f/7x4bk+GfJ3Tz0BuinPeJdxxm1SCu
         +6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151373; x=1747756173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7qg/6GxjFXWiC5kQXeaivvG2EH2dCIS/N7d/lBrQ9Q=;
        b=DMiitDzqCKrnZQpWaVB7u2SakuyzjXtBcSr1CLPzaASiUqdDEJwliXwfj37WUxeH2c
         1fspyT4a2dZcVsyoSWnfsRszNh+wo4JNTAgk6fAqfviZY4GktiQhmTpjgZTMjzGss8oV
         vQxJisGx2Gk2Mv7N6l46J46fkvw02lVc0FxDbxIKAfY9TzUOwW/PR5yN8Q5xLyMfz+Uj
         YrCkAzNfQ/N7wFP8oWGFhYHY9rpX3ZpiiUTe4IsSvfLo0xVs7jMtRe64ZT3SPDuCwC48
         aYWSsuKwlaBD/mBC2ppRgGv21/oToK8lKnXSUNvfBpDQM3L7ehHAS7GPwv5vg9v/xJOh
         L9aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx0wtQQmaB+oE8PSyFdhY628p3XkC3Lbt0SgxqE61B10phjEwB7RC30HFy5Usp7QgNHH6UZ4vWdxs9LytWOJSf@lists.infradead.org
X-Gm-Message-State: AOJu0YyxBurM6XSyPGbemUy1gHDf7okjxoK817Py35Cpo6patmTnXjVk
	1Z3+4vwepB4Ksw/LBsSDTgzk2jvRKcybtA/e19UfGQgO4fo0GRqcuVC/lr3BtE4=
X-Gm-Gg: ASbGncvBhzdQg3ebh4htPCqQ//MrSV4HW+cjw7FBqSx7MOED84j0Hy/E9hwk1XbT9K1
	a7weDCHpBToNj8cl8al8CIuPm8SnKYLvNMs0UAGhBYyEWCIVlkYkea3cj/FTYbAp3dFaanfynTP
	CrqGpq5KsIK4W0w+q1jKuMhoAk3FWWOoiMwjf3wVdIHUQrbgYiMk7dorr62vMfAka7mPY9U7Ede
	Trl6dl6XKUCT/k42b6j0vZxMpbcBZUNSE2+f86EYFsWuk3d4Z6m1N95CrJuCctnGua0cEObvLQg
	hWEdX5qpthfIr/UnEQ4kebDmDPgYDPU1s+b8+2gyrZ93uG4krmmtR7bXEX9mbwE0mWMtJUGZAhG
	G6N9k1Sj92U7wXg==
X-Google-Smtp-Source: AGHT+IGOxH+5gWmbyyxxmGOMrk+23j8sz87XVh50Wr2hHSe2CGZP4m+YqUI33m8XElSElt+cCQlIDA==
X-Received: by 2002:a05:600c:1c8f:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-442d6d11a67mr146232535e9.4.1747151372773;
        Tue, 13 May 2025 08:49:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85bb20sm22789305e9.0.2025.05.13.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:49:32 -0700 (PDT)
Date: Tue, 13 May 2025 17:49:30 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Message-ID: <aCNqCrBqGSxRGMKd@mai.linaro.org>
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_084934_512642_E9AD9E36 
X-CRM114-Status: GOOD (  15.23  )
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

On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Changes in v3:
> - Added Rob's review tag (thanks Rob)
> - Rebased on top of next-20250506 to pull in MAINTAINERS updates
> - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com
> 
> Changes in v2:
> - split out this binding change from the big series affecting multiple
>   subsystems unnecessarily (thanks Rob)
> - added description for the four possible interrupts (thanks Rob)
> - added overall description of the IC block
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
> ---

The patch does not apply.

--- MAINTAINERS
+++ MAINTAINERS
@@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml

        ^^^^^^ those bindings are not in my tree

+F:     Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:     arch/arm/boot/dts/vt8500/
 F:     arch/arm/mach-vt8500/
 F:     drivers/clocksource/timer-vt8500.c


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

