Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMUYSJ7xBVV0t5hQTWAsU9tTxBU1IRIZP+YZk6vKoeM=; b=uPA2pu2HAfFeQbhHf4Pi9bpPx/
	RzlUhAlw2cTOx9PVg5LUhIRBR4S+WOUGpuzJLR2iPFIEodaUdaBDJeXMWSRBTIRGeHGFEorfF2f/l
	yPOAmFY2UmgRgxmaJW/+OFdWWXdHI6qtpzPQWpvmz2sbR7oZF+kjXgaYZ55LowDwnl00QFK9hI7rX
	GCduRpqNru5YrNeTIoNFlpb1smZ0vdbi02J0rlo6VUu1jJXmQQqu5nJM2zi/hMMMfff02PQa+FuFG
	k67Tznfo5bcADT39yPJhKiQvNgg/hgX083bvrRP33PfsT767b8aQH1xJrACRCqg1PSqmNRHDKqlWv
	NbGA8ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTxa-00000008eCV-3hE7;
	Wed, 09 Jul 2025 12:31:38 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSAo-00000008KEN-2s1X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:37:13 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569Ab0p51188098;
	Wed, 9 Jul 2025 05:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752057420;
	bh=iMUYSJ7xBVV0t5hQTWAsU9tTxBU1IRIZP+YZk6vKoeM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=whwcpcgbB8u/eMt37gEb+uE9LOQ0MvfGiDOrvSfVXRX/EMYJi8Y/nJl823PEUTKRi
	 cfQeHCC8Y/A/oIs50TNi5g43EVmsLBYrv9KJD7xFEQqJALUIgDEiIpqBEf8taR7Z1y
	 Ur1cjhAfbxMKK08p2FleJksLpbxgH/REOE4mS/bs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569Ab0e8051395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:37:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:37:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:37:00 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569AauhT3789718;
	Wed, 9 Jul 2025 05:36:57 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Parth Pancholi <parth105105@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Parth Pancholi
	<parth.pancholi@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO direction
Date: Wed, 9 Jul 2025 16:06:42 +0530
Message-ID: <175205738886.920395.8483860730913081511.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703084534.1649594-1-parth105105@gmail.com>
References: <20250703084534.1649594-1-parth105105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_033712_420198_40018CF9 
X-CRM114-Status: GOOD (  13.90  )
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

Hi Parth Pancholi,

On Thu, 03 Jul 2025 10:45:34 +0200, Parth Pancholi wrote:
> PWM_3_DSI is used as the HDMI Hot-Plug Detect (HPD) GPIO for the Verdin
> DSI-to-HDMI adapter. After the commit 33bab9d84e52 ("arm64: dts: ti:
> k3-am62p: fix pinctrl settings"), the pin was incorrectly set as output
> without RXACTIVE, breaking HPD detection and display functionality.
> The issue was previously hidden and worked by chance before the mentioned
> pinctrl fix.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO direction
      commit: b1a8daa7cf2650637f6cca6aaf014bee89672120

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


