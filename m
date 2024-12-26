Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EA9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drifI6Dzuw8QKPIDFysHCxNkPZ8M7+X/soaT70FlxxI=; b=PUyvnJlgEWsBTkMokiwHo6yrEk
	icS5eEMUVzy1ECxzSjLX14HNga5mMWWB6QJp9xnX7NoNSV3FgOhy7wAeKl5k/dWyKwvdH2DjewF/+
	zkmm77g+KMmRW+T5movg8E483segRoGc1Xuxl9E7V64/0zDlCRpRj+LAqmEtEW9nJ5ILF+2FhVWhH
	4sZDP77B7VT83FcIX6aYhPWKVaHoXkIhxybqL6zmB/dHtdXGc2uPkopMaiG3yXE6sJJd8IY6i5Gyp
	weBZHZDPr95dsoNMYOBdhvsxkhazhnXma7RO2xtW3bFZhoDzQwt6SFAclTr75EPAEbGiB0XaaMEnt
	cjGB6AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuZS-0000000GO5R-4AXk;
	Thu, 26 Dec 2024 20:35:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuWk-0000000GNl0-3KxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:32:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKWCCW027960;
	Thu, 26 Dec 2024 14:32:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735245132;
	bh=drifI6Dzuw8QKPIDFysHCxNkPZ8M7+X/soaT70FlxxI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OzXz+k+AueJBBhq5JmdwmLSvGkimr5h96nFOnUoiwWaPg+9UizbQugfbpPlMfGACE
	 VbPc3D/OYdk7+KVAc+14cMcdbx2jkkWmQeJDaHpTuRxC5rzDVVrWIidlSLgGgAWqBp
	 MvgvFKYMmjGJ+SCu5+0GqNE/zgLD19cA7y2/FJoA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQKWCZ6034636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 14:32:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 14:32:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 14:32:11 -0600
Received: from localhost ([10.249.33.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQKWBCI109106;
	Thu, 26 Dec 2024 14:32:11 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: Remove unused and undocumented "ti,(rx|tx)-fifo-depth" properties
Date: Thu, 26 Dec 2024 14:32:09 -0600
Message-ID: <173524512328.83015.18034967623969969325.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115193359.3618020-1-robh@kernel.org>
References: <20241115193359.3618020-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_123214_952418_AA13A84B 
X-CRM114-Status: GOOD (  13.92  )
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

Hi Rob Herring (Arm),

On Fri, 15 Nov 2024 13:33:59 -0600, Rob Herring (Arm) wrote:
> Remove "ti,(rx|tx)-fifo-depth" properties which are both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
> 
> There are similar properties, but DP83867_PHYCR_FIFO_DEPTH_4_B_NIB
> represents the default value so adding them is not necessary.
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: Remove unused and undocumented "ti,(rx|tx)-fifo-depth" properties
      commit: 09b428453219d470475d0d6447c954bf63b95705

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


