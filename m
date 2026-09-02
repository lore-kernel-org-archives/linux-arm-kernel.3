Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C9C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUWG69b+8W7QCI7X0cbPtOV4RaGoCN51mNnYh+LDOwU=; b=AcYS2fA+OilHcZV9wIY/qcDHcm
	6EZNY7Nkty67nnHBJW9BMKV+KshlW0qPss7oBn2M2qF4rzzL4fVLE34/oHgGBuHBfCTiDmCNacgXW
	+RvvWCBciFSua5MXn7cgQ+StDH5gkXIpEratGCoIvSrP6Cwn+tGlRoIVXZ6BBkarcrFXPU4RXxCqW
	2xRSxBdTisDRANL7n+rIBMF2oSI4z9V3elkFXqVJL+7yaldckJJ9FioR0b6zXJ4mb/Bcf4kZYZVAX
	73x6YiWuyr8YyheYuBY8EeawEd+SUpYkeHNi9DYJDYbveRDE0HXScwIfjjxL1ja2onAv/ShICb55X
	Cm/Zkrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nFy-0000000F99Q-0Tf3;
	Wed, 02 Sep 2026 15:52:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nFu-0000000F97L-3Uu1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:52:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2529b3139fso176968166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788364325; x=1788969125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUWG69b+8W7QCI7X0cbPtOV4RaGoCN51mNnYh+LDOwU=;
        b=Y9IiFBdUU8QqUXcaGtTlnK0YhHPltPftL3f5qc96Ji6htocFWPpw8d+P2f2DxbdcLq
         PFZY8Z6E/J43GnQpKwwHqjTcK7A1Gjbe77h4UiAuq8K9QAAcTl2tAeyCM2VAbNnsSQA/
         P/F/fiAJVRQiX7FZ1dAWG8v2uPJMeE46WV9hH5C4w4g/mXbu/fTQ5cOB3P/Sxdki2G48
         fc59mJT+xwhkmNyYsgVSeI5ziUwRnOMgmxomz3iyv8KTwNhHqRF1YXGPYMY6aLr4z2wo
         CTrmk2jEurbCy2Lr6PzwEjFTzqUUfMqnFiFDyuMSrgxW6tFRDUuZwiRY5ILKIE+1C6lb
         6LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364325; x=1788969125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUWG69b+8W7QCI7X0cbPtOV4RaGoCN51mNnYh+LDOwU=;
        b=lR2SjL/sDCguVcdsWAE8RHhjQN5oZRrxTaqVBvUbx4cCFY/A02GwLMXCKg5Rdyk+M/
         Vo7C/O1ALvzm+aSZwXalMVJDmBym75PoEgvlj4E1WQy/RAsKq5HYWamjchm5/F04FGMd
         mtflm3Qmf7DjgVx5xifS5g8jY+Cs327cNo6yzLd4g55/WfzvCq9vF+dDiLI6D/Vh4Tly
         xwm3Nxb4WdCNQxAA1M4HqKCCilXdasfw5yL9sdPBJ5LvbgWh+Aa0XxYkm3uecoQdulOR
         QfTiCkhql+lPBZiNo/Is1pdC5uQ9VdaEzAnO2cGC3M0JaorrJAFjIbdTJjG8M0OfQF+C
         c3yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZk0Qs8btgAs7lPZqpQOILSdoRMaVXfLvEMeTrh2mgRnXntlAPtLHoHf/YC1g24z0N640vMQu3pfM61QllN9yO@lists.infradead.org
X-Gm-Message-State: AFuF++lJU6fC461MKYOMZIPUsh4nZmpEKVW4I94gMbTdsY4lDtocwjRx
	QzFNaOFdZGQ7Ov15rvPXOuwkOarwIVgDMmJ45KSwCU2DzmyilPRLTTdJooeQhkxhKw==
X-Gm-Gg: AYBFou0zij5GY0QkQ6T0Hr3zCfptmE9jgHz6F22gwhZIzhfIwSWB0GvspPgXpHWQ1uX
	g0XjSjVaLasHHI0Xc2wYnbapEpK673eK9GGrGR9Z6Mr+KF9LNE6A3t8PdBJJTkB8I7AyEQyk087
	763mrEjDyD6OLzLenEMycN6QMWcy63Z9T/bNQq8ASTzVHJmj/rBbnMZ8v/aKO95IPYWU9nwTvrU
	mUNDzegnV0x7To7QD7x+soOM5CDtVaFG2NTl5WjxFQ+N0vAJeewQT/GC9kyPpeGu+tOKkWvxHSk
	xSrEYOcNVj6eTHKEr2vziXVkBozsZheKch6HJMg5MxesdtDkZ8pg1NUBhIKWDO5vqgzaNRaLUQO
	E1ZyloMvdXLkgkrDYcb4Wfs2JN3w4HH5oroGV2ol5jae2aTGVUh4VuJYw/CKB9ps3O3xZdZMx4i
	VFmW8A9ulr0wRyK6HX25gGnKyKmqTbDAxkV6N83ervqIGis/DE430vPCMghOmx5l3foLs0APQWs
	Q71lUdw5g4ER68vHcNQqrSNKzwupu7I79/5jSacVR4nRkgXMRC1/pLSGTqP/72FgHWMKFcIrNFS
	2k0hWpnGGjRkqYR/vO5eJp0Gla+1jKYQ9j54p0Zal5UERMTpX6Q10Xdah0LHpUf3mJjG7MJyxrr
	I1RUGpigRCJSZRVomtSc7TRiAMsMxegq/ZbwjRiILkxP3t4YfTa2+69DDQWrfCoapE0zH78yuc0
	pHhrqNZ+bmF5UW8wqbDCSElA==
X-Received: by 2002:a17:907:dab:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c25d52b715amr356033066b.8.1788364324671;
        Wed, 02 Sep 2026 08:52:04 -0700 (PDT)
Received: from Desktop (pd9513d53.dip0.t-ipconnect.de. [217.81.61.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03fbb75sm160187366b.49.2026.09.02.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:52:04 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v2 2/2] selftests: netfilter: nft_flowtable.sh: check the priority a flow carries
Date: Wed,  2 Sep 2026 17:51:36 +0200
Message-ID: <20260902155136.4963-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902155136.4963-1-julius@bairaktaris.de>
References: <20260902155136.4963-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_085206_896196_1CECDBDA 
X-CRM114-Status: GOOD (  13.85  )
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

Count, on the egress hook of both router interfaces, the TCP packets
that leave with priority 0:3 and the ones that leave with none, first
with no priority set and then with "meta priority set 0:3" in a forward
chain that runs ahead of the one adding the flow. Without it no packet
carries the priority; with it every packet does, in both directions,
including the ones the flowtable forwarded past the chain that set it.
The test runs at the MTU where the fast path handles the transfer, for
IPv4 and IPv6, and fails on a flowtable that does not store the
priority.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
New in v2.

 .../selftests/net/netfilter/nft_flowtable.sh  | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..ab7732358e1d 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -458,6 +458,106 @@ fi
 	check_dscp "dscp_fwd" "$pmtu"
 }
 
+check_priority()
+{
+	local what=$1
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
+		echo "$failmsg: Unknown priority check" 1>&2
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


