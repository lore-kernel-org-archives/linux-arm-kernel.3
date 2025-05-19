Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C207AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQ1ompgyCMn14v9eAHGYNNFa2eIm0+XuqB0rGspAta8=; b=k33e6QeH47jjO1DZiSIRsfY9GF
	R8MyRufWsxHFiEbDTFcvpHUFrrJI24Rv3XaPHR4fzWRMjCMZqFdDuXKzKYuj5Swaelxtip8l6gYSM
	ew9YVRcVN35vT7tscUs2IC4mbmQYI5sAj/FincmZgIu3ntvTz+hAwxsbQuVcjc1NYlklqunu5eKfE
	vYATfocpLqWZy2MEyoWN6Yi6yz+6WPpmEl+8moHzSLvHTjYNjcfXTrVVcfnNR/gyRFMjBEz2YKXwT
	am+i4R4WA8GMkXF7uu/XJ7K9IzqU9vLGPWppVOnD1mzYT2Ud3BkrZnKlu2MnAq7jDY1PbZPbR93tH
	muM3IBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvYw-00000008JAP-2tUO;
	Mon, 19 May 2025 08:09:30 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvMh-00000008HQ7-3c44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:56:53 +0000
X-QQ-mid: esmtpsz16t1747641302t978062b3
X-QQ-Originating-IP: Y5+0uhBMb6O+WTaaSJz5+Fz6iYdOQsJ1GOUrFSOcmmk=
Received: from localhost.localdomain ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 15:54:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12531447371105096942
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 19 May 2025 15:54:30 +0800
Message-Id: <20250519075432.2239713-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MjA5tsjrlPcvo1VRqp4hQ176Hre5v7/hVw1eD48NjQvkcT0lbMMbBG1t
	LI/aOJNENlHwd9iPl/SxuPcRYZPxYRcoMk/NBCs3BcPLFfAgs3rBk3TgSQ6hNGhD3KUyzhJ
	IxPNW1KdgA6jkVdxIYyJhwZgipus2GO6m3q/LHKW/t4rJXxZrUY6ZzvnJ1Xtz+Mjl94hxcB
	MmwkSp0+rbnKOiX1JmdFMZqz5j7EHrQa1NrTKIc9UrCRG2uMGNsYcSUS5KybBykkojmZnF3
	wq0tBhCUErM8FzDmYO7N1S/lK78qerfI/0J8sUEWiwcL0e5yEUc/UpCvNvpXZsSWPHILGgE
	lFNH6dUQ2zlCCsAOh+TKlwLxsVv+HqvZtZeZQb5Pk5G6KI8g9R6LyKfwYQa91m7HELY+PtW
	HCu5yGJOf9XGETT0k8zY7fhh2cgnqW8oJLCXIFJ0AvL6+EOKDbRYLAcRWqlz2RVkiqojzIf
	gw2TOL3qyADFmhWKJpkWBJ9sUiuo90vIs1fuNqrWfJn8FF9eQExXL4vjx3C8G5d3Dw/auSV
	pF1PdP8wjKAQs7K9IO86dr//7Fb3ngSfSi4JLzc51RWbl0odiz4VZ+UmmQsE489NgPQT1Om
	5PXcc3r4y38RU35Vf7bv9zA07JuueZcQLCJNTeRbWqyG1T/RpuRl7RndY9WCbGYloem5dhd
	gKrwMi5hit3b8k6U0umBgTGDihe3GD49lgFYDLQD9mlG4ya+ol7cVgKp7mnlzR6E866b67F
	/pB4wFfrd/Usek0LGKPU5hXnOs9M2IdW8ao2159XmUIA6Exz3j7x3DpRashzT0P2wSzqtlx
	4ClQL/3wF6dHqMERJN5SCm3N9P6/rgwPUZEj2pwkfDcMnAMlI+/sxjN1T4X2iM9cGgmnhi+
	4FIs6vzGoZ9DV5K+6/8+IWZ4zxQGapRRiylZPXiTq759srrP/zcFn7SIWwQG3158jGsLgxS
	a4k9Vaw21IjgbiOB1vxvMO+cW73nB1qgk61jeflMyHoPH4A==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_005652_439588_F814740A 
X-CRM114-Status: GOOD (  12.03  )
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

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v4:
- Update the name of the regulator
- Remove the i2s5_8ch node

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 922 ++++++++++++++++++
 3 files changed, 928 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


