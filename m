Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28729D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvFldH2UE7l++lKguJ5UKXHzEK7JVjP2Z1XY9Om0QMI=; b=Goxr7X2iTbB9iayWVK8St7nHVO
	B/ky1btipEbi16oYS+N8Ccvf4NxcnHzx73tx1P2MDmfNq2KNMSsH1n0fMNOf2qDZeZBo8rf88dcMX
	RDk7bjkwJY8hDvcXqXe3aTCBAHKQHKpwV1DXQMGO9z10laDSxAugNyM4wU92uMTlUeysiCNAWzG1d
	Wi+q6ojvl+lOw/GnMUmOn551eAKbRkPIWVYZZTidd5qImnzZcRnGsrqpsOWbT1h5I0p83XebQyxx+
	B/oV7G83VDzVscLYS+sNLQ3OqDhw2+D4WOfjw1BukOpscZsY4a8LIW91EmuxGrgSl02AV+rIgFr9n
	dfDgxaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI88o-00000006bZu-0yvW;
	Mon, 02 Dec 2024 15:15:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI867-00000006axv-0HXr;
	Mon, 02 Dec 2024 15:12:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21288ce11d7so39363935ad.2;
        Mon, 02 Dec 2024 07:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733152346; x=1733757146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvFldH2UE7l++lKguJ5UKXHzEK7JVjP2Z1XY9Om0QMI=;
        b=BEddVNkSWD2ZrxL1ZPZiOpR0lr6vtZLeYt2LovAa1L9QS1WFmSctm4c8514FWIqDPM
         u/qgPjkgJfqgIfpJ0gkYigzL4RFvuGzExfCe2xhArG+ldBsBTh6MsKX0IvaXn3If1inF
         KTs+YLPokksxmRqbbi+eMPaX/6dBy4g3lSLvVAWvBXi6/tl6hI0SjS5dMzrHHyyvgAzy
         AsTkXR5GJWlm39YbIdOPBWqBbEANxrY69EkITBwj/illCbN4rm9Ez2N2Dl/WlT47/CN5
         zNdUQTGRSUhIyzeJI8ISTsK3Sr8RhCB1pe8Hf8asbwwx9/L5AX9E8tV+Ookp+XHtWU3y
         u1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152346; x=1733757146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvFldH2UE7l++lKguJ5UKXHzEK7JVjP2Z1XY9Om0QMI=;
        b=NkNLwuhFLCPsEAnhnKql6mQeYYK0PVelOcttAlFn7WqsAmeAu5Potp4mor9uQsBgL4
         o26x5NQY0lkeIqIi2geeCk9Dqsax7AFdnOMZP+BjEkDxCyfT4HKm/omjcFX4el+m27RW
         41ke/UVR9m7FK29K+syteUU8IPSjhQ34jXp9W/7bPpMMRVqRqw4GyAXAVIz3Ad0KSxu5
         xSSvIfAjy1Y+Mha7SvwpurDOMlSV6BMP46m/CxnhHARMw2Vj7MvEkwl4Ge+4FFQVha4w
         +JVOx/QBGQU2PojjRJ93AGNduTGJOsFEyB6AS5K70cRUo2BgMF0hTKLc6qby7woKEFdV
         PK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTNn1oHcnqYeo0BAGvlebLyPolz2r02Hd43ji7jvC2qRWyCjJ1SrLWmjaKGweSbD2PNq1hr22vmDuJ9IogjoI=@lists.infradead.org, AJvYcCXB/Y+UhBGnlZIitPJQsc7eeT0u/MuMFwPWmM24VXf1oDeLVV5FSicgrCvU4wc4mlAaamJWH51KfbffuPULt0LJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbnymsl/MlsZwaEdbDnfiOYBj225GoKw+W86xbGkQD2ku3iB30
	kFoA3KtpyOG1WTbYQmCa/P7r39suw5rrJj1W0u00hcI8BGXIhS5D
X-Gm-Gg: ASbGnct/cY1OofcS/ijzhN7Iyur5JywpHFZNCM8z3O4RAV+SXorYKKeCVGgXilk3bot
	VSqWj7gnJpBD+iZCchUW0edIINRHQxHxO/Rajea4hRuNQnpYkcECDmlhh2fjLHLjpkh5e8fsdRL
	j86lrqTHlSWRuRtzUSwIlzxpxhTs13U0WZ7pUQFd5x32g3Pci6bBfIrOEzCd5lPYbeMMet3eji7
	qPf81QryW8WPzCx22svu04PMKuT1JnxRZpIvkrMuAOabBnrPXXeR472PHdIKF4gUw==
X-Google-Smtp-Source: AGHT+IHTR2hBzTrmzTq4eocYsWa/4g+gtB/KL9P+ADubc0lgHB1LE2z0JA3Lf2Omsp9qmYl7/gxbIw==
X-Received: by 2002:a17:903:1c9:b0:215:8af7:eff8 with SMTP id d9443c01a7336-2158af7f30bmr61814845ad.52.1733152344118;
        Mon, 02 Dec 2024 07:12:24 -0800 (PST)
Received: from localhost.localdomain ([113.30.217.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f1da4sm78524955ad.12.2024.12.02.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:12:23 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/3] PCI: rockchip: Refactor rockchip_pcie_disable_clocks() function signature
Date: Mon,  2 Dec 2024 20:41:44 +0530
Message-ID: <20241202151150.7393-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241202151150.7393-1-linux.amoon@gmail.com>
References: <20241202151150.7393-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_071227_103593_65503B57 
X-CRM114-Status: GOOD (  14.82  )
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

Refactor the rockchip_pcie_disable_clocks() function to accept a
struct rockchip_pcie pointer instead of a void pointer. This change
improves type safety and code readability by explicitly specifying
the expected data type.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v11: None
v10: None
v9: None
v8: add add the missing () in the function name.
v7: None
v6: Fix the subject, add the missing () in the function name.
v5: Fix the commit message and add r-b Manivannan.
v4: None
v3: None
v2: No
---
---
 drivers/pci/controller/pcie-rockchip.c | 3 +--
 drivers/pci/controller/pcie-rockchip.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
index 693aadc99d6c..fea867c24f75 100644
--- a/drivers/pci/controller/pcie-rockchip.c
+++ b/drivers/pci/controller/pcie-rockchip.c
@@ -267,9 +267,8 @@ int rockchip_pcie_enable_clocks(struct rockchip_pcie *rockchip)
 }
 EXPORT_SYMBOL_GPL(rockchip_pcie_enable_clocks);
 
-void rockchip_pcie_disable_clocks(void *data)
+void rockchip_pcie_disable_clocks(struct rockchip_pcie *rockchip)
 {
-	struct rockchip_pcie *rockchip = data;
 
 	clk_bulk_disable_unprepare(rockchip->num_clks, rockchip->clks);
 }
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 87041ed88b38..11def598534b 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -369,7 +369,7 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip);
 int rockchip_pcie_get_phys(struct rockchip_pcie *rockchip);
 void rockchip_pcie_deinit_phys(struct rockchip_pcie *rockchip);
 int rockchip_pcie_enable_clocks(struct rockchip_pcie *rockchip);
-void rockchip_pcie_disable_clocks(void *data);
+void rockchip_pcie_disable_clocks(struct rockchip_pcie *rockchip);
 void rockchip_pcie_cfg_configuration_accesses(
 		struct rockchip_pcie *rockchip, u32 type);
 
-- 
2.47.0


