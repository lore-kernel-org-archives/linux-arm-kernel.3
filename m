Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53495C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY/MmG+5flypk7XKV4+Mu6hbOrp0aC0XssiUPIU93SA=; b=uJ2qUCtuwF1H4896+3gejQkmVI
	Pl2KxprnattIJxz+DkAeHCsVAtDKwzIuOLiJLbIWKde7L81t3hEY0ldF8eotUbhWLVoRpqpMdGJot
	UcLxYjsLfQcAn7dZUkR+VxHA+VfWZG2LVegojTdLBDFx0DxoC4/NVlrzuHWdlbcAOFx+YM7xomn5g
	YcXzSSlc+FBJQ8WrFJ+aRQeRZFNY9szEFDLhVA8g9BFaLGnaM6t1q83ah/XH9BicNlfYdzyqUdVcK
	HAOYlg/OIH8n8V/r5JMmqgO5wpdTuxCLqzKx4WL2XNFbgAyZq2GAP+OoRJyAuNSOnerbKfhU5Jbv8
	4wMHGF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojIh-0000000G49M-3MRL;
	Sun, 02 Mar 2025 13:24:11 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojE6-0000000G3dk-2YWx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:19:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DJFpX2461592
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:19:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921555;
	bh=fY/MmG+5flypk7XKV4+Mu6hbOrp0aC0XssiUPIU93SA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KVQrDe3N7LSSebcTlE6EAlmSYGskSe3DXaAIQw5Z4FR0LYHOO+44Uo3KFYJ4haqRC
	 TNRyTt4icftIpYFQsVezVPxI+P1vCpI9JuJY6oriLmUoCpLNfW4HBe4CMZRmt0uXl6
	 sYunb9DYv4Wnj7nRZjOmFlSTlSHrQHB+4AYfJDk8=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DJFu2010697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:19:15 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:19:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:19:15 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DJBWT116974;
	Sun, 2 Mar 2025 07:19:12 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <robh+dt@kernel.org>, <nm@ti.com>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <krzk+dt@kernel.org>, Keerthy <j-keerthy@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct the GICD size
Date: Sun, 2 Mar 2025 18:49:08 +0530
Message-ID: <174092143355.3272913.10095422286018964990.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218052248.4734-1-j-keerthy@ti.com>
References: <20250218052248.4734-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051926_743575_6DCC773E 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Keerthy,

On Tue, 18 Feb 2025 10:52:48 +0530, Keerthy wrote:
> Currently we get the warning:
> 
> "GICv3: [Firmware Bug]: GICR region 0x0000000001900000 has
> overlapping address"
> 
> As per TRM GICD is 64 KB. Fix it by correcting the size of GICD.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4-j742s2-main-common: Correct the GICD size
      commit: 398898f9cca1a19a83184430c675562680e57c7b

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


