Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992E3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/wwbEqTWYhVHr/BOInsu6yf96NR5fVapiEtbZi2/Ww=; b=VsD8vsVvzq9l4bFMNweVLuLZ2z
	gJnanX5TbP93UxqcdaKsQ4fvAwgrQcA7hpi7ZMeQUF9SqB18b8JyI0cp/nqKYLyMOL4Y4aXVRUAi8
	9MSd/H94/31dIgv1rhI7nsyZflvAhtm6mwboQJ8JTVLZnu1OgluZ3N7XA1M3BZyqvB35zIwIJOyde
	rjLETjR2MfuT6GjnK2tPIOEx//HZOmMVPD50xqX09IqBDUWW+ivv3Uh7EZV/iq7F4XtC0nDnbtfMC
	aghG/nv2gVnd2lTvrXrV+OwudEePZBFG/wYAQtov7dgM2wXSjhB4CxSFEXHPenR+kru4z30tx0vVq
	1y6v10gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojKE-0000000G4G1-2G45;
	Sun, 02 Mar 2025 13:25:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojEM-0000000G3gp-19Kj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:19:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DJdTk2461655
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:19:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921579;
	bh=c/wwbEqTWYhVHr/BOInsu6yf96NR5fVapiEtbZi2/Ww=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fhfsseeQQzDzObkHWqS3PTuZ6mp5L6USofy+tlldwD8tTJXruLkoymjQ5qxy18qSH
	 ul7y5UdqoFn8TNYUP36PW3HntntflwdfSYG77XjHa5ywPPCNo4Ys30MmsblR97Ndi7
	 HKdx3LbldyR/7VYov0gt43c+ZIZk96e6/IHVzwVU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DJdlA017472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:19:39 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:19:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:19:39 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DJZmc117215;
	Sun, 2 Mar 2025 07:19:36 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <c-vankar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-evm-quad-port-eth-exp1: Remove duplicate hogs
Date: Sun, 2 Mar 2025 18:49:33 +0530
Message-ID: <174092143352.3272913.15934714323142045116.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250110105753.223049-1-j-choudhary@ti.com>
References: <20250110105753.223049-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051942_410682_13B4C682 
X-CRM114-Status: GOOD (  12.50  )
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

On Fri, 10 Jan 2025 16:27:53 +0530, Jayesh Choudhary wrote:
> The j784s4-evm board dts now has the gpio hogs for MUX2 after integration
> of audio support. Remove duplicate gpio-hogs from the overlay dtso to
> prevent mux probe failures leading to can-phy3 deferred probe:
> 'gpio-mux mux-controller: probe with driver gpio-mux failed with error -16'
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4-evm-quad-port-eth-exp1: Remove duplicate hogs
      commit: 8a3629a6a9e52b30c55910b26c9c0dbc376f9d29

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


