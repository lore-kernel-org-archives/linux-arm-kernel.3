Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE52E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUzOK9WaNKQ4slSmgvifD1Cc8ImfbMvJaVSG1wm/zOE=; b=GhNY927lWtxj5tyx+i0TPGaJhp
	J5uivvg2/SchrnhiyzN1I0r6MqXvjpJUGZagF98H0ycPHhpQb+q61UikGXIg68sfMKMksVywN49ws
	vohhFCGMEAJVJjNcHcdm9bZ4J6yq1n3Ixx2n5Ak2d4jz7wqiRvy6dGuzUHjLl9gsaLxwj+C37KzYx
	0serY0u+sI8UHMoFs514l1VZvjASOhyEaQEy9lFtIb1Vd4Uqf25/57B11yOnyvbX+y2w9A86cJUIe
	0s3rosQLfIMC9q7kcYhuFngSkiuPy9PB7xmVvyFTZVOsdSmpXxUWEK3EpdWtwQu5XMLiNf/26Y9yQ
	Gq54wWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYMT-000000093Ca-160w;
	Wed, 08 Jan 2025 15:52:49 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYKn-000000092sx-44II
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:51:08 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508Fp2Rx3124243
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 8 Jan 2025 09:51:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351462;
	bh=pUzOK9WaNKQ4slSmgvifD1Cc8ImfbMvJaVSG1wm/zOE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FU0f/LbgzoNtYVlrZ6rFRDO/Tdki2cwqXm4JijHxUQhnp/Emd49E0gjL8n5vrcXgE
	 akEl2s+lfY0eMGFYhqKSVYJF1KcZaQigPFKIQ80n4Nncp8q49d6YrHNVlJxEAYanTz
	 IDw5kiZLxwsSOxsykXqqL2/dqdcOnV+AKbvvdgVU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Fp2k7098285;
	Wed, 8 Jan 2025 09:51:02 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:51:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:51:02 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Fp2oe069429;
	Wed, 8 Jan 2025 09:51:02 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v4 0/4] Add PCIe Overlays for J721E, AM68 and AM69
Date: Wed, 8 Jan 2025 09:51:00 -0600
Message-ID: <173635143439.1208166.298500356758573677.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205105041.749576-1-s-vadapalli@ti.com>
References: <20241205105041.749576-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075106_098413_F9062657 
X-CRM114-Status: GOOD (  18.50  )
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

Hi Siddharth Vadapalli,

On Thu, 05 Dec 2024 16:20:32 +0530, Siddharth Vadapalli wrote:
> This series adds device-tree overlays for enabling Endpoint mode of
> operation of the PCIe Controllers on TI's J721E, AM68 and AM69 SoCs.
> 
> Only the second patch of this series has a v3 while the rest of the
> patches have been newly introduced in this series. The reason for
> grouping patches is the dependency on the Makefile w.r.t. the changes
> made in the patches when enabling overlays.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: Makefile: Fix typo "k3-j7200-evm-pcie1-ep.dtbo"
      commit: a7543eaeb31544b9c3f6248cac8189aa1480c0f5
[2/4] arm64: dts: ti: k3-j721e-evm: Add overlay for PCIE1 Endpoint Mode
      commit: c3015d4540a47ced846bf973e5a473fb4181662a
[3/4] arm64: dts: ti: k3-am68-sk-base-board: Add overlay for PCIE1 Endpoint Mode
      commit: 58efed5800e901cf9b320c56e8879878f09b8291
[4/4] arm64: dts: ti: k3-am69-sk: Add overlay for PCIE0 Endpoint Mode
      commit: b09cc758bc015a100b440d5c70098aebd0ddcd43

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


