Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF9BCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZxstrwqiBcyWOqJuW+tJREFzkMchdfJApHbYGANKJ4=; b=cb5tA9jjJbH7HTH5y97sgtNHC9
	Vz+SkmRepT3PB+lVsDpx9obAmOLuhgATzQlQJGbBP5xU7NotBJDtsIxIlaFMcQ5Hryy0qvkc4ng0J
	/F/jp1YM0t+JfLvHEL5xgUECiX9fmMF6ZCT/eZ4mdVlU5KIgTfMgoycmHoJQ+4M6B5QuEZ+qJ86Tx
	ySgggSX0Yujr8gxuoTJ3mYzm+EyF3dWgoCvGGXRvcSw4ajBSMfih3qSeO1c34OM5BE1wqU514+7y5
	X/RJtcti5tCeK+RwknRXHfrvDSZ8H+kaW0uCIv8X82cW7KwZGOwPT0PAvLXvukbzj6YH4W51RzpeK
	t9IM3WXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVyB-00000001vJz-09cL;
	Sun, 30 Nov 2025 01:11:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVy7-00000001vJV-3zl8;
	Sun, 30 Nov 2025 01:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4ZxstrwqiBcyWOqJuW+tJREFzkMchdfJApHbYGANKJ4=; b=GMYFzAUF75LvBe+8epBvBJ/3ja
	TkbmT8k7NQsb0bFDJKfHzSEjIyT4FwEzhH1WwkiBBVK6/JkanxBvrQ375fbijzjHgZ9OnwYrIP9DM
	xKcFtvwKmGbzVfi3u6Zzpcy802Q1J+Dd9+ePG4K5CRbC2Uj6jaA3Sl6zUclY7UggNILA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vPVxx-00FR86-6b; Sun, 30 Nov 2025 02:11:05 +0100
Date: Sun, 30 Nov 2025 02:11:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129234603.2544-2-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_171115_995185_9904DED7 
X-CRM114-Status: UNSURE (   7.93  )
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

> -		gpiod_set_value_cansleep(priv->reset, 0);
> +		int is_active_low = !!gpiod_is_active_low(priv->reset);
> +		gpiod_set_value_cansleep(priv->reset, is_active_low);

I think you did not correctly understand what Russell said. You pass
the logical value to gpiod_set_value(). If the GPIO has been marked as
active LOW, the GPIO core will invert the logical values to the raw
value. You should not be using gpiod_is_active_low().

But as i said to the previous patch, i would just leave everything as
it is, except document the issue.

	Andrew

