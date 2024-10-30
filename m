Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B30DD74962
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF1ozKFoQkWPI0e7AdbdJLTmdxko1lP62hOtfBf8zzk=; b=rBczYFLkthEnwEp0a1yqDBNo4e
	vIRAF91ff5ZFjp6m8I3kubqn7tXGCkJNhTT6LDFG0YajGypRXUM1xAyu4o5vh2Bae2HIzb9Ntxy68
	ZJXu8owyYwTIMgAy0CR/4HtxSo4UWL92w2fL+2lZyWC8bW6/EBK8aGi+LiyjgQe08sxtCXuSvqKzh
	va+B2XP8Tz5tN1NGatssnsq8TbPRX+rEDs/P0zGWEHQbCwlvYYbgUd8UYQgR/CqRjuVbqfjxN1Kp6
	frzBhWLqhGbKvgtfeOTbkAW5mpWA3X8cQMD6A4V2yl4CRDG1LVWz0ANww3Brj0gezTPwSCDKuBePx
	8iTxKWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60qJ-0000000Gjjh-2LFR;
	Wed, 30 Oct 2024 05:02:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60j0-0000000Gile-3g1K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:54:32 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4sR8B060578;
	Tue, 29 Oct 2024 23:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730264067;
	bh=NF1ozKFoQkWPI0e7AdbdJLTmdxko1lP62hOtfBf8zzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FKEByTDYstGw2/SsbzV4sJpKQUQv/Pm0bszpsMlTT1KB5pB2sxNdkLz3w5IEfabeU
	 6PlrpEiyIrRe+YPsDrbGSO9SLPgro/WwxutnpWiJkkgFVFfVwVF5tMarroFiSqD0zC
	 nQNt7oFIOONAy31jDtYWw7IaiZ14LfHKxpkG8HRM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49U4sQto118844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 23:54:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:54:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:54:26 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4sMU1064291;
	Tue, 29 Oct 2024 23:54:23 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <j-keerthy@ti.com>,
        Anurag Dutta
	<a-dutta@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: (subset) [PATCH 0/4] MCSPI clock ID fixes for J7200/J721E/J721S2/J784S4
Date: Wed, 30 Oct 2024 10:24:17 +0530
Message-ID: <173021674663.3859929.6398782356598128564.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023104532.3438851-1-a-dutta@ti.com>
References: <20241023104532.3438851-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215431_030874_FE232C4A 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Anurag Dutta,

On Wed, 23 Oct 2024 16:15:28 +0530, Anurag Dutta wrote:
> This series fixes the clock IDs for MCSPI instances across:
> 1) Main and Wakeup domains in j7200
> 2) Wakeup domain in j721e
> 3) Main and wakeup domain in j721s2


> 4) Main domain in j784s4

J784s4 bits dont apply cleanly anymore. Please respin.

> 
> In j7200, kernel crashes were observed due to incorrect clock IDs.
> In j721e/j721s2/j784s4, there was only a mismatch of clock IDs w.r.t
> documentation, however it did not trigger a crash. The clock IDs can be
> verified from the below links.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI instances
      commit: 3a47e381670f130870caef6e1155ac531b17b032
[2/4] arm64: dts: ti: k3-j721e: Fix clock IDs for MCSPI instances
      commit: ab09a68f3be04b2f9d1fc7cfc0e2225025cb9421
[3/4] arm64: dts: ti: k3-j721s2: Fix clock IDs for MCSPI instances
      commit: 891874f015e98f67ab2fda76f2e859921e136621

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


