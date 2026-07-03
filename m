Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F716C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pISo1EQbS4fWa5bk32TXcq117bsZs0pRiPKDZqvjaeU=; b=4ZnLaqX5r3jHMxPAFA8OzH2/y3
	nzztE9ORoTIKExCdwlh0fVDth4hvTLfKJQkyx/pUnXEC+gjHG1XOt4EOhiFuQy7Zi0uILJZPbxHr5
	thmNLCP7+bsmEhrnTwg6sNsKAw3sQdHkRN32hkHPmmpI+etyc3hnp5qdA27ofOzr2MYf/bs34d6yG
	DCQAr+r6xOm1nvZJozzrBB5xFPNSjkNJoZ5urY0m9CZaP5YPraPVEV8PYjoK03GLm84nEKpSI7SJ4
	cHSgWUKjncsTie2c029v4G2UMgX9oUu8VlnWhYpQ2L7NCTd+O74bVeN07uhmPuhSwi5R0BqsoHwaS
	y45mYgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfebz-00000007DUD-14Lf;
	Fri, 03 Jul 2026 14:11:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeby-00000007DRw-119R;
	Fri, 03 Jul 2026 14:11:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A18A4600B0;
	Fri,  3 Jul 2026 14:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03ED1F000E9;
	Fri,  3 Jul 2026 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783087881;
	bh=pISo1EQbS4fWa5bk32TXcq117bsZs0pRiPKDZqvjaeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dFoZeiMwnOxNIZ+cfG1EIOcKFwnVYmYCp3XAphOq87UpVoLRWe2jY38lQgJCBFcYg
	 Iaug88ukyFrus/Ajz5CzdFzPncNwNQvySQKkNfvi9Qei2FH8ptx5IB/R665/V+3Byd
	 oZnZoaZ225+YICMh7UwVktAN5qVNYDPRcp+eyrraRvHNSgYFcNY5rtRtDYQRRrKC9K
	 okX3Pl4pQ97JP9jUFhTWIrj4KANjFGQND8TvAeL8uIL1HokHxnlw4gLJvUq+nWNDZF
	 11HVfDe2Xqh/E21E3ztTY8A5dxDwhZdfs+CDuZa2NB8iUlMHWRqCnRhzOJjX7ya9pF
	 mEKtWaePW5tuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 03 Jul 2026 16:10:39 +0200
Subject: [PATCH nf-next v4 4/6] selftests: netfilter: nft_flowtable.sh: Add
 IPv4 over IPv6 flowtable selftest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-b4-flowtable-sw-accel-ip6ip-v4-4-00398cd12382@kernel.org>
References: <20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00398cd12382@kernel.org>
In-Reply-To: <20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00398cd12382@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org
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
 .../selftests/net/netfilter/nft_flowtable.sh       | 33 +++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 08ad07500e8a..b14c80c6e372 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -579,9 +579,8 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 ""; then
 	ip netns exec "$nsr1" nft list ruleset
 fi
 
-# IPIP tunnel test:
-# Add IPIP tunnel interfaces and check flowtable acceleration.
-test_ipip() {
+# IP tunnel tests:
+test_ip_tnls() {
 if ! ip -net "$nsr1" link add name tun0 type ipip \
      local 192.168.10.1 remote 192.168.10.2 >/dev/null;then
 	echo "SKIP: could not add ipip tunnel"
@@ -594,7 +593,9 @@ ip netns exec "$nsr1" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr1" link add name tun6 type ip6tnl local fee1:2::1 remote fee1:2::2 encaplimit none
 ip -net "$nsr1" link set tun6 up
+ip -net "$nsr1" addr add 192.168.210.1/24 dev tun6
 ip -net "$nsr1" addr add fee1:3::1/64 dev tun6 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun0 type ipip local 192.168.10.2 remote 192.168.10.1
 ip -net "$nsr2" link set tun0 up
@@ -603,7 +604,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6 type ip6tnl local fee1:2::2 remote fee1:2::1 encaplimit none || ret=1
 ip -net "$nsr2" link set tun6 up
+ip -net "$nsr2" addr add 192.168.210.2/24 dev tun6
 ip -net "$nsr2" addr add fee1:3::2/64 dev tun6 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
 ip -net "$nsr1" route change default via 192.168.100.2
 ip -net "$nsr2" route change default via 192.168.100.1
@@ -636,6 +639,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.210.2
+ip -net "$nsr2" route change default via 192.168.210.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP4IP6 tunnel" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -653,7 +665,9 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun0.10 a
 
 ip -net "$nsr1" link add name tun6.10 type ip6tnl local fee1:4::1 remote fee1:4::2 encaplimit none
 ip -net "$nsr1" link set tun6.10 up
+ip -net "$nsr1" addr add 192.168.220.1/24 dev tun6.10
 ip -net "$nsr1" addr add fee1:5::1/64 dev tun6.10 nodad
+ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr1" route delete default
 ip -6 -net "$nsr1" route add default via fee1:5::2
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6.10 accept'
@@ -672,7 +686,9 @@ ip netns exec "$nsr2" sysctl net.ipv4.conf.tun0/10.forwarding=1 > /dev/null
 
 ip -net "$nsr2" link add name tun6.10 type ip6tnl local fee1:4::2 remote fee1:4::1 encaplimit none || ret=1
 ip -net "$nsr2" link set tun6.10 up
+ip -net "$nsr2" addr add 192.168.220.2/24 dev tun6.10
 ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
+ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
@@ -690,6 +706,15 @@ else
 	ret=1
 fi
 
+ip -net "$nsr1" route change default via 192.168.220.2
+ip -net "$nsr2" route change default via 192.168.220.1
+
+if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP4IP6 tunnel over vlan"; then
+	echo "FAIL: flow offload for ns1/ns2 with IP4IP6 tunnel over vlan" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1
@@ -782,7 +807,7 @@ ip -net "$nsr1" addr add dead:1::1/64 dev veth0 nodad
 ip -net "$nsr1" link set up dev veth0
 }
 
-test_ipip
+test_ip_tnls
 
 test_bridge
 

-- 
2.55.0


