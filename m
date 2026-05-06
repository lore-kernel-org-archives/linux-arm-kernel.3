Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B2CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiUNvrQbf7F9OhMxs1fl7AQ0lcIcYKBmvu2kYFhhgKI=; b=v8ThXQ9cuwF8lg56gJqCGDGLi2
	B+pz71YDVhQuuHRmftgZrvMzsdcgcgDPen/yUY40BUuYpXawvRVNBOquiQKL+hrEaZ1bxQAxz5ZPK
	Dk4RG0fjMDrp+gkzb/w+w6QU24kyS4Ie1tFeHiQo+0J1rUxxhAgtnr+DHsaDP3wGrHBvuXER9EQvi
	n1T+SwSyDXAZYZfHehChe/blE3C8lUTIhCkfpDyl85wdgRCQVxHNXgzemPB+gKYXM8IUse/f9QVPZ
	VENXp4yqg2Pc9CeaLupjSwRqneVuGpQ6AHb6anK8EUohAxxzoAy2Xr2Ks4cNXBKG9808OmeBKa+5f
	+eo0VZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg3B-00000001eY9-3Sv9;
	Wed, 06 May 2026 17:28:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg39-00000001eTc-1JfU;
	Wed, 06 May 2026 17:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1CC66014B;
	Wed,  6 May 2026 17:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405A9C2BCB0;
	Wed,  6 May 2026 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778088522;
	bh=nG5MSbEtJnJ3VjKmGgmeUZikkFX/7RM7ASOLsgkhen0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t/JJutyF0hz3rVAXbGzBl0SsGu7bmtn1WearY2at+HjJCg1Sh9vma9hD/d3oqMttZ
	 FFUaLbGwDnUEmiwzJl/uXF6Y8/V4YuYV7/lMYykJA3JLWrwHwq3B7944/CLbt1oLQ6
	 4EOS4T75nWxA3Ywq2rOBDBZCLadWzt1yg/sIaMOCSZmZVQGxvsUg8k4Ou+qDdWHmhZ
	 /bnsC85wmN6fa9nC2DkZ/Z7J8QhomiDp6JL1VIdTiXBe1XrFLHsTxGH2L36SKY0gqu
	 3bj39ZJOrgsSy8WeI299LSvQxxips61g4uxbRahEVW7N1msIy9DyyiIkMiNUaF//P7
	 RZLP/3NI8xCfA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 06 May 2026 19:27:37 +0200
Subject: [PATCH nf-next v2 6/6] selftests: netfilter: nft_flowtable.sh: Add
 SIT flowtable selftest
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-b4-flowtable-sw-accel-ip6ip-v2-6-439fd427726e@kernel.org>
References: <20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org>
In-Reply-To: <20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org>
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

Similar to IPIP, IP6IP6 and IPv4 over IPv6, introduce specific selftest
for SIT flowtable sw acceleration in nft_flowtable.sh

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 tools/testing/selftests/net/netfilter/config       |  1 +
 .../selftests/net/netfilter/nft_flowtable.sh       | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 979cff56e1f5..c46604574653 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -30,6 +30,7 @@ CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_SIT=m
 CONFIG_IP_VS=m
 CONFIG_IP_VS_PROTO_TCP=y
 CONFIG_IP_VS_RR=m
diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 219339dbaf6e..6527e27b9121 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -597,6 +597,10 @@ ip -net "$nsr1" addr add 192.168.210.1/24 dev tun6
 ip -net "$nsr1" addr add fee1:3::1/64 dev tun6 nodad
 ip netns exec "$nsr1" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
+ip -net "$nsr1" link add name sit1 type sit local 192.168.10.1 remote 192.168.10.2 ttl 255
+ip -net "$nsr1" link set sit1 up
+ip -net "$nsr1" addr add fe01:3::1/64 dev sit1 nodad
+
 ip -net "$nsr2" link add name tun0 type ipip local 192.168.10.2 remote 192.168.10.1
 ip -net "$nsr2" link set tun0 up
 ip -net "$nsr2" addr add 192.168.100.2/24 dev tun0
@@ -608,6 +612,10 @@ ip -net "$nsr2" addr add 192.168.210.2/24 dev tun6
 ip -net "$nsr2" addr add fee1:3::2/64 dev tun6 nodad
 ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6.forwarding=1 > /dev/null
 
+ip -net "$nsr2" link add name sit1 type sit local 192.168.10.2 remote 192.168.10.1 ttl 255
+ip -net "$nsr2" link set sit1 up
+ip -net "$nsr2" addr add fe01:3::2/64 dev sit1 nodad
+
 ip -net "$nsr1" route change default via 192.168.100.2
 ip -net "$nsr2" route change default via 192.168.100.1
 
@@ -622,6 +630,7 @@ ip -6 -net "$ns2" route add default via dead:2::1
 
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun0 accept'
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6 accept'
+ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif sit1 accept'
 ip netns exec "$nsr1" nft -a insert rule inet filter forward \
 	'meta oif "veth0" tcp sport 12345 ct mark set 1 flow add @f1 counter name routed_repl accept'
 
@@ -648,6 +657,19 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP6IP4 tunnel"; then
 	ret=1
 fi
 
+ip -6 -net "$nsr1" route delete default
+ip -6 -net "$nsr1" route add default via fe01:3::2
+ip -6 -net "$nsr2" route delete default
+ip -6 -net "$nsr2" route add default via fe01:3::1
+
+if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
+	echo "PASS: flow offload for ns1/ns2 SIT tunnel"
+else
+	echo "FAIL: flow offload for ns1/ns2 with SIT tunnel" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -672,6 +694,11 @@ ip -6 -net "$nsr1" route delete default
 ip -6 -net "$nsr1" route add default via fee1:5::2
 ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6.10 accept'
 
+ip -net "$nsr1" link add name sit1.10 type sit local 192.168.20.1 remote 192.168.20.2 ttl 255
+ip -net "$nsr1" link set sit1.10 up
+ip -net "$nsr1" addr add fe01:5::1/64 dev sit1.10 nodad
+ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif sit1.10 accept'
+
 ip -net "$nsr2" link add link veth0 name veth0.10 type vlan id 10
 ip -net "$nsr2" link set veth0.10 up
 ip -net "$nsr2" addr add 192.168.20.2/24 dev veth0.10
@@ -689,6 +716,11 @@ ip -net "$nsr2" link set tun6.10 up
 ip -net "$nsr2" addr add 192.168.220.2/24 dev tun6.10
 ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
 ip netns exec "$nsr2" sysctl net.ipv4.conf.tun6/10.forwarding=1 > /dev/null
+
+ip -net "$nsr2" link add name sit1.10 type sit local 192.168.20.2 remote 192.168.20.1 ttl 255
+ip -net "$nsr2" link set sit1.10 up
+ip -net "$nsr2" addr add fe01:5::2/64 dev sit1.10 nodad
+
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
@@ -715,6 +747,19 @@ if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IP6IP4 tunnel over vlan"; then
 	ret=1
 fi
 
+ip -6 -net "$nsr1" route delete default
+ip -6 -net "$nsr1" route add default via fe01:5::2
+ip -6 -net "$nsr2" route delete default
+ip -6 -net "$nsr2" route add default via fe01:5::1
+
+if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
+	echo "PASS: flow offload for ns1/ns2 SIT tunnel over vlan"
+else
+	echo "FAIL: flow offload for ns1/ns2 with SIT tunnel over vlan" 1>&2
+	ip netns exec "$nsr1" nft list ruleset
+	ret=1
+fi
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1

-- 
2.54.0


