Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF4C02190
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HTEVgElkJYk7nsJ76qRX1q+NvOWVT0ntXJHe5Etnm4E=; b=gncy057hM7rKNuj2chYejYmkQU
	RsGSVtRqwzvLqhn2IMfZcX6YU3fIpk6cxMFsp8ORm+FWiqQ8EquGGr0EQdgqJzdbclTHRf4UFeU7I
	dhZMUtxOWpC6WIo8h+fOzLKOSMz7ZPbKop2NvITET94KmMLmPfCJPFotC/F6qiMOnehW0iotO5QNp
	zhp2bo3e5/nKP6cgM2kzCAD4Zv2+AQI13IlTVI/SCu+oAJ1r85Xt32ixa71IORrfs52XQAEp2OZ92
	APsuMxe/ygS7aXUalSY6CDRfnQ/7JwCK19fYCHsLSiQdAZgGsJ7/ocXz1/uVHZ8SSAfAFX33182kd
	ko5NLddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teCPc-0000000CGkC-31k4;
	Sat, 01 Feb 2025 12:15:48 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teCOI-0000000CGhD-2MqE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 12:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738412063; x=1739016863; i=wahrenst@gmx.net;
	bh=HTEVgElkJYk7nsJ76qRX1q+NvOWVT0ntXJHe5Etnm4E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e+lNvylATOOXoJ2x1Mv3EKtL6tNLNcZPiWISVbWxjwNfYwM1BSwO6nipj2fX8zvM
	 hWDIDi1893NROL8psXedBCMSKB2/4ESC1jSV92/V8qH7oUdEzzcQrlKUMl8kpcpjl
	 EjtVp20uVSzbMO+lqzvCyTMOTRfEFAGLKY0WJAHi1ka5VJMxC6xs4tLY42jIC4zsg
	 L7z4AqVK+qUg0cs8Uf14xnU1Ajd6WZtO7l2bRnf8KoYi1VLn17J55OaRRiWYEUuuE
	 2iAjU46/OIdblCXVI2jLbN/eYQzWuncqHqYLBJDaPAGoGH2vSSBf1J4lwY4mvQoIQ
	 ykehW1JWg4WaBHU9gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCb5-1u0Yla2oa1-00IRDU; Sat, 01
 Feb 2025 13:14:23 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] PCI: brcmstb: Adjust message if L23 cannot be entered
Date: Sat,  1 Feb 2025 13:14:20 +0100
Message-Id: <20250201121420.32316-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u/0mFk/jI+uEMG4AnL1r5NzMclC3cs2OdNv8kDxNKxkovub8F97
 tWIrjL41Xe6S348E5dEE/c9vSWrutIumle89k5mQ9wTsUjPtzo/D5YK3bDDotF6qPP+7fWN
 VucMaUGd6vua5lgGwqJy21u414X1wWCv7g2EYinlvlfl4f5k0N7iosuLwv4IbdtDBuZQLQC
 5R1B71l83ypchZPoJA86Q==
UI-OutboundReport: notjunk:1;M01:P0:Es5ibtccUaw=;3FIp3tRBvuHzp4EoTXfndo5cG1u
 jXqJJvUFMym19MP0I23pk13LJqmIL3kH0wV0fP6BOSZzo6kZHoPvY6WqMH6N056kJB3PpgMnp
 EZNsJalj+s9qJqqS4QnTkjA94+O92S4MXvdkYnS3+QQCQOCtyLE/t7U7gdjJEhF8LvQfu2a1n
 vBjXK9+vlsPVMTNFuEgzDwXkr1zG17XX/cfaS/g1tzzIUXbWEGlzNob55OxD36agQIs0qncnD
 y8OddGeKVWMzmo58yneyRC3Xf3UkCuwLMXEB6GnjsAW61uwdJmPWXvUP9V+xhXRHE5RXqXJqG
 YzVK3i+DoCtPQznag7oC95rEX3SzhF0Y34BjTMIT71vRpaZCmt9/9+HtllJpNix4MqkX96yzU
 of1cjkw1MBqktfd8NcDEouDT7nWXK+6UtUSV0zkbR3A/dcfnifsXjRVLL4UvR+vzafqFpyl0v
 v7B8SP2FBrIAY2l69VT97CfxnneZYW8RCaJHYC9gQBVHRu8aku2bcdwi/t+l6c7fz54Q5pWtd
 r1Fl6zRvgQAOKzdyfGywPMCFY5qQeQgIAWZx0wE94GcRKI3aVQS1cENl0usXccB0istoagP0R
 /Ykm4dNE4omG867VtAV6QMkdLligqMyI5CRRkCb8oLt6aFezWz2BLcCASRPLZDZhwpM5bR7ML
 UzlnINsvMW+3XOKbqg6QsSj2qv6oOknkzJZcrejSDHCgO+716AT5XgCmDfVZl6ArJe7QB7BtO
 3SNA1SOUw979gE4vZf1NVlcKaZd6l6drqDXOQgFHIh2jhPnPp0ca5dIAIvY6SDFnKk+fov7+z
 FfWZJ088gJiZWs1UgY/xyj5+41tkKBHIOxmvq+oaN+2AozCCUQ6+1ap33LZay5DReZU5sqhe2
 3J5z10SFdqwRDceh04Iqir2mxza8lPUkUn5JpNnJsC/U0jdtED8soXIl5t84kuHImYcRbzpUT
 r3DfpNAtwkI3Skqju8KExC8oKbtUgvqR48fgX1YSBznydkr6GjOp+IvF984jUqEnWtjzfmO2H
 TjJPgIPpDVFWW0Y8djLODZrvHH2RND86dQQvf6u3l/gHZCJ3CK2hc8DB5/ClqrpicbkPgu06R
 pINXhpN21Enb/J5fDWpWUJZ4h4F4azpqIkTwkl3j8sfV9PHrpad05LUxy6CHHl/VvEcB9oRql
 DDWux8j3Tyv1lSlgzRX502v+PQiO7roYM01sGrWzx4WSb21ZTwQXcrJr1KWxW4u37sm16N9aw
 3w+8V+AGttnArEvKAwidqq6HXXBMK8qr/FBVOjY1iMDWufmbQyolB3W4Okhbi3evqbYVNbyG3
 oipC0/h+Xh8ECCYJFlog4PJTnJ7JAD0J5vLd8MaBgb9WKk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_041426_896525_8B5ED1A5 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

The entering of L23 lower-power state is optional, because the
connected endpoint might doesn't support it. So pcie-brcmstb shouldn't
print an error if it fails.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pci/controller/pcie-brcmstb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controlle=
r/pcie-brcmstb.c
index e733a27dc8df..9e7c5349c6c2 100644
=2D-- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1399,7 +1399,10 @@ static void brcm_pcie_remove_bus(struct pci_bus *bu=
s)
 	pcie->sr =3D NULL;
 }

-/* L23 is a low-power PCIe link state */
+/*
+ * Try to enter L23 ( low-power PCIe link state )
+ * This might fail if connected endpoint doesn't support it.
+ */
 static void brcm_pcie_enter_l23(struct brcm_pcie *pcie)
 {
 	void __iomem *base =3D pcie->base;
@@ -1422,7 +1425,7 @@ static void brcm_pcie_enter_l23(struct brcm_pcie *pc=
ie)
 	}

 	if (!l23)
-		dev_err(pcie->dev, "failed to enter low-power link state\n");
+		dev_dbg(pcie->dev, "Unable to enter low-power link state\n");
 }

 static int brcm_phy_cntl(struct brcm_pcie *pcie, const int start)
=2D-
2.34.1


