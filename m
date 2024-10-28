Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB92D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gx1ESAmVytH8Um5rIC3OkBCktJHLJF3/Z1qDATXgXjE=; b=PCW5Nz0jGWc8r8XzsSK4Rwt9gv
	eY147d+PwPsOsbKvdByB/Ea+mIjEX7RQs6V9SpKAQgZQQKvtNNZNtKnktBLENj1TE0fKoiBKw9pki
	5EZABL78ckgj7r8o7IWiud2bSB3gXD5ZCN/5Qm50Q1gUkU/aF9MwPPy4UuFyKivIk1AumGN54ZDvk
	tPKMcxCGV2+KNTYU+AObOB0CxtKhZ9y6Ij7l7dk3EZQq1nTsAiuFge5jFp+HoQ/tvyqRU9ROX1nzA
	reWO7mPzCsa03lYhQzBldCry8Bv99eZW7r6IHV9OAnxuMFVUHlhyn6mUwTBUzGal8/6amlsjT476F
	qW/PJsVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S1H-0000000BNGy-2BnT;
	Mon, 28 Oct 2024 15:51:03 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RM3-0000000BFtR-2mgd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:08:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SF8Ox3024829;
	Mon, 28 Oct 2024 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128104;
	bh=Gx1ESAmVytH8Um5rIC3OkBCktJHLJF3/Z1qDATXgXjE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yg+IIvk9jmGlq6ZRDfVy0theDCtSnN/eqJ4zLfPaxhIcI2lmQE4Cn5Ud8nOFcPYdg
	 Jw1fj+k60mCPcsAosOC7yhvjzjcoznIY9HSes5K4fVUADWz8XuGWxL9CChSEQDdAET
	 xfS5VaLLAvhAycPpMj05KxjXIf6LOBmr5BGVYRDM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49SF8Ofj052100
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 10:08:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:08:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:08:23 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SF5tct129665;
	Mon, 28 Oct 2024 10:08:19 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manorit Chawdhry <m-chawdhry@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Udit Kumar <u-kumar1@ti.com>,
        Neha Malcom
 Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/5] Introduce J742S2 SoC and EVM
Date: Mon, 28 Oct 2024 20:35:25 +0530
Message-ID: <173012710987.558239.1177036960002400473.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240902-b4-upstream-j742s2-v6-0-6a7aa2736797@ti.com>
References: <20240902-b4-upstream-j742s2-v6-0-6a7aa2736797@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080827_823072_FEAB86CA 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Manorit Chawdhry,

On Mon, 02 Sep 2024 17:56:48 +0530, Manorit Chawdhry wrote:
> The series adds support for J742S2 family of SoCs. Also adds J742S2 EVM
> Support and re-uses most of the stuff from the superset device J784s4.
> 
> It initially cleans up the J784s4 SoC files so that they can be
> re-usable for j742s2 by introducing -common files. Next it cleans up the
> EVM files for j784s4 in a similar way and then goes about adding the
> support for j742s2.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: Refactor J784s4 SoC files to a common file
      commit: 9cc161a4509c2fda7cbe35b4858b496cec03c5d0
[2/5] arm64: dts: ti: Refactor J784s4-evm to a common file
      commit: 39b623c05c4652f2ec450a07cee3d179a283733b
[3/5] dt-bindings: arm: ti: Add bindings for J742S2 SoCs and Boards
      commit: 9c65033884bfec836fe45f21d079de40fc7c7bda
[4/5] arm64: dts: ti: Introduce J742S2 SoC family
      commit: 38fd90a3e1ac7e948081cf168cf10f0a20febc21
[5/5] arm64: dts: ti: Add support for J742S2 EVM board
      commit: 13dc96a52712053cfad59b0d11cab694ed5bc5ef

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


