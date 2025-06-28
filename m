Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB4C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OttYEYSGsa6fmMgQuQ6ACm+QP5p6Nu/umyUb7AyO7Eg=; b=L91wcktg4k74Zw2BEfSjii6jxK
	hizw/qQ+Ugz612gW0sHSsuHyxNIU4XTiFRLD6n4ca3irMp51PJaJuengc/+of95sOXARbk8qE0S6G
	ZOgbFGPm7sUbQyb0Jv7o4PPGtDMBxRFlG/MX7mBh5I71po65Yj5EEw0txgECT6VgYPD6m9OkQEGSk
	ct+OE43ItjyIdSrp6bcEvsZ0H0fakDVXOTT4oYIyelLLOufCyqWWpyVkqTeNAhQ+OnPbvQoh5BtCI
	6K3MORFt9xxrE1q5pGu9ibaSbi0r7jVw42Npt9szklrWkhqO8Ee50SQGYFuyLDsm94BFZVgkAW0oE
	BpVxLo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQHv-0000000GWqu-0Gay;
	Sat, 28 Jun 2025 07:47:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQFc-0000000GWfS-0Ioa;
	Sat, 28 Jun 2025 07:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OttYEYSGsa6fmMgQuQ6ACm+QP5p6Nu/umyUb7AyO7Eg=; b=NPumxxan5JbLaOahIw2KDrjgix
	JWPttDRwbstlKJlN02rVvomyp+59v5OvcuihXU3uK3n8zOB57RxZ3Jq2GSeFHzKa5wTXge4XrnIT4
	3RWNMmlu/RbP0sIceNo/14C9KvUd7MetTrSJPssjZO2gY0bGv36dMDxE0OJN3KtFZBzQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVQF8-00HDmt-S5; Sat, 28 Jun 2025 09:44:58 +0200
Date: Sat, 28 Jun 2025 09:44:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net/next 1/3] net: ethernet: mtk_eth_soc: improve support
 for named interrupts
Message-ID: <02a89062-456f-41de-a89b-c4963aae2d7f@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <d1b744685a464c5cd353107555faca6cd965d158.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1b744685a464c5cd353107555faca6cd965d158.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_004528_119190_5EB75BA0 
X-CRM114-Status: UNSURE (   8.83  )
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

On Sat, Jun 28, 2025 at 02:30:23AM +0100, Daniel Golle wrote:
> Use platform_get_irq_byname_optional() to avoid outputting error
> messages when using legacy device trees which rely identifying
> interrupts only by index. Instead, output a warning notifying the user
> to update their device tree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

