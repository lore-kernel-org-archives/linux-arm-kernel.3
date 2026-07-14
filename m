Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFBEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D4g7fHjFlUTnkGegHCvzPFLtfuTdt+pTlJAAdXAU7M=; b=q8TeKOD3pE0mMcd+sdXxsU0HiT
	xWQdMg2YHFvwsj+Z5fh23FRkSBF01lV0UzjdSt78BPVP6+7T8O/ySjmpT9EpMpAt3Vq9Jgqbfc0UX
	bBQXoFl3HRrqoNTEAT1Owvq4635/Nn+SH5Gp32X+wu/9Qhgztkht5VGkX/V19m/lyqDnIgIhqR95x
	HZ0CA8EOJqKWjFVOvlpGhUodwIlRVb+mv8xXIYjjhl/Jc0G6xg7Y0py/FcZnXfJPyxfuyrhKtMlo+
	6cCO6L9JJ1wunZE2rvf8Isl6eXiuSIsVjZ1PJ2eC3YFsqgZ0QIsEYAQGHh/K8oj4yjK1I6vaK97kI
	DpWxlyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgw-0000000C1JX-21I1;
	Tue, 14 Jul 2026 12:56:54 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgm-0000000C19G-3HPc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:51 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBhCpf2126481;
	Tue, 14 Jul 2026 07:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6D4g7fHjFlUTnkGegHCvzPFLtfuTdt+pTlJAAdXAU
	7M=; b=CHSWX5DBtq4lc1FHNHM/rDE7NeTW4FnLdp/ETogv77MvNCEJlC4v5kKIS
	+bZUUhwWofY00rAbD3AKLOuLsYILHtBUkdfyy2LW/RyL9DMZPKRfYZozpneOTBEs
	pcjKQXkqHNwtJ3ACqJmpurt31S4u12T0ah5WJAy+8ZIjlxEUm4+pM9NA/JHlTEvN
	uiZK73Se5vv9ZGs13b8OBwWAY1h0o1OuQyU228HLWSvuG++gJTitpyPSlzH6SWfl
	jphp8yPIpCJ5spt9ay7JX2g/7rJ9+A+1OkJ5Atb75k7KELBzmmZRLyAasyKiGxew
	pH8g1ypCmMCIbJ098Mi9b/zVTDiAQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdmg30bt2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR5Y/PrvdZ5qTpGmBKY3VmJkXcfi3CRsDTuAxkfzn1HN9fB2yQaiUBIVEK00zZGAhAQq9BFyrOY9IiiHhKfLIcqbpSVz/HxOlR4EaWoSZ15p0a1SMiFoh8iwTdwpwT65sGc1SQFaicUg/wKiB0aXnfRXFvuXjhlDhPSYS5xTJRJu09153BK2urPFkUBDzeF4DfUJR0FteFhiu6BbPnO2tVL3qDyuKl2V8HP0mzk2MUdaiRvH6OYRSB7iU/ZDkZZI8g9r6pKkF0hHnDy8MUSaQDnJjfoowHAkcVSZHNkNB5GFDYF3S78ypw6KFVGDMWGAwRAWqyiz8y8bKWf6QD0v9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D4g7fHjFlUTnkGegHCvzPFLtfuTdt+pTlJAAdXAU7M=;
 b=Au3gwqUvB2edKZYwyGIsTxZoFVH8VRqzcmHkXhi6boQ7eETXIfsSBS9cvbQegumb+OV24Ek3aq3qai+YjPZyHxHIGJke/sSlU13ls24r4u/9lBoilbrnZGygko+47It/VPTm2iWZgYJ+pfGV286rdVN3QtY4zVIqEErMvbmZ1pciP2XDx5r1h+Jzca8qVoWh8UYmdKQuz/6SIqcvAwnfbwBOK2RQFc1MRtOLn38c+qxwivObmcYkp0Yjzu+2JEO6Zh7TklBELcwNUZiQGqWGoJkhYYWUMLogAHBeiclCIn4bYi57jpcZSHH7DjLukZWKeIO/euZVjGWDGgJtCSs4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D4g7fHjFlUTnkGegHCvzPFLtfuTdt+pTlJAAdXAU7M=;
 b=RWL3fDr4r8YY9oorH9fE1LJvS2xu3PyJ/bm/Dr0wfQPVWJhK3M0cG84hRq/q6dpJUCYH01C1yTVs8gS9OwUlg6Lnna7rjvlJvkCHaTS5SSSiCMdhTMaPnH3MsCoLjWgJSBqFgF31vZ6LSpyjUWVIoAaMBU8QGhCOmiomuAruNiI=
