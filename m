Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F2EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=; b=If2A0GE57RpiK8zuzpF4VZbraI
	yJTJMamxw9anO9aErH/i/mBBHF0P+SWK0lEKxTNlCJl1gSxXmAxakyqd6NvBT2VlurDohGSZ4X7XC
	HmFUaMuYidPSRwdWoOdt+gysZBDw52r9w6rFP9OEAMRzFFk84MzP+4q+CtFk0/lYSkHl/G+y7SpU/
	926za9YZ794SCxqZH5CMvq5ckr/BOFI+NRGQgA+GcSMkGNapf6qLjBq/d+h2esdYhc7A6z/YmIDKL
	it2L+AgXSQkmx8FaNCugi7FEA1bjWUzXm/Yxl9WaX50wFsFFI2YKyLwcTz439At6hUT3+JpSAOqW6
	BojLVDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYPZ-0000000BI3y-1v9u;
	Tue, 14 Jul 2026 08:22:41 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYPT-0000000BI14-33ic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:22:38 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6UnEE1502820;
	Tue, 14 Jul 2026 03:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsK
	hg=; b=JdxGkAdyTB7+zez8XVzC/0/7veKcpXbdcWUXt1vUl1rdWnZ4wEKVSQDdf
	opnT8W6GgrANjvTrTtqVdc7Fno04Ve0cTs2ciRAmPX1jBQa8sFJuA1Gxw1wfGpr1
	YLnKh0JUWIumlfwHpzPlWS78RBaA+68SwL7Li/CGkUD7nerFTWm/JMptzrIA+80I
	lOZ4V37NhBtGHNNfVwWiR+FdGi1gTLkRwiNtOiO1YPEwT+kpat3JrCM8Wrs3f0DT
	bSBruBGp9HW6/jM7G5hAE4V4mJ8eb6m1IA0q7Rz4OEuDTK3cg1Jw9EeFg2XBZPQf
	u4yKaHCFA5DGe3HO/DuxvBiFhtmaw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fcxwtpk94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 03:22:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn4z3OCBptk+aiEaOATZ9BXAAcrUCCbeUZeFyaZY13oHRKePe83KokHw8yYeorM4iIHMX5ZR/L131pof7BgkjvAaAJ9+d6Fo6ZWnd+Jw+5ijLqoTpUcBfqvp0FcCZt8EYJK7JH0+Hp3RYQ8iijtG9EdJ079MELnesrKxM3CSKwniMJulrWmxBRMNMZWhVEohSEmwwAXMx9QQd6fWtaYPNTsu9poLDU+5NK0if32YFoMrqOwZcqWI6a8b8oDTO97OlGm1Smz/20jDNfI8GzKRtgwQrP6bAdmFYEx5bGg1ZA86cooaP2LFFn5ofMXus18dRTVcy95ozekTofh8IlkwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=;
 b=cvD5zfXwu3ZMS95o0GDfwsUMZFbyQ5sI58etoob+UTBLRpzrARl1Tcrgj5TRT/BXwS+XXMOjBypJ3qV0sTTh9ecnpt7oNtX+0CnXfzG1eCXu7U5j96Ceqvubo37iQK1QFhOzSLo08AEjArN/4VP8rvb1gZHe3kW9ebjtT8L2CHO7MO/jTtRdXH29NzmEbZhi9ouFZrvsFp5szOREOsuIYqi/l3+cP/XvxG1O+gzei9Gv+8X/1z8rTgdETfthr0dtASHJmk8Be+FZGOaQGNOP5tH9sTABGeDULizv1pwWj0Tyw3Q3b4fQxRNMcKt2uIKyx/yA76N8pecMQ+CfBns9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0DuAy2mFUbOJaO+3inxvlB/DWrvEH4Q679Z+LZsKhg=;
 b=fruV/L8TcgMr3n6IXCV0MGxJxuTmU7+lecHBY7N4pruDO5eEbA9XIW0R7TxTWNYrnZL6grTBC2/u7bMw2S0S/JFgPaixhx0Gs9VF4rG0VCzZt5z3+bcSGZcTXEXfAlbJWT5ph+eiy5Ce/CeL1NtEVNMVKKeSOMHff5deldHQ4FQ=
