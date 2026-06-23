Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E412CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=APSMXL2QA/kOTC2fqsHTZZlYL8XNY6Eh93NOD7Wrt+4=; b=w4Atzh46Hu6V5zfuPpnc6qS2Y4
	AIprEoUHC8PAi2jjPmByT4uPO1EcqRjzpEpkym4gYUzMoDwOtX3SjBVi9nrSioaB7oIeVawpNC+Qw
	v5HSMpcMuoBtHFXXnjCkK6sCPNbEKfifcYC1149UobnD74aDiegG2yVg2H56ToWV3ermBI13iFj9c
	YHMqOp72sCKWPrl7RR0QbSvqg5IfYhWznTU2Mr2hIIfPqTr6JvgguHdDzDynMJMHGEfm7LAPIanDI
	EcIb+nflQIRpyjfR9Hjh7xRIzCLGrbReIyx7VBUoshWKq1+HGaeZxgsEQ9Kw0bAgXhUVtvEAIoZcg
	CV6v9d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GC-00000006oPV-3Lw7;
	Tue, 23 Jun 2026 19:58:16 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GB-00000006oP9-0OXO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:58:16 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-13981833e13so290249c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244693; x=1782849493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APSMXL2QA/kOTC2fqsHTZZlYL8XNY6Eh93NOD7Wrt+4=;
        b=qP210n8XjnIrhoRs222pOe/aeLnQAQHZG288n1NTIWeopQTIcBTRmogD51WJjxkK/B
         CVDVkY6tiFsfr6Rnjr5/4mlvJC3yW6L+RU8Z+RO2Ly5RzZM+l34J6hvpEdVK01lKE45s
         +S1S85MkPCOML4jYcxH1fTseEWG7WrX27R3GhqowJTysQDVOi86BKFT1QJ5VNKLnOuNl
         Ba1nPn0PHzZarndQw7JO2dLu3DDKeX8ejBfnTqwI8Or5J6Avq1Yev7V2++jt/PgmUu5E
         HsD/y1MoerBblBhS7lFeOmp11jEeQ4zw45qNRKmAR9wc/Z/R4FughdO9ivx6avpxpqhI
         Ki1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244693; x=1782849493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APSMXL2QA/kOTC2fqsHTZZlYL8XNY6Eh93NOD7Wrt+4=;
        b=bWaWKReCjuFjKc2pds/6WnR/2FG2gZW2iXBgC7AYdJLgerMD8m+1CdilVgW7ERxlNS
         ut4Z5CAo4Tpf2IhM/YJ4asgqxEAC5KkOrBzXS7SIfHsKUlbmkuBheA1WNanv3tujj+fH
         eISVqrOJyY03fZTTRnh/7OQrU82CyUPJi047Yo9mVKtnlymH4wYROghyDyiDZIq+bzUt
         oZjdwK9xPF673nuxJYZMnlWAYcBFbLrE22j9q+kKNtdkzUwpohpqD7LgJLOqoQAigLh2
         1SQAeln5EWAhZe7tyGkyhmmLuxojqopUJBJjGvSbm6mh1aCDMFqFv6IaGdfJfhCQjpLb
         xnNw==
X-Forwarded-Encrypted: i=1; AFNElJ9eCh3MaRetAavgjN784KS40KX36I/WZlVXJszWmxDdUuFnDFdTDJZTeEqHRPAw/FVShoKw6B1gr3UXj6Ss8jmx@lists.infradead.org
X-Gm-Message-State: AOJu0YwQmVOmLmiWhnu/3L+llYH2JeVRxRsXokgrX6IKoQn/ODzkQrLh
	FjEgWwA7rst0QZbrIGvPtF2nTa5ltyzEQTiOOTFP2kJlKkx0A1X74jIsjq2JYWuR73o=
X-Gm-Gg: AfdE7clbciTWIqNVL2Rp4nv8dY+LwPIF44oM34sUFhz6s4LBLrEWYs0xnh66SB73I+R
	t/tIB68KZG41gR36VPKOYJvzAKAcM/L2E3Y22kFhd+YLvvfeIOeDxSgXcvmlVbZNmfhtBtfCPhw
	49KdepGxEPoX5KSHj9y9O4NCmABH5URifc2dMKMZNt43Tpc5K8tS5AZ180xesqw2SMWZxrji+rJ
	kp4I3DbUlyFntAUSoNsTr1h1AUzc6LjR246Jcu28MRcqo5sdzQQrJiUgbyrYSSfD9PK119z0EBj
	x7xUtkHVH7RJAy67ac0sUZq6QhL8lrL0oBd24XrYTM4+kpmPOn3rQcH67smMsdyNoCvbvweUaFj
	W2A9Pp6iZ3TIN1jauHAYANZLM+ULbeK0lCe3zPdNbM+rb3t+fcaKtkyVRlsSfOTHG71P1p1vUQA
	JiuZoli1fl0v/GpzZlgWAjYmstODmN4rTCahJPAh/MmESG+fN4XrOvQv7LAVJJQerD4+nZMiBav
	uVquDt2yR1IVt9Aem2d/RWj++TQiUX67wU9uIUg8cc=
X-Received: by 2002:a05:7022:439d:b0:137:8db3:73a7 with SMTP id a92af1059eb24-139c5dfa968mr3114369c88.31.1782244692728;
        Tue, 23 Jun 2026 12:58:12 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:12 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Tue, 23 Jun 2026 16:57:36 -0300
Message-ID: <20260623195741.495734-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125815_180767_A367744D 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for Toradex Capacitive 
Touch Display 10.1" LVDS V2 on Verdin AM62.

The display addition covers two interface types:

- Native OLDI (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

The Opto Logic vendor prefix and panel binding for the SCX1001511GGC49 is
also added.

Leonardo Costa (5):
  dt-bindings: vendor-prefixes: Add Opto Logic
  dt-bindings: display: panel-lvds: Add compatible for Opto Logic
    SCX1001511GGC49
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" LVDS V2
  arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with
    the 10.1" V2 display
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display
    10.1" LVDS

 .../bindings/display/panel/panel-lvds.yaml    |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  15 ++
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 109 +++++++++++++
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 143 ++++++++++++++++++
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 129 ++++++++++++++++
 6 files changed, 400 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso


