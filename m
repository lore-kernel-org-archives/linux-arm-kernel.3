Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D340CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=; b=Hg9k9NifkYatKgBu/rhPGgvOhz
	wIO6dRhHjD6+jdw1MZhnrHFZxzEAhyclHZZyRGOBC1lkVR5t0epdcaaiFQ96Z9voIShEr1cDPnTlc
	IwgbH0B/2s9VlinM/tIxyDEI7SMdhiT/K3H5hO66bpn6jPeg4mbNIskNFo+/+vrOxEvK36+T7uG5h
	iZMY9oDA5G6Ci1dTr5BxFYLR3k8AUt8qLTM6QeN65tCBIZMeagWYLW8/zyaVh4wF4PZxVrsMfpS8Z
	FDoZ5Wo1Gh02F+bA7yVZ5KkJ2bCk7AVuuRhjL5abhe+vFSKoKt+P+WbcJrCBxbfRioidb5W5WHKLL
	BWpI47Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrZs-0000000BjPF-3aNm;
	Tue, 26 Aug 2025 11:11:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqSL-0000000BWqQ-2XUy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:59:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso27723475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202348; x=1756807148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=H4OIkVN3PtlZcVlB4HbXFFHq1Hdaqg4SSKTki4O37dQeyq27nHFEoYWGHMxAIPSStW
         IaRtQRXNedZeN949wO79HTD4xl6aHzCQmn5RYIF3oO4HiqBbjSHOJC8QPQCt8MLuLh0d
         oHgKToRJljwaQubgbJslsGj9gkC5PNO3chwh8ZH7Goe9Dc5Lq/TwaxQYfhWbcgsMLgJA
         ffFxNaH3UotdedhZL+gKgm+WqgzE2CFnAj8S5PtoFM/X70LtzwzQHDKtZLbMgZ/1uaaI
         D1M62jfp8eI4ZiU69BA35u2tdP8HbxJmsBUnX+4gB87bDFWptIW67raJzhGJAjk/gns2
         M47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202348; x=1756807148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=LMYmFw23Kt+Li1O0VuqiLfn/bg7Ibt1aPxvPfbvj09IlQKpi4JW8ivItEauqNw6xTo
         Hp/RfD5S/V69xXREdKG1/y0+8x2lPE8T4uZytx54bD1+z5tUX4msWLiqm/fDJZcdNt5x
         ecx8rn+bmEFhqKTu7J2Vgzq/88sDcKb2ye6r/M7/DADMTAgyLPRJ9xVs8yD02u9iNms3
         MWsoFi5gy1vApFc/T+y8CVKpHJfs58ze+8u7hJNtEPS2nacUnLF7xlWGNbXvvbsgEUat
         BTktfh+9JEOsLK80lOjsqsKBVAZzYx4dz4p8BSDDl4QfXj1sJpbhmc3QP046TaBFi8MO
         cfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5+6plGtSCyO9rYb285jR6bephk/GziX1hXlcaC2AvEhKEHfMlW4mZF3QHVii9n0xoTtYKBOmqb8wbOjI85ESd@lists.infradead.org
X-Gm-Message-State: AOJu0YysxaKhRGfae9N0JxhBk6Eh26maD7i2uvN1SERsTO3u6+UjOjKi
	DYTmh+MW+v6PbvcnO0Kok7QSdRI1cLIg8aQD7xnJx13arDbb0tiGdfCZ5C/yuAXSibA=
X-Gm-Gg: ASbGncv44zO/iMhNZE9bMLbdNVoe6Pfh2Sw2iK1tbrs/K+00Kxusgt9St83gyNTsIeD
	FZ4oy2dWV3zczfF5hy1BRCSMrCA6GCnncfwwduVdqIBktyRqLPxFKE+00Lsaf3oTS4h78gRuahu
	IewqmI8KPn6Fx3+XSlkHsnTKmq3J96Bs6hjU/oJgsOWv6pH0BkStawQJ4Ne21nKUCcmw2XkV0if
	ibgC1/+iQBLTemIHx+okr3W1VXJ0HtgkRMNKlaZup/uFlt5Su6O+EqyYLJiWDbobcmFPXRYP6Aj
	UFo/3lgxb1NJ+XQ7sjDJ31g5RJm10xmKKI/1XX9k0GomGJ/nMrs1W9u1VZd6bEdCEelNghqmF2L
	CiMtdHhWmqSSMK3n8jV8QuURMffwzhuEknHNj0+T0fpn05g==
X-Google-Smtp-Source: AGHT+IHBhKg7IjKrhhcVMyL/r57y1ugEvw4mEz2iVwUNncB45EjnSI4PTdqiXHRrUmtm1gPJ4N/MCQ==
X-Received: by 2002:a05:600c:1548:b0:459:d709:e5b0 with SMTP id 5b1f17b1804b1-45b5178e893mr140193745e9.5.1756202348058;
        Tue, 26 Aug 2025 02:59:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6300da81sm60418635e9.23.2025.08.26.02.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:59:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
Date: Tue, 26 Aug 2025 11:59:05 +0200
Message-ID: <175620234226.21143.1718612785479357856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025909_644795_7C08E2A6 
X-CRM114-Status: UNSURE (   8.97  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 20 Aug 2025 12:49:45 -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
      https://git.kernel.org/brgl/linux/c/66edbb1e32eede16b261a90014451d67119fc875

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

