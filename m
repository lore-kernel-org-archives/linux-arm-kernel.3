Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB2EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vbh0kCLnEnabgj2NlB9o0liVwTXCgPhBqVbR5i757bg=; b=i4/1LI0EyHiVIuY2EZ7iBg3rD9
	64qQVZ1u5+TdpCEWacaZGJaVZ+8Pqf3RnKzuN1mFqOYJULjgCEHIgDPtWp+UwbyzMxQlxySPwXIR8
	tFVL9jrLDjAVFr82hJ1zCjdS/B8GUsEB2O2ev5ywnBHTkjYOkUnh1WCzfwovz7O/Kn/REwmVHLRRw
	kPloGFrJGJ0mO2+x5D8CgB6tFd5T/xq5f7lx5axfklmCQCY/w5DeWHuUZVUvsp88q4ZJaz2r6MxXy
	gM0igwWTs73g+wUlabApuH7NCbC9mlXuRlaMQvLHF8Q3JB/UEOaInpLaJO2JG3o+mGA1+MtYWQAJu
	typeT/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8UT-0000000CxWg-3wSz;
	Tue, 10 Dec 2024 22:14:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8TF-0000000CxAX-2XCc;
	Tue, 10 Dec 2024 22:12:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862f11a13dso429014f8f.2;
        Tue, 10 Dec 2024 14:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733868763; x=1734473563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbh0kCLnEnabgj2NlB9o0liVwTXCgPhBqVbR5i757bg=;
        b=X9cWFpGiA01v78HMIIDhE2jJlybr2MIHTsMMRtIVIu0Sq0S0vSI3zI4NmUySHRKP3O
         sqZ4nwj6rQqqozNFQjjqsL83w8zTj5jWZPuW4cKd/pC+a7E/RXRTwN5bGpQFCxvWuFok
         Jf4Lda9J/9ojK4X7dejhuk+58omnl8b1EKtIQELg3nACIoXtyph6djIDn+/8uDTPcWcm
         06rk2wya4ohsWIFNb0k3LocSg5mhSxu0gEvo51UfLjffaYm9jVi/C+7KJjB7fkMX1/pn
         0e4Nnv4ErJWQTkmn+eyCQbOdVlIE+lKlw+LGvzE+2AsiyBjM5NLNspUt9t7mwbf2MI+p
         qz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733868763; x=1734473563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vbh0kCLnEnabgj2NlB9o0liVwTXCgPhBqVbR5i757bg=;
        b=qQF1w38Mkp8sPpZ9YSB0QaTSxFmsZ1rLsaa1hQED/WDWKzeqO5VlRXwMhf52oST0Yj
         8LcSnhmUwef6ZP2BCue7fHtLMHBZhU1jP2NRGkcFC5aLyO0ClBxpp5Xr4vhYmuGBjpgq
         7u+hqqzwiYCblvWmtktvM7796uXhEA8Q/8TGAPU98KpkAEFxZOAYPhq51QTQmNP4Ncw9
         qoJW3SuvS85OX48AOhtVc6jMt0+161tbHHfhHV4AXvmMSoRKpGToULEVe2QzLu2Jx9eH
         J0eUQcV9i4qXwpRpj10kBNYBe9+1zTPguuLdeUERWODMs7TAkX9VyOB3IZmqMbRurWOi
         /nkA==
X-Forwarded-Encrypted: i=1; AJvYcCWpTVicrnSIuG19cpXzGBcdwwZwaF/1PaQ5eGdGRxgRznfdLWhFAmw5ZvY9gE/+PjWfcEX9AkOcfUbNDY8ivZU=@lists.infradead.org, AJvYcCXEsQmTlAdzZCc80Kq5ynKEhQAQkIU8ZMcXAweqCWpOxp/ze2KLQtcmzHDf2GkiV7wpHn0ChKqP/AeSnNBBHaGV@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKaqs4X4Kvy/OTBwPIrivowadkjJwfQEcpVLzzPzvQRG2Fr2z
	wSnxMdRnVjiqJl4CaqCSy7NUNk7EA4NIkI50cebZfrHtwDq/WEdXRfGBqg==
X-Gm-Gg: ASbGncspsKWx85inE6PcyuJmzLWVrRh/PUqf9XkWB4c55kRqcKdgVzhpAFJblfRZWp4
	lzRhX8VgRG01+INT+EavtDWbYKOI8OV5uFBqDijSLsB1oha7gEePzxXe//hyghBZwOGkgVNarvj
	z5XBxE8BK4o42PksHSOFIt/8PSUaLvHeC3p8zV5RHyyqBvvu5/7lLocGIwpCHJY0ejJWP/NwNwO
	CzLsa59IWnYJS4R6kzNZQjizK4c+lnkuU/n1UMm7g==
X-Google-Smtp-Source: AGHT+IGwiI+osQw18HxIHMNPHfS9VlnTpnprcxnsqhocgSGD7FUfCYvKUUYG11wLCFyUjdQj17zSdQ==
X-Received: by 2002:a5d:6c6c:0:b0:386:3213:5b78 with SMTP id ffacd0b85a97d-3864ce4b12fmr170983f8f.3.1733868763124;
        Tue, 10 Dec 2024 14:12:43 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862d7158c4sm13859087f8f.54.2024.12.10.14.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:12:42 -0800 (PST)
