Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66042D0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5vByOCJHAiQILFVYELX1Nhfd7tzaKXTJqOTEiiXr0E=; b=YDkppzkQ/+xc+M4RrT9Yds/llZ
	e4kLgHLIV7Om7ewZigwQcqq93OP2zryrR9J3hnEmsMWmbVOqGZUlXJImM7Ui/V3iDMKCipX8VjvKQ
	bUQLEz82cxAjYkPjAmMaCZoeyY/a0zOLWMVhQgwb0Fk1jOOJOvq3i0QWD17IQP/pAbq/dFQMNLDBd
	Uxduq7FmzSZoSKHte5hYzx9RV55eNnMBR75WanXZso4gWCcw+XjRRcHP44p/x+IkPDcqYa7bSdPXU
	JtYb9axLhUhgGOKb0YZsvGMpwCELwBe1JRpZ2GHA1/XkfmTDd/NCIMu+ZM4pG+f6KbEpfCaRVysWx
	FKIM47Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LPU-000000042Tl-0BZx;
	Fri, 25 Oct 2024 14:35:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kte-00000003vA6-0XQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:02:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49PE2MN1105797;
	Fri, 25 Oct 2024 09:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729864942;
	bh=v5vByOCJHAiQILFVYELX1Nhfd7tzaKXTJqOTEiiXr0E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wdqX+JU4FYbaPEQUDLr9NwUg7xxcjI4ZefgrmcSXIsI3ze7vDj/G6DL9ZTRMpq4de
	 S2laTbqdv5YEVTR3VZcWnzEKxF4JfQe118rOoAgtJPnke9K/mAQgFFR1jLAatIhvyh
	 TMeblBNp8r0aQ8fFXyW2ivAvjwHHvIR/cmImkPcY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49PE2Mhs060117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Oct 2024 09:02:22 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Oct 2024 09:02:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Oct 2024 09:02:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49PE2MrC126993;
	Fri, 25 Oct 2024 09:02:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, Alessandro Zanni <alessandro.zanni87@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <skhan@linuxfoundation.org>,
        <anupnewsmail@gmail.com>
Subject: Re: [PATCH] soc: ti: knav_qmss_queue: remove useless statement
Date: Fri, 25 Oct 2024 09:02:20 -0500
Message-ID: <172986491063.176745.17597928563436598415.b4-ty@ti.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924214612.38854-1-alessandro.zanni87@gmail.com>
References: <20240924214612.38854-1-alessandro.zanni87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070234_310186_E3447AA2 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Alessandro Zanni,

On Tue, 24 Sep 2024 23:46:10 +0200, Alessandro Zanni wrote:
> Remove the statement "continue" at the end of the loop
> where it becomes useless.
> 
> Problem found with Coccinelle static analisys tool,
> using continue.cocci script
> (coccinelle.gitlabpages.inria.fr/website/rules/continue.cocci)
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1] with some
minor fixups in commit message. Thank you!

[1/1] soc: ti: knav_qmss_queue: remove useless statement
      commit: 74280c3d73143dcb976491fc085ccb0437cb5f0e

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


