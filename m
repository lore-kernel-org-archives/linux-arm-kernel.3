Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851FC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koIG3q1ehnIUu1mOFG9wlRR2uVGmetxb/4Hrt+f0vjE=; b=JX/sP1yXZDeChl3jS8m8jOma5t
	7BPuT9v9jCEcn0FTE4V08/pudV9lUN6mg03ErnIUJ5QZsNBP0HLWd917qqUXi1l3d0ckUgop57wRP
	UM3yXu87P8ASs+q1elHrwN4JalwYu23bqkeuVWtNZUeyx6AwzuWZ1vky/kFc5OXRUSET3Y5wMnG8U
	DETk3DrLqi0vmS1Ulf6TO0LpnknULGqOAlW3OdszsCYjpqFGcO615Xov0J0ot9TZO+PcBaM286mSV
	cE2cIg72tu/xWv8jN1kIhdJSGSQy5VfD9XIx4heGqquD7WZO7TNBxf7/38TJuCVBcTJRXnlIZdN4Z
	OEqnhTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5r1K-0000000HYMz-2EC6;
	Fri, 18 Apr 2025 19:05:02 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qur-0000000HXHV-1r5w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:58:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwG6K1061259
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002696;
	bh=koIG3q1ehnIUu1mOFG9wlRR2uVGmetxb/4Hrt+f0vjE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=saFxAaazS5q5cZ3rM7LdACryY4fnZ9gCBLNyQkp7R2oXloo4zPGN2Hm8Dok79FhKa
	 qs/FHBg3vS5Xm2miiLM/E8Hxt6ZqwsJs0msYEvG3SXFOP6FuXa9E528nt+mHbSzaN9
	 CYsLkd/D/cROThTxBIP+olVg3Lvl0NtTmC9EBECw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwGRk015374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:58:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:58:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:58:15 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIwF4f117732;
	Fri, 18 Apr 2025 13:58:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Udit Kumar <u-kumar1@ti.com>,
        Michael
 Walle <mwalle@kernel.org>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62p-j722s: add rng node
Date: Fri, 18 Apr 2025 13:58:13 -0500
Message-ID: <174500267952.95667.4169202047923911096.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250401083246.3228964-1-mwalle@kernel.org>
References: <20250401083246.3228964-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115821_571353_3B70A380 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Michael Walle,

On Tue, 01 Apr 2025 10:32:46 +0200, Michael Walle wrote:
> Add the node for the random number generator inside the crypto module.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s: add rng node
      commit: bdd158389dac25ff36e041ff28591aca769f403c

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


