Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF79DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fRV7NcpWnEYzm+dW3OZEkMxdzkVM7tRwKACZnLsh00=; b=2xM+pbNhjHN9jOtlBrVziZ0zRp
	PWShQ96E1norEsPQWPPo+sfol+r/fYPD9hOKBSTTfNNFOLQku77Q4UHqTvxPT+/5xedwIJiEoqUiN
	nhUqlbKaRaTOm9zkeNl3DuZQL+hObQ0GTsO4L5ekTfEorL3QN+sH52UiRNOtFTeJ96Iz0i42blnQa
	DyC3yoilNY/vQz+EqUH7stKIdQ+o/DHW4JKouWlGbTnMdQCtIo+vn5EUpHq6t2m4KFrdlCbIWk5Dd
	oyJIkv4zHXXH2JGVWwpIWHS7j4jOx0HuYGr+kyNAIqsng8wDCokB5arUeTMlqtcT/102LkZQf/eKH
	ci3zGEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNVr-00000003i20-0p5j;
	Fri, 09 May 2025 13:11:39 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMkl-00000003ZJS-3HeE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:23:01 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549CMr9p1380698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 07:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793373;
	bh=1fRV7NcpWnEYzm+dW3OZEkMxdzkVM7tRwKACZnLsh00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AtYAqoYx/YZYdDG4T8pTKeWZcA0MXdCvSkrCAe3Iu/bmTb5jnixcDU1Dz9kCberw5
	 gDAepZDcKDnxUTZXyNL3hk/YGcguArb1nShwufjhcGICU+oI966+j/tYnuEdmN7KRi
	 w8CHgttJjEs5HQvAjqI3kEPrq8KOqWg8cdUAVlFs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549CMrJd100094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 07:22:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:22:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:22:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CMq3t056158;
	Fri, 9 May 2025 07:22:52 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Alexander Stein
	<alexander.stein@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Date: Fri, 9 May 2025 07:22:51 -0500
Message-ID: <174679327367.1569214.10905203096481550379.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
References: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052259_907139_8C9BD74A 
X-CRM114-Status: GOOD (  14.88  )
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

Hi Alexander Stein,

On Fri, 09 May 2025 11:36:52 +0200, Alexander Stein wrote:
> During probe the mailbox channel might not yet be available. Use
> dev_err_probe to silence this deferred probe error message:
> wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Given the kernel window and the trivial nature of the patch and a review, I
did a local test as well and applied this patch as this is indeed a nice
cleanup of irritating logs we see.

Thank you!

[1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
      commit: 877afe1ee34df54ea62ca9746aafbb1cac946bf5

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


