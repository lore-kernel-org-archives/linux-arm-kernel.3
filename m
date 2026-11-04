Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E58606C907
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xl0ais0B;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBd5+hyj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LzwkETqbDZJdiCDCXxV/B+4TCTcZNaRbMiQQ/of3r7w=; b=Xl0ais0BPChFjT
	E0CuPddYQBO30w6/e7gWTM9Xy8kBKvFNlVSFl2cxq+awuszyYw3MzM0kjESCu1q4BG6KFo+eHBE3K
	XIY0Udj41rAl9A6O57NbCBPRUC1CNb4Sn01d+fPMIx1u/sBnuVKrfVFFltY7qSnVSNRVSzcoulRtq
	peQyMWEYyc5ZCRV96LezEb+4iG1bpG4rLKRpQtZrMTnGXkBARIhLQNK8M2y3LpNdMShFHTTGCYiWe
	b5FmN7RcrV45gbGA29ZZDtinVQHhU5sBveQpMtgY2mRMoxbcls+KEr9wNQCQoFvg4yon0wQUD+9CS
	yBqWF+mK7bE0hn7Su2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiax-000000072W1-0ItA;
	Wed, 04 Nov 2026 21:32:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiat-000000072TN-0lDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F95660F00;
	Wed,  4 Nov 2026 21:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15461F000C1;
	Wed,  4 Nov 2026 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827950;
	bh=LzwkETqbDZJdiCDCXxV/B+4TCTcZNaRbMiQQ/of3r7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QBd5+hyjNsvhnvYbaryFx+s9/8GAc1Nbd0Ps7glZyZIeLaqzm0eQwbjpnXrhvvoQN
	 jW94r9aza+G2yLzsVDCgzD9f0PFYPtHkGMDPiFNxPljNl+bM4X5GFSEeXWzDUqF/0t
	 rysLHP0lYeyTMU3yD2s+d3WGq6SscUxSf1OZuGBbKwpeI7QsugaD+hy3tsQWlzkPu2
	 qc0akz545+sZc9tGJndlHp+jJC4gGM9tAMq6KpaN9gtDRkJ4tluPqktACWN5gWc+Wi
	 QnacAkwot7JQqVnpdUssZEBLKoQ/zEXs0+TrQlMCkWbVj8KiNF7grFkuElpYDoLsqn
	 51JaiJ07lnYZg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:22 +0100
Subject: [PATCH 06/16] ARM: configs: u8500: Enable IP routing and filtering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-6-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable advanced IPv4 routing support for U8500 systems used as network
endpoints and gateways.

Add SYN cookies and modular nftables connection tracking, filtering,
logging, rate limiting and NAT support for IPv4 and IPv6. Build TUN,
virtual Ethernet, bridging and VLAN support as modules for VPN and
container networking.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 04e6a89b040e..f59685399794 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -55,9 +55,25 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_SYN_COOKIES=y
+CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_NAT=m
+CONFIG_NF_TABLES=m
+CONFIG_NF_TABLES_INET=y
+CONFIG_NFT_CT=m
+CONFIG_NFT_LOG=m
+CONFIG_NFT_LIMIT=m
+CONFIG_NFT_MASQ=m
+CONFIG_NFT_NAT=m
+CONFIG_NFT_REJECT=m
+CONFIG_NFT_FIB_IPV4=m
+CONFIG_NFT_FIB_IPV6=m
+CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
 CONFIG_PHONET=y
 CONFIG_BT=y
 CONFIG_BT_HCIUART=m
@@ -85,6 +101,8 @@ CONFIG_BLK_DEV_DM=y
 CONFIG_DM_CRYPT=y
 CONFIG_DM_UEVENT=y
 CONFIG_NETDEVICES=y
+CONFIG_TUN=m
+CONFIG_VETH=m
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
 CONFIG_BRCMFMAC=m

-- 
2.56.0


