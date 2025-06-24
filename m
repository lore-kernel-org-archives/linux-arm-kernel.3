Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0F6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryKve62wZWyoV8Jf68Qb1NJxYQaLU+F3unuU2gjuvFw=; b=0JRQvCpuakz/cN6NMBdVw5IUza
	2JDt31Q6t4N7JI6YWIEd/UOTyt7Zt+Hl/11iSEYSM05iEghUxrDeJc1h3beK8lR/wMp6OMdERbWsT
	0Q/P2spY90UNe/USIVsT20tiJVD8pKlz/dDKidqyGAUg3GS3Kq/AMVobgALWeLEgklD74MomhCkOZ
	J0raAKSbftesqkjocECyhuoXm5CNtdynUJQp6JHX098F0Gm9436I4MyLdIWfhQ1Y5qoFSSwONPGSp
	F6vaYmJ1nu3A1uvimkH5HmLQiRLNx6Lr/AMBvhjA0FtkePjjoAYGBHpdP38fW7P4a6823Q9vC74NX
	XJ9lk2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAFy-00000006lS1-2h7z;
	Tue, 24 Jun 2025 20:28:38 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8eg-00000006Xsl-3cxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:46:04 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIjxq61631233;
	Tue, 24 Jun 2025 13:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790759;
	bh=ryKve62wZWyoV8Jf68Qb1NJxYQaLU+F3unuU2gjuvFw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=czkr/+gN/RPfBFITbT9oUkZqztPreUMZHL54ISw0UlHXGCN9reB5vogrMrRhFcpsc
	 Wiw9dCFUbCxHW4R6uo+fCgawL39YaWdIv7ijPit6RZgUTqpPczpjOCqjHyQxrTejPC
	 2hTmXLPSVFn9wZK1AoJVZvRzRVBSC+2yjX/R7ItM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIjxt21801622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:45:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:45:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:45:59 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIjtK31993515;
	Tue, 24 Jun 2025 13:45:55 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Emanuele Ghidoli <ghidoliemanuele@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
Date: Wed, 25 Jun 2025 00:15:50 +0530
Message-ID: <175079060331.1874839.8272490827438865820.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
References: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114602_993303_3497E12D 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Emanuele Ghidoli,

On Thu, 29 May 2025 12:25:54 +0200, Emanuele Ghidoli wrote:
> Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
      commit: cb2d9c00770e2e6c51864704b5d98c9a0ddccaf9

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


