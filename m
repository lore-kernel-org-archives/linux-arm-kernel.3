Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8E4C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWIWgmIO4+Xcm80ZEZTFtJVrdlDPw+TfqIbkK1kEnbE=; b=CGpPDWQh1HLDlV
	oQwyxDTt/GzgrvAdl6SkSzejxAT00qGrcqA/TcoyydOLI6+plfmWb70VlUwQLgeRoLk4u6RsyIr36
	7vq6GHEX8EMArwHpp9M6fGXGL/GPmTNQgvsuaQVIg12d9TFPc5AXNqpp2R1KsFWTuxpmIz/WFS009
	GntnfXYhNEYi3U57jF1NMNNTMM69EMO5tga0Hib/1WOeDD/6e2IQyxClkF1S/ancj1q9h9f9wiYwM
	aT3GSQHoez3miO78qxEembyueauf+HaQ8o6O16vlM+t7qmmNCpvzdZg5WZ99pvE+PXtPWiFV/G+OC
	MtPQo+aWbRFfl001V8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvXL-0000000EG21-01Jv;
	Wed, 15 Jul 2026 09:04:15 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvXH-0000000EG0r-4AAx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:04:13 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4MFVL4102167;
	Wed, 15 Jul 2026 04:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KWIWgmIO4+Xcm80ZEZTFtJVrdlDPw+TfqIbkK1kEn
	bE=; b=ANlgfmyg+B678E/tvtaUvecyuOeBqKWG59Vkihp/P3jPOBEaz6SSr4bJ6
	Yd0MCHgAXjyX0tk9W8nuXJziFMtk6zwJTr79xrcE3f5KoFtlXzT/VSV0XmMAH8xN
	V52G8YOX22KfUd7xzIhXawmnrK8M66jj8tHQJXynbf6w2ACCleVUzh3tPsCKNNhn
	6VXUu5XT7gKLjADbrsRiQA7eAIiBBfZp/6eEmqN44q+kHBprRUyJ956ayXaMnbht
	L1lVlI1QYZ0UdL/vGZTXcFyc5cWdIbXGBEyq+NkTLkOkT33DAwdoPcbX9Qp0spMD
	+dSstj2AwHjAA3q1mUUvUYvIknMzA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe34d16wn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 04:04:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpxFJXdfAJQcN45+COVXS/NaAwRaNsH6jF54bwaX+LpUS7WtjwBkxBchVHj/Uw+xRgaHJ0xeOhXj2ZuQE/LvmSiWbvTHRX7q1MWDobjCB5GstNHqGHN70+KWK2Iaghs2sU+rK/YknykLib3NitMuTXOEg+xdXl2fMLAHgQCbk57vsfNN3dTEQCD8ENSe2xa9d8HVVQdRDES+BOYLTIepI9W1/AWP45hNxTONjzYX4BHzuUvtdrYmZ0fojqbVu/WGJjhexHvgn7u+6pL7k7U+MERtWUHz13+ENL+LZ9FHBUt12m7FdBFkgU9EXZqSNoYUDWcBYavfDc7sYjI3f27dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eusn0SZxKDg3p+0E1S+0P0o4F0qnhS4A1aH2tY9ew9M=;
 b=NwqQPopZfnYMlWUr0afGtN6itMp346a3SfHNgPy/Fq1gKSSmcdcZWToje44t9nVw3hGZ8dwbKv7XYkC4eEUYFHiAKfYs0dW/FAphLWWR/tSx/A44g4SpqgVGpfSMHWpQ+OM7v8R1Zr1ZCoK65/OUE5btktMBQ3H3H9aQsa4PcK6+XZDuu4HDzrxcbFSyYCBrnO1xhjNMReHmDNWatOnKZk72XlBoStZhdmn+VMjCRUvAaWsbHEAWlSkYnzaw9Zdoyws82sD7Ujioc6pwczPm1znuVBhqKUC4hLzY5o+bn1lEQzTzQ4O0t5Jfc/csA3ZXLO5MP7tiL0ghUE00IOaldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eusn0SZxKDg3p+0E1S+0P0o4F0qnhS4A1aH2tY9ew9M=;
 b=Ihq4ZQ/dGDaC+xNYSa4KBTcHKPZ266hnIca/5+MTu5/YPhINjvVRmJYhLlSlbo7aAZ2+Oa0wiCjH8y2NpSlpOUKvMkKG6VjWi/LGZMQGXqOp+iII6tnhsOfapat135ULZLtcliMaG5a+JBn+EydJAqKJcHC7yZB/lzzV3LGu0XI=
