Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2F0D21687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSXwppmi/1KlyaunSxcGPfEGwrM8gH9Rv/W1n4Do2uY=; b=j4GfCcFf/tN4YbLxs2isUtqriR
	IuyBQ5wqUyBT3h5BlS95TDycNs94Wj/JGtfqHCnDaUZF3sT7y+0Pvomr9ez8pYpww00KV62P7iRCa
	6oQ1XlLEuFmljGFchpRvfjxRzn73J7yh6b47JYuNK3/ZH5+BXDq3MoiGVb9zKM5Zoc7EKpSCBM3jR
	F/UEHW4i8D87uzdXV39QMh+VErHDeMJDh+MYFgdRE8jSyWpbjjgxyhlw3dGwLMCe7zGuHJ537D+Hb
	1QE5bcMLtwtmHjCI84TxQoEOSXaeWVuLS0lReXMSWPni12seHNI3j9TQdy6FQdSIDXBlADfA3mLuK
	W3T3HPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBAA-00000008Chv-0V3H;
	Thu, 04 Dec 2025 15:22:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBA7-00000008Ch7-38pE;
	Thu, 04 Dec 2025 15:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CSXwppmi/1KlyaunSxcGPfEGwrM8gH9Rv/W1n4Do2uY=; b=Aup0I71GV6QggM+CaxB8OpiuFo
	tYkm3eMrKXTK9w2z5uiG17StE3nApVL8+dGEQIWkYGIJ41IkErJU033NPYFfto9IId4oMoDEL6YcT
	eH39NIoKYicYV9vnYDWSBgTiZkjwpzoTGFuTezstBvenDyRnXFDvs6z0VvRV2edtZrO4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRB9m-00Fytb-Hm; Thu, 04 Dec 2025 16:22:10 +0100
Date: Thu, 4 Dec 2025 16:22:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <7aacc2c2-50d0-4a08-9800-dc4a572dffcb@lunn.ch>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204131626.upw77jncqfwxydww@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_072231_788568_02AF9BF9 
X-CRM114-Status: GOOD (  11.88  )
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

> If this is blocking progress for new device trees, can we just construct,
> using of_machine_is_compatible(), a list of all boards where the device
> tree defines incorrect reset polarity that shouldn't be trusted by the
> driver when driving the reset GPIO? If we do this, we can also leave
> those existing device trees alone.

I've still not seen a good answer to my question, why not just leave
it 'broken', and document the fact.

Does the fact it is inverted in both DT and the driver prevent us from
making some board work?

Why do we need to fix this?

Sometimes it is better to just leave it alone, if it is not hurting
anybody.

	Andrew

