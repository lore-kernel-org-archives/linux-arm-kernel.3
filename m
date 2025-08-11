Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A76C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2jQId8J7hJCUUyc0leXs7a3GHenaf+1ZJSfH2NICKrs=; b=0SLvtb+uf5m7vUWFo/6S6OQO7b
	me7+Stm6/YuBLB7Eze9WoEqjrKKattKrtW4uAX9oj8icND4vHvbVlWyQb/hq5ifI1wQ0vfW0bTSuj
	63P3hnNf1+hDzNO5IcpHfJcTSF0gmN/oOY5pIwkVhpef6aA8VnW4RDe+2NtaAoIryruY0N6sLYea+
	Kxs83VfF8FaewghyzAEnL5gVP+bBvp8pEOlW0SvJTW/vjPvnML/kTUrxeKw6BvYVb6AHhzzLYZU2C
	IAo0Vkk8TMczlXnXm/zMyU1g28kjI1FjxyFZHnbteIx8aym76Z/+xpMDrhzcDHTIQFh4rKLcKWh8+
	Fe4MlCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSeJ-00000007peC-2WtU;
	Mon, 11 Aug 2025 13:33:15 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSbi-00000007pR3-3Shk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:30:36 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BCc97o032379;
	Mon, 11 Aug 2025 15:30:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=2jQId8J7hJCUUyc0leXs7a
	3GHenaf+1ZJSfH2NICKrs=; b=5WPhiOz83OFz+h3h9LpGnHuzXRzWvTfDuQ9gSk
	lTFPf2PEZOLv7hBu3bcXzMvyYDpXFELxQqD5DFmLUMX6jLPy0nEE7Td7LbnkO26u
	LSLGaJa70dHEuEqjRixHCFL8QraoltOuUMKWjxeKvBlRwyNsZQuLTPOrUT1ecr6E
	BgxMxlYoy8vu3hIYrG6/65mc9Qa6B+31r67Wmr8EdH/xJajOUIxAs7w+JzyQinFv
	576ZurbegUwBMjfS8CyfIdbpcBabgLjw4CfhXEZ5PnVO02z4LlT8izeVVyacb/uu
	SZECueEu+JJIgB9hmBvVsmwfKfXH7ss1al7+2pH2AzohZXIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48durkxvex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 15:30:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D85F4002D;
	Mon, 11 Aug 2025 15:29:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0449C73D3F6;
	Mon, 11 Aug 2025 15:28:54 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 15:28:53 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 11 Aug 2025 15:28:49 +0200
Subject: [PATCH v3] arm64: dts: st: Add memory-region-names property for
 stm32mp257f-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250811-upstream_fix_dts_omm-v3-1-c4186b7667cb@foss.st.com>
X-B4-Tracking: v=1; b=H4sIABDwmWgC/4XNSw7CIBCA4asY1tIMWLC68h7GNC0Py4LSMEg0T
 e8u7UoXxuU/k/lmJmiiM0jOu5lEkx26MJY47HdEDd14N9Tp0oQDF9CApI8JUzSdb617tjphG7y
 nCkD28gQ1t4yU0ymast7Y66304DCF+Nq+ZLZO/4CZUUaNbBQTRtec64sNiBWmSgVPVjLzD4axH
 wwvDIC1QsBR9lp8M8uyvAEJ7sqLAQEAAA==
X-Change-ID: 20250806-upstream_fix_dts_omm-c006b69042f1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063035_164790_01442F19 
X-CRM114-Status: GOOD (  10.98  )
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

In order to set the AMCR register, which configures the
memory-region split between ospi1 and ospi2, we need to
identify the ospi instance.

By using memory-region-names, it allows to identify the
ospi instance this memory-region belongs to.

Fixes: cad2492de91c ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board")
Cc: stable@vger.kernel.org
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v3:
- Set again "Cc: <stable@vger.kernel.org>"
- Link to v2: https://lore.kernel.org/r/20250811-upstream_fix_dts_omm-v2-1-00ff55076bd5@foss.st.com

Changes in v2:
- Update commit message.
- Use correct memory-region-names value.
- Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
- Link to v1: https://lore.kernel.org/r/20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad4066544445e93db78557bc4be1c27095a..7bd8433c1b4344bb5d58193a5e6314f9ae89e0a4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -197,6 +197,7 @@ &i2c8 {
 
 &ommanager {
 	memory-region = <&mm_ospi1>;
+	memory-region-names = "ospi1";
 	pinctrl-0 = <&ospi_port1_clk_pins_a
 		     &ospi_port1_io03_pins_a
 		     &ospi_port1_cs0_pins_a>;

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250806-upstream_fix_dts_omm-c006b69042f1

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


