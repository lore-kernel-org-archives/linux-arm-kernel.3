Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7C6E9271B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0h2B5QT1y4TV5N1rocLaQAjycWSZF+bv3021p4uufQ=; b=vjvdQMsgSnBHu/
	kAHCRlx+QmVmR2WIefzZuaugQgv/TThooXgiXlT2jd6YGMGDK9GxeI1X7sUPSUE7a7v2+N2s8ZtGG
	snlt1QrECz/0u52xpj5OkgX88NF9DNe6J32LvwbgfSk1PjsjG0f24jkn1fypvo96m7zjQ2HHEVzLf
	nbTOkZu8B8nwVBkpsSjeoG78J5jANzuDMvuGwl7uHuDgSa0U4D3dbDUwAozG7yNigFcAjj5uB6BQw
	sYXIZAp48lN6pAxinPjI2We4CacSbHqmWzzXS9a1MN3UyhitY1gl8tYkQa5bKdeOUCPkJWeQ3fmff
	exAFrNeRynsOv+aVImhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkc-000000040Cl-2ktd;
	Mon, 29 Dec 2025 19:17:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIkZ-000000040Bh-3rc9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 19:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5175E438BC;
	Mon, 29 Dec 2025 19:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB3EC4CEF7;
	Mon, 29 Dec 2025 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767035870;
	bh=zdlHc9b8U/eLbV40R8AjoSBbW+do0gV1EArSnhErV2k=;
	h=From:Subject:Date:To:Cc:From;
	b=bDD0DYKddFO9t4bNWL3dHmtzIF2wveGBSz+wSIKQYJbNBiZH9y01pSdBj+XgACWgQ
	 e2QdH9VWV+ecyvZKvhl6fVdJXfWcOcnbHVoZa3wJpn2O6pNTS09aaOEfFH8O9rfGMP
	 mVDh98XVeec2Xd9phjy1VdHvrB2fxxl7Mj4ubSr7qSr3HgXoXZSRo4gj/XlcbR5GdJ
	 uXmeJJFzgqvy4S1QsPC0mAgwX6g0BJYbAQZk1eC89ofqJVknL6mBx7ocS7/nmfQ9sf
	 ghvpd4EaCukL0S/9XindaXUyblacRVYbKcMu66CbtL4xv3+nkxB/bgUGotJ3hXZ7/o
	 rtQThsQZ09ByQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 0/2] net: stmmac: socfpga: support both stmmaceth-ocp and
 ahb reset names
Date: Mon, 29 Dec 2025 13:17:17 -0600
Message-Id: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3TUmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3aLU3Pyy1Pj85AJdExNzCzNjC8skA1MjJaCGgqLUtMwKsGHRsbW
 1AM0q3YdcAAAA
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: bsp-development.geo@leica-geosystems.com, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=zdlHc9b8U/eLbV40R8AjoSBbW+do0gV1EArSnhErV2k=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpUtPajPcHRktCl6d3QxwkIhZ2Lk0tQNNBHtOPl
 Q3EviyokIWJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVLT2gAKCRAZlAQLgaMo
 9LCLD/0dyo8tDOFsr5e4FSCd3GNSLC5hPyhi3YsYZiPc8K5/kuipShDEByFZEZfLsmtCL3qJ940
 rmb+v5MOeZstGprn3+5KqWB9aUBb3khGtscPgBVVHUNxLglJKpJ0HR8RBx8fi3FkZs2XIfOcLxl
 kFhEYoq4h8wW1z0kbp+aVMghyNWyk0Yd0HXj1hGm/7d28pmlxjUFtCrxmvt6g2FsIdG0qcnZb0U
 MDIln98k0VRZKUjCKC2Gx8edz9YzqlEDQImBbsDsd9p1ZsT1+4x+ucbki3ZpdrtVANkuCFHw+q1
 ZcaHV7RHyhSlwBiP9dSGlT8GTI4n30MzhAVPJnCNuyQRr4jis6Rrruzhcqi4PkawiXw+d/68Oh+
 pBLbjOhGR6N3I4les/6kj87AF1AwnBII2JyUglCGQY4aH+unaHaH8VDbVAPa03NjahGDCiyc0eS
 OFrMhs8sdiiirc9QbfeLNPsPic7Bby8PVN6qfIhwySgnDLiiQ/TaaQJHpMmuo0ILLB1kwGv9opy
 OqYv/Yenr1apVZYhPsEe6CfOYtlodgZA2tghefVcmOLUWfJq37AoqKl+vBg9tj+3u+x7b6A6JVb
 92PuCM8HsMIucn+py1BrXnyK0bSqlNeSTohJfbZbzZWgUCgi7tQrEv8rPJmOPo8tgSu4SIoWrPa
 Pq5NyQ5Mc372zCg==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_111752_004625_78971AE9 
X-CRM114-Status: GOOD (  13.05  )
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

The dwmac-socfpga stmmac ethernet controller supports 2 standard reset
lines, named "stmmaceth" and "stmmaceth-ocp". At the time of upstreaming
support for the platform, the "stmmaceth-ocp" name was used for the 2nd
reset name. We later realized that the "stmmaceth-ocp" reset name is
the same as the "ahb" name that is used by the standard stmmac driver.
But since the "stmmaceth-ocp" name support has already been introduced
to the wild, it cannot just be removed from the driver, thus we can
modify the driver to support both "stmmaceth-ocp" and "ahb", with the
idea that "ahb" will be used going forward.

This series add the support to call reset assert/de-assert both "abh"
and "stmmaceth-ocp" to the dwmac-socfpga platform driver, then reverts
the patch that uses the DTS "stmmaceth-ocp" reset name.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
Dinh Nguyen (2):
      net: stmmac: socfpga: add call to assert/deassert ahb reset line
      Revert "arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb""

 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c  | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-remove_ocp-44786389b052

Best regards,
-- 
Dinh Nguyen <dinguyen@kernel.org>


