Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68FBD74962
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jENql/JSGijaO51AIfErQCfqmfrbjatMPfN+Lc1t6vM=; b=HUlvoyXdWC+7ppqzU/4dNgzK5g
	kYiiBzl55n9uirKFSPC0Tm3FLvmdtaWtrWG8W9qNR+1TbSQj6S3JvXUEFiXnFQuc0xvngFvHAp68z
	tazd7zzDPqlFBJ2uBARgEG8sd2WmEcHYBFAaDO71fnyFUgQWjLfxd93vgKlDzJKBVX3D0Z0nOOb/A
	pMKl9eRR9fHj5+i/lmLsEg91qsUBMU0syJIqEOrOv2UfvsuZ/Q4bBU1v2eUT3lqRs2fSsfUDLTRIL
	3oyzIHDfuLMX6uJ47iXSWOwFEccFGvTlRiJXyqgqIv9VeOfEHgrpE8CGjkxtLmQmstS9VLyEe6TLM
	KjlqMmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60n5-0000000GjJ0-3dOV;
	Wed, 30 Oct 2024 04:58:43 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60ga-0000000GiRT-0cIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:52:03 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4ptv3046150;
	Tue, 29 Oct 2024 23:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263915;
	bh=jENql/JSGijaO51AIfErQCfqmfrbjatMPfN+Lc1t6vM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TvgSqcCoshNhLT2WsRBHnmLIrWxj0EABkJKiP6S29tdE08vt+ebDFWfCEffVf+ivK
	 rHf8MoB+mkAGQsl+7CopGi2h8yFmWzQn6g4gGoLMR82G5IDrpLtvfklnjscCwoPOJW
	 ZOJd6C60oWuecT7MJ8DE+5xsslaPcQhxafiOYdcg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4ptxp085245;
	Tue, 29 Oct 2024 23:51:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:51:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:51:55 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4pp9e062140;
	Tue, 29 Oct 2024 23:51:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?=
	<jpaulo.silvagoncalves@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-verdin: Fix SoM ADC compatible
Date: Wed, 30 Oct 2024 10:21:47 +0530
Message-ID: <173021674664.3859929.252749757982306283.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015113334.246110-1-jpaulo.silvagoncalves@gmail.com>
References: <20241015113334.246110-1-jpaulo.silvagoncalves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215200_301361_BE1090D7 
X-CRM114-Status: GOOD (  13.92  )
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

Hi João Paulo Gonçalves,

On Tue, 15 Oct 2024 08:33:34 -0300, João Paulo Gonçalves wrote:
> Fix Verdin AM62 on-SOM ADC compatible. Currently the hardware is not
> correctly described in the DT, use the correct TI TLA2024 compatible that
> matches what is assembled on the board.
> 
> The "ti,tla2024" compatible was introduced in Linux v5.19 and Verdin AM62
> support was introduced in Linux v6.5.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: Fix SoM ADC compatible
      commit: ab53b8c0ac975d8c4d61927d2be14afce14f6902

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


