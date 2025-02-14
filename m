Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5WBjTrVITVgZYhJvGdqnlQGu4S0yfOA3QhZ3ApzwhQ=; b=lbEImFDYf07JaUrHZAH0rPq2UG
	6QR5KxWgtPdT+9UXZjiYifFWQpo2NRr/BsawOlJa1fsecGWZ1BOapr7+rsaB9tIOU+emCWi3uXLew
	csLogW91kMxLPvWXgM4XicgK4SW8MSRDL7DNy3l4YFgGXZ2MsAjQEEFsraU3aZ8G1T3pt6DziJhcQ
	Eave/wK68jX7SXfdAQi3y2F66TvY+WM+fMpsS8ZNx4qZqwHg8bRPwSbyTCapUZPt10jCj4CD8rc0I
	71DKa4/HImRZ/33Od8ZnHlFELJjK0NFO9HhylY6wFG1clwp2JJkZXB4OxV2AG7GcnR/NKIgNsoFaC
	uaCmDA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Lt-0000000FrbO-0ned;
	Fri, 14 Feb 2025 18:23:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfU-0000000FkWM-3M0k
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K5WBjTrVITVgZYhJvGdqnlQGu4S0yfOA3QhZ3ApzwhQ=; b=QtknJRjuKiP1Mg+8g9cEjOYGZ/
	LmcP3niKSWH059zB6W4ahjk90BX9AWtETVpcH5FeNAfLEh+W6ExT8UHxJjNKOCIjOvD2mMSvupkD0
	neZFw8fzxVw3k1aag/wlz+Gu2B1BkOoSu3UKf/zbgGfvmCzW2f3zjAdKYGkDp1sWjrmsV+9AeGMMo
	9fLShUUqweOnvTieqhmIa4V8pvTK/HgjTSFM6tptXTy2Ui6TveQP1gywj6ylRQFXVBLZPvPlIykoQ
	KHoopSHgSDy2Jnbyw8Jo4fFBTd4gNb+hM1FPqly9VK0E9Jci7kGKr2G5SnBd9knbxtRVfePbA2eOB
	0eQM04Xg==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfR-00000001IDM-3e81
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:39:59 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5fca2d12020so1469892eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554795; x=1740159595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5WBjTrVITVgZYhJvGdqnlQGu4S0yfOA3QhZ3ApzwhQ=;
        b=GygXqYtaCQJq0VPPUsnnu8YM/6+EkuJPJ2BQIfusiJeLyWxKMmI0dupr8dBopaCEtD
         85Gkxc3pymsnOvlrdbahNgLwdKE6j1bWLTeZRLKIa1mCDhxca94/Xu93fqjScPFUpwgC
         Sleyv6wB6IHuiILZ7zG6HAyL6FO9WxcbjqCIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554795; x=1740159595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5WBjTrVITVgZYhJvGdqnlQGu4S0yfOA3QhZ3ApzwhQ=;
        b=kAwLAhjmNg3s3JHvq+YCt3OXcKEtEhgo9rL2ttFush6/SMekbTuuX3Azj7u9qps/sq
         1PcKXrk5e3yvxL2jkM2xBDcv0EU1LRYoQIHOfpa9ZksL6/qnuEw/sMynz/l6JYrhmm04
         zyaOsQCqWO8Bs7YdyCNlPOl+eB5mL9+OorwDzNf2R9DgGJD3me9Wz/Qa7z7mYhEsbw7+
         LS4jgjKZ3TiTgdXYfQWK34DGcICX+SR12gpXQpyufNIB2zpDnsc/U5MYxHYr3V6NFQEb
         Gn3EsC6F0xfhglZl0F6MAl+lJiqTW/mOpMxzP6hQw3NpHvzmZ4L/2FsGaxRef+/KwoZW
         DbFw==
X-Forwarded-Encrypted: i=1; AJvYcCUjt8zx79sDjAhbHpaL7Xb623lVyehrS6CY0Mib29CprQd1r8XfoWpIp2PpvU4HUi+NpMFAY5LyAgpF7dyFr5ws@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMKCYG1ryvs7VxFugjqlDSideNkiX06X2aYme2Ekmkqfl4hfW
	uSvobHaCDK+fDM4gSyIs2gWij7l4dzM1S89r0WTVr/u8CNJX3XIb1UU7FOLOBw==
X-Gm-Gg: ASbGncsBtOcxIPMBueISGy6OeJ9Equn4l6xO1qHQ1pHGSUUQmp1Sc8v9xZVbrRUI5pK
	77cskpRk+iZjDCvpNAZc27gYYfByBUnysb+0/5x5psNvuiJ4juBc0Ql5efPWGpQ3worbJjc6sBO
	b+0VOrhWcogTmn9hvrhRtsFlLT4RL1NoQGXb8omsFx23N/1ZH9Vl3B38gMSX7EIx/yTQQCoAlIk
	9hGA/POqEtpkA56O4tHNCNVmmPJP5lI/UHub4pr9fub2hsXexU1u3T37BpNUwstql0sKYdWmBFq
	Jy2t52iuifHA2oIP4VyCZJU8/Zvem861h4mhOcFYOaDhz97zUTdsmmsBgDzm5Q2QiI7euk0=
X-Google-Smtp-Source: AGHT+IHHLIOPe+42yxDSEg6UPq/HyJpzpOJx8RHpCQuMziDQFg6kMun+TwGePYtgASMBwGxG/t8jXA==
X-Received: by 2002:a05:6820:160a:b0:5fc:c1c5:873a with SMTP id 006d021491bc7-5fcc54fd122mr31501eaf.0.1739554795496;
        Fri, 14 Feb 2025 09:39:55 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:39:54 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/8] PCI: brcmstb: Set gen limitation before link, not after
Date: Fri, 14 Feb 2025 12:39:29 -0500
Message-ID: <20250214173944.47506-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_173957_981050_C112D2E7 
X-CRM114-Status: GOOD (  11.88  )
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

When the user elects to limit the PCIe generation via the appropriate DT
property, apply the settings before the PCIe link-up, not after.

Fixes: c0452137034bda8f686dd9a2e167949bfffd6776 ("PCI: brcmstb: Add Broadcom STB PCIe host controller driver")

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 546056f7f0d3..64a7511e66a8 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1324,6 +1324,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	bool ssc_good = false;
 	int ret, i;
 
+	/* Limit the generation if specified */
+	if (pcie->gen)
+		brcm_pcie_set_gen(pcie, pcie->gen);
+
 	/* Unassert the fundamental reset */
 	ret = pcie->cfg->perst_set(pcie, 0);
 	if (ret)
@@ -1350,9 +1354,6 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 
 	brcm_config_clkreq(pcie);
 
-	if (pcie->gen)
-		brcm_pcie_set_gen(pcie, pcie->gen);
-
 	if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
-- 
2.43.0