Received: from SJ0PR03CA0170.namprd03.prod.outlook.com (2603:10b6:a03:338::25)
 by DS0PR10MB6797.namprd10.prod.outlook.com (2603:10b6:8:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 08:22:26 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::25) by SJ0PR03CA0170.outlook.office365.com
 (2603:10b6:a03:338::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 08:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 08:22:24 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:23 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 03:22:22 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66E8M7Ij068443;
	Tue, 14 Jul 2026 03:22:18 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH RESEND v6 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Tue, 14 Jul 2026 13:52:06 +0530
Message-ID: <20260714082206.501922-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714082206.501922-1-m-shah@ti.com>
References: <20260714082206.501922-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DS0PR10MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2944641e-6fe4-4d81-3874-08dee18108b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|22082099003|18002099003|3023799007|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 4KMSjMXPEwQMhy7WTt3OU0+GYRIr0mpjmEJVbEpdPk3w8EeytL1XkPxvlY2wE9Wx4Rq69Npoezyn7zygfEAGHFFWHsLMWBFtEQlx55IJftw8cNchTPzCnBndYGrXOZVlDdme/cYXlVtESUuWCpVYuTt7DSyWajlGiDJXKk67OuWt9Y2iY6kyXViZvU+6zWksuTQVZQOHhXbtjyxbFZeHCzSN0WvF4HiTi0cTcRDJ2eLzNW/UPEuTyCinZOLKsre6C9p6U6PDAgBILDy99KLOcTh9zk0+mUGG4kjCCzs8GxMsTbKt4DQaw0DeMNXmpOANcxYvqdK0VTNOSgROcZ/jhY/8dr3SyCpRIGrr22cLiHOJMXfwuhSBZS1VeIpka9XPD0ZLlDeyz/swkU4yqor40N3VqNWdX6N8AqNUa/J6nYb2wQAOChBGumINtya0WEoPGOjL5+ktSzaedZcBo3c2QEpo65TPxDnquKSSO6XIQPat5K3WGnRBfsfsNk7DcyBV71rdaAGJf6nRnV7yQP0B+pJQvIZfvcozgE3djUyF4D57j+DvXE176Ja5wuUjySomt+qJiN/NZ7c9cFq5modm4Au3X0TAxM/j44QhuRIvNvOJzxbbZFDoIXgCt/c8jyCr3rD/U6kgPo10kka4INY3LA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(3023799007)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3PIRvTQO0UvkUhq2v09c+iXDjIuYzCyZo7GdLOJA3TStsaee2BMDicLk5Q45BfZivZrdlgitYWs7DjKvL2904oHP3AIxQee0bdTei91iNZ4LcGEY7hHFRaXBMwvsJQTVzLzxRYAqLUUXSBPLv1LdDdZG+au1cm09Bav7C55DVYMngnTvEvYHLFCqRKxj13LvkgzjEmMay82mqs6RNudBlt+WJBvdRKYYwabII7/HyuWTTuOHgb/Kt5QiWpjwUrwJp8YtpUxkRYQ+cb+9NCZIu1M63sFKp6ZV4hikWB8QLoubA5FfKf2lgEpyMxzdEwJbPJm75jiskJlJtub2GwONQjGkauHWhpqfUAn1JJIy0g1saC3VzvFl8AH++nejhhPwfvNdxSCEGpR++7m6KaRkFfVoWrvpCLwjXsfpgzYZggA/39e13tyaYr7galbdy5iT
X-Exchange-RoutingPolicyChecked: RhliQ/YZolRuaxK/HDwitmIQxDQXZX5W+TQisJH3EUAhJ5RFTUxk07VS38799ykWt2lyhMev5yrpWpafoTllSqC3aXZIEY5vLcRL56NLEI0cBcYM0Z9GGKwS8BvGQbHfU16LwSf12VSXxkgYYSFLSZSjp/29h0sYMKpgWtFIW+we8/7utzlfpYl6GWZrutfdWvYN4a9pMv+3DqMWXnPRPxTs5TYECPUUJBkPIaGdsmV+YBM0Ad44+IvUH2WtmTLMXdDuR+gcyOJoiiaMpsEbwC9GHP/G8qzRW7Y90KVjJI0h/F6sUn5sS/S6V+J4nPX0kOKKLiN9n5c92j6xflmLNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:22:24.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2944641e-6fe4-4d81-3874-08dee18108b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6797
X-Proofpoint-ORIG-GUID: _VyY6kHqQhrtCRLGa06SgiKws9kVqvnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfXwiVLoZWVMtGc
 Lz4YwgBp/5/u9XMzUXqlmCjUgJcL5M3X97g3rZeGuSZwl0L9WCo2Roj2dRxTUHeU+BdtTNXIfJA
 zoqAjKjwWO9CdRa0xy5tLlnHo/K6sGwK0IWjrPAAsoEh5+LcjCzY/aOhnwwfy4+syz3Fzjwiq4u
 C5HYYXtBz0PS+EujcOBdAyVby05mUbdHGGnjMHCPH1NMDZRzL5ndW7IQdjVUuIv2gERt6VKpBQD
 GsyzULul0f2nSgDIRKm043XebBJ2U9j1nNUNt8eltjI394mxoyNhYGh7R49lHeA/eD5ghmaAGaA
 Bksu+ArUZuoy2atnAJHPP5dDaE922y4aBHf1OF5QsFJDw8U/uWm79rTilG/MuUuwa8Td9jCGWn/
 Q1ADA3uUtXjjoTfs3IZMf18cS32kKeJWTprU6qCcFB8XL3mGl67dHjBFoa8j6lTUln4qctTxx5Y
 PsIEOFWKhKHKuZ6jwgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfX++2YEVpeJzJo
 pzOWAfYga5ky4mMszogjIQ5FeAjqS2Ptc2haVBgFbmk9FPzz+q+LYz+KVDjwo23IDkHrmgzRUPK
 PE9DxXIB/3wdTBf5b1NZvAZWCW21Fds=
X-Proofpoint-GUID: _VyY6kHqQhrtCRLGa06SgiKws9kVqvnN
X-Authority-Analysis: v=2.4 cv=UZBhjqSN c=1 sm=1 tr=0 ts=6a55f1c8 cx=c_pps
 a=vtur6dA+JiXx+GD1nKNobw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=oFhqMRED-i6X9MmFsNUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_012235_887069_141B2049 
X-CRM114-Status: GOOD (  17.63  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add audio_refclk1 clock node to k3-j721s2-main.dtsi
- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add GPIO hogs to route I2C3 lines and McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 3 files changed, 170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe52..d9824e17085f4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -180,6 +180,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -320,6 +321,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -396,6 +399,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 0000000000000..ac5a827e1b750
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&main_mcan3 {
+	/* Conflicts with McASP4 signal routing via mux0 */
+	status = "disabled";
+};
+
+&main_mcan5 {
+	/* Conflicts with McASP4 signal routing via mux1 */
+	status = "disabled";
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..36a01a06dd254 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


