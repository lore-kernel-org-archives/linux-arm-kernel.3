Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82E4C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 22:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLBVj5rbf/Fse4CNTk8aYYevrpQuHKM6zqnS40OkI70=; b=ScU4cePRn/kITTpQf+L5o8eWLX
	OJg3L7iV+hht2DPsKO/QP0SP82lWUGklRzi56WPBCQEJhKVIdfFpzcNa7/7/qen3GoLld4cpaxunj
	9pae1mJ/jNoKmkh3WZUXXJ3GDUHztWhcWgnc2p6nbe6Zh3+LXO55NasMRFnluK6JC0tDeZXPUTNol
	pXY95/jHTXZrDdDS1CHu68JlywERbCYUw1ugmXCuA6LLpeIqQ1Jmxjfqi5rqB5drRDf/uBnxlTRYL
	x7bnGzrfIvrVlP62W9vfqYQFrLKjClKTDeCuphdBR+hg/3M6er/M8MYgougb8pxuvqLlH5brikI9H
	Y8yjqLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxdG-0000000Gy7s-3mvt;
	Sun, 27 Sep 2026 22:46:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxdF-0000000Gy79-23mk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 22:46:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E86D560052;
	Sun, 27 Sep 2026 22:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386321F000FF;
	Sun, 27 Sep 2026 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549164;
	bh=sLBVj5rbf/Fse4CNTk8aYYevrpQuHKM6zqnS40OkI70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UFpSvxvcLza/vij5zchkmU4f4KvcsN0drTuwjJ68pfN0/Ed3cE4voAcEA9L/8RErj
	 exfMRr7+r7BJUr8LtwEDNMl4D4FpOR0vrsaNJW2mFfiB2OSUG5xKqR8RAG6GE5Xj1K
	 p9eGT17d4T8qkVLo4FOhE3bGUjNAbuud6ZTu9UK51ZftyNfCKT8U7L/GRtV1SiWT/j
	 LZOZ9jm/yq3rTIchbZGaFjK8jLU60++Ud8LNIqaeY/jEX0NXFcGcYSIG7NYbrY65dg
	 p7c0e74RB8EqA9qf2qV+VlVTOV30X/9tbC+gCbalqp6Dq9KUbKinXXLOQ4I0hARmnr
	 nV59h4i5DEB9Q==
Date: Sun, 27 Sep 2026 15:46:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, Jitendra Vegiraju
 <jitendra.vegiraju@broadcom.com>, thomas.petazzoni@bootlin.com, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net] net: stmmac: Don't set or get RSS parameters when
 not supported
Message-ID: <20260927154603.47253d19@kernel.org>
In-Reply-To: <20260926093343.292181-1-maxime.chevallier@bootlin.com>
References: <20260926093343.292181-1-maxime.chevallier@bootlin.com>
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

On Sat, 26 Sep 2026 11:33:41 +0200 Maxime Chevallier wrote:
> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
> 
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.

this is net-next material

