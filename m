Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06581D3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLlcShJe5zacwcN83f3SDxaOHpg6xeUc4ekG3drQ/gc=; b=x5DEmRPSD3LvyjpuRbTqPtT4j/
	Je6d1I17tp8aicq6NbQFNZB1GA2nEiC/+81AC+O9W6smEvk/JQkE/IDDGNAeo0oqdyUvxo/Mtmyue
	vLdf6VXarpNUrjqoPVb2kywWfw2DVstNpfxHt2h4CQRVX3VCJj8ZqOqBNxxWjI30ekvnLpXAkNNGc
	2RM4vwx3+EDichjM3TOaFaNYDXXRwFQh0vM41yOZJAY4dDyxZvXhQJVG6lsX+E82A535RwrzHIjKG
	gdEJjcI7b/8f128KP8o813H+UKJHihp5WawNkzhHc1vAd3nxKhTi1QryCe6cbtjVor/ad3twtE78r
	1sI1HiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8chT-00000002ct8-2Czy;
	Wed, 06 Nov 2024 09:51:43 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cAQ-00000002TJQ-3b42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:17:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HLWm035703;
	Wed, 6 Nov 2024 03:17:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730884641;
	bh=rLlcShJe5zacwcN83f3SDxaOHpg6xeUc4ekG3drQ/gc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HnfGmM5uLcyLE7yRiZT/T9JMzo+mBAJ+hw9kgvSr2XhOEJenGvyMVhZDSgCKdFNoq
	 FHNTmZb+OGK49ZB/VgvYoETi/Yu9wa77n7uA9+DM6w0eUMBSoIHqCDhHtC/1gnknpB
	 +Ec5ab24s+nxA01I/usmX18Xa+ZmWXIsuSNjHi1g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A69HLLU116896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 03:17:21 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 03:17:20 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 03:17:20 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HKZq066912;
	Wed, 6 Nov 2024 03:17:20 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A69HJ9f020797;
	Wed, 6 Nov 2024 03:17:20 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <jiri@resnulli.us>,
        <w-kwok2@ti.com>, <aleksander.lobakin@intel.com>, <lukma@denx.de>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <horms@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 4/4] selftests: hsr: Add test for VLAN
Date: Wed, 6 Nov 2024 14:47:10 +0530
Message-ID: <20241106091710.3308519-5-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
References: <20241106091710.3308519-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011735_017997_7B0D3E01 
X-CRM114-Status: GOOD (  11.68  )
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

Add test for VLAN ping for HSR. The test adds vlan interfaces to the hsr
interface and then verifies if ping to them works.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 tools/testing/selftests/net/hsr/config      |  1 +
 tools/testing/selftests/net/hsr/hsr_ping.sh | 98 +++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/tools/testing/selftests/net/hsr/config b/tools/testing/selftests/net/hsr/config
index 241542441c51..555a868743f0 100644
--- a/tools/testing/selftests/net/hsr/config
+++ b/tools/testing/selftests/net/hsr/config
@@ -3,3 +3,4 @@ CONFIG_NET_SCH_NETEM=m
 CONFIG_HSR=y
 CONFIG_VETH=y
 CONFIG_BRIDGE=y
+CONFIG_VLAN_8021Q=m
diff --git a/tools/testing/selftests/net/hsr/hsr_ping.sh b/tools/testing/selftests/net/hsr/hsr_ping.sh
index f5d207fc770a..5a65f4f836be 100755
--- a/tools/testing/selftests/net/hsr/hsr_ping.sh
+++ b/tools/testing/selftests/net/hsr/hsr_ping.sh
@@ -175,6 +175,100 @@ setup_hsr_interfaces()
 	ip -net "$ns3" link set hsr3 up
 }
 
