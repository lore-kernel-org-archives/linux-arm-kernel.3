Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15246CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRzGKXz9U+GsCb2jos1YYzGtIbZvH6EAGpLjCdcTfPA=; b=g2cSQNkqWgg2iMQrHSw+yqEyDu
	8l63nEUdTLLaRDV8UU6plGXPJlN+HHAExadHbRbGQmoYhZiVTsaVsbljiTT4233Ccq5YbZQiHYXpK
	jui2M5F975m5YPuTthz4BU4CpZ5qJ/mRcQHy96PEOHhHud/KJBvT+Pu5JFSJ2McnDo0qqmiuhlZAW
	0hkDhz+eR8ZBrXn1hOEAuMu01eHv73nFoPRuHXZaj3bIKYirYC37Y0Rn1zge28XMLyhiY/v4jMAoj
	RE7q6Kk4SQWSM9MhlK73WMeshsLideK7qhp0ENsMyGnJWEa2GkRIUl2YqtzIkTG6SgNGJTKU/RMYa
	l9kPt0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0SW-00000008PTN-0DlC;
	Fri, 12 Sep 2025 09:52:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0ST-00000008PSQ-0XQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:52:46 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9qghP580716;
	Fri, 12 Sep 2025 04:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670762;
	bh=xRzGKXz9U+GsCb2jos1YYzGtIbZvH6EAGpLjCdcTfPA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sQizrpGHTsflt9DUN11hv88k8DRMzngNqaQXI5eGAqnHORpdYDwtlrYKLqry/UIya
	 WCM5YKfnFAciH6A29QsDdkZ0ZLt6p4x0WSi0q6dfXiYOij6JtkpDVYHVmui5k11NNh
	 qPTm6GN85M1VMRGbI/6N590utYKlx9g6IluR5Bfk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9qgDN2686911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:52:42 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:52:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:52:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9qfqk3415906;
	Fri, 12 Sep 2025 04:52:41 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-evm: Add overlay to enable USB0 Type-A
Date: Fri, 12 Sep 2025 04:52:38 -0500
Message-ID: <175766787314.27117.5995489139863175126.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250912062021.2906034-1-s-vadapalli@ti.com>
References: <20250912062021.2906034-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_025245_257008_D0A2A5C0 
X-CRM114-Status: GOOD (  17.59  )
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

On Fri, 12 Sep 2025 11:50:14 +0530, Siddharth Vadapalli wrote:
> The J721S2-EVM (J721S2-SOM mounted on the J7 Common Processor Board) has
> a single instance of USB namely USB0. On the board, USB0 can be enabled
> using a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub
> 
> By default, USB0 is enabled using the USB3.1 Gen1 Type C interface. Hence,
> add a device-tree overlay to allow using USB0 with the USB2.0 Type A
> interfaces by configuring the "USB2.0_MUX_SEL" mux. Also, since the Type A
> interfaces only connect to USB Devices with USB0 acting as the USB Host,
> set the Dual-Role mode for USB0 to Host.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. might
good to see these earlier in the rc cycle, but looks innocous enough,
so applied. Thank you!

[1/1] arm64: dts: ti: k3-j721s2-evm: Add overlay to enable USB0 Type-A
      commit: fcfedcb6804caaf18f22016de16d93bf18bbcfdd

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
https://ti.com/opensource


