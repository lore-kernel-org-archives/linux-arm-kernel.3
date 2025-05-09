Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7D0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3zdd1YvHMWYNGxIXy3qf/H2kg9XVwxtKB16uwxSH3A=; b=NCIJayGCESUqucYeVvCs6GlKc/
	ndjKOIwgXhI3de0idst9dUiqdlUeozhmjNoa34uLOxVuFRykzCibcEmU0zN6BwWCjUUoQvJKXsz8y
	KbEWSuBGjMJdOgv4cXKsvtx5ji6lwrOBSSt9wKhBE+PZ5MqFgJYyFXNTGZecjStVWY+nJO1BuCxhZ
	nBf+hjvF+MO4xRFCyY2PbNww0/AaGZLHFdhdU2TDCh21Pa5M7DJSF8PKh+BgKoTLzBMQjborZTpQD
	zjaObaMqpfmxG0qLd6eCPU74TdsUqsuPKUsl/fLmB1WXzy9+YDPNrPqlS5PVZjzffSvOC4fVFyrih
	6gqtvTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNRy-00000003hTs-3fha;
	Fri, 09 May 2025 13:07:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMic-00000003Yyi-297a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:20:47 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 549CKhb51380483;
	Fri, 9 May 2025 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793243;
	bh=R3zdd1YvHMWYNGxIXy3qf/H2kg9XVwxtKB16uwxSH3A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wOXd4G+AxvenZl5u7+X2FVZagBDvNc6DTaoQFgZjft6oa4+jG+7U2eH+SW3GaZJjK
	 vVU0ChaedOt2aBICgMax8NHd8h42Fv4sNW4b94f9NTgaqRYlLdk/F1In4pGEvICxtF
	 4+SnExNA9eGVSTQTw15RWuTgSsOBCLwwfuPSnisg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 549CKhWS2856384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 9 May 2025 07:20:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:20:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:20:42 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CKgYE053941;
	Fri, 9 May 2025 07:20:42 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Daniel Schultz <d.schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <upstream@lists.phytec.de>,
        <w.egorov@phytec.de>
Subject: Re: [PATCH v3 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device nodes
Date: Fri, 9 May 2025 07:20:40 -0500
Message-ID: <174679323299.1568816.9463922925187709085.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052046_643543_A4C3D3B7 
X-CRM114-Status: GOOD (  15.07  )
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

On Wed, 07 May 2025 00:00:04 -0700, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 
> Changes in v2:
>   * Rebased to latest master branch.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
      commit: c0fa0aaa69ac3a8d242fc12cdad8cfc4b8fcdba6
[2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
      commit: 8dd0ac27fcd1ea64612d1f2392c69bc2648aef2e
[3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
      commit: 5d0727b0537f3e5c3c457ead700a5cdb1ee7eaf7
[4/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
      commit: f71fb19f36044290669dccfc31d1de6ef3d0eed6

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


