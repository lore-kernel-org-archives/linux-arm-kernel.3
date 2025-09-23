Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F45CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xur5ogzlO3BxY7k/WpoKiidJ69mrTNy6lGE5CvTWMk4=; b=oDPjQtSjpk4Agw8BAv4G9njrEi
	fRyCy6NQ7N1WNlZSobpHz2+hIgn1/GGTG69eCxlFVwJfr8GXWhVf4K1T1nNYcM2sUwXrrStK5l41k
	20nAXwXr1mp+NT8vMgApFvwH9MkAsFLxc/S3MeMd9ZY9yu7a1LBEQwS674dthI1PheoJ6lwQ0mKWI
	SgZhSL3rraUddRQCxPrXp+PicVWy6fPMlFHYJ/Tqg+tI6ixMkQ+e5PrkujscMw9l/d14exRSHCRQa
	OulT8Vnhy9uBhBo/uPj7pk3nmwnxivYVWLn3zgkDHrCRZCjDYqMMFtEhww88CZJ9DnxF7d/w/FUZS
	dTEkmH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Ke-0000000Dv2M-0PMQ;
	Tue, 23 Sep 2025 14:49:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Kb-0000000Dv0G-2rP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:49:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b28e1b87aa7so437137866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638964; x=1759243764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xur5ogzlO3BxY7k/WpoKiidJ69mrTNy6lGE5CvTWMk4=;
        b=HBCVzexYi2duiQXRyKDsyvQGOXBjsYtnrs6JRvpzGJsig4Gy0qltpwgu2hEWNOCuex
         Qpl+aldJ+Cb5Q8/+D4wZH/aN4R2r6iM9il+PHjEM9+NCkVzyfp9Ngm5qIprfWm85VNXl
         TNHA5wyl+gceINXsxbN/rMlM6S+upQr/qSRuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638964; x=1759243764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xur5ogzlO3BxY7k/WpoKiidJ69mrTNy6lGE5CvTWMk4=;
        b=MNlxiMM3+IGkdcYCIwCZ2tHNME8e8Us9y5Fl2gcP3Th1Xea5cXaf86ZFM4FVas+460
         04q8qCXwb0hfl6MfbNDvUJHcncDmjbx7yoCNdchRfUijqi7gm7zc6BglLs/NSHcViQWY
         VMcPSNpjl0mzhZuAQ65BeKFaZ3xitnGcvPt6+E4D6WV03OKcwPFKGmivKnlrXM/77UAn
         fIxUS2g3ogR4lQNf7In3yq6Dd7EHdfegEScFQNT3+oE5/P8OuEW2HJwiqHSjHJjI3q+x
         /Tki+qWVJjOUgqlmUY44rWoJ5GChsUN59oIZjVIE3aEeHwILIDqdbarcAuVAmRq3xtIS
         cIug==
X-Forwarded-Encrypted: i=1; AJvYcCWN9jg2pwSLVJhFrNmd1Wipafy2inF9NN9iL59zYRLxnd/+A/UE7DIIjQsAOIlZpOrCy7705yhIGs6hUGgLm0Mk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05VUn+UURwhfEykIebjICQOMp5acb6fBzoH+tFt2KV5MoOX9I
	ypn51uNqPFt0Jqs/pROfCRxRCOK2lRue+sei8GPe0mJXCpdZp8YcJ963kGWmHqf4f9Y=
X-Gm-Gg: ASbGnctgwNeYuMyOCKhWVl1YPJjPDDJ3cihaxYiOwZY0OeM8D7UScbsxIOt1hzzQXCC
	EVZyJFjiP8AF9spdws3LbHZF9amgl+oV597QEsHGHe+fBW7tudF3J0pZWKGyFlvFmg2vTukQ71H
	4nctSaw57ZZLvGR7jh4sJKRQrpBXzrmU5PIKY5E1mr2Xvg1hDc6Wi7lY0qzhRRBgRusa9GToRI/
	/ilJGC5NcN2wQA5mg5htl8FVL4CioBw0nuLKO7kPIsMN0+7TwTEAcTUo3kW9Wr8w4AzN9701DoD
	AdxnqIGBd0r+cQExI6rsPoYkwRhuYM7e1ltWnRrO9y28Rajae6IkOrThR15XvZeT28twRxtScz9
	iaJLaJ8raYO311cDiaJAfnKOkVoe9Yl6e2orgVk8m4sX2GL4TvDrIT+W4zgSIVO3YRDe3owisHc
	DPxHoyM4jtMaCA7hrj3DNxkpTv58aqIXeNR5dTeGRY8WuBYT2zwyQatzQn9H7Dn43D
X-Google-Smtp-Source: AGHT+IFdTyE8sOB500lABprpHvm3+W8fwHKLli2EEJnbWm8PCy1bRjTjWqFurJ5b3114azHIHI936g==
X-Received: by 2002:a17:907:3f92:b0:afe:87bd:da59 with SMTP id a640c23a62f3a-b302a07b5demr278688766b.42.1758638963797;
        Tue, 23 Sep 2025 07:49:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2c0e7f7b01sm515746166b.91.2025.09.23.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:49:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH] ARM: dts: imx6ull-engicam-microgea-rmm: fix report-rate-hz value
Date: Tue, 23 Sep 2025 16:49:10 +0200
Message-ID: <20250923144920.2858693-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_074925_737325_C8F81888 
X-CRM114-Status: GOOD (  17.41  )
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

The 'report-rate-hz' property for the edt-ft5x06 driver was added and
handled in the Linux kernel by me with patches [1] and [2] for this
specific board.

The v1 upstream version, which was the one applied to the customer's
kernel, used the 'report-rate' property, which was written directly to
the controller register. During review, the 'hz' suffix was added,
changing its handling so that writing the value directly to the register
was no longer possible for the M06 controller.

Once the patches were accepted in mainline, I did not reapply them to
the customer's kernel, and when upstreaming the DTS for this board, I
forgot to correct the 'report-rate-hz' property value.

The property must be set to 60 because this board uses the M06 controller,
which expects the report rate in units of 10 Hz, meaning the actual value
written to the register is 6.

[1] 625f829586ea ("dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz")
[2] 5bcee83a406c ("Input: edt-ft5x06 - set report rate by dts property")
Fixes: ffea3cac94ba ("ARM: dts: imx6ul: support Engicam MicroGEA RMM board")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
index 5d1cc8a1f555..8d41f76ae270 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
@@ -136,7 +136,7 @@ touchscreen: touchscreen@38 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
-		report-rate-hz = <6>;
+		report-rate-hz = <60>;
 		/* settings valid only for Hycon touchscreen */
 		touchscreen-size-x = <1280>;
 		touchscreen-size-y = <800>;
-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: report-rate-hz-on-microgea-rmm

