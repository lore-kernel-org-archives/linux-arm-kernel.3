Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E61CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nB922UuEUa2aNvfZ9Rwg8/9ZbT8bdXDl98KbCYYgE8=; b=HfDtsysNdr0Y9lry4n7Sj7iUfd
	vE5ZulRFF8OBAPJo9COLT/FLa3Ho3jWRVPZd8Di5WyQhoE4aasbdOBAZAH/ZYz5P5miYXe88G/WKf
	CVdKOf0qukzwPNpywWGXOxnyf1OHuaqQO2DirXyoN8fT2jzE75+ULf0twADKR70KY9PT5K1F95m69
	qDy8OM1bepPZw6/AnRDXtxmB6XoyoVmcswPLDlMrhxOlKjbLxB6BJ9DtDdaZ2J/qYWhOagVzrT2u/
	ayLbbWAjcqBnJCnKH0iB57Ts0Boxt7gNROOHOPzfcYEEipCFMgQ+qxn7p6uxQmXGDLky7tIk7MifG
	OS9hBj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCekZ-0000000Bpkn-0FiF;
	Fri, 02 Oct 2026 15:00:39 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCekU-0000000BpjT-33nz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:00:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D32BA4A31;
	Fri,  2 Oct 2026 17:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1790953231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+nB922UuEUa2aNvfZ9Rwg8/9ZbT8bdXDl98KbCYYgE8=;
	b=QhT7Di2lnErJEzqLGduQsyEl+eHO+0csh4NCW4kZysU/Mj0uSE6jZNAI7W7U6Q1oYIh25Z
	7EQLOwIP/sszABElfYq5GK7uW6EYoLKRskLYBb9orROTdcpEHgtOp9YhmE1oth19mBJKIo
	LhP5A+NVs8I/F18WpXyf7FbbqGNn7ydQ8W1mYwtjN9uRdcCIxm9LXnXbowcDXi1t4Ij/gG
	3t8aMnf9DQ29mRDZ3OC+lq5G00qt/darj58n0m2MpCVgROsj8kzqRVOctqwnNF45k1sfdL
	pHre+lb3191ttz9CHy2+yHO3c+XE4n9NlMGE13DCoT5a6UR6saDEiZ0PrDRIpQ==
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 17:00:31 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Jitendra Vegiraju
 <jitendra.vegiraju@broadcom.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Peter Robinson
 <pbrobinson@gmail.com>, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: Introduce a helper to check
 RSS support
In-Reply-To: <20261002142806.1299041-3-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
 <20261002142806.1299041-3-maxime.chevallier@bootlin.com>
Message-ID: <cc63835ed924d0e1c10ec89c7621159f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080035_719517_07A6F25A 
X-CRM114-Status: UNSURE (   7.35  )
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

On 2.10.2026 16:28, Maxime Chevallier wrote:
> The RSS feature is only available in stmmac if the hardware reports it
> through the DMA caps and if the platform glue sets rss_en.
> 
> Introduce a helper that checks both.
> 
> For now, no platform sets rss_en, but there's interest in the topic so
> leave the door open instead of dropping the feature altogether.
> 
> No functional changes intended.
> 
> Suggested-by: Nicolai Buchwitz <nb@tipi-net.de>
> Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