Received: from DS7P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::15) by
 DS0PR10MB6272.namprd10.prod.outlook.com (2603:10b6:8:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Tue, 14 Jul 2026 12:56:30 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:8:25c:cafe::13) by DS7P221CA0023.outlook.office365.com
 (2603:10b6:8:25c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:23 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:22 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:22 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fX546300;
	Tue, 14 Jul 2026 07:56:18 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 12/22] arm64: dts: ti: k3-j784s4-main: Add DDR nodes for J784S4
Date: Tue, 14 Jul 2026 18:26:03 +0530
Message-ID: <20260714125607.3304375-4-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|DS0PR10MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: aadbaee6-4905-4940-d348-08dee1a74ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: p4pqSWX0gkXhWNI7Oc9ILFpm3K0t4cE1cJbUv6P1pA38DinjmeDWqJyYhJV6dG8IIXtNlzaue9/4SRxnNkRrK8oHGFaTkdd6Ukv4QDDTY53XnchgszLM1JJu6KT/zQLFMOiWX+PBfnhf/TrWAkxqr1RIiL13pjOJk0HEjeKN0O6pcDepMyh1Qm3PTYy0jj3F2I1LkU2i7rxqI4B4b/LPlcAsZSlcXiBgecb9QluLU3atYb34wDBAgbbhdjRcGt7y9YxDjtG+I3ptmamYeflmTWEWYcsPYOdhKJXyFERvGcM4omhsyYaqrzpELwZoNCptY0aHnaLWphUxvHIxNKEpRiNEu9F0YU7iNGh6Fx99pnwQYRy+IIikQaCHoqRQ/PON2uYjzUFum1jNWiApUxgAT0sE+NhOfNrbAy2P8IBpQtCOyOjF/L+LtvOw4Xhi625b11raVBKlS43ZeTjVYonXcHY1hnPd2eA+Xa8GHpYMp2e54LpsO941/+mgSoBFPz99JSnh3fUCx2vs0/EFnyh6V2FJlbNc8/FqVP4bedbvx3zi8lBHXDnu1A13546MLK6aGM2KlBlqU7ROSj9Jhqcpcp1+Dy0BKOL4dbqVylN6K54pxH/WzqyXMNI0eODkjgEW5rnUBKaWuZ8ZB+3dduetxLTOTIrrqiVgW1/OTb0z8bRIcN3hqHA7mFrgeOOYgl/sHR4KVluFX0CA/tnTiYYlMw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vf9Y8mtzkgmhcfL2BauNox3GmF88qaHFg41E40iCStizB1Z2AGpGZ7Kc82pl2iV/BruXEcupWBgwtv11ySNW0zSj9TwpnXtvlxfhh5G+2bKWjxMgAtvyeCo7YeSFtk9N3pknCw09Ox8ekuk4XnubZ7L8Hf1nAHebiDByOOtVPISxg4WjLNMbUCzsl6QBCL5pnoInO5JSAboAukSpK+O+dYx+OlYi8WmhudJnxyus6dQ/sAD7dPA2onghkpn/+Nh11VRyHIDH5qHFCrXVcyAiKYOUrY6KkIyMOYS4TTuEuUV8OSgHIDpOQlr1M8h+Bx8w7tv7F3oSFI4lgQpLtYQu6dXrRxxLgIiGlTZ8V7LL8xiR8QOT/XGhbGo4CnIBs+dJwPP1mng0kpH1gyRWsxwev2C2dcVrrup6G1G5pqG3KUlplSOo0IAysC9ykQIiiKT5
X-Exchange-RoutingPolicyChecked: McX4H1+Hmv1ytaipH1GHKsAOzd2v0rnK6r0i7oSpTsrmIUY36hdTriVin3TXd31mKWGEVOYT5TBYelgwGcKNEI4WLJ07a7ajlNxnoK70aYTu2bJC2UDH10Cx/SYNkFJFU4T6Ffoxbf4Ngf59XcKZqZfapMJyvgv/ZkGLTgjafJ+cNFVvXl8Q/ntOlXfnX8XKbzhG7VHOBlvPb9xOfjufZCRpgbfW7UKixvW0/L1R8scCw+grQzVLn7wzVtZaIadOrENzgDHN3xWkcB8saIw5FqBYeTctnZx+bnbmHf/zUHxpFeTkhc4g192sB7nuYW6Q0/q1+qPCUmlqcND07O+4UA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:23.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aadbaee6-4905-4940-d348-08dee1a74ef8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6272
X-Proofpoint-GUID: NtXOrt2csHvuFoZC0RcGEl_5y4I4BIBQ
X-Proofpoint-ORIG-GUID: NtXOrt2csHvuFoZC0RcGEl_5y4I4BIBQ
X-Authority-Analysis: v=2.4 cv=EMg2FVZC c=1 sm=1 tr=0 ts=6a56320a cx=c_pps
 a=8LlSNZ/L86USH+wcAhsXzg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=jhxL1PEB9dF55RuFlCQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX1m/pg61SFP56
 IEV+Rm052XXPxjYoAVNZNKGtjjRGg1eIiooy2noSxBjD/dfAf7BAKvg4df7T7EaBvo9ZAs0h+MP
 EUgkNC9Hanp7mgCjmpxP7QBfpHD+TJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXw1kuxJQA9JAL
 z65RUXWdtpjYDksOxGfucR1B2wX6jUZbRrDhIqWRkjotPny2ln1NBOQ44Yoce4FGRJkYMjrUoY/
 tTA7ke0BHXfjL/U4yTgK9PkIfSeWW+2FkBx2zPMQdrY3tdSqOV5K0akTxAEDjUxpEkHnxTlqmPF
 ZbO1j4qEQrr+4BLRwI0tK+WNEqGWXvvrIEsdxsxEGVw/yb99sz3Y+6aTfTTd5R7GzaxOHo3mxQC
 G7IBbz+AWn45Xdo40yZbVZKMxjJPevKI36gh/hqRmGySCD68l4AqUiUPIUDQfQfc2UwiIBU21bh
 JbXOZOT+KnEBl5yhFqF6vZI0eYKaqnQsrC+BTRWW7+AV6w8yfMdNDwVP3nAVWQtJxV7KTXYyqql
 1UE0+nBvRd6fqxHqmzVOrQ9yzR29/MEPALwD+YOyN2qkDseKVC9IgkFM+QReR+Iupohyr08Wc2V
 V0IGUTTt95ZCdsJxTMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055644_960049_54662FFE 
