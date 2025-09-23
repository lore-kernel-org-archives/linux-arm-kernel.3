Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B39CCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/aSYEPITl7MXFUBK4l9sWKvsSHUrdrtUDK4IHLwFVI=; b=fx11RQ7NBmv9OitU9fFLRmC0gK
	CQwD51exBPWDaFp/FiK6VTAaP1tNo1UgJRKjaNl8NIiySiJ2Nh2AFYFeIffSfT4gGKYNURUu6wehi
	GGZPVPf7VLIrz17qWHfa9CwuL84lRYSoVEQWI4k1YqdR8aQiGUnjrCY3/cELFgcJA+7qrWf14urt3
	ybHP5L5enKP0BtPXWMAA5qHQsfWk4tQbwen6p5yu3zOzsjV9TjMNMv2CtToliJPz9N/8PPMWMrOpl
	ZNVL0boBUTCYet1yqZ4cdlprQW3fxNUhRG0pLskjWFPBAj13DF85Q+GEBRridvwBoPLR0yAqKsRnn
	gsWTWiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nm-0000000EjuO-23cz;
	Tue, 23 Sep 2025 20:13:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nf-0000000Ejpy-1MBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:12:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46e29d65728so596305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 13:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658373; x=1759263173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/aSYEPITl7MXFUBK4l9sWKvsSHUrdrtUDK4IHLwFVI=;
        b=MYN33jNlAQ8hR8LdzW/oI4q6ylfpA5RpAWVs/GW4EYni38T3iMtkRbDsuT9uLnSoaS
         SEZonrxa+dFGq+kNx5dhpVVbxdEwqLzrjF/YFha9UpHkR8nfIIG7/RRa0BiUo4Gz3bEZ
         XfU0C36tsqNpWGSITbSnlEoRqssQMXQ8GLTp2H5k9ZIijsYJpUb7RS1HD6qIHZFnB8WE
         u1uiLQUopbu3poaPKKhsu3huILO/S1+epX4pmkCXP22aY62P1nNct2N8jyn/89X0YQRH
         fqe1zLkEdAQJNIgqbw139H2roGa07UTv/AoLIzaDqa26CTWy5A3p5wqx2nqwjFCXnVXc
         Ow3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658373; x=1759263173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/aSYEPITl7MXFUBK4l9sWKvsSHUrdrtUDK4IHLwFVI=;
        b=K/qmOLG9xbpv5CWag8lxfeVlIkbshcrC0mMwVxsak2jYao2iiGsgZmD8zhV6aLV1FG
         pvwzKmqAt7aoFz0ICrnEzVcAJC3eYC+pPoYVHSNbexobEbn22QZWww3dFoGho75u8h6q
         2v513DjMMe00OXHlC48bBV2+IY78ASa4nu/lHzzlxmbB7nccGzIleHeqh/XZqokOHTtb
         Ng7KP5lG9DYJdmLWIpT/2CsmPMs3Lc8YJ2Jn3DbBfhE+VQQBFo2oxCUtEU8mGMArrwmh
         FyDuDGmoUjH0MBaCRqyr/+m+pr1c1JhsE1H1+NKy3w87YZrhV/iyuFt3dS+Ls3WifCqK
         8a/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6osxrGEYsLVBJSCggTs+GF4xth7E+txE1piAyuPLXvqYZYuXqMsGQRoxYk96VJvM7u9JdMS8hHSV97TRzwb9w@lists.infradead.org
X-Gm-Message-State: AOJu0YyaavzYT0pxqZRmX31BxZmoTzy6YX5z/qj0Q2/p6Dqe05HQdAj3
	0Qg6Uzef27HtuRVc2iVcJye9ApiZmc9DUqlaVYjS7ZBj61Dssf0ycGEwftDukQ==
X-Gm-Gg: ASbGncvyz/3399K9sMbOTvRZG+81+oEr36TZ5MrFc69CPM7t6IdPn3wGmb+YVZVD7rh
	voUd63cThwF04fDanEv1GyNDeQK9hNaQBCok5/hgh7+RaoLQteh3I48JqDpxw68jc+g0vTL3O3S
	P4Hf+pBReNCeSiVqRHQ2XQYyRPYhrYsClYuTFJfUdGs/gTth1p+gQmGWff/5lBRcQzvZAljmFWR
	fmJpjr5TbQ14NJvUGyXsqqLkil0KIS0omQizsuTAUN5ZYBzA2uThRLyjHI/QhvDsV56i9pTnwXg
	7m2N6ikaW+mp6Z/9ha7Y+Dd0wJ3wGcTtbgANh5z0KL3vETnU0oxiO8LjuKgyyMcFkveOZm3Ns18
	kaGyhn1E0R2VCx0Z/tucZASJB7ACTVVpBr4Gdf+jUTeI6SvKOdp44yaxe0lF46Eezu0t5RXk=
X-Google-Smtp-Source: AGHT+IEEsRLoHeCjXxyp+KHw/4kToNUaWd3xzTGb2VSF+HgIp8CNjCGOmpc4a03QsHuOffoop0UVIA==
X-Received: by 2002:a05:600c:4f44:b0:46d:996b:826d with SMTP id 5b1f17b1804b1-46e1daca1cemr38382195e9.34.1758658373435;
        Tue, 23 Sep 2025 13:12:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong compatible list for hifsys YAML
Date: Tue, 23 Sep 2025 22:12:29 +0200
Message-ID: <20250923201244.952-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923201244.952-1-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131255_381463_E10AED67 
X-CRM114-Status: GOOD (  12.16  )
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

While converting the hifsys to YAML schema, the "syscon" compatible was
dropped for the mt7623 and the mt2701 compatible.

Add back the compatible to mute DTBs warning on "make dtbs_check" and
reflect real state of the .dtsi.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
index 9e7c725093aa..aa3345ea8283 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
@@ -16,13 +16,15 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - enum:
-          - mediatek,mt2701-hifsys
-          - mediatek,mt7622-hifsys
+      - items:
+          - const: mediatek,mt2701-hifsys
+          - const: syscon
+      - const: mediatek,mt7622-hifsys
       - items:
           - enum:
               - mediatek,mt7623-hifsys
           - const: mediatek,mt2701-hifsys
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.51.0


