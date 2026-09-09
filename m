Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABCBC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjdAhsew6vJlGvc10QfUgmMYADU81z3qD5N/gP59Eb0=; b=Sn5uDs9n+r94g9QBeaJasCTUvz
	t1kdGbscXiTpX0EMrTkCq0ztJxZ6ynBJfd3TQg+GmUYJw25+Spi6Nlo2AFOpk9XGG3byvYPdSQX40
	XnDycwP4IUaLbklRXhXB1JL6Nrqbx/1DLKJ0GF1Yiif9CxFS9B+x48Bi94fdtB328bxk57F5AAqMv
	eBvOaHjl/OOha6/z0lM2UQL5DzIcoXyi14FBvp4EnJxRx4ioQshQ5jhLMcBa16JWZ1YM+DMEckTRk
	oI5aLOyBQ8c0ucIWieYJ1MZCWdBQNxiKilCYxrQlYg5kA7WicUD/Gjmn/FrBdOVTohl9/ptJIXC2y
	J7+OQtNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QA1-0000000Cvjd-3mZw;
	Wed, 09 Sep 2026 21:48:53 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q9m-0000000CvUa-37On
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:48:43 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG2To3382335;
	Wed, 9 Sep 2026 16:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DjdAhsew6vJlGvc10QfUgmMYADU81z3qD5N/gP59E
	b0=; b=Ev0cY4RlvNbSOBt9CmqdYynS91E6F3+mGP0cVBhm+b9bwyBK0hQ6O46DF
	hsywm+ovPGh8DtrSyBeefYJAaAlF2tWUABoGExInDgyydlNBTmEAg4GHu3hyZ8ZV
	Q/2cgW/O1wuIXwV5ZMq6UPpfwmbKd/aAt7KNMD6DLFDWmAMQHFnt+EKOHmnYrbbi
	VdYPHU1CUER8cbKQJYs7ReeAJTPA948cyQ9wiCG7lz2YpUd2menAsR1LxRjVRpx7
	OUOj6X27xacUw0Su5On7Lxf/lpPj2GN3k5eAYMYE9Ztgkn+VtM58pYJX1fIXCbFR
	13HXGbXRsnoUWCPsFFmBWQI56QnKQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92um-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHJoQhr7C0TiQ3t6GqK1I/zYsGaAJ/WAiNzZj8KNm4qCUHryB4hbdDIVwZqlliY6lbR2APDms5q6medIQLABe0G+B4w/qzQlDD/Z7TDPL9yAXSoI0IqISiXQXdAv5CQ2SZn0xP0wFcbgGZEr2HT6XQxM5WGM9DeNDWY11KChzdwFHMHF9ecA+AlZcU2zBCwBgJ6M+ZnPU4E0xZCzBRc3F14IQf5uGBSlCJJeL4oLzrrlh2AZBPAjmwXftLeph2JMkKUWwb/QI5M6zRPZQr9jZso0bedp9yovb5lz2QnP8Pva70iUDJGqEqbca+Lk6v3UNwWVwQYBV/lonRirysRRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjdAhsew6vJlGvc10QfUgmMYADU81z3qD5N/gP59Eb0=;
 b=W4xaV6a0rSrxKwL8sPI5p5h+kZOA8ikjzRvVIeh4cjJVI9vH9ERCQY/FGGzos2eE0j8I4LoSHh67jJHOsOs+thURX45+2qhcv4YkTFI3Brp7TrxJJ0efmY+LxzRCMAwEDHNVFOytSv4V/IilO/Dqey8NIPwmLDq7LSdr2U2FsyKiULt1CDJkYrhOw5RLJ85qSOG5dIhKAQHwdFcIV60n4bsmVyG+K9R8uCKlCZR1SPgqt05Cv0gtXgG8DCQqQqPy7ybZBjhU8vqGcCRSao11O4MAmtoWwJ3B42PVIXBQMvRQU90XKj7yxpZPGQEUTX701+PimcrCmu2nwLU3g0XI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjdAhsew6vJlGvc10QfUgmMYADU81z3qD5N/gP59Eb0=;
 b=rC36ulOOmSsetBtA0MWdZK1uJ+NcYQll5/Q7ICDeePr5c7+O+udjiXZyi8qGOrv6TzIIsAtp9kug7iRoOuS2IydNxoKucXM0QBi28GXGBlacBPaOzYkKW7dltz6iheHR0o83n7WJhkRbs0CDYRfjbSVbNgSSSQTtSj7g1kKToIQ=
