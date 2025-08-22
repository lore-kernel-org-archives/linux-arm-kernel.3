Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEABFCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuHnFL8d+8/viIGVZQNRtgFVz9XiwjlhUnqOaKNJpUw=; b=0xJAsQGsRYyfAvgHMKOaXA8tLZ
	dtwki2IeeeQGGG6Oext79uFIB9ZSYCVdE2R78lvFrABWGiwdn18fO0rEnJnVVeXU21RLEn6QOsLif
	kPHh4gu7trXijK+HO4MQibHx7UY2wxQNod2dUr0TTtBiJK+mYniV5OpybTUR2/lZJ8VbzzuY6bbmT
	7lZGynvhrhZJHvuf+4iKo4j7L6dkkWQazS/kDit1+TVnvydIyJ+HKSPAM8LdlRQefil5NqOP5Cofp
	Fxkj4znO02qlmDBljXMj6M+g0hGggEeSMSMCnvv1FraxKEFzU6yZ9GMwJAf+votMPMhkUIJDHONJU
	hLEgNw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTP-00000004Kef-2ryL;
	Sat, 23 Aug 2025 08:19:39 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXg8-00000003Oad-0cYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:44:01 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MJhrJ1793716;
	Fri, 22 Aug 2025 14:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755891833;
	bh=iuHnFL8d+8/viIGVZQNRtgFVz9XiwjlhUnqOaKNJpUw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uQ21zCCC6cQIu/wNfEdrUHRhEERVHu4TEXhezvJJsSM9lvseQYtsy6RzLwAaUECcO
	 psU5/+b+ubion6O/HcDuYwREdvDJHHk/0JoQ67RbEBQzZgFXdvI982tBGGYRuJm/B+
	 +AKdDB6TkQOxkC+IAX2wDSM1yRCzOU2WFOW9Z3bU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MJhrVb3139313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 14:43:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 14:43:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 14:43:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MJhqAB4030877;
	Fri, 22 Aug 2025 14:43:52 -0500
From: Nishanth Menon <nm@ti.com>
To: <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, <ulf.hansson@linaro.org>, <d-gole@ti.com>,
        <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
        <khilman@baylibre.com>
Subject: Re: [PATCH v4] firmware: ti_sci: Enable abort handling of entry to LPM
Date: Fri, 22 Aug 2025 14:43:51 -0500
Message-ID: <175589181464.648753.7944472542726572522.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250819195453.1094520-1-k-willis@ti.com>
References: <20250819195453.1094520-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_124400_321387_663D75B4 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Kendall Willis,

On Tue, 19 Aug 2025 14:54:53 -0500, Kendall Willis wrote:
> The PM co-processor (device manager or DM) adds the ability to abort
> entry to a low power mode by clearing the mode selection in the
> latest version of its firmware (11.01.09) [1].
> 
> Enable the ti_sci driver to support the LPM abort call which clears the
> low power mode selection of the DM. This fixes an issue where failed
> system suspend attempts would cause subsequent suspends to fail.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: Enable abort handling of entry to LPM
      commit: 0fdd3240fe5a9bf4785e40506bf86b7e16546b83

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


