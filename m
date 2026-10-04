Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E95CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHUtQGoQ43VDmpGd3bfBB5J/hFSSTUqRFc74DU6+NPk=; b=yN6j/xQ1f/BvYf16kwQh0nAKGu
	OUGEsYHcEky9IGiTEnJpDWMBx5OGHwWcG4u7Q8Spv/mclHCHa1EwCDmDpDjyRxSuBT5vMRp70Cdda
	HKF9La64D+leefnYfRVk5sTyhKOUtLDMedq1SrQfC+fgL7ItqGmrZYMmPi1EAFgcpBHwRhcqeTRUe
	t/Pi6DIKmalznrSXVpP3zECz7EEl7wRe9b6t0KFBQElR1PTMRMn/jsXeZD0J/IfWNi0K3NNtwoYLA
	ZQifp4dSfdnyHuWuFjJWzUkPiJbBNNwQuTOVW3686uRvaAsKnx0ElnnIOpm7rwk3dZQCUkRpl7sNC
	nJROEY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpS-0000000F5nh-1LQD;
	Sun, 04 Oct 2026 17:16:50 +0000
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPpN-0000000F5h4-2zVi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 17:16:47 +0000
Received: by mail-ed2-x0d.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so1117188a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134204; x=1791739004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHUtQGoQ43VDmpGd3bfBB5J/hFSSTUqRFc74DU6+NPk=;
        b=putEpqN5sv3rzaY8Hy1gk7VsyC/6bwXHaU3jprc+YQ9QyvjNsw6HdAfaDqgBQaUbfX
         Uv7jJyq7xQ9qW7RqoAzMgdTAQfuViwcuaPo6BuU6unLN4AK7Ye3M+n5lWSjfHV73gaje
         Z6AW+9A6tqu55JZlgT0611bF64z96EbMyingnmXf1xK79X2geUyaVEYim5kasCliAcKC
         PfV1OOhqOn6meV54E5WZlL0gn2YHGjVh1QgHSnWOx2cbttk48+jCsSN/BZ0GXG+gq8ng
         riW36CpVu4Y7P7qB0ecNmlJVS52VFNymkFMgnjXZEFnELLwLhlMsLS/HnRZydXN912QH
         9ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134204; x=1791739004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHUtQGoQ43VDmpGd3bfBB5J/hFSSTUqRFc74DU6+NPk=;
        b=CRFNZeH3vGQxNxjJQ7lUE172W9EaiYaHxv9P+Pn84NCxcQhJNt8xptwWoJOWPqG5z+
         od6L5F/w+6wCdP+c0lF6e+fQyVkWGBRcijL+gJJ4V34w5gLYAVPQwJLIM5Gv/x+u0O9X
         i1s88iBpBCqKPdGArz9QarW5mss8BjBg98WhferSxHj16z+siDBQRi5qsoo8opC8ghzm
         bIZeyDFGsp587hsVzxn7yy3c7Sfb0egI+2e6fYsWZFJBfFldi0kGaErVOpRZgwhnGKvw
         5b3D30AqxSlCaZ4yMPCK2NjY00bZg1Rnc0mtqr7fCTdMICv0oGW9Uc7H+oKFoK1YtuN7
         w5fQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4tRWyBA1YpO2AlPzaZlxP92YWra8BPmTcopdOEvTka2+2uyf7S7p/tZblxqVD6CMf2lt0ySzgv9YdYQXl+we2@lists.infradead.org
X-Gm-Message-State: AFq9FYIe4ETPEYr8b/G69KhsWn2qNAV1By32DwfGp2vh8HQvHf4Q3z6R
	HvgyM42CGA2p7o2W/P3ztQnYViVW6tQUXTPz0BR+0Zh7cQAU6+TjlAAzcMphiL10rw==
X-Gm-Gg: AYBFou0UtxzxPAds+XYCbSEzxSeRT4/cBk963L3tyeQePBTShS4b0QmDZwAw3MAPaXA
	dgRYEX1QWTP/nhhNJbyr8yvHr8dq4Eanxz3MaWZMub3U2e983Xk+g2ghBN/scJjMaWZRaOE+BoC
	einwc69yCEppje1DsjFW2K6BtOReHdj3BWqsQzfs5P6ffoUVPn2vTI9xfJKzwHdKCVIpAJkmc1f
	IxzYzdDcLRJYzZ2H1PALJKLN0/8qLdLgUpLcfuITq22ppPqHcHDZFHRRjfbkOo5fjRz2z1Tpfd4
	0ApPo/hRRredq03vqgbi5qVuvtV8ghcF4it9pUPtO6f+AZBhThSyXJa0zs1kE7Mtpg6k8pofzA5
	LdBUq8U2aN3xFEAsrd81Wh/NUt/pRxekWOYj3CK3UymDQBJB6/DkL+ftERktUVojhddEneCZZgG
	OZxHfM1kORMIufntQO4BKyueSFzAwCbJfcG1885N7R5feyeeaYzndEA6DimYI5DDjY3O0/Qx5ni
	ZVrBe+kmZqh5wq/pGVQfFUZRY0xyo8xHkYD7sz0VGWNGg9ntRQuLA7S2AzLmDzjYJEoECjjvyBv
	+W9NZsStcuCI3LH55AbGRvFARGlN66kAE3yttUGSaI8oPB3wGK7/EwCFmmEWlbB1A6FamIIJTX3
	4fXxZILS0EwuqoBN+QVXJI2dCeIN5h3l8sw/uS0JvXlGS7qbWFGYJq/OwTBh9vHDwubpgZFfR9c
	dbty5xfhcfW055ubWtJLmbL70=
