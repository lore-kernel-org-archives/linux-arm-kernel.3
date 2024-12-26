Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ABDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioOSpy2q5tRAqXjjc30K+XBynOGb640df/7gxCK2eV4=; b=PFg5e37RKTVKxl6xao//v8rPG+
	RsXboNrG09Shxg8IwQE3xB7T4M0c2RndpQONgXJ5iQQhVnm+Qv5JVrGy1dB6RftYAGjutFrWfqNzI
	fleVbjXED+hS61AUeIPLquTcuS90Y+RujazIo4mkMJMff22ZxqUxjLtfxRXq5JLzMtiBDD2xeb7gU
	yhJLZa1r1e5IN4hF4/SMbp94oAcPkZHHrCSdPVYhgl6qRTfArJhyuNf5QuBeFji6qZG9qnpDLTdxD
	7XFSjMaLnyGjnc9UkCdAjP6xkVHFI3IT7McJP5JQjg/SokGAxTT/bJ81HdYTK/YI3XTBLu8CjIOCp
	rETeUJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrjs-0000000G9C4-41tU;
	Thu, 26 Dec 2024 17:33:36 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrgh-0000000G8lt-0bk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:30:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQHU5hA1321602
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 11:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735234205;
	bh=ioOSpy2q5tRAqXjjc30K+XBynOGb640df/7gxCK2eV4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u0eeG/UQ9DBZVZwJZhaqOnyINPv0jlcDgBNd7csOOb6nCWgogs6WPi/uStSFwu2ot
	 1PB/ak0m/5HudyIC/odVY66SvXGm8fkO26Dsj9CH1+gutToODkRGt9B6rP8f5E64gk
	 YeukQsEPoTCvV50WiLEvjzlO8HQkdcnK7AfeY52Q=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQHU5L7062537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 11:30:05 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 11:30:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 11:30:03 -0600
Received: from localhost ([10.249.33.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQHU3OL066075;
	Thu, 26 Dec 2024 11:30:03 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Wadim Egorov
	<w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <upstream@lists.phytec.de>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62x-phyboard-lyra: Set RGB input to 16-bit for HDMI bridge
Date: Thu, 26 Dec 2024 11:30:00 -0600
Message-ID: <173523339473.39503.8596566004787069215.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241101131427.3815341-1-w.egorov@phytec.de>
References: <20241101131427.3815341-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093019_317300_7D7A6EC4 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Wadim Egorov,

On Fri, 01 Nov 2024 14:14:24 +0100, Wadim Egorov wrote:
> The phyBOARD-Lyra connects only 16 pins to the SII902x HDMI bridge's RGB
> input. The default 24-bit setting causes incorrect color output. Update
> to 16-bit to match the hardware configuration.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62x-phyboard-lyra: Set RGB input to 16-bit for HDMI bridge
      commit: a4b422390be3c4147db6d97b016adecb3573635d
[2/4] arm64: dts: ti: k3-am62x-phyboard-lyra: Add HDMI bridge regulators
      commit: 2a0418ac48d3083e2b209242237abef84497d19f
[3/4] arm64: dts: ti: k3-am62-phycore-som: Define vcc-supply for I2C EEPROM
      commit: 4ffe12ccae4ab20e5dc41dc428f909467ed7cc4d
[4/4] arm64: dts: ti: am62-phyboard-lyra: Provide a vcc-supply for the I2C EEPROM
      commit: 80ad23c4032c6b2afe225c866b9496472965b9ed

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

