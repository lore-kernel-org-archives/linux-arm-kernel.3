Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6084C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bxi0tIJBTHMG2GLAxKRyzHlO5PVp8JXAquIokUPhC7g=; b=F6hNtxajhKi3IQh2ILur+YoTjT
	ovq+FmNTMCWJAgow9UnQw0aWVowEcmzbnT+Rc0/lBuJSTGlgNYwZDOYPHtt0Jr1dDiW2QOSAWeLtH
	7f6SX/VJdiweTycjAuxUkrZ2DCQ6311sTLeB+4wEGcQzgYmQ50pZqdV95WXzZzMA7zNQQg3cloDnI
	w6kBycrQToXM8biSy0YpRC70o7uz8mYNgqQW2VdjbCH0jAyBjuMsYyKLLlExalZJpyvpzGDx5WZUY
	DVPyal1prvdVvw5lrUSe9qEl8kxUwajSpnXIazuqEFP/9uI1uHNVSvnNptxW8XR/I6Gdaob/SLTOE
	89Mv8YHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNc-00000006nyU-26Hk;
	Sat, 11 Jul 2026 19:28:52 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNZ-00000006nxW-1hwA;
	Sat, 11 Jul 2026 19:28:51 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 494D81D00082;
	Sat, 11 Jul 2026 15:28:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 15:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1783798125; x=1783884525; bh=Bxi0tIJBTHMG2GLAxKRyz
	HlO5PVp8JXAquIokUPhC7g=; b=jlW6cSOkha6VOPPLcr+2rZNVITVDfT+jzJ7kF
	KOG7RosscJVNmqSbhlcuF0ejGauWbOXgQ20gp1N2/2/WtSohL+T377beSu+YgMUy
	7w91vuLfRobfU/E+TZjVmCkdajiczhPX3b3vbwwnUuneKYqYRa9gSGQLys/HpcvN
	XDgz3ifUmd2It8VMrY8D5Z9JSDVDeTcasld6CZmkidTi/e+MusW0Bwac692wLTeE
	JYTcVMqAetHH3kknD7bUv6VRa54KWlIgHWU3S2gY7vsbl1so4hFpApHhWpd/YWd3
	qKho8nUH2dSDq5iXKjlA1rhlrrIbi0+7YKinJ3YUWcgWL2l2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783798125; x=1783884525; bh=Bxi0tIJBTHMG2GLAxKRyzHlO5PVp8JXAquI
	okUPhC7g=; b=fJa2ZGirBrrn9K2GLajyPQLQ6FNT5ueXJGemZ7UdGiyqQeGvsn7
	m3AwiYvaLIOlsqKzy4e4dygAJxpxObvBXub/MWkYJVrMYBfE5hT7Q31cYag10KrB
	oIXnTHtUoX4yoLnKWY2RAWkfGoclyKp2HPG40mxuX6xMCUg1Rn316STx6iSe6zue
	sP4d5LROzUJlpWlP87r5XOH7SGP7MUbI6xU+BEad+ZtaS4lhu0Bx5EUHWnE/Dgnz
	luO8//8SPb4smVQqEKjXAYCmZDWQe85b08gRuhrpfvaPHcsu0P5fZHwnDneCKHhz
	IzqUdBfrsl6c65psi7MFp9n8AZdKXkjY6pQ==
X-ME-Sender: <xms:bJlSalTYXKJqK1g5XO3JLIHVf5FYTjOsB5gwoktGXOqzCS-fK6pZFQ>
    <xme:bJlSalQzwTbj0pvmxKosUvPvaCiWhsVo1uULTFA-JLi-l4tbgxPe525_pbaLv70EM
    L5cvDkZqmrehOLPWkZtt-mdPPPBYurjo2D4AHoRiCTmhhWBIAHYCcs>
