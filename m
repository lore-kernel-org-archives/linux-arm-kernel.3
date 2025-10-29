Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F09CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=U8SkCPdYTPadYRj6j8r4FflnJm5Mydb82s1/8rVUOFE=; b=u+gbQ/YQrR5jyR
	lXvkexlmxpyrgmSSuY05oWsJ1VdWvGMpxeoXp+a707tsq+cYa9V3YzJma3fEHBs8is08qZmYSwWFU
	mr5HZHF94N1hv/l8kgsehybMu4FWlKyaxFri7Za3Sne0WOR9Z2V+k+Mqh25ZjckSgzQ9aoU8KQrC+
	3mRmXFmoJFnUi+eX0R76qo0eXQj/pDmYFTq+FjSU2RQnM83Sgx7gQ1HwgqXa1O3hJu2Nu7Y01PTfl
	dEDXbxnQdwGVl+OS28gf85qcJ/dzz8c7zhb5lYKXJqARubdYw3aexYWZaOvS0CgeUXfjw89OFkLbE
	ytPNXFeFB3LvgD7wmWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5lC-00000001FvB-288i;
	Wed, 29 Oct 2025 12:58:42 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5l6-00000001FsQ-1rYi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:58:40 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251029125825epoutp028d4d17fc83a6eceb1d222378a3dfb96b~y96f6NKGp2841928419epoutp02q
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:58:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251029125825epoutp028d4d17fc83a6eceb1d222378a3dfb96b~y96f6NKGp2841928419epoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761742705;
	bh=U8SkCPdYTPadYRj6j8r4FflnJm5Mydb82s1/8rVUOFE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KXLi4lY1tjmXEABU369VxAzZ6aH+Cj56CWhsgPn2AAKuhcRlskhXKvtOr8JOa0zAs
	 8KNdB39oDEQycieHcpUFrOma+hi3oTYpPTDudPcR58eXe7YAje2XqI9PZKEz0Hlosv
	 N7SFoxrdrv+4BI2ejxkHnUiP/e1Rnu4VzzWN5oS8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251029125824epcas5p236a1c26bc6ce4baebf2ae1cc6cb7bd87~y96e-cNM60929409294epcas5p2-;
	Wed, 29 Oct 2025 12:58:24 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cxS3M12QHz2SSKY; Wed, 29 Oct
	2025 12:58:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029125822epcas5p2aa18b39467dd109a8aa134894f7d1fa9~y96dULaBN0929409294epcas5p24;
	Wed, 29 Oct 2025 12:58:22 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029125804epsmtip1ddffb39cab2dbd0730b45be9ffe04aba~y96NKD6XR0781907819epsmtip1Y;
	Wed, 29 Oct 2025 12:58:04 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH v2 0/4] Add basic clock and pmu support for the Axis
 ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:26:37 +0530
Message-Id: <20251029125641.32989-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20251029125822epcas5p2aa18b39467dd109a8aa134894f7d1fa9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029125822epcas5p2aa18b39467dd109a8aa134894f7d1fa9
References: <CGME20251029125822epcas5p2aa18b39467dd109a8aa134894f7d1fa9@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_055837_152970_3A123A7D 
X-CRM114-Status: GOOD (  16.40  )
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

Add basic clock driver and pmu compatible support for the
Axis ARTPEC-9 SoC which contains 6-core Cortex-A55 CPU
and other several IPs. This SoC is an Axis-designed chipset
used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

This patch series includes below changes:
- CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
- PMU bindings (patch #4)

The patch series has been tested on the ARTPEC-9 EVB with
Linux Samsung SoC tree (for-next branch) and intended
to be merged via the `arm-soc` tree.

---
Changes in v2:
- Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
  Device tree related patches will be sent in separate series.
- Fix the division issue (in arm target) reported by kernel test in patch #2

Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
---

GyoungBo Min (3):
  dt-bindings: clock: Add ARTPEC-9 clock controller
  clk: samsung: Add clock PLL support for ARTPEC-9 SoC
  clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

SungMin Park (1):
  dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC

 .../bindings/clock/axis,artpec9-clock.yaml    |  232 ++++
 .../bindings/soc/samsung/exynos-pmu.yaml      |    1 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-artpec9.c             | 1224 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  185 ++-
 drivers/clk/samsung/clk-pll.h                 |   17 +
 include/dt-bindings/clock/axis,artpec9-clk.h  |  195 +++
 7 files changed, 1847 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h

--
2.17.1


