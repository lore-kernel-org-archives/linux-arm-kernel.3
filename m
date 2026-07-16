Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADC7C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zY/ojiDT9wOrbGU/PTZ4gY30hR4qiBdjxYeB7HA4/To=; b=nJcgToK2/mXlkn/GQDrUS1x1QH
	hlt2a+Jiq/LzXaaZSBGR8qFZu50cvPsdDSX4kT8MlK4poRQRLAWorkzVmwQk86HPMERujFMs+SIYV
	dog8MlXySVVKWdxFm47mBi3JxxnFSUjwyTQyzuzh4ZrGVd5fiFddxNiyIBNAOXz5QppFTjVFFEQRb
	inz8DLRhDK603Czg0jtNZIWQ6qovhy+jtkYhOQJnoyY2RunAOYhaDbbwMuU+SeNchrgU2Vn8Qv0Q0
	J2cOWx7oEwTIkpG9ZiiiHyO/VVbeDNt7jxBYajBnUKz6F2svdbEFR7eWRzi0Tqqes1Bqy/CbnP41N
	7ZfSkSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFqc-0000000GYyn-3zLm;
	Thu, 16 Jul 2026 06:45:30 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFqa-0000000GYxl-1zUh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:45:29 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3uG9X2761628;
	Thu, 16 Jul 2026 01:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=zY/ojiDT9wOrb
	GU/PTZ4gY30hR4qiBdjxYeB7HA4/To=; b=WwtWgecmJ2kp/l5zEzfO3HKvq14Vz
	uAPfcNf72mlpSRSb7wHriFsP2CpOtc0toXXT7z7d4b4gKCPEeEdOu3XzTF07wE7P
	J/Iyjhq11m7koajGO86ps1oP5KwESp3izUXLbDoK06uI6QIume9Vi5seIBKXcFcY
	B2TboqXUyu/qbgXkv52/edS509PqmskgHhbC0IIo2RnnLqLopNVwD6P5SoVFGSjo
	CtQ7TOM9STob/YBOziXs48SwC1ck0rO/FBSfLSZ2sETdy+c44YavCtr5/U6n9/Pb
	2F7RufmXkJ8gl7rl7g58L+oG+rVnrrTOVnXtl9SUWjm77k5vi3sSRn5Qg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe96tnxw6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 01:45:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDMNscrd8/Dj0Z76AYjyLHzBWWbRVjXX0UrNQH8pJB5mYY4v22lPgGUPJn2JtoRjE3+qFUF+ffyP3XHfu0D8S/4k3XL5CU4ypYSI+RkRY9NMJ6Qo3FzSgYR+UbPVaX9/UG8q23kJNR0yqqZhWK4F5M34YHefrfhSRWB6Yj5NSyqIxIjB63ixxfxcASzjwRV5JtGh5l6EvC+xODQjg03H0KE5qr9P2iktE4b9Vpa73t+bhCdpgkjBtBdfGt8BwNJWgxOyHKtJzyoS5OiPNZYCd9RcwddR4uIoPG9/Qu2CFlPc11UHitYb8/sAu1KmWpEHO024qsrahkvu3huM7yQB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY/ojiDT9wOrbGU/PTZ4gY30hR4qiBdjxYeB7HA4/To=;
 b=GUzIZZMh+FN2cdDDOxCmlvcJlc2CXNyU/tNBFpTSf8xFGuW5G5DX8KHMtI6jokfcho4mTWSpq1FvoJ+7KOTidljjxYhytdSFWQJ8vPb5z2tipIdU0UsdZokEBBty8SfuNytYzwT2l3rjiEGIshvd859fSgdFnbvNFnUzR1V8yh7/RNSsvjNFotdKxTbJyeQoE5UB5oITm0iO0i6Wp7HU40ztHKaHSOcY8WNgTLs3nQ2xtDQMxCpAzC+S13ZWLr4LTtC+vSkfWXupf9YYI4zm0eeCJLoUyGDnL8+n2xowML38jaOg1BtLCuQ5snrGW1NjkFvyCcUvHPTKw984um3PqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY/ojiDT9wOrbGU/PTZ4gY30hR4qiBdjxYeB7HA4/To=;
 b=RKIkvn7pRrxNW7E5AX1LjMOZCKjoNPgERmyGxhlb4G9UN/d8FC5PJ21rjW0qcrbzdWWrurU/EleRaMgVYIr6k3SsNSS2/nCnr3AqZ3TapLC7xDWwjcMOBP01CZcJbNPNjQksz9N9kpVmdyeWh387dwP3k3De0WkXGXIqXcpRi7o=
