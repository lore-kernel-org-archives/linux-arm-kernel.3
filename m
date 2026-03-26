Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4AD10A3D89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgolnSBH+ynVMNrVf0h58DK/Vli52VqvQ0ctg5iB3tA=; b=qBx6SsCofMY1yNrhCtXSzdUyIu
	bCpZb9AnQoWVRcWLGnci8zjIXY9HcNMHiTI4B9w/NPn0KP82TXifKzGq2ZuCIeHMzcjN1/PUIi2wG
	XUZgEwibGH+fsqKpZlROCW/y1aAeAE5m2M+nuG8z9e4WpxDWV8O3gXxQwe6k1TsOWjC2XKAz74e0w
	BHCrlOV7LDICltOhPhi6zjk+cwOx8/7pJvjK/Y+09OGviOj6AV/Kai2OLJv71Humwbh3q/kN99pbK
	uc67USsgPITW4K7H23LvPGUxoDDkh8za/U+njhJQp6x8Acf76OzUXHvv/+3O7HkRUCLXkX+sfcbv8
	5clnYYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jrU-00000005RcX-3RNb;
	Thu, 26 Mar 2026 12:30:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jrR-00000005Rc9-40Q4;
	Thu, 26 Mar 2026 12:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TgolnSBH+ynVMNrVf0h58DK/Vli52VqvQ0ctg5iB3tA=; b=12yVv4kblc0T+US3oSZ8Iw2Sc+
	zzOYDPXwgygaj4SI9XH2A9BM27TKLWQjkyX6ik6BrxGnQCEM2oQ8Z4YsOEOlN4ehs9ap0E+3aTk/k
	nwsySW0RLKl5ByWluBh3kOG34Sc+Cu0YcK6GnsKFkM1VGxsSAF/5770zRFbI3Me/NVRs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5jrD-00DTWt-6Q; Thu, 26 Mar 2026 13:30:39 +0100
Date: Thu, 26 Mar 2026 13:30:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
Message-ID: <3bd7803d-4c4a-4f61-9434-a6bf25627b58@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053053_995445_D4CAAD29 
X-CRM114-Status: UNSURE (   7.14  )
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

> @@ -480,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct phy_device *phydev)
>  {
>  	int ret, reg_value;
>  
> -	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
> -				     EN8811H_FW_CTRL_1_FINISH);
> +	ret = air_phy_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
> +					 EN8811H_FW_CTRL_1_FINISH);

Is a rename required? Is the namespace air_buckpbus_ used somewhere
else?

	Andrew

