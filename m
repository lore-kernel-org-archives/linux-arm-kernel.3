Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768F9C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnxWEUAZfDBtEp1r6V4GV/4y5UUjY6QTewuwXNl2bfA=; b=19/oIu/WMx87OdAJJ6Oi3BDYpC
	ScrMUrnGoBNbJTSMRLebW8tDt0FM9VYx9pIP5HgnnVA9VZ9opFm70sYSJNG1wnoV1O3dtrr4PNe7p
	bv0KxYqiFM8/+oiJwXdFxoPOVWjdZwUFB6teVPp8/WxdNVdgri75ZsV4yc7BkOd8qP6bgD/F+/BqL
	t9AHDAB8D1tVWWo8UKty9inBO2edP3hO588QcQ0vWmFJorTiW3CMIoojniEOU3jzRbBdGmGWCUwOL
	Q3baouLd0tU30U+M/ViesYgH8jSEMC7epW4a6zxKi1zJXN79cbCo+jzdw6Ga/OfbBOzGj4bdx2rLw
	laPRHOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4eh-00000006oiH-3tOn;
	Mon, 17 Aug 2026 21:14:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4eZ-00000006ogm-2CkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:13:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E55CF42ABA;
	Mon, 17 Aug 2026 21:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1707A1F00A3A;
	Mon, 17 Aug 2026 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001234;
	bh=nnxWEUAZfDBtEp1r6V4GV/4y5UUjY6QTewuwXNl2bfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dZD7ZD5LCMf0q8gFz7SrIp5q9hD7tU/9D24lCiJAh4nhE5XMWJUuWEdiv27XKlQ1m
	 8lcCqSHrtyT+bFStuuppYTgfARfB01WsGEgIZeDGMGOSOFZReDTI1C0YZMakbYzpzP
	 AXumDoos4/wgUTWnuh4YHawHvbA/JVtYJ2RC4abklkkn76PdAVthIztdEFnos5vWYU
	 MPJHO7Wp9XL4DkfXj7eUeZoBuV4AHQim6TJ57QD1WpICigyjQzxWaQitlGYSOHvWjp
	 P+Pd+byzM6AtLqij2loD52xHE6qWR3MawwI2zVay4lfhls+Og39PBBtICPAm6jSW7S
	 bYOXDZsV1KROA==
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
	robert.marko@sartura.hr,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/9] net: microchip: vcap: make vcap actionset decoding type_id aware
Date: Mon, 17 Aug 2026 14:13:53 -0700
Message-ID: <20260817211353.3633288-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-sparx5_l3_routing-v2-3-59e68cc8c8ca@microchip.com>
References: <20260810-sparx5_l3_routing-v2-3-59e68cc8c8ca@microchip.com>
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
net: microchip: vcap: make vcap actionset decoding type_id aware

This adds a helper, vcap_find_stream_type_id(), that pulls the type_id
bits out of stream[0] just after the typegroup bits, and uses it in
vcap_verify_actionstream_actionset() to compare the decoded type_id
against info->type_id instead of always returning true.  The code change
itself looks fine; the comment below is only about the commit message.

> net: microchip: vcap: make vcap actionset decoding type_id aware
>
> When reading a rule back from hardware, decoding has to identify which
> actionset the rule was written as. The existing logic was only aware of
> the actionset subword length, which cannot distinguish actionsets that
> share a subword length but differ in their type_id field. The LPM VCAP
> added in a following patch introduces this case: ARP_PTR, L3MC_PTR and
> ARP_ENTRY all occupy one subword and differ only by type_id.

[Severity: Low]
Should the sentence "The LPM VCAP added in a following patch introduces
this case: ARP_PTR, L3MC_PTR and ARP_ENTRY all occupy one subword and
differ only by type_id" be reworded?

Two details don't seem to match the tree.  First, there is no L3MC_PTR
symbol anywhere at this commit; grepping for L3MC under
drivers/net/ethernet/microchip/ only matches the unrelated register name
GA_ANA_L3_VLAN_ARP_L3MC_STICKY.  The one-subword LPM actionsets that do
exist are just these two, in sparx5_vcap_ag_api.c:

static const struct vcap_set lpm_actionfield_set[] = {
	[VCAP_AFS_ARP_PTR] = {
		.type_id = 0,
		.sw_per_item = 1,
		.sw_cnt = 12,
	},
	[VCAP_AFS_ARP_ENTRY] = {
		.type_id = 2,
		.sw_per_item = 1,
		.sw_cnt = 12,
	},
};

Second, the colliding actionset metadata is not added in a following
patch; lpm_actionfield_set, lpm_actionfield_set_map and the
sparx5_vcaps[VCAP_TYPE_LPM] entry that references them are already
present at this commit, added by the preceding "net: microchip: vcap: add
lpm vcap to autogen vcap api".  Only the sparx5/lan969x LPM driver
enablement lands later.

Could the message say the LPM actionset model is added by the preceding
patch, and drop the L3MC_PTR reference?  The premise that two actionsets
share sw_per_item = 1 and differ only in type_id does hold, so the change
itself still looks justified.

