Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D50C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vHj6gQ1zeVt3QGQTw+FIAxu8YW4dxt5y3xOPYH0BIdw=; b=xMjNUm/VY0ChYNPKlus4NB1mvA
	SV/w/TLy1eV5fbCeRw/kgV/1ed22+u7Oii6DpYEfgUXkmgJu3U23uWC1AapgkOZi+u2V2O6L4+OE1
	036xbNctKO321L8oPf8UKy+GAhxAssRxIHhYJS+0mhny+t8Upw0MYcvc8CZlM8bcs0DG/r2svXzjx
	uVLI/ljIT9yrhV1X4HxPuvGUSLSG3bXP0aZ6trXyIj6F9UzV4RiFaEhalUH3atff4WyXPH2m3cXoh
	KyK8KOciIY4xxoR4yykUkPzjSZzHD/fxVOGpFZa5J4Ocs6icvHaqY9FHBlhIJTEhhW8qSSk9Md11g
	DtOHdatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7Vb-0000000DCVw-3UT2;
	Fri, 28 Mar 2025 11:04:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7R1-0000000DBjn-1Hnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:59:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-301493f461eso2458158a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1743159574; x=1743764374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHj6gQ1zeVt3QGQTw+FIAxu8YW4dxt5y3xOPYH0BIdw=;
        b=GmSYKabAXIsN/5hdaqnLHTaRSod7hZrpGEOV85x7OrXgW3sfwGGWxzzYtEdeYd7DfA
         kipcSK4ila/Upg03uPZaX1biuii6t08CDZEGrn+3EdsUK2PKiAXb2+6NFx3ljGHRoN+7
         fKwSU9XYLZYwBQ7eUg34AzFZRfnt5PDKyV7uw4wR7cstwzLWkqIYpRpf7MK3ZzqGV2qM
         r4zr2uWeCNHVgfVyZ039/sWlnNdbdnP+TYs5drU5vSlF/gshXT/ZbP8hFZ6qGHpF9OBu
         bygTiNhF+UN+ZDc5LE9pLU/ibbvX/h3G0F95uj/5c2iTWnBtJjFYkwc0aYr724efNGXx
         fY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159574; x=1743764374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHj6gQ1zeVt3QGQTw+FIAxu8YW4dxt5y3xOPYH0BIdw=;
        b=YAnXfHjzS3imMVwbCnQdrswHuR3hLbDPWVvk5By4GOGpmEl+/ILCksFogbi3DJjNou
         mDRhPoonVhLfBKaE4LjBKEyJUtFbUvSc5t2vBHju0sM0HN/fZWwgja+hCXobDEU46W63
         PVi+8kAwg4DGPZa77K5KqqvrqfIlaxywIkxC5fCT2Ew4QZeDD33Av6htfnHeZDFuTME4
         jz8llabemJERV0wSl6lG6qDrvZWf+HRyIuWyOOb9S5GMn8d1EcDFt+OEyemZtSsB9iSF
         bZDrIyAuIeK0e5NrDXIenCUp5BaPWLBRvdGSEH6YuS/R54rub+i8FUz4r4fwJZ8rJbEZ
         QMoA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Mw2EhhUtDapcUW+36XXf1Ow3Ntgf7zIbdzqCOzWZvTg9LdatQgaNtbeG4C4z/nFt1D86gm3R+FhcoBMUg4KB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd8+toKnSHfttG9awPUx/bvjmyqM09EGBF8X8316NTfHujv4qs
	CpcPohSvHcTu4dnezgjWnHJIBE0d8PmH0LiRKjHQKQftbs2W2NWRaN2RNeObU4s=
X-Gm-Gg: ASbGncv/90LILN+JssFaGQGwNZzSfA+fDYH+sqNZmhJwOjizmfiwm9JkBdzLIhfWy5k
	kDysCMGdPiRj9YfpckNlDVC93cqmOe9LwRfMqk8weBzzEmj5dQMiRZVGjtjt/9ZstcbQhu3cp11
	4NMDVvJaEcVeA9wZ2PJmOF7ZHZAt99HtMp64JO+aWeWVLJX5jx5f9cw156aB8xZB0+YIxf7IgPv
	CrcSY0SNbqCAiUlJ0KszHbbvwmcjAXfmYjM4RjpqzSSzvbiJtbCYPICWswFf7gV2aesHAzekwhB
	Kbmhvb1/1OlzPjlH9lvgXybuGNHaVKNmu2A5WAzoMewPNk6O9y594/u62uVetcVCiFec
X-Google-Smtp-Source: AGHT+IHCY/P45TjdQpykRBnac2GduXlszHbzvBxCFlitCRhl0UAFu8AkE4JL9IObg2JicXApsmQMBg==
X-Received: by 2002:a17:90b:2645:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-303a85c1c47mr11926254a91.24.1743159573765;
        Fri, 28 Mar 2025 03:59:33 -0700 (PDT)
Received: from localhost.localdomain ([113.119.38.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4efdsm3844649a91.34.2025.03.28.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:59:33 -0700 (PDT)
From: Jensen Huang <jensenhuang@friendlyarm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anand Moon <linux.amoon@gmail.com>
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Date: Fri, 28 Mar 2025 18:58:22 +0800
Message-ID: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
X-Mailer: git-send-email 2.49.0-1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_035935_474966_C5BEA8C7 
X-CRM114-Status: GOOD (  12.32  )
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

The order of rockchip_pci_core_rsts follows the previous comments suggesting
to avoid reordering. However, reset_control_bulk_deassert() applies resets in
reverse, which may lead to the link downgrading to 2.5 GT/s.

This patch restores the deassert order and comments for core_rsts, introduced in
commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").

Tested on NanoPC-T4 with Samsung 970 Pro.

Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
---
 drivers/pci/controller/pcie-rockchip.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 11def598534b..4f63a03d535c 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -320,11 +320,15 @@ static const char * const rockchip_pci_pm_rsts[] = {
 	"aclk",
 };
 
+/*
+ * Please don't reorder the deassert sequence of the following
+ * four reset pins.
+ */
 static const char * const rockchip_pci_core_rsts[] = {
-	"mgmt-sticky",
-	"core",
-	"mgmt",
 	"pipe",
+	"mgmt",
+	"core",
+	"mgmt-sticky",
 };
 
 struct rockchip_pcie {
-- 
2.49.0-1