Date: Wed, 11 Dec 2024 00:12:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [net-next PATCH v11 8/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241210221239.vtsnijge2qdblpyq@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_141245_665204_CDC0234C 
X-CRM114-Status: GOOD (  40.51  )
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

On Mon, Dec 09, 2024 at 02:44:25PM +0100, Christian Marangi wrote:
> Add Airoha AN8855 5-Port Gigabit DSA switch. Switch can support
> 10M, 100M, 1Gb, 2.5G and 5G Ethernet Speed but 5G is currently error out
> as it's not currently supported as requires additional configuration for
> the PCS.
> 
> The switch is also a nvmem-provider as it does have EFUSE to calibrate
> the internal PHYs.

This second paragraph is no longer actual.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> index 2d10b4d6cfbb..99b1569ba35b 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -24,6 +24,15 @@ config NET_DSA_LOOP
>  	  This enables support for a fake mock-up switch chip which
>  	  exercises the DSA APIs.
>  
> +config NET_DSA_AN8855
> +	tristate "Airoha AN8855 Ethernet switch support"
> +	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
> +	depends on NET_DSA
> +	select NET_DSA_TAG_MTK
> +	help
> +	  This enables support for the Airoha AN8855 Ethernet switch
> +	  chip.

Not chip anymore, but for the switch *inside* the chip.

> +
>  source "drivers/net/dsa/hirschmann/Kconfig"
>  
>  config NET_DSA_LANTIQ_GSWIP
> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> new file mode 100644
> index 000000000000..4a56a55945cd
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
> @@ -0,0 +1,2310 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Airoha AN8855 DSA Switch driver
> + * Copyright (C) 2023 Min Yao <min.yao@airoha.com>
> + * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
> + */
> +#include <linux/bitfield.h>
> +#include <linux/ethtool.h>
> +#include <linux/etherdevice.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/if_bridge.h>
> +#include <linux/iopoll.h>
> +#include <linux/netdevice.h>
> +#include <linux/of_net.h>
> +#include <linux/of_platform.h>
> +#include <linux/phylink.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <net/dsa.h>
> +
> +#include "an8855.h"
> +
> +static const struct an8855_mib_desc an8855_mib[] = {
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_DROP, "TxDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_CRC_ERR, "TxCrcErr"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_COLLISION, "TxCollision"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_OVERSIZE_DROP, "TxOversizeDrop"),
> +	MIB_DESC(2, AN8855_PORT_MIB_TX_BAD_PKT_BYTES, "TxBadPktBytes"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_DROP, "RxDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_FILTERING, "RxFiltering"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_CRC_ERR, "RxCrcErr"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_CTRL_DROP, "RxCtrlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_INGRESS_DROP, "RxIngressDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_FLOW_CONTROL_DROP, "FlowControlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_WRED_DROP, "WredDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_MIRROR_DROP, "MirrorDrop"),
> +	MIB_DESC(2, AN8855_PORT_MIB_RX_BAD_PKT_BYTES, "RxBadPktBytes"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RXS_FLOW_SAMPLING_PKT_DROP, "RxsFlowSamplingPktDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RXS_FLOW_TOTAL_PKT_DROP, "RxsFlowTotalPktDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_PORT_CONTROL_DROP, "PortControlDrop"),

There isn't any standard counter to expose these leftover ethtool -S
unstructured counters?

@Andrew, @Jakub: the more we push developers to stop reporting standard
counters as unstructured, the harder it will be to debug packet loss
on the CPU port, since we don't report anything structure there (no
netdev). For ethtool -S, we append the CPU port counters to the conduit
counters. Any ideas for gaining introspection into the structured
counters of the CPU port?

> +};
> +
> +static int
> +an8855_mib_init(struct an8855_priv *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, AN8855_MIB_CCR,
> +			   AN8855_CCR_MIB_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, AN8855_MIB_CCR,
> +			    AN8855_CCR_MIB_ACTIVATE);
> +}
> +
> +static void an8855_fdb_write(struct an8855_priv *priv, u16 vid,
> +			     u8 port_mask, const u8 *mac,
> +			     bool add) __must_hold(&priv->reg_mutex)
> +{
> +	u32 mac_reg[2] = { };
> +	u32 reg;
> +
> +	mac_reg[0] |= FIELD_PREP(AN8855_ATA1_MAC0, mac[0]);
> +	mac_reg[0] |= FIELD_PREP(AN8855_ATA1_MAC1, mac[1]);
> +	mac_reg[0] |= FIELD_PREP(AN8855_ATA1_MAC2, mac[2]);
> +	mac_reg[0] |= FIELD_PREP(AN8855_ATA1_MAC3, mac[3]);
> +	mac_reg[1] |= FIELD_PREP(AN8855_ATA2_MAC4, mac[4]);
> +	mac_reg[1] |= FIELD_PREP(AN8855_ATA2_MAC5, mac[5]);
> +
> +	regmap_bulk_write(priv->regmap, AN8855_ATA1, mac_reg,
> +			  ARRAY_SIZE(mac_reg));
> +
> +	reg = AN8855_ATWD_IVL;
> +	if (add)
> +		reg |= AN8855_ATWD_VLD;
> +	reg |= FIELD_PREP(AN8855_ATWD_VID, vid);
> +	reg |= FIELD_PREP(AN8855_ATWD_FID, AN8855_FID_BRIDGED);
> +	regmap_write(priv->regmap, AN8855_ATWD, reg);
> +	regmap_write(priv->regmap, AN8855_ATWD2,
> +		     FIELD_PREP(AN8855_ATWD2_PORT, port_mask));

I guess regmap failures here shouldn't fail silently.

> +}
> +
> +static void an8855_fdb_read(struct an8855_priv *priv, struct an8855_fdb *fdb)
> +{
> +	u32 reg[4];
> +
> +	regmap_bulk_read(priv->regmap, AN8855_ATRD0, reg,
> +			 ARRAY_SIZE(reg));
> +
> +	fdb->live = FIELD_GET(AN8855_ATRD0_LIVE, reg[0]);
> +	fdb->type = FIELD_GET(AN8855_ATRD0_TYPE, reg[0]);
> +	fdb->ivl = FIELD_GET(AN8855_ATRD0_IVL, reg[0]);
> +	fdb->vid = FIELD_GET(AN8855_ATRD0_VID, reg[0]);
> +	fdb->fid = FIELD_GET(AN8855_ATRD0_FID, reg[0]);
> +	fdb->aging = FIELD_GET(AN8855_ATRD1_AGING, reg[1]);
> +	fdb->port_mask = FIELD_GET(AN8855_ATRD3_PORTMASK, reg[3]);
> +	fdb->mac[0] = FIELD_GET(AN8855_ATRD2_MAC0, reg[2]);
> +	fdb->mac[1] = FIELD_GET(AN8855_ATRD2_MAC1, reg[2]);
> +	fdb->mac[2] = FIELD_GET(AN8855_ATRD2_MAC2, reg[2]);
> +	fdb->mac[3] = FIELD_GET(AN8855_ATRD2_MAC3, reg[2]);
> +	fdb->mac[4] = FIELD_GET(AN8855_ATRD1_MAC4, reg[1]);
> +	fdb->mac[5] = FIELD_GET(AN8855_ATRD1_MAC5, reg[1]);
> +	fdb->noarp = !!FIELD_GET(AN8855_ATRD0_ARP, reg[0]);
> +}
> +
> +static int an8855_fdb_cmd(struct an8855_priv *priv, u32 cmd,
> +			  u32 *rsp) __must_hold(&priv->reg_mutex)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Set the command operating upon the MAC address entries */
> +	val = AN8855_ATC_BUSY | cmd;
> +	ret = regmap_write(priv->regmap, AN8855_ATC, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read_poll_timeout(priv->regmap, AN8855_ATC, val,
> +				       !(val & AN8855_ATC_BUSY), 20, 200000);
> +	if (ret)
> +		return ret;
> +
> +	if (rsp)
> +		*rsp = val;
> +
> +	return 0;
> +}
> +
> +static void
> +an8855_port_stp_state_set(struct dsa_switch *ds, int port, u8 state)
> +{
> +	struct dsa_port *dp = dsa_to_port(ds, port);
> +	struct an8855_priv *priv = ds->priv;
> +	bool learning = false;
> +	u32 stp_state;
> +
> +	switch (state) {
> +	case BR_STATE_DISABLED:
> +		stp_state = AN8855_STP_DISABLED;
> +		break;
> +	case BR_STATE_BLOCKING:
> +		stp_state = AN8855_STP_BLOCKING;
> +		break;
> +	case BR_STATE_LISTENING:
> +		stp_state = AN8855_STP_LISTENING;
> +		break;
> +	case BR_STATE_LEARNING:
> +		stp_state = AN8855_STP_LEARNING;
> +		learning = dp->learning;
> +		break;
> +	case BR_STATE_FORWARDING:
> +		learning = dp->learning;
> +		fallthrough;
> +	default:
> +		stp_state = AN8855_STP_FORWARDING;
> +		break;
> +	}
> +
> +	regmap_update_bits(priv->regmap, AN8855_SSP_P(port),
> +			   AN8855_FID_PST_MASK(AN8855_FID_BRIDGED),
> +			   AN8855_FID_PST_VAL(AN8855_FID_BRIDGED, stp_state));
> +
> +	regmap_update_bits(priv->regmap, AN8855_PSC_P(port), AN8855_SA_DIS,
> +			   learning ? 0 : AN8855_SA_DIS);

Similar: please test the regmap return code and print an error if it fails.

> +}
> +
> +static void an8855_port_fast_age(struct dsa_switch *ds, int port)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	int ret;
> +
> +	/* Set to clean Dynamic entry */
> +	ret = regmap_write(priv->regmap, AN8855_ATA2, AN8855_ATA2_TYPE);
> +	if (ret)
> +		return;

