Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17DCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gd5/9IeQ4uKOEKZif/xbCKEyzAUuhNyeB7aYV5jW8jw=; b=XYoSlq9gGdP9ULFwQWx55XjUqx
	VFmAddRqXHdtQs7dRwgpya9jvW+6PxEg87tVEggPUg8T88oPG+jvEc/+KGBl2d6CQcYVHCRGtjizo
	iXoGvzclYRnU0OVU/NmGVjbXEloJWuj2ZQ5bgn0ewZ7EyAwtnUPlsijrx1rkHSYvhVK8HN1EaCeyd
	WpxCe7c5gX+pO22KPWosZ0351+9nDhsvJXbpxmMLgT0z+3wgFBNLZz131petcW0zeo6NuApVPZa1g
	SB8qyn0nY6V5wi+n2DczdjVyj13WF8GGhnoILNs1reCpsYLmLD9CqLSvJNltnHEw6a8EVL5H2Pxmd
	Vq+lS4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwly-0000000CgIN-20du;
	Tue, 26 Aug 2025 16:43:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwge-0000000Cfdb-24JX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 16:38:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso50290965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756226299; x=1756831099; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gd5/9IeQ4uKOEKZif/xbCKEyzAUuhNyeB7aYV5jW8jw=;
        b=o41ffsGZS4CAFJoRJN/D1AFqhrQQLOnkBaj1r9K+ZYHORRNCnwyTidiy+9/ozqSOSa
         eJXXRtf+QHZdDwbXZW7h4Om+RJ6LIV/6soQZBhWK/N9dTTybQLmDq7eyjiFu5AWTT6bk
         +i2R3DQjVZQvSxNEN8S9TuA9HsGoG4Emrq9Kk5fkI7/VTOTq/oixJJCg3HyuHYFK9Pbz
         sEQk2SAy44mrbJivxWqyEKt/8Y5rzQ4oVRlSjNbNC9XcOgfNMQWWGwsRDJ7PmXqU4l17
         Fd/1RZFhYp3y54NjNAnTpIoy2JptG/Mc9CdpiVeRJ60JZrLo11qGp7j9uQhKe8Yt0kyO
         acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226299; x=1756831099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd5/9IeQ4uKOEKZif/xbCKEyzAUuhNyeB7aYV5jW8jw=;
        b=cOeB2OVaazQwjbWrT+YBGkKNc6m2SMK/MOnn4iFo2v0m6fo46MgbbVzw++wnDJ+Pt6
         xF1RSM9GbsqvBQt2L86+RFBNg/BqLTCFrVD+3lIgE2TcMJiv+CFLxyhdFwfmjkRA9nsL
         Va+nKwAFvB5S3RyNephKHwo+eOPj/wlWD3TKHeB+UHqS/GbYBLZuvJZ7CVQD7cHZ0Ea+
         x1uz7Nb8R/K5sQ9Koh3O3FXrtMDiJH7PIZea1G8G4DO+rz9TLQmwkNFCzOTyU+bjAhYN
         eCVBXNjNobV60k4Dw2R70W0+4qbS/NTHzbnosmyJm2od4vTWoKWTIY88U/E5GvvElQ+d
         7H/g==
X-Forwarded-Encrypted: i=1; AJvYcCUSj/W0xgXLCppaQb3L4d2RTJt47WmFChl/VOevbF4C5gbuS2vNTv0eH6pqEriu+TNxnNq0rAf07DRkXCfcrDwx@lists.infradead.org
X-Gm-Message-State: AOJu0YxzhmwkZhjYKxw/MwsXAfTd/DDYf98g6vnye6q5ltFF0801uACV
	mVMasWiAfL+6of4HeWG8PNh/n5tOUexBzjBpAo8H8iLEXet+J7piqkZQDI/eW9cgxj8=
X-Gm-Gg: ASbGnctVQ2Kg3CEBJP8pd53K4Jtk1nmx62bq4QQzv00QXWw9ge5H9NJgj2JHCNJVnXb
	pkBD+XkvXq8hQsMXmqTFfIETl7l68dXJ1Oi5yduL7RK1VJhMUT2Vf3lLbhgj9LIZgZ2Wr3mX/PB
	g9qwXVSTeoOmusBHFKbQmZ+O1JnQV+LBsr6qaW4qxtsGtW/BGEeh22bQaKkd0FBXLStKJwpbe4T
	qYw+E76GKyZxM1wz7eOjmfqSny/vwXldiiXJdS5nkmxwG1EwPVDLih3wgwNTw0iDsLK5vXDSxW9
	IjvHgcDJovTRifMnGHTMrTnqxdhEERJUZmc9/iM53s5rgEkElLsZfQfhdYgQVcSgd/I7LnXkW4W
	EmGdVq3LkxD1lp6YTvvs5jhFGYkA=
X-Google-Smtp-Source: AGHT+IEfMOhKNGsk41+Pcjyd5bE18lIO9+Ehqp0eXFZ34jr9cFr/SUU8ndr/Fb7qeTETY3P4lllXjQ==
X-Received: by 2002:a05:600c:1c13:b0:459:d709:e5d4 with SMTP id 5b1f17b1804b1-45b6baf1aadmr1321925e9.0.1756226298932;
        Tue, 26 Aug 2025 09:38:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6c53e210sm34705e9.20.2025.08.26.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:38:18 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:38:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH V2 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <ebb194fc26ee6aa7816f07ea891469ecb780d106.1756219848.git.dan.carpenter@linaro.org>
References: <cover.1756219848.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756219848.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_093820_545834_AC4F13F6 
X-CRM114-Status: GOOD (  11.77  )
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

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 6a7cc7b33754..e8cfddabfc24 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -701,5 +701,12 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 61ee08f0cfdc..8fe1fa35e9ac 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -765,6 +765,13 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.47.2


