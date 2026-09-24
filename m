Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30EDC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRDrDqRSTSu1wAuAiMUnEXEYN6plI8hGn4/iodplTGo=; b=Vks8Z2w5peOydjWW1laLOhGLsa
	x3c+8AociQ3sTVk1diYfLsu5gBkNcOBq4TxlVLUkLKp8WXvH6pFA2ML1bQwI2qKkTXnMP44nzIieX
	mOBbgPEuDM8Rp76p7a3JB2WHzsNDLerDzctBRKxn4x7fr5kUfOXfHHiyaUnx2RiegDs382TybXWSv
	Vq2iOQZC84j+pqAu0iaBGGVHDOuJh4e35NrmJ1ZSYRchKudxtxH+K4WZ1sZw/JkAblRG/ED7v7UQD
	QtDt99nC5Ho8uxPmr+U6ElVPycWqylRHkbvGpURe2oJvwBxLoK2Ok6Lzu8N35T3PBaEJrtqUmkTfh
	SVpGMqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNR-0000000BOzx-2wwv;
	Thu, 24 Sep 2026 15:28:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNM-0000000BOwi-38k7;
	Thu, 24 Sep 2026 15:28:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6835B437A5;
	Thu, 24 Sep 2026 15:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8D51F000FF;
	Thu, 24 Sep 2026 15:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263724;
	bh=gRDrDqRSTSu1wAuAiMUnEXEYN6plI8hGn4/iodplTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvYGijbZcCWStjUumZ6i+KPYNbP0jIqli6M7dl/dHMn67wi85o0zhoAPxRDnbKfSh
	 Tp7VWtUsZhQ3gRJjdzmodCsGU5TgfQqDwIZiyNDegT4CXV2FFrWJ6I1vXn2dRVzA+w
	 tIn5vW/DybS4iTzSEKIeH1iajfTl+nYPZgeCawsUmIlsmNPi0gI1uZgwUMjQfOrHuR
	 SQpYxvXvQqHhAcnEI5F1Q5GpSuG5ZYQTifv7rY6xwP5GneSX1c6eZCtj3p93Q7Xawv
	 QKCWZzjA7ea6bgsZ98hY3cZNrvCyynQDbBykR/rrF6Guer+aH/v/6GjJBAmW/9rOrJ
	 yH+YFXvbUHriw==
Date: Thu, 24 Sep 2026 10:28:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Vladimir Oltean <olteanv@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, mfd@lists.linux.dev
Subject: Re: [PATCH net-next v22 3/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Message-ID: <179026372208.171717.56830935141482934.robh@kernel.org>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915123812.14747-4-ansuelsmth@gmail.com>
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


On Tue, 15 Sep 2026 14:38:00 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


