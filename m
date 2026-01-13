Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEABD30CF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1Tcg/QN1TTrTtAwFCgvWNzKmhKv7vWmWyihU4W7bNg=; b=ujX3ulCRJ6MYrvxcyr0P26TR/I
	MVv5dCjufNdU1cPiz9vMRHIm0PbzwOuKaTrM2G4h0KVnfpoLN33Rr+ju3FMDyCprDqY5XKvILxIUb
	ILwOgM+uCO55KEZ+wTbF4mv5kx1uQurrS8/n/F5TghlI5Wut1AAdu8uu74Kn1d7QNz+4Oa/QieFXE
	xAZBSnwCc9X5MB3tF9gzBp7JSVpgc7BTamHUM0ufNyO4kbiy5lXwJixnahY6tJ1gT9PNXr6nfvvfS
	YfOwfpE68Ten1gclBQr3rc0wAGIXm3dVsNQp51QFJ+JvjFTSVs2QGdyBRryp9U7akv+18VodvWzMy
	8qUt+prA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnKI-00000007qp1-1yGo;
	Tue, 13 Jan 2026 22:57:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnKH-00000007qov-1LCW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 22:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BD5160018;
	Tue, 13 Jan 2026 22:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D34C116C6;
	Tue, 13 Jan 2026 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345044;
	bh=/VOHhg+BGXPkNRZ89eA1uek4P5riQp1mlGx8ZixiYbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFdasWx5pC6fVJ1H8GZcX26x6Gj49Z3Eo2u2mv3//WQIHweZaauLn9+EwlX7pcU+M
	 066YUvqnxHXqVwFrvOJa0o6C/tLjve6l3sI794elsbdVtASK3YJM3Y8fAAse+pnnrU
	 SMwNf3uJNb66kwi4v9DatKsP4SMLUQhjrl/j14qpKIt27fhc3p/OLqsBbBKk9e1B3J
	 DcJxKg2XKFYlJR7qWSiEGTcLs8cc0sGYQvL8l6cxaAcDUGiP42ltDO5n5l2GEh6/R+
	 ANdgMjn5VOUd1wNyr9Z9MXLKQRDA03EKsMRdi4s9eENmZGytvE0etq8fgKmMBNPacV
	 GbcO9kPVEhiQg==
Date: Tue, 13 Jan 2026 16:57:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: net: altr,socfpga-stmmac: remove
 TODO note
Message-ID: <176834504228.390747.7474815974148199421.robh@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-3-ea0190244b4c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-remove_ocp-v3-3-ea0190244b4c@kernel.org>
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


On Thu, 08 Jan 2026 07:08:11 -0600, Dinh Nguyen wrote:
> The 'stmmaceth-ocp' will no longer be used as a reset-name, going forward
> and 'ahb' shall be used.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v3: Addressed Rob Herring's comments and updated commit header/message
> v2: Introduced
> v1: n/a
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


