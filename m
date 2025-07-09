Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A93EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrknXeeMZbINo5PTZY1JnZ/Wo6pKkrTsxFeb+ow++AY=; b=sYDrBZCyNB6jqfZZMGuSUqsV/5
	O41VmGOr/+khfAAWCD3+GJbXv48sr4ZER+CTv1SazErmJ/kmdLmw7hj9AKkbX7VVOjs6jSJNx+Ny5
	tF4BJNCoCVbf8HGnQ2ufultbVcyMtMJ9wvChV8jNUzTBhuwoygVk8z4Rn+nTf7xTrqbFyhqS8z1Ho
	hRpq/zvp+I/Xbnbx7I61MO02qWUrNsGjhUqyNwdErt+J3jFcksHzv/zbZ6NXmE+1nV4c1+WsZ1QR/
	8HQKX46+RNWW88gQ90QCS7uvMa/SNepOThgFaYPInUcSfNPswBxbcnOP5k0TYKrNsL2AqqAySOrxG
	SVLOAsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTt0-00000008dDc-1SPr;
	Wed, 09 Jul 2025 12:26:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS9Y-00000008JzX-3lMD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:35:54 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569AZn6m1424425;
	Wed, 9 Jul 2025 05:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752057349;
	bh=BrknXeeMZbINo5PTZY1JnZ/Wo6pKkrTsxFeb+ow++AY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XnBvEUaHGuOwr+5yuBWxiUIb/uuHwH9cgmHpaBZr0wm3RDD31tdeYHwVzgHim64CW
	 fdt1LvqlpQJsiBjIQvXZoaA1ZWTTha6dwxapT7xuGV0munOfkLevy8+RwyNsYZlhPP
	 y9FBnsEMfOA7icyRa8T9U2Epe2FjZSWqNw/3HjXE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569AZnjB1923404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:35:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:35:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:35:49 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569AZk8Y3496621;
	Wed, 9 Jul 2025 05:35:46 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Andrew Davis <afd@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: Enable overlays for all DTB files
Date: Wed, 9 Jul 2025 16:05:31 +0530
Message-ID: <175205731408.919009.7168525111458377441.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702145314.71996-1-afd@ti.com>
References: <20250702145314.71996-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_033553_028047_26F701F3 
X-CRM114-Status: GOOD (  14.52  )
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

On Wed, 02 Jul 2025 09:53:14 -0500, Andrew Davis wrote:
> Allow overlays to be applied to any DTB without manually enabling it
> for each file. This adds around ~10% to the total size of the DTB files
> on average.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: Enable overlays for all DTB files
      commit: bca4146b1f66dbca07591bfd6ad695c699b5a093

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


