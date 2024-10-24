Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172C6CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR17OZSW7xbWDhOwoXB2afulJaLK/GIoceGzWejwggk=; b=tm6N/4LD1vLIC7FX5J8SXzxi0r
	kZHWzZT9GnSdkJOpET5g0Ul5so5QPlP8cDfF4kCbjx1O225Fha7lLFPq9LeCB07Jz0X+1sDUzJJKU
	XNlLnit/trRGbqRZcYb/Hy24kNLjTdxfVogWE+DGXDO/KfqUpkh9t9gwPkA6YUIFf5qzwprYdfjtU
	rEn619d1PE7MeJlbYUE1nE66KPMKZu5gDT608rRIRYFfStyKDTFeppg6cxrhP55zwDi329t5hcf9T
	F29mnjNmEb3BG5NY51ZFzHzmSq9JJhQe6/Ss6yyedn8OpkcpisK9tXx8UVJFUpULrYfrm9jYT2Jvl
	i+3zvDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vFI-000000005ww-1pFW;
	Thu, 24 Oct 2024 10:39:12 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v7f-000000004TY-30CD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:31:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OAV6i9054005;
	Thu, 24 Oct 2024 05:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729765866;
	bh=NR17OZSW7xbWDhOwoXB2afulJaLK/GIoceGzWejwggk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y3fMsBd6DPWrecQ6AqVWprha/GtdeiWLSxY2tL9oOUwiUKgPo1YLc64iZznxpvBW/
	 rxo00XozE3k1yP7gtHRuyg3tRu9ec+d8eEQjM4PJJSr2Exdnjlbfy4w9HtsyAdfeVK
	 9SB0PTbd41hNUkmCYLOavOsNaHVRnuUUTfOfwWTo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OAV6HQ023086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 05:31:06 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 05:31:05 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 05:31:05 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OAV5BS000717;
	Thu, 24 Oct 2024 05:31:05 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49OAV4g6024608;
	Thu, 24 Oct 2024 05:31:05 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>,
        <jiri@resnulli.us>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH net-next v2 4/4] selftests: hsr: Add test for VLAN
Date: Thu, 24 Oct 2024 16:00:56 +0530
Message-ID: <20241024103056.3201071-5-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024103056.3201071-1-danishanwar@ti.com>
References: <20241024103056.3201071-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033119_873191_44B0F16B 
X-CRM114-Status: GOOD (  11.36  )
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
 tools/testing/selftests/net/hsr/hsr_ping.sh | 63 ++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

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
index f5d207fc770a..fb7c7d3fb6c7 100755
--- a/tools/testing/selftests/net/hsr/hsr_ping.sh
+++ b/tools/testing/selftests/net/hsr/hsr_ping.sh
@@ -2,13 +2,15 @@
 # SPDX-License-Identifier: GPL-2.0
 
 ipv6=true
+vlan=false
 
 source ./hsr_common.sh
 
-optstring="h4"
+optstring="h4v"
 usage() {
 	echo "Usage: $0 [OPTION]"
 	echo -e "\t-4: IPv4 only: disable IPv6 tests (default: test both IPv4 and IPv6)"
+	echo -e "\t-v: Enable VLAN tests"
 }
 
 while getopts "$optstring" option;do
@@ -20,6 +22,9 @@ while getopts "$optstring" option;do
 	"4")
 		ipv6=false
 		;;
+	"v")
+		vlan=true
+		;;
 	"?")
 		usage $0
 		exit 1
@@ -175,6 +180,50 @@ setup_hsr_interfaces()
 	ip -net "$ns3" link set hsr3 up
 }
 
+setup_vlan_interfaces() {
+	ip link add link hsr1 name hsr1.2 type vlan id 2
+	ip link add link hsr1 name hsr1.3 type vlan id 3
+	ip link add link hsr1 name hsr1.4 type vlan id 4
+	ip link add link hsr1 name hsr1.5 type vlan id 5
+
+	ip link add link hsr2 name hsr2.2 type vlan id 2
+	ip link add link hsr2 name hsr2.3 type vlan id 3
+	ip link add link hsr2 name hsr2.4 type vlan id 4
+	ip link add link hsr2 name hsr2.5 type vlan id 5
+
+	ip link add link hsr3 name hsr3.2 type vlan id 2
+	ip link add link hsr3 name hsr3.3 type vlan id 3
+	ip link add link hsr3 name hsr3.4 type vlan id 4
+	ip link add link hsr3 name hsr3.5 type vlan id 5
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
+}
+
+hsr_vlan_ping() {
+	do_ping "$ns2" 100.64.2.1
+	do_ping "$ns2" 100.64.3.1
+	do_ping "$ns2" 100.64.4.1
+	do_ping "$ns2" 100.64.5.1
+
+	do_ping "$ns2" 100.64.2.3
+	do_ping "$ns2" 100.64.3.3
+	do_ping "$ns2" 100.64.4.3
+	do_ping "$ns2" 100.64.5.3
+}
+
 check_prerequisites
 setup_ns ns1 ns2 ns3
 
@@ -183,9 +232,21 @@ trap cleanup_all_ns EXIT
 setup_hsr_interfaces 0
 do_complete_ping_test
 
+# Run VLAN Test
+if $vlan; then
+	setup_vlan_interfaces
+	hsr_vlan_ping
+fi
+
 setup_ns ns1 ns2 ns3
 
 setup_hsr_interfaces 1
 do_complete_ping_test
 
+# Run VLAN Test
+if $vlan; then
+	setup_vlan_interfaces
+	hsr_vlan_ping
+fi
+
 exit $ret
-- 
2.34.1


