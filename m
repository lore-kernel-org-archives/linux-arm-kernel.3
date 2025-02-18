Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E8C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l5l755ruyNtPADHoOrFA6bFojSmArHIdny0GJW4lNQI=; b=CUypn89/qugj9NuoOabPk6JNlg
	IjZPwmswLMLrw+zy2KPivvseUEdWPMkn2EvhpSLcHZB5PHpkQnHhIoCihy0AM8i/+4TLvvvKwQg7D
	nAh2CVce4GIM+D0SeaEZuvDERqgRI+GA9Y3oWf7CXSnDWD7aXRwNP+UW1eob4cpXrtadoFMu3Ula2
	RFFok6n/BWDDgKCD9yLVFu/kMW3APWLPlVP3f2e07TiG27YQ6BsNZ+hgU920+D1fRgQFQJ+e2VShi
	+wZ5DcBxDS06p5/e3UXL8pq6ouuF4oywfCiIV/S7Cn6F82X/Lla5tmPwo2CEWPTWE2p11+GoyUhbh
	wUbrIaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTEe-00000009Z8C-2BvU;
	Tue, 18 Feb 2025 19:26:24 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkS-00000009S61-12bq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIsv1L1601132
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:54:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904897;
	bh=l5l755ruyNtPADHoOrFA6bFojSmArHIdny0GJW4lNQI=;
	h=From:To:CC:Subject:Date;
	b=m4o2vYKwiqUJ+OYW+cGctshgQ4uJb3sxGP/VCh337zZgspeJwnlEaJccwJXW0dz/2
	 fOiI7vDR2Oo7Pw1bHXaegEDNvGzPOJyQOtIVlyYEnC4jim2sseIR3EvOnuyMhyBnUZ
	 h63lRG1YKXzsuqEPTyPqm+PS4oPuGpBK6nlejSGc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIsvBM000686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:54:57 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:54:56 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:54:56 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIsrxY123821;
	Tue, 18 Feb 2025 12:54:53 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>,
        <y-abhilashchandra@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH 0/5] Add J722S CSI support
Date: Wed, 19 Feb 2025 00:24:47 +0530
Message-ID: <20250218185452.600797-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105512_340337_06AFFC36 
X-CRM114-Status: GOOD (  10.00  )
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

This series adds support for CSI2RX capture on J722S EVM
and enables IMX219 and OV5640 overlays to enables
4 sensors on EVM, this provides a reference for a user to
enable a different sensor on any of the ports.

Test logs:
IMX219: https://gist.github.com/vaishnavachath/60cc2ef257601f27f28a315f8cf669c4
OV5640: https://gist.github.com/vaishnavachath/648202286d4d34d4d25f7c8c9db8b8bd

Vaishnav Achath (5):
  arm64: dts: ti: k3-j722s-main: Add BCDMA CSI overrides
  arm64: dts: ti: k3-j722s-main: Add CSI2RX nodes
  arm64: dts: ti: k3-j722s-evm: Add camera peripherals
  arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

 arch/arm64/boot/dts/ti/Makefile               |   9 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 304 +++++++++++++++++
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 319 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       |  28 ++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 193 +++++++++++
 5 files changed, 853 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

-- 
2.34.1


