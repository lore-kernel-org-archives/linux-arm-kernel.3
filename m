Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CDBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY57HjKf2prRMxdJWIJuXK+RjDgqW+nncR0DJTXH0ME=; b=xXfR9vjO/IrD+L9O9OF9TM46Oy
	8YV+k6iNM7Q0gsIiWfcBAOECboOLuwBnCHLA+OSGrQAQ6uwcOyHg2tO4Zo4XSVd1sErt7X9xAK/ax
	LGi8ghIyYpnSpudoLYf1lh0PRg16uAgbjaw3z83pkykmUXi93hACfZ0m9NfFF5HC0ZWu0Dds8vdOQ
	I8hXS3osQO3qWir/u5A51OyTDCWDCTvorZNzMRVCEwS5jMQGl2Pz3qOj/Rr0PxFJL/qbZ/ln2HPCc
	2vl0Dx/ZQHv1oyiv6z7w+hziQK/ewUcrsFS46pHl/WPTpN+rt6Cj2nL9IYQ0E/NysF2FYn+NMZFhE
	JH1KfoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qxW-0000000HXoj-0Khn;
	Fri, 18 Apr 2025 19:01:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qu7-0000000HX3Q-1cM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:57:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIvVX6353562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002651;
	bh=EY57HjKf2prRMxdJWIJuXK+RjDgqW+nncR0DJTXH0ME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I3gauu/2lgX+RMNOrEdOHWm6jaCARPHMQ8mox2DBtpX4UN3amqJMhSn9plasuAztl
	 remyBmKuOkWl3uBGBWbaQF8ezzCSuyn//K9sRDd5rL/ueLR2sI2Z2SEahcRZvCSfbe
	 7K9g6PXUZGVmJb3WvmBm9uSRKDRdV/f3FWZTiq30=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIvVQn108853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:57:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:57:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:57:30 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIvV6N117424;
	Fri, 18 Apr 2025 13:57:31 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <u-kumar1@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <stable@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v3 0/4] J722S: Disable WIZ0 and WIZ1 in SoC file
Date: Fri, 18 Apr 2025 13:57:29 -0500
Message-ID: <174500262306.95371.2904108787224104131.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250417123246.2733923-1-s-vadapalli@ti.com>
References: <20250417123246.2733923-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115735_529940_31917379 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Siddharth Vadapalli,

On Thu, 17 Apr 2025 18:02:42 +0530, Siddharth Vadapalli wrote:
> This series disables the "serdes_wiz0" and "serdes_wiz1" device-tree
> nodes in the J722S SoC file and enables them in the board files where
> they are required along with "serdes0" and "serdes1". There are two
> reasons behind this change:
> 1. To follow the existing convention of disabling nodes in the SoC file
>    and enabling them in the board file as required.
> 2. To address situations where a board file hasn't explicitly disabled
>    "serdes_wiz0" and "serdes_wiz1" (example: am67a-beagley-ai.dts)
>    as a result of which booting the board displays the following errors:
>      wiz bus@f0000:phy@f000000: probe with driver wiz failed with error -12
>      ...
>      wiz bus@f0000:phy@f010000: probe with driver wiz failed with error -12
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
      commit: 9d76be5828be44ed7a104cc21b4f875be4a63322
[2/4] arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
      commit: 320d8a84f6f045dc876d4c2983f9024c7ac9d6df
[3/4] arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
      commit: 3f7523bf8c35f96e0309d420d9f89e300c97fc20
[4/4] arm64: dts: ti: k3-j722s-evm: drop redundant status within serdes0/serdes1
      commit: 2a36e8656836f5897508e61d46d22fe344af6426

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


