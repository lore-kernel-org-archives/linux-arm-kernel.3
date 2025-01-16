Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AE9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGkU0y7pJZv+v8DToqjv/dfjh/wj53E5TF81NIqkitU=; b=JEJZFWXN5GLzFoqoR1S5rObZ++
	2BISh4eTfKooU/gvi3nHAp21U7Mcc1F+aWtysGXuAfi0YMN7OwAuE8OlA38PAuUZ0vwNvoZ1IzqYG
	7YszEQPyaR60EBqL1VzlgZ9ApeL7zQ0QYhsUgS/Yb3ePsuxh4nean/hfFIxhWfsp/oWjQiMXBva4r
	TshT+zsp+wlyAdDyTCJ+Lu5kLzNCVF3wlWLUF8v0f1YnRUsTCjA2AG9UWsxgyctUHyFrKEDKDnmKX
	R7c9nQgABYLFCu/+IsxcXBzwfUf49nn8TZjjP5DKBbAzzSt4drMGbEh3UNsZX1Asqb2dDRk/bwp0a
	A1nYGrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVog-0000000Fvs8-2R8E;
	Thu, 16 Jan 2025 19:46:10 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVnQ-0000000FvaB-1F2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:44:53 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id ED087C003AAC;
	Thu, 16 Jan 2025 11:44:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com ED087C003AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1737056690;
	bh=8v9mULLUI2zAoxGeGM2bMkwyZL9ROiSzuwJKu8SZEwE=;
	h=From:To:Cc:Subject:Date:From;
	b=hNPRVj9pcHgFu2kSnD1cjamUQf/Z9BDzyilypaZLMHgGwdb/Soll1ngRfo63hReJI
	 oKQbRaxWRpUJlHreX9REMOXGMU3q34tfsdzRX1EDKcA/R/tG86kHjfR4GA3ms1vVE/
	 lPXY8PujMG30Fo59n9/F7u1nHrKKLHsMKauCco4M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 6DAC918041CAC6;
	Thu, 16 Jan 2025 11:44:49 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org (open list:BROADCOM STB AVS TMON DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 0/2] Thermal support for BCM74110
Date: Thu, 16 Jan 2025 11:38:40 -0800
Message-ID: <20250116193842.758788-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_114452_485838_EF7E169A 
X-CRM114-Status: GOOD (  10.47  )
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

This small patch series updates the existing brcmstb_thermal driver to
support the BCM74110 chip which uses a different process node requiring
an update to the thermal equation.

Florian Fainelli (2):
  dt-bindings: thermal: Update for BCM74110
  thermal: brcmstb_thermal: Add support for BCM74110

 .../devicetree/bindings/thermal/brcm,avs-tmon.yaml    |  1 +
 drivers/thermal/broadcom/brcmstb_thermal.c            | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.43.0


