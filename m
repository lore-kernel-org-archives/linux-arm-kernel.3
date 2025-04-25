Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA585C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOLo4yI6anIB9RSZml2FqX4EolYygPTDxgSa2K0zE/g=; b=fw2XkOLyPSBUR1AGc5yx6qS+r0
	QcSPwfpx8YrGhpJx0GtQuSBKwExEEz8P0TdslA1aEvXcioX0z1cKQkjNizlnEfaoHdClnvITRElaw
	Q4H4oI+e8laJ1ljcI/esdEDb8eS5ynCMGh8TOg9B73wKCIXbnQ7PaE4VQQWNdQRWGIEPlJL9zSkUs
	BqQ9trvWTS1z21aBCZvfsVn9rxoIaUM9opnn6TND0spX81zsDYy/R+1EBDk5RGTYYCoUQAIfFsDoT
	NjgEwGoruLqVbv69QxtABkWcQ120xuXCBegK9tqZ7xp8cowe1W75BRSxwFpYfEM5kshkHcPwfms3G
	ju/F4k/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QJY-00000000tRM-068J;
	Fri, 25 Apr 2025 21:10:28 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QHf-00000000t72-2WmN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:08:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL8RQJ2276113
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615307;
	bh=bOLo4yI6anIB9RSZml2FqX4EolYygPTDxgSa2K0zE/g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cKkVqxFL/z2T5f1UWy8G/FFzwwwGzvDo5RhQSX4qWi8jV5af7D5YWjCLMGYTxnkQn
	 jmRDtDDgMgFSUkv2RK0AZHHgLo/Nru0Oi0N+nXg70M/EXlEamdzP+owbgBTH4/nTWA
	 C4fCNmzBh+uwW0Vr6xoooVNNmrbCsqf9zL57xIuA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PL8RqR078039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:08:27 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:08:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:08:27 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PL8R2H103328;
	Fri, 25 Apr 2025 16:08:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <kristo@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Fix nodes for dtbs warnings
Date: Fri, 25 Apr 2025 16:08:25 -0500
Message-ID: <174561523560.209754.14404777210651479379.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250424080328.57671-1-j-choudhary@ti.com>
References: <20250424080328.57671-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_140831_744060_100BB0DF 
X-CRM114-Status: GOOD (  17.75  )
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

On Thu, 24 Apr 2025 13:33:28 +0530, Jayesh Choudhary wrote:
> Fix hdmi-connector and tfp bridge node as per the bindings,
> - remove 'digital' property which is required for DVI connector not HDMI
> - Add 'ti,deskew' property which is a required property
> - Fix ports property for tfp410 bridge
> - Change node names appropriately
> 
> Redefine the ports for dss and for k3-j721e-common-proc-board.dts,
> add reg property for the port (@0) to get rid of dtbs_warnings in
> infotainment overlay when ports for dss are re-defined.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. I had
done minor fixups in the commit message and dropped the fixes tag as
the fixups donot seem to have functional impact to require to go down
the stable flow. Let me know if you think otherwise and we can drop
the patch and respin the series.

Thank you!

[1/1] arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Fix nodes for dtbs warnings
      commit: 8a0bba5b6730a1491a111bf54de5d8dcc23c8e10

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


