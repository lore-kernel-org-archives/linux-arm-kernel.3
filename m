Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D26BC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2EhcnsYOzEzPIrClR6LtQZs8r4MjxaBnx81bh1sB+A=; b=ntgX1vC6tWbagh8OZ6Pf+QVE1P
	Gn5Bt8la8xcAXDBvVWhwPOGuc2TTvqEoQWkMI9QTMSDX6ncIt2sKHVfV0itWxuay7Z+ZYI/a/MZAp
	n1GWN7Qa4O5TtleIiWyqiUJwbYX3cUWs1dnwJvUMDxMzgZ1FR/beeN3TawVkXoKtEixRlVcoE35Cp
	FSBoMI2LOjjVxQpDhbcbEiNlyU5VfYIGN8d2XvXpjTeSDSIn+0/SbSoeVtuFc1kEzqIjETYFhKjmi
	bkvYQzGkpEmnpdL6+Up9AgbfholoF3e6gyMEdUIcKRWsNEYuOyPl+nDyVGCfbCH4pCsMj2WpJuNdo
	vP/yMc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws499-00000006ajK-3tJt;
	Thu, 06 Aug 2026 19:52:55 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws496-00000006aiR-1MLP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:52:54 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676ICBtd946515;
	Thu, 6 Aug 2026 14:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=H2EhcnsYOzEzPIrClR6LtQZs8r4MjxaBnx81bh1sB
	+A=; b=YFzH686P+27bjlbNMcgWAMaXYs1ZNyvy4h74U0HPFeyNbYE0izmk/hJ3O
	yQ/oZ6VdVUph6351Z1f1YqBFoMtlRXfQyyUBcPBlD1nhHh84B94Mrf54R54zkv1N
	qIqCWYi+QXGtA+7yk3JINjq9BCEiHtiz3wlBbqPV4jQNOhJrT08O4C8jA9LMRB8i
	sslJ237iZBzQvKO5EbqqRfwYEu2o1MJXnk49r04jKH+tQwPnQFixRNLSdMo2OGpD
	OsQzUD7H65qD9XzuMSQacCgRvtcsBs8d58mr/qWgdJ3vVXj0whE9/fqa/20O6knn
	4ZFLngx2VlRTr6EmfUw9bne2Gr1OQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf3xjk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 14:52:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxIgNi3IC3k5dV/PzV/bkwjgf84+zYTG+0uilsKkHHK3TY4S5yZQXRjrGm6J2B6g2nQqEB/6c9vXAkE3oQ89j+OQysPnkU1gsK7+yJcp3Y23sVmSvceHmvVn1X747BCxjldfCvQjneBka3adPZud2+gacyYSdC5zRZslBdxcSILidNSvjf9uhbbFuM6a+p3vPF+OmZImqM4UK8MFlT+rwOVt1FjGsdxZ9/NhgdmVZ522opPwhpEFgskfndmSaGBGNFzUNv6O1H1NW1xoNS8eNBFuoLiicpbCSm7qCbBtpdmjpxH47UlLF2plk6J4zaT9zh7/jR+yfIA52pGnrO2JbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2EhcnsYOzEzPIrClR6LtQZs8r4MjxaBnx81bh1sB+A=;
 b=TQ3DzdOwSIJ6vHl7xXfZfXSzvageb5suTVDLGWXcK0rxr62VsyWw+p+ZOabgFBChvbHPkI41aP1i8wa4RabATRkV9vw8VZj25ZM5Q33SOdBocw8rjDK4WxQIpxpzzbEUnHed6mQjnd99GERWUeRS3NDUfFO+SusgLHnh469548NVe2X9s5ur45xYZDb9jQcAYIxql4cJD/048IKN3xriEJNqp+SP/PX1UiGt0xObVdBgt68JwHwIvoLfVFCwl5I0rVeXrJ2CpAv73KOJdvaGBIzmabRXoDmv+0q4NRDaQDQj+Rsb9c/IK7wdC//aoBuqagmDqTDzcg4PAxqQO7atwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2EhcnsYOzEzPIrClR6LtQZs8r4MjxaBnx81bh1sB+A=;
 b=VViZDFN7JN1pPwvAEhIcMr9iwRbsXDmrApWSZesN8Hw/l/PeOI/s9rOQflvZH3ClfVQOf5xbWtHv6lucepym56GW+gburZA2daWq8wec+zhkgO9ke4nkFnyYwHDNlN3KY1tS4Np1eeXstCx8tMcCHrAxweleaDrSizU1HSXdeDc=
