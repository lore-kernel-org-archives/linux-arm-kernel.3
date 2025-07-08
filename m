Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04A7C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYx9OacBVBa54WJ0T9dZVtR9yyPRztsQPBVP88TZZyg=; b=lVaGKbBGpDOvhlCH4MFryn17D8
	72CtwjK3i4IHfAB4T2JH0FOBzMmLoSzewaPf3bisVkghV7K33xozFEW8tMV+yJigpbp5Ow8Y9OE4A
	FZIqUlozRWDkhEEHYRh8MCx/8rNEXDQlAIlkBcy3WLk3odllGxnXhqCXHtL3I6MuVH+7OhCo8CdTn
	fqm9eul7A4hBZmMI+Q3gkVxdis6pQeAe/Y+VFZqJ/NwN+eNG94lq9sWlZXZ36BeCc2VLhxA0STlzG
	6lULYDPbUf+yi88uOWpGunx26guJlEooqCHX+vSYUUeyLYYy3LoqmK1WGkPwndVuov55MqaEaCv3H
	3K8N/HpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA5-00000006MeF-1bPP;
	Tue, 08 Jul 2025 19:39:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCs-000000067p8-20At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25C1D4690A;
	Tue,  8 Jul 2025 17:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07334C4CEF9;
	Tue,  8 Jul 2025 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996053;
	bh=k98cYHJAeNwc/m55APAuSnpJZEiaO0Z2w/xQyAaUaQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IV4bEwXAd6QJ9CTtBJgb/ii1pxuW6HZTrwYYMCijBt7Ysj8qoqFDRF7YUlNqZdeqb
	 S392K0a3iUUf0fjSdZ4eZJQxRgbHt86LJLl8rKCBDKRXkD5osgbROfDZRT+BCjBC6M
	 iBlOzcV9lZ8WwcRZyAfmagRmaN1Z/VkIt02dIHdEvZSREfD5tCIvCokY1nOtbD5gVI
	 jFGuFL6NRzHtu8wXDlAPfowCBGj7TB1ph5mq0DYeMeQtVVHvg4CZmD5bxK5pInLC7h
	 U3v0uIC0JfRoQReLHaoUA4ktriybfCEv3ZXOYYfQ9jsfVZzzt4lurEizyt26Aeotz9
	 QzxyLMZxNLSdw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCp-00Dqhw-6n;
	Tue, 08 Jul 2025 18:34:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 13/13] cpu/hotplug: Remove unused cpuhp_state CPUHP_PCI_XGENE_DEAD
Date: Tue,  8 Jul 2025 18:34:04 +0100
Message-Id: <20250708173404.1278635-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103414_541057_522986AC 
X-CRM114-Status: GOOD (  12.30  )
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

Now that the XGene MSI driver has been mostly rewritten and doesn't
use the CPU hotplug infrastructure, CPUHP_PCI_XGENE_DEAD is unused.

Remove it to reduce the size of cpuhp_hp_states[].

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/cpuhotplug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index df366ee15456b..eaca70eb6136b 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -90,7 +90,6 @@ enum cpuhp_state {
 	CPUHP_RADIX_DEAD,
 	CPUHP_PAGE_ALLOC,
 	CPUHP_NET_DEV_DEAD,
-	CPUHP_PCI_XGENE_DEAD,
 	CPUHP_IOMMU_IOVA_DEAD,
 	CPUHP_AP_ARM_CACHE_B15_RAC_DEAD,
 	CPUHP_PADATA_DEAD,
-- 
2.39.2


