Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF97FCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWfNV6cHjoSfFmcClSN8Sf+H1+Oh9VuEExsfzR2VCoo=; b=BRGwzIs2W1glKSoEIBmt/7wxQG
	ggQOilKB5OVifh5SFzRlpGcyPhBvT7sD4E0PcaxifoMTRCkVM37eLlud0xBAECQxc2grG2NNRH6fY
	AhDJgns4jJLUy9hHY0rCAvTjZSAuanV0deHoiYkftODJORAm5cMxHczWxsYedCCCPCdUwOcUFT6J6
	j1g+NdbvAI2OOsvpl8mk2qDIWrNiZPOBQWHr8eYVlDTBjS1UkQui+p8zzN3Qu5aidQ2Kq8N9PW/S9
	H37AIfXZ/+jnXrCMYojcwg0SdV2gH7K9MxAynkpr4JIQyAGRqt+m7ccxgAd+I+yv//isRZb6klV2M
	M+ZF1f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFIk0-000000085rY-2QiH;
	Sat, 01 Nov 2025 21:02:28 +0000
Received: from mail-108-mta131.mxroute.com ([136.175.108.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFIjx-000000085r8-47DC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 21:02:27 +0000
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta131.mxroute.com (ZoneMTA) with ESMTPSA id 19a413a6dea000c217.003
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 01 Nov 2025 21:02:19 +0000
X-Zone-Loop: 4af5fcc333bcfb0aeb56d19adedc50ccc857b6ad9342
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=TWfNV6cHjoSfFmcClSN8Sf+H1+Oh9VuEExsfzR2VCoo=; b=jDDGh7
	W7WX4GjdueniBZ09tJd9QA8D78LBo/tMa9z8Q8Kn0+HlT1+PQ2LtMbt0AChmIgZop4MiyOqkqQGPf
	Bbm3Cr70nVS+eipkdvOo7S/+qKuhn8B1Xq7pOW8mcGBtEWGFLD1dw0mvY3ytkJPbPwA/Vv0f5aBPX
	8k8qWyBos93Z06k+v4EgmsfgygqK3xvdf7ewYVraVbUmjilIqs8HjnRfCcx8gVpZaakYbL0CsOZlr
	HOwF9KMMWuAZIuP3U+ztHSv6VlVD6sL4eGCFrWT5x5/7dVZ6sgsNv5BXQGCSQF2x72UqNrAwIUIGU
	D0ApWXeYAT4repSJg76teV5DVxFQ==;
From: Josephine Pfeiffer <hi@josie.lol>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Sat,  1 Nov 2025 22:02:01 +0100
Message-ID: <20251101210201.43210-1-hi@josie.lol>
In-Reply-To: <aQNyaoXKsMdkIDrc@willie-the-truck>
References: <20251018170416.3355249-1-hi@josie.lol> <aQNyaoXKsMdkIDrc@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_140226_130312_A02D82C7 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
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

Hi Will,

Thank you for reviewing! This is part of a 4-patch series that fixes the same issue across multiple architectures. The other three patches are:

[PATCH 2/4] ARM: ptdump: use seq_puts() in pt_dump_seq_puts() macro
https://lore.kernel.org/all/20251018170442.3355403-1-hi@josie.lol/

[PATCH 3/4] riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
https://lore.kernel.org/all/20251018170451.3355496-1-hi@josie.lol/

[PATCH 4/4] s390: ptdump: use seq_puts() in pt_dump_seq_puts() macro
https://lore.kernel.org/all/20251018170521.3355738-1-hi@josie.lol/

Each patch was sent to the respective architecture maintainers.

Best,
Josie

