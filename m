Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544A3CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lxXFteHpE61AWz7UfLTndUcYmDmTR71XwVUODyrG3g=; b=ttUktcZXD/T/gLsOX7N7xiSRE3
	fAONcy7b+pqiLHa3naaQOpr364qlXcSrU3QhdHCeox5D5MH3Y0Rk/ZYYicyz04LKrQcwzmtJMV21L
	UhdMDnxcBxWhZh+QlWMEhfxgVi5GaLVxnrovM7WlShH9rBUIkJdmJibeGGwZeYS4FX44FGZR5hmBz
	FG1Epbf9kGD2L0WuaYGNKVAIpMKNp/WMxgGbJEWXg04pDLw8QLuw8DlLLL/DbM49HWEXXhGCgelPv
	9EJL80gx+RA/JfKWqQoigmf6nANCPqMfdP9gh4MlDh4cuK17XuraujKI4S0IoegIUX1hEBaq+h+CB
	RfmKF1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuahb-00000003dUP-2w7D;
	Fri, 05 Sep 2025 17:58:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWvL-0000000282v-0uMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:56:21 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585DrdQg028463;
	Fri, 5 Sep 2025 15:56:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9lxXFteHpE61AWz7UfLTndUcYmDmTR71XwVUODyrG3g=; b=fsdDnjC2Aa7d2Pdl
	FKGQIBOPCNyHteNOx2gX51vjB6yDTUd2lZ2W4zFHHmyptpTWshqYntI3A+xXj56P
	48eElVlZIewlNnPCBn+8Ty7KknDoRe6uNFp7BuQlZNpqnl+voi72eifH4Jx+pEuQ
	ZgaMa44RsOUhmrPVpHPhSrQc1/ImxPvUY16RKERb1dYW+1cVTtoCl6lUJazpzSWe
	N4F4GqcVG8JVvpnHlzflXNkV8+4gm+weQEgYQoaQIgL24yLhTrpSnWBq0Vn5CM0h
	iUixv0oSwbIi2M15N9XSmMAhdmwE7MZGfHp2NHQ7qurf0tenKRmMo9Jo6jBgX7Tt
	VbGyiQ==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8mg98v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 15:56:07 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECETCVX//3iSsgMKRO76fpUuXZZFub3HQQlS8sPRszBk8HNz6yKko4YGWE/6JlLzgzhOQWMX2+OVuwJEKWlDnucdYbvHsElzxNgUKkUhfE35rJM+XKAipd35I97RFJ8hccspv53agNc2EsZf+Dl93qzAJbvxGZJ92uOWnLsijfG29js7y7/BZn47tKFMMSHwYKXY1bqj0IoNKA/MepmZkb0dap9nXOamOc6ry9ai7Iyiu/FU4b1DbgigEVM8Meg3iojL3ZaI6IqGkYlIrLR3cpg8w0CGuqZUIzNIBb2Jm6HxvA+0XuI5D6mbBwnyKyF+vYT2Ixp4Hrm8RQLCsNfe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lxXFteHpE61AWz7UfLTndUcYmDmTR71XwVUODyrG3g=;
 b=dgWomK6SALssKmIGlBf3Lyed+efv0kf5oXoVBb0n27G4eOD95eFgfBJPn1dFfzJl6jTuwLeMinvy0FjFbefvnpRwpZazKTzuhzslmuhGlsULxF1y6RERjJt4JRmyG0MaNmvfp2+xG5Pxscem89nvqbhya2tXkbbaVyR1RIVfCh6qXWLjGLYPcLTztIoQDw9w17LvvBHEpE+0VcSnOpyvGykZUGvQYoeWoMNnWfPCYv8uhIV60s+/eq2j5hPYj6fjdk2/HQvShPcYk1Qu0lE9UvtYptUaCX5C/QIeHqD7g98lTaUNvOZI1+rFasOOrjB9ZGEnBPTGW/OG3iWLEU2xEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lxXFteHpE61AWz7UfLTndUcYmDmTR71XwVUODyrG3g=;
 b=hvCs2OY4Y84H/MTpR90/DwJh2DzpKtgWnz6nWrtAMzJURqrdah17JgCXT4D/xfGI+TLadmLFtPWUxOhWB+2wkbruqx5PVVX6LHV0tXnMSWIh2jPMbs33+fCDt6PbcahocortUaZozN2l2sEOJyBZFhxUBpOk16EZdYTF1JDR5Jk=
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by DU4PR10MB9397.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 13:56:04 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::ea) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 13:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 13:56:04 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:48:50 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 15:56:02 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v2 6/9] pinctrl: stm32: Avoid keeping a bool value in a u32 variable
Date: Fri, 5 Sep 2025 15:55:44 +0200
Message-ID: <20250905135547.934729-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905135547.934729-1-antonio.borneo@foss.st.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|DU4PR10MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: b01a2988-5e53-4912-a035-08ddec83f45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M8KCwZdcVzVIq/NS8GeDryj37Ie9WJ+7Kvw8Qhyd7Eac2UK8YXEtxTisD3jV?=
 =?us-ascii?Q?Ea26OxwYtqQg5eexmqM0m69z1/OOq+N4FXRgi0QGnAynF8QxIV/dn2VOkZ8b?=
 =?us-ascii?Q?moUU4FAMAiWHId2XOkSPk1iKJ/htFd+CM4eo4An9J/wPGwNAMN4TgJnM5q7z?=
 =?us-ascii?Q?swCWrHBJZ+oa0xuAObnuuhUOTQbKT+WBC2SAEQtdIvFSXxU/FEQpkb1M6XTR?=
 =?us-ascii?Q?Iw8fN1O8bUfjOWfe2GnN+549keX8E8Y2bW27zA+/n2RZXGBaICx1CKMltKGg?=
 =?us-ascii?Q?8OUXfBs3nQBZogeHy7i2Ct/vo60Kz7CFrNVEHC6AShlF5JYGzr547jYKH3ED?=
 =?us-ascii?Q?9MmgcfqcriJNOFGHFfInDlLG5Qq2Mn/cWEi83mZUNbYzkE1QqcHuO3ihP2jj?=
 =?us-ascii?Q?zO2emvHeI369kh5GvjIUTqI6xwXKsWXc2MAulLFvJovr3qEEuRGq58bGq1Aa?=
 =?us-ascii?Q?ZaRZKF0q6mLGCPWPsU+Rhz/O7obkc8mB0R8cd/Tugcoo/y2B/tLp87cpyoLv?=
 =?us-ascii?Q?5LndnFNNhC/CKNC5hf32ujcmOYjMU+bBvWzOOMXpT0mu7gYnAwmgsZLqeRCC?=
 =?us-ascii?Q?DnCEreghC/HNHu6yKJL6wID9/GWusWEoBo+H27jt5YI4jKlmve+Unrj/zA9t?=
 =?us-ascii?Q?hFMcgFy2cRevfqqRLUTGd6wb/iAnvCzqQoa3tYD/kjo6Q8xb9oN8DYwUWFxI?=
 =?us-ascii?Q?dH4+Zmsuh7nmfCAlCy8on1BDZmYv4ZWFrK1B6bP3cJk1DLQMQmZjn5VtQpIx?=
 =?us-ascii?Q?7dCyUYLrJTEzr8M9hgVxJcuyfdYc51p3qpPF/MP4vcDbzKc5Erbgc9rZ/hRj?=
 =?us-ascii?Q?jpFJXuBXFQEqSdBap476h9Zyo015JMoD+R5rgBQzhuWczy/YcihqpXLcLE69?=
 =?us-ascii?Q?6eeq6j90Y8r4gmyiATAUO0iG4fyCiA+qKaFY/9iAZ8Idi6fUoROkJWEeZbCg?=
 =?us-ascii?Q?tp61Wr+KLG8HbWHk+CTW7dXGcsPsnC4N+IcNsLgklzciSwpoujro1WJamIp8?=
 =?us-ascii?Q?3GW4ibMnlXCYvU3n7tDs97rUX4tUrCJSTBmYAo9PImXbct7MVJqc779cueMX?=
 =?us-ascii?Q?nfq0YjqOyZPuhNDk1LqJYQXTHIExfOjLFLhh7Ag31Zg21SgVgu65ZZ6giaHv?=
 =?us-ascii?Q?Pu8kD5zd2nC77qmst4QDxkK7Mgi0wzqj5Q5k/OPYsF2Pkx16vSng3XwqOR6c?=
 =?us-ascii?Q?AGdTYpcp7jH6hrV1GDX2uqCqTVToW/k4ruJ3qAgPcfe6U9hTnjNkqBHiVALD?=
 =?us-ascii?Q?hFpzQLkEKFqm1tJxspcnKHdX9Jp1l7+MX+U57bNX1qGJylCPmlxm++iziyEg?=
 =?us-ascii?Q?wVxfqZnbRwHWFqigvAVokz8viHz200dQmugr2/2B36rxLmGxftOqUMiUEbWF?=
 =?us-ascii?Q?4N0K2AuGwtFhA3sEP+3jGcDVUODyBxNBVuve3FOihUwbLFMIEbw0kP8ENb3e?=
 =?us-ascii?Q?WJTNydLLtLyB8hoDu1BiCt66iBbJlbO9dM482cpro2pJygECLVf5rqe2Luy9?=
 =?us-ascii?Q?IzFa8BlvVKKd2IOn8TzSGVj6Ip7mY6ykC7C7yVdDcbYdVZRNctwK7/uryA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 13:56:04.0065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01a2988-5e53-4912-a035-08ddec83f45f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9397
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMxMDAwNyBTYWx0ZWRfX/JEUyN8HpAn0 5uY9Tf0rAuUSqVpBupWgGKK5QPTFbUt7cdNQgb8w6NefPAXurex3pTaQpAIfdJ7xWeIDL+kRuoI nfyUMqwMHyuBDLmJraJYQaC3TK7txuqVNeY1LbU9w6hbCBGH1NseCoLqkEsNXsF02FKg/rMhSzz
 cMDnDdL61M6DH+zjz0B5N8daSt6xlPUyfFfR1hxZAAv5imFZq9tQK8fxs5yY8ZEDJntthvlCKBI hXDeNrRQnuc8/OyB2pPJqZKRgnxuCv9XmHVXsD+OjmAd60uK3thLCcFOtmZI+UM8jSf8MXE351Z fdFXh1GTY+XHLqQ7yWAa5w64J7j9EbLbyG8plLJIMetMbXs9aWWtFzdcSjbygzDAywRKVYJVZoi wjMBCt2p
X-Proofpoint-GUID: trev5iM6WR3EQlajeulmxQEmztivLzvi
X-Authority-Analysis: v=2.4 cv=ZeMdNtVA c=1 sm=1 tr=0 ts=68baebf7 cx=c_pps a=9UA2pjnY6VR9PzjpvXWGAA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=7Z6HTxmNocq6VBzl:21 a=y9YUpebZf6kA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=Nw7eZBQmKDrzE-cWAosA:9 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: trev5iM6WR3EQlajeulmxQEmztivLzvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508310007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_065619_533621_3E43FB22 
X-CRM114-Status: GOOD (  12.39  )
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

Change type of variable to avoid keeping the bool return value in
a variable of u32 type.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 76555d18720f6..8d2f409342313 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1148,7 +1148,7 @@ static u32 stm32_pconf_get_bias(struct stm32_gpio_bank *bank,
 static bool stm32_pconf_get(struct stm32_gpio_bank *bank,
 	unsigned int offset, bool dir)
 {
-	u32 val;
+	bool val;
 
 	if (dir)
 		val = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) &
-- 
2.34.1


