Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2H6NEoj7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YHmtbv84
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtKwLPlOlCqNT8hZcnvMmZ2KrgTo5rJvR8kXM2xT3ac=; b=2H6NEoj72vpWRfzt5353oik2Mi
	a8EuC7HWBUTZ+AQA5ShIIfRse0sHmZeHeVOwa8qTSuJzuPBJkPRSGHYQalGGzI6KEp2cXYO+UQfs4
	8Y1NW4vpGio09BObcM9cg2Sf7LuFTlDJZyz+YmJ/cGkSfX02wzgMUSulwQl0Q7BTf8fDYUreHNmDh
	xBKoJ7jev0O7c9KS65yRt4o7o9tUB7TwYZ6VGtEaRfCiibFZJZVTF/ITZA8KTKao6VXXtgIPK5RYg
	4uf23xdROZQV1MiQOz/wTBnmsIpV9xNi0WFSY3Zu+ftTqcZVyiRqUB5Qj/JuTQNY1olToy7qSxwsV
	juQ3FHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXxI-0000000CD4H-2WEp;
	Wed, 21 Oct 2026 15:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXxF-0000000CD2t-1nWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3433843C6F;
	Wed, 21 Oct 2026 15:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C561F000C4;
	Wed, 21 Oct 2026 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595413;
	bh=gtKwLPlOlCqNT8hZcnvMmZ2KrgTo5rJvR8kXM2xT3ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YHmtbv84uqw6wxTgOdiUnXVgLwMLMCAu6ddLE1Bvs9gQH6s1t3sM6Yhr8x5dhZo5N
	 9+krQNWiGom8ycMP2IfOcMES6XvjmTtCYnWyGnhPvsDWs0TkCHkBGs93RhDLVMz3Oq
	 g7j4VEClVtl87zOOoKQ6YKmhi3979NUORMog5IR42O425oeJkgGuhiTBYfd5f0Eiwj
	 coYo8YVGa6vo0xxxHHY53/Ae7I2c401pdBtelhRgtbBprUa32+UevYCSrk+6P1VFmz
	 b0M/3r3nh5jeqzPkSU0NCOyP6aBIn8KlZpltqjTp7iR1hIBOJWPkRq+pCNDafOYdul
	 UIVNccasVhfJw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Oct 2026 17:09:54 +0200
Subject: [PATCH v3 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-3-7c871f1755db@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
not provide PSCI. Starting Linux from CFE does not install a PSCI
implementation either. The working PSCI interface in newer GenXOS
firmware belongs to a different boot stack.

Disable the inherited PSCI node on this board so Linux does not issue
SMCs to an interface that is absent. Set the CPUs' enable-method to
brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
mailbox in CPU1's cpu-release-addr property. Keep both CPU nodes enabled
and leave the SoC's PSCI defaults available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index a3616fb7b3a8..45d4df523110 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
@@ -34,7 +34,7 @@ reserved-memory {
 		ranges;
 
 		secondary-boot@0 {
-			no-map;
+			/* Includes the kernel's initial page tables. */
 			reg = <0x00000000 0x00008000>;
 		};
 		pmc3-firmware@8000 {
@@ -56,6 +56,20 @@ button-restart {
 	};
 };
 
+/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
+&{/psci} {
+	status = "disabled";
+};
+
+&CA7_0 {
+	enable-method = "brcm,bca-smp";
+};
+
+&CA7_1 {
+	enable-method = "brcm,bca-smp";
+	cpu-release-addr = <0xff800568>;
+};
+
 &gpio0 {
 	status = "okay";
 };

-- 
2.56.0


