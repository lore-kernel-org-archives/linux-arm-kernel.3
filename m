Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3266C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/u9uJ4mVGOB8YWwELgSSWErhtDPl+MfL90KiFeE0p4=; b=tG9TRA3aVolUdyiCamNn3J3Bfs
	j2cmkYSrTxyNmJxFwgXi4cI+iAVN7cNPIKK4QGMbZAzSr2wiYiWLqf8vAFi2qa1z+YwtxmeBIZEAv
	cPWc1F3SWE5MEz7sB9QY67YyRawryuf3ydNQhTjS0ldr6sCduMP+h39Lh6ODAifkNMtaaoWErqQir
	AcBDWUToQUBz7hx+UkUaafSv1uNVudCnuAt1e3z5r09IBcTNH/TzDoxqbLs/uClEm9b/CR0JLDRvr
	L/grAqqX+HW57rUL70XlJVoa0V5CmTCVW/sZCi3CYgB7hXto6uJG6j464VBY+SJTYSXUTTl8k0Khe
	rFAoaF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojHB-0000000G43S-0cUU;
	Sun, 02 Mar 2025 13:22:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojDY-0000000G3a8-0nhs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:18:53 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522DInK42536673
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 07:18:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740921529;
	bh=E/u9uJ4mVGOB8YWwELgSSWErhtDPl+MfL90KiFeE0p4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b3OwSEX3M6Ynl7WUeBnuSROmAQhUUdoAuI+6WCzmWLNer7T0RPNTW7FQV5BrjjkWc
	 PuF1/3NS8o24R9fVUdyJ1j7slYoQ7OCJondMou++vT0BG8ple9cU5dcHT/cCy8OSkb
	 14fELeGBvNFWB7lRjoHqlc5GclyBv9wfIxjLkz34=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522DInE4016957
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 07:18:49 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 07:18:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 07:18:48 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522DIiui116537;
	Sun, 2 Mar 2025 07:18:45 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Kendall Willis <k-willis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <msp@baylibre.com>,
        <khilman@baylibre.com>, <d-gole@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
Date: Sun, 2 Mar 2025 18:48:43 +0530
Message-ID: <174092143356.3272913.3416298233282580231.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214232212.1158505-1-k-willis@ti.com>
References: <20250214232212.1158505-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051852_319592_1082A317 
X-CRM114-Status: GOOD (  12.99  )
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

On Fri, 14 Feb 2025 17:22:12 -0600, Kendall Willis wrote:
> Adds alias for SoC RTC so that it gets assigned rtc0. PMIC node is
> assigned rtc1 so that PMIC RTC gets probed as rtc1. This makes it
> consistent for testing rtcwake with other AM62 devices where rtc0
> is SoC RTC.
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: Add alias for RTC
      commit: 34887f2dab33b30de2730005681c796114fba351

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


