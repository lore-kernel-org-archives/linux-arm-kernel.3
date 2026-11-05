Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451EF606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gxk+1nGK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ERWtzcge;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2ts1q+BX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UJAb5IKao7rcYiPMXVWXohjpxa1Urn10d23UrrMkpNc=; b=gxk+1nGKE4cUrqfijh7y1ujgSX
	5UH/S25XnBCQBRXhEsUR41wJeyW1w1VAFzrmxEX9fJYfOt2czQnDOEBgDSZojEbw1PTqiw4qp1iqD
	PXqVImr6mO+85WpUAGUGGThxQ5zLSJzhvoPB2moZHDTfvMS5NnAxVO8IxyLRvUvRFH/IpS/7RZYon
	bmbkb2WQK5ip9JBcTjpCOrPhrKWHcpOY9DMvSv7ZMhN0eOOnLZb70TvQ8MaGjDQFlUltL8YZ1npbM
	unWc2ynTa290rjikP2Ay6FBNrexHuVPMTpJgAlfqczEwj2uZ2sptXwL/dcMRh2b72Tpd8gACwMtW8
	4gY3qJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpu6-00000007sU1-2gsG;
	Thu, 05 Nov 2026 05:20:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpu3-00000007sTX-2dIy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 05:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UJAb5IKao7rcYiPMXVWXohjpxa1Urn10d23UrrMkpNc=; b=ERWtzcgef3s25wn3tFfk9AS/au
	MU6WbL8Yo8+OIfnu5a1OvfryRSPr8MMDm5r/WXTRMQ6K6hdYdxrgTIK+9+fTAOVTUdIIIaKgXC/Ws
	EhxETMUEbuE5HgRMgJ4leCEu9ahJYit8fKTh0cAXA8AxCBejhc1l/pcv4xO3hOE5AqdvjjFrXu1NM
	Q/4Cmz8E/iAC1s27gMBvK5dy1AN/8JZHrd+TjnBMshvMtjhpu499lZR+nV9nUOFtCWaC/OKVkmheo
	RNJLIIVIYJ3GuIvLJ3Pm3Cp9BitTnAH8m3/Bb/FRMwvhXlgOSSJLCrMZ/VSBFhizxzjP97kgDhssW
	RVlHtZSw==;
Received: from mail-centralusazon11010007.outbound.protection.outlook.com ([52.101.61.7] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpu0-00000002aPS-1WH9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:20:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skl8QnlJ4LG6FZL/BRSyRzG1ok2aqndqzQQpy7ESbpSbV8NqQKB3GZTDwpYzC9V2AHZN7GzHY5gq9CQQMbOmKft7UOwRczS2wdi+FfUaWogg4BVJ5Z3+oCU4nl42ufQtggqN4XPFuaeMQ40i48JPytOy7HayP83CvASriK+ffCF2Qyj1PZcjo87PVSbMEx0+Db0ikJoiBCAq+FbdP/iRnn1gx3FN+EjclE2hSKdMt2NbWOjAtOXn1i/kDGrtxelmQL+V5U0vOU5h1tBmmGRQORTvQYeIRVPM+sMlsxefeB+ax1qoBeha0L2SJVxXO2dFcW9EOxfN0+mWBCOsKoHCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJAb5IKao7rcYiPMXVWXohjpxa1Urn10d23UrrMkpNc=;
 b=ELZMM3Aa/j8fH39S1D5jOJMxWJmWXuEJvbd1sy5hfkQKielwN22Fd7tqLqiVCqJvm7lPui1GZXhJfIxlkZZXdOpYhfHPGchP30Beisbbr9yTMis4it/sw/CHxKCibALqEdMpzydnMa0Reoxbt1oQgH1xHwLh+r/UYfbfBDK7paxdIKssujIGal5f1POjE+aGIVOwM03kyvMC0G0Ywp+9M2zPCk1u2UsCV7u8PsFhhcKRxA6MCazuSaQCTfTioAmJUYAXUeq9aZR33NR3GtAg+F/s+fzWYza0ryRFFLDTfqLXJVX3rRgFZgNc33ve+tpwae09Mv6O9q8Zm6WbWUfscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJAb5IKao7rcYiPMXVWXohjpxa1Urn10d23UrrMkpNc=;
 b=2ts1q+BXy9THwPsXdHyebAbVflFC3wAoiNaQvhtJvyuJnjD1y1cMoppdn66JcKWPmx88V614IiUxqInc8Auedp0Dn9ZXZQFKdFHwoodvtTcAx3ggYIGgakQs7VNwXcfSu+GmUHER9PnHLEkgCRQFkOVxzzTEZCMfRGdBNca2Yfg=
Received: from SJ0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:a03:39e::6)
 by CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 05:19:04 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::37) by SJ0PR03CA0271.outlook.office365.com
 (2603:10b6:a03:39e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 05:19:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 05:19:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:03 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:02 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/6] Add AMD PL Mailbox and RPMsg support for the AMD BRAM remoteproc
