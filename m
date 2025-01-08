Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCCAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64sf4vFWXUtRCTKp6MKv/dKdEAltmJ9vWjr7dOLoKtA=; b=jAo2JTKhDfgD6p622kOyJS5JNW
	/ZfXtzsFGwpZ8WdL5urhNAUKgmXs6J7XLK+ZYG4C9IdWbGaRxWpV8Fxj9+XHOZlQG8V2cxYiHAkHo
	xIE0s1ROz2byHnqRa4yNHsTbpZTRdcNd2rDNZGIIvOD9bxkKY2bfUKKvkqQSQDedKdHE5D2XuhMTX
	4CjSC14NZvODxVKmHlBSSSpep8tJ+NNpljze4YU6wSmvg2JOfF1C1jvRIPt4kxtBnlfTO0V8lCe7d
	XygzQXTWPVrKhQfCrZ1Gd1m0TR71X+YlUNVur6iM3BnGWvwBEOZG2MIZmq2FhDpFKYnl+IncVTnAM
	hJRtC83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYQE-000000094CD-1Y9s;
	Wed, 08 Jan 2025 15:56:42 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYNx-000000093eo-0qof
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:54:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508FsIew3124762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 09:54:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351658;
	bh=64sf4vFWXUtRCTKp6MKv/dKdEAltmJ9vWjr7dOLoKtA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DxsMLt3p+y/IOfeanzoyiJpvdk7MK+7egEESF4+/HASLM5qz+NFbWnGGyYW70sDgX
	 HCtRqr5qekJsZibsUeB5GMeQP8VkpmciYtqW6/8U+Pw9Bh9CH+HRQ0CQcFJiMHYoNe
	 nKNFpHESevx+QuL4Q2hlgLMCOPtR545NzKWjD4aA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FsI8e083886
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:54:18 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:54:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:54:17 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FsHju090583;
	Wed, 8 Jan 2025 09:54:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Enric Balletbo i Serra
	<eballetb@redhat.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dasnavis Sabiya
	<sabiya.d@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
Date: Wed, 8 Jan 2025 09:54:15 -0600
Message-ID: <173635164802.1208994.2287155534270142245.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108-am69sk-dt-usb-v3-1-bb4981534754@redhat.com>
References: <20250108-am69sk-dt-usb-v3-1-bb4981534754@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075421_330652_BA294B82 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Enric Balletbo i Serra,

On Wed, 08 Jan 2025 09:59:46 +0100, Enric Balletbo i Serra wrote:
> AM69 SK board has two stacked USB3 connectors:
>    1. USB3 (Stacked TypeA + TypeC)
>    2. USB3 TypeA Hub interfaced through TUSB8041.
> 
> The board uses SERDES0 Lane 3 for USB3 IP. So update the
> SerDes lane info for PCIe and USB. Add the pin mux data
> and enable USB 3.0 support with its respective SERDES settings.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support
      commit: ff7b5e93f16ab68231fd039a33fea8c67fd25955

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


