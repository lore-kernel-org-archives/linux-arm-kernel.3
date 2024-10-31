Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E86D767D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cO+z33cWuDyc7Z/mkMvchv3UD3kchPb5M+ORYHQBzvg=; b=h6W63gUb9QXATx
	9uJXFu8lHRChWEjVPBa1Xy6qiyalnfIlzgchIREPwM1TZtvLHFb8ojfdtzegRb39nasHJUE5ORexU
	CXGGvNO8JjhgPWCpErhHaw3zv/fQNz7CWyL4WHZUzP3jx9l3kH5Al2arWy1p4yoOP5AamI6J6uPa+
	SUX7s/LliVhyBKFWOqcszOx2V1pde0i4TnlLKDZkHd1gYZJkjCLSJkKUOyYTwy8Jv0zGfpq7w4PBl
	CJWZzKu2J2iCL8TfNsl9cTYjpMnnXZDldQA4cIrn5Yami/17UpAoR6jx3KZljO8rORj67RwWBCEwA
	oMHQVD/aZjC5CT3//d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wan-00000003skB-1WaQ;
	Thu, 31 Oct 2024 14:56:09 +0000
Received: from skyblue.cherry.relay.mailchannels.net ([23.83.223.167])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WZ8-00000003sZs-3G9T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:54:28 +0000
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D3B08164BF9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 14:54:24 +0000 (UTC)
Received: from fr-int-smtpout1.hostinger.io (trex-14.trex.outbound.svc.cluster.local [100.103.220.112])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1A9EA163AA5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 14:54:23 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1730386464; a=rsa-sha256;
	cv=none;
	b=diAdj1XfCGWv/wQi1Ub9ZiX8aZNB3pGGenyzEo8EDNtrBeLVvaOAlBwC+97HoCvxa+7274
	JZKsSmTdxUESSCre49eFTcMPlTc4RM/NReITbaKqTgRJSZfyoguuG4WMjIIeuD+YQG78Kj
	+TvhF0tDuK3aRWkwgNrkSnTUm2YiQkLurDfnyM+Q1rVRBIFgueSu0OLNu3DoPjk9h/WbPs
	Lt57Bm7jbX2oqhzs9PxXTTr/epuSD/5fObU7fU+U6fdZvU4aXj/j8CnlegZSYgxZHoNohM
	/mrCPmERox8DbLANk0MEIk1TqEZawTbkkf89l4LXIE4kfoGx66PprGxhEMiX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1730386464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=cO+z33cWuDyc7Z/mkMvchv3UD3kchPb5M+ORYHQBzvg=;
	b=AJl2CWpaZhHFc4vEf0SUEsUxKkPl+fFY4yOlhWGStlFOQrEAoaG0o9a5cV3rcWr3SKO+CG
	jY8eCFcJJiW0HdnuY5g4qzBsjHfDdG+zC9h8WVmnSccn8FOpB8BKoRpXe9L49w+BA7ekFA
	tUqj1aNn1gRI1Aw3kDQk0MMkER28S93W8bHQYS/Lqr8swgZpyg0wSFOBjMGzyiOZxewchF
	hvibxq4NDHDxeiNDNNvunqovRX5yLl/w5b1pzKOHT/hymsRR3sI5ipzeez9M+Zijnv0RRc
	Zlo3kLXeoBaRXmPcnqKQvx1rHn4bKvlO7iusjQmFic6X+DL2e+6YVML2cs08jQ==
ARC-Authentication-Results: i=1;
	rspamd-65cf4487d9-q9nl2;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=arinc.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Eight-Reign: 69630fcd7024873e_1730386464763_30590620