Date: Wed, 4 Nov 2026 21:18:56 -0800
Message-ID: <20261105051902.1646651-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CH8PR12MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 940f73f7-4892-4818-d3d1-08df3afc4f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|261026140227099003|11063799006|56012099006|261021123027099003|261009220027099003|261021135927099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261022075727099003|261102123227099003|261021121427099003|261028144727099003|261026121527099003|261022105027099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: aU2sCRxZMn5uINF0H6HKaXlv9PaN5p+SXw16OdJjY+PxBuMBDaUMXC3NUqHv4/29PvzKIlk/AKXEOe5Fv0PcDypsnay9qhgI6hqQvRQQvYQtWIK8cwqFUDQ2UB6rE8llPlzOPQi7+GTQwcHTYHCNd8xgshuwrZVWSYuw690ZqG5+TDmP+kEGWtEVK3oS2uyfvixo6lvYH6Fqix1z0ekpjuWO4eLm51dXsD4cse73eMMjYmWqX3/qYkw8sP5vRtAY+L33luN94xi7qi5NR94SNJbJNTofh7KRZY+T+N7Bpn1I4BxbDa58H36xwQDAqP9uckUQiVLdWTfkQyI6ETpUKK9hDGMbTDmF1C4B/4WRK4+gQzZ6zfnELdNLTxttNCv8X6UZJvqSo8NpQDVfxoY4iEEAmFgiYF4Ieoeh2Plvqh17YMXXDyo9EnJYmAOFJr+z5JfFkQkqlgOUXirOVJVfwvHMvNNKrug/NZd5Sd2NjRXCYGcrojm9rHSlTZgELjMDSCeLx6UgUobs8BOZ3Ysfnsstt1RECa2MSHf3yN6WLwmXO4NAahCa1Be721rQpihjwI6OrxMifgyrJbRCXxZw0uArBExeI42PCUUVEzV585jiSp0VE/NEjlBDZElW1zA7YwL6d8QvlKnqgBVS99yDNdFcTmv00V7zmiyibaxar6c=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261009220027099003)(261021135927099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261022075727099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026121527099003)(261022105027099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bMTS4wyndssuSp2nFztN70E887gOB3brVIgmcEQU6Dil+wmQ2ZO4YYXy/+NK2iG3y8pRNp3mPaEGtlgwvPMKivhZCCU+5jYsyD3ifcX1Hc2mWw4Tik5lo19oSQbLXunBeXcIPG6cFErAmIxQGRpb6TITVwpKPGIoGIYQS2MeI7Ux2Qce4CxWUoSPNEu62J5Ucv+F7wQMH2MFkfeKqYBL2ilJVy7Ow83P7aUQUZef0gkURApKRmUlFb7UeXVReZ99VEpUlvlJ75LxbLtrj/eiJZwWvGYJGi5n1O6XlmSxsy8GwPE+kZLyRr4VkNbJ7Pj4uDqLAVbxk6CNVJP2mo0WiZ1xjzdYqTVXAnjPM5gQJ3vIEpIvDo3KCTAByVe7ZYJr+pjrZuuKLJ7ZqGgO4heKozLzUJZG6bvb2w8CgL0yx9kj5h1IYqVBrBnecyWTReXT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:04.3915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 940f73f7-4892-4818-d3d1-08df3afc4f34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_052044_332174_BB4EC4DC 
X-CRM114-Status: GOOD (  21.62  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a mailbox controller for the AMD programmable-logic (PL)
Mailbox soft IP and uses it to add RPMsg support to the AMD MicroBlaze/V
BRAM remoteproc driver, so that a soft processor in the PL can communicate
with Linux over virtio-rpmsg.

Patches 1-2 fix the existing BRAM remoteproc driver:
- Pass the device name to rproc_mem_entry_init() through a constant format
  string instead of using it as the format.
- Drive the reset GPIO with gpiod_direction_output() so a start still
  produces a reset pulse after the PL has been reconfigured, which restores
  the AXI GPIO to its default direction.

Patches 3-4 add the binding and the mailbox-framework controller for the
PL Mailbox IP. The controller exposes independent TX and RX channels. Its
interface clock is enabled only while a channel is started. RX uses a
threaded receive-threshold interrupt that drains the FIFO, with the FIFO
depth taken from the device tree. TX completion is reported by
mailbox-core polling of the send-threshold status bit.

Patches 5-6 extend the BRAM remoteproc binding and driver with optional
mailbox channels and named reserved-memory regions for the vrings and the
shared RPMsg buffer pool. The driver registers the carveouts, exposes the
loaded resource table, requests the mailbox channels at probe time, sends
virtqueue notification IDs through the mailbox framework, and defers
received notifications to process context. Without mailboxes the driver
keeps supporting load, start and stop only.

The series is based on mainline during the v7.4 merge window and uses the
remoteproc wc-ioremap and optional resource-table helpers merged for
v7.3-rc1.

Changes in v2:
- dt-bindings: mailbox:
  - Use the single compatible "amd,pl-mailbox-2.1". The Mailbox is a soft
    IP core in programmable logic, not a SoC block, so like other PL soft
    IP bindings the compatible names the IP core and its version instead
    of a SoC. "pl" distinguishes it from the IPI mailbox hardware.
  - Rename amd,mbox-pl-fifo-len to amd,pl-mailbox-depth, and explain that
    the depth is chosen per IP instance at synthesis time and cannot be
    read from the registers.
  - Add the MAINTAINERS entry together with the binding.
- mailbox:
  - Match only amd,pl-mailbox-2.1.
  - Depend on ARCH_ZYNQMP || COMPILE_TEST.
  - Do not access the FIFO when the mailbox core submits a queued message
    after the transmit channel has started to shut down.
  - Handle the receive interrupt in a threaded handler that acknowledges
    the event first and then drains the FIFO until it is empty, so a full
    FIFO can no longer stall reception.
  - Add a file header with the driver description and copyright.
- dt-bindings: remoteproc: drop the redundant dependentRequired block.
- remoteproc:
  - Keep the existing dependencies and add "depends on MAILBOX" instead
    of selecting user-visible symbols. Name the PL Mailbox controller and
    the virtio RPMsg bus in the help text.
  - Request the mailbox channels at probe time, so a missing controller
    defers the probe, and release them on unbind.
  - Free the mailbox channels before cancelling the receive work, so a
    late notification cannot queue it again.

v1: https://lore.kernel.org/r/20261014213426.2957480-1-ben.levinsky@amd.com

Ben Levinsky (6):
  remoteproc: amd_mbv_bram: Bound device name formatting
  remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL
    reconfig
  dt-bindings: mailbox: Add AMD PL Mailbox IP
  mailbox: Add AMD PL Mailbox soft IP controller
  dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
  remoteproc: amd_mbv_bram: Add RPMsg support

 .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  |  73 ++++
 .../bindings/remoteproc/amd,bram-rproc.yaml   |  21 +
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  11 +
 drivers/mailbox/Makefile                      |   1 +
 drivers/mailbox/amd-pl-mailbox.c              | 378 ++++++++++++++++++
 drivers/remoteproc/Kconfig                    |   5 +
 drivers/remoteproc/amd_mbv_bram_rproc.c       | 270 ++++++++++++-
 8 files changed, 761 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
 create mode 100644 drivers/mailbox/amd-pl-mailbox.c


base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.34.1


