Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40FCC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGRzkNwck2VgyYwpwN+WuSVIvbmopA7IPAFz7KH7CAY=; b=IJP0k8dPp0bk4N5WMS62OS16yj
	ELWl2nysCHRBEeKidh9HhFJvhwNbfhjS/3QSKqY5Y9DE/dxBzvF2eWvjUMXlEg78XsBPVa2+9z8eB
	8Z0pkER9qLjDspNIIl4irfajsm0GZGAVQfwDME8oVQOxXg++qqcyxrHZ8m/fsbUBs1/E6iuCdcR41
	OxUXhuNef/vX216eupxPWPDKdkzOY0AlgGp/ofc7ytJ95ZsKLfUFzBz7hE6mwI20BIOOvQp5xfJkK
	ci4Z4nK8dxKEDqpMTIl1zGyfqEfpRqZJWsM4qLGaL51K124ysnNgO8jHzOD/SJC0lEJtSX20oZX6F
	wCbm49xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArhg-00000002F74-3gDW;
	Fri, 02 May 2025 14:49:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArcz-00000002EK4-4Bug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:44:39 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiXkf430797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197073;
	bh=VGRzkNwck2VgyYwpwN+WuSVIvbmopA7IPAFz7KH7CAY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rIlHUvbngpq1VMlyP5aAstvb5E4Fps23bLTrGwdldy8lub13C/dt+rkfVtfzxYHbj
	 f1MpYDhABo1yfFHsNhydoLg3qUAxlcDV/8SANax4LZhIeqWn5MvL8c6Hrw6CPgisSU
	 ZLBm/mrT+dtfFDH5TPpOZAz9JFPLaucnFaY6CERU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiX5a037873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiWU1128660;
	Fri, 2 May 2025 09:44:32 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v3 0/2] J784S4/J742S2: Enable ACSPCIE0 output for PCIe1
Date: Fri, 2 May 2025 09:44:30 -0500
Message-ID: <174619706058.3123134.8004461889197725220.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422123218.3788223-1-s-vadapalli@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074438_126855_F6A7D83F 
X-CRM114-Status: GOOD (  19.08  )
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

On Tue, 22 Apr 2025 18:02:16 +0530, Siddharth Vadapalli wrote:
> This series enables the reference clock output from the ACSPCIE0 module
> to the PCIe Connector corresponding to the PCIe1 instance of PCIe on
> J784S4-EVM and J742S2-EVM.
> 
> Series is based on linux-next tagged next-20250417.
> 
> The previous versions of this series were a single patch. Based on the
> feedback received on previous versions, the SoC and Board support has
> been split in order to allow reuse for other Boards based on the same
> SoC.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: add ACSPCIE0 node
      commit: 9bfebd8750a06f5f8bf16ac58eb7deb638686d07
[2/2] arm64: dts: ti: k3-j784s4-j742s2-evm-common: enable ACSPCIE0 output for PCIe1
      commit: e3dfcf482d0787a5882f10a33daa4c1ec62b87d2

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


