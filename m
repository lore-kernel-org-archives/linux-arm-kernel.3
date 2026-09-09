Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD95C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZKHpTpkIb5ab/FqGCbdk8T88vV78aDTTt5HNIZwdSE=; b=wvy3hnvsKD5PA84zATSSyb5UdC
	gUz5QTrQBAfd6XCfN7zmlQnh0KlB1n9Ray3t7dVA8PK/NZEq2/srqpsIIYkqhZaCfEcHxRyaYCZ+T
	1/eZp3MBCM7p2NjZv8NgviuZhotiqyvZrlU84JKEHTRPnK+fvAOkEo3R77/cxVL8dXvIXr7/GTjmx
	RPQT51fAkUMSv4R5tKUXm4BaYDFxNo4SHjPvWgMOTl3PrgIf7QyORynzhAWBWXIee4kqs69Ka5Eh4
	oQZY1QQy0gkVlIpF6tTgrOq8iP1CdSQ0mdjSY2P2OSwzbByYL6A2QLZZ8/wa8krPOHPNjeeLZga+I
	l2uE51UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HHP-0000000Bebh-2GSD;
	Wed, 09 Sep 2026 12:19:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HHO-0000000BebX-2vT7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 12:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CZKHpTpkIb5ab/FqGCbdk8T88vV78aDTTt5HNIZwdSE=; b=L7SOFlORNk3+Y6+gMjF0uP32xE
	sivLXXUmGuJX7x8WPfsYk3Pp0C+puw2ad0qFZ1z/hlWh+w+loxasVBrPhxtqkHYK+ETe5cSn9KPyc
	/oHW+o/+fGYtig3S6YQR/6u4xmxa9hbKy+ewW/oILyzIDONJny2yO8lGicsM37Es5CsR57I2cLxud
	jCE8IQQ+wl3RNxOSY2Hd0sBlR+ONTCB0cWdy4nB/x33GagWJTlG+gtzrBvqBt5HblZV/pxin+CiUe
	0cITRe7Mz7A6wYye83eMRU1dcYKsQURm2s9rCyIZ8Fdeyh6L1yZxuTy+IpTXTc5jP+ybMSSGOnW8i
	eMRrhfvA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4HHL-00000001A4w-2cSY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0E991A1A77;
	Wed,  9 Sep 2026 12:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 828B160448;
	Wed,  9 Sep 2026 12:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21EC811C7AF5C;
	Wed,  9 Sep 2026 14:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788956387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CZKHpTpkIb5ab/FqGCbdk8T88vV78aDTTt5HNIZwdSE=;
	b=orGhtBEA4MogYGzZ9vleTPQyNNGCH4TjHqck98Qof7Lof2INnwBgJ3LsHd2oQPf07ga1i1
	mIMhia/hz20IIV2TUhDHp6bmJMOABC8cm6o0Qkni39VagkyhfcFNRUC5JF8LylsUM7NaGC
	gUMH3JQQde/9+5unreDv/Q0DXN/MSWq/AW5IPvfhNb5qoRo645X5g+ZYtXOKKaWUL54tMR
	FgFP407Qas6aFGghpmbFj/dzmcv8DmLbXslTK5pU0f9AtcTBQLf9YYq7sCRqa0s6dV5ToC
	1M0pJff3GvPt+3EhIow4SzJJYeYcZe5O3LX/DcvcwRzbMWa8Cs+O1UnF+QO2EA==
Message-ID: <7a3fea5d-c705-43e4-b799-eff9d1580a8b@bootlin.com>
Date: Wed, 9 Sep 2026 14:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 5/7] net: stmmac: Disable S-Tag processing on
 dwmac4
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, recv.jo@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shuah@kernel.org, joabreu@synopsys.com,
 yi.fang.gan@intel.com, jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-6-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260908164309.59282-6-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_131951_867215_50BF9CC9 
X-CRM114-Status: GOOD (  11.43  )
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

Hi,

On 9/8/26 18:43, Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain a 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag. This causes QinQ ping between two hosts to fail.
> 
> vlan_rx_hw() is shared by dwxgmac2 and dwmac4: on dwxgmac2 the tag type
> is available in the RDES3 write-back descriptor (the ET_LT field), so the
> outer tag type can be determined based on that info. However, dwmac4
> doesn't seem to provide the tag type. The Length/Type field in RDES3 only
> indicates whether the packet is single or double-tagged, not which tag
> type was stripped.
> 
> Since dwmac4 cannot report the stripped tag type, it cannot support
> hardware S-Tag stripping correctly. Therefore, restrict the
> NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER advertisement
> to dwxgmac2 only.
> 
> With this, 802.1ad tags are left in place and handled by the software
> VLAN path.
> 
> Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



