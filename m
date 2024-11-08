Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6678D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D8vZegrH9yIdYiz0FSD9MNRGwL9EkUqYzbNsOs/U7A=; b=RL98oiFl92hQokFX2Y9I6qZYiq
	GCtiX3XPOHT5GJqBc3KDKKCfJ/Gr1d8IXpoXV8Nyhr6nsYB1GekSTQ+4kq0CGjfovTtlm1DBD98Xu
	AXma3pw7fxVVb2dv2dws/U7OAXeiUVVysI9KvSBcBosfgjgdZCgHXzI6gODUzVAzvsdDcO94JNjhj
	8f9JYXA2uW4qUp7U/ksJjmkd6Lqac/4/t1wkAXLf9JqbM/za9uCUWdaLvzltHJDFjSVDI5o6k96Zu
	iCUVN+RGgSNu6t5c101FowVVVF6FVZy1j3uft8fp3cqrhVnG3nlvIk0Lc8Bq9ybb/cwY8sZ7bRcGT
	7Vdq0v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N6u-0000000AKzf-2OYT;
	Fri, 08 Nov 2024 11:25:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MI7-0000000A7it-0jLM;
	Fri, 08 Nov 2024 10:32:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so18093015e9.3;
        Fri, 08 Nov 2024 02:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731061953; x=1731666753; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+D8vZegrH9yIdYiz0FSD9MNRGwL9EkUqYzbNsOs/U7A=;
        b=GRsX1o6w47b8dcdZuBppMbTLuVDk9pm/HMLuecXJWTD/TxvGxy0ImVQ32qcqR2VVMf
         Zl5VDcSva1Z/unwvJq8T95FJdhe0O4b9Xw3hzsNGZorbot1hIkYY/Gi4xZeIwxM/favb
         jwTbCSDa2AEy6SmUB3toj//SaKY4fIfEj49SzfY23pXFhsON5JYYkN0BWaVA2G4TVKBU
         o0rv8n3pN6NaRdrDnVCaePgwWuRp5nhADMO4hz1IyriebBFZlZ0XZlDGKuOwlxCv2uSg
         VNOo/CqMXaiGPiQXYOB7sPsQcDx0GlcoOOPjEmYZGpwgq5+Pd3GwAT0YEHB2U4Bu+Q8D
         deVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731061953; x=1731666753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+D8vZegrH9yIdYiz0FSD9MNRGwL9EkUqYzbNsOs/U7A=;
        b=un9EhMbnYPF5hiGMibicYIdT8+Iah1yX2tHA8W4JarkK0lvaahxPtJtyEPVJ2b+Dhh
         DMI0i+2TvouwIHNBXdpkPhhU3310olXS2LkvGZPP66AYn8QQHncIZiCwBue+g8vbTAx/
         fTj1a/GcW5VWdNLD8A/T04UYUGYx9cWbdM4FVMHQmx3NqfEIdEQJ8JuEexTDGC169kWX
         MU5rCrU8Y/bM30WkoZY8eMmVKaugRYZQMgpL8ffxuTzrsQqZOObcIi6irZZUnyusoVJI
         jCHJqL862R/J/It/xpHpDAluCy3LenF9BkjDxUNihNwefE6uEFXXa5ffY5t7HsSQxcdL
         i2vg==
X-Forwarded-Encrypted: i=1; AJvYcCV9+lvxqjJUlUiPbdNQ3+0t0melwE4hjFHpoxh9wNVXp5D/ExaNrd/y/1o0hGOzoTGnfJSAR3uHtyhdXTDPkuU=@lists.infradead.org, AJvYcCXmv8GvLBe9N7xivlYVuHwhIGUnvHWEE1B1K3vXnOwuIgRGpWB6d+LlWOkOXN5yk1ITUWIhDMjH0hflDgv9H/c/@lists.infradead.org
X-Gm-Message-State: AOJu0YzX17g3b/l5pkEBgYo4H4Y8RFIL+nSsQbaSlO+MDA7SiVki+5Dj
	EKm28ESIkh3gJ3390uUuhpZGJXjINzAKHqWUtKrD076kxaSotDMy
