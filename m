Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173B4C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ENYo56kYOoaOL7ZeChMo/ToS0E03eRMjgDAeWj53nw=; b=yvPU0hd+JOmAaCC0gCtmmdlvr3
	9ANDAcr76zV96o6read5dF4EGwrPs2N4oHas/JIlwNGpp/AOvDbHYxgyPPBYaMYtSHNEyWZ4CbmWs
	X60fxxiR+q3IxeDVR1k1KJ/meJ/vKwrWAWEyE9Qdlj9r1zoHAVF7iFAEq+F6W0eenqzw6unmyA1Wk
	vFWNAONKfgBNLpdouU0ePbTTPC3kcf4tPtiYhflUd+KKaECpIbUkN3wGLWRzo0Z+fop3P2B3YJrTY
	zImql3fDNPiCeXioTtSDNRFyhzBNXI05yD+zz28gni0lM0Y5kou4O5eIL38JoelPptwQr0QP2jclg
	xXKN3C5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OEC-0000000Ckh5-3Dmb;
	Wed, 09 Sep 2026 19:45:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OEA-0000000CkgL-2pCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1788983101;
 bh=5ENYo56kYOoaOL7ZeChMo/ToS0E03eRMjgDAeWj53nw=;
 b=kPCYlq4QFFsWgl2/vPxglOHfZ6sF/TCthjTr/ncpVcXs9fSL4+hcnMgBPviNk+r6yAsSxCrzI
 Vj4dEwhs2pF9E3CYXzdm140Df6WCSl4vkTzd0Nxv6zTCthm0QC9CipAQUjS/WYCjoXzEWBl8KBF
 3d2YbuR3vRdzIaRiu10SOCs=
X-Forward-Email-ID: 6aa1b7365382f19eb5d6c7ab
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v4 0/2] Exynos850 GPU support
Date: Wed,  9 Sep 2026 20:44:48 +0100
Message-ID: <20260909194450.183693-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_124502_727913_F12EBECE 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

This patch series documents and provides basic GPU support for the
Exynos850 SoC, making use of the Mali G52 GPU through the panfrost
driver. Only basic support is provided here and as such lots of features
are missing. This series only adds the GPU node for the Exynos850 SoC
dtsi, but keeps it disabled, so it stays disabled currently on E850-96
board (The only user of the Exynos850 SoC dtsi upstream).

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml   |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi           | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.47.3