+setup_vlan_interfaces() {
+	ip -net "$ns1" link add link hsr1 name hsr1.2 type vlan id 2
+	ip -net "$ns1" link add link hsr1 name hsr1.3 type vlan id 3
+	ip -net "$ns1" link add link hsr1 name hsr1.4 type vlan id 4
+	ip -net "$ns1" link add link hsr1 name hsr1.5 type vlan id 5
+
+	ip -net "$ns2" link add link hsr2 name hsr2.2 type vlan id 2
+	ip -net "$ns2" link add link hsr2 name hsr2.3 type vlan id 3
+	ip -net "$ns2" link add link hsr2 name hsr2.4 type vlan id 4
+	ip -net "$ns2" link add link hsr2 name hsr2.5 type vlan id 5
+
+	ip -net "$ns3" link add link hsr3 name hsr3.2 type vlan id 2
+	ip -net "$ns3" link add link hsr3 name hsr3.3 type vlan id 3
+	ip -net "$ns3" link add link hsr3 name hsr3.4 type vlan id 4
+	ip -net "$ns3" link add link hsr3 name hsr3.5 type vlan id 5
+
+	ip -net "$ns1" addr add 100.64.2.1/24 dev hsr1.2
+	ip -net "$ns1" addr add 100.64.3.1/24 dev hsr1.3
+	ip -net "$ns1" addr add 100.64.4.1/24 dev hsr1.4
+	ip -net "$ns1" addr add 100.64.5.1/24 dev hsr1.5
+
+	ip -net "$ns2" addr add 100.64.2.2/24 dev hsr2.2
+	ip -net "$ns2" addr add 100.64.3.2/24 dev hsr2.3
+	ip -net "$ns2" addr add 100.64.4.2/24 dev hsr2.4
+	ip -net "$ns2" addr add 100.64.5.2/24 dev hsr2.5
+
+	ip -net "$ns3" addr add 100.64.2.3/24 dev hsr3.2
+	ip -net "$ns3" addr add 100.64.3.3/24 dev hsr3.3
+	ip -net "$ns3" addr add 100.64.4.3/24 dev hsr3.4
+	ip -net "$ns3" addr add 100.64.5.3/24 dev hsr3.5
+
+	ip -net "$ns1" link set dev hsr1.2 up
+	ip -net "$ns1" link set dev hsr1.3 up
+	ip -net "$ns1" link set dev hsr1.4 up
+	ip -net "$ns1" link set dev hsr1.5 up
+
+	ip -net "$ns2" link set dev hsr2.2 up
+	ip -net "$ns2" link set dev hsr2.3 up
+	ip -net "$ns2" link set dev hsr2.4 up
+	ip -net "$ns2" link set dev hsr2.5 up
+
+	ip -net "$ns3" link set dev hsr3.2 up
+	ip -net "$ns3" link set dev hsr3.3 up
+	ip -net "$ns3" link set dev hsr3.4 up
+	ip -net "$ns3" link set dev hsr3.5 up
+
+}
+
+hsr_vlan_ping() {
+	do_ping "$ns1" 100.64.2.2
+	do_ping "$ns1" 100.64.3.2
+	do_ping "$ns1" 100.64.4.2
+	do_ping "$ns1" 100.64.5.2
+
+	do_ping "$ns1" 100.64.2.3
+	do_ping "$ns1" 100.64.3.3
+	do_ping "$ns1" 100.64.4.3
+	do_ping "$ns1" 100.64.5.3
+
+	do_ping "$ns2" 100.64.2.1
+	do_ping "$ns2" 100.64.3.1
+	do_ping "$ns2" 100.64.4.1
+	do_ping "$ns2" 100.64.5.1
+
+	do_ping "$ns2" 100.64.2.3
+	do_ping "$ns2" 100.64.3.3
+	do_ping "$ns2" 100.64.4.3
+	do_ping "$ns2" 100.64.5.3
+
+	do_ping "$ns3" 100.64.2.1
+	do_ping "$ns3" 100.64.3.1
+	do_ping "$ns3" 100.64.4.1
+	do_ping "$ns3" 100.64.5.1
+
+	do_ping "$ns3" 100.64.2.2
+	do_ping "$ns3" 100.64.3.2
+	do_ping "$ns3" 100.64.4.2
+	do_ping "$ns3" 100.64.5.2
+}
+
+run_vlan_tests() {
+	vlan_challenged_hsr1=$(ip net exec "$ns1" ethtool -k hsr1 | grep "vlan-challenged" | awk '{print $2}')
+	vlan_challenged_hsr2=$(ip net exec "$ns2" ethtool -k hsr2 | grep "vlan-challenged" | awk '{print $2}')
+	vlan_challenged_hsr3=$(ip net exec "$ns3" ethtool -k hsr3 | grep "vlan-challenged" | awk '{print $2}')
+
+	if [[ "$vlan_challenged_hsr1" = "off" || "$vlan_challenged_hsr2" = "off" || "$vlan_challenged_hsr3" = "off" ]]; then
+		echo "INFO: Running VLAN tests"
+		setup_vlan_interfaces
+		hsr_vlan_ping
+	else
+		echo "INFO: Not Running VLAN tests as the device does not support VLAN"
+	fi
+}
+
 check_prerequisites
 setup_ns ns1 ns2 ns3
 
@@ -183,9 +277,13 @@ trap cleanup_all_ns EXIT
 setup_hsr_interfaces 0
 do_complete_ping_test
 
+run_vlan_tests
+
 setup_ns ns1 ns2 ns3
 
 setup_hsr_interfaces 1
 do_complete_ping_test
 
+run_vlan_tests
+
 exit $ret
-- 
2.34.1


