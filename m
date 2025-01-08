Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483B2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqFtwVC5XSLD055A7clzERGo2EcKKQ93ePEvcJRgB3A=; b=TXP18GpnBx19GMoVLKeXM1LOR8
	ZR/iYKp7DHcz1MoakHgoKIWnYPDx5DJATNKM3tgSoO2nqEww0oUEF/D9GNwvaCLL0vr6Dhi1XeDUM
	pJ8pceki4iXzYXTomGp4JVtVn7xaZQTpAE7aJlGEDbw4dOf8XAg8qDi9gYaVQlXlaMxHPsMACxoxf
	ZQSU+8ufLJaWdSWLliEI+z1vw0tE8zk5sx0HyzQWXtyH/KHAYdKssk9UIT/YHRlnZuokYkl1Ck67S
	9KhZQVVLGQIlaqHwS4uiDFa7zIDpG52G80H/NY/Q/Wb3odmmw7ooN+Itnq5uyPugzbi+UpLWUHxST
	9N5kuF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYLH-000000092xU-2U4I;
	Wed, 08 Jan 2025 15:51:35 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYK2-000000092c3-3kt0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:50:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508FoCNH2822969
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 09:50:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351412;
	bh=lqFtwVC5XSLD055A7clzERGo2EcKKQ93ePEvcJRgB3A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Nmji8pdYdBU8WzwXSqvdyMTCyc3OO3VxoKNDLp1lp1pE48z59z9UWBF0R6JqDGLj+
	 Oopnntx5cT8HVK0eEP91IwygXvM48aAqV/zFMUL1dEHv2+biIkf7KeeY9q5z/N/CQ1
	 NbEqHWEpiD3HDU2TJdx5MSs3dIZtGDL/To5xRxfU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FoCpk014885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:50:12 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:50:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:50:12 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FoC5J086600;
	Wed, 8 Jan 2025 09:50:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Hari Nagalla <hnagalla@ti.com>, Andrew Davis
	<afd@ti.com>,
        Daniel Schultz <D.Schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v11 0/9] TI K3 M4F support on AM62 and AM64 SoCs
Date: Wed, 8 Jan 2025 09:49:59 -0600
Message-ID: <173635131453.1207749.10651955130029971978.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240802152109.137243-1-afd@ti.com>
References: <20240802152109.137243-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075019_021516_0BB6A271 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Andrew Davis,

On Fri, 02 Aug 2024 10:21:00 -0500, Andrew Davis wrote:
> This is the continuation of the M4F RProc support series from here[0].
> I'm helping out with the upstream task for Hari and so versions (v8+)
> is a little different than the previous(v7-) postings[0]. Most notable
> change I've introduced being the patches factoring out common support
> from the current K3 R5 and DSP drivers have been dropped. I'd like
> to do that re-factor *after* getting this driver in shape, that way
> we have 3 similar drivers to factor out from vs trying to make those
> changes in parallel with the series adding M4 support.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[9/9] arm64: defconfig: Enable TI K3 M4 remoteproc driver
      commit: 184caba444cfd4b90231de7d071b9966c115c29f

Thanks for the headsup Daniel.

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


