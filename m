Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063EC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFn+hOnf9zq0L8ZJbLyMTxETpp+UGQGS34ngpAHtMqk=; b=ySNjuZUcIZMB65T85SzkhZFOVh
	10Wcfp5EBhes9l7moSC5wLzR/12twPCTqjSxg94OM8WB0DrazBRDKB8Oyc7uNNaIvSjyzDvgAE6gb
	WwwGHxwLqBRTGouVGznuKNGS/D9RO+daxkXc7dNQrqGB1Voqa1auLxOjLQKnRYR/e5KZsfxxOY3O0
	UFRJfGwA5pbYbhPVZUj/jsp09929Mq19zrlJS+yzxv5HIgFAlRqUfFWWzhrL8bzz6I5I8EAiXVbOm
	SX0MgSgW/G1L+XMm5+YfPcXUzS78iKGpcS17+qPyG0FAFzVJL8chzZHes1FvgDblUOW+lYLIIcAPE
	K5u/U/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArdq-00000002EUk-1VIP;
	Fri, 02 May 2025 14:45:30 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArbq-00000002ECr-1UAI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:43:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EhMb9251096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197002;
	bh=XFn+hOnf9zq0L8ZJbLyMTxETpp+UGQGS34ngpAHtMqk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QJIOLxi0PCJS5/mK9FB9i8TCyvAefymLc3sInip4s6z9dWd3JQ0VWNrgrdSA43RrV
	 WHVg4oTb003UUoLPdIPVjvwocTqCaLYRvuC5RaZT4rghhSXbmu5lc7hPknfW/uSOcy
	 dQd8GsjzdtAKgtHn4RRxw1FCnRCM1w8n3GBVQGrM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EhM0j037209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:43:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:43:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:43:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EhLV6127656;
	Fri, 2 May 2025 09:43:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
Subject: Re: [PATCH v3 0/3] Misc MMC updates
Date: Fri, 2 May 2025 09:43:19 -0500
Message-ID: <174619698064.3122712.13100882645410277717.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429151454.4160506-1-jm@ti.com>
References: <20250429151454.4160506-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074326_588532_5DA25ED4 
X-CRM114-Status: GOOD (  15.53  )
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

Hi Judith Mendez,

On Tue, 29 Apr 2025 10:14:51 -0500, Judith Mendez wrote:
> This patch series includes updates for eMMC and SD nodes across
> Sitara K3 SoC boards:
> 
> Add boot phase flag to MMC nodes and dependency nodes to support SD and
> eMMC boot.
> Add non-removable flag to eMMC nodes to void having to redetect
> eMMC after suspend/resume.
> Remove disable-wp for eMMC nodes since property is specific to SD.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
      commit: db3cd905b8c8cd40f15a34e30a225704bb8a2fcb
[2/3] arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
      commit: d16e7d34352c4107a81888e9aab4ea4748076e70
[3/3] arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
      commit: ef839ba8142f14513ba396a033110526b7008096

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


