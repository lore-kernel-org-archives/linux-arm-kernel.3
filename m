Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E04606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntZswwTo;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=NR9fwCpe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gviGI+/aVfXi8KK0fmiJUHN9/SwDPBwhZYFY667FLqg=; b=ntZswwToV8w8f2
	4P5ngQID3oo5UnI43Ba15u+VAF7o+3dcBEAOtsvVjJ20SKHababdAxrHpuJQB/rSkjrl1FcMIGore
	j6vlnmTcklt4deTyA5fgdOu7d6NosN8OS5TEHHocIQxguOFbavYssv+EiLPCXpbq2OvVwTgN4FAZ1
	uu963VE690dp+n3TN2jVg0NIqyatynxZXOuXtZAoSRunal7JNDo4xgN8KROtoc0CJQ77tdvPy1rAG
	Os0NOYcAVQr+wWmgNyOGrb4iCjIQD1Tik1pZFlhSa0xw2b34PgVFwpbL0LEj7xqaptsAx7hiAn1Hc
	YUiBe15n2VwFn6X+Vh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCe-00000003cvN-00MD;
	Tue, 03 Nov 2026 20:33:56 +0000
Received: from mail.rnplus.nl ([178.251.25.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCX-00000003csA-2kL3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:33:52 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 400EF379778
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5ixoScuTxmM for <linux-arm-kernel@lists.infradead.org>;
	Tue,  3 Nov 2026 21:33:46 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 56C7B379779;
	Tue,  3 Nov 2026 21:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738022; bh=2wkTu59kSxoO15eMfM57RBq7UEe0GI/tQEudoKg9A2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NR9fwCpe44g4hkPId3bcDP97wwZb0KOba59eFPlHCMMc6PnTI+zQGQ6k8SSGQYqlv
	 2AmPdVB2LW9JAwDeMnffsnch0krk/qIwu8L9RhH+iYD9Sm4Gn4jdnlU/3M0Bbx8zXm
	 q+SojoJuIcYda3h6l1Dakp3uZvKCI8lXrdak7V2g=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: aspeed: x570d4u: Fix fan tach channel assignments
Date: Tue,  3 Nov 2026 21:33:03 +0100
Message-ID: <20261103203308.54789-3-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123350_054788_A8178F4C 
X-CRM114-Status: GOOD (  11.30  )
X-Spam-Score: -2.1 (--)
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

The tachometer channel numbers for FAN4, FAN5 and FAN6 did not match
the board's actual PWM wiring, causing incorrect fan speed readings.
FAN6 is wired to PWM5 and FAN5 is wired to PWM6 (not PWM6/PWM5
respectively as previously assigned), and FAN4's tach channel was
off by one.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 7d27833b761d..6e7e3e7ec101 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -320,19 +320,19 @@ fan@2 {
 	fan@3 {
 		/* FAN4 (6-pin) */
 		reg = <0x03>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0b>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0b>;
 	};
 
 	fan@4 {
-		/* FAN6 (6-pin) */
+		/* FAN6 (6-pin), wired to PWM5 */
 		reg = <0x04>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x0d>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0d>;
 	};
 
 	fan@5 {
-		/* FAN5 (6-pin) */
+		/* FAN5 (6-pin), wired to PWM6 */
 		reg = <0x05>;
-		aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0c>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0c>;
 	};
 };
 
-- 
2.56.0


