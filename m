Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFF6CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	References:In-Reply-To:Message-ID:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zllnXd80rkp5aHt7G7/Ts91W3aw+U7xcISZlpRJwkn8=; b=s6lYMiTaj9CNtUmr4VBImw0xbm
	u3RIVwFK7vWLdw+lRYaoPwepLm0UddSh/R7COpHMseP2JoDHeKfZNe8VRXDwfrvsHAkFuv+AQ2Gd8
	p0WhO1MT22unDdQRhR6nvAM5Odj5wMQBtdX2aAS0wH/ozqn1SJdvu88f9WZZgdbjAgGO22GqUGboq
	dNdriO+Tr7ICXlCFcYAdfPjDVc0Ikr/gwilzv0cURPtRU4o0d7naqmspFgavqinLTA/P1yYf55W01
	QVL2azYepwJp7/+z4Zl6LLwkHfvuSGUGtoYcwOBy5r4CpGIJ31aM/KGkIqUUTYpswDdWZG1RLsJzF
	2tSgz33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Q2-0000000GN7b-40vO;
	Mon, 18 May 2026 17:06:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP1Pz-0000000GN5u-2Y69
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:06:16 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c8028fa6039so1733799a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123975; x=1779728775; darn=lists.infradead.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zllnXd80rkp5aHt7G7/Ts91W3aw+U7xcISZlpRJwkn8=;
        b=FUgxldQfrSwUJQ68LsfDrJxDFeVI57Da5VAeIeVlDbqm/d1UE6Tm3wYd3QB9fcedDI
         KvBllUK6GSV32CJU/jmmRbsoRdpUCFWxaVUxqLFMkksV2tH8yBA85NeOdklWzTRVpqn0
         IFfS9aR+J1we1w57SX0JXJIwD/bRh/Ku56nIYaqfkqBk27u28wwCrZhMkTB1wVU+5qmx
         4DncYgRYj9x5WmGpYefksqn1t0Nxd4aiauu4niGI5IQxUWwLMC5lR5ol8QvM/sc5/lxm
         PdpcqTi5A4ncCBydlSMzDh6iq8LiYHBrHvjvpBJ6Pq6X37dmD/+yiatfDm0ote7xlCxJ
         eYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123975; x=1779728775;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zllnXd80rkp5aHt7G7/Ts91W3aw+U7xcISZlpRJwkn8=;
        b=LDilVEI1nF4uMWOJErcOh7pe2aKbHzU8UakXlWvSChTnxAEbJ+auhV+wlcQIPQjKml
         3it1C1Z1po+yOIseNsNuCZSmXI3OugTkvi5G3OW3A19tAtt1XsEpvFyOzwPYrflT10k5
         yVyU0pGrKExcnOw2ksgaIh+xiAicE3hghs29iTuzxU5zkrTMrOox1kSGl9YnME0+l7HA
         FEQM1mSmU9OcRxPrX1x4YEde4R9D8dLQbS4gu3P0TD5wtMp6ace9IS8XjfU9IO4Aqa+6
         gMX7iPqBocvTQJ8ilq61Xc6PNCqMtZ+h24CrPkBjbG58JIN57+rOdsy/DGoXCgO7T3Vc
         MjsA==
X-Forwarded-Encrypted: i=1; AFNElJ+iLUGsnN14sbfc2iFsWlM7vLOWIES6r9s9aY3cg+HlAABbvqEPMsaV+AJdeXLL4b69MxCgpvqfM/oZQimOYUn3@lists.infradead.org
X-Gm-Message-State: AOJu0YxeF+cA/ImE4MGSJGkBwI4tBgCaADYu+/GwXpjCcpburuBEUSo4
	V4/TTdM905r5Stsksrq8ZFccn9Kxw3URjdfPQuUv4UaKxZfNDQeqqSq4
