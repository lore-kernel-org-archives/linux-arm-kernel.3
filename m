Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xVfrazXG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5vYx+WG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R7zrV8nYJSGrUqyvUFp4alsG/5yBXNnS0jVdAE9tc+Y=; b=xVfrazXGDPPR8U
	4MzJxlep1f6pbXsgcK/cIssOfP+vU1kIecNQX+Yet0rg6XpEM9NSq8sNpJwd0xcTtgtShA1kIZwvw
	s2ArhE6MMdUen/fiQsAq1/hWHhT+VlK1Z0ppLCp1/jorIB+8XFP3LAUYV0pyvt62v7jNxoPpyALil
	p4r0YqsoEWW1UrBBDenyqxoruLech0i5PinNHs9cG95VT8Q9TiQPSsOClkxYKqjg6cnKDx73HVGnZ
	8YDJLqtc484Hm3ThBLS2n8dp4gsM+FoK7UGfgBE811UJou/yOcrw+rm6ZVIgVng54vDy9Gjip6E1e
	rZPK6Avffv4K2ASMlLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxkk-00000009AKD-0NAQ;
	Thu, 05 Nov 2026 13:43:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxki-00000009AJW-2VMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:43:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A2FB60267;
	Thu,  5 Nov 2026 13:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CCE1F000C1;
	Thu,  5 Nov 2026 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886219;
	bh=R7zrV8nYJSGrUqyvUFp4alsG/5yBXNnS0jVdAE9tc+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b5vYx+WGV/ZfRR/XCwiOjYqUfCQNOZhmguc7xRtMavc/JYlU9eacoIRWEFikWbCx2
	 hOBataOrH7ckgnNtuxGX8xHV/ke7gSMasShIveHHGkoX5lmixXKQ/dugp505L8HMUv
	 i92zMwlXz68aIeYVHrIku1Unt7MVLHBaRWNAHm2SN6F3MUAMb8mf9isEKIIoV1oyAb
	 mx/dw5eO6w3R3HCc4XC4UsGKqQa2+2vcgD9A9q16sc8cs4VogmSe5RlDc0dj4Ctu91
	 t/He+CdShhagDEo5/498gQdKK8kKTcReucpaNqMuI0uJ5eyaWUkBwn3E47JgCTaVyb
	 QIkxO7aZ/Us/g==
From: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
Date: Thu,  5 Nov 2026 14:39:47 +0100
Message-ID: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
mailbox only in CPU1's cpu-release-addr property, since CPU0 is already
running. Keep both CPU nodes enabled and leave the SoC's PSCI defaults
available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Reviewed-by: William Zhang <william.zhang@broadcom.com>
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