Received: from DS1PR04CA0019.namprd04.prod.outlook.com (2603:10b6:8:243::6) by
 DS7PR10MB5055.namprd10.prod.outlook.com (2603:10b6:5:3a9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Wed, 9 Sep 2026 21:48:19 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:243:cafe::73) by DS1PR04CA0019.outlook.office365.com
 (2603:10b6:8:243::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:48:17 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0F1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 02/15] arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for MMC0
Date: Wed, 9 Sep 2026 16:47:30 -0500
Message-ID: <20260909214743.899477-3-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS7PR10MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc99653-28fa-4dab-38b4-08df0ebc0ec7
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|13003099007|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: p3RZDXYfTnSvemoiGw0d+fzUGtDjoATgajjjq6p/jrh1chi3g9UlpNvDsKiF54+/0hKkDNDfGAU6stA7PlIpbziilEqQZJa3tb6to3Vg5wh7Ty7F+QBcPugtpZ43xVaLnDOS3OfHmacRhtm8Z30lxR5ZlH4RA+o3xGAXoSpXswipQY21F+iMQlfs166VhS3D8mdZ/vawCMs5FyaK58C4+inmS+MR3/tnbrrjv2fl4CHRsl/6Wrr2pBemJntlJL0j4wXAI8NnY5xqIW7YdeHmDRmrWkWm9WE2MEC0wmQrvk6Pfc6K/FH187b1dqF+c03gnSAl6XGIqwBhtwWB5B2xFewTlHEHLv0vX8BzTX6RqTNTQ9qTNhnmaX9T6Szd0We0o9k2QAhEeEUUK93vcDoDtO9yoZM5U2lZUAf//YHeLA9zjLwtaKCROzX9Gr9uWdbg2a47ZsjZ+XMb9Tq5F/fYouJE4X+nhfQzjr37y93fkLoxWb+Kab+mJv5icV3QBQ60V1dZb1o4KbYvp6upDY91ogDrJ2kDcqYXAr1weOHy0lrXavWu71+TJb553K3EduMIWDph5DIO0g0CgS1ZD974/99xQpsFkWAbq66G6eGfiIm5K58yzu7iHhgnlKzUIcpfcQ+CennWb+n/0t5WFr2wxr8MsxdftjUg6ulNVxU+vu3EcqvGr8SGQbkTDeyPSUYOmw9vMxx1snCW+tgFWdv12Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ysHwZG1rKgn07HT5i3Xf3kA668vT1Jd3kLN5c0VBVKEmUb30qFZxYyIue+ZILf7gweoKwuQWlyAia6y/ClSvnVNnT00v7dGUKp55tGEwk5m1PLVQiGyLHOt8hTABPFLj30kBzrL5VfKQx0ZFZw/bKDmDOTJuwjH9O2IENhtG6i/RfB5lTJ/E8zgWUBQs/ISmzwAe5IrYZ05j7rdYi7nq6CYBZkqozYBQmtph0g08VM0Nxau+xBRALbPlRWVXUio6rz4MKH3XGv/XJN2J4RWTeuG30lvNAb2c4L5EmJmAXPJvsP2AXvm5YsRXJs5YkCP+oD2rnRbbhffpG/7zRkDTvOEooT6CMAwLwSILUWfho7y4VqG3D+apUC+VjvBCxEw5jz6T50qDKaBydI7tvURho9O0OlLe1eImagT9//sxAPHMa3k1i/WpIRcqP1cxKcTT
X-Exchange-RoutingPolicyChecked: WhypG6qb1AIi0PEm08GxSYGZhUJm4Cse7czebW1xn9Gcp/640aOho6s20DiprBGC6UiGA0PmLSgyCimBQ1jw2As/FCttpCNyulRidsJVi1iS7XFGvMCuVN/vYIRpmLW1bJXERJpyQzDOWkMbMIhsxvTV9iAmFNn3KRte4Wv2BPLktxnSkV6UtWEwCaAygldyfE1iN2cM6JRrJjHUeZxDmEwiIxadredhNJ5n+j1rAtPndeblXuEnDj3Ll52eB0ZSCahMUmMqCobpD6gzdj4Fs/zPQGYQH+Dg5bRbDnYkWTov12O54nNa8ZJtfP6cGUpaHZfy14D59cLb905e6F1A/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:17.3475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc99653-28fa-4dab-38b4-08df0ebc0ec7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5055
X-Proofpoint-ORIG-GUID: KgyOaphEdqAp9HXJMzcrfp5m2o0Lz_PW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX4BXi4HoFWBXN
 ghBHoUKCpUZy6XNTwxgTv2s+5xWK2uw+2665HxqjkUSNlkUzNuNGAlvUJRD0txvgfODo5swaruo
 vXXZO+qYVmjpAYcDZ3rIFakWl15kPX0=