X-Received: by 2002:a05:6402:52c1:b0:6ac:7737:e50d with SMTP id 4fb4d7f45d1cf-6af9e2fd054mr5882545a12.29.1791134203816;
        Sun, 04 Oct 2026 10:16:43 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 3/3] selftests: netfilter: nft_flowtable.sh: check the priority a flow carries
Date: Sun,  4 Oct 2026 19:16:36 +0200
Message-ID: <20261004171636.3545085-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171636.3545085-1-julius@bairaktaris.de>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101645_801232_43F3C47D 
X-CRM114-Status: GOOD (  11.55  )
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

Count the forwarded TCP packets that leave with priority 0:3 and those
that leave with none, first without a priority and then with "meta
priority set 0:3" ahead of "flow add". With the priority set, every
packet must carry it, including those the flowtable forwards. Runs for
IPv4 and IPv6.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..73c7b1ec2208 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -458,6 +458,106 @@ fi
 	check_dscp "dscp_fwd" "$pmtu"
 }
 
+check_priority()
+{
+	local what="$1"
+	local pmtu="$2"
+	local ok=1
+
+	local counter
+	counter=$(ip netns exec "$nsr1" nft reset counter netdev priocheck prio3 | grep packets)
+	local pc3=${counter%*bytes*}
+	pc3=${pc3#*packets}
+
+	counter=$(ip netns exec "$nsr1" nft reset counter netdev priocheck prio0 | grep packets)
+	local pc0=${counter%*bytes*}
+	pc0=${pc0#*packets}
+
+	local failmsg="FAIL: pmtu $pmtu: $what counters do not match, expected"
+
+	case "$what" in
+	"prio_none")
+		if [ "$pc3" -gt 0 ] || [ "$pc0" -eq 0 ]; then
+			echo "$failmsg prio3 == 0, prio0 > 0, but got $pc3,$pc0" 1>&2
+			ret=1
+			ok=0
+		fi
+		;;
+	"prio_fwd")
+		if [ "$pc3" -eq 0 ] || [ "$pc0" -gt 0 ]; then
+			echo "$failmsg prio3 > 0, prio0 == 0, but got $pc3,$pc0" 1>&2
+			ret=1
+			ok=0
+		fi
+		;;
+	*)
+		echo "FAIL: pmtu $pmtu: unknown priority check $what" 1>&2
+		ret=1
+		ok=0
+	esac
+
+	if [ "$ok" -eq 1 ] ;then
+		echo "PASS: $what: priority packet counters match"
+	fi
+}
+
+test_tcp_forwarding_set_priority()
+{
+	local pmtu="$3"
+	local proto="$4"
+	local dstip="$5"
+	local dstport="$6"
+	local lret=0
+
+ip netns exec "$nsr1" nft -f - <<EOF
+table netdev priocheck {
+   counter prio0 { }
+   counter prio3 { }
+
+   chain egress0 {
+      type filter hook egress device "veth0" priority 0; policy accept
+      meta l4proto tcp meta priority 0:3 counter name "prio3"
+      meta l4proto tcp meta priority none counter name "prio0"
+   }
+
+   chain egress1 {
+      type filter hook egress device "veth1" priority 0; policy accept
+      meta l4proto tcp meta priority 0:3 counter name "prio3"
+      meta l4proto tcp meta priority none counter name "prio0"
+   }
+}
+EOF
+	if [ $? -ne 0 ]; then
+		echo "SKIP: Could not load netdev:egress for veth0 and veth1"
+		return 0
+	fi
+
+	if ! test_tcp_forwarding_ip "$1" "$2" "$pmtu" "$proto" "$dstip" "$dstport"; then
+		lret=1
+	fi
+	check_priority "prio_none" "$pmtu"
+
+	# The flow stores the priority set before it is added, so the packets
+	# the flowtable forwards leave with it too, in both directions.
+ip netns exec "$nsr1" nft -f - <<EOF
+table inet prioset {
+   chain forward {
+      type filter hook forward priority -1; policy accept
+      meta priority set 0:3
+   }
+}
+EOF
+	if ! test_tcp_forwarding_ip "$1" "$2" "$pmtu" "$proto" "$dstip" "$dstport"; then
+		lret=1
+	fi
+	check_priority "prio_fwd" "$pmtu"
+
+	ip netns exec "$nsr1" nft delete table inet prioset
+	ip netns exec "$nsr1" nft delete table netdev priocheck
+
+	return $lret
+}
+
 test_tcp_forwarding_nat()
 {
 	local nsa="$1"
@@ -516,6 +616,11 @@ else
 	ret=1
 fi
 
+if ! test_tcp_forwarding_set_priority "$ns1" "$ns2" 0 6 "[dead:2::99]" 12345; then
+	echo "FAIL: IPv6 flow offload for ns1/ns2 with priority update" 1>&2
+	ret=1
+fi
+
 # delete default route, i.e. ns2 won't be able to reach ns1 and
 # will depend on ns1 being masqueraded in nsr1.
 # expect ns1 has nsr1 address.
@@ -572,6 +677,11 @@ if ! test_tcp_forwarding_set_dscp "$ns1" "$ns2" 1 4 10.0.2.99 12345; then
 	exit 0
 fi
 
+if ! test_tcp_forwarding_set_priority "$ns1" "$ns2" 1 4 10.0.2.99 12345; then
+	echo "FAIL: flow offload for ns1/ns2 with priority update and pmtu discovery" 1>&2
+	ret=1
+fi
+
 ip netns exec "$nsr1" nft reset counters table inet filter >/dev/null
 
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 ""; then
-- 
2.53.0