X-ME-Received: <xmr:bJlSao1duqa0pc02U8In3G1Vj81r9BYrTNOtPRPbjPGQhmj1GpbwAWaBS46SGhsIspJz2xfhjH1dWMKAymvHHwjFHa1wNf-wC0Pa8Sso5fHiiZ4l0EE>
X-ME-Proxy-Cause: dmFkZTEvfD0G2LPRWixeRxfokGmUFKLCtPqKeNMCJTyU24YvzEGRIiEmLZ5hUoHzQ6zhNA
    5fDLipFLSSvG9p2UkDpP5bP5rv0UC3te91u2jXc2PdCYjxdCfGu0IwkIW28yHlz9syQBSM
    TN5Ml5t/q4T9s5EKVFAzJD2vDheQpT0DgEkLBxeIcXuvYLoimT71nTz4DGYMViNAL3IwXA
    ezL01PC/0NiBm0RwqmFOq6c3dZbJRnzOOE816EjPHtr/D8OmoaEGd/qknhmy04IPTYGxTF
    47AjcxS2usfbM9SehLr83VVlJL6CvL1PoK3H+8lYy9w43ul9YEdwydSIk0KmOp3rpi9ylt
    GF50zPgstQWUnwZEzACRcDdLpdWX+KjxQkro0D8rgUJTpzFjOd//AzM1tOaF5BfA21Rpbb
    AgjX2BHxw7JZKqD/4bwTBQUFLBt8O+UlFbRo8eoVjbdxklZPlH1k0FPPvKPSUs1bPIN4ZX
    I5hPx4CzIXMJ5ZX/5zU9wUm3CfpTG4C/qOMo2xirMAOTdvZVmjYHvJuyyI4Tb1jTWtqbee
    hk1UUojKOf22o/Q6E62tdb2zAXQ2cTepQ3djT6rexaNlBJzV1iM6uh8f8PUzUMHF+aN9tB
    vu3nq4MLRebBtrVMo37D1rpVa5+B/mPrnwJGYSScCDdtK9AzVWNhq34AGwFg
X-ME-Proxy: <xmx:bJlSavzODP9cIbNRgWg4b0iBmT2AoFzL9HMM1KaMwAzDys1SoQBzVQ>
    <xmx:bJlSakxsqOxrnMvL8J1IAFRhLpisRWAvDF6ExoZkhqssMvoNWUWp7g>
    <xmx:bJlSar9X2HA073WcSt5fdvKlHclKcOfEpUaljHbtudgUkfT_Jr0SWw>
    <xmx:bJlSau9DfrijqEGZJ4762WFbTLmtri91-m5SKbrvnpz1qiPtxsm3Qw>
    <xmx:bZlSaqTe4hhmeU8lSL7p3RbOODBoJOxLUE5f8FwsjzhvlZ8KSEZNWxSQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:43 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/4] Add devicetree for LincPlus LincStation E1
Date: Sat, 11 Jul 2026 14:28:24 -0500
Message-ID: <20260711192842.845048-1-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_122849_798216_FA23E8A5 
X-CRM114-Status: GOOD (  12.41  )
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

This series adds a binding and devicetree for the LincStation E1 NAS.
As described in the message for patch 3, it is not entirely clear what
the DTS file name and board compatible string should be, so for now I
went with the marketing name for the file and the OEM model number for
the compatible string. This mostly matches the vendor firmware.

The vendor software provides quite limited access, so the unit must be
disassembled and the board removed to access the UART test points
(opposite from the power button; Ctrl+C to interrupt the vendor U-Boot)
or the eMMC traces to force the SoC into maskrom mode. The vendor
firmware uses rk3568_ddr_1056MHz_v1.25.bin from rkbin for DRAM init.
Mainline U-Boot 2026.07 works with no code changes when configured with
this devicetree. It is recommended to enable the fan as early as
possible (e.g. `CONFIG_PREBOOT="pwm enable 0 0"`).


Samuel Holland (4):
  dt-bindings: leds: Document "gpio" trigger
  dt-bindings: vendor-prefixes: Add techvision
  dt-bindings: arm: rockchip: Add LincStation E1
  arm64: dts: rockchip: Add LincStation E1

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/leds/common.yaml      |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3568-lincstation-e1.dts    | 1004 +++++++++++++++++
 5 files changed, 1014 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts

-- 
2.54.0

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
branch: up/lincstation-e1

