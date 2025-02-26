Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E552BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eegVb8hV5ADxrMFsqlhDaUuB2PFLABHCzNpeRnUf3FQ=; b=oFh5qmnROz+nJX1bSQXXOuedP5
	vgAW0IK48V6+F/c1FXCC19Pn1dkgOhiuhcQTsmbH3KUXRrI6C4FtVMflAuRbfDi9sgezCbQO2rZx/
	UUorlrGl7JC8aTvsX0mPJhU+h3zy5F41PoaMhaTD6XxsIIU784/8LuryGeb5dzAg146ZILo1n/ZZF
	rZTO9YGBa0BhpBWv7i2WbJu75NrgfgUVWIjlxvvNcDLFrs95SgyplMYgh4pLQzWwNkYNMlloOY6Be
	xcnlXg/WW+aFGO3IcAH9xKxtwraP+UWqU8z4DgDAdxMtsGNoA/wWs91SzBoItkJf4VvMrL8z/6j6l
	VpWmXFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMWI-000000052sO-1kdE;
	Wed, 26 Feb 2025 18:52:34 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMTM-000000052Df-1ZZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:49:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QInHoh2145653
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 12:49:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740595758;
	bh=eegVb8hV5ADxrMFsqlhDaUuB2PFLABHCzNpeRnUf3FQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oligV4bn87+Ij3VgJo1rAnTptMBm0yVQZ9hH3HOvM7yrRURnhakEq0ORLWt3k23eE
	 CbmXMhwgolZBBzyU6NC5A1LlryxUlMgLWAVXIBbWZHr2IOxrF/gIKo+zsNQ9wNfrNF
	 bi8CX6vBjTnQEH1a+Z0x35BomiuokT2/A+38oMYg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QInHwU032091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 12:49:17 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 12:49:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 12:49:17 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QInHZR126373;
	Wed, 26 Feb 2025 12:49:17 -0600
From: Nishanth Menon <nm@ti.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        <d-gole@ti.com>, <lorforlinux@beagleboard.org>,
        <jkridner@beagleboard.org>, <robertcnelson@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] arm64: defconfig: Enable gb_beagleplay
Date: Wed, 26 Feb 2025 12:49:15 -0600
Message-ID: <174059567626.2601256.10455663850759431952.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250131-defconfig-beagleplay-v3-1-f556b851ff96@beagleboard.org>
References: <20250131-defconfig-beagleplay-v3-1-f556b851ff96@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_104932_507225_25F53D59 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Ayush Singh,

On Fri, 31 Jan 2025 15:41:33 +0530, Ayush Singh wrote:
> Enable greybus driver used by TI K3 AM625 BeaglePlay.
> 
> The driver communicates with TI CC1352P7 co-processor which acts as
> Greybus SVC. Additionally, it also provides firmware upload API support
> for TI CC1352P7 over UART.
> 
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable gb_beagleplay
      commit: 8c96eb23f203da025f07d7ca5387e1a42382b50c

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


