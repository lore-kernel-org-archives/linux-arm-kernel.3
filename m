Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B352F30285
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I8lK/jFsX8Txi9GeJEbVxSW0DkE3zVS/e3Q9wmYpTro=; b=e/9MayvBITe5oZaI2tT1E/KIAs
	9l1JFGnDbUQmmSsP5bGIvS6gBEWtqY1hMl21p6wWLPEWMSCvQhiPpTs9PUNrLSoIXiLIcJWiHsNs1
	ocAXFnSXkqEXif10VMQTzXpatB82Nl0N92yJ91lKWBttTt/HdQ2hSG8IpnmjdwFQtlstHt/E34S96
	bwxyBFgnCw3oxJzFJiP8eknw7Dk+PJqAkHbwaZ86/bVwTwNEkjy3wseI+J1NNn+bP6fjNDLTIV37S
	v2tF811vI2uoz38T627cMkdTG7nV15+zdIr6SDateaOAiQ5iMm8EOHfLV4XiiYzLxNa3PvVneig0F
	pi6BIMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaK-00000002pOv-0cwR;
	Sun, 15 Mar 2026 18:53:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGn-2xZ0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F324C40B78;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1770C4CEF7;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600772;
	bh=o4sD9z+DOoFeCBJ7SrXYHJ3jpMK6dfrsLjScjTrYeek=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tKhXCPf2GQT+E+C8PX+LlsT2TS0EDRQMxLyIWA9ZTCMJQVeG5TAvUFGfQFGPNwnfB
	 iY3JzHRxmkn/RB+I//IoldWAy+vh6/UIo4tlyDYD+RVbyWhXpcCuangPQXSmJxO0dZ
	 KRhrCrtyngk9q+fbXv1IQWJ/MHuFalRO0m7qL8UA5Q9bmL9EaF87eKt3lA19lXrAS0
	 4BKfGhMsTnFJGZ8tOmmXNA8wqNbmgIlcGmi3EKAyOhJ3AZnlKSEgWtdhUtyQErNDLu
	 nHajTnU/HxzeTwcfIvvG881x0rtuX1cNL5iPT8UUg/lVvQe/qaKqMtKWXLw0PbbyIq
	 ljFBXRf84p2Dw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8ADF30280;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH WIP v2 00/11] Input: support for STM FTS5
Date: Sun, 15 Mar 2026 19:52:36 +0100
Message-Id: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPT/tmkC/z3Muw7CIBQG4FdpziwGDvSik6ubm4PpUCi1Z7A1Q
 Ei14d0lDI7/Jd8O3jqyHs7VDs5G8rQuOeChAjMPy9MyGnMG5NhwFIr58JqCr5lWrRRi0mMrEfL
 77exEW5EecL/eoM/lTD6s7lP0KMpUIMnFH4qCcYZoVN3p02Ca7kIbhaP5Qp9S+gE5EevqoQAAA
 A==
X-Change-ID: 20260214-stmfts5-b47311fbd732
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=o4sD9z+DOoFeCBJ7SrXYHJ3jpMK6dfrsLjScjTrYeek=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5jsfTlXQXhPhxCDEmBDtICy4aS4OGijRGR
 eKk3Yv8mWuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cqgbD/9XPEettkTdq7HsP8ymzT+1/jEZLNLoqIu8npKK7gPL2EhVadWpF6N8smn+5TjulTrCvJB
 YMf6zNPtF1qnBuR1eucX94IPn8RXaen5eNvKXcQ8vBZSx+PHMdJeUa8UqEY2+Rb2Zo5epFcKWno
 dFPzqn874nsJOb/2QC43eFaiiSL6g06RLbNJStWnEGRH9UVXpbw4N8IhjUpjwbu/aw0aMNXLUUV
 yhL6s5N9n51+ZNWsIATdwfj2VkX8WFRKg/ontk7eKcJcsQJcVvZrrO0zBa3VvnTNmQVkc83FWvw
 1ypgCNDSQHQkhGupxGEAJTZJcHcjf+0mDya65u4kKZU/ngeQr8rrReJ0PtRe2Q1cNU21bsNVt2U
 ryZGszRXz1QG2kwQugOVEWlrqspr1roU0Z8ErhNLyvTPA3uyvlhoweq/dfSxkpfvRrduu6ApMKN
 8FoUPiQAe21HjeHjdmMmEPyYEpfHe8OluUsssqbUnp6EMbQAifvHgQYut2sXsJPXnrGvligcH2w
 K580k7rJ0Qzo5sc0yHq6RVAgK0b5yL3CgJfTb8hNjHAn/NOQKSDZf58GZfuDWB37sgmsiE94V9M
 lDBhb+9f8Teo3VH1DnpJk6Ar+rsqUoWUnAZQAJd/Vww6Q/XQwAMQz5VrrLBqvNddGlqHru8lbcF
 iG3eqYq0SsgjcQg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115254_829698_C405B961 
X-CRM114-Status: GOOD (  10.46  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Used on various phones. Minimal basic support.

Includes device-tree enabling touchscreen on Pixel 3.

Sending as WIP, as not all comments we're addressed, but please to apply
any patch which does look ready for inclusion.

What is missing:
 - firmware loading
 - switching between AP and SLPI mode (to wake up phone by touch)
 - anything above basic touch

Signed-off-by: David Heidelberg <david@ixit.cz>
---
TODO for v3:
- wrap everything below enabling the supplies into stmfts_configure()
  to avoid bunch of gotos to power off on error? (Dmitry T.)
- finish chip specific ops and potentinally remove is_fts5. (Dmitry T.)
Changes in v2:
- Fix typo in the binding s/switch-gpio/switch-gpios/.
- Deduplacate allOf. (Rob yamllint)
- Add missing S-off-by. (Dmitry B.)
- Dropped irq-gpios as it's not needed. (Konrad)
- Correct x and y touchscreen area size. (Konrad)
- Correct reset introduction commit description. (Krzysztof)
- Partially implemented chip specific ops. (Dmitry T.)
- Separeted license naming cleanup into separate commit (Dmitry T.)
- Link to v1: https://lore.kernel.org/r/20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz

---
David Heidelberg (7):
      Input: stmfts - Fix the MODULE_LICENSE() string
      Input: stmfts - Use dev struct directly
      Input: stmfts - Switch to devm_regulator_bulk_get_const
      Input: stmfts - abstract reading information from the firmware
      Input: stmfts - disable regulators when power on fails
      dt-bindings: input: touchscreen: st,stmfts: Introduce reset GPIO
      dt-bindings: input: touchscreen: st,stmfts: Introduce STM FTS5

Petr Hodina (4):
      Input: stmfts - use client to make future code cleaner
      Input: stmfts - add optional reset GPIO support
      Input: stmfts - support FTS5
      arm64: dts: qcom: sdm845-google: Add STM FTS touchscreen support

 .../bindings/input/touchscreen/st,stmfts.yaml      |  19 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  20 +-
 drivers/input/touchscreen/stmfts.c                 | 593 +++++++++++++++++++--
 3 files changed, 573 insertions(+), 59 deletions(-)
---
base-commit: 9cdfeb2399709fcc7e5ec0e6a29e283d0d9a9902
change-id: 20260214-stmfts5-b47311fbd732

Best regards,
-- 
David Heidelberg <david@ixit.cz>



