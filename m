Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F36E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPgEgPHXiLBNETa+wEEXPVbWMGlgl8r/WmdmTJCw798=; b=X5+6qa+R/wd67+MZY9/3aUrNAh
	1+JM8NiTRoD1J5WJLinCHVXrDJIOW/P7CBqA5H4VjvHm7euLaWcZBfBIlW9Mjxt/1hbxy1IggZcMw
	LLcSVhegBlEGtZWa4YiHzt+5/af+0OHEU7qJOCz4wyqkXj4SHc00TLIYUxONwrKb8DEoUcqydhHWX
	KaiwwK3DT4HkUAcpCDK8XlolRJEPXSnJfFqa2XqVeYxKgNCjtiuH/wk3iuuGlB8dHXC/lWog44nX/
	kdpM/yGWJ06Tex58WM+1aQtrgOfbnP+0E7fH9i/ssY9L/UNBeqMS/0WL8SpWiuijcCfbIWjX4dK43
	QBI2sb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9VJ-0000000D8po-1sJG;
	Tue, 10 Dec 2024 23:18:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9O0-0000000D7Si-0eCM;
	Tue, 10 Dec 2024 23:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GPgEgPHXiLBNETa+wEEXPVbWMGlgl8r/WmdmTJCw798=; b=bXFciefHRfvI9pD+nD5btga3zq
	33lWZ0ZlsOX1oWoBf0BDVmVBvZEh++pTU6vUfe5lbienCeYsXObF/9gaejpcOHthv2xA2Bjq2FJqy
	TM6O0hn6R3rmi6WCx4SQ6g+i7ue6QdL45PamUG8Ufu4iS7Lwd31Bj58wFhHp4yyLheeI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tL9Nm-0001My-61; Wed, 11 Dec 2024 00:11:10 +0100
Date: Wed, 11 Dec 2024 00:11:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <beb50a2b-1d3e-4c34-821c-e4f93767cb5d@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
 <6758c174.050a0220.52a35.06bc@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6758c174.050a0220.52a35.06bc@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_151124_193291_15FEC59B 
X-CRM114-Status: UNSURE (   5.34  )
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

> Doesn't regmap add lots of overhead tho?

Compared to what. MDIO operates over a 2.5MHz bus, assuming it is true
MDIO. The CPU overhead of regmap is probably negligible compared to
waiting for MDIO transactions to finish.

	Andrew

