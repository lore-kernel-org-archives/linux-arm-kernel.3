Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE45AD3E783
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGMu6krT2d8DVH7mj1tq1gvXTBuizMnoRN7EUXpYsOI=; b=SnyGLwgoArXL6sgUY1iG7NQhc9
	8mrg8wxBxHSCQB5TUCgHKP74weMrNNMVx8+Fid6R96dlZetPO9jrengfzYodascIq8LDbB03AhWgQ
	P5luCf8iRdS1LGjpEpXdeOHOGbsib9xrR31Sl/t+J2zPw0+X++RMRk19WXjUk99ciN3m7DEZFN5y0
	3OTDAyZH9HQNAwJt4T/z1Q5YW0lxHwZl8xTiSguIZb/OOyXZIyLMLhwKEiwOewObANnIYsE0yoMca
	opFSA9CPt3ufyTX3s3oSdgIq24QpCd51sAp9Bvf6dAowJzOnGZMoXucHTU+Sklil9bghIn6NNaf5b
	w/TxNMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Vhx-00000001SO6-3QId;
	Wed, 06 Nov 2024 02:23:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VfB-00000001RqQ-0IFF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 02:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A6975C045E;
	Wed,  6 Nov 2024 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF43C4CECF;
	Wed,  6 Nov 2024 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859651;
	bh=JQwZWqay0fD/RVvSUq/M7j+EthA8PgKPkA3/ngbOuF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KF/7FHeXI9aKLJBwKxLnNY6wq54eyINIDMfExomu8YLPUTv+YYLNMj7o7ajtMMxqn
	 PMAPN6PxUti4+6ybZwg4Fs4UgKJhld9T0g17Em38dezveqmQQC1+YymOrTSPJaX+h/
	 0Z7BMzz1yoEQaIrquQwaiGB/xs3U/thQ4yYD6TxPwtlCcaqls5rO3M2oPGJUUcrNQx
	 j5qTGOiUo5tVq58m1/pRnBRwS6aK1LVivF9YFqxx+VfieFeHytAEBXDtFkEo34v+V7
	 9zNNA75klioy00Xrw4vX5B2KCkHwgp8rbEGR/3LlJxtbww3I6jICHoMT4TDXU6MkvT
	 khDR9erObcLrg==
Date: Tue, 5 Nov 2024 18:20:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/9] Support external snapshots on dwmac1000
Message-ID: <20241105182050.2839f1e7@kernel.org>
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_182053_203701_DD4501A3 
X-CRM114-Status: UNSURE (   6.46  )
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

On Mon,  4 Nov 2024 18:02:40 +0100 Maxime Chevallier wrote:
>   net: stmmac: Only update the auto-discovered PTP clock features

Minor conflict in the context on this one, please respin.
-- 
pw-bot: cr

