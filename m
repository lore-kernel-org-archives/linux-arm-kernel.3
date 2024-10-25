Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B6D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcNoOZBJJBSwyMBSITJGawjX8pnb6pPwRpawRlbsCqY=; b=hjRBF6+XgF11xMrBWyXPy26X9s
	d0q9K+YuH+urVDKKOuXgcYYd1D+uZ2ZLX4gw2E6MVz3NGPqtnaWtdeEFJ5MIkrr0U8AiqvTS8F4Ol
	CQlJdnsgiNG9yB/por58oKGltlMZT4c0O4PJa3lx8RgF6h7XsIbv6SNNOHrq84+AGmel4kjwvSoBZ
	tCG7DhpQ2wXaoXjC34QYTPbzG77NWTdgGmo4AeroGgXZTWV465oSJj+NS4YwcLKUue9nGEgZDGESW
	M4DzoQnpXxhdUXb/sWq4mAGmS+50Yeh2nGl14u+RANrTn+IIXBcMtnRewBECmqh0RrOduWoQZQ6dn
	IfSjjo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PGy-00000004qIs-0rQf;
	Fri, 25 Oct 2024 18:42:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ob6-00000004hsW-3JzQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:59:42 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49PHxQJc007560;
	Fri, 25 Oct 2024 12:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729879166;
	bh=jcNoOZBJJBSwyMBSITJGawjX8pnb6pPwRpawRlbsCqY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q13IfKNkSh86qp67RzR7TTIpltxw0DFWl2zM7lReqzU42HCSKehglIAkCDUsJBApv
	 xzLuShuzQ4tHry8PXhASC/bVmgACOA8VycY7Y/kb8oE0xEWIBEmHDz6gJu7PoTDNTJ
	 RQr1z3PgEr34bF4uqPVlb2InWdI0+Q6sFp8MLc5k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49PHxQ9i027961
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 12:59:26 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 12:59:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 12:59:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49PHxPXl128559;
	Fri, 25 Oct 2024 12:59:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Martyn Welch <martyn.welch@collabora.com>,
        Hari
 Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/3] Enable compile testing of TI MSGMGR/SPROXY driver
Date: Fri, 25 Oct 2024 12:59:24 -0500
Message-ID: <172987914538.477005.11816962264560040485.b4-ty@ti.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241015213322.2649011-1-afd@ti.com>
References: <20241015213322.2649011-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_105940_967101_917A061E 
X-CRM114-Status: GOOD (  15.02  )
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

Hi Andrew Davis,

On Tue, 15 Oct 2024 16:33:19 -0500, Andrew Davis wrote:
> This driver can be compile tested on non-TI platforms. Enabling this
> also allows compile testing of drivers down the dependency tree,
> such as TI_SCI_PROTOCOL.
> 
> Thanks,
> Andrew
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/3] firmware: ti_sci: Remove use of of_match_ptr() helper
      commit: a4c14f509509a6a24f25edb7619f55f204a8433f

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