Similar regarding silent failures. This should apply to the entire
driver, please review again, there are too many instances to note them
all.

> +
> +	/* Set Port */
> +	ret = regmap_write(priv->regmap, AN8855_ATWD2,
> +			   FIELD_PREP(AN8855_ATWD2_PORT, BIT(port)));
> +	if (ret)
> +		return;
> +
> +	/* Flush Dynamic entry at port */
> +	an8855_fdb_cmd(priv, AN8855_ATC_MAT(AND8855_FDB_MAT_MAC_TYPE_PORT) |
> +		       AN8855_FDB_FLUSH, NULL);
> +}
> +
> +static int an8855_port_set_pid(struct an8855_priv *priv, int port,
> +			       u16 pid)

s/pid/pvid/

> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(priv->regmap, AN8855_PPBV1_P(port),
> +				 AN8855_PPBV_G0_PORT_VID,
> +				 FIELD_PREP(AN8855_PPBV_G0_PORT_VID, pid));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(priv->regmap, AN8855_PVID_P(port),
> +				  AN8855_G0_PORT_VID,
> +				  FIELD_PREP(AN8855_G0_PORT_VID, pid));
> +}
> +
> +static int an8855_port_vlan_filtering(struct dsa_switch *ds, int port,
> +				      bool vlan_filtering,
> +				      struct netlink_ext_ack *extack)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	u32 val;
> +	int ret;
> +
> +	/* The port is being kept as VLAN-unaware port when bridge is
> +	 * set up with vlan_filtering not being set, Otherwise, the
> +	 * port and the corresponding CPU port is required the setup
> +	 * for becoming a VLAN-aware port.
> +	 */
> +	if (vlan_filtering) {
> +		u32 acc_frm;
> +		/* CPU port is set to fallback mode to let untagged
> +		 * frames pass through.
> +		 */
> +		ret = an8855_port_set_vlan_mode(priv, AN8855_CPU_PORT,
> +						AN8855_PORT_FALLBACK_MODE,
> +						AN8855_VLAN_EG_CONSISTENT,
> +						AN8855_VLAN_USER,
> +						AN8855_VLAN_ACC_ALL);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(priv->regmap, AN8855_PVID_P(port), &val);
> +		if (ret)
> +			return ret;
> +
> +		/* Only accept tagged frames if PVID is not set */
> +		if (FIELD_GET(AN8855_G0_PORT_VID, val) != AN8855_PORT_VID_DEFAULT)
> +			acc_frm = AN8855_VLAN_ACC_TAGGED;
> +		else
> +			acc_frm = AN8855_VLAN_ACC_ALL;
> +
> +		/* Trapped into security mode allows packet forwarding through VLAN
> +		 * table lookup.
> +		 * Set the port as a user port which is to be able to recognize VID
> +		 * from incoming packets before fetching entry within the VLAN table.
> +		 */
> +		ret = an8855_port_set_vlan_mode(priv, port,
> +						AN8855_PORT_SECURITY_MODE,
> +						AN8855_VLAN_EG_DISABLED,
> +						AN8855_VLAN_USER,
> +						acc_frm);
> +		if (ret)
> +			return ret;
> +	} else {
> +		bool disable_cpu_vlan = true;
> +		struct dsa_port *dp;
> +		u32 port_mode;
> +
> +		/* This is called after .port_bridge_leave when leaving a VLAN-aware
> +		 * bridge. Don't set standalone ports to fallback mode.
> +		 */
> +		if (dsa_port_bridge_dev_get(dsa_to_port(ds, port)))
> +			port_mode = AN8855_PORT_FALLBACK_MODE;
> +		else
> +			port_mode = AN8855_PORT_MATRIX_MODE;
> +
> +		/* When a port is removed from the bridge, the port would be set up
> +		 * back to the default as is at initial boot which is a VLAN-unaware
> +		 * port.
> +		 */
> +		ret = an8855_port_set_vlan_mode(priv, port, port_mode,
> +						AN8855_VLAN_EG_CONSISTENT,
> +						AN8855_VLAN_TRANSPARENT,
> +						AN8855_VLAN_ACC_ALL);
> +		if (ret)
> +			return ret;
> +
> +		/* Restore default PVID */
> +		ret = an8855_port_set_pid(priv, port, AN8855_PORT_VID_DEFAULT);
> +		if (ret)
> +			return ret;
> +
> +		dsa_switch_for_each_user_port(dp, ds) {
> +			if (dsa_port_is_vlan_filtering(dp)) {
> +				disable_cpu_vlan = false;
> +				break;
> +			}
> +		}
> +
> +		if (disable_cpu_vlan) {
> +			ret = an8855_port_set_vlan_mode(priv, AN8855_CPU_PORT,
> +							AN8855_PORT_MATRIX_MODE,
> +							AN8855_VLAN_EG_CONSISTENT,
> +							AN8855_VLAN_USER,
> +							AN8855_VLAN_ACC_ALL);
> +			if (ret)
> +				return ret;
> +		}
> +	}

