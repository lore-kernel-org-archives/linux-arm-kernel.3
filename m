Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Z9d9cS7Mfxm3c4f5pambF3NbacZyXZO/9FMs35Tc/w=; b=W86LK5ucOG6KDJK4dSfRb5qrsd
	LYA1DNdRoLwOwioXujejK3wrUnwAnz3Ey9W7RAcc69RK76K9iGb4B7VepJ96YhBbkS6zcSDHsqqPY
	oDU97v/9TYjC/AThOLw5pZF8TldQaYKfnRZm4i0KNPC8fNpiqsgdRViwBa7OQiMq0Qdie3fLc/b9I
	dqTYLlnRASjii2j/LQAainifDyN2lQeSx59cYyWvcNEL0H10GMGgFurXswvqDXRmKhGmA4o/yUnZu
	9aJauYo828yRf9Ngr6IL6KrCwUWErSShBBX3/Vc6T1EOMRucak34rQo0LWYBq/6iPreduX2L5qmp5
	COPAIhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojFf-0000000G3ur-1osu;
	Sun, 02 Mar 2025 13:21:03 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojD8-0000000G3X1-36KO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:18:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DIG9s2536636
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:18:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921496;
	bh=8Z9d9cS7Mfxm3c4f5pambF3NbacZyXZO/9FMs35Tc/w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y1KHoQOdfrMyyAp7l97uwagKrBMqfUluk0QpFCvInLlwC64u2rD5Y9gxFR8sFkWyH
	 yle72vhe/e11vecB3Qm0Sg0MHfEpbsmxp5VG0YDrjytYI6d/9M1W4eKswNuQi/pS4C
	 94L2RgrRR8VVtxdNBqEZb8f4vOKbapy3p/+TMatY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DIGQl016785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:18:16 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:18:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:18:16 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DIDKk116230;
	Sun, 2 Mar 2025 07:18:13 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Udit Kumar <u-kumar1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: Add flash partition details
Date: Sun, 2 Mar 2025 18:48:10 +0530
Message-ID: <174092143356.3272913.16335037194305409116.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250215070059.1593489-1-u-kumar1@ti.com>
References: <20250215070059.1593489-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051826_869016_8A929AC7 
X-CRM114-Status: GOOD (  12.39  )
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

On Sat, 15 Feb 2025 12:30:59 +0530, Udit Kumar wrote:
> When used as boot device, OSPI flash hosts different  boot
> binaries and rootfs etc.
> So Add partition details for images hosted on OSPI flash.
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721s2-som-p0: Add flash partition details
      commit: d9f17c11650c205fd4802033a5e880bf79662ace

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


