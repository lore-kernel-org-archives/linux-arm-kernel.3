Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B92DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTPWbSgjrTLpPmlX3MdNrwi/24I03HDG8gfadoLFfKo=; b=5C3zp1xD8zSEUUBHBiynzRCrLp
	XnSHtaY7D0H1xlbrLarQS8az+Xz/AOwbRt3THrr49NJLrKyCnWGFtSGyECLLOYzRGyew/LgXGVR3l
	1I2idukr11k8tqubS/SU724ANjnb8GwgAlrXx/VWcEj/kUsl1gV/mbMuiN6TDA/Avoi0u3aaWVBEF
	OSx1Jddkx5tiH5FPi5NSbYjra8H+amjcRrsn6Q7Pz6T5ZtjgHNSD0oRRuPTRKIGGKshAlUMLnSw8Y
	JQT2/syk1dAxAzwc4/ZetKORIfSGZ9GJEq+XU0QXWuCOo2NUtWZ3PGngJvAZRLpvWmhMpFIVcDRhg
	Nk9etI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkj3K-0000000CcxV-1xCM;
	Wed, 19 Feb 2025 12:19:46 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkj1p-0000000CcdJ-2gZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:18:14 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30613802a59so69289491fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739967492; x=1740572292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTPWbSgjrTLpPmlX3MdNrwi/24I03HDG8gfadoLFfKo=;
        b=jkI91kP2E+Npl9D6A0Zpf0Fxk97pEuM+Beeq23R6UmSig9vkgc8cg0veUDiU5fPTMd
         NYcMteaM9NjwoYQOl3aHnB0JW7M7htQhLA/LvOb1Pyn/KIrnDFr/NmY8smpD6CzwMgYx
         +H52ptZJRAe/sQDBz5EHjdEMj2BRsH75T+pbA52q7IEuxUgAYHXaoNi9PoYBjXZIowBd
         KSRBI1y7iwVMgZLZJliCbezPPHX1LmCMq1YFOJ6AQDL4wAmShWNCCZhE/PAzt+RiP/uj
         OCWtcOh+fkErl7QLXO36pZqAA7XQhH4ibiAIL6ZaUiv6LX2KSD4MKEeMp5gl3iL1INM0
         PLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739967492; x=1740572292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTPWbSgjrTLpPmlX3MdNrwi/24I03HDG8gfadoLFfKo=;
        b=XV6rCKSCTTpPB6/C+QWnmwGcGhKmdXQ/wpWBfp0l8WUM5OOCqgOfFk2CyMTUkw0Kto
         eHo2C3gsEvsiA0i+PvUKQIDbNiIGeE2M2pTUaTes0cXWMPoa3RAyepo+Hf1+cuyZfJNr
         aKqGA/y9+vNW0atTcOrRpdC7LLIOjdA7e27nmEACbXGuSv2F4Z3GvJapVLOG2VpkIe0N
         JNIoxTlVIYiaIzl7GRPqDePVCJmgmq4pw7v+IdsocvRF6FZyiR5Fc/e74dEtwMINlahP
         +VJNOXwo/35+gpNmUiUGioMEKDLON+WnqpO8Dk9W0migLazANQJJKfV7BObPZx928GqD
         EWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3pJn8lqV+cRc7TdWqOUsKGu1bomHWT+7W7FNtqpfQIUyE/0SWz62OYJiBRtgoATKZ+G78xkPJ4mDn1QbyeTyV@lists.infradead.org
X-Gm-Message-State: AOJu0YxLabKfggEodZl5AwaKbYojfVAQtlbWkvO/305TqCCQS3h1D0Eh
	Oy9Z3b+TOoN5G/8HycvqPpRfwOUwksvXOBG+Nlbq8Rjef4YRIB//nr9MLukViOTXZxWuTyflIYV
	bOC1WeOIIieNJWuMhbThXT+keY6Y=
X-Gm-Gg: ASbGncvWdYhGwOOncBQvE20LuT3P6s48HQlMsv7jkHjkiA+orJWmRvObPi6V0k0RyjX
	L2oquJcxR35IBpRax/ngYqas1uCetMb7S3b40E2kAUbSq8HGyxLe4Le/6R60wT26/9In8HiudUm
	+HcthycsDk6/eBjUziA0RIY8HLts8=
X-Google-Smtp-Source: AGHT+IGjNIoen8ULKXTmUUOdA8vnMJhMrh0uHRpn94zwbfBEqhRrLoruJpWGVHqyNRMVU7htjBuXJmu/uj1ajZZO9rM=
X-Received: by 2002:a05:6512:3d28:b0:545:2eca:856 with SMTP id
 2adb3069b0e04-5462eed85c8mr1170113e87.9.1739967491394; Wed, 19 Feb 2025
 04:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20250219114936.3546530-1-lukma@denx.de> <56e56623-9cef-48b9-8a57-ef7840f0a8f3@kernel.org>
In-Reply-To: <56e56623-9cef-48b9-8a57-ef7840f0a8f3@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 09:18:00 -0300
X-Gm-Features: AWEUYZl9H3BRYlwGymanzXLFA6lr62seClEuWhg-mC8ltYhyVYgZA4_v-XW8gpM
Message-ID: <CAOMZO5Cf3JpKBjQXdjWNeSgOCOLmcNuSvQpR_ewiFtH-p3KwfQ@mail.gmail.com>
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_041813_675740_5E1AE39E 
X-CRM114-Status: GOOD (  13.26  )
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

Hi Lukasz,

On Wed, Feb 19, 2025 at 9:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> This defiine should not change. If you need to change it, means it is
> not an ABI. Just like for other cases, I suggest to drop the define in
> preparatory patch.

You can follow the same approach that was done for i.MX93.

Please check the two commits below:

commit c0813ce2e5b0d1174782aff30d366509377abc7b
Author: Pengfei Li <pengfei.li_1@nxp.com>
Date:   Wed Oct 23 11:46:48 2024 -0700

    dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition

    IMX93_CLK_END should be dropped as it is not part of the ABI.

    Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
    Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
    Acked-by: Peng Fan <peng.fan@nxp.com>
    Acked-by: Conor Dooley <conor.dooley@microchip.com>
    Link: https://lore.kernel.org/r/20241023184651.381265-3-pengfei.li_1@nx=
p.com
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


commit 0af18ba60752e8a4ba34404c1d9a4a799da690f5
Author: Pengfei Li <pengfei.li_1@nxp.com>
Date:   Wed Oct 23 11:46:47 2024 -0700

    clk: imx93: Move IMX93_CLK_END macro to clk driver

    IMX93_CLK_END was previously defined in imx93-clock.h to indicate
    the number of clocks. However, it is not part of the ABI. For starters
    it does no really appear in DTS. But what's more important - new clocks
    are described later, which contradicts this define in binding header.
    So move this macro to clock driver.

    Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
    Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
    Link: https://lore.kernel.org/r/20241023184651.381265-2-pengfei.li_1@nx=
p.com
    Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Also, the Subject should not contain 'arm'. You could use:

clk: vf610: Add support for the Ethernet switch clock

