Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214F2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Sg6YHeYGi4yQZWG2m4AEtdd8BiAgP7BgQnUSkYjEUg=; b=L9AVmpA6N1JFcgv2DtpsvXZaHd
	ZcyMjoMK4xc+d6uPPXLE03mGxYosqJnUcr3e4apmkNmouaUciHhTo/LosI3bxRoEfNwIWKKavyM0E
	cR6dVCtHDSKSrjW5Bx/Ncfs0kdBdD+lYJ4K2uDfr1lt0SlIK909pe1H84Bak+BqJIz1LvqanlpAmH
	7NiraTOIyLyifUFwNRzgL1LS/D9eVfaIPSgFPVToF0AOpnpJu60MKAXKaCKuFczfn6fU1rdhjV30q
	AB/ICxWeCEghr0qJPwQ/yrnklzd94H++Y8J2YQqIlOAPipf2XJSXMILTxMW2HaUWRJ36jH59zlyML
	sVFTsnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYLJ-000000047TY-1erY;
	Tue, 15 Jul 2025 05:36:41 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYEG-000000046hv-3V1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:29:26 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F5TMXV2816970;
	Tue, 15 Jul 2025 00:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752557362;
	bh=1Sg6YHeYGi4yQZWG2m4AEtdd8BiAgP7BgQnUSkYjEUg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VlhI2Y5+D6+8I5heNwJRGORpiY7UCavO9603xgX7PlwAaQiIdxDGccUrmfQMg4bVb
	 mYq2l6KxgpZomquqlYWgi92XoeXSYzvYpMCLIwBpsQ3Va601cIqJkvxkLKYtZQMNwh
	 Taz5iV6XAI2XlvIFcr2eulvwA691U/Ir14nt0qk8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F5TM8T1037124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 00:29:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 00:29:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 00:29:21 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F5TIFc2337840;
	Tue, 15 Jul 2025 00:29:18 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: ti: k3-am65: add boot phases to critical nodes
Date: Tue, 15 Jul 2025 10:58:59 +0530
Message-ID: <175240652599.4073742.12757905646611609157.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-65-boot-phases-v2-0-d431deb88783@ti.com>
References: <20250710-65-boot-phases-v2-0-d431deb88783@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_222924_960787_C25427F6 
X-CRM114-Status: GOOD (  16.20  )
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

Hi Bryan Brattlof,

On Thu, 10 Jul 2025 09:38:58 -0500, Bryan Brattlof wrote:
> To save precious on chip RAM space during bootup 'bootph-*' flags was
> added to the dt-schema to describe which nodes need to be present during
> each phase of the bootup process and which can be pruned to recover RAM
> space that would otherwise be wasted.
> 
> This small series adds the bootph-all flags to all the boot critical
> nodes for all boards that utilize the AM65x as well as to the AM65's
> reference board.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am65: add boot phase tags
      commit: 3302e07346fea5709621a71c2cdb93ffbef2108a
[2/2] arm64: dts: ti: k3-am654-base-board: add boot phase tags
      commit: df62b42b0f37c4fe71613383c6a083dfff7f2c86

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