X-Proofpoint-GUID: KgyOaphEdqAp9HXJMzcrfp5m2o0Lz_PW
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d425 cx=c_pps
 a=oAmyFwY4cP9Ja8EDt9RnJg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=ejCK19o8EeXzOiwc5R0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX11i2e4KwVI47
 DAHgB1bGJ9hz9VG6GrjAuxzAlXnQKAwIUJ+7Ksg4C2sdij9Gm3qv/6iOB/NaJr/ni/d4gYxtUfn
 MQDbNY+YvVUYBZl3AFEhz/8+RBnvzsjouQ2CHj8Q1z67wLjqI5JOnGJCS9NnCLLETwjxrO/PLDI
 cFPAWMGn/5n3sAhQLD0UHGoH3Od+/iMAYd7irMBL3vk9yIA4ZWxWA+r1VntyPsMPcJCh3K2JRcP
 npJ350PgoBoj/Z1mQjGb8/1uICpM91m73Sv0sRRdfFBjKB4wMBCLqbZORjTrriFLia93BwYqz4r
 0K6wFNJFJWdY3qTvc66EipdKU6czsad8OndHibURIkOBFeP1waRXOnzQsJ8LeoW7Bz7+1EtD7oP
 +EUXxconoRE5MGlTaCBepn+ABytLCBgTRVLP999j887t3dUEiX7I5DB0M1NoHH7EgVUnpfViUqz
 OQn3NR1mTmympwVunGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_144838_817970_F49EABE0 
X-CRM114-Status: GOOD (  12.42  )
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

AM62L EVM has external pullups on MMC0 CMD and D0 pins [0]. Remove
internal pullups considering:
- Internal pullups are not required, without internal pullups, RDAT and
  RCMD values of 47K are within spec
- having both pullups (stronger pull) results in unnecessary power
  consumption

[0] https://www.ti.com/lit/zip/SPRCAL6

Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference board file")
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196a..964387eb51788 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -253,9 +253,9 @@ AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
 
 	mmc0_pins_default: mmc0-default-pins {
 		pinctrl-single,pins = <
-			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x0214, PIN_INPUT, 0) /* (D2) MMC0_CMD */
 			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
-			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0208, PIN_INPUT, 0) /* (D3) MMC0_DAT0 */
 			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
 			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
 			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
-- 
2.34.1


