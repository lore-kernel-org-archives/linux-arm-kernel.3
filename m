Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCE6C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYqgbyshNrIQMzdImSiiaRk3PvyrtMkxhCV7N7JyhFw=; b=2jhCHCGZvCxTQ1d1jYwrSOSpEE
	eD3HrFmTUJohVYdbADdISy6VVOvAhwXzAxrJ3NnvB+QoyWcKXgMFMHn9aSlH3PjXMMIB7KGgZNAmj
	Nu/QuzT2EuUiC+VywhcnDbrcT/u8efQQCStZ2SxdwzL5k0ylwhk6RbvAHiKuxjXdV9S97kcjZYDJc
	MXkCf4N5oFJ+wk30bhi6kUOmSeKafbGdtAeNvv+mYRp2Nb7GwvTUBWO4OUTB1gYH9TIUdi6hMYU4d
	78wtoF8rCuTE6hYJaeVr9s2XcK4x4Nlf1sUkByqCfNofSvyM9G28f6IXgTRqoLYabN/UBwO/cWQd1
	Rs4lQBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuIY-0000000197i-2XRs;
	Tue, 25 Aug 2026 16:46:54 +0000
Received: from mail-japanwestazon11010057.outbound.protection.outlook.com ([52.101.228.57] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuIQ-0000000190k-0b1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4YNRqErBR4xO1+M+kPzN+diVA+8NfXALsB7p44L1bYPAbCVwFXpYAY7+Q6FgJtPNXt9Yot/qF9iAqMnEFTq2NTmfKkzmkz5qk30+3pZJRgda9AVzwTkHgs8l34QTcOsruriu+i2kTocTi9CUiLSEiwivcQnDwqcuD9Re1CNhu2ieMtB0+2Mix9Na4xCbARkIaZ9GuXwq43eF1KrIil15i/llE2+jqzg6gSEfGmG9P87G+nq8sE5HHFLVbJAb8Tzyw0Osaqp+fbDLca8KUYHiYy+OhAB7kf4DMUM+4hPBGAiaGpl9048Yq+xVamxRHrxYW3x/SnhuWUz+6Xo6skF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYqgbyshNrIQMzdImSiiaRk3PvyrtMkxhCV7N7JyhFw=;
 b=Jxr1WHJRqy2IZ1zeUdIbN3RSyuI3o+WF9Od20uT6xx9+PBqpkBP0fT0tFvCqIqtglRmuDqzzsalVy94NZXjETkWtkdA9GEw24GsZGYrfg8Ta7cKHaPv87k10am3IVVRbWcP0VAaNSOPMDINddvR67EXi0mFb78tiElIs0GRMpMiG+Qz7Mq2U3DvSI7mS3aX4BbKMba/PZkR6SnzMY2ILnGkTuXD2CvsCTYHcPXpv4ZYtP33u7prBzpCo6fk5MjTXPQI7mys3S8kOLbp/4NXkXASkqwvnSr7ndBfH9ez3jnfAV43o2wjav12zL63jMn1Ll8Tqt4MD1SmN6ho2qI8Fgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYqgbyshNrIQMzdImSiiaRk3PvyrtMkxhCV7N7JyhFw=;
 b=m+B65xyFWknUfVOZlURXCVecYwLGm/+CplR8bQlQgXLClAAa4ZFqyeT0tWhtlquoH8HZNHUVZ6B2GP0xe0OPycU+zbG7OYthQe51JX3xmfIccjlGUuaUSs0WvJVhLbEokvJv6UVECz4Dh7yc0Goqrio0F722T3XAsXpnczQnzUM=
Received: from TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2be::15)
 by OSOPR01MB18027.jpnprd01.prod.outlook.com (2603:1096:604:476::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 16:46:37 +0000
Received: from TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2be:cafe::97) by TY4P301CA0041.outlook.office365.com
 (2603:1096:405:2be::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Tue, 25
 Aug 2026 16:46:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005022.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:36 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 13D5A30001CD;
	Wed, 26 Aug 2026 01:46:30 +0900 (JST)
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
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v3 5/5] selftests: drv-net: Add VLAN test
Date: Tue, 25 Aug 2026 16:45:22 +0000
Message-ID: <20260825164522.4244-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005022:EE_|OSOPR01MB18027:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ce172165-142d-4966-4582-08df02c86dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|921020|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: v/7Q2BBjfiF7VaNaCDjAt5P2+CoSIaIwKOTyU5M5ina02ZbQ4YkS/pa4cCSQmDLZDn65l+rA3vwl/nz/e1eqt0nKooas/KbsYMdc4br9z8/a0KY23NXUnz94otehfT5ud3/my69iMkQrhVCppIBf2vSKov+SuT2RdNr8XuhJ2cASrOfWozOEbwEJpYEApH+fM486KX1+4iMtG/jqrrU0ZgdvqYVTq37BnqKcl7VZR+BsvADokDjBytdCudotW1IAuHKBA0PcrU2voO/8jSrhnTkcHcNPHNI4cOdmS3e0XgDsvOsNCxNs3FI37mAfBtV8X85IUqaaIdRCWW0xYmdsP057j189vD7BEvqDrnkxsmyjKWGWA4LkjCQeRUoxXz0+7VjyiKAWRvs1WmpApyCwWHHP5t2KFathDWlcM1+F/9ZHDbIvXV7h2b3OEzpjpgX+LX/ynVUhUP4711EqSPeNcHvZqKuH61+0ixyjxS4jpFlI2eDuvubQfPMXYKLKYze53eCX5U//Tf5rVHqT+rXn+9eCYcoilJJhvY76n3OxBP14FCqo/+MgHEyhEGPBti6ONRSrU+yjPkK355FDpI1SqaWOiASedR5AMGkm9gMbW9a0F1vC5GGn/imbRFeUEgIxTP4aja1MeHrn+FKgNrZm2nstqXxcIpxJz67Ye4e2+vIBRI95ky3CAN3qxtiRcYRGMBhS4D4TGHsJWspDJ6OB4FzyYwxHuv9nwBygPvFxdN8Cs99oWBgJr4FlXZmlyap8
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(921020)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UOUJCQtsDageNl1zuY7ewdHCboyNgwqGijMsys+19lBptVcbRNAH/H80oyZmhLFW+DCfbK4slUTFINg1uIA60wtbgZt+aQjjvnp0doDPC4R/z4CtJvWGbxwXkPL2L2PaPXFVsxbOWtAfJL9zioTwX35yDynu+azQd0x7Ojc1DgAYPbQQvo3DxR50h3sliYiuVEl+3UlZSJxY/cu25gj7EKLwIRgf1kSVbjzeeunErTF/mx3QK32HLgv6aJI03xZ6db2sdABnEx+h8abMBne8GUWnOBsmncZWQLicjypBoKIi/IJBKMzXO1th4XxdtgIj8xeqfSPFAHoAl/2zsuXIIADma4jx3PJLVqZvaGsnoUA79svoNDlP7W7SgEjTdLQufdcRWYlWoH0cEgYPutLr7Mo2rAZZx003PUlVleoLjM/Df6u2rN27jfwSi1uCQS48
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:36.7634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce172165-142d-4966-4582-08df02c86dc3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB18027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_094646_211171_039B290D 
X-CRM114-Status: GOOD (  13.83  )
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
run_kselftest.sh -t drivers/net/hw:vlan.py
  TAP version 13
  1..1
  # timeout set to 0
  # selftests: drivers/net/hw: vlan.py
  # # Interface: end1, driver: st_gmac
  # TAP version 13
  # 1..6
  # ok 1 vlan.test.8021q_hw
  # ok 2 vlan.test.8021q_sw
  # ok 3 vlan.test.8021ad_hw
  # ok 4 vlan.test.8021ad_sw
  # ok 5 vlan.test.qinq_hw
  # ok 6 vlan.test.qinq_sw
  # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
  ok 1 selftests: drivers/net/hw: vlan.py
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes:
- Moved the selftest to drivers/net/hw, as the _hw variants couldn't run
  under netdevsim.
