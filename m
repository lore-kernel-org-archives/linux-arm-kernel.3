Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A04C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53XdUqfFsxdrkTPF8ii63mrk/KIlvgnwsDsFFeftRxU=; b=b3oczqdieGeKgCfAmfESrgFC2x
	zHfxD+n42+Q891OHbgAdKnU7iiawfIIGVBIEIU+sIMrwBltTJKvLHm+H8HenNMnGz/+pMnJO2dkp8
	OkB7j2nW5eGwE2mQuW7Qt4JK/BB5yHMQLokmK/kxdP0y+sJrh48RRAyl8D2/pQS7rMJWDgwA5PmYN
	MJB0IE+LVoqTIvkLGZw5b0HWmVzTqMZ7Im4UcVU0WrSM19CDF642hSrrBQC+WiOrhKtRWxrnHo9ez
	FH/j/5oVicjIgiP5IR+y4HAiet3y7lD4/Wej08h5X3dFrNPh8xKCfxwokGNd8NAuNj6wf93tzAR0x
	9WilusTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Qdh-00000000vaw-21tG;
	Fri, 25 Apr 2025 21:31:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QLJ-00000000tkN-3pfs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:12:19 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLC68G3027242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615526;
	bh=53XdUqfFsxdrkTPF8ii63mrk/KIlvgnwsDsFFeftRxU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZvDBk8FINxfAVVdEMHDMIFpyEu68m8UfqsIg3+hLvhudhsuqvAQ+X6HC5ycYRa12b
	 Hksw7Q0NfmfvAALvmLXoC3l98l5QcrxMKOcDzK1V8/61RLj9ICIGSsy/VslGXeYQhz
	 DPvcPbOfU96V5EjGTDTCZX4ONZGGqzNPfuSMp7lU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLC62b017024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:12:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:12:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:12:05 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLC5gr096254;
	Fri, 25 Apr 2025 16:12:05 -0500
From: Nishanth Menon <nm@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <bjorn.andersson@oss.qualcomm.com>,
        <krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>,
        <lumag@kernel.org>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Fri, 25 Apr 2025 16:12:02 -0500
Message-ID: <174561548590.210587.7393005807062359269.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250416182930.32132-1-j-choudhary@ti.com>
References: <20250416182930.32132-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_141218_040337_48A21C45 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Jayesh Choudhary,

On Wed, 16 Apr 2025 23:59:30 +0530, Jayesh Choudhary wrote:
> Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
> display on the following TI platforms:
> J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
> BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM
> 
> The dsi wrapper driver used by all the above mentioned platforms,
> cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1] with minor
commit message update (Beagle is not a TI platform :) ).
Thank you!

[1/1] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
      commit: 882c214572e43b56f781883d4ae48689381a68f1

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