X-Google-Smtp-Source: AGHT+IE3C6MenK86u+gyHcdGWTkHdT9bSmorvzGgc5cR9/kKCrxrVGkOIgWKFRagg6d/LTdxX87eoA==
X-Received: by 2002:a05:600c:5488:b0:431:9397:9ac9 with SMTP id 5b1f17b1804b1-432b7507c16mr15281755e9.15.1731061952869;
        Fri, 08 Nov 2024 02:32:32 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6b35c0sm97887395e9.16.2024.11.08.02.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:32:32 -0800 (PST)
Message-ID: <672de8c0.050a0220.a7227.c2c7@mx.google.com>
X-Google-Original-Message-ID: <Zy3ovEx0IELRttrI@Ansuel-XPS.>
Date: Fri, 8 Nov 2024 11:32:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno," <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-3-ansuelsmth@gmail.com>
 <4318897e-0f1a-42c7-8f20-065dc690a112@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4318897e-0f1a-42c7-8f20-065dc690a112@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023235_246526_44C5BB69 
X-CRM114-Status: GOOD (  36.77  )
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

On Thu, Nov 07, 2024 at 06:53:53PM +0100, Christophe JAILLET wrote:
> Le 06/11/2024 à 13:22, Christian Marangi a écrit :
> > Add Airoha AN8855 5-Port Gigabit DSA switch.
> > 
> > The switch is also a nvmem-provider as it does have EFUSE to calibrate
> > the internal PHYs.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> 
> Hi,
> 
> ...
> 
> > +#include <linux/bitfield.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/etherdevice.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/if_bridge.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mdio.h>
> > +#include <linux/netdevice.h>
> > +#include <linux/of_mdio.h>
> > +#include <linux/of_net.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/nvmem-provider.h>
> 
> Could be moved a few lines above to keep order.
> 
> > +#include <linux/phylink.h>
> > +#include <linux/regmap.h>
> > +#include <net/dsa.h>
> ...
> 
> > +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> > +				dsa_fdb_dump_cb_t *cb, void *data)
> > +{
> > +	struct an8855_priv *priv = ds->priv;
> > +	struct an8855_fdb _fdb = {  };
> 
> Should it but reseted in the do loop below, instead of only once here?
>

Common practice is to fill EVERY value in _fdb to not have to reset, but
yes just as extra caution, I will move the define in the for loop.

> > +	int banks, count = 0;
> > +	u32 rsp;
> > +	int ret;
> > +	int i;
> > +
> > +	mutex_lock(&priv->reg_mutex);
> > +
> > +	/* Load search port */
> > +	ret = regmap_write(priv->regmap, AN8855_ATWD2,
> > +			   FIELD_PREP(AN8855_ATWD2_PORT, port));
> > +	if (ret)
> > +		goto exit;
> > +	ret = an8855_fdb_cmd(priv, AN8855_ATC_MAT(AND8855_FDB_MAT_MAC_PORT) |
> > +			     AN8855_FDB_START, &rsp);
> > +	if (ret < 0)
> > +		goto exit;
> > +
> > +	do {
> > +		/* From response get the number of banks to read, exit if 0 */
> > +		banks = FIELD_GET(AN8855_ATC_HIT, rsp);
> > +		if (!banks)
> > +			break;
> > +
> > +		/* Each banks have 4 entry */
> > +		for (i = 0; i < 4; i++) {
> > +			count++;
> > +
> > +			/* Check if bank is present */
> > +			if (!(banks & BIT(i)))
> > +				continue;
> > +
> > +			/* Select bank entry index */
> > +			ret = regmap_write(priv->regmap, AN8855_ATRDS,
> > +					   FIELD_PREP(AN8855_ATRD_SEL, i));
> > +			if (ret)
> > +				break;
> > +			/* wait 1ms for the bank entry to be filled */
> > +			usleep_range(1000, 1500);
> > +			an8855_fdb_read(priv, &_fdb);
> > +
> > +			if (!_fdb.live)
> > +				continue;
> > +			ret = cb(_fdb.mac, _fdb.vid, _fdb.noarp, data);
> > +			if (ret < 0)
> > +				break;
> > +		}
> > +
> > +		/* Stop if reached max FDB number */
> > +		if (count >= AN8855_NUM_FDB_RECORDS)
> > +			break;
> > +
> > +		/* Read next bank */
> > +		ret = an8855_fdb_cmd(priv, AN8855_ATC_MAT(AND8855_FDB_MAT_MAC_PORT) |
> > +				     AN8855_FDB_NEXT, &rsp);
> > +		if (ret < 0)
> > +			break;
> > +	} while (true);
> > +
> > +exit:
> > +	mutex_unlock(&priv->reg_mutex);
> > +	return ret;
> > +}
> 
> ...
> 
> > +	ret = regmap_set_bits(priv->regmap, AN8855_RG_RATE_ADAPT_CTRL_0,
> > +			      AN8855_RG_RATE_ADAPT_RX_BYPASS |
> > +			      AN8855_RG_RATE_ADAPT_TX_BYPASS |
> > +			      AN8855_RG_RATE_ADAPT_RX_EN |
> > +			      AN8855_RG_RATE_ADAPT_TX_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Disable AN if not in autoneg */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_SGMII_REG_AN0, BMCR_ANENABLE,
> > +				 neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED ? BMCR_ANENABLE :
> > +									      0);
> 
> Should 'ret' be tested here?
> 