I think this function would look less cluttered as two:

	if (vlan_filtering)
		return an8855_port_enable_vlan_filtering();

	return an8855_port_disable_vlan_filtering();

> +
> +	return 0;
> +}
> +
> +static int
> +an8855_port_mdb_add(struct dsa_switch *ds, int port,
> +		    const struct switchdev_obj_port_mdb *mdb,
> +		    struct dsa_db db)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	const u8 *addr = mdb->addr;
> +	u16 vid = mdb->vid;
> +	u8 port_mask = 0;
> +	u32 val;
> +	int ret;
> +
> +	/* Set the vid to the port vlan id if no vid is set */

The comment needs to not be wrong. "no vid is set" actually means this
is a VLAN-unaware entry (matches packets when the bridge is under
vlan_filtering=0, or when the port is standalone). This is why you set
it to AN8855_PORT_VID_DEFAULT, because

> +	if (!vid)
> +		vid = AN8855_PORT_VID_DEFAULT;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	an8855_fdb_write(priv, vid, 0, addr, false);
> +	if (!an8855_fdb_cmd(priv, AN8855_FDB_READ, NULL)) {
> +		ret = regmap_read(priv->regmap, AN8855_ATRD3, &val);
> +		if (ret)
> +			goto exit;
> +
> +		port_mask = FIELD_GET(AN8855_ATRD3_PORTMASK, val);
> +	}
> +
> +	port_mask |= BIT(port);
> +	an8855_fdb_write(priv, vid, port_mask, addr, true);
> +	ret = an8855_fdb_cmd(priv, AN8855_FDB_WRITE, NULL);
> +
> +exit:
> +	mutex_unlock(&priv->reg_mutex);
> +
> +	return ret;
> +}
> +
> +static int
> +an8855_port_mdb_del(struct dsa_switch *ds, int port,
> +		    const struct switchdev_obj_port_mdb *mdb,
> +		    struct dsa_db db)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	const u8 *addr = mdb->addr;
> +	u16 vid = mdb->vid;
> +	u8 port_mask = 0;
> +	u32 val;
> +	int ret;
> +
> +	/* Set the vid to the port vlan id if no vid is set */
> +	if (!vid)
> +		vid = AN8855_PORT_VID_DEFAULT;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	an8855_fdb_write(priv, vid, 0, addr, 0);
> +	if (!an8855_fdb_cmd(priv, AN8855_FDB_READ, NULL)) {
> +		ret = regmap_read(priv->regmap, AN8855_ATRD3, &val);
> +		if (ret)
> +			goto exit;
> +
> +		port_mask = FIELD_GET(AN8855_ATRD3_PORTMASK, val);
> +	}
> +
> +	port_mask &= ~BIT(port);
> +	an8855_fdb_write(priv, vid, port_mask, addr, port_mask ? true : false);
> +	ret = an8855_fdb_cmd(priv, AN8855_FDB_WRITE, NULL);
> +
> +exit:
> +	mutex_unlock(&priv->reg_mutex);
> +
> +	return ret;
> +}
> +
> +static int
> +an8855_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	int length;
> +	u32 val;
> +
> +	/* When a new MTU is set, DSA always set the CPU port's MTU to the
> +	 * largest MTU of the slave ports. Because the switch only has a global
> +	 * RX length register, only allowing CPU port here is enough.
> +	 */
> +	if (!dsa_is_cpu_port(ds, port))
> +		return 0;
> +
> +	/* RX length also includes Ethernet header, MTK tag, and FCS length */
> +	length = new_mtu + ETH_HLEN + MTK_TAG_LEN + ETH_FCS_LEN;
> +	if (length <= 1522)
> +		val = AN8855_MAX_RX_PKT_1518_1522;
> +	else if (length <= 1536)
> +		val = AN8855_MAX_RX_PKT_1536;
> +	else if (length <= 1552)
> +		val = AN8855_MAX_RX_PKT_1552;
> +	else if (length <= 3072)
> +		val = AN8855_MAX_RX_JUMBO_3K;
> +	else if (length <= 4096)
> +		val = AN8855_MAX_RX_JUMBO_4K;
> +	else if (length <= 5120)
> +		val = AN8855_MAX_RX_JUMBO_5K;
> +	else if (length <= 6144)
> +		val = AN8855_MAX_RX_JUMBO_6K;
> +	else if (length <= 7168)
> +		val = AN8855_MAX_RX_JUMBO_7K;
> +	else if (length <= 8192)
> +		val = AN8855_MAX_RX_JUMBO_8K;
> +	else if (length <= 9216)
> +		val = AN8855_MAX_RX_JUMBO_9K;
> +	else if (length <= 12288)
> +		val = AN8855_MAX_RX_JUMBO_12K;
> +	else if (length <= 15360)
> +		val = AN8855_MAX_RX_JUMBO_15K;
> +	else
> +		val = AN8855_MAX_RX_JUMBO_16K;
> +
> +	/* Enable JUMBO packet */
> +	if (length > 1552)
> +		val |= AN8855_MAX_RX_PKT_JUMBO;
> +
> +	return regmap_update_bits(priv->regmap, AN8855_GMACCR,
> +				  AN8855_MAX_RX_JUMBO | AN8855_MAX_RX_PKT_LEN,
> +				  val);
> +}
> +
> +static int
> +an8855_port_max_mtu(struct dsa_switch *ds, int port)
> +{
> +	return AN8855_MAX_MTU;
> +}
> +
> +static void
> +an8855_get_strings(struct dsa_switch *ds, int port, u32 stringset,
> +		   uint8_t *data)
> +{
> +	int i;
> +
> +	if (stringset != ETH_SS_STATS)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(an8855_mib); i++)
> +		ethtool_puts(&data, an8855_mib[i].name);
> +}
> +
> +static void
> +an8855_read_port_stats(struct an8855_priv *priv, int port, u32 offset, u8 size,
> +		       uint64_t *data)
> +{
> +	u32 val, reg = AN8855_PORT_MIB_COUNTER(port) + offset;
> +
> +	regmap_read(priv->regmap, reg, &val);
> +	*data = val;
> +
> +	if (size == 2) {
> +		regmap_read(priv->regmap, reg + 4, &val);
> +		*data |= (u64)val << 32;
> +	}
> +}
> +
> +static void
> +an8855_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	const struct an8855_mib_desc *mib;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(an8855_mib); i++) {
> +		mib = &an8855_mib[i];
> +
> +		an8855_read_port_stats(priv, port, mib->offset, mib->size,
> +				       data + i);
> +	}
> +}
> +
> +static int
> +an8855_get_sset_count(struct dsa_switch *ds, int port, int sset)
> +{
> +	if (sset != ETH_SS_STATS)
> +		return 0;
> +
> +	return ARRAY_SIZE(an8855_mib);
> +}
> +
> +static int an8855_port_mirror_add(struct dsa_switch *ds, int port,
> +				  struct dsa_mall_mirror_tc_entry *mirror,
> +				  bool ingress,
> +				  struct netlink_ext_ack *extack)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	int monitor_port;
> +	u32 val;
> +	int ret;
> +
> +	/* Check for existent entry */
> +	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
> +		return -EEXIST;

