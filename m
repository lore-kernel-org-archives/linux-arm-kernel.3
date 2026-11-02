Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UvP50KgH;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hS5e9iIv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QQCgfQS+dk4ms3w4Px4H6ZmM2kHQWBk6zLTn53JwSDc=; b=UvP50KgHH5O8o/0tRWt3Kk5HBY
	dlIhK9rkJgOvZJiptL188pg2hgF2hI6dkm8ZxvvXi5upCWOR0jwf8F5KB5mKPnkeoQojoYoIa8UDA
	dInFnNug5xFRJZ0bHVVabHJjuZxhWo0a4bJfQpdkUYPz6JVLJUDlR1RcwLAX5A7S0BT0cMYJXvLDz
	NETsqY9dG3LC9OXF2Jmd/eskXQCl2O68OHOSor8WorSAVgLF1u947GOBLCs+D2u321KZBueZOKxL9
	x2/AQsK0862W9u0PrcXqQFGzfK5Hkd48y0kasZ0zMxGOxnjJRh0cdN0NJ+IySFd4EGMptKg5RIatB
	CX4dzDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkVy-0000000Fa0A-3f8j;
	Mon, 02 Nov 2026 05:23:26 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkVw-0000000FZzV-1Pz7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 05:23:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E333110C2AC;
	Mon, 02 Nov 2026 06:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793596993; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=QQCgfQS+dk4ms3w4Px4H6ZmM2kHQWBk6zLTn53JwSDc=;
	b=hS5e9iIv2i6pUmc8znxKj4a6lbrTHRAgFTnWJoSdCVp+DaCKq4z+Y9ys0d1HYk55cXJ9iN
	GzTnOV3bfnu9XXerhL37930ZEKxqjFi2fta81JJGFnfxc/tEkYD+3H5WIRdKCSYMHV+jvv
	iqnJJwvhJoZsUh4tnyaBI0DMwgBsHau24JRCtLkAoPaf4aq/femPzhayv0uWQsCIgYDq+8
	3A7EP6VM3CqVeiaW3RaRLI0UV5dLCNAUtUeeUB1LEzlxI6qunA7GrpV8evQD9EhB+jY6ej
	5yl/2NxdnAiJHHznZw58Hh67zPX7JS9j3M4kjvGMzfdA+tX+M1ZYOEC9H+fHSA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: stm32: Fix STM32MP15xx DHCOM SoM PicoITX overlay application
Date: Mon,  2 Nov 2026 06:22:37 +0100
Message-ID: <20261102052306.868349-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_212324_589704_DF8218DD 
X-CRM114-Status: GOOD (  11.31  )
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

Generate the combined STM32MP15xx DHCOM SoM PicoITX and overlay from
PicoITX instead of PDK2. Fix the Makefile to use the correct base DT.

Fixes: 77a5fde00b9a ("ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/st/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 10c5d75f6169c..f699d37254e24 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -94,11 +94,11 @@ stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6-dtbs := \
 	stm32mp15xx-dhcom-picoitx-overlay-548-200-x2-mi0700s4t-6.dtbo \
 
 stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx-dtbs := \
-	stm32mp157c-dhcom-pdk2.dtb \
+	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp15xx-dhcom-picoitx-overlay-553-100-x2-tst043015cmhx.dtbo \
 
 stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
-	stm32mp157c-dhcom-pdk2.dtb \
+	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp15xx-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo \
 
 dtb-$(CONFIG_ARCH_STM32) += \
-- 
2.53.0


