Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF25C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5WjLcJsxArMu5HCfyLW+XnlGaOpGtRqSi+EyQMT4dc=; b=gKjHR8w704KLZviLbEH+d/6PwD
	JnYOw9ycHbHTN0upP9a3pYMER2fP3NJUp8O2NCVb+155jJ+YAcsxSeRxxnXgzH/vrXuXQuNUJ3iZ2
	nKKzeugy+9FocyQ07FETZGKJLKqFGLKsyD1O5XcIjFmjllkSKtchZM6gykJa2OQbNNxbP42Vx99hx
	gw8X3neHBK2MHuT8OMfHZiO5eIbp53Vr0CzQP/2JJrV9MPMlKeNr6GUpsqDJLXF3Wgq8uU8r2VmuX
	Xie0NQB5r1d5yQZv/0gvD3LGoBg8tsyQN+koC1i05IaeVJzBNid6L+qLiyNmvt+D2b8tPWW7Lh1cK
	bee6EFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qk2-00000004IlV-2ohm;
	Mon, 21 Apr 2025 12:59:18 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6qiA-00000004IYL-3qfl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 12:57:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCvIto907192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745240238;
	bh=W5WjLcJsxArMu5HCfyLW+XnlGaOpGtRqSi+EyQMT4dc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y412E5xs7FjTMfsN3NMdDN26l9jNCxmOFuXv58BS7d2sieDBmEMem3m0JRy35Y2Vi
	 LoiBij4MXT0hRNWfQoniTT/IdaDGGlMJ5PurtCIqGf2gB9grjha/1KRTreszWzB3P5
	 0tmqTyGA2T+hlWPmxcZoyOQiOASDW0XZVsLA4gsU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCvIE3083231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:57:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:57:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:57:18 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCvIC2075145;
	Mon, 21 Apr 2025 07:57:18 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <bb@ti.com>
Subject: Re: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Date: Mon, 21 Apr 2025 07:57:16 -0500
Message-ID: <174524022451.1975791.7076192860299528764.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250417084904.2869369-1-vigneshr@ti.com>
References: <20250417084904.2869369-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_055723_002316_5CD6D7B0 
X-CRM114-Status: GOOD (  12.12  )
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

Hi Vignesh Raghavendra,

On Thu, 17 Apr 2025 14:19:03 +0530, Vignesh Raghavendra wrote:
> Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
> kernel.
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
      commit: c62bc66d53de9a61154224f99c1b4ca68ed57208

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


