Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6231C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+oEfF96Z/IiSXPjQsuXB8B1jzzW8U5OwiYJRhUIYhk=; b=xMGyOBi5NfRwo35kVF8mn3/qe5
	CzQRHMAAUiVSODpAYRMUb6gDkW7MLTdeXkH/LVSaHkNKUiIzJ8IVqrcxJgrlptOi8df9R2g8oVEY6
	+1p7QPzq1kxaW3KyecOTrZH6PwDYe6dCDzQn3HTpNUOSva4BFHrt+j4OnqFu+vcc1RoAY0FqHillh
	H4nzBlNSSw7E/zvt+YUpgCo5+k+7nXThQHRLGJ9YmM+WrnlkPbRZDghSHuUcIB5+Vs4DgBAlbhQLv
	UuTqcQyhxWjGEmc+/RR+oA1PUE4xyMrr3dh1SqxW16wobdASs+0/dyp5MaohZS+WLAf0nLmluZ7hk
	ZeCMxPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLNW-0000000Ci7W-2GFi;
	Tue, 06 May 2025 16:42:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI37-0000000C2HD-3lp4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:09:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546D9NTJ508993
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746536963;
	bh=a+oEfF96Z/IiSXPjQsuXB8B1jzzW8U5OwiYJRhUIYhk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uGSdB/HEXLCHA3Ql0Kker3N+x/wSFZvA6xsPquc3iqjnps8qWr0R9IQuohuVvhthQ
	 neNG2TU2mw3sNZxC/bkHaeGLclduM9t7M1QFlMOrBtpDKyN6PJkLVKphQ7q3zpziMb
	 kTLFdz7tRJprwLg9nwhrWKYjr7d+H1xfAn5U0YBc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546D9N7Z007559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:09:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:09:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:09:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546D9M1Y014931;
	Tue, 6 May 2025 08:09:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <devarsht@ti.com>, <y-abhilashchandra@ti.com>, <s-jain1@ti.com>,
        <jai.luthra@linux.dev>, <jai.luthra@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Fix dtbs_check warnings in ov5640 sensor overlays
Date: Tue, 6 May 2025 08:09:21 -0500
Message-ID: <174653691513.707452.7671570412184180977.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250506045225.1246873-1-r-donadkar@ti.com>
References: <20250506045225.1246873-1-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_060930_026755_55B84ECB 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Rishikesh Donadkar,

On Tue, 06 May 2025 10:22:23 +0530, Rishikesh Donadkar wrote:
> Fix the follwoing dtbs_check warnings:
> https://gist.github.com/Rishikesh-D/2f6e0a11f2f72ce70f75058d0caedc9f
> 
> Test Logs:
> beagleplay + tevi-ov5640: https://gist.github.com/Rishikesh-D/38ac71408f108147f4de596f260ad7c3
> beagleplay + ov5640: https://gist.github.com/Rishikesh-D/7911f4efdc935c22a2c97ff502c73189
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for OV5640
      commit: a5da12f37b8532b7ea9196ae7c7927a535883194
[2/2] arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for TEVI-OV5640
      commit: cabe662bd54b37deb7ebf0a4dbaabc7812fa411c

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


