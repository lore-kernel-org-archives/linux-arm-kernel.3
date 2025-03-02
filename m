Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AF1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7Ic2jgTdH4ygRKl2McVhlZtpvDMbBW9NScFRGUlOiI=; b=pMvnsAhXwd0TjDdQqW6GXNU0VA
	48s4d+DglssGb6tuCpV2Lk7kG7c0Oq9QLn8j4gIszuRk5NUcsYcY2qnsJtTnkFJ4DzBqbFkZc2UGq
	InnsJjL1IDmlIMR85yqRFuEDF8yIA3weRokxPK7gyFzyMV8ny3jJ0RFlQJ900IzAToCSEJd3Vg8cD
	e/rHgG9aef5b06oCQJ2yRDp3v3GiVZoEhfYdbVRjvHYQoMTmfXnkoBxXofG2R1ipXXTNbXgYS2YTT
	6jZh8x9XmanWxRIn4LYRJBnjKnkQyGIrfpNWrYgCXT2/g0zmNyda/FlBs9Th/roPlgmgaVNfNwqQ0
	eRTAm2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojNG-0000000G4Rh-3fa5;
	Sun, 02 Mar 2025 13:28:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojEy-0000000G3o4-26ZZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:20:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DKHsA3080908
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:20:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921617;
	bh=M7Ic2jgTdH4ygRKl2McVhlZtpvDMbBW9NScFRGUlOiI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OkxPTu6tZVyoygy0n/cms/SXAky6tGtgGeh3po2r+1IclK8ZhuplsyvXqssCcTNZO
	 Ckw0IDLD9ffH6rcxEC8TRtIKeBUKlWpw/h6zsCaxAunNrpbYozTTOaBAiPsz6qn3c9
	 anMwsXQCbGtpJW54lJARPxMyod71KrZ/hbY9H4/c=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DKHZ1018156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:20:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:20:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:20:17 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DKEsO117888;
	Sun, 2 Mar 2025 07:20:14 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a-mcu: enable mcu domain pinmux
Date: Sun, 2 Mar 2025 18:50:12 +0530
Message-ID: <174092143352.3272913.2726139010475904694.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120075442.181191-1-s-adivi@ti.com>
References: <20250120075442.181191-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_052020_633352_530EC2FE 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Sai Sree Kartheek Adivi,

On Mon, 20 Jan 2025 13:24:42 +0530, Sai Sree Kartheek Adivi wrote:
> Enable mcu domain pinmux by default to be able to access mcu domain
> peripherals from main domain.
> 
> This also makes it consistent with the rest of the k3 platforms where
> mcu domain pinmux is enabled by default.
> 
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a-mcu: enable mcu domain pinmux
      commit: 9e999a702701b621be7427a6f2cc29bd04defa7f

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


