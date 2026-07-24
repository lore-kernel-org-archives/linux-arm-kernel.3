Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FC6C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=; b=4aHKUDbgp1gBz38zE3fZrTdwTS
	SrYfHqf4fhG2XsGnaFT7hZ5wndskozuwkRzx3/9BQQPi288YnkmjIrMxR+vGozK+GRcCEQ/nqG918
	uYM8Lj2lb7AGsdZdbH74lVJGlnVdBreRGWQeQ18SM7fNoOdnjDry/J2+tbpkVLXhAgo0/ewWlsC7u
	DzUv8Ee9WDpAj6zresVJrZNQqjFmNdYz0PBgK9fLDlzjTyFGZ+6+RB25GXSRVgOBBG71mkRt7/eLv
	x4Zkj86PIvhOXfcOF9I4xE5C3QSauCSPBxIUut1q1JThaoSjQk3b68Kj9pR2PXZPr7C7m3qiTXIpW
	UAqMa/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK9E-0000000GzwB-2Kb1;
	Fri, 24 Jul 2026 17:57:24 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK9B-0000000Gzva-2OZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:57:22 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso278034e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915840; x=1785520640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=SmKGXAsxQDhxu9pW901f3ytUsyMoypxaYPgbHesmR1wOS06zQmfb0j7RGQO/7+9+1x
         Wi/zLCE9rGCUwev9eS5JHyIpbg3fBavditMb+N/PSwqO78u8x7YsVIulaoQSV2lj/x2e
         7cLM4Z9YBtIKcIt5Yzq92hlr2edn/nw2xqTcBzy+8pHV5pbn8kT/h6Kx1ydidK5Aee8b
         2j4ZqBjTen44XKEe8BhKsn8ELxtVJAQkERH04hFKbAnlWr73bnW6NuSIRWvP/cJwzfha
         CUfJ5KyEPgUDJ4bXp8eg+hiJR5LVJSB04ZCNT5EO7IL/tCPhxASmBFkE71poUVW6QxVe
         FO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915840; x=1785520640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=VSP4NGFQlPd77G2Szx0yhbUM/4vyfoKV3MhHihPlQ9cKvslFhwG91yp+DvZeDUnuML
         /jNP1hePeVvSmcXg70kM3JH3R8FHEwIZbdBR/mU3GtgE33P474ulna6xCQIdNTAr8mfU
         gfggRgQ6P5MAwqbsX6XGjWFiAiHK3MAkq+X3InO3FC2B1RTVJkge2mjNmA5kY9qpfCxI
         XnOki1emD4Fa4CuaBPiIHPBdWgYz8Vf+98tgSdvCoJKGVzYHa1rOlhJOTmwi9Z0+aiB/
         XGOB2VDI+/F6r3O9nD32sOdnRaVEQu0BjriNT+GubmGbuVf0LQezWRPEttXxzf/sqa0v
         M8cA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3oHQfa9PA2tCO5VuyxUi7gkuC9WkXbkx3LNDx2rTh5AkaZkEtMDQNo1lygFShxM5QPc/I2+i51d7/lq+L9W/h@lists.infradead.org
X-Gm-Message-State: AOJu0YwHWDPNmHeCP6H3Ls6H6zE3woU6eop6MsAD8M6bFZ3duJ6cvF3E
	frlkRhRjyu9Hm7tejuzobIqmR6P8INsgZYgj3ckg2GHscXH9GALD1SMc
X-Gm-Gg: AR+sD11KLIkjO2INQLb0+rji6scB8tWxakwFQ9gO/xsSqzx3KIhJam8g+lZbf2kRvGO
	RmIEDTOTanBD9Wdzgw+w4mJ9gV+ERCVLA5rJ5pgOW5usDSglpy268PDQcGNvEKPtp6R3vX0qNxL
	2Z67zuVtOaoCvoWK4Umwl4uE6DIvJcgGTuC+5EN5wwaK+R6FkclRu1gRI/n2LvTHwFzDYShEjou
	6IpOVPSxLHWdP9whzFLQ4jBVCsGnG2CC+tjGrbcSlSEVHBGrxq+5re2UPHLxVz7n8Qtl+RaxbSj
	QCgar5YYK/d7+IAMge2yPuKPPQ2PdnQn7BLZ1HbW7PcG0t0HLsBMrkrXoScP4897NgnoNjJuBxP
	6IwlFbx4yOFFr1eMl8ovlZfiAkTrlCrIydFspFecSdz2ds/wnuqN7OpytQ0vAJVv+Y6oH8X+h5B
	o3OiM387F/eA==
X-Received: by 2002:a05:6102:6a85:b0:738:20f:10de with SMTP id ada2fe7eead31-74d5fdcd898mr3880056137.17.1784915839620;
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
Received: from leonardoc-nb ([2804:1b3:a700:4ed8:4d0f:883e:31be:d914])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774c901f5sm368376241.6.2026.07.24.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: [PATCH 0/1] Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Fri, 24 Jul 2026 14:56:33 -0300
Message-ID: <20260724175657.15398-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_105721_641076_C009D219 
X-CRM114-Status: GOOD (  10.77  )
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

This patch adds the device tree overlay for the Toradex Capacitive Touch Display
10.1" LVDS V2 through the DSI to LVDS bridge on the Verdin iMX8M Mini.

This change depends on two other patch series, and should be applied after them:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t
    
    Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for the
    Verdin AM62. This series is required because it adds the panel bindings for
    the display. It is currently in linux-next.

- https://lore.kernel.org/all/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com/T/#t

    Adds the other device tree overlays for the Verdin iMX8M Mini.

Leonardo Costa (1):
  arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 133 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso


