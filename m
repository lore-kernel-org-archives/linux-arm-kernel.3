Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D47C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOGviD23LIx9itgkTZT1I56y223hTDE9oauoFAaTHLY=; b=D0zgBeWqdrtMciN8Ye0VmNwN53
	ssCSsHHQAaqXCeDc1p+jif/X5dxczRsKE/OspqcAD1j8b14yeFyswDXrQV1pEuDfcQ5gPduB+TDzJ
	GwEquSEpYQt+d5HK/MZHIEqbEvC6APMMWYzPtgHHJh7FB39BPLHMzsVl/gr30n/Q9oEoulLckZYPA
	QglEEYqLBWUx25+D2hzc/tWuAnoAc50SRORIpDkPob8Zl/4FLbMfb9QXVvLeQ24NOwxplRF94ZpcO
	vLVDFinHziWBObN8CQTveSPgOE5h6PI0jgYES4b7SFRiab3sR49rRogvhoam10amm6UIXoCVemHfV
	GCvs9Rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KLD-00000005AX7-262c;
	Tue, 15 Sep 2026 04:00:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KLC-00000005AX0-1fny
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C34036025F;
	Tue, 15 Sep 2026 04:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3DD1F000FF;
	Tue, 15 Sep 2026 04:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789444817;
	bh=bOGviD23LIx9itgkTZT1I56y223hTDE9oauoFAaTHLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VTz0/iKuOlxNIORnSR8CuhF+WTbfOZ9IQ6sNACa+BhbsvUi5Yjs3aXS1d2jc6z/eL
	 NyxLWxxKcByY9bs5VR74ChBQYe63zeaSbxZF6mZvAAGXP/PAL0zj2yYsJBA3hNbru9
	 u1S4c8nDC9un1+OYBLtAUkKDX6UxIbV09M5F8USMVdFcsi/jZ0kSUVa481hwsGkRCe
	 V5dernqc5o0A1SevCkPBWxECHJ4B1UJJJS4g9U33b/r7Tnj2hHBVJLcVjEzzkIPv/B
	 orGYptUx7f0KJTDg6MkHyp/JM+cWcrACFYHe5JstDNuix8qaU3APNSdtmziRqHcZ2K
	 xBMiaqXYvSY1w==
Message-ID: <4f4941e6-1e51-4fc7-b452-e7f77cfca4bf@kernel.org>
Date: Tue, 15 Sep 2026 11:00:11 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] ata: ahci_st: Assert the power down reset in the
 probe() error path
To: Niklas Cassel <cassel@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Lee Jones <lee@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org
References: <20260910171406.131211-7-cassel@kernel.org>
 <20260910171406.131211-8-cassel@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260910171406.131211-8-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2026/09/11 0:14, Niklas Cassel wrote:
> st_ahci_probe_resets() deasserts the "pwr-dwn" reset, but the probe()
> error path of st_ahci_probe() only releases the host resources, so the
> SATA IP is left powered up when probe() fails after
> st_ahci_probe_resets() has succeeded, e.g. when
> ahci_platform_enable_resources() fails.
> 
> The reset is asserted by st_ahci_host_stop(), however ->host_stop() is
> only called through the ata_host_stop() devres action registered by
> ata_host_start(), so it does not cover any failure happening before the
> host has been started.
> 
> Factor the assert out into st_ahci_assert_pwrdwn() and call it from both
> probe() error paths. The "pwr-dwn" reset control is an exclusive one, so

from both probe() error path *and* ... ?

> asserting it once more from st_ahci_host_stop() is harmless.
> 
> No functional change intended for ->host_stop() and st_ahci_suspend().
> 
> Fixes: 76884cb2f7da ("ahci: st: Add support for ST's SATA IP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Other that the nit above, looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