Received: from BY3PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:39b::21)
 by CO1PR10MB4739.namprd10.prod.outlook.com (2603:10b6:303:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 09:04:05 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::ac) by BY3PR05CA0046.outlook.office365.com
 (2603:10b6:a03:39b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Wed,
 15 Jul 2026 09:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 09:04:04 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 04:03:55 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 04:03:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 04:03:55 -0500
Received: from [10.24.53.161] (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66F93prR2685042;
	Wed, 15 Jul 2026 04:03:52 -0500
Message-ID: <1a37efb3-d059-44df-b59c-4f5204fcd6c3@ti.com>
Date: Wed, 15 Jul 2026 14:33:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <n-francis@ti.com>, <s-k6@ti.com>,
        <bb@ti.com>, MANNURU VENKATESWARLU <v-mannuru@ti.com>
References: <20260714125537.3304217-1-v-mannuru@ti.com>
 <a7208f27-97a7-4fc9-b7ef-58b62405bb3b@kernel.org>
Content-Language: en-US
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
In-Reply-To: <a7208f27-97a7-4fc9-b7ef-58b62405bb3b@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CO1PR10MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: da8a91db-01aa-4495-0b86-08dee2500564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|4133799003|3023799007|22082099003|18002099003|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: noPmSs/8gNMT3U0UyRe0e7NhnvKpU+ijsfejzODPwpncpHUW0AMY/jq989RgkQQR4U8Ew+M0KJ4orNO5zJDDB6xuUpwToyQBwpwlhyE1ygtDc5VBAZ9UICqu74ALGHrq9USqnBjbtkeDmqLtCRq9YaLExveri7jtYwyn45c6OG3eMNC1Tjv3ekV74AhTsiOlk2+WwnGuWJmrvVI/h0pFINX8qKa8LOrbKHUetMO9Hy2x80Vo2fpJS7RwmZXp1181kFTTLLJ4dxWcsLJzYQQfEPH8KaAO60Wjoa76zTRGLu6FTzQtEwULNJNx9fOdGCntxPaQRToiWSfyUBUWX9SLxcnUQcOouaY7vk933zn4R7nv9FpKgv9YudR7LvxKiFU7NF8sfivYBjF4W3NoM2jz7tbeHtSbuMItD3KjLeAv4Xz/KT/lCbuwh4MEzpgQh+U5QsKun2+rvfnm6lcL9MokNNdreDKbNeV1csESMp8ytQ24AXO36Po0dhUYCSqNGBReqjw8LY/ZbbbOTjAa8brd4c+FwTKxDHlwICK2ngTZJGRz6Oqn0dtbBYVLqfVqZkPvdbabrS8buASAZQBnVeBwyq5SiunNHtBM5JUJww660vu5TgIoHYO1NpGXclEFXsgZK4ZL+WX+ju+K6cO9hT5c4g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(4133799003)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vVskl6k43GDMeMQkd6tApfcDA+FSoqynCwqvxjEE2ofIwrp9o63mwQGRnZ8WFh/2VxTaa2mcGN1SbzL7ErQ3fF3wDJGj7hTXseIPSPVkqWeSI2I9s5RFsbRRzPczEZJjYwTxHqPXPFRG4ShJaLYDvpciCub59AmIJSD7RJSGU0Ceac5gcxaT5c/kZ10ndlJmO2g70NcVOzO7Rjc/+SUy/UcOS8aNP+p6jXa3X/yTPYkoA0hYiiAZQd85s+BvAjeNulSihCiS/5r9FEoc07jyiuJJ0qu39Rj0gum7J/1bvFaRaMac0G9bSLmHqSEzdyen1SzGEcTWPq2P62/R7h95lHZMlJRWL9t+rmyTPM/TspPgrRZstmJZw3ETQY7ndh8RBZZUxZG1i7wW0wv67lXO0gqa4NJNyc56hgMmGS+PZjofCZQnJwJCCJEy0F4wWm7A
X-Exchange-RoutingPolicyChecked: ge5IHALAu3U+8zQ3LX5nGu+8UyUJRPPUatm9E9g+XYMt/rL0TlRMLq2Cdj2bOm+nQKJKH/AinIvXFKR/QLgXd53tUdO0iuyo1fymgN0r66GbS5qvEYnMpgcgzFZO2gVmwskKKgAsQ1dqcILECwM3e6V7A/jxe/bmrbNC4LJuT32hrDwvgOAwI4x+VEdKSanSwWijoM/UiI89/3JwWfcYlfpHVcoW/rLxRmiY2/B73zbPEeP0WdCfQON+UBpygpCT6BFZYCWVVJeaGppHB1YC12/8MsMBZpnEe442ToLuT84A5mhSzNzR080t9pQsRtKxwF5zugf3QLPdQ0SFlpOTzA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 09:04:04.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da8a91db-01aa-4495-0b86-08dee2500564
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfXw4Ncz/DRiaTM
 HoG9BZa3JtJ07pO5HEBCpL8P6OH7qb4YvDIyvF9sZgNEuQiIKQBSJLwaptwL55HAJilL3Ii/GiW
 h3KvzAyAo43tJ5IZxMq0h4QVbM0R8zg=
X-Proofpoint-GUID: OeCW_GbOClEwtrW55ZVSciq-hHU0i1Pt
X-Authority-Analysis: v=2.4 cv=NbXWEWD4 c=1 sm=1 tr=0 ts=6a574d08 cx=c_pps
 a=/+xYJgQt7uUW31a/4HdwMg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=RpNjiQI2AAAA:8
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=Qxqst0mTXSbi7PS-Q_QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfX3zw76xSHYtuO
 noNOa8KN6cdDhvqa7Y2bu33HKYXh7Wo2tL9ZKinGA4m515unIn2l5bWp4zAlhZ/4HbAI+r6QUrz
 D1E6jGGO9T49oQQlkk3P1gy4vql5uAhmOjmgJactK9EiSWR2NoZSdqdXEHFKFEn/5lk0ZS+tYe4
 gRoLq0u1JCA7rIH+CD0mzov27lfHkZQl0OYPaIMNum5Zcnuop+tbn7kLXuTT/E1UZNGSPbmDrJQ
 3KQyM6yPBIuggnb3AELD7eNLmK9HWTQiKVRQQ142w6XbZPKdC5Z/GhuyvCMhfzVcHTtUSQjS0Iw
 G9JkxP3thoV2Kg0i6lERMmbUlQ2I6LMT8b09GjcvsF9L4WrYsxPSwCLsn6uNynab8fLEGtSILYo
 ihIolJ5I6PHWzRrOKHfqo14Nh9I4bxl9LdjGGssOvEkeLCXDGDoGtYcq1i9M8oJlojNGK1WNcEB
 ERXPs8a1DHD02S03PzQ==
X-Proofpoint-ORIG-GUID: OeCW_GbOClEwtrW55ZVSciq-hHU0i1Pt
Subject: Re:  Re: [RFC PATCH 01/22] dt-bindings: memory: cdns,k3-ddr: Add
 Cadence K3 DDR controller binding
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_020412_150530_7904356E 
X-CRM114-Status: GOOD (  23.67  )
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

Hi=C2=A0Krzysztof,

Thank you for the review.

On 15/07/26 10:25, Krzysztof Kozlowski wrote:
> On 14/07/2026 14:=E2=80=8A55, MANNURU VENKATESWARLU wrote: > Add device t=
ree=20
> binding for the Cadence DDR controller used in TI K3 SoCs. > >=20
> Signed-off-by: Neha Malcom Francis <n-francis@=E2=80=8Ati.=E2=80=8Acom> >=
=20
> Signed-off-by: Gandhar Deshpande <g-deshpande@=E2=80=8Ati.=E2=80=8Acom>
>=20
> On 14/07/2026 14:55, MANNURU VENKATESWARLU wrote:
> > Add device tree binding for the Cadence DDR controller used in TI K3 So=
Cs.
> >=20
> > Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
> > Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
> > Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
> > ---
> >  .../memory-controllers/ti/cdns,k3-ddr.yaml    | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/ti/cdns,k3-ddr.yaml
> >=20
>
> Where is the rest of 22 patches? I got only these three patches.
>
Sorry for the threading issue. I ran separate 'git send-email' commands=20
to target
specific maintainers for each patch, which accidentally broke the series=20
layout.
Will fix this for v2 using a proper single-thread approach.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
Noted, will drop "binding" from the subject line.
> See also:
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v7.1-rc7/sou=
rce/Documentation/devicetree/bindings/submitting-patches.rst*L23__;Iw!!G3vK=
!VufvdFJYWNjYPM5GnqHtPsbj-eGrx0jLrAx_YZJ4Zvxail86PMioiY6qiyoVVJs7LkAg0EUeVQ$
Thank you for the references.
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/cd=
ns,k3-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/ti/cd=
ns,k3-ddr.yaml
> > new file mode 100644
> > index 0000000000000..89caeb111627a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/ti/cdns,k3-d=
dr.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/memory-=
controllers/ti/cdns,k3-ddr.yaml*__;Iw!!G3vK!VufvdFJYWNjYPM5GnqHtPsbj-eGrx0j=
LrAx_YZJ4Zvxail86PMioiY6qiyoVVJs7LkDKAFfOoA$
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schema=
s/core.yaml*__;Iw!!G3vK!VufvdFJYWNjYPM5GnqHtPsbj-eGrx0jLrAx_YZJ4Zvxail86PMi=
oiY6qiyoVVJs7LkBLS4PG1w$
> > +
> > +title: Cadence DDR controller for K3 devices
> > +
> > +maintainers:
> > +  - Santhosh Kumar K <s-k6@ti.com>
> > +  - Neha Malcom Francis <n-francis@ti.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: cdns,k3-ddr
>
> cdns does not make a K3 SoC.
Valid point. I will revisit the compatible string.
it likely should not carry the K3 suffix on the Cadence side,
using something like "cdns,ddr" instead.

> This is confusing. Are you sure you understand which company products
> you are working on?
>
>
> > +
> > +  reg:
> > +    minItems: 3
>
> Drop.
Will remove minItems.
> > +    maxItems: 3
> > +    description: |
> > +      Address ranges for the different register regions of the DDRSS c=
ontroller.
> > +      - ctl_cfg: Controller configuration registers
> > +      - ctl_cfg_pi: PHY Interface configuration registers
> > +      - ctl_cfg_phy: PHY configuration registers
>
> Describe items.
Will describe each reg Item
> > +
> > +  reg-names:
> > +    items:
> > +      - const: ctl_cfg
> > +      - const: ctl_cfg_pi
> > +      - const: ctl_cfg_phy
> > +
> > +  bootph-pre-ram: true
>
> Nope
Agreed. Device Tree bindings must strictly describe the hardware itself,not
software or bootloader execution phases. I will remove this U-Boot specific
property entirely from the binding.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +
> > +unevaluatedProperties: false
>
> More NO.
will replace with additionalProperties: false.
> Really, can't you make some internal review back there in TI to avoid
> sending something which does not resemble upstream code at all?
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> > +
> > +    cbass_main {
>
> NAK
Understood, I will cleanup the example.
>
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      memorycontroller: memorycontroller@2980000 {
>
>
> git grep memorycontroller
>
> And it did not made you thinking that name is wrong? I am done with it.

Correct, my mistake. I will fix the node name to use the generic=20
"memory-controller"
format.


>
> > +        compatible =3D "ti,j721e-ddrss";
>
> Irrelevant. Which binding are you describing here?
The example was Incorrectly focussed on the TI parent wrapper. I will=20
trim the example
down to focus strictly on the ddr node.
> Best regards,
> Krzysztof
Thank you,
VENKEY

