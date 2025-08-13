Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B8CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkMcffknhH0plsKNwHSL+7lnnw/2npQ9Z/QcYbws7mc=; b=htLUpB0pP9Ww7f+jaAzxIavW3O
	L/FvaSS8W1EIWk0OX549CxFrd+9qIHguyg/Q2Nv2PWrRYH/BS/gOH8SoRR2jJZbDwp05CWDJ2IYT7
	BuVTKcuugWTTVUo8SFDgHNQMf9CIvJ51TPO+t99tF3WDk1xsDpEXHQcNPpRsd8FhIc37z9itRUfhh
	AZF4+h61bb2SopT24c4If+j4Mlt4irYKmCtw84va//tsRMFzcX9uDxJgQsdsOAlsYB3YmWiYqC9VA
	jGd2SIM6jikJIa82lSjVkEBmYCe1yeX/za8bMhyHAG5/LlcuEPwbaSJu/bFe3mUtwp0LITn4nkIIW
	38LhmUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCnv-0000000DxqM-1iKx;
	Wed, 13 Aug 2025 14:50:15 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCXC-0000000DvAX-3GLp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:33:00 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DEWuho1666946;
	Wed, 13 Aug 2025 09:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755095576;
	bh=OkMcffknhH0plsKNwHSL+7lnnw/2npQ9Z/QcYbws7mc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UE9QDjauVlJnN9agNwVAf69XPR8UMMbKkiImnww1nvWgYsERpBKYLNKz5a6vb0zlP
	 5LNhf1jplkisclGi2KtPNBc3vAzpk/Wsu7Kw3OddsGxN776NCvZOMnVl61tKAIgmHv
	 /j1Vy/cXMuDbj9QCKEjUY3i5C8hhyHi802Xc9Tjc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DEWtCu124821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 09:32:56 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 09:32:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 09:32:55 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DEWtYi2441154;
	Wed, 13 Aug 2025 09:32:55 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <devarsht@ti.com>
Subject: Re: [PATCH v3 0/7] Add DSI display support for TI's Jacinto platforms
Date: Wed, 13 Aug 2025 09:32:53 -0500
Message-ID: <175509556140.158218.9231249933519133970.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_073258_905312_960734C7 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Jayesh Choudhary,

On Wed, 16 Jul 2025 11:31:07 +0530, Jayesh Choudhary wrote:
> This series adds the dts support to enable DSI on 3 platforms for TI SoCs:
> - J784S4-EVM
> - J721S2-EVM
> - AM68-SK
> 
> SN65DSI86 driver fix that was essential for display is now merged.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
      commit: 09449e48be7390ebc53812ab898d669e3832c704
[2/7] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
      commit: a5ed774877a38f2feeb45f0c2cd16184b47b476b
[3/7] arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
      commit: 19a4472e591d9945f4983d052adf7d7fa67efcce
[4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
      commit: 722a128adaf97fc2ecb64610a482f1399b3f4c2a
[5/7] arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
      commit: 3c29300dcef587df697750e99f6375e2ca8907fb
[6/7] arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
      commit: 2bca9f69225e8c6e3c270f20c69a1460761f9bd2
[7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
      commit: 11b9e4517bfa8edecbef0acfcad1bdca4f4a4192

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


