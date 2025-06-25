Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692A2C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UT9+9Gn2wSD5nWtQbJ0zo5ey2zcYV8DLHJ5SerRYtF8=; b=YKWwDMIfWW7Z2r
	glbL+fHlBY0w8M2jyLxCR5cXkyRv67qCZLPN7O+ACON2H/qTBcT/g1UO/4kGWRJnapqPw0jeI0iYN
	IUU9BvbMA0AQQeMKLfR40ies4PEGcqA9OWQZqc8MHx1nPbUc5n7RORpQbNg0QR7x3ur1f1fbr1dne
	IozIY4D4FqRRMzDgs6LQRl3IDIsg2ln7+dobm5iPgN1QEmEGaiLMz2sh0jHTNT9S3ReqcNrTBblAr
	/AozdRtvanPW0nY8d8E+ep3H/K+11iMg2ECQh1GVkUsPQ0VIaltkB7stx/cpDASVIuJ8AhYOnz9CU
	VLvxdBzVq4odf7jRo1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMzP-00000008FGO-38qn;
	Wed, 25 Jun 2025 10:04:23 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUM8S-000000084uw-3qWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:09:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5D7Kw032751;
	Wed, 25 Jun 2025 11:09:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=UT9+9Gn2wSD5nWtQbJ0zo5
	ey2zcYV8DLHJ5SerRYtF8=; b=tm3V12jFviL5Vwushn83ZA9Dv/tDXPRoigoGCi
	5RR4GGlpjmkasxNH8ry0jAYaAoHNFRCabhINrezrmwhPM+TCmWmW3SGWUZdABfkw
	zSubOA553R6bBLrIyFy/leg/WhpNYPzsy5zQJe2+iWGv/45vUU6ah521QfjINUwf
	EDGVaeKHFnB3+yJDrU+n2lC/o8bIDPPXbwRsjlDG2tHaNjhTWD6DPWpIwhKqfGVs
	gr+Zgh6vd0QzX7gk9KfDq6gIK56LcHdTMu583R5PWLZsuocNe+13JNvb+SLG9bWQ
	A0vf68pgECojyUDK8DWtIa8tW4bHznvW7H7cU0jCbryvobpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33hfpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:09:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 801C840057;
	Wed, 25 Jun 2025 11:07:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB5A6B28419;
	Wed, 25 Jun 2025 11:07:32 +0200 (CEST)
Received: from localhost (10.48.87.144) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 11:07:32 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH RESEND v4 0/3] Introduce Clock and Reset Driver for
 STM32MP21 Platform
Date: Wed, 25 Jun 2025 11:07:23 +0200
Message-ID: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEu8W2gC/33OsQ6CMBAG4FcxnS0pV2jByUFWBx2NIbUt0gFKW
 iQawrtbWdRIHP+73PffiLx2Rnu0WY3I6cF4Y9sQkvUKyVq0V42NChkBgZSkQPCt873ToimdlGX
 TQYwVyRhoriRnOQp3ndOVuc/mCR2KY7HfoXOY18b31j3mqgHm7R91AEwwlZwzwXQaGraV9T7yf
 SRtM3sD/TTiJYMGQwqZq6xiVAH5NZK3wQgsGcnrD8ouCfAspkx8G9M0PQEpw8XjRAEAAA==
X-Change-ID: 20250520-upstream_rcc_mp21-d0862e7dc769
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Nicolas Le Bayon
	<nicolas.le.bayon@foss.st.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Alok Tiwari <alok.a.tiwari@oracle.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.144]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_020941_248206_E210CD10 
X-CRM114-Status: GOOD (  10.88  )
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

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.

Changes in v4:
- add missing fix : replace double '::' by ':' from dt-bindings documentation of STM32MP21
- Link to v3: https://lore.kernel.org/r/20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com

Changes in v3:
- Fixes dt-bindings documentation
  - drop minItems for access-controllers
  - remove rcc label from example
  - remove double '::' from 'See also::'
- Add patch to report these fixes to STM32MP25
- Fixes typos in RCC drivers (Alock)
- Link to v2: https://lore.kernel.org/r/20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com

Changes in v2:
  - add list item for access-controlers and fix maxItems value from bindings
  - drop STM32MP21_LAST_CLK and STM32MP21_LAST_RESET defines from bindings
  - typo fixes from ALOK TIWARI
  

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (3):
      dt-bindings: stm32: add STM32MP21 clocks and reset bindings
      clk: stm32: introduce clocks for STM32MP21 platform
      dt-bindings: stm32: cosmetic fixes for STM32MP25 clock and reset bindings

 .../bindings/clock/st,stm32mp21-rcc.yaml           |  199 +++
 .../bindings/clock/st,stm32mp25-rcc.yaml           |   13 +-
 drivers/clk/stm32/Kconfig                          |    7 +
 drivers/clk/stm32/Makefile                         |    1 +
 drivers/clk/stm32/clk-stm32mp21.c                  | 1586 ++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h                  |  651 ++++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h       |  426 ++++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h       |  138 ++
 8 files changed, 3014 insertions(+), 7 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250520-upstream_rcc_mp21-d0862e7dc769

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>