Received: from MW4PR04CA0137.namprd04.prod.outlook.com (2603:10b6:303:84::22)
 by SA1PR10MB6638.namprd10.prod.outlook.com (2603:10b6:806:2b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 19:52:45 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::5) by MW4PR04CA0137.outlook.office365.com
 (2603:10b6:303:84::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 19:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 19:52:44 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:43 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 14:52:43 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676JqgLO3900552;
	Thu, 6 Aug 2026 14:52:42 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
Date: Thu, 6 Aug 2026 14:52:41 -0500
Message-ID: <20260806195242.669491-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806195242.669491-1-jm@ti.com>
References: <20260806195242.669491-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SA1PR10MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f065cf5-6fbe-4928-0201-08def3f4488e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: x0niIRcRdDFFcMTw8/3rlnk73esYBXI76jsPwhl2YcjmLZKRM4d1qiIQxdV9FHotu5gmWizJ7OIxfXfMLfhmFeaiZF8yaLBoCg7GRjk6SUi3+x6BbJfT12V7hOzx7wp+i+8jVXtPcALlADCdBAOxdPDWcmgbTTm5d77UqPLo16SHmR7OHj6NWU9hbWIP0dtGPfJjcaY6fk64yJs0drGiW4lyfFEo+Kqn/mNETEQmYZEJfvacrumzPvYZmnnwQ6P+yqlYMIk0Tiq8AR2lmZV7fvZXgg/C8a+WZSOT9NA/mRi1UOhZ+ePytA+p2L6TkL1uvqzbEHkR4fa28/+EqOTZrnaygv1z8SJhUW55hgpCmSy1KPJgOwr6U4n7FOg3LMM+sjutAjwqW2DJF8vdpubN96QTlfqJvnk+LnPSRSSGUZVsIK8Om2qHzM3PdXdCkoZnob68SXHMQqIswQqXAYfnALE7J2/jPkzzJQvh9KiEub9MX6vGmiKr3sovCUzW2PeKQdix1CcDzJljrTJ2NkUbfEZ2aOFM4KFN9KB71Kssq8mwQi0IDbR4742WMcl4Vz5DzmpDOFb3nfJPRGv+gOwne3eOaMzlQLAacXPIz3N4eFZg5nly/LZz07xOGN3o0dZio58c4lFjcPUj7H6TqmOIoUvL2tv7lKZ5ScLRaOzS1vZOcNwbLv136wx6SEG64CIBcsHv+1hocuAr5BWPIkoxdg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9ApNLyfqXVkkIVQ+3BFS9iyw2slXUF9cGT7/ZPMrtIceBtmxOwC5kpS2lALh61RjnSlzpiIh8yKd3ZjOdmSXcV4uPeH0C/avueViqPsqDHDnyHKlOpLAO+I3JZ954MYm1OJlXzCtVq0YG+bK2ta3dTQpUnTvGGPoJ+nufMlbUfk+n/Ciwd3rarAYuVt3aMxHXEtW3eab622nQz5tY2Eaato6FIfP6QDgr379cDO+YkUDRLhc4kvq3VB3RFknRYkEU7XJDew8jlYWlY4d54Ojv3Ndse4F3KQku4zdLMdKC83uew2ulwLUWGiEUKpkYtqYjuDqiN3yCk+lduu+KO7ptR4EqGY1hb/uuNp9nv5gOgurmNS87d3ny6RqQhGVklGxRKrs6ae3wF80GYRtEtGJUIZvffoGfKB41fxqwuUFvuebrO/cu5nZsjK6jV0HTMR1
X-Exchange-RoutingPolicyChecked: T2kETleyQjrfbo6gMoSP2EgvpLjs4p8uQ2/wJLive2jCEln9KKSq4SALaFGeJ2T0FMRfGgHSWyDUk0ZqrW9jtb59N/qSaG4Q5tv4ZKSDhH7eQZIAebFuivacByxjdthG4vYQyLCX4NydPU+gBCD1wUMeL7E9PzKCpaa/YPa3AmOwnHhDdSC5K3h2qb5xrXt2ZPhxs9bO7TGIdZdHGaXpP0TzVuuVCFGvhJg8ahxkk4vP5AoFsg+TR1JUh/TvN+GpwHvCQQ5HA4w23eu7M9nGJ2w+ltg2/Pf+77woQ04t9OZ/28a5dgozBx885OScRm3/lEcRNUdErnp7o68ReTF2DQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:52:44.6607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f065cf5-6fbe-4928-0201-08def3f4488e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX8fcxfj9rbHIt
 gwI+tMbmfVL6DvUKNJrCqwdSqJLVl7mFuBihP0aQIlnr4YyGfxRlECOYgiN2gor1L8JvwZvUrmH
 Gt5hAnVrGUZd3snMKjcxVwXMsrQdK18Eb55PmHajCdj4IIKAtBISSxN8tA8ubwiAf+yx2iii6Uh
 2JK/RNwc6tR1OAfXqmYS3jVTcGqm8/I+ttRVSah+wGw6G7VU+4wTUxdj2lGVk7iLrmQ5z0P2YdQ
 Iyz8omLR5GcWR6xbN6QQaC1OjkSTKIriekhAyvoQmNwIvvEUnCjXSmnowu5La4i7mQJM3R1PD/n
 5QZIBGgXQAwlK3mHcpM8JwZTxAUNngR14gR+mN5dO2dKgEnWT8F33Brub7hA2xLpiRc6E56W1Ue
 K1kVQV39trINr/ODIHU00xSymDyfIP1dQhlHpGFJ73zzbJtcjhiXQybT2F/QKZKWOyatoomQa3x
 0TJcx00POlaRKtmKIOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX3StJRGDQ4SWb
 t4+0LmMhC4lhdF5fkOPEJKK8dna0SXSNwEy6gjw3j7VeTEh9aK9jf2vDHZLneN0Wm1jrEcJLgHA
 QUz/evTegIjR/TYnLecclCxZMg3NQ1g=
X-Proofpoint-GUID: J2ieV5m_xHZxIkvy0GricvIHJW66xg-1
X-Proofpoint-ORIG-GUID: J2ieV5m_xHZxIkvy0GricvIHJW66xg-1
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a74e610 cx=c_pps
 a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=LutdpnNTiN0Nrs00G9YA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_125252_637409_D4A548B4 
X-CRM114-Status: GOOD (  12.32  )
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

There are no M4 cores in MCU domain for AM62AX and watchdog nodes
are tighly coupled to R5 core, fix the comment accordingly.

Fixes: 804702e4c2aa ("arm64: dts: ti: k3-am62a: Add watchdog nodes")
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index d22caa7c346b3..5b90320778747 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -147,7 +147,7 @@ mcu_rti0: watchdog@4880000 {
 		power-domains = <&k3_pds 131 TI_SCI_PD_EXCLUSIVE>;
 		assigned-clocks = <&k3_clks 131 0>;
 		assigned-clock-parents = <&k3_clks 131 2>;
-		/* Tightly coupled to M4F */
+		/* Tightly coupled to R5F */
 		status = "reserved";
 	};
 
-- 
2.54.0