X-Gm-Gg: Acq92OHfw3Ng7HWl9xECfMByHVoBowi5p/VBgxixbMRtUXspcvGWrsmifvkmHvwvyNp
	pC9mL63maKPeB6yhCWZNjl98IMP4mjlaw4e1LUjLRilQ+iVkmBdP+0y1APVCIwt9iE//HX6EcNx
	9CjmTJ9Z6am1WsXakPVsq+siPdMOKUlYz7mp8xVIzO8f0qJvmV6qmc72zR8f/dNX8GOuI/pLPSF
	gDQKrrsYhtwWFVaeXvIiWLbY0/bfyvl3JcaePQTFBRCKXcDqNz1P0JRjrvuAeCufa1M4mAW40uI
	p8XneG5PZeIcJGdQS4gMv6VE9tXMjfFClEQ9988On8lB5XQUrQz2FlmFWDq4/pJWqlv5ZzXqqj+
	lgId+r/nhmaI0ENMLj09gHHAAya4GxSyAz5ii3h7vdVOBSL0S5oqNWmJsjei428yJzYQXY3r8c+
	LcTtX6JaYhsT5VXqfGe6W/N6iMrUVUu230Lm5jIzx42JFaAXcWwZj+iD6i9EB1pkunFjicMGK7k
	I+Dda3Gtlm/krEwAg==
X-Received: by 2002:aa7:88d1:0:b0:83d:b0a0:90e3 with SMTP id d2e1a72fcca58-83f33c344a1mr16612881b3a.31.1779123974543;
        Mon, 18 May 2026 10:06:14 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([110.44.115.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7ed3fsm14932377b3a.45.2026.05.18.10.06.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2026 10:06:14 -0700 (PDT)
Message-ID: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
In-Reply-To: =?utf-8?q?=3C0f97352506d8d813f70f441de4d63fcd5b7d1c3e=2E1779123?=
 =?utf-8?q?847=2Egit=2Eshuvampandey1=40gmail=2Ecom=3E?=
References: =?utf-8?q?=3C0f97352506d8d813f70f441de4d63fcd5b7d1c3e=2E17791238?=
 =?utf-8?q?47=2Egit=2Eshuvampandey1=40gmail=2Ecom=3E?=
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Mon, 18 May 2026 22:44:18 +0545
Subject: [PATCH 2/2] PCI: meson: Add missing remove callback
To: Jingoo Han <jingoohan1@gmail.com>,
    Manivannan Sadhasivam <mani@kernel.org>,
    Lorenzo Pieralisi <lpieralisi@kernel.org>,
    =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
    Bjorn Helgaas <bhelgaas@google.com>,
    Yue Wang <yue.wang@Amlogic.com>,
    Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
    Kevin Hilman <khilman@baylibre.com>,
    Jerome Brunet <jbrunet@baylibre.com>,
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
    Fan Ni <fan.ni@samsung.com>,
    Shradha Todi <shradha.t@samsung.com>,
    Hanjie Lin <hanjie.lin@amlogic.com>,
    linux-pci@vger.kernel.org,
    linux-amlogic@lists.infradead.org,
    linux-arm-kernel@lists.infradead.org,
    linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100615_655097_A46C7C5C 
X-CRM114-Status: GOOD (  13.64  )
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

meson_pcie_probe() powers on the PHY and registers the DesignWare host
bridge with dw_pcie_host_init(), but the driver has no remove callback.
On driver unbind or module unload, the driver core therefore proceeds to
devres cleanup without first unregistering the host bridge or powering off
the PHY.

Add a remove callback that deinitializes the DesignWare host bridge and
powers off the PHY while device-managed resources are still valid.

Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f6..c96e2244a 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -451,6 +451,14 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void meson_pcie_remove(struct platform_device *pdev)
+{
+	struct meson_pcie *mp = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&mp->pci.pp);
+	meson_pcie_power_off(mp);
+}
+
 static const struct of_device_id meson_pcie_of_match[] = {
 	{
 		.compatible = "amlogic,axg-pcie",
@@ -464,6 +472,7 @@ MODULE_DEVICE_TABLE(of, meson_pcie_of_match);
 
 static struct platform_driver meson_pcie_driver = {
 	.probe = meson_pcie_probe,
+	.remove = meson_pcie_remove,
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
-- 
2.50.1 (Apple Git-155)


