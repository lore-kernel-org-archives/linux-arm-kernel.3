Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6dX4VOY;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=yacQ7jHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g4710mBwVYs967K4QgLDYfK9fIoxHjIzWDjvzQBbfyk=; b=o6dX4VOYqEdMES
	j6P9u7wdnLU77FTE+vL58/m3axLZ7cMYSYdlVsDAT4Yfg0UfpxhDsP40nEwpeSRH9DZTg7KnCrLOL
	PJwRpfK3uCZKTMJLaPsFCgTgmIBqauBg3Mh6sJhplv3KZNMjEqmsjGk1VGuNXTXMIyXqlydfPHxsw
	VRB4DrbVfGyhzmABWZFkFfOhKKI0W/iwpbtSJEFGXmqEa//v8RtrIthBZ85umujlbotW8vEOU1e8H
	xNUxdtJ0LnqKBWh3dC2KSx1EEFK6mhkxiyy9bv+lBhA/vWbjzjonMqMzuFeNAMs9SGo22TCcldPCI
	IdlgVdhoovO43cDG0fAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCd-00000003cum-35KZ;
	Tue, 03 Nov 2026 20:33:55 +0000
Received: from mail.rnplus.nl ([178.251.25.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLCY-00000003csB-1CHU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:33:52 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id CC1E737978D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbX5cvdr-MgR for <linux-arm-kernel@lists.infradead.org>;
	Tue,  3 Nov 2026 21:33:46 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 3ADF337977E;
	Tue,  3 Nov 2026 21:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738023; bh=KQcSAMUy4mMylL+vIJL0oe+1qrtpcizOgu4lI9jmLEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yacQ7jHivL8PsuyI1WDkxXn4tspokbJO8Hq5MtcItZEAOTmNgB1lrkVlGbx6LO1AR
	 FesrC4ttYXhRIwoAuWxCphIVxLbh3f0SrnymVyqKgqj5MxP9h3mHDD4OnO5O0OvUOZ
	 odp0g6diFx4d8oMPoy8OjDGfGHaSiClCLxww7k6I=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: aspeed: x570d4u: Give unique names to MAC address nvmem cells
Date: Tue,  3 Nov 2026 21:33:04 +0100
Message-ID: <20261103203308.54789-4-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123350_469264_9576ED6D 
X-CRM114-Status: GOOD (  11.52  )
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

The eth0 and eth1 MAC address cells in the eeprom's nvmem-layout were
both named "macaddress" (differing only by unit address), so their
NVMEM cell names collided once the unit address is stripped. Rename
them to eth0_macaddress@3f80 and eth1_macaddress@3f88 to match their
labels and make each cell uniquely addressable by name.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 6e7e3e7ec101..fca14320829e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -233,11 +233,11 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			eth0_macaddress: macaddress@3f80 {
+			eth0_macaddress: eth0_macaddress@3f80 {
 				reg = <0x3f80 6>;
 			};
 
-			eth1_macaddress: macaddress@3f88 {
+			eth1_macaddress: eth1_macaddress@3f88 {
 				reg = <0x3f88 6>;
 			};
 		};
-- 
2.56.0


