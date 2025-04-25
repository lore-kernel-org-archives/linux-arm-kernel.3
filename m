Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B19C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 21:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d436YQ3Xwtns+Rova8G3My78ycHIDiASiikPFHlDig=; b=UkB/AlrrqW6eIlgz5iJYjCw0R2
	UxhzI94n8y86DA2bkH0auhGbIRuz6w9lyHh6X2CbKisYqxvwq+w+COVcoTmYDHTqdsjSM9VFnYleY
	MNCg4MBRJMJ/yKIexGL1BXU0o/ft5vmn75SYUaZ14FYt3Js5OE7OAmrFPazyuTTcf9HEkE5+xNLNk
	FCqYpp9TlnIP76s/reGbRc+86LP0lum2Q3FNkajFs17JqTeCcORHq64UDZ+FPsJ/BLZEr3LPs7jmk
	Q3YIJB/CVnVk8KYO960CqpiqUM6LPS+Hwak+6MhpcViuwQglWfcFW52bQOU/nVBg3DvZzO9/yG8Lx
	dVaycCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QfX-00000000vn9-1555;
	Fri, 25 Apr 2025 21:33:11 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8QMX-00000000tvI-0xO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 21:13:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLDL8c2277634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615601;
	bh=3d436YQ3Xwtns+Rova8G3My78ycHIDiASiikPFHlDig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cL+Fd24e4c16T0NEX8BR+9csVnt3aBj/wDlq/Nu/CunR1sgCr6OlGSwtuxg4NE2za
	 hwsvVfqygvEu9056IJyx6yQcVB7fmaml12BmqzpPUzkEsnz/EXBCNgJkxK18LQuMKD
	 Y99IsOkcmT+CNOir2HMZ2b2OhGq2CdzoCDHO17mM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLDLaZ076287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:13:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:13:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:13:20 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLDKcF108011;
	Fri, 25 Apr 2025 16:13:20 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Date: Fri, 25 Apr 2025 16:13:15 -0500
Message-ID: <174561554453.210950.14844325272015840507.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421201055.3889680-1-jm@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_141333_364395_6B15B96B 
X-CRM114-Status: GOOD (  13.95  )
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

On Mon, 21 Apr 2025 15:10:55 -0500, Judith Mendez wrote:
> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> default on am64x SK board.
> 
> 

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable hwspinlock and eQEP for K3
      commit: 53802e60fbb57a6ddab01837a53e2040cd1f592a

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


