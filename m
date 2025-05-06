Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97EFC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XNUZZEX+n4bAI/bF/pNMWXFZAZ9u0fFl4dFgytGVws=; b=pT3b3Ej7ZPX1X50sMVoFDtH3VY
	4fIdHSa5CTjiqUuwaw+fgFOKGPKHcARse7Cl7TE/itsCUlIsvAlq4IJV1tMLFfkTwdT/6cQr+nZ36
	Kn1nLXbR/hsPcgFkUtWGBhHJkg3rinKlC5xp/B6DlbMp7pPsphYkE8be5OTliUV8A3YxRhqEw8fgn
	qKZlivauNk/Oral8WPv2OYiI/CHD+BNoRjW4KqLWzE2pKL4hmFqdVskEGZuAN32tYhmN5e7PKwyo/
	eC4khrabcvWHEhp633Lqxi4ANbXEwmBTpcKtx3sTzFo38MjWiWd6ODa+bSyPr1x7xAE/g85Oc459w
	PTEMXR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLJi-0000000Chcw-0Rab;
	Tue, 06 May 2025 16:38:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI1T-0000000C1wK-3XWJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:07:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546D7Yj3508643
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746536854;
	bh=3XNUZZEX+n4bAI/bF/pNMWXFZAZ9u0fFl4dFgytGVws=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KRcGYiQ0D1G6wH505V6emFZIs99cO2D8mfQbhnc8p79Ax2o60c+4R11qZB/hzaTXQ
	 qxpW0ZpEacMLhkUThZKvsg6xDrtg2kumEd4I1aYhYItxjsgjLb2hqNQIqFV1OrYc/a
	 iGSMwP3nluPgkmML/Bt4MAq6v7MxXzQlohAwLWRw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546D7Y8S101942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:07:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:07:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:07:33 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546D7XOu012170;
	Tue, 6 May 2025 08:07:33 -0500
From: Nishanth Menon <nm@ti.com>
To: <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>,
        Kendall
 Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, <khilman@baylibre.com>, <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] firmware: ti_sci: Convert CPU latency constraint from us to ms
Date: Tue, 6 May 2025 08:07:31 -0500
Message-ID: <174653683694.692511.6512121885048153662.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250428205336.2947118-1-k-willis@ti.com>
References: <20250428205336.2947118-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_060747_968754_CA7FFFF4 
X-CRM114-Status: GOOD (  15.11  )
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

On Mon, 28 Apr 2025 15:53:36 -0500, Kendall Willis wrote:
> Fix CPU resume latency constraint units sent to device manager through the
> TI SCI API. The device manager expects CPU resume latency to be in msecs
> which is passed in with the TI SCI API [1]. CPU latency constraints are
> set in userspace using the PM QoS framework which uses usecs as the unit.
> Since PM QoS uses usecs for units and the device manager expects msecs as
> the unit, TI SCI needs to convert from usecs to msecs before passing to
> device manager.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: Convert CPU latency constraint from us to ms
      commit: 9b808f7f395ae375a26e32046b680cf898dacc21

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