- Fixed "ruff check" and "pylint --disable=R" warnings.
- Added CONFIG_VLAN_8021Q=m to configs file.

v2 changes:
- New patch.

 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../testing/selftests/drivers/net/hw/vlan.py  | 109 ++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py

diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..886a4222c6cf 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -49,6 +49,7 @@ TEST_PROGS = \
 	tso.py \
 	userns_devmem.py \
 	uso.py \
+	vlan.py \
 	xdp_metadata.py \
 	xsk_reconfig.py \
 	#
diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index d89a9ba17655..c6c2b64bb712 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -24,5 +24,6 @@ CONFIG_NET_SCH_INGRESS=y
 CONFIG_SYNC_FILE=y
 CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
+CONFIG_VLAN_8021Q=m
 CONFIG_VXLAN=y
 CONFIG_XFRM_USER=y
diff --git a/tools/testing/selftests/drivers/net/hw/vlan.py b/tools/testing/selftests/drivers/net/hw/vlan.py
new file mode 100755
index 000000000000..79eec655973b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/vlan.py
@@ -0,0 +1,109 @@
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
+
+from lib.py import (
+    KsftNamedVariant,
+    NetDrvEpEnv,
+    cmd,
+    defer,
+    ethtool,
+    ip,
+    ksft_exit,
+    ksft_run,
+    ksft_variants,
+    set_ethtool_feat,
+)
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


