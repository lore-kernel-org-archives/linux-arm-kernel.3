Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79CE6B245
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=; b=ZixushFaUmlInnSzYeIwCMdAb8
	k6BPOSu7/4URBHMczV4nvdTX02y6xoLBMMkPVp64HefcWGT5HLuUVrjGLICtEm/D/dFscsMcNeZKm
	FGRM+X7j3cVPwGn9Bw5VfJ+KCQSHy8H4bObjXmYLXJDNLB6wa7clXfMtjlTAWhUnx1pFuk8Z3IyWc
	0z3oZ7WxjRQUvRESVHc28ZcO/cairByooeGHVj2oqL2XbXGMoNmCmo4DIZ3Merj6bq0MhHMV3c0VF
	ZXOloBm4sLSC71RwNtLxPCiQUZTVd18/RvQ9ZDmfepr7PSOJnyQ0rm50vpExZcqt91FTpgj36Y+nM
	8M4w1U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qIK-00000006pk2-2Alk;
	Fri, 01 Nov 2024 11:58:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qEY-00000006olj-3R9p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:54:32 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so14278051fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462069; x=1731066869; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=Q8d31KDJmAlmFHnXDOH0s9GZJipPLaEMZ48KCBZaPPd49I1o9Z6UUnLZFSLqzmh1Ga
         ijCFAPz0koE/dptlrl74K+BYM7PbZI4sYnU/IL80OzVAcaVPIs8qc//DilpMcjZDRdpQ
         1dsxWGMAjkaEtsc6dkGe8YNgpfm5UDnuknT+7XOHqXwwrijgd8kgkvk0oNRFD3Z4h0JI
         LIClPACwj+LJ5JkPeb0bTrkkhspkj6ZlW9gjaORT9xdOEMhE/u01odMTu/mA4r3kgBRc
         fNCwMP2a8O3qDW1VkgSNxUiahM5OGbor9KLpRDsAworofvg+Rg29O5xVCXOS1s5J9uEs
         UZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462069; x=1731066869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTkHIu6x6J8oDnM2EYPHGTKSx4bAvmnfjc2sBE+Lf2I=;
        b=Imi3UdI6vQQBfE2Kag+FAFKjaFBVAKBUnVMXxwIahGpAVA73YrcsDae1WhiFawo6Dw
         vavbEX5tl5jF0Bd4P/bsTIH0S7l9SyNHdsmeufSfOQHQ8KgCdIbaYfKM2PqsyNT+WMmD
         EhQBF24sGjlm5uGPX6QFISctaTdzWPoTpdoAmBc6g96F/bFPF+MLhLExB/JisGBJNzIR
         arHdsR2wtATJPkRqKPeDWdDAoNEpsGiT1HDc2nAO2VUVbyExzEh1WOmC9YqNQ1y8RzBq
         z2WVjXDzsI1krGIdKd0BieRZtAx/b2PRThOjWgaK5/q6nflljFcjhHZ1vO3eAYockt5e
         UG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmvezfRbak6PdZNvSaQdwRWH5ip1SmZBEwhbxLWqPUb/MpwMhaWoXgUObjf4dpSovCM/KZcUZ5l5CqKXAzzqjh@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ2LMAc7iTfx803f2N1TAaTWIZ2uhuCjUdg3jlI6Woe/dta0jL
	J3IZdVca4Ss/9LWi6YermLdTZPUWmlpBwIatvn5dakIfkrUK+zh3rFRcx5ABbbevlmVp3YxYq0Q
	euC8UxrqG/FxNlYRFYQ3XG+YJolg6LyAEE2k7nA==
X-Google-Smtp-Source: AGHT+IElM+4cf5nJiQK/flMPFGUQS/qscWK2wONW7FVnOjF9n3NBlck/a/D8oXjerYOiHg6n+ZKlCTOw3SU28go/iqc=
X-Received: by 2002:a05:651c:154b:b0:2fb:6394:d6bd with SMTP id
 38308e7fff4ca-2fdec4e750emr31077211fa.12.1730462068876; Fri, 01 Nov 2024
 04:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-6-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:54:17 +0100
Message-ID: <CACRpkda2Ss_oy8vX6V7KK9DCvSoWxSg2R_iCourt-XReHBcpLg@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045430_879080_84D71077 
X-CRM114-Status: UNSURE (   9.81  )
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

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij

