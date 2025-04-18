Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WyfnAEXOEvOsCtJtz6vRRQH9lrvBDaAXYFoE+cz7FA=; b=fcdIow6Da/2Y3u3HvEc2zp5LOn
	JV167WhPZkp/xI/scMAg+DwFnpZOojXEBl3Uhg1dwX7jJTVm+5jPvdDpt0o2zhxKyHVVkxDwyF0ot
	b8lXF9m+D/x933UqpVYHRCNlgNLU8eBK68rOPt8AvL/lYZzrt96T3KUzbfcQSDh3Jzc3AW5CaAC3f
	aTHIh1FzRrxkG56CoLvZiHQH803l4rQKmmqiFxRCSz6sHN3xODSy/NryTAflDdRzrO90pEXZlUYNl
	mulUVEDyMDzNxgVwzG1BjLquCa4cXiQtk1eebpxXaZf8sTQqbXmIgCbxq0eHFUZND4Bm08uB6d+g0
	VE9AYtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qrp-0000000HWeq-2yKG;
	Fri, 18 Apr 2025 18:55:13 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qpu-0000000HWSq-06Zr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 18:53:15 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIr1651060531
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002381;
	bh=0WyfnAEXOEvOsCtJtz6vRRQH9lrvBDaAXYFoE+cz7FA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ACbPNMA4RfYSExR5unctynl8PMgp+OvsVa1PcuQv+MuyiMvfUH8F4cL/qDohUHR2P
	 sy0DAkQD/bNfUxMOYRCZ6C6t/SReb0AJL3CR6VMNQ+fDNLZ7xu10oeTUWG46KP7WcB
	 2VgJcwp+UzSmZwFFJ1HecfDdHzoq9VUm4DC8Entk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIr1o6106504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:53:01 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:53:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:53:01 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIr1Ke113383;
	Fri, 18 Apr 2025 13:53:01 -0500
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, Chen Ni <nichen@iscas.ac.cn>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_percpu()
Date: Fri, 18 Apr 2025 13:52:59 -0500
Message-ID: <174500231274.93973.9406743494287561760.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250417084836.937452-1-nichen@iscas.ac.cn>
References: <20250417084836.937452-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_115314_274042_3B711D04 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Chen Ni,

On Thu, 17 Apr 2025 16:48:36 +0800, Chen Ni wrote:
> free_percpu() checks for NULL pointers internally.
> Remove unneeded NULL check here.
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_percpu()
      commit: 17bff220c6d69e4be38c9899a7515c3b02de60f0

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


