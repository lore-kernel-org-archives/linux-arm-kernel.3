Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17995CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esWdgOfs9Wzt1Uyp+6oHKkzWVHIGhqXnG75NMMgWNio=; b=jUAjQzf6rJP0otafSkb6IEvOw/
	/r6Uehb9sysF7Fx7T6mzcBYBJNiPWVmMsVR0nDfx249Yqyvk+KsYMjrDeSlOy8nisXeJ3EQxCMIsP
	J5E/Q4pCqCULSSLh1IX/Ne3PPiqzPI/vGpO/Ao581kbaVLrOdOmyc+HgMWLL/rt61JUMcni4zjk0w
	zQm6HcN7t81bLS9VMcWAppNVl8alyAArPOLdXluBe4M4PDUXG6J7GcTo+H+5UVp/xWCQhzl5od2GT
	7J5n8LfFPBfY34rC/hE7NyvS5XxyoAhobbb13GAfeWuO8mhF/1UcMX3ulFnbF61PQqtlg/Y+70gWY
	VKnNrWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH6A-0000000GZDZ-0IhW;
	Tue, 05 May 2026 14:50:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH68-0000000GZAt-1VH5;
	Tue, 05 May 2026 14:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C66086024D;
	Tue,  5 May 2026 14:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D6BC2BCF5;
	Tue,  5 May 2026 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777992607;
	bh=3ZPHgJUJ+F1jDAjlmGng3iYAAGgk6pserxwVK3Vie+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FxVtxukuMwqI1K18z0mLjqbsUTyQm3hgwOSeoez32kgT4E2HBu0Y5TNG+urszbQvH
	 mv+gN5DRApDtFbxHcbBYTCCgkB+rzh3+Ii0mEIWBqIGd717qbpl1BHj+nNJLKMo4GW
	 8R6+nOav5bpsGaDAyGY90rAbMWCcBUhOyvFm81tNGhl5U7QUyTJseSwFZ6Xmpjw6FY
	 Tqjg+Ggky3/whxDb7B+TQPfot5HdDF+DNhhAdokdOcQHdtN3CWdX1gK2DZjWNtJEYA
	 skIe2TDwZOwFfNMTHqapklgjA2dyOrMGeOnI0SYAP5bRrCon9hoKd3EkrO6xfLF4Yu
	 WpeADmEVoPq6A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 05 May 2026 16:49:26 +0200
Subject: [PATCH nf-next 4/4] selftests: netfilter: nft_flowtable.sh: Add
 IPv4 over IPv6 flowtable selftest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-b4-flowtable-sw-accel-ip6ip-v1-4-9ac39ccc9ea9@kernel.org>
References: <20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org>
In-Reply-To: <20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Similar to IPIP and IP6IP6, introduce specific selftest for IPv4 over IPv6
flowtable sw acceleration in nft_flowtable.sh

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../selftests/net/netfilter/nft_flowtable.sh       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 7a34ef468975..d9995549f8a6 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -594,7 +594,9 @@ ip netns exec "$nsr1" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr1" link add name tun6 type ip6tnl local fee1:2::1 remote fee1:2::2
 ip -net "$nsr1" link set tun6 up
+ip -net "$nsr1" addr add 192.168.210.1/24 dev tun6
 ip -net "$nsr1" addr add fee1:3::1/64 dev tun6 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun0 type ipip local 192.168.10.2 remote 192.168.10.1
 ip -net "$nsr2" link set tun0 up
@@ -603,7 +605,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6 type ip6tnl local fee1:2::2 remote fee1:2::1 || ret=1
 ip -net "$nsr2" link set tun6 up
+ip -net "$nsr2" addr add 192.168.210.2/24 dev tun6
 ip -net "$nsr2" addr add fee1:3::2/64 dev tun6 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr1" route change default via 192.168.100.2
 ip -net "$nsr2" route change default via 192.168.100.1
@@ -636,6 +640,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.210.2
+ip -net "$nsr2" route change default via 192.168.210.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP6IP4 tunnel"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP6IP4 tunnel" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -653,7 +666,9 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun0.10 a
 
 ip -net "$nsr1" link add name tun6.10 type ip6tnl local fee1:4::1 remote fee1:4::2
 ip -net "$nsr1" link set tun6.10 up
+ip -net "$nsr1" addr add 192.168.220.1/24 dev tun6.10
 ip -net "$nsr1" addr add fee1:5::1/64 dev tun6.10 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr1" route delete default
 ip -6 -net "$nsr1" route add default via fee1:5::2
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6.10 accept'
@@ -672,7 +687,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0/10.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6.10 type ip6tnl local fee1:4::2 remote fee1:4::1 || ret=1
 ip -net "$nsr2" link set tun6.10 up
+ip -net "$nsr2" addr add 192.168.220.2/24 dev tun6.10
 ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
@@ -690,6 +707,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.220.2
+ip -net "$nsr2" route change default via 192.168.220.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP6IP4 tunnel over vlan"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP6IP4 tunnel over vlan" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1

-- 
2.54.0


