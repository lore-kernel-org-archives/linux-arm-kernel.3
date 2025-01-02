Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9A2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddP8uN4vD3qJfj0bOVjzHjJqASNDgtJu92Zk1hR57eM=; b=AqAPPotKmd6DAnUpTn8P/6Awnv
	+Rlg4HsUayY/xSAAEXe/WtOJj8YuP1vuyM9gS7wXJ7urehj+rLYoqFW5ciZkZIS+BIHHladYzcuMB
	JSgyso1bLTjAHXzob0KeFUe6TL36vobZ7ZIqbh44H1Om83mVByNNaolVzZjjLDK5TBQh3P7exXcRf
	bwTXJjbOmH557R1LM9VbPuFzgTKIBApAmlGu32LQHxYc27at5YxSWaFnZhqpM0vMuomoWCaVM6oiv
	REUDtb6FRv5jIBPuoglWr3JozCyIlPPdv1q19bBQYHSBd6QoMcorPujae3PG9ATtjNpjK1zEYePjr
	zGaIDhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO9z-0000000AqcX-12iN;
	Thu, 02 Jan 2025 16:34:59 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO8A-0000000Aq8t-0jHh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:33:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GX35D1965598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 2 Jan 2025 10:33:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835583;
	bh=ddP8uN4vD3qJfj0bOVjzHjJqASNDgtJu92Zk1hR57eM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HHI0PiLJqakqZ1rjPWde1oQ0yRja/hh7LUm2DQsccIctIDt/StPieeAi8s8oR46r9
	 dCHbQpsCALw70gpDm0A1OYW2oM+2ibB+5Xr8Emp8fWG2mVweIHWvg003K7vDcDlPcm
	 wPMIeSPdp41m8MgQJCt+jNbrv/FCNnaIJj0hTZUE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GX3pb085846;
	Thu, 2 Jan 2025 10:33:03 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:33:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:33:02 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GX2sM077513;
	Thu, 2 Jan 2025 10:33:02 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu
	<b-liu@ti.com>
Subject: Re: [PATCH 0/2] arm64: dts: ti: remove extra GIC redistributor ranges
Date: Thu, 2 Jan 2025 10:33:01 -0600
Message-ID: <173583548743.268779.10519940224534854554.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
References: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083306_306731_1667F3BA 
X-CRM114-Status: GOOD (  15.70  )
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

Hi Bryan Brattlof,

On Tue, 10 Dec 2024 14:59:23 -0600, Bryan Brattlof wrote:
> While debugging an unrelated issue Bin noticed we've accidentally
> defined the redistributor range for the GIC-500 two times on the AM62x
> and AM62Ax.
> 
> This simple series removes the extra copy :)
> 
> Happy Hacking
> ~Bryan
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62: remove duplicate GICR reg
      commit: 72c691d77ea5d0c4636fd3e9f0ad80d813c7d1a7
[2/2] arm64: dts: ti: k3-am62a: remove duplicate GICR reg
      commit: 6f0232577e260cdbc25508e27bb0b75ade7e7ebc

I have added the Fixes tag on your behalf this time around. Also the
reported-tag does'nt have a Closes link, which I understand is because
the report was internal. it does cause a checkpatch warning, which
would be useful to state in the diffstat section. Please take care of these
next time.

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


