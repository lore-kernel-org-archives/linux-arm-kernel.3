Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC1C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRr0TzpF53PaZtIYcVOkvN9p2lYiIMAe1RKswjGZ/OM=; b=iUX53qzbA+cBQM3sz1kN8cdyEW
	F2BNxy2Wp9sJWlislkkYUQMTdLwjRfcgqZHlFdYBzLA7ddYVzJGAJVxEmkmFz10BChDxg7ZeMb+kf
	XHd1/h0uiHRfhSgTpLF6HRe+kNCbezexIUKm6/IMEA4rI2+WsyObdF3dU1u32o6b1TW8HILGQJtQr
	aaAvwejKLSOY5Foh0D7q3+9+YJJ71w2ocwISmq2tOFMi8He3p8bh/6QUalalGefFCyH2VYTUc9Ky8
	Ia0LOWwdt2a793WEUKd96/0U6nGpP3pINp7yC/2l2nT6GKrUJ9c1g/EMwCN1bKBizRegWLH9jOi0p
	eK4ANBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSlr-0000000DsbH-49At;
	Fri, 21 Aug 2026 17:11:11 +0000
Received: from mail-japanwestazon11010067.outbound.protection.outlook.com ([52.101.228.67] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSla-0000000DsSI-3BkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 17:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1EuAMWHf9N2PTAh7asJaI/RWOLjunp2ZmE3U0IkJT5OjlzdCO44Ry3O8bkrbM8hKMhzGtWJPN6JNsoONS22Af/5GyKM7/D+RkimNmkqSWNxdOY3WoXPGSUeQcZiZwhOfseIQLRCov2tKd2b59XtiWy6JW9P3Skq0B8JvrfjzPhWnkJ5AeTZUKWcV3XRjeqmrstjszZetsUWc+FRzKnJOjlW6rYuxoGvrrWuSZhlF8ywnMl8Q2VqHuX/FfOJVE/78hUqnmPnG2YLzsg1qNOKe4oLWE/pvSB8apR70Ed6R3lQm83QczV1GUn6qSR5FIccKuA1Kl2He5b0oIxMUstMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRr0TzpF53PaZtIYcVOkvN9p2lYiIMAe1RKswjGZ/OM=;
 b=tsQKB2vUsadkO1yiPM69FmCT2alFh+x8pbJO9phOiXAaAqCAFqagbW2gEx7SrEJuEufAzGNECnx6TEZj/A7q3keIfVhSgsIvH3OFZOvtuHh1heL42SMzvKR9yjmIZ1Zd9bPr8SlU6c2+aomur//AsoVY7BOf36GO/zfh4oaEevbDBAYsPZlY1dNDIQG5wvgQq+17ekS1Z28WQ8oyoRowFWgcKjqilTlIH4ZQsAFBVMPfAlIWs+YyRNaoHH+ZBbVscgSvCfqk07FuCWTXhX4kdRchIqjwv4gDzje/XMjrcGZk0JAxnRXwnzVYfmL8lA1/gtFUQpWufI/QYl62NPAe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRr0TzpF53PaZtIYcVOkvN9p2lYiIMAe1RKswjGZ/OM=;
 b=KUqMPliENB5do6Uv8c5+pTXFAGRGeaHwtqShvuCR24sQWCHLFudIHaD9BJNhG5ryfQw4rZi1bFt11FMYwWqEsf9G+OuxYuBTNUWvIC3n9ZmnL5IhvDIBokPn9VXLCPojv65PammS+dPM2/N1lz15naRGkVZwdPOCWw/c6i7NJ64=
Received: from TY4P286CA0140.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:37f::7)
 by OS7PR01MB17563.jpnprd01.prod.outlook.com (2603:1096:604:441::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:46 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f:cafe::f) by TY4P286CA0140.outlook.office365.com
 (2603:1096:405:37f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:44 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 4A11630001F6;
	Sat, 22 Aug 2026 02:10:39 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Date: Fri, 21 Aug 2026 17:09:59 +0000
Message-ID: <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|OS7PR01MB17563:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b7da9a1-f421-4246-9ceb-08deffa72337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|921020|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1MQhYnvDRZzYdeFXu1Z3GIV27Wl4VoYYEPafWEEGDtiUbCkhjXI1J9+mnNSq4i6wmWSHPS5UvysZaBK/r+bZivY5j0EfaFA689iCG+k9bGas+lJvES0SKpBUXUq8XmZ6+AW+D97vzPlnA8wn7MqXx6krCs/ewf+lo/W2j8RTYyMXrbCFEF2I5B7fjDVK64UYW/RQWaOerdNKsbZkEj3gY1jQjQCpl/rbDpdNNRYYt8NHqkNmeK5n4UlwJBHDXMXM5BC55l/FGHJIyVDxkjLS0SsUUSyd0yHfts0tbdlQdnrnFUJoYQAALUJOkvB5ZVxOaKfR8MQfLTbDWCJ0y4O7hNEqTz4npTpG4SwaXJ6dy2mUOEXd2PErkSF3Lssn6lcpdPS+bsl0Ut+/5I1DMyH0CsZQUB2dOYLk6mcFnjcmksmNGzTi47KMwHzID27C5n7vV3NkaAzBUTAkqJMBx87z4P2FUCsBQ6zV1PowDeD0NWTY0/iaDXprNe+lS8FBksd7KV5ANktlZl8++UKXa0CxX5UVsKj+KxrerhsecRAaIZL75l5r/ooeRX+WLddBLJ0I/7itVpumSVTLc4YdM5pHqIfHuFMExoo6032wm+nlmOVjwthFQ9dp2n4FA85H5F4+0S8Y/W4ec+GBEbmcgBzfs3+0M2t5zxnwN94yQb3AENEN0MHZY/vdbs6V0JyfbRNXSzhbsm7SOOlX00O6J6eqbpjiJMazoNeST9xyHdupqKbsBEPC8xksMQLO+APWQ5sw
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(921020)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eI4KyESr01/CxVTtydMA+pX2i5EIIH6tnAa3jeglh5dtB4e23b1BRnm+fkPcfGqed+wwId3ZmcZrfaU5bPzs8qhjqXpxZ0PEyyXowYgW7EZtjDlMCSvzD0uxiYyY/Nb6ct9IAKgzsthOwukU0tAJNQwbAEj7eFRqQbt2ncIlQnVIALeSmRxCM5em0zhs4ypI1QJpk/Zo67RoQ//hsVSLWUamTP5OsM6ZA3aOxhiiQFzMDFgmVP7wLfoDRtu+4tVo04Kjsq4njFLU8JxdJNbY9fFe3G2VhCYSQfFZIvR+9qF41IJVF8Xtoc0TEusqcribmX3AmIeRLNxpKesY3qRwtDi6DnI11wlwMr1caQqiGn9JNB3ovSOVnu+Q32l7sJgYG8id+FD8++og3zhJYNvOB3v8eOi+eh9+1XYNBufhuFEaBoIrxqD0YpvLHE/oppnl
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:44.8150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7da9a1-f421-4246-9ceb-08deffa72337
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_101054_825801_50D41BC1 
X-CRM114-Status: GOOD (  13.97  )
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

Add a test that validates ping traffic over VLAN interfaces. It aims
to catch drivers which mishandle hardware VLAN tag stripping, in
particular QinQ.

Three VLAN configurations are covered, each with hardware VLAN stripping
enabled and disabled:
- a single 802.1q VLAN interface
- a single 802.1ad VLAN interface
- an 802.1q VLAN stacked on top of an 802.1ad interface

NETIF=end1 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
run_kselftest.sh -t drivers/net:vlan.py
  TAP version 13
  1..1
  # timeout set to 360
  # selftests: drivers/net: vlan.py
  # # Interface: end0, driver: st_gmac
  # TAP version 13
  # 1..6
  # ok 1 vlan.test.8021q_hw
  # ok 2 vlan.test.8021q_sw
  # ok 3 vlan.test.8021ad_hw
  # ok 4 vlan.test.8021ad_sw
  # ok 5 vlan.test.qinq_hw
  # ok 6 vlan.test.qinq_sw
  # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
  ok 1 selftests: drivers/net: vlan.py
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes:
- New patch.

 tools/testing/selftests/drivers/net/Makefile |   1 +
 tools/testing/selftests/drivers/net/vlan.py  | 100 +++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/vlan.py

diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index d5bf4cb638a8..56c1dc16f8e9 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -24,6 +24,7 @@ TEST_PROGS := \
 	shaper.py \
 	so_txtime.py \
 	stats.py \
+	vlan.py \
 	xdp.py \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/vlan.py b/tools/testing/selftests/drivers/net/vlan.py
new file mode 100755
index 000000000000..82822a4b7bb5
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/vlan.py
@@ -0,0 +1,100 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+VLAN tests.
+
+Validates that ping traffic is sent and received correctly over 802.1q
+and 802.1ad VLAN interfaces, with hardware VLAN stripping enabled and
+disabled.
+
+Test cases:
+  - 8021q_hw:  Traffic over a single 802.1q VLAN, HW stripping on
+  - 8021q_sw:  Traffic over a single 802.1q VLAN, HW stripping off
+  - 8021ad_hw: Traffic over a single 802.1ad VLAN, HW stripping on
+  - 8021ad_sw: Traffic over a single 802.1ad VLAN, HW stripping off
+  - qinq_hw:   Traffic over an 802.1q VLAN stacked on an 802.1ad VLAN,
+               HW stripping on
+  - qinq_sw:   Traffic over an 802.1q VLAN stacked on an 802.1ad VLAN,
+               HW stripping off
+"""
+
+import os
+from lib.py import ksft_run, ksft_exit
+from lib.py import NetDrvEpEnv
+from lib.py import cmd, defer, ethtool, ip, set_ethtool_feat
+from lib.py import ksft_variants, KsftNamedVariant
+
+OUTER_DEV = f"vlout{os.getpid()}"
+INNER_DEV = f"vlin{os.getpid()}"
+
+OUTER_VID = 100
+INNER_VID = 200
+
+LOCAL_IP = "198.51.100.1"
+REMOTE_IP = "198.51.100.2"
+
+
+def _vlan_add(base, name, proto, vid, host=None):
+    """Create a VLAN device on top of base and bring it up."""
+
+    ip(f"link add link {base} name {name} type vlan proto {proto} id {vid}",
+       host=host)
+    defer(ip, f"link del {name}", host=host)
+    ip(f"link set {name} up", host=host)
+
+
+def _vlan_setup(base, addr, outer_proto, inner_proto, host=None):
+    """Create VLAN interfaces on base and set an IP on the innermost one."""
+
+    _vlan_add(base, OUTER_DEV, outer_proto, OUTER_VID, host=host)
+    if inner_proto:
+        _vlan_add(OUTER_DEV, INNER_DEV, inner_proto, INNER_VID, host=host)
+
+    dev = INNER_DEV if inner_proto else OUTER_DEV
+    ip(f"addr add {addr}/24 dev {dev}", host=host)
+
+
+def _setup(cfg, outer_proto, inner_proto, hw_strip):
+    """Configure VLAN stripping and create the VLAN interfaces."""
+
+    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
+    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})
+
+    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
+    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
+                host=cfg.remote)
+
+
+def _vlan_variants():
+    """Generator that yields the VLAN protocols and the stripping mode."""
+
+    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
+    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
+    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
+    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
+    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
+    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)
+
+
+@ksft_variants(_vlan_variants())
+def test(cfg, outer_proto, inner_proto, hw_strip):
+    """Run a single VLAN test"""
+
+    cfg.require_ipver("4")
+
+    _setup(cfg, outer_proto, inner_proto, hw_strip)
+
+    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+
+    with NetDrvEpEnv(__file__) as cfg:
+        ksft_run(cases=[test], args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.34.1