X-MC-Loop-Signature: 1730386464763:3306713611
X-MC-Ingress-Time: 1730386464763
Received: from fr-int-smtpout1.hostinger.io (fr-int-smtpout1.hostinger.io
 [89.116.146.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.220.112 (trex/7.0.2);
	Thu, 31 Oct 2024 14:54:24 +0000
Message-ID: <1c91ef22-3aec-425d-a0cc-bc553e2d506e@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1730386462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cO+z33cWuDyc7Z/mkMvchv3UD3kchPb5M+ORYHQBzvg=;
	b=cgSvOKn8DA5jZ387GpsuQNvBEaVgXBS9uynmq8dKc+y9Eo1NS4ii4uKoUHfInQT0OEexQU
	eIodhn3vqrWJTuvWFYsWoHvw+0Z0XZEeG0CJ+ILE7TQDz2lC4Mq17udzqzATmh8gpej4nm
	+wLWryyo1lf8ztTXPhM2ecUIYKh1e+S557PZ82BWq3QNXtgsc0Yby55xvrDvSP2AaJPOuC
	S0p9MWnH5BtQn7xiPo20hES2qYMF2SQbAXvZ62iIIk0m/VykjRgWISMaHWLIWcZb5aWSfa
	WeCk7jZcqKN0A5SZbDj8YZW1gyemh7njumLfZJjzkNOrdI48WorntJylH8EqrA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: Add TBF qdisc offload
 support
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241031-mt7530-tc-offload-v2-1-cb242ad954a0@kernel.org>
Content-Language: en-GB
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20241031-mt7530-tc-offload-v2-1-cb242ad954a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 31 Oct 2024 14:54:19 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Z6G+H2RA c=1 sm=1 tr=0 ts=67239a1e a=aGj/nXfi4qz2iMxz7h0kJQ==:117 a=aGj/nXfi4qz2iMxz7h0kJQ==:17 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=GvHEsTVZAAAA:8 a=VwQbUJbxAAAA:8 a=hCiPA77iXPllxYcOKgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aajZ2D0djhd3YR65f-bR:22
X-CM-Envelope: MS4xfF/Vnhe/QPETqgQvGh8k4C2x76Y3I8c/kiq9SG/kQaVjayLEQUBVkDgXnSPoFIsAPb+4hJP6EomAqZ3zuWP8ljq491WrRl2k+eQgP5PheaXluTEG0ppl XlShcH/nxOB/JXtWVvDw7igE/08cc+4RBznkJNsL9Liqi4X8vhHWEWAtdKGPRgvL7C8T/oPmXcOuoRM+Xfek46dioCeP/iYcsVw4Z7UsgipjY9KCS3A40f1f 8/liUksjz18WX58AGbsljA9Aflb8SnkRP5Yju6hVjHFh2xdTtCvfWHRPmANX9k5zQ+YMLuCF3QgXGgooWQor4uTSV2+LQykHPNGADb8/WpOTUgJzzcdkeqgD Omz/qtcdjEmtkSX4yRVCHNYfYM3/PWtS1haCl+nwtNsTSqJHQWsINKNqP9XrskZP+9LuFlL9FiVeV5fcLWGr+4XMiOvhe+yTmDz0/Mk52BuR+ByebSXudzP6 Z8ra6V5ApRR0VqXQzi/3jUjovyRkGelqcEbNarL1c+77I3n3LNC+9BImkDN4+MT6h/jjx6knOiFfPEDoxcajqGsrz/WCUQDMXaBR3BqBSi424hbyx6Bg/kGH bjWFM5Nv/q0uFrZyJjttCcgxmxyhf+ZVDCLY8KiL491NO+ec/JOITgQirogiM1ToZjuywnqKfqVQAjnSWT/UR2vh2l4wy9BUp82XHBejBy087PEGO4XzFlm9 ogHrZBwEdq4=
X-AuthUser: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_075427_300383_FE6DEC82 
X-CRM114-Status: GOOD (  19.51  )
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

This is a very nice addition, thanks for working on this!

Arınç

On 31/10/2024 17:28, Lorenzo Bianconi wrote:
> Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
> dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
> traffic.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - remove device id limitation and allow tbf qdisc configuration on each mt7530
>    compliant devices
> - rename MT7530_ERLCR_P in MT753X_ERLCR_P and MT7530_GERLCR in
>    MT753X_GERLCR
> - Link to v1: https://lore.kernel.org/r/20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org
> ---
>   drivers/net/dsa/mt7530.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>   drivers/net/dsa/mt7530.h | 12 ++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d84ee1b419a614dda5f440e6571cff5f4f27bf21..086b8b3d5b40f776815967492914bd46a04b6886 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -21,6 +21,7 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
>   #include <net/dsa.h>
> +#include <net/pkt_cls.h>
>   
>   #include "mt7530.h"
>   
> @@ -3146,6 +3147,53 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>   	mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_EN | MT7530_CPU_PORT_MASK, val);
>   }
>   
> +static int mt753x_tc_setup_qdisc_tbf(struct dsa_switch *ds, int port,
> +				     struct tc_tbf_qopt_offload *qopt)
> +{
> +	struct tc_tbf_qopt_offload_replace_params *p = &qopt->replace_params;
> +	struct mt7530_priv *priv = ds->priv;
> +	u32 rate = 0;
> +
> +	switch (qopt->command) {
> +	case TC_TBF_REPLACE:
> +		rate = div_u64(p->rate.rate_bytes_ps, 1000) << 3; /* kbps */
> +		fallthrough;
> +	case TC_TBF_DESTROY: {
> +		u32 val, tick;
> +
> +		mt7530_rmw(priv, MT753X_GERLCR, EGR_BC_MASK,
> +			   EGR_BC_CRC_IPG_PREAMBLE);
> +
> +		/* if rate is greater than 10Mbps tick is 1/32 ms,
> +		 * 1ms otherwise
> +		 */
> +		tick = rate > 10000 ? 2 : 7;
> +		val = FIELD_PREP(ERLCR_CIR_MASK, (rate >> 5)) |
> +		      FIELD_PREP(ERLCR_EN_MASK, !!rate) |
> +		      FIELD_PREP(ERLCR_EXP_MASK, tick) |
> +		      ERLCR_TBF_MODE_MASK |
> +		      FIELD_PREP(ERLCR_MANT_MASK, 0xf);
> +		mt7530_write(priv, MT753X_ERLCR_P(port), val);
> +		break;
> +	}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt753x_setup_tc(struct dsa_switch *ds, int port,
> +			   enum tc_setup_type type, void *type_data)
> +{
> +	switch (type) {
> +	case TC_SETUP_QDISC_TBF:
> +		return mt753x_tc_setup_qdisc_tbf(ds, port, type_data);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static int mt7988_setup(struct dsa_switch *ds)
>   {
>   	struct mt7530_priv *priv = ds->priv;
> @@ -3193,6 +3241,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
>   	.get_mac_eee		= mt753x_get_mac_eee,
>   	.set_mac_eee		= mt753x_set_mac_eee,
>   	.conduit_state_change	= mt753x_conduit_state_change,
> +	.port_setup_tc		= mt753x_setup_tc,
>   };
>   EXPORT_SYMBOL_GPL(mt7530_switch_ops);
>   
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index 6ad33a9f6b1dff3a423baa668a8a2ca158f72b91..448200689f492dcb73ef056d7284090c1c662e67 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -248,6 +248,18 @@ enum mt7530_vlan_egress_attr {
>   #define  AGE_UNIT_MAX			0xfff
>   #define  AGE_UNIT(x)			(AGE_UNIT_MASK & (x))
>   
> +#define MT753X_ERLCR_P(x)		(0x1040 + ((x) * 0x100))
> +#define  ERLCR_CIR_MASK			GENMASK(31, 16)
> +#define  ERLCR_EN_MASK			BIT(15)
> +#define  ERLCR_EXP_MASK			GENMASK(11, 8)
> +#define  ERLCR_TBF_MODE_MASK		BIT(7)
> +#define  ERLCR_MANT_MASK		GENMASK(6, 0)
> +
> +#define MT753X_GERLCR			0x10e0
> +#define  EGR_BC_MASK			GENMASK(7, 0)
> +#define  EGR_BC_CRC			0x4	/* crc */
> +#define  EGR_BC_CRC_IPG_PREAMBLE	0x18	/* crc + ipg + preamble */
> +
>   /* Register for port STP state control */
>   #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
>   #define  FID_PST(fid, state)		(((state) & 0x3) << ((fid) * 2))
> 
> ---
> base-commit: 157a4881225bd0af5444aab9510e7b6da28f2469
> change-id: 20241030-mt7530-tc-offload-05e204441500
> 
> Best regards,


