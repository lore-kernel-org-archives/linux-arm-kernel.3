Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956ECCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=; b=Ojbd/ueOPhZ2ti3I6F77SHYD5M
	vZRnqQTYVgjulteEH13UqU09zcLxxP8I86uIDSjUn79KZkgJF1cmtb25KM0oSwsVn/pHg1+8aF5qy
	37lC6Cc1SrNK74XSuX3YID75Gs+K5k3e0CfByXOPRZlb14U14DwNXTGRgaSQXOZ8fMtnC38jIOgFW
	PuIqVwiM1LiR0b5QvNdvyEpvRFpMgVih0UUFfOgl5lua5O3SQabD2F/HxIkDB+Xl8j78P4rkvuoAm
	rbxZVIOfRp1MZSCsjbWcJBT0wH0vL8y9D7zNa7zRJcHTJPy3neSAnWOx+QKhJUeFeX3gftoqdq+r7
	ZjgVzV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3e-0000000782V-37u7;
	Tue, 11 Nov 2025 12:01:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn3b-0000000781D-2zVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:01:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b6d402422c2so819714266b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 04:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762862466; x=1763467266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=SwGRfdbZ5wwNTnTKCfmdZxI2v5RDef6aKtsXh2PeTSwGti5o8Cw1gFiWZXaYyxMWMg
         PrnKQhQ2XJ8HvzPt6/ZS1QPon+f2ithJuGlpiZ+fZwUjFuo8OWf/xjeNdFId+a+/yJgx
         fbxBW+nX2HNaT8f1fshmS0jlZkuahBoRCt93wqias8DVg/4H6V9n/wS0GIM8eFBWpqJa
         LaIoV7K5J1pV9UGDo9y+WX1q4vV7rLcYs/jMHcW9lAuazSXAvLodCR73AEsA92AvK1zd
         0PoG+KjD4dTXYdjpcb6rIKp2T+osmkvKqX5Ie6X1dn+W0OppqW6ubFf+Bog6K186wUyu
         o2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762862466; x=1763467266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJg//KOLtGKSYp8Owm6BTGh3ScE+qyb41BzG67dVSA8=;
        b=Ky8ykMB1pIyEGa+gtgxjhd0xPPBlslKNDURpjulEC6xPL2aWAXkldAF8ly3kcfp13J
         JG1vzuh0+gQceOIa1/yXB/ulQXwrPTzSuozs22vCVpy8mqEraTu8OzSo0cFmtNnZ+ifH
         eoZsuQq2GPFWxM7Xv/Qn1fqDIsbH+bfg7OqkG/D5TSglrNsAAfWzLss361e9T7ZIIdIp
         t6+1t2krJIzUGjL3zVq02M4WxqvTbqaCQmfqOnapFG9VEQq6QoWwcvPmWtE3yD3bZk6g
         KhiXyOK7bg30uN7xbI/edJKJ6fXp1qhyyauZJ0LUxLUQ8yZmrz4QuX9ukG8OS7EF5+lA
         J4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJPooErOnNJBCnqzXA+x8cjQy3PyB6O4jekRdO5fGlR6AaQ6fwiavX8QI3Jvfk5uaptGptTKfPGIEoiIG72Btu@lists.infradead.org
X-Gm-Message-State: AOJu0YysEe/QglteXdKbHQfvuEU3rhjl7/y53mwC/PoY1mrn40zL1+Y5
	Nj9+TPtvj8n82gYSjjjvL+wDJCpE1neOK9VGyY3DY8od6M6hQHjDU8+t
X-Gm-Gg: ASbGnctx8b0CBJ2CYyX/yTjQ26b+m8rFyzgkQv71bNbu/Fdmi6u6ATXDi+ycOsMHbmP
	VdSw1mArKIB3lSqu+cWCv4Sp0ymuv9ke8ddbRF3SiBSl0x0jm1BU3k2Bm/U13E++2UxXlcWKj7m
	iU4alOwec6ruAXWHejGAz2b8LlzcAdANz22UCa5QA+AfpCOh4ejNFEaphbTk+S5SdSrpBftQt9/
	RhDBeJGLneDrHx+LheFvoRwZlhehGKzjVHJtxth6tGERWxHhnUMM2b/3kHCa/GAD8fc7ikHJd0P
	KlUSs22+UORfZ3b+pIN+G3Bv2b9v16Wul1OmSyH4PjutzJF1kO6QJpB/V8vWfrldGBVJNtlbobb
	UFUZWkdVnDbY8jHp820gV4NJhS/fJ1qwIuV3XlmPnelP/ZhI5NZKVNzneLJ3jIDKU5/ApGZ51ri
	4oGnoOKOXm/52+stPU09JobYK/wblxKNwMDFhQ
X-Google-Smtp-Source: AGHT+IHZrqQ5DqfZ16gBI98cMnB7rLak+VC5QAZuKSWIn9VXdVUS6Hea1R/TrTtXcwZYS6rRHIjonA==
X-Received: by 2002:a17:907:96a4:b0:b04:aadd:b8d7 with SMTP id a640c23a62f3a-b72e0285d38mr1111681266b.13.1762862465664;
        Tue, 11 Nov 2025 04:01:05 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf407a01sm1340707466b.22.2025.11.11.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:01:05 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 11 Nov 2025 04:00:21 -0800
Message-ID: <20251111120022.696-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
References: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_040107_768223_DF7D09D5 
X-CRM114-Status: GOOD (  12.44  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Change the programming model of the "aips5" node to allow configuring
the security-related registers exposed by the AIPSTZ5 bridge. Without
this, masters such as the HIFI4 DSP will have their access to the
peripherals connected to the bridge denied after power cycling the
AUDIOMIX domain.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 7ab321af9e15..426c11853d84 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1428,12 +1428,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.43.0


