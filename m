Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2096C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5g57A5VbRGUC82ryAttIcVIyb54fRoQlQaSUTrU3GWI=; b=DhynlzKYqynrgouVn9EftiF5id
	eFe955LI9+Qw/2QvDlID8GW4WNAPRdIUUY7ppRslepk+YIQy3JH8yvckXViLJeK5o2uCujbwKd8IW
	55nuZHiZkt+RK2uangSTJDiY71zLnq+YMhlRUIk5nFswsp7C4o7VQmVtSJDi5DhG/SThWL1JH3wCB
	RlTBZsC0/PfbYODKRSKCEjlxejEJv66YWikYbp3t/AnPPKieQtBE136I1KshpDzAR+Bpv77mdK2kw
	qbL5LoYIZLhtQTbDQ69450Vqm+B5cuPRtEfKqpCM/t0fRQk74Hfa0vDaehHlNWOwd31PG0tb986mX
	HeGNuQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqv-0000000Ep0T-2Yog;
	Wed, 15 Jul 2026 12:36:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqs-0000000Eoxj-1uv0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:36:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b27c7451so7719445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784118996; x=1784723796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5g57A5VbRGUC82ryAttIcVIyb54fRoQlQaSUTrU3GWI=;
        b=KhsrdrEl0gDkkfVwlsDhpzup7U3DUJZOYCnApelwg1izl0+IJu2PudeNxvzRbRWDo1
         nl+X7tda34WJXlhHOkccsnw5UDeFAjbsdD374n3gNxf7QYLqx3CnIhjwKpcQ9WU0dQP6
         2nQt6dh9Iz2QqliLqh8Hdaizi0nzb3VQB5n3uIWnyND3X48sua8IZvsAryv0umzAH60c
         fC3qHan6VQDT3US1QO+NuOZtKwzz6HVTI1V7fZ2IoK7xI5vSwv22ix1CPy49DxpGTqfx
         kAQG548Ley+ipBsuQB7UNfCVulOQ6UORT92ndXSKE/SXrX3IaHS58JV4CX4HQFEmDMT9
         IwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118996; x=1784723796;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5g57A5VbRGUC82ryAttIcVIyb54fRoQlQaSUTrU3GWI=;
        b=TlDYN6HbZ1RMCDjinqTLuxZu/Ts1vgT6AgfBhK/dqZvpBj68IpKPkt82ALl1uPTQmA
         i6T/1zUXgnpH7ofRWNqZWtiTep3+rZ42ZiUShvMh+D/sAxKuStsK71GkTqThtYuON5Mi
         rgQWikyIvMu0tS80YJ3H5yOeN2t875iojrFYC7VbHcN3VnYhpsGbh5lK/8F5ndTpVclM
         o1fSWwzlOQ4NYy1BVU7WbYp7kEvTscZbQ1/FUGy88tjfgQiYqGom0YdcQ6jZTcOnnPA3
         EGnqaCFyTsfsFWkLa0Z7FHDEmfLQmt75CMzkhvpUG9p9g1ucT+f02T19+lPPRepTTfsd
         dXlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1jk0XIbkGqsYW15XpzAvu6PuLwE+rU5+z+/l3zhmxOnBn4h/EZzEh3p5P0X7v5llqfpqGQNdqDPr6DlX3Bb8/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Ouexq+F5X1kGQzeSh2OwC+y1xlrufr++SRgI9+SUGB79+9IG
	kb2R+VcRqjS6mRRNER8hoIxEYRCa59CvIy7Kp5BTqNcfOZi9SqjNHCGGpo9FvxT9ovXjrlq1DbB
	/na0r
X-Gm-Gg: AfdE7cnixGnjomrjp+iiC5jSUtzuKrLg4vk3NNQV1uZqiF7A0y9dnI9cx/qDf3aZ8vT
	aDewNDboZetqYUGKlTrMXwJ1xg+s1MHlKnlbhC912gWZcetYMR3yL8UheidnTzWy2Phn1TDB5J9
	JnolXNuNByw5aQ8cOoFPD+sR5XYpwGZKzLVuYAhCblDKCO/RM4xgPd6SfYjKB1tdW5yHGYnVrSO
	1twxO7V3vLuWpPAq5E/+yPcbv/+EW7yo5MgyCbw3oWQtKn52BWI7r8MlObSJYSOdcKj7XLlLnV4
	uIhiSSHPObxUTg+je/RGp7aSIYtcX2DwgDhiSpEDHoZ8oc79sBcyVDRebPMvT7WrnvA4e0U1LQz
	3QTLbU2vTdTEj9HpL9xewa/2FQ+XB4ZdKrfDEYLPvI4n/qODxkk6ys9nMbUkYLGSXNB62E//TCF
	PONHbVn+msNqc7pcD94ab7oyKWfj0Gn39PhXcNhqaMke3YVEB66WNZnwsrf0/uOgomBim6Dklx+
	+FhA/v6EItH+F5ZJAm1Q7mlNKoA
X-Received: by 2002:a05:600c:e557:20b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-493f88d2f66mr125124155e9.16.1784118995937;
        Wed, 15 Jul 2026 05:36:35 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm44497075e9.0.2026.07.15.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:36:35 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed-g6: add pcie-lpc and pcie-kcs4
Date: Wed, 15 Jul 2026 12:34:18 +0000
Message-ID: <de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053638_630947_F5B9E1E3 
X-CRM114-Status: GOOD (  12.29  )
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

Add pcie_lpc node and pcie_kcs4 child to the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the datasheet provides interrupt numbers for KCS channels 1, 2,
3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
section. Since only the KCS channel 4 is described, only this channel is
added.

Ordered next to existing lpc node for address ordering.
Use existing "aspeed,ast2600-lpc-v2" compatible string.
The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..ac351f01048f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -658,6 +658,21 @@ ibt: ibt@140 {
 				};
 			};

+			pcie_lpc: pcie-lpc@1e789800 {
+				compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
+				reg = <0x1e789800 0x800>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e789800 0x800>;
+
+				pcie_kcs4: pcie-kcs@114 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x114 0x1>, <0x118 0x1>, <0x11c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+			};
+
 			sdc: sdc@1e740000 {
 				compatible = "aspeed,ast2600-sd-controller";
 				reg = <0x1e740000 0x100>;

base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0

