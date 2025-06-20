Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C32CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KruWtUSeB6NsR1odUtqSoeuIJ0mCcg9WFxQ2DRKLKk=; b=rcy/84ZNhvgfrUSG2Z2gXdUuHp
	x4fJXfCZ/Aeb/HkpYmB/OR3M2Vld14QsSyMv+BcoeqW3DtIBH33+KLMAeKkcG05oBG8W5NQCds88g
	2JoUzHliB5J/4ki2mBZVSekVI4MZOjblYBX8d9dCZBD1pB5ptKFjCBB3k+HbshAIX/XF+MTIsOEQ/
	rOHLBHGuBEgm3H8nr6xSuqNDmmVUVJsX8hbndw3dmt+qt+Gqc5u4qtda4KWYduY/NX9LbfFPuLUTw
	/+tH/ZJH/LtCF6cEOvNO7CdSvSEOjZmUSPmE469SZfSKAUs2UCB1glhMfvX9orfIX6Y5Y3tU5IyKK
	A6X+y1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSi1q-0000000GVFM-1IEm;
	Fri, 20 Jun 2025 20:08:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShzZ-0000000GV4M-0721;
	Fri, 20 Jun 2025 20:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8F244A424;
	Fri, 20 Jun 2025 20:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E66C4CEE3;
	Fri, 20 Jun 2025 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750449939;
	bh=HOxYtJiJhp46YLvbFulkT1F/asJMDlxZP1IWVBEjXfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCB6Fm1oTrMy2LPUNC4qXipFbuoKfd1jGJegQFU8E6ZUoSbDeoDAxdCxkj8X0mQmP
	 5alX7XpBFWIWNl74FpcP8/ICcOq8LqiTu69KMq2xgE9PWS2YmGdPyNeD07TueXdOW5
	 E1JklMx94VxyYK2/53uxZYeftv7fwlBdVHeJjNdroH3xaLo2X55iWOBYqlCxwQFfAj
	 8Qr1QAKEtp5argWqeGAbaJdJdIq6IVWTRzK0iRkwpSP1DqzO3742sl/0tlmRshf1qx
	 JH/vETnciESzAQREioUx0WGnNpH3dCpzb8VZtmvXXZtwIcQ3NLlm5S8UHPT1WLbIOF
	 8sXpY+9UIKSQg==
Date: Fri, 20 Jun 2025 21:05:34 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Subject: Re: [net-next v6 4/4] net: ethernet: mtk_eth_soc: only use legacy
 mode on missing IRQ name
Message-ID: <20250620200534.GE9190@horms.kernel.org>
References: <20250619132125.78368-1-linux@fw-web.de>
 <20250619132125.78368-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619132125.78368-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_130541_087981_75D1DF3E 
X-CRM114-Status: UNSURE (   8.39  )
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

On Thu, Jun 19, 2025 at 03:21:24PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> If platform_get_irq_byname returns -ENXIO fall back to legacy (index
> based) mode, but on other errors function should return this error.
> 
> Suggested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Simon Horman <horms@kernel.org>


