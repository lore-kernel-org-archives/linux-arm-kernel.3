Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2123E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0BA7iqw1thPHV06/lmELXjL7ByEp1rbkTCxKwOXO2A=; b=CLVrJV8ME1nHyyR0ouOTPAV3mj
	6pTrMuFfsN0Rq3ZxTZYsXOhmLmS3YMkLHDA/U6erD59B9TxT9PwB9alHNDb9jx9Ed8TQ1qmmA9iJh
	omv5POpFH635IVWgEepBys3ABf5ZcR3zGhqIITvebSl9v6GUKkyJEhbx+FQzQfh8cObbI+Wl8pGrS
	HdiQvPN/ec3selvDPIkpJjiRwtylOvLpsFKgeccbAp3uiuCw9kK1fPHq+I7z26VqX+1CiV8KhOD4T
	wmhhqxh1A8hR+dSqspuM2UsAejc+j6GTJUjFyJxyYbJH6qj6y8ZvA4ADbedmisj9xAw2KI3oldyRY
	M6fgIS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1jc-0000000BgWP-2G4z;
	Tue, 24 Dec 2024 10:01:52 +0000
Received: from mail-m15581.qiye.163.com ([101.71.155.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Xg-0000000Bdyg-1KmO;
	Tue, 24 Dec 2024 09:49:33 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4ee1;
	Tue, 24 Dec 2024 17:49:25 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/17] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Tue, 24 Dec 2024 17:49:04 +0800
Message-Id: <20241224094920.3821861-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxIHlYfGB8dGRhISk0dGUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f8123cba03afkunm6aad4ee1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxw6UTo5PDITFEoRFktLLCs*
	Gh4aCRxVSlVKTEhOS0hITE1NTk1OVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSUI3Bg++
DKIM-Signature: a=rsa-sha256;
	b=kDlja3iWYWdMq6LcgpOabX78pR0W+tigHsyEX80pTuf6bteEGFycAYoOTI/eLgSAqDFzcJ/gnoznmAYCzFk9sgpUmA+IEUFyBYzhcF3NPjozXheOLookix+uzryyg7fFfrFR6YbEZ9kix/86bxy+KyEfVpAYMMv7gPvrMHNDxxw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=v0BA7iqw1thPHV06/lmELXjL7ByEp1rbkTCxKwOXO2A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014932_541721_439D9275 
X-CRM114-Status: UNSURE (   6.90  )
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

rk3562 is using the same controller as rk3568.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 9a464731fa4a..dce6d68865c7 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -26,6 +26,7 @@ properties:
       - const: rockchip,rk3568-pcie
       - items:
           - enum:
+              - rockchip,rk3562-pcie
               - rockchip,rk3576-pcie
               - rockchip,rk3588-pcie
           - const: rockchip,rk3568-pcie
-- 
2.25.1


