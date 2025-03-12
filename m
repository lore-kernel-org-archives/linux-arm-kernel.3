Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7017C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPahDtGB0eHX6tHdTRooDg7Dv8wmlnQnTRhJNnGeoCc=; b=nku2u9Cx4o9yaCUgB/HFzg7aCh
	7jQKfZ9gNT2nDkLeKMBx9G2kTYGzMNM+buI47oY0+RbnA0QUDPiRgvByLt15xB4XsCPN/Iqq/4/6A
	hZTlzSk+FsxbFPVWH9gfvn6LqnlLQ7wX2nQ99VOOcAPlsJ6yvTn6KYoAq6EJQdiOCZ5QbqD8IaLI/
	pMEBL2JVj9xvm9BTXVxTR5GN1R3qkTMrA1koyAjzIOjhDfLxBzzXycjydwKWfbfEna//CyzMoEaqE
	TvxodfuOXp5TyRp4KwWjTekAdofUGbOjm6X/T1r1PIJBWOWz9DOvsOscOUPmNjOqIQJ6bAcjmIGXL
	6erTJJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPa8-000000095xt-1IBT;
	Wed, 12 Mar 2025 17:09:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPXM-000000095Tp-28SH;
	Wed, 12 Mar 2025 17:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1D815C5CD7;
	Wed, 12 Mar 2025 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3862FC4CEEA;
	Wed, 12 Mar 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741799191;
	bh=Ku0zOGsgy8nW6TnGyeloxNuOmdzoa1Y4XqlQKPQdjPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUkNneDdy4EQ1GGzUpIewE4E4iTQmS0e9bVbzsMi3PHjvkj/O783BQSn5VTPFDGxt
	 vuoTI0RaaY5t6ILNVue9uAIPvOq0kMnkTgl7nCMOhXZlkF++JB7ZrZPOOPiRqrJdSk
	 +65SdIAYPreQ+sHathgQZz6hLTU6KOeAM/unXaVoXTrqu8VILDKEJqH5dmcueyfsfh
	 niXA2hvWzDVU/nG1EBbBiJ1bkU0LlMYugSqNxEEAGc8ohDaEnOlQAPw3Nmifoy6EmK
	 CwUPkmPAPJOnKVFkDCVOLiB3XBrEvLS4tzRW+29IxIToXuU+s4pcECGhuYLO0UzvRY
	 prTE+ERTfIQ3g==
Date: Wed, 12 Mar 2025 18:06:21 +0100
From: Simon Horman <horms@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-rk: Remove unneeded GRF and
 peripheral GRF checks
Message-ID: <20250312170621.GW4159220@kernel.org>
References: <20250308213720.2517944-1-jonas@kwiboo.se>
 <20250308213720.2517944-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308213720.2517944-4-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_100632_588952_6106465F 
X-CRM114-Status: UNSURE (   9.13  )
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

On Sat, Mar 08, 2025 at 09:37:15PM +0000, Jonas Karlman wrote:
> Now that GRF, and peripheral GRF where needed, is validated at probe
> time there is no longer any need to check and log an error in each SoC
> specific operation.
> 
> Remove unneeded IS_ERR() checks and early bail out from each SoC
> specific operation.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Simon Horman <horms@kernel.org>

