Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EDECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 02:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLc3LaBS/EDD0+oE9hO9d7k78l9b38Qu/DnmwMbTEQc=; b=rrqvIqyl249kByqyDRGwR38TSx
	TuhORKr8LnV+dZUxbnX3aw6p1bcuM2siyxdMjN4IzCdLbMuiMQLeG/8zBoTipSaBxe81BlZkV6leQ
	HIVnXlO47mH5ZDW3OeLMuS7mwoB47GAgeGH4kUNYnJ4S4kCzQ8stPL+dwU2CiXboejGW7Y/qFc9tW
	g3tFbD2+Hf3x3xT5UUmnaKYPE/0KZemY/Nb4sWVdSZMeUunFYg6uNt4KXgn3qrIH3Of0O7kl7+oli
	Lds/RQ3VXu8bIrBBgoRJt0UeUy/G45svBBd5SieePHhYhd0Dpz9fLF9g2ebfO+nifm696RUYdCBLj
	+mBMkb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSSb-000000001VG-0ILK;
	Thu, 28 Aug 2025 02:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSPs-000000001Cn-23uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 02:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6806560235;
	Thu, 28 Aug 2025 02:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99700C4CEEB;
	Thu, 28 Aug 2025 02:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756348267;
	bh=Jp+q+OMH44/A5s5dMrV18NukkMjsoCFKlwXK6QRC9c0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gy7w7Z+gTiX4okHiVGemqZyKkOvwfjqvIB2fVFE/FzwchMy1SjtHL61AQhk1Yj5a0
	 e0iRWpLsvQ8BBCxMLQjJVzH7EgP53BxAPOZOWv2cPGztSUS2NeUuDeej8PUIOEH973
	 7xX1hdDIYDR3UfVvmXQgZtR42X+grk8y8tOx03VyVq546yR2NJyI3ripWcLqlFNuF4
	 rTiUjlNHeDI8SmGuq3FdDnth1PlWxz8GuEsc6p+esGHZV+ebXa+ajsoIeedijpju9+
	 J/0bVn8d+beYlAim3UDQQZlEUd+vSVW7P1lIBxK3ooODwdMxjqTQynmuusrkfCh5aR
	 VgahFsmkF5J7g==
Date: Wed, 27 Aug 2025 19:31:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/2] drivers: net: stmmac: handle start time
 set in the past for flexible PPS
Message-ID: <20250827193105.47aaa17b@kernel.org>
In-Reply-To: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
References: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
	<20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 27 Aug 2025 13:04:58 +0200 Gatien Chevallier wrote:
> +		curr_time = ns_to_timespec64(ns);
> +		if (target_ns < ns + PTP_SAFE_TIME_OFFSET_NS) {
> +			cfg->start = timespec64_add_safe(cfg->start, curr_time);

Is there a strong reason to use timespec64_add_safe()?
It's not exported to modules:
ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!
-- 
pw-bot: cr