Received: from SJ0PR05CA0181.namprd05.prod.outlook.com (2603:10b6:a03:330::6)
 by IA1PR10MB7469.namprd10.prod.outlook.com (2603:10b6:208:446::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 06:45:20 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::70) by SJ0PR05CA0181.outlook.office365.com
 (2603:10b6:a03:330::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Thu,
 16 Jul 2026 06:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 06:45:18 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 01:44:55 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 01:44:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 01:44:54 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66G6irIr727769;
	Thu, 16 Jul 2026 01:44:54 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <afd@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <c-vankar@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property for ethernet boot
Date: Thu, 16 Jul 2026 12:14:49 +0530
Message-ID: <20260716064449.2505650-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|IA1PR10MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fbf068-4cb5-491d-19d7-08dee305ccf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|3023799007|18002099003|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: HJuDtYibxLHjk0j8tG7PsMIgxGL8mabXrSSoeom6jApgSLBMjzxx7dzgGzeoEsm0RN5TWHzNw+dDJ5IrwKSeRCkujDL7PsrfQJ7CUjzNhJhZNBhCY5VP8LP4wYTG5rcIX3ydsHy2l2KdADWJi+fwb34HThwgw+kFd51/nQSoudUcwn6A7MlQOzUl73O1ElzJsGs1vRf9oWfKfGiDt+0PpjdYLxa1bKcCbqcibm8b3zrlymwslnsCTwV/HL1DtMc/wa0rdfduXPVo8NIDXz34jPgRQrR0Yk6Ywi6tBlbcDgM7nGY/XIoGQR+docTCbebG8A+CofhOWNtAR0FDvhaicYCiz+1qCswXUfTsT3NZC5f0w3Dx/rOvQ882Qt0mCOy58+CYtUBk/9cRo9lgtgqsrFW3yJEGouODjBnh1/mihj3ssj5VWns7E37oSuIH5LKV2oca0nlzHVeN3n/uAe2vjJOV4hFelcWup8s2Rz6b4BlWtf7vo/rWO3vVpWjFlfs08tAmVvojCO3Unk4fh0St0KAjDLDl/OvP+2fsTvEtQkKWDXa8RSGLRTTr/F5vY7JMCh53//OZkZtk6p33jwcZ6Rwmn+QrobGiJi3w30gIk8e38am2LebTr1/KE1Fa3wW8U9sj/DHW6G0yeulp/OYpHBi2aTeCUUu/A4NqL5fh/+v8Yxwj2cvHBAzIaQHLW+n1PbCWf8n5PGUCwtZ8+GPlTQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(3023799007)(18002099003)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i1IGHX/qrdjY8Gip5qF7VJY18DAJawjXI7MF/txbo4mJcUhktqaqRR5M6hVOgPvEY16MSpmra8KdovilD9O/KRlC22hcPq6UDXqErPWVI13L3AkTn31hRMKDczsuem2neeVQ6xfZWCSK0jLNvBkqHMovzHCqp9JESBQ3RuUg1dLLF2oGGcauFjQHDWG5ybO98bb/i6cy/ejEpVlnG8zzjP8x4nArEiFbz8D5VI4oE/Cbx66qkSP+DKoEJy00OuISPb4jh+PvE/RwEU5b37jXPx6Nfc6pba+mnAg7E9T0HCpF26MeH0sA6Xj7hXv65sihxGWwqbF0oB4saJbocmOZlW50tFIY+DWmE4oUct8bVNd6u+G/GVM/aheZ5GRUx9OXuS/ZXIUEwtzuNq2qj41uIz/miemTltJv7gep0EO7Ev0yDvjO/UcH08UcRC6XhxkF
X-Exchange-RoutingPolicyChecked: i+qSwAFjV6/ovzL3dSRD9hP7JWwOhxKokadV8fN2ZaNQeW6I7fb4099nVkpq0Ox7OJn1AS3xLjgXY/5hJs0E6sAcIjEtrTg35T8DtLPQ5f9BVL3dNN6z2/fOQ+n70Er4bCNqW59AF0TO4GkeK4JCoA7Wv2j3k2LtcMmBYE2G7z6btfMMun1pjI0wtQZMVuFN2nEY4caMFsTSnvSYHexYhZYsIzqkFj7EzQzEScfa2tqdOlDNpOu4i8LIdYTDYlOhpAxy0JfFo9CelzrlJ6uSHB7Hb5Vtw/bsFtycqzIUgwQUK79/MokA/O47HkKzsK1HLw3sEFlCTxJSrw9obP7c+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:45:18.4734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fbf068-4cb5-491d-19d7-08dee305ccf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7469
X-Proofpoint-GUID: d2EULOKxwR_FvE3u0pgwYyuoWL-UsKuV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX3/39CvrLC3JL
 u9N4lWwUg9YC9J91HYj6TfGhbDxwlbQws8BHyqr6Hk80E/jWxxNyQ7rRO9QFMX1X8UOjo04z2lV
 nQhQdLHOSW2qQ/WB3o7gcTcrDGAJnhM=
X-Authority-Analysis: v=2.4 cv=VbnH+lp9 c=1 sm=1 tr=0 ts=6a587e04 cx=c_pps
 a=NtQEcg4T3rGzBSLVY3gzHQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=2qqIgu0zdUq--z5Wn3QA:9
X-Proofpoint-ORIG-GUID: d2EULOKxwR_FvE3u0pgwYyuoWL-UsKuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2NyBTYWx0ZWRfX6s4njAWXaDHf
 ushKJzaPvng7+HEjn1IrRUvZlm2wTpLQeGjap1olL6WLiVYNII5fWuDKnsZ6mS2144JDNW6vUNx
 Ih4YXnhTGiZs4CXkb2J9v65nV+i/67gldQ+EHqpVS9WbUb05zqU5wn0AbXnGmP+WlAWfNyfV31f
 rXOBwKNvEvm43N0WcPY/0m1TQpoe+BexGSEXZ2GUCOPc9qjBzIod6I4S9F8yX5E3EK+LbT7cGcq
 +GiJxWB2BboBXtf+Rp/TnS4QyGywP7wPAdiSct6S1z/YWT9fcNqcCpadSa0Cj7rjN5PNiPF8zoO
 DZ8ubtyoBEZvjoBWfa6tA2cEAZWrtfNeDMKU71C6vIJveKziiSXXhvPcPwCgkTjK6ZepRgp7UpL
 O+hRpfSZeAOL4bUjaAhTXs1KN0zwKOorhPoBr9ZpF2dnE0cpDdCj6gVh2RV936wI7yFQMJ22tV1
 y1XkB3rZtZjb5RFLftw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_234528_636329_D9A58856 
X-CRM114-Status: GOOD (  13.27  )
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

Ethernet boot requires CPSW and PKTDMA nodes to be present starting
from R5 SPL stage. Add "bootph-all" property in CPSW MAC's eFuse node
"cpsw_mac_syscon" and "main_pktdma" to enable these nodes during SPL
stage along with later boot stages so that CPSW port will get static
MAC address and DMA transfers are functional during ethernet boot.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Hello All, This patch is based on commit 'cc2b5f627e8c' of next-20260714
branch of Linux repo.

Link to v1:
https://lore.kernel.org/all/20260625113223.1711052-1-c-vankar@ti.com/

Changes from v1 to v2:
-> Added "bootph-all" property to "main_pktdma" node and updated commit
   message accordingly.
-> Collected "Ack-by" tag from Andrew, since I have modified a patch by
   adding "main_pktdma" node too, I am not keeping the "Ack-by" tag.

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 821a9705bb7d..59cf49a14f61 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
 /* WKUP UART0 is used for DM firmware logs */
 &wkup_uart0 {
 	pinctrl-names = "default";
@@ -241,6 +245,10 @@ &wkup_uart0 {
 	status = "reserved";
 };
 
+&main_pktdma {
+	bootph-all;
+};
+
 &main_pmx0 {
 	main_dss0_pins_default: main-dss0-default-pins {
 		pinctrl-single,pins = <
-- 
2.34.1