Sorry forgot to add.

> > +
> > +	if (interface == PHY_INTERFACE_MODE_SGMII &&
> > +	    neg_mode == PHYLINK_PCS_NEG_INBAND_DISABLED) {
> > +		ret = regmap_set_bits(priv->regmap, AN8855_PHY_RX_FORCE_CTRL_0,
> > +				      AN8855_RG_FORCE_TXC_SEL);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> ...
> 
> > +	priv->ds = devm_kzalloc(&mdiodev->dev, sizeof(*priv->ds), GFP_KERNEL);
> > +	if (!priv->ds)
> > +		return -ENOMEM;
> > +
> > +	priv->ds->dev = &mdiodev->dev;
> > +	priv->ds->num_ports = AN8855_NUM_PORTS;
> > +	priv->ds->priv = priv;
> > +	priv->ds->ops = &an8855_switch_ops;
> > +	mutex_init(&priv->reg_mutex);
> 
> devm_mutex_init() to slightly simplify the remove function?
> 

Wonder if there is a variant also for dsa_unregister_switch. That
would effectively remove the need for a remove function.

> > +	priv->ds->phylink_mac_ops = &an8855_phylink_mac_ops;
> > +
> > +	priv->pcs.ops = &an8855_pcs_ops;
> > +	priv->pcs.neg_mode = true;
> > +	priv->pcs.poll = true;
> > +
> > +	ret = an8855_sw_register_nvmem(priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_set_drvdata(&mdiodev->dev, priv);
> > +
> > +	return dsa_register_switch(priv->ds);
> > +}
> > +
> > +static void
> > +an8855_sw_remove(struct mdio_device *mdiodev)
> > +{
> > +	struct an8855_priv *priv = dev_get_drvdata(&mdiodev->dev);
> > +
> > +	dsa_unregister_switch(priv->ds);
> > +	mutex_destroy(&priv->reg_mutex);
> > +}
> > +
> > +static const struct of_device_id an8855_of_match[] = {
> > +	{ .compatible = "airoha,an8855" },
> > +	{ /* sentinel */ },
> 
> Ending comma is usually not needed after a terminator.
> 
> > +};
> > +
> > +static struct mdio_driver an8855_mdio_driver = {
> > +	.probe = an8855_sw_probe,
> > +	.remove = an8855_sw_remove,
> > +	.mdiodrv.driver = {
> > +		.name = "an8855",
> > +		.of_match_table = an8855_of_match,
> > +	},
> > +};
> 
> ...
> 
> > +#define	  AN8855_VA0_VTAG_EN		BIT(10) /* Per VLAN Egress Tag Control */
> > +#define	  AN8855_VA0_IVL_MAC		BIT(5) /* Independent VLAN Learning */
> > +#define	  AN8855_VA0_VLAN_VALID		BIT(0) /* VLAN Entry Valid */
> > +#define AN8855_VAWD1			0x10200608
> > +#define	  AN8855_VA1_PORT_STAG		BIT(1)
> > +
> > +/* Same register map of VAWD0 */
> 
> Not sure to follow. AN8855_VAWD0 above is 0x10200604, not 0x10200618
> 

Confusing comment. The meaning here is not "same register" but same
register fields aka bits and mask for the register are the same of
..604.

> > +#define AN8855_VARD0			0x10200618
> > +
> > +enum an8855_vlan_egress_attr {
> > +	AN8855_VLAN_EGRESS_UNTAG = 0,
> > +	AN8855_VLAN_EGRESS_TAG = 2,
> > +	AN8855_VLAN_EGRESS_STACK = 3,
> > +};
> > +
> > +/* Register for port STP state control */
> > +#define AN8855_SSP_P(x)			(0x10208000 + ((x) * 0x200))
> > +#define	 AN8855_FID_PST			GENMASK(1, 0)
> > +
> > +enum an8855_stp_state {
> > +	AN8855_STP_DISABLED = 0,
> > +	AN8855_STP_BLOCKING = 1,
> > +	AN8855_STP_LISTENING = 1,
> 
> Just wondering if this 0, 1, *1*, 2, 3 was intentional?
> 

Yes blocking and listening is the same, I will follow suggestion by
Andrew and make blocking = listening.

> > +	AN8855_STP_LEARNING = 2,
> > +	AN8855_STP_FORWARDING = 3
> > +};
> > +
> > +/* Register for port control */
> > +#define AN8855_PCR_P(x)			(0x10208004 + ((x) * 0x200))
> > +#define	  AN8855_EG_TAG			GENMASK(29, 28)
> > +#define	  AN8855_PORT_PRI		GENMASK(26, 24)
> > +#define	  AN8855_PORT_TX_MIR		BIT(20)
> > +#define	  AN8855_PORT_RX_MIR		BIT(16)
> > +#define	  AN8855_PORT_VLAN		GENMASK(1, 0)
> > +
> > +enum an8855_port_mode {
> > +	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
> > +	AN8855_PORT_MATRIX_MODE = 0,
> > +
> > +	/* Fallback Mode: Forward received frames with ingress ports that do
> > +	 * not belong to the VLAN member. Frames whose VID is not listed on
> > +	 * the VLAN table are forwarded by the PCR_MATRIX members.
> > +	 */
> > +	AN8855_PORT_FALLBACK_MODE = 1,
> > +
> > +	/* Check Mode: Forward received frames whose ingress do not
> > +	 * belong to the VLAN member. Discard frames if VID ismiddes on the
> > +	 * VLAN table.
> > +	 */
> > +	AN8855_PORT_CHECK_MODE = 1,
> 
> Just wondering if this 0, 1, *1*, 3 was intentional?
> 

Nope a typo. Thanks for noticing this.

> > +
> > +	/* Security Mode: Discard any frame due to ingress membership
> > +	 * violation or VID missed on the VLAN table.
> > +	 */
> > +	AN8855_PORT_SECURITY_MODE = 3,
> > +};
> ...
> 
> CJ

-- 
	Ansuel

