Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=29cmq16H;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVjEsSjT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+5cbHnUYyslIPSne2eKBDYQ2xujjPbWUVAor+9E51d0=; b=29cmq16H40Cohu
	IMknolwMq0cfPoLLM+FGznN3hiyKrjf026rJvlSPXmrWOIH0NJbHDbWoJkvDu3ngoLc4ugYgpQ8mj
	qyN2YRZhoppgA0kkYWmU3gOMi0Rskhi/BGus+iSKcPfn3Kz5wWo+likILagQmxWpd8Dla6RKCGAQh
	hdSszMtH06RqONX5xeEEjETCco2kh9FFc0TuAin4WCy2wYEH190Y5KGajCnB00TqNc6DVld0G9P7x
	KmDhVVxISOMt2U69BsWBgps/t5qMHo18Lr1TuydEJkNWo6XfyqyMYKeIrzRpTGYmOeXAUsjIWBECJ
	4dEfc2beT6iH3HRVtKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsS4-00000000plK-35ba;
	Sun, 25 Oct 2026 07:15:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsS2-00000000pkH-01P4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:15:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEB84600D4;
	Sun, 25 Oct 2026 07:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804601F01829;
	Sun, 25 Oct 2026 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912528;
	bh=+5cbHnUYyslIPSne2eKBDYQ2xujjPbWUVAor+9E51d0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HVjEsSjTYYi/OID8KrKFUJ3I6njfiKgLuXExzDzJg79aNaEgZB2m7dU8nQKvRN3+H
	 Er3KkSV0RfrL7g/xWuBKhNStdkMn/tBcb86ORy8CZIDmgnV9fa1jvF+TVV14ZC4/Xx
	 vYe2r6egDQdZDwFcQY/HpwbdgCiaDq1TPeaWqM5dI7V7OyMbUibKwDxT5bzGWpcIak
	 YdTf1A7rEOg7c0z63fhZpoJYQOoMPq1dAkFMMS10oWXfih4VbHUxBtKvsWRTxqPIru
	 oMi4x8KTf/UR2y/KUuczi6eHavbiQ0MUxL9qSQDeyWyth4ncgTl6JVcw1h/1674rVR
	 2+QOvyVscrXYg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 25 Oct 2026 08:15:14 +0100
Subject: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
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
mailbox in CPU1's cpu-release-addr property. Set CPU0's required release
address to zero since it is already online. Keep both CPU nodes enabled
and leave the SoC's PSCI defaults available to other boards.

Also remove no-map from the secondary-boot reservation. Its overlap
with ARM's initial page tables otherwise causes the reservation to be
rejected, leaving CFE's holding pen unprotected.

Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index a3616fb7b3a8..23145440e7bc 100644
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
@@ -56,6 +56,22 @@ button-restart {
 	};
 };
 
+/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
+&{/psci} {
+	status = "disabled";
+};
+
+&CA7_0 {
+	enable-method = "brcm,bca-smp";
+	/* Dummy release address since CPU0 is already online */
+	cpu-release-addr = <0x00000000>;
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


