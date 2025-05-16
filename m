Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0590C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EedyhxrBbwBUSKEVvqPNTbJY5m3bFtYRpv0O+uq3Oo=; b=4SPol+OHeg2dF4NeqBwR8FrDtb
	LeeUTWGKNlk7Pa+amY6jbOViDPY/ViKx+ad/riVO1+JUHKOYvM3DQDa1bg9Dn1Ke6tuHawTECy6VT
	zzhlgD3L1fyy2kQFohZUqQshVVhbUZkcnXWVMa7bvrkJRaex46T3eaXi9KtWoADmQQPvTqV3onY8h
	JNQ6OB4uqcaep0z47lwpNHfTvhO8VZiXMJHYp0obbM9gyLPpuOnp3rCfWx6LmDaBQLkxixUCNhU+b
	xpe9TndnPwfmiMjWwIx5Dk9Eck21V9tzMqypjltxpYo8yHMa8BFJSLQH6Ih458SJIl52P/j/w/c5c
	YZJ8zkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjbY-00000002BO7-2MLX;
	Fri, 16 May 2025 01:11:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjZO-00000002B8m-1FEZ;
	Fri, 16 May 2025 01:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3537C5C067A;
	Fri, 16 May 2025 01:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1F0C4CEE7;
	Fri, 16 May 2025 01:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747357740;
	bh=LlunDUDR2TDmEZ4XUi/62Fa3/lxpELn/iGKcFemx0pY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RGbgPKQxwqSNa6sH9Id4EeYCV2OlsMGF0tPsQ2HerBXkMsznD/z1C1dV7O90isz/5
	 PvGQjMzjA7R0CEJl7QIWw6BW9uQTvj6EYlwj8YUeyEvzablmHzdgLEsLbBVjNBhCUk
	 HnbbR1dPatfKYT9qMd9bPlH50j8zjn8hnWKtt4jZj/XkJxAPi+AT/oWgrTwivLKlD6
	 cCzJmLUVLB5/3qqoiMZkD25VaGRxzw3iBAmJ64j8yLD9pIrJe49KhLUBaYdZluIFEO
	 8sBH69+tOVkmjgtGEGnxxwtTlqwra9xHqA27Y639nB4an2gwDDGKM3ufJ+jxUOPofZ
	 4inbHkljJci3g==
Date: Thu, 15 May 2025 18:08:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, rafael.wang@fibocom.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT
 and FAG count
Message-ID: <20250515180858.2568d930@kernel.org>
In-Reply-To: <20250514104728.10869-1-jinjian.song@fibocom.com>
References: <20250514104728.10869-1-jinjian.song@fibocom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_180902_388045_9EDBAEDB 
X-CRM114-Status: UNSURE (   6.76  )
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

On Wed, 14 May 2025 18:47:28 +0800 Jinjian Song wrote:
> The DMA buffer for data plane RX is currently fixed, being parameterized
> to allow configuration.

Module parameters are discouraged, they are pretty poor as an API since
they apply to all devices in the system. Can you describe what "frg"
and "bat" are ? One of the existing APIs likely covers them.
Please also describe the scope (are they per netdev or some sort of
device level params)?
-- 
pw-bot: cr

