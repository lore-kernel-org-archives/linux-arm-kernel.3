Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B73C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7xJbqnsg/UWJ0m8ekbKleB5aKNbbovDyUEZ2H5aXQo=; b=n1J8CAjxov+D7vOhwxKIolsqDY
	iif1c9AVWmh37vRi9EAt4JWL7zSsoBs80NwxgK9IeafDoZ8Fr4tbCDC7qS4RCX5zQ0M0bDs0t3p0S
	KPZAmrY6OTzBzU5JbaSQdo6UV6wt1RUCwrD2Wn8PF2EweKhYTLUVZVMOXCUDX4H/Y+9Ey2Ibopw6D
	hUEprIJbrluEw1eMJDtQ9z4EIusQ+eiknNdzYte6sRklWCfN+9XYTebmWr96ExUjM/EqBqzQHIwBL
	U4egIJ8RHQk4rPweyOq6h8cTvanXIPDYulo9p+7TJS8Qq62N/Ao40kn2dyFCg4wtRUsJYpuIIUKeg
	sKqH/VDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTG-0000000Cjnz-3ZTb;
	Tue, 06 May 2025 16:48:42 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI4A-0000000C2bH-0YFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:10:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546DARA91067998
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746537028;
	bh=P7xJbqnsg/UWJ0m8ekbKleB5aKNbbovDyUEZ2H5aXQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ImM/YgyyuGT0EpwE0RaqQx/cecvmBY/uXK+jphlIafaQzdBc8RRaTMcjN1usOqlXH
	 CpV6PEKu2oX5mMT0aF9nAsSMjz7mDIOZ/Zp+RgSzix4mFDFXsAGvQvpEEm13DTROZB
	 oFbZu1HaVZuO5uxRfawnMp1+Jkr4JQkLwY/h2/bU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546DAR12075507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:10:27 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:10:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:10:27 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546DARh6016604;
	Tue, 6 May 2025 08:10:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Padhi <b-padhi@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
Date: Tue, 6 May 2025 08:10:25 -0500
Message-ID: <174653701247.728098.5031447948468588924.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250430144343.972234-1-jm@ti.com>
References: <20250430144343.972234-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_061034_259633_2ED4BBE9 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Judith Mendez,

On Wed, 30 Apr 2025 09:43:43 -0500, Judith Mendez wrote:
> Add the DT node for the PRUSS-M processor subsystem that is present
> on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
> instance and it has two Programmable Real-Time Units (PRU0 and PRU1).
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-main: Add PRUSS-M node
      commit: 3df22a8622fafa1c5a0dba93c207f66f48366858

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


