Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B8DFA3752
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTGeIMt25YFQMOKiNe5dlnsk2HQeFBOtHs64bmOahIU=; b=FzMiBDWtqyfxMaFAmIefWDjXSp
	iVereNc0mo07diwqHBzYMii5jNC56hg9wViS1sa43zYIbvFM6FyP3VHWlT3vJumyd40EJKLfSli4p
	KDG2pU9JLqPDmu3wdbLrBkZVHL4/6Ts82XqX7HppgnB9NUlviOJ+flJO78KwL2OkNhJCApP7OT0Dw
	jLYzixfMoMS/1qpbUANd46E46boZvANk3imwJ3jj1yMni35ekkt+6RCGcKlRc6SpvDv15Tat00djp
	A9t3i+bd0HpSGWuaLgGIjNPVnZYH0uDVm9aj5gNAfg/EqVdwGihEi711TPk6hrgiwvewBgrUmy6hI
	xgzr4ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTT-00000008SU2-0K3M;
	Fri, 02 Jan 2026 15:53:59 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTQ-00000008SPl-3IrU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:53:58 +0000
Received: (wp-smtpd smtp.wp.pl 32318 invoked from network); 2 Jan 2026 16:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767369227; bh=TTGeIMt25YFQMOKiNe5dlnsk2HQeFBOtHs64bmOahIU=;
          h=From:To:Cc:Subject;
          b=oOYRycXCsRyk+B/Ca18edU2AKKDlzAzcLRAB4fvsVuhdQedWv9wCd2GYSs0z4gdgT
           W0x0l52G/q4Qyx1xulNw3ma7UgLk6emEu7eoQCERSlLVv+VC9/sY6gMjZCluOwnjXO
           lvOaOWapATbMIvat+NpA9EPnyTGuW/DYENZOpGGQfSIxkzK5uTwDY8g16I5TYpGOaZ
           HP5iwuyibqgc6+PQLYSuPxkoFfbO0r1cKqbtE2ilPG/geG0L+eCSh9fuhJO1tShFh8
           RVmszpbUJz5ENLQ0M5X8+0QUMKYLsSpV1peBHCP0PdWSR4slIxQJOY62NZgAmVn7uy
           vCnOipsR4BT2w==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <benjamin.larsson@genexis.eu>; 2 Jan 2026 16:53:47 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: benjamin.larsson@genexis.eu,
	chester.a.unal@arinc9.com,
	davem@davemloft.net,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	conor+dt@kernel.org,
	herbert@gondor.apana.org.au,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 3/3] mips: dts: ralink: mt7621: add crypto offload support
Date: Fri,  2 Jan 2026 16:47:35 +0100
Message-ID: <20260102155341.3682013-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102155341.3682013-1-olek2@wp.pl>
References: <20260102155341.3682013-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 7b471dd560ee9b622f99c1c75cb1178e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8SOE]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_075356_984037_B5790393 
X-CRM114-Status: UNSURE (   8.96  )
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

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC, SRTP and TLS offload.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- Add reset line and clock gate
- Change commit description
- Wrap long line
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 0704eab4a80b..e1047dd861c0 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -361,6 +361,19 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
+	crypto@1e004000 {
+		compatible = "mediatek,mt7621-eip93",
+			     "inside-secure,safexcel-eip93ies";
+		reg = <0x1e004000 0x1000>;
+
+		clocks = <&sysc MT7621_CLK_CRYPTO>;
+
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
+
+		resets = <&sysc MT7621_RST_CRYPTO>;
+	};
+
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.47.3


