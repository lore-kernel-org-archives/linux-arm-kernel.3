Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA2BC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmXhnBSMTGUrH5O1ANS4et/RxLazQMcA0Z+Dk2f/vxQ=; b=OWYZWmA27cEy+QR2BQTdu2xhlf
	OPFyY9Z7EBEuF5+IWyTqMqth1nj9V+P3bFOctytNAOSMy/XlBW2ESvn/AUDcU+taa/zfvHblnjYUF
	feQSUcQ4hgBFOkV9bVdV6Al6nPVJNevrucKUGg9S4kHqOc3vFVZ3BcE01PD+1MXagOtGHdBBbtOPD
	+KkMpv3JL6Yhmf0d75tBiGJ3qmBbgeDQJyAC+3oKv0tzYhfREYkqXsCpCl4mdB7yws6DFrv9dHP2g
	uvkpWxqokZ1n13k4PJ5WoTKZKoTNoBqglV6Vaim5mtLQfYxsp+pENKQzB2KMoci2fEsHXZz0pNZDH
	wHWveDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylx5-00000000K0n-1cNM;
	Tue, 25 Aug 2026 07:52:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylx1-00000000JyS-3ovY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787644323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmXhnBSMTGUrH5O1ANS4et/RxLazQMcA0Z+Dk2f/vxQ=;
	b=Zn7jQx5IoVhpd/3KmjhmDko8A2I2gkt6ZUPiWWrUgi1iMiQBHEBp8YHTOe9c98kFGhHxbk
	3d3VFtJmxlW76Vbjm2iQUHI4vOCEzFFdOu42Tu4AYIvxkrMpy8inZoVZj+X/WAOesZmiAO
	PWaSRl6cwGwA3g+UB8XDQNLNMkK4C5I=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-fhSZXN0aM5-gbGu2ELL5Jw-1; Tue,
 25 Aug 2026 03:51:59 -0400
X-MC-Unique: fhSZXN0aM5-gbGu2ELL5Jw-1
X-Mimecast-MFC-AGG-ID: fhSZXN0aM5-gbGu2ELL5Jw_1787644317
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15755187E5C6;
	Tue, 25 Aug 2026 07:51:56 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.127])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D152F3000239;
	Tue, 25 Aug 2026 07:51:49 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	hkallweit1@gmail.com,
	alexis.lothore@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com
Subject: Re: [PATCH net] net: stmmac: selftests: Pass the IP proto mask in the TC selftest
Date: Tue, 25 Aug 2026 09:51:45 +0200
Message-ID: <20260825075145.34118-1-pabeni@redhat.com>
In-Reply-To: <20260822153245.423259-1-maxime.chevallier@bootlin.com>
References: <20260822153245.423259-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: rkj7axuih-TgzVGMCn9kIKu7sG2URpG20jSkJHAT7gA_1787644317
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_005208_051495_F65F1195 
X-CRM114-Status: GOOD (  14.35  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
net: stmmac: selftests: Pass the IP proto mask in the TC selftest

This adds an ip_proto mask to the match data used by the L4 filtering
selftests in __stmmac_test_l4filt(), so that the new mask sanity checks in
tc_add_basic_flow() accept the rule.  The commit message reports tests 23-26
going from -22 to 0 on imx8mp.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 1df26c217f9a..e9be4d7cbb82 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1489,6 +1489,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
>  	keys.bkey.ip_proto = udp ? IPPROTO_UDP : IPPROTO_TCP;
>  	keys.key.src = htons(src);
>  	keys.key.dst = htons(dst);
> +	/* Match the full IP proto field */
> +	masks.bmask.ip_proto = 0xff;
>  	masks.mask.src = src_mask;
>  	masks.mask.dst = dst_mask;
>  

[Severity: Medium]

Is the n_proto half of the basic key still left uninitialized here?  In
__stmmac_test_l4filt() both structs are declared without an initializer:

	struct {
		struct flow_dissector_key_basic bkey;
		struct flow_dissector_key_ports key;
	} __aligned(BITS_PER_LONG / 8) keys;
	struct {
		struct flow_dissector_key_basic bmask;
		struct flow_dissector_key_ports mask;
	} __aligned(BITS_PER_LONG / 8) masks;

The function then only assigns keys.bkey.ip_proto, keys.key.src,
keys.key.dst, and now masks.bmask.ip_proto, masks.mask.src, masks.mask.dst.
Since dissector->offset[FLOW_DISSECTOR_KEY_BASIC] is 0,
flow_rule_match_basic() hands tc_add_basic_flow() pointers straight at
keys.bkey / masks.bmask, so match.mask->n_proto and match.key->n_proto are
whatever was on the stack.

tc_add_basic_flow() in stmmac_tc.c makes decisions on exactly those fields:

	if ((match.mask->n_proto && match.mask->n_proto != ETHER_TYPE_FULL_MASK) ||
	    (match.mask->ip_proto && match.mask->ip_proto != IP_PROTO_FULL_MASK)) {
		NL_SET_ERR_MSG_MOD(cls->common.extack,
				   "only full protocol mask is supported");
		return -EOPNOTSUPP;
	}

	/* Network proto is present in the key and is not IPv4 */
	if (match.mask->n_proto && match.key->n_proto != cpu_to_be16(ETH_P_IP)) {
		NL_SET_ERR_MSG_MOD(cls->common.extack,
				   "only IPv4 network protocol is supported");
		return -EOPNOTSUPP;
	}

So if the stack slot for masks.bmask.n_proto happens to be non-zero and not
0xffff, does the rule get rejected with -EOPNOTSUPP again?  With
CONFIG_INIT_STACK_ALL_PATTERN the slot holds the 0xAA pattern, which is
neither 0 nor ETHER_TYPE_FULL_MASK.

From there tc_add_flow_cls() falls back:

	ret = tc_add_flow(priv, cls);
	if (!ret)
		return ret;

	ret = tc_add_ethtype_flow(priv, cls);
	if (!ret)
		return ret;

	return tc_add_vlan_flow(priv, cls);

and with cls->classid == 0 those fallbacks return -EINVAL, which is the same
-22 that tests 23-26 report in the commit message.  Would zero-initializing
both structs ("= { }", as attr already does in the same function), and
setting keys.bkey.n_proto = htons(ETH_P_IP) together with
masks.bmask.n_proto = ETHER_TYPE_FULL_MASK given the injected frames are
IPv4, make the result independent of the stack contents?
-- 
This is an AI-generated review.


