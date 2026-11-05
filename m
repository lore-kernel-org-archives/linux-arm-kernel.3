Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CBE606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QaktMUL/;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=UuWPi6xk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zFarGEUyw1j9qFI3A4zGklNXn5up3QuYvyOkYkpFrao=; b=QaktMUL/3N/Jjt
	gU/R3MOSvJpehKO8hmDnxzGsZ+v94Li8NYcHtRgWa0ibOkBeCzNePk4lf5jR8v7LV8Ss9tHiNX3yx
	CNgxC5DjDiW4v/uE9d1qcquAktoYJpBhpiUqKOqP1SBC97iniaVf2CswkghNtrnGDy/UMyFSZ64TX
	e3eEyK1pqeTN9G5DSd8ZDCGKOluDiwHcMiY3gnoTLIVnLxZNSluFGTvR/PntM3saBTYDlGbpFZKaw
	S05GJJymnOH/CfHm0laL8MueLCsqmNyGIXoscDig/aBjMyxkPu1ANYzKsPQMATIZ2c4Fdp+QCfy+I
	obwsqzPdmWIiSXfrF76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFW-000000095CE-4B6s;
	Thu, 05 Nov 2026 13:11:26 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFH-0000000956J-0kXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:11:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9D5F14966F6;
	Thu, 05 Nov 2026 14:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884304; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zFarGEUyw1j9qFI3A4zGklNXn5up3QuYvyOkYkpFrao=;
	b=UuWPi6xklvAj+GDfZCkgc7wZ6CkbNbnR4k/D+KclqmiU3337WzAGx+3e285SIqb+lnZbQw
	bzKGdlutJAvHBdIK0C6lSR4+0rqUiu/h28kAwVl4XgSQLzEE6xFousbbgtKKpMkLmoH2PV
	FLb5YaYJp7aazptcXNzI8VGIHAHIfsGRtVJTmfZr3DQ0IVr8m/DSpyZ1TEUKRgfw/RscDw
	xGelgEXoSVKFTQlOxrGxSDb7ojdqfmw1AJJlStKy1SWFwnIC59cxEpf1dLvZT3VJnya8VT
	60rHwPZq1HanMc+np/U8tLNZ5yC6C2lLvyKl/oQ1sVRvt4s7fn9BMRYRqwXGrQ==
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
Subject: [PATCH v4 13/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
Date: Thu,  5 Nov 2026 12:06:49 +0100
Message-ID: <20261105110715.2486432-14-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_051111_377034_786762A2 
X-CRM114-Status: GOOD (  11.68  )
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

These clocks should be enabled, datasheet says:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
of peripheral otpc_clk, so this is done implicitly.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sama7g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index b8296391fc696..30193f3bf9775 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1036,6 +1036,7 @@ otpc: efuse@e8c00000 {
 			reg = <0xe8c00000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
 			temperature_calib: calib@1 {
 				reg = <OTP_PKT(1) 76>;
-- 
2.47.3


