Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA69606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SU1XFThn;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lzf9m9+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=; b=SU1XFThn7YvH5G
	pOzvc8WFxMOO9jACbQd+jOVbMBqTh46JR0lwEQcdUcWLfPeIPbugsRaUOwLKa7ewAZJ78VtjIOvUD
	ZKuu8sEGSFxxAQP7eQlFUCCd1sMf9NT2ffhHYDeEXG1PbQ65FA45piSmssVHbckLCcacofQqHA+Ch
	z7xlgNT17sCtgmzqiP2pJLF5Qapb73aWiQZ2uv18RkmO2Klsdr5IizeghtcE/wMSXul4R45hIVUMU
	00UAz3//uUBFUZr3hWRs6RuxztDpwK79Jsq2J2IDdKY2ZSlc9caIJOsRc7eolm/Tz97ZRWO/cA0GP
	TfrP4KVPDSshU0z9bA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXdB-0000000APfy-1CHF;
	Thu, 29 Oct 2026 21:25:53 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXcv-0000000APWf-2SW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:39 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so33482a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309137; x=1793913937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=2gogAGhofyRzWW7EQcVe2AK3j9f1GqQkTsvMCNisJVpXQTiFkFjSJEF7dY3sJxF4FK
         UHQblm/Q2hz9ifH/H32+sxEPSYT/7fUOBUXlxCTHS7HNgA1fNggziMz8JrDd2cyAfi6/
         YiQ6hgRkA4OyXSz9YT0iT+NcX6T5VfSpkbmwQaV6JpZjYhFuT8cbowYu+VvB6CVujEMN
         l27ecrJIG+CaGFCJthJ7wLRBSj53H2xv+ZQHx8TF+wHa8MAqiqd2DgH+MDlpggHYojDn
         86OXR3KDF6tm2XhlfuNuCulnywHISRA98RmF4T7+rf+wBrppk6R5IK+2HB4UjJFXEEfo
         ECLg==
X-Forwarded-Encrypted: i=1; AKwUvBxO4QlIdZtYHAcyzgnQTWViYsLO2kr8KFjMFC3HVD0WTa2te+3wJiYtu5exRFcxQ+yjCC0OzEc1ar2Bg/pnH/0X@lists.infradead.org
X-Gm-Message-State: AFq9FYLYTMg1nIhKbJXFMFBvpM1fpTHJqoaO0k+UE2pY9KXffXPfgHJe
	Dn5nehRVDlDPxBgYwsRUdFpCXNu3yTjuWsOog0HOyXz3K9GoHtuSq1NP4J1hHuR7K2dMmFCKJBO
	0fvesvXm0lvQZXkT8Spp6KAZNqN8L88kLrACw7WRlYxvFw4u7A9wANpboyiOcVvXPf0iKrbv7M/
	WJgVtGSM0oYtovVlH8sRUG3yjZbIlrNQAC9TLFyQD+NAIVeo4KuJ4A03btKd2IC3z9/ZRDqNAzl
	dynlZuSePfhEB/cnmsqK3xsGSEbS6vHgfvU7A==
X-Gm-Gg: AYBFou02yVYOjzVXPb1skYwbe1y6GYEUXbrFXFyOn1jjP5gZT2bvlf2PRAQpleZS6sP
	682Lq996qBinjHWnMl2kG235CUJXxly81A34TV46dNhtneLiS8tby/ACaB5xCYvPGBrGohb9cu1
	TIB20RmZA+aOuOP1GqxsKcnx6lqart1xTqyW9MApa9FIxPSlAJCwv5/xiEtKQkwgznRAKQhd+2W
	N+k78qxjTq1rmNUVVesIAAHBP39ELILAGfR2dbedkgsjsJItZx7VKSVn1KSjOQMMiYAr5QoNCUQ
	Ix+y6AJ+bGikRqDXkzB0yQdiyher/G9LdcziVxzXzr8IfORinsmH8CrtgGxm4U++4qnKTjC88aV
	r0J4SkWOPrzXVR5kyzee86dCaeklGnuxtcQ/zgcp1j1G/pPxRuDHWvZBlnD5H/q0m2G5pTtemVN
	i88jjmfjQLwjxKYChkz/ClIFy3f4H2s4cEk8nVEtCq
X-Received: by 2002:a17:90b:2ecc:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3ae897c64fbmr176893a91.19.1793309136605;
        Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae8444ce5esm627364a91.2.2026.10.29.14.25.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c0f73807eso1319156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309135; x=1793913935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=Lzf9m9+Pi8iV5ooJ6TrKLIETv5Oe6XvPhFBfqdQhD2dt+3Av0japTa8d2HvuAaOCoB
         jmdtWzp0EPG8kHy2F1VG/L6D2Wos5ONsN81GYo2aO3glZKsPon16MyLiIjeNfYJBOzPJ
         O1j25rXQ8dCddemO3c0os7KggvHeadxqPD1i8=
X-Forwarded-Encrypted: i=1; AKwUvBxmgnrYQEMUgskqkH6cgaX6XQdNZoQm2oveqcOdzQBT5+jMWWo/hbyXwb/d85/VRtwGiMVjkFLZkEzEY/mIeToQ@lists.infradead.org
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84085285a.44.1793309135521;
        Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84081485a.44.1793309134993;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Thu, 29 Oct 2026 14:25:11 -0700
Message-ID: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142537_649904_C8138D1C 
X-CRM114-Status: GOOD (  12.52  )
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

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0


