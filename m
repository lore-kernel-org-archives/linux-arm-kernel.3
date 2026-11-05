Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sod3drAw;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=BkWi5TWr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wB7MAZM6DeqfgWnsRCY9GJY0+/kpbyJiFnWeErSJxzU=; b=sod3drAwip1aNI
	Ldq/HEcaPVHAq5X6sBAk5rL8+GsUGrzdVRLrRuJhIN31iU8q/8rcDZv0ea/qf9IubW4UBT5tsaC8r
	uw2qABENKS9LvGZbUkk0+Iwq+5ZW/kyX8uplAH6DIWdQ5cJJbbU040OrXirzwnqFM4f2KCYrzagl8
	edGNa7AT1WB4Lh+zCS87kEFL/4lljZWU4qI6zW8JgMzM89yXwYiarKotjrap4TGtl78GcWh2GtH0I
	15pKLeUjvOS/BbfKb9S4MYTPMW8qp+ARMHig6KSGGQQh1UFqIXRqHVrLFWdspPO9D24IWDQ940w/s
	zQpK+nOj5/xy4R4nmEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFX-000000095Ct-0uVa;
	Thu, 05 Nov 2026 13:11:27 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFH-0000000956M-2Z0e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:11:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 411A614966F7;
	Thu, 05 Nov 2026 14:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884305; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wB7MAZM6DeqfgWnsRCY9GJY0+/kpbyJiFnWeErSJxzU=;
	b=BkWi5TWreaofM19/8hMVtrgru8LsDY5r3vF+OF557u4Hq4fmstrJgBv7iu4SpOncLQCBaq
	PTRUHW1RN9hoY3eafJsJMRfwbQdz/ud3iP7/b4XtOpToYT8oLcmlrV5xMVwxOty7KUREg4
	IvackDtLzqMQAB2U/sEiBIColZDTu4ZQghDk5CoV0pPry8Aq0rX07N4EmYgM9j7vsgjfpQ
	In89pJWz/TvSGikjriOfw+6UN9J0gl0z2XJDhOOD5ihNaO3m+p8j7cgpM8RGTMRcqZ56L1
	fpIbIC268A9/MzU5xBtQ2WGAnrb2cmKUlZyGaAo+a3/i0uE13tOKoShWRB78MA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 14/16] ARM: dts: microchip: sam9x60: Add OTPC node
Date: Thu,  5 Nov 2026 12:06:50 +0100
Message-ID: <20261105110715.2486432-15-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_051112_275874_004D14A2 
X-CRM114-Status: GOOD (  10.54  )
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

The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
interface between the system and the OTP memory.  It also features the
Unique Product ID (UID) registers containing a unique serial number.

See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
Controller (OTPC)" for reference.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Dropped new microchip,sam9x60-otpc compatible,
      use microchip,sama7g5-otpc instead
    
    v3:
    - Removed needless header include
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - squashed with patch adding the clock properties

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 4b777c61c1e09..996b13300ca06 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -155,6 +155,14 @@ sdmmc1: sdio-host@90000000 {
 			status = "disabled";
 		};
 
+		otpc: efuse@eff00000 {
+			compatible = "microchip,sama7g5-otpc", "syscon";
+			reg = <0xeff00000 0xec>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.47.3


