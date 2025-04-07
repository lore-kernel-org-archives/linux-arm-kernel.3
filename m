Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700CEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dpUmMt+S/OI2c2iE1k7M1eJLqralXYhPrDshRzYb5k=; b=ap9veBGpr0r5tU
	iOUppVdvIjxUYBDb2qRGxI73S48eCBIw9KbbYdQeUfKtjOHCRUyMlwiObSmPReHRw3kJWbhj7S02L
	Dk7NNaGNu9KOj9Yjd4xMOQA+7ZFqcLOYtRCKufMgDBAZooXbN+iA/UKZRx68Q5hX5OTwIvW0/Jp2q
	hIK+dISPgM2ZS05SNeITSZV2fSF2SjahzDiBGon5k8heuwnVndOqRfBNmI3DOSYlXh756NOPjVIcD
	sqzaEE6YVROK3IFPIBWR5jfjLgOq9QNu8A+cFG8uJYHa076LuX0yYn7AmC/hOyO0lGySCgIKNv5j4
	Y4fq21/SpuUZYq2hOlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nKz-00000000hLR-2ojO;
	Mon, 07 Apr 2025 14:20:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nJE-00000000h3w-0tVb;
	Mon, 07 Apr 2025 14:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22FC75C5E59;
	Mon,  7 Apr 2025 14:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDAFC4CEE7;
	Mon,  7 Apr 2025 14:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035522;
	bh=DnrMjwW8y80OVJq5tsXLXyJch9UJ6gA4haWZSBKjZGw=;
	h=From:Subject:Date:To:Cc:From;
	b=CJALCunY5XwA6fJnawsx9DBCukkaaLIXr0IGlmoYPmZNgWE24Uc2Oj8jZBxmTEysv
	 CRhOPVHuSlXMB+pgd5W91CoFgAw/3aiFj2w6cTaXv1UxOTvU/6UrJFpnYtyMGHYMiG
	 jMlwk9Y7Y2PpC3O6+dtq1fnpKT0PCuo/oQmQuG/m2BrkV1rpBLeACRcC6FQvVHhKfO
	 xckGzy+5mPwDiDiV1tYGEuqgaBXMO4Gz72fGIdZIDp+GavAD0YqV5sDRAJtSq22Inm
	 TPDWihIpBAojtfsSKQxAMS8VPeRlaL7tLTaa1+QwFTH4s6VUIqf75G/eKyXS3srDzG
	 VGtm9bDXnqdBg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/3] Add L2 hw acceleration for airoha_eth driver
Date: Mon, 07 Apr 2025 16:18:29 +0200
Message-Id: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXe82cC/x3MPQqAMAxA4atIZgP9sYtXEYdUowaKlVZUKN7d4
 vgN7xXInIQz9E2BxJdkiXuFbhuYNtpXRpmrwSjjlNUWSVLcCJcQ75N8YAzGIyvv1NyRNdpBTY/
 Eizz/dhjf9wP4+ayfZgAAAA==
X-Change-ID: 20250313-airoha-flowtable-l2b-e0b50d4a3215
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071844_296198_57F0C0DA 
X-CRM114-Status: UNSURE (   6.18  )
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

Introduce the capability to offload L2 traffic defining flower rules in
the PSE/PPE engine available on EN7581 SoC.
Since the hw always reports L2/L3/L4 flower rules, link all L2 rules
sharing the same L2 info (with different L3/L4 info) in the L2 subflows
list of a given L2 PPE entry.

---
Lorenzo Bianconi (3):
      net: airoha: Add l2_flows rhashtable
      net: airoha: Add airoha_ppe_foe_flow_remove_entry_locked()
      net: airoha: Add L2 hw acceleration support

 drivers/net/ethernet/airoha/airoha_eth.c |   2 +-
 drivers/net/ethernet/airoha/airoha_eth.h |  22 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 224 ++++++++++++++++++++++++++-----
 3 files changed, 215 insertions(+), 33 deletions(-)
---
base-commit: 61f96e684edd28ca40555ec49ea1555df31ba619
change-id: 20250313-airoha-flowtable-l2b-e0b50d4a3215

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


