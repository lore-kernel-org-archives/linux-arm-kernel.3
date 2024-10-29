Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E854AD3A66F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK9KU0J4YBmBr2lXi0vOCehw2awpCqHpg0XfEgjmMBs=; b=VrXwOwGsA8prheLUKo0hQU+Z7+
	jYHLzVDjympYB31qrfZ3baOg8nZPX2wuWAdornwRju+4QiZ0uRiFvvmcRRGw9XwFPB3/tzyqvoblE
	Zqq3mTcbV3t9eYiYsRGfMLRntROQPObIe7lEbvDgoLwH2Hmk9xghQ1x5AvGy1oCHAJIh47UQzOJ5L
	EfRx2WN+I3Jkmonmx7m1zo0enD4b7edb00CgiVw37r0X/NYPETMbHRm6EuU6O4hbo6ro6EL7KVHxT
	GOtS7UQU5R5LsOotRE2zwfmmEJrQKFv1LDLU1VCVmG5j+w9Upktj1wMpvajO9PkEqrp53Z7oL+Aet
	v5jxv01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oys-0000000F6Kt-2HUu;
	Tue, 29 Oct 2024 16:22:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oSe-0000000F0Mi-1Qw5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rK9KU0J4YBmBr2lXi0vOCehw2awpCqHpg0XfEgjmMBs=; b=Eh+WtoG0k44Y4YnedsceTpaogD
	WsXrBbIA/GAnRFNIOTGDY1q4bnTmzZcM/ZHcrTRo4fw4btqNtB9UcMMxIh3mOmLF0OSiXL+LlklNQ
	amINxQ6yT/SSBqdP9fQodPnC41+QyFox+FGlN8WGBkoippI1Q2/yCQr1+HxHRXpLKiF4cixlwJx9D
	sExxgmlmTjg/hm0mSi5FGrgHHmxBZ9pXDSn6E/zDV1NG8yrSduRRFeSG8k7rWkz7lCRUjl060CogR
	3yEfrT89sewsGcxGJlqW2JFaL+TwO5+xKYxGZie9mywyEDG4GskSbZT0E+F4/ElVwrmDp9VR8uBCu
	1rZWA3pw==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oSa-00000009w5G-4C8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:48:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFmdPF107514;
	Tue, 29 Oct 2024 10:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216919;
	bh=rK9KU0J4YBmBr2lXi0vOCehw2awpCqHpg0XfEgjmMBs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nSl9gSkqEODdPb8fmlrdbqEKb3w7zncAK33mCZ5x3mzyT9MS+NXXJF+CCtnyoBXQf
	 NfTas3Z2DQeSzVOUn25Ies0uOA6c1nVGlbluqAfUtYu4HFvBVa315rLVkmWotKsncE
	 Yjw6nsJHYSI0qwLPbIaTGD7/VkVeOuc/yWeRtfo0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TFmdHR010720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 10:48:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:48:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:48:38 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFmYeL084360;
	Tue, 29 Oct 2024 10:48:35 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay
Date: Tue, 29 Oct 2024 21:18:32 +0530
Message-ID: <173021674664.3859929.14957336677514636431.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024130628.49650-1-francesco@dolcini.it>
References: <20241024130628.49650-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_154845_399743_58791CA0 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Francesco Dolcini,

On Thu, 24 Oct 2024 15:06:28 +0200, Francesco Dolcini wrote:
> The power switch used to power the SD card interface might have
> more than 2ms turn-on time, increase the startup delay to 20ms to
> prevent failures.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay
      commit: 2213ca51998fef61d3df4ca156054cdcc37c42b8

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