X-CRM114-Status: GOOD (  10.46  )
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

From: Neha Malcom Francis <n-francis@ti.com>

Add DT nodes for the 4 DDR controllers on the J784S4 device. These define
the memory controller with its register regions, interrupts, power
domains, and clock requirements.

This allows for DDR controller temperature monitoring.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 83 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 73 ++++++++++++++++
 2 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18b..65bd68de989f2 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2712,4 +2712,87 @@ bist_main14: bist@33c0000 {
 		bootph-pre-ram;
 		ti,sci-dev-id = <234>;
 	};
+
+	msmc0: msmc {
+		compatible = "ti,j721s2-msmc", "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		intrlv-gran = <0>;
+		intrlv-size = <0>;
+		ecc-enable  = <0>;
+		emif-config = <0>;
+		emif-active = <0>;
+		bootph-pre-ram;
+
+		memorycontroller0: memorycontroller@2980000 {
+			compatible = "ti,j721s2-ddrss";
+			reg = <0x0 0x02990000 0x0 0x4000>,
+			      <0x0 0x0114000 0x0 0x100>,
+			      <0x0 0x02980000 0x0 0x200>;
+			reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+			power-domains = <&k3_pds 191 TI_SCI_PD_SHARED>,
+					<&k3_pds 131 TI_SCI_PD_SHARED>;
+			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x0000 0x00 0x02990000 0x00 0x4000>;
+			ti,ddr-freq0   = <0>;
+			ti,ddr-freq1   = <0>;
+			ti,ddr-freq2   = <0>;
+			ti,ddr-fhs-cnt = <0>;
+			clocks = <&k3_clks 191 1>, <&k3_clks 78 2>;
+			instance = <0>;
+			bootph-pre-ram;
+
+			ddr0: ddr@0 {
+				compatible = "cdns,k3-ddr";
+				reg = <0x00 0x0000 0x00 0x72c>,
+				      <0x00 0x2000 0x00 0x4b0>,
+				      <0x00 0x4000 0x00 0x163c>;
+				reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+				bootph-pre-ram;
+			};
+
+			ddr_pmu0: ddr-pmu@100 {
+				compatible = "ti,k3-ddr-pmu";
+				reg = <0x00 0x100 0x00 0x14>;
+			};
+		};
+
+		memorycontroller1: memorycontroller@29a0000 {
+			compatible = "ti,j721s2-ddrss";
+			reg = <0x0 0x029b0000 0x0 0x4000>,
+			      <0x0 0x0114000 0x0 0x100>,
+			      <0x0 0x029a0000 0x0 0x200>;
+			reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+			power-domains = <&k3_pds 192 TI_SCI_PD_SHARED>,
+					<&k3_pds 132 TI_SCI_PD_SHARED>;
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x00 0x0000 0x00 0x029b0000 0x00 0x4000>;
+			ti,ddr-freq0   = <0>;
+			ti,ddr-freq1   = <0>;
+			ti,ddr-freq2   = <0>;
+			ti,ddr-fhs-cnt = <0>;
+			clocks = <&k3_clks 192 1>, <&k3_clks 78 2>;
+			instance = <1>;
+			bootph-pre-ram;
+
+			ddr1: ddr@0 {
+				compatible = "cdns,k3-ddr";
+				reg = <0x00 0x0000 0x00 0x72c>,
+				      <0x00 0x2000 0x00 0x4b0>,
+				      <0x00 0x4000 0x00 0x163c>;
+				reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+				bootph-pre-ram;
+			};
+
+			ddr_pmu1: ddr-pmu@100 {
+				compatible = "ti,k3-ddr-pmu";
+				reg = <0x00 0x100 0x00 0x14>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 78fcd0c40abcf..6c19bda71565f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -149,6 +149,79 @@ c71_3: dsp@67800000 {
 		ti,sci-proc-ids = <0x33 0xff>;
 		status = "disabled";
 	};
+
+};
+
+&msmc0 {
+	memorycontroller2: memorycontroller@29c0000 {
+		compatible = "ti,j721s2-ddrss";
+		reg = <0x0 0x029d0000 0x0 0x4000>,
+		      <0x0 0x0114000 0x0 0x100>,
+		      <0x0 0x029c0000 0x0 0x200>;
+		reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+		power-domains = <&k3_pds 193 TI_SCI_PD_SHARED>,
+				<&k3_pds 133 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x029d0000 0x00 0x4000>;
+		ti,ddr-freq0   = <0>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 193 1>, <&k3_clks 78 2>;
+		instance = <2>;
+		bootph-pre-ram;
+
+		ddr2: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x72c>,
+			      <0x00 0x2000 0x00 0x4b0>,
+			      <0x00 0x4000 0x00 0x163c>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+			bootph-pre-ram;
+		};
+
+		ddr_pmu2: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
+
+	memorycontroller3: memorycontroller@29e0000 {
+		compatible = "ti,j721s2-ddrss";
+		reg = <0x0 0x029f0000 0x0 0x4000>,
+		      <0x0 0x0114000 0x0 0x100>,
+		      <0x0 0x029e0000 0x0 0x200>;
+		reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+		power-domains = <&k3_pds 194 TI_SCI_PD_SHARED>,
+				<&k3_pds 139 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x029f0000 0x00 0x4000>;
+		ti,ddr-freq0   = <0>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 194 1>, <&k3_clks 78 2>;
+		instance = <3>;
+		bootph-pre-ram;
+
+		ddr3: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x72c>,
+			      <0x00 0x2000 0x00 0x4b0>,
+			      <0x00 0x4000 0x00 0x163c>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+			bootph-pre-ram;
+		};
+
+		ddr_pmu3: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
 };
 
 &scm_conf {
-- 
2.34.1