Please set extack with an informational message, here and everywhere
else where it is available.

> +
> +	ret = regmap_read(priv->regmap, AN8855_MIR, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* AN8855 supports 4 monitor port, but only use first group */
> +	monitor_port = FIELD_GET(AN8855_MIRROR_PORT, val);
> +	if (val & AN8855_MIRROR_EN && monitor_port != mirror->to_local_port)
> +		return -EEXIST;
> +
> +	val = AN8855_MIRROR_EN;
> +	val |= FIELD_PREP(AN8855_MIRROR_PORT, mirror->to_local_port);
> +	ret = regmap_update_bits(priv->regmap, AN8855_MIR,
> +				 AN8855_MIRROR_EN | AN8855_MIRROR_PORT,
> +				 val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(priv->regmap, AN8855_PCR_P(port),
> +			      ingress ? AN8855_PORT_RX_MIR : AN8855_PORT_TX_MIR);
> +	if (ret)
> +		return ret;
> +
> +	if (ingress)
> +		priv->mirror_rx |= BIT(port);
> +	else
> +		priv->mirror_tx |= BIT(port);
> +
> +	return 0;
> +}
> +
> +static void an8855_port_mirror_del(struct dsa_switch *ds, int port,
> +				   struct dsa_mall_mirror_tc_entry *mirror)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	if (mirror->ingress)
> +		priv->mirror_rx &= ~BIT(port);
> +	else
> +		priv->mirror_tx &= ~BIT(port);
> +
> +	regmap_clear_bits(priv->regmap, AN8855_PCR_P(port),
> +			  mirror->ingress ? AN8855_PORT_RX_MIR :
> +					    AN8855_PORT_TX_MIR);
> +
> +	if (!priv->mirror_rx && !priv->mirror_tx)
> +		regmap_clear_bits(priv->regmap, AN8855_MIR, AN8855_MIRROR_EN);
> +}
> +
> +static int an8855_port_set_status(struct an8855_priv *priv, int port,
> +				  bool enable)
> +{
> +	if (enable)
> +		return regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> +				       AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> +	else
> +		return regmap_clear_bits(priv->regmap, AN8855_PMCR_P(port),
> +					 AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> +}
> +
> +static int an8855_port_enable(struct dsa_switch *ds, int port,
> +			      struct phy_device *phy)
> +{
> +	return an8855_port_set_status(ds->priv, port, true);
> +}
> +
> +static void an8855_port_disable(struct dsa_switch *ds, int port)
> +{
> +	an8855_port_set_status(ds->priv, port, false);
> +}

I'm tempted to suggest to just keep the implementations separate rather
than centralized in a single an8855_port_set_status() with no common code.
Then, the remaining an8855_port_set_status() call could be replaced with
an8855_port_enable(..., phy=NULL), since this driver doesn't use the last
argument anyway.

> +
> +static u32 en8855_get_phy_flags(struct dsa_switch *ds, int port)

Odd that this function name starts with en8855 when the rest of the
driver starts with an8855. I've seen your conversation with Andrew and I
understand why, but this is still unconventional.

Could this just go to the PHY driver completely?

> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	/* PHY doesn't need calibration */
> +	if (!priv->phy_require_calib)
> +		return 0;
> +
> +	/* Use AN8855_PHY_FLAGS_EN_CALIBRATION to signal
> +	 * calibration needed.
> +	 */
> +	return AN8855_PHY_FLAGS_EN_CALIBRATION;
> +}
> +
> +static int
> +an8855_setup_pvid_vlan(struct an8855_priv *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Validate the entry with independent learning, keep the original
> +	 * ingress tag attribute.
> +	 */
> +	val = AN8855_VA0_IVL_MAC | AN8855_VA0_EG_CON |
> +	      FIELD_PREP(AN8855_VA0_FID, AN8855_FID_BRIDGED) |
> +	      AN8855_VA0_PORT | AN8855_VA0_VLAN_VALID;
> +	ret = regmap_write(priv->regmap, AN8855_VAWD0, val);
> +	if (ret)
> +		return ret;
> +
> +	return an8855_vlan_cmd(priv, AN8855_VTCR_WR_VID,
> +			       AN8855_PORT_VID_DEFAULT);
> +}
> +
> +static int an8855_setup(struct dsa_switch *ds)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	struct dsa_port *dp;
> +	int ret;
> +
> +	/* Enable and reset MIB counters */
> +	ret = an8855_mib_init(priv);
> +	if (ret)
> +		return ret;
> +
> +	dsa_switch_for_each_user_port(dp, ds) {
> +		/* Disable MAC by default on all user ports */
> +		ret = an8855_port_set_status(priv, dp->index, false);
> +		if (ret)
> +			return ret;
> +
> +		/* Individual user ports get connected to CPU port only */
> +		ret = regmap_write(priv->regmap, AN8855_PORTMATRIX_P(dp->index),
> +				   FIELD_PREP(AN8855_PORTMATRIX, BIT(AN8855_CPU_PORT)));
> +		if (ret)
> +			return ret;
> +
> +		/* Disable Broadcast Forward on user ports */
> +		ret = regmap_clear_bits(priv->regmap, AN8855_BCF, BIT(dp->index));
> +		if (ret)
> +			return ret;
> +
> +		/* Disable Unknown Unicast Forward on user ports */
> +		ret = regmap_clear_bits(priv->regmap, AN8855_UNUF, BIT(dp->index));
> +		if (ret)
> +			return ret;
> +
> +		/* Disable Unknown Multicast Forward on user ports */
> +		ret = regmap_clear_bits(priv->regmap, AN8855_UNMF, BIT(dp->index));
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_clear_bits(priv->regmap, AN8855_UNIPMF, BIT(dp->index));
> +		if (ret)
> +			return ret;
> +
> +		/* Set default PVID to on all user ports */
> +		ret = an8855_port_set_pid(priv, dp->index, AN8855_PORT_VID_DEFAULT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Enable Airoha header mode on the cpu port */
> +	ret = regmap_write(priv->regmap, AN8855_PVC_P(AN8855_CPU_PORT),
> +			   AN8855_PORT_SPEC_REPLACE_MODE | AN8855_PORT_SPEC_TAG);
> +	if (ret)
> +		return ret;
> +
> +	/* Unknown multicast frame forwarding to the cpu port */
> +	ret = regmap_write(priv->regmap, AN8855_UNMF, BIT(AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	/* Set CPU port number */
> +	ret = regmap_update_bits(priv->regmap, AN8855_MFC,
> +				 AN8855_CPU_EN | AN8855_CPU_PORT_IDX,
> +				 AN8855_CPU_EN |
> +				 FIELD_PREP(AN8855_CPU_PORT_IDX, AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	/* CPU port gets connected to all user ports of
> +	 * the switch.
> +	 */
> +	ret = regmap_write(priv->regmap, AN8855_PORTMATRIX_P(AN8855_CPU_PORT),
> +			   FIELD_PREP(AN8855_PORTMATRIX, dsa_user_ports(ds)));
> +	if (ret)
> +		return ret;
> +
> +	/* CPU port is set to fallback mode to let untagged
> +	 * frames pass through.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_PCR_P(AN8855_CPU_PORT),
> +				 AN8855_PORT_VLAN,
> +				 FIELD_PREP(AN8855_PORT_VLAN, AN8855_PORT_FALLBACK_MODE));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable Broadcast Forward on CPU port */
> +	ret = regmap_set_bits(priv->regmap, AN8855_BCF, BIT(AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable Unknown Unicast Forward on CPU port */
> +	ret = regmap_set_bits(priv->regmap, AN8855_UNUF, BIT(AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	/* Enable Unknown Multicast Forward on CPU port */
> +	ret = regmap_set_bits(priv->regmap, AN8855_UNMF, BIT(AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(priv->regmap, AN8855_UNIPMF, BIT(AN8855_CPU_PORT));
> +	if (ret)
> +		return ret;
> +
> +	/* Setup Trap special frame to CPU rules */
> +	ret = an8855_trap_special_frames(priv);
> +	if (ret)
> +		return ret;
> +
> +	dsa_switch_for_each_port(dp, ds) {
> +		/* Disable Learning on all ports.
> +		 * Learning on CPU is disabled for fdb isolation and handled by
> +		 * assisted_learning_on_cpu_port.
> +		 */
> +		ret = regmap_set_bits(priv->regmap, AN8855_PSC_P(dp->index),
> +				      AN8855_SA_DIS);
> +		if (ret)
> +			return ret;
> +
> +		/* Enable consistent egress tag (for VLAN unware VLAN-passtrough) */

Throughout the patch set:
s/passtrough/passthrough/

> +		ret = regmap_update_bits(priv->regmap, AN8855_PVC_P(dp->index),
> +					 AN8855_PVC_EG_TAG,
> +					 FIELD_PREP(AN8855_PVC_EG_TAG, AN8855_VLAN_EG_CONSISTENT));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Setup VLAN for Default PVID */
> +	ret = an8855_setup_pvid_vlan(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_clear_bits(priv->regmap, AN8855_CKGCR,
> +				AN8855_CKG_LNKDN_GLB_STOP | AN8855_CKG_LNKDN_PORT_STOP);
> +	if (ret)
> +		return ret;
> +
> +	/* Release global PHY power down */
> +	ret = regmap_write(priv->regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
> +	if (ret)
> +		return ret;

From the comment about PHY power handling, it sounds like this is
problematic to do in the switch driver now, since that runs in parallel
with the PHY drivers' probe sequence. Sounds like it should be moved to
the central MFD driver, at a stage where there is no parallel child
driver execution.

> +
> +	ds->configure_vlan_while_not_filtering = true;

Unnecessary, this is the default value, please remove.

> +
> +	/* Flush the FDB table */
> +	ret = an8855_fdb_cmd(priv, AN8855_FDB_FLUSH, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set min a max ageing value supported */
> +	ds->ageing_time_min = AN8855_L2_AGING_MS_CONSTANT;
> +	ds->ageing_time_max = FIELD_MAX(AN8855_AGE_CNT) *
> +			      FIELD_MAX(AN8855_AGE_UNIT) *
> +			      AN8855_L2_AGING_MS_CONSTANT;
> +
> +	/* Enable assisted learning for fdb isolation */
> +	ds->assisted_learning_on_cpu_port = true;

What FDB isolation? :)

> +
> +	return 0;
> +}
> +
> +static int an8855_switch_probe(struct platform_device *pdev)
> +{
> +	struct an8855_priv *priv;
> +	u32 val;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +	priv->phy_require_calib = of_property_read_bool(priv->dev->of_node,
> +							"airoha,ext-surge");

Can this be moved to the DT bindings of individual PHYs instead?
The switch is just a useless messenger here.

> +
> +	priv->reset_gpio = devm_gpiod_get_optional(priv->dev, "reset",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_gpio))
> +		return PTR_ERR(priv->reset_gpio);
> +
> +	/* Get regmap from MFD */
> +	priv->regmap = dev_get_regmap(priv->dev->parent, NULL);
> +
> +	if (priv->reset_gpio) {
> +		usleep_range(100000, 150000);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +		usleep_range(100000, 150000);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +
> +		/* Poll HWTRAP reg to wait for Switch to fully Init */
> +		ret = regmap_read_poll_timeout(priv->regmap, AN8855_HWTRAP, val,
> +					       val, 20, 200000);
> +		if (ret)
> +			return ret;
> +	}

As mentioned in the dt-bindings comment: this sounds like the type of
thing which should only run from the context of the top-level MFD
driver, in a very controlled manner (child drivers have not started).

> +
> +	ret = an8855_read_switch_id(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->ds = devm_kzalloc(priv->dev, sizeof(*priv->ds), GFP_KERNEL);
> +	if (!priv->ds)
> +		return -ENOMEM;
> +
> +	priv->ds->dev = priv->dev;
> +	priv->ds->num_ports = AN8855_NUM_PORTS;
> +	priv->ds->priv = priv;
> +	priv->ds->ops = &an8855_switch_ops;
> +	devm_mutex_init(priv->dev, &priv->reg_mutex);
> +	priv->ds->phylink_mac_ops = &an8855_phylink_mac_ops;
> +
> +	priv->pcs.ops = &an8855_pcs_ops;
> +	priv->pcs.neg_mode = true;
> +	priv->pcs.poll = true;
> +
> +	dev_set_drvdata(priv->dev, priv);
> +
> +	return dsa_register_switch(priv->ds);
> +}
> +
> +static void an8855_switch_remove(struct platform_device *pdev)
> +{
> +	struct an8855_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	if (!priv)
> +		return;
> +
> +	dsa_unregister_switch(priv->ds);
> +}
> +
> +static const struct of_device_id an8855_switch_of_match[] = {
> +	{ .compatible = "airoha,an8855-switch" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, an8855_switch_of_match);
> +
> +static struct platform_driver an8855_switch_driver = {
> +	.probe = an8855_switch_probe,
> +	.remove = an8855_switch_remove,

dsa_switch_shutdown() is non-optional - see commit 0650bf52b31f ("net:
dsa: be compatible with masters which unregister on shutdown") for more
details. As a discrete DSA switch, don't get to choose which conduit
interface this is paired with.

> +	.driver = {
> +		.name = "an8855-switch",
> +		.of_match_table = an8855_switch_of_match,
> +	},
> +};
> +module_platform_driver(an8855_switch_driver);
> +struct an8855_priv {
> +	struct device *dev;

Nitpick: can retrieve the device as priv->ds->dev already.

> +	struct dsa_switch *ds;
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio;
> +	/* Protect ATU or VLAN table access */
> +	struct mutex reg_mutex;
> +
> +	struct phylink_pcs pcs;
> +
> +	u8 mirror_rx;
> +	u8 mirror_tx;
> +	u8 port_isolated_map;
> +
> +	bool phy_require_calib;
> +};
> +
> +#endif /* __AN8855_H */
> -- 
> 2.45.2
> 

This doesn't look bad IMO (sure, still needs work), we should focus on
the selftests and make sure they pass.

