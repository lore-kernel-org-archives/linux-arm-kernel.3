Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DF2C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWBkAP2A212iHPTYTtwDXTZq/RgrJx1ZYtlYJrlP9S8=; b=Y+S9NtuG3CZ1tlHjwlBP4k4Suf
	qGMg9Lt5r7Z+AvVb1R/zJzY92dSZfww6ed7Gf/iTyQC4W+stGDZ/AELvUC7B5cR9IKw5mMF+YSwM2
	MdcfGSuRKpsVefMb1wBTtYNWtfVDOGI51rB/YWLD9+Nb07VbB2Dm2tKakHlWjhpuIay6c6eLCe4Xh
	6hlbpyBJzwemhvRtX5tdSe7Pk1I6lU9HOAKqnBBVA+Q/u0wuKw3aUCIo1G4H17XWh/qic13epDuZh
	z2E2i4gr8e6sGaFi8HoVTj0rp/xBygD5tPsRzlJyEBTSMp4FnX4kRJDsccesQH//4ymDsrsoHLeGD
	JgttOKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RYZ-0000000Da7x-2BNZ;
	Thu, 17 Apr 2025 15:53:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qvg-0000000DSYS-05p1;
	Thu, 17 Apr 2025 15:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58BCB49EC2;
	Thu, 17 Apr 2025 15:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BE8C4CEE4;
	Thu, 17 Apr 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744902807;
	bh=vDbkTIHc0zXTAQW1oy0wD2cr80Dbn7VA7qtXP2ydKjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=djt00QHqYgsHYUVrBdoVCvURtrC+CMCxIT/lZiGZsqCUApnoRK35Ks6D2PjVB7YMH
	 bxoP+RxujXuPqfm+YwF4JJAa8E6bN87A10k9iIUnK/s5m6caOsPHBGPMmh9ag08+MD
	 gAC1EbYxT2s3OHFRLVzHmIzbVbJ60IYZL1xaoeLRLHqJtbn04zy4jwvAr4UGB4dgzB
	 zEd70H3SChtnOxGKEyqa+CFkGh4owK4d+PsxwWTok1gDGQW8xxJMZFHomRsW0vxNrU
	 nB7+i2VpZ8i8A4dSwjQaCYERAJKxOaEYJ2QA8desbiVmn2IcqxKlQDC/4nAeQ5f8oS
	 G0DiHBvBDjuRg==
Date: Thu, 17 Apr 2025 08:13:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Florian Fainelli
 <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 5/5] net: ethernet: mtk_eth_soc: convert cap_bit
 in mtk_eth_muxc struct to u64
Message-ID: <20250417081325.0e0345ee@kernel.org>
In-Reply-To: <99177094f957c7ad66116aba0ef877df42590dec.1744764277.git.daniel@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
	<99177094f957c7ad66116aba0ef877df42590dec.1744764277.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081328_084056_F3F9A6CF 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, 16 Apr 2025 01:52:03 +0100 Daniel Golle wrote:
> The capabilities bitfield was converted to a 64-bit value, but a cap_bit
> in struct mtk_eth_muxc which is used to store a full bitfield (rather
> than the bit number, as the name would suggest) still holds only a
> 32-bit value.
> 
> Change the type of cap_bit to u64 in order to avoid truncating the
> bitfield which results in path selection to not work with capabilities
> above the 32-bit limit.

Could you please be more specific and name a bit or a field that goes
over 32b? Since this is a fix ideally we'd also have impact to the user
described in the commit message. But having enough info for the reviewer
to quickly validate the change is the bare minimum.

