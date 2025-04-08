Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4EEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=; b=O4li07e8oL5WtVrzwtzjXF0Xvn
	HMe8ehz17OBeL/7C8qqZht0jz+sZwqZL5hNVC2V+4XWz9lP9UrLl1tp5dVkECiSVaiyHEe29N4Qyi
	EFMYNpS228SgnG+JrdlkiROgDj04M+QI4oeK3jxljDM7WRlXE9zI9Kpwj2/DoZ7Sn4cctS1XfWafm
	xsdttCRXnQGjnp2A0Ol9Xh854QIGkqG0INpX/Wquorz6HXdA5DkZAMbIhmmpW7FkpZ8hHK96DkaHj
	PgiVDACVRG1TVxYk/xnusGlo2rmx3IB5FKChIYR4i81PMfoUdzP7ozWrjnkmTWzuRWaDwL8LKn61n
	8oM09Iwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FUn-00000005L4U-2XS6;
	Tue, 08 Apr 2025 20:24:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FSz-00000005KpB-2sDp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:22:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7138020e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744143759; x=1744748559; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=;
        b=cCFLGDwm0JBLXadq2ipSqp+gv4ynUHey9DuwTxEMgc6e4dA2IrOs50gOJH/zYH6fqq
         53dRdJbeB6XFwuI71FsGPPbn21GJf1c/PPGlxedQPMdWKDNV2zr8zD25uqoQg6WdWTZn
         k9Ok18mmPSUgf8miTJEuSUeK3hnHMzRcKbE9V5RhNr9XqY/aX7CLa0Z8QrgbpoU3jTBj
         mZfWZyuUmBkkHJtBbApsoagPurcu8IS3Vnjj3gJwWVyxciiuQz6VbNhxziRbdPjpW4Ho
         re8YjxCunb2Le7rWnBLWKIOSNWaPoy/vpNRzzqiPpqXZnjcZWypUpHa1g8avXu8hXYQ+
         sRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744143759; x=1744748559;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2PhItbELP7eMh95bPxosKKzR83AiznaQ3sfxM2Oy2U=;
        b=e0pYh1aG3B88LNYfy0ADmnqy/6y8sUb4LMEGsnF51QEH8oVZ4PS+MeaXI9yWc0uMh7
         +ooID61lDQ28/0H7gxA9NwsQkl506dtyp17Iu9bO3IdTGdW+3T8wbJSHhmn5E7RU3RHD
         /DLi4gF97cHJAFRTN/rc2egaCIrwb8R/ghoilaTRyUAMt8GjmQEworwGrDJVPIp4NTpJ
         GkVFZWbN7XL4/LIM1miwoHWJTAbCefyMJy9KbQsNCqCfXVgP645UsuYiPjsQof6Fm0Pe
         I11MHkVZckY6z9Pf+LoYfFqGZA8+AWF2R+txSMmg08ZBdr0xugrMos9rSqTDQzBSpzj/
         WENw==
X-Forwarded-Encrypted: i=1; AJvYcCXl6sV2JD3r4Y09Eoa8LqVvl+Y2PAg5jxxVSHVcygSjfxwwwDC83AmyDyY7beWbczoS3GyxiaPKL5ozln/v8Rgo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+r1JWTBKuSkarY5eQ3c4iVaIJtKtiwGmdc+K3rwdzCuNL+x27
	5AVBkevUZcjUg73M39kI7g0SNBmHeDinxRhHRHnoMX3CDRsJDSJf
X-Gm-Gg: ASbGncsmFZF3gBBRyCruMh+79SWQ0aolkqTAhPFw0Qdjr6TOQ5PVnzY6Qq3aqeoVxWm
	rwQlh4U1FC1Y0UHbf3ImI5ooMqLz+ImMeMva83TEx/eYD6ZmnHgqh5/X48MWkp4DRl7HCUzuNfT
	DYCa130H0L4ZMLjtrvSPmGDOgOQC7NRmHXp50P6b3Rglp9MCWowusuGV98+lf/qfWYjAJw/9ghc
	VoZxq6Kf2vWgrRIQ3WAy6YEOn2ORAjl1QoEaledRQiopGEUD3efEuVQlZbe17/ApMX+EENxsBBp
	4JN9pTf+IeT75NV3GpKkhYfhnKgExOaG3yFfm06l4kpd7t2val51UCMyd0UgjGVqf5Fqcp17
X-Google-Smtp-Source: AGHT+IE+GtFsM+TEtdlTod1fEyMExFuepsJ5N5fnlnm4b5K91VEAvAY0T73f591ltRk0GgRe8mlXwg==
X-Received: by 2002:a05:6512:3e1f:b0:545:2e5d:f3f3 with SMTP id 2adb3069b0e04-54c437b9ac5mr98397e87.46.1744143759275;
        Tue, 08 Apr 2025 13:22:39 -0700 (PDT)
Received: from localhost (5cfcd77c.dynamic.mv.ru. [92.252.215.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65ce3esm1596758e87.166.2025.04.08.13.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 13:22:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 23:22:38 +0300
Message-Id: <D91JD15NY3Y0.23E428W332D@gmail.com>
Cc: <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>, "Sudeep Holla"
 <sudeep.holla@arm.com>
X-Mailer: aerc 0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto> <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
In-Reply-To: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_132241_721927_3BCD3D52 
X-CRM114-Status: UNSURE (   5.59  )
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

Sudeep, Cristian,

Gentle ping.

Best regards,
Matthew

