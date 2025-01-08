Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48386E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vETuhsc22KBaL7OyGgTF6n2RXqRfulEyaEctdakumdY=; b=fCUJCnPE8GR54RleqbajiBTEjj
	Fbbo4P5owXfd8RMujD7ZQlfVmKL2heO+L/pl4gzoddDENqV25SJ/RPRSIxqNgi67Cia6uothFMoRi
	LU5FGpZrt0nCHnFvEJcbpMvFU29Q76hx9QWqBBaJfdhIOKhI9+kpfNOTsBfOdN3yA3PkO6h0ydboL
	gBam7v0cIzrDQ0LrIn/OVk8fSR35oydZ0TP1mv7qYCZraLv40UuWgbn7EGJCZfS2kJUhnWSPsvpgd
	z7HddT5x1CD8wMTuXMwcj/yb0FVwb4b7g8CEAsAl2Yh6a99/TQ/9t8ULXTYnHfrvPpVa1h0NpJnUb
	6hdLcwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYRR-000000094QP-09gm;
	Wed, 08 Jan 2025 15:57:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYOT-000000093nt-1fcG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:54:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508Fsnmp3124795
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 09:54:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351689;
	bh=vETuhsc22KBaL7OyGgTF6n2RXqRfulEyaEctdakumdY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hG2gaF7TGUA8Rf+u647RCGXb4dUmxnt4IZbiCgN1f5tfLYgSEQmyVMPTxUs+92WVF
	 RpxLyDrHe/r7wPnze7io/lrhrN58B5lmapSLOU63vQfNf5LDyh+CwvL9uYaC61sgvZ
	 ZqBJ0qKtq/vqcMVBhKFInlRa/YWuuWUxRJKbXBdc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508Fsnfu017791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:54:49 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:54:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:54:49 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Fsn8i091068;
	Wed, 8 Jan 2025 09:54:49 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Udit Kumar <u-kumar1@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable PMIC
Date: Wed, 8 Jan 2025 09:54:44 -0600
Message-ID: <173635167731.1209140.11489613638292519469.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250102103814.102499-1-u-kumar1@ti.com>
References: <20250102103814.102499-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075453_525298_3F7746A3 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Udit Kumar,

On Thu, 02 Jan 2025 16:08:14 +0530, Udit Kumar wrote:
> Add support for TPS6522x PMIC family on wakeup I2C0 bus.
> This device provides regulators (bucks and LDOs), along with
> GPIOs, and monitors SOC's MCU error signal.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s-evm: Enable PMIC
      commit: 998ad09ad3b0ef1776fcb988af4916a062b92cc1

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


