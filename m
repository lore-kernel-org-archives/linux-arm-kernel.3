Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC97CD98E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ahma7VBoZ8dq8G9kkkrgpiRxv6MF4l51nMrG6V7ECUQ=; b=HE6lUqG59Wb9OZQg4VvH8qyKuY
	iTFGILCewligG5uYvILyW9G+KmANWJKHnNrBmtUVgWqMC9SfrAC+4y46PuMDJ0ZEeLSue3V0j3Bcd
	dcuMzq/WSXas5T0OL+Dsk3PbZCtGXYHx8NCR0DH/aRBwS05CElgjbxA655njJD1bfuaqdoKGGP6iO
	9ATPTcY2C6cJKsIKf9YG5yi2Fahjg6CQREZVxCN9/XfjBHuLkNSLwxjyvjUHmXHPse86YIny86AlQ
	fSpQGuLXvobUqsUxJTuU7dg8WLhvQOy4YAsdbR48Ct27zBwtekmPXSyVXgMZaZYsy0cbgsDylZ7ak
	wUOtyIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtJ-0000000Ewvx-3BbZ;
	Mon, 15 Jun 2026 23:38:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtF-0000000Ewun-3SCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:38:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18B0E60172;
	Mon, 15 Jun 2026 23:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158A81F00A3A;
	Mon, 15 Jun 2026 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566728;
	bh=Ahma7VBoZ8dq8G9kkkrgpiRxv6MF4l51nMrG6V7ECUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fXErsTMo7IXfvHroDy5VP9L4x1Q1/WSWexCMsq3Zp5D6IM9+9qxK41L2l1QCCipdV
	 iFrC2LxTdQ0l/ZXUJWf4yYnKrq2hB1PxP+DIDu3DjclbSLUvejy1JvZT6oBNsEQQ3N
	 iE8SV4RFBfcoCEb04Hny79+dSsxl/yRu3f5DCeVa+wzen5D3iPo/zNIu8HiGwhVLHF
	 r/l72EN87SX12WaTWHMYFxrolmzs7x8pxKFuXGvjFq75mjy2GRMHVNJRuItNEFHz1S
	 cOFu1S3RicYTmoMexnKJHCzb0Yv3dENSdNxx/OeQ1W9XmTnu3iYPLKTy7FtanHVzaS
	 7cHR/Hku65MUQ==
From: Jakub Kicinski <kuba@kernel.org>
To: jensemil.schulzostergaard@microchip.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	daniel.machon@microchip.com,
	Steen.Hegelund@microchip.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next 4/9] net: microchip: vcap: expose helpers in vcap api and update debugfs
Date: Mon, 15 Jun 2026 16:38:47 -0700
Message-ID: <20260615233847.1042253-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-sparx5_l3_routing-v1-4-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-4-fc3c10160f49@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
net: microchip: vcap: expose helpers in vcap api and update debugfs

Add new helpers to the vcap client api in preparation for L3 routing
functionality, rename PREROUTING to PREROUTING_L0, and fix a latent
undefined-behavior bug in the debugfs action-field printer.

> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 30700648672fc..0905e4f192a02 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c

[ ... ]

> @@ -3547,6 +3560,18 @@ int vcap_rule_mod_action_u32(struct vcap_rule *rule,
>  }
>  EXPORT_SYMBOL_GPL(vcap_rule_mod_action_u32);
>  
> +/* Modify a bit action with value in the rule */
> +int vcap_rule_mod_action_bit(struct vcap_rule *rule,
> +			     enum vcap_action_field action,
> +			     enum vcap_bit val)
> +{
> +	struct vcap_client_actionfield_data data;
> +
> +	vcap_rule_set_action_bitsize(&data.u1, val);
> +	return vcap_rule_mod_action(rule, action, VCAP_FIELD_BIT, &data);

[Severity: Medium]
Could this copy uninitialized stack memory to the heap?

The data union is allocated on the stack but not initialized. The call to
vcap_rule_set_action_bitsize() only initializes the first byte (data.u1).

When data is passed to vcap_rule_mod_action(), it performs a memcpy() of the
entire 16-byte union:

vcap_rule_mod_action() {
	...
	memcpy(&field->data, data, sizeof(field->data));
	...
}

This appears to copy 15 bytes of uninitialized kernel stack memory into the
heap-allocated field->data, which might trigger KMSAN uninit-value warnings.

While a similar pattern exists in the pre-existing vcap_rule_mod_action_u32()
function, should the new data union be zero-initialized here?

> +}
> +EXPORT_SYMBOL_GPL(vcap_rule_mod_action_bit);
> +
>  /* Drop keys in a keylist and any keys that are not supported by the keyset */
>  int vcap_filter_rule_keys(struct vcap_rule *rule,
>  			  enum vcap_key_field keylist[], int length,

