Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426ECD12678
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=; b=LnmdPQg9b+8zZItxtCMU5RzMls
	TmotyOM7bBT4pXgkprykfgbtA6M9ILPEsjpotEI9ASiePlEskHIwp7y3Coq6w3rf4U/W3WD/g14lE
	8my9zJisYTa0Y14/lU1YIuCN2OPid0ETummSdHPP1kvqyNJmueBohkEa46WC8ybfMK3wLDmG5TJTq
	DKE5w87Gqf4cxcssuxz+7+K4u6a/JjD6h2K6I1Ie+GripCG9JHVXuioD8T06P/fJhiOE2q1dE3CJF
	vu+oaKEdedc32MIgJbjJbUXPXGg3C1FKI/klb+8Bu93zCbia95/057HKNv2W/kSZR6QNyhiR0oZSa
	yqy3xoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ghn-0000000GexR-0oMD;
	Tue, 05 Nov 2024 10:22:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Gg4-0000000Gee8-3nJh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:20:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43161c0068bso44508545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802047; x=1731406847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=JUQkrLF9KWjiPnpuwLk328fOiTsAfeVtFSDXDy4U1JuXrPDdLVAxbAVDtG0bnVdwxq
         nSTgI/q/fZXYNB2hM2QkjRp8STMtrwb+XAA+rWLWAVV3H9WwDbOzmYtpSL3xnlPYMtpq
         xkasKFaGNfc0ol7z6cN5sPoXpgswF+j1YGB5lNUP3yajZnQ/GFo9md4d6/PO6dT06tBl
         kQntUc8glnFSJrogBpjE0J1PlPYt2wjZyQ8HubVoTzfHudJU5KY4IgsyNcNancHQ5s3B
         b6uO98h/cavvHhYPfFjNt8hZsFnTBTJWnpRBHdiNmtR+/KcVLzzdAw9H6gx7ai2fl5dJ
         QxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802047; x=1731406847;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=jZoiPjYirbTo3p/yKSxJuRD8HFqyF2qwX1iEKZmslCN0sDR+LmaViEDtSw3OtJBaY6
         QCumaT5QItSBPuzmAU9192ajF3sHh2rlpbGr4zxfwTObt0dNhrAzHqnH2FbUcQ+KKLRA
         SwBj5SvrFIOlOD/Ygu7EaI1Cnutc7OrZE2DR09XR4gZB/s77ceLmcIr02TjZtyfHIiIU
         T8h5zAng2+f/cyBQ7/UOOJv3HPUIVeJwXkJU83CIiy/w1ZWcaqclHJqMIDT/2I+gM46j
         n54arMm8aHTQRXFU7l8Bp7SCpcdCg6esaihGrM7KYPwAKH2rfY6hXnkXmNsycQu7d4rI
         x0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUx3tMeAeIFSTz54I5rbexfY5BNaLO7vltX0CTI+IyEp/Tdl5jC6mhg51kbvM6iBG1UgB4ghfHF9xzShKVAN5Fh@lists.infradead.org
X-Gm-Message-State: AOJu0YxTM7VyzgmY429T0m19C5z9ci2KsMLNYVdyp/YwU2e7IdE0w77M
	zTW6uixG9gnY6rBjmGwYhiFoF9Fd/CRrRZQAdrFYL3mqSWi/DGhtEbpu5nAeOL8=
X-Google-Smtp-Source: AGHT+IGiCKZMB9E+p4Rzra+IUjFqsLZgXkfliq+gY4mk8e94l3nXR/6qBBzd8yl42Q8JhaJlQ14rrw==
X-Received: by 2002:a05:600c:6046:b0:431:54f3:11b1 with SMTP id 5b1f17b1804b1-43283297a21mr128723995e9.34.1730802047103;
        Tue, 05 Nov 2024 02:20:47 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca7ebsm213412005e9.42.2024.11.05.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:20:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com, 
 ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, 
 Pengfei Li <pengfei.li_1@nxp.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241023184651.381265-1-pengfei.li_1@nxp.com>
References: <20241023184651.381265-1-pengfei.li_1@nxp.com>
Subject: Re: [PATCH v6 0/4] Add iMX91 clock driver support
Message-Id: <173080204542.1890849.11473057431035200273.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:20:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_022048_988956_B24C0A8F 
X-CRM114-Status: GOOD (  10.87  )
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


On Wed, 23 Oct 2024 11:46:46 -0700, Pengfei Li wrote:
> This patch set is to add some new clocks to binding header and driver.
> 
> IMX93_CLK_END was previously defined in imx93-clock.h to indicate
> the number of clocks. However, it is not part of the ABI. For starters
> it does no really appear in DTS. But what's more important - new clocks
> are described later, which contradicts this define in binding header.
> So move this macro to clock driver.
> 
> [...]

Applied, thanks!

[1/4] clk: imx93: Move IMX93_CLK_END macro to clk driver
      (no commit info)
[2/4] dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
      (no commit info)
[3/4] dt-bindings: clock: Add i.MX91 clock support
      (no commit info)
[4/4] clk: imx: add i.MX91 clk
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


