Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCAAC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU88KIu28z7FJc3ACej39tJ8cAKVnj4yM8ha3DZROns=; b=J9/+AOlvV77T/G+uC7BWI0Z6cL
	66wTiOl8YmEWBQaQfiaRo20uYB7gpzgE4DlOOkmeV/hWmD6YBKKEHSlyb+Rkq+DthjVf8dn3+P3zI
	Z/LZz7in4SSw8+mhnsmvwY1ufNjkEnDP1nBSFJ4cNLV2gdnbzZkFomTld2sJ7IDQs0jXylbYOirCr
	xmCzGbE8TyLX/ifxM6Y8SeCZ8RLH1DT8ZTlzayRjr5AWRbY8RxMe37onunpSdIfNkkwBcoBiWxv2/
	/HjYN6odtNj1vi8SttTavP9BWzwi0CMezEZQvaA8QBJlqOrlGqOLX2ozZHk8MvKZZlldKZMNJjkYc
	oxqzjUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVOO-0000000Dx7R-2NDM;
	Fri, 07 Mar 2025 10:57:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV6o-0000000DuKM-0v28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:39:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527AdAd94040303
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 04:39:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741343951;
	bh=YU88KIu28z7FJc3ACej39tJ8cAKVnj4yM8ha3DZROns=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YmgbTYzpuzp2KYj0yx0UEIjAjZFY/Ns7gVzjbZXvDPQOF90datY/E1DWIswto0oDP
	 cTn89tlo+BCHcA/MGcdgi9li1WjQ3h7q7ExNliNOjzZaHdE24hvTnXRqDFruBu7K1k
	 DF46X4VLGzHEKqt1gxVt9U2OhsroZ113B0TdFVXI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 527AdA44004468
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Mar 2025 04:39:10 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 04:39:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 04:39:10 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527Ad65t082496;
	Fri, 7 Mar 2025 04:39:07 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Daniel Schultz
	<d.schultz@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <w.egorov@phytec.de>,
        <upstream@lists.phytec.de>
Subject: Re: [PATCH v2] arm64: dts: ti: am64-phyboard-electra: Add DT overlay for X27 connector
Date: Fri, 7 Mar 2025 16:09:03 +0530
Message-ID: <174133309360.1072814.5781136460553851194.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128100356.462934-1-d.schultz@phytec.de>
References: <20250128100356.462934-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_023914_346733_21025CD6 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Daniel Schultz,

On Tue, 28 Jan 2025 02:03:56 -0800, Daniel Schultz wrote:
> Add a device tree overlay for SPI1 , UART3 and GPIO1 on
> X27 connector.
> 
> By default, not all interfaces on the X27 connector are accessible
> due to being disabled or set to alternative pin mux configurations.
> This overlay activates and configures these interfaces to support
> connections with external devices.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: am64-phyboard-electra: Add DT overlay for X27 connector
      commit: 638ab30ce4c63edae4934dcaa7a61f37b96efe6c

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


