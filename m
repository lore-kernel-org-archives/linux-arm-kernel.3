Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C8DCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1G9+wnjhIVtNe13hJ1+5cFOYjo5CKFm6Kn2wD28mvWM=; b=4rN9KH9D/1SnfybPDZQOFA2umV
	Q6UT0/VJReAc+ORHwqU4/y0ZhN6kD5/riVdHvBEGFTjxVGPAU+hGs+RT+UzdqO0G16U4We7lkgkpo
	Rf4kHz0PpbDTrTZyAvzYESBw7RCSss0OUX0o136oonQttibOZwktC3/b1qb2dNg2O0dLgpVvDNXf4
	aFJT4LfcZMrspSwEDjWT3oySHoZgI/ZC7XD6Gw5M/TwHzdXsGiANnENRoW6SisgGMgBIdmWgvaq0h
	eg7562ttjqYQvz87nhrrUpgb0iNMrFkvl8udSKsCHa/dp6M4yTC9GXJQIJ55PbR5Na5j8KVdaZjMZ
	FK049iHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8feZ-0000000GYUR-49B4;
	Tue, 14 Oct 2025 14:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8feW-0000000GYRI-481N
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 14:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1G9+wnjhIVtNe13hJ1+5cFOYjo5CKFm6Kn2wD28mvWM=; b=fnBhm9pfertQzgQpRNRuge/16d
	/ISGku6udIeSU9e+0DqCrDTaFU8vcNc1jhoBLUoCU4FWQaYr3zkE13GeIuInlD8dSKgBzv2ST1mJ8
	+UK8/tTb0NE4o0Uikhwk7FNUBrtfmYqPF4aPfhctqlUpAABpFbfxw7K8Q4JmostVpjRykUvtsPKCE
	9u5BfyG7fQ16os7vPrTQPM6WW3Evej3mvDLxBq649xO9YJtwtda7gAA3wd9WSMtMEN91lYumlH6uy
	Is5Em0LhFj3KgX53auwK89C69N7lrih5S4GhFdasjh+Dl3wnzrfjiy71+vvDuRIl30V6v0dNO4NA8
	/z+x1HaQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8feS-00000005EKd-3f5u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:05:23 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ED3mIY010293;
	Tue, 14 Oct 2025 16:04:59 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r0t02af2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:04:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiGR0BVTd/FSaUExt8sO9c0HXANdFT1pJw6K0eE4qfG9g8aRrxugCpIbBx0eAajXjJwbmAN8S39alryevrl7jjaN0wwWAbCsOri8mCDUuYo4u1UpzqFFvfANl/+OzlppBOMEjB6+u8JeKtYgo8hkV4IPjNax/GNIZKGcU2Wia0FKwLzgxZTDpqgK/d24ViXpi8nLRzZwjSzBL83zN6WXy0kuFzK+uJB0uwk/dpxK74EuVppsy/kfVq+DVyj/8rCrQ+hgMKdZVf7VcJDObCRcTvapCc8Ggf+f4ybQ7pMoWNAo70tqEO9DFs0INfKuSXeuYs/LLEZl2+h+2xTrpBV4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1G9+wnjhIVtNe13hJ1+5cFOYjo5CKFm6Kn2wD28mvWM=;
 b=Nk42bhr4DYsk2oBHWETvWOCcnNIocYDjiX2zE5ZSPjCuGujdnDoyPoA4AyxGBKrkkkz8zYPUNaJggCwbUGH5QRE6nSAEwWQCymrRUZul/HWE5rOS26Lon5zW+bT/1ZB9Y7DdE7iFQng1WVbMVA1yq7kAu+4rByFky2NtORBbJPKm1h01cru21xEyWMzIFgqsom4d4Lw67rtUmd/duL8YPlKkIqbK+P5IkK4Jt9K3t/tbYtpgMI4eMWRRWa5r2pkn++vUH155odrAMxtAUq9x5KwwwXsWEWQ8eVTpM+0Y+cqFiqVTKKGIYWqqlf542B1bNV9f/hOi8gMFwnU59ZjekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1G9+wnjhIVtNe13hJ1+5cFOYjo5CKFm6Kn2wD28mvWM=;
 b=V/sCWUXQViFPI62WRJDGKkC9sZnoIrrP3deAk25rLQkaXzciAJ6yotGBG/GTJtek9pzvideG2/DdX5ANmqIElBDE5KG4I8q61SdnqAaHW4ChGAzbX85Tc+RirfKis6ZWhF8F5YRZ9eHCf9Qlu/qxDo68hvLW7PzN/E7ms8yok6hOnb3tEzS4/Y/avKZI1au7RKXaD1sIworAUFnPZfUZ0b+qOhENSxXFALDi5JOYtWGdOHka6IXj0wbqPxYwzn/+qgnaK5Z5dEr8QEsB08mUA+BKXdxmSe3eau36H4iQ2CARbonaHrEH8Ml8VA2nb9cNtlWsUH4RgN0LUkfdUWhACA==
Received: from AS4PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::20)
 by AS2PR10MB7322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 14:04:57 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::2e) by AS4PR09CA0030.outlook.office365.com
 (2603:10a6:20b:5d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 14:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:04:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:34 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:04:56 +0200
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
Subject: [PATCH v3 00/10] pinctrl: stm32: Support I/O synchronization
Date: Tue, 14 Oct 2025 16:04:41 +0200
Message-ID: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|AS2PR10MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: dc783edf-1989-4c41-eca1-08de0b2aa802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?36cJd8N1p1BMqMcr278K9VnYfZH9me6A1qWuswNC86muEDKVyuEyQy2bu9ut?=
 =?us-ascii?Q?J80BnNJ6HdQPbiz7FafqgMKa1ea4X7RqXLEPEsMLnrcHPEo8PSn/OdoG/uum?=
 =?us-ascii?Q?IY3rEJB26RTQOykn6K5YEjj+yapP8hSlq7fWlThYbcXJo/zg86a0KVZHWf+4?=
 =?us-ascii?Q?coB/O6+VdqnjQu7K7ccZ3jTHiokIxl0m18FS/XEz0ZzBoLWdKlKAm69tOPHZ?=
 =?us-ascii?Q?4RjQOhtjbzyOs+TU0slCnLQG0Ce8Xkvn/ylwasPqFI98VGXP6+QqSqLG39cc?=
 =?us-ascii?Q?P15LDLuupjh+1u2H+0eSizdSqFP6XFA0m591MkNPROt9K6mQzULwNW/Xjgob?=
 =?us-ascii?Q?3LcMhfZlNKKgVDUtfh6QQMc7scdoYxvnoGitVty3qk81BOFp++MPjn1Eu/Gy?=
 =?us-ascii?Q?DqvwZE36/7JDSLR5EkZsQf89E3OlXUGPBFsopaM03vf0LE8qvXRWxAsXLrKw?=
 =?us-ascii?Q?0puYgP0yjM2uX5+jBqwb/KpApsDiqTbPa1Kn0BO8Trgw2cd5G6UsXd4LTyug?=
 =?us-ascii?Q?UmDvLM23/UHrX8yzFR8F5EyVIGaoILR2XDOBjTCbpjR8nAtoUqcAw37gKyUb?=
 =?us-ascii?Q?HpRqSjHE5iRuILvBN1cYkk6qlM+Md53xONNXy6ki2Np1Hqg8CVk9uycNeGhX?=
 =?us-ascii?Q?zbT35bbT7e8fy/vw3awRSi31OcQRk6n3O0BFpwiM7cwCzgsfnWwyfu68M/MJ?=
 =?us-ascii?Q?U1aO2yXqeYDkNdpzzTtpxXUlBHjFUXyK5+UQSh2CzdgapN7eczms+HDHQeRn?=
 =?us-ascii?Q?WSPLGjWLq+hvmabbyFuIskxHyHhirhqFKXdVOdhInnjb6vJ224+7NAbpYf39?=
 =?us-ascii?Q?a0iE64gD7WWxSpvObh+9I0wejc0NvDdHWLWgw4nKYj+ru0NeIEGAbB5qqz9N?=
 =?us-ascii?Q?J9AVY85fWoR1t0lrBC0AU8BTv4bHAm2f37tARTakznQJcHRqXSDfC0FQR4dI?=
 =?us-ascii?Q?4S13CEgLye3U+Fy8OmYncfGHR7WAegsI3z5dGECf7Zn8A1De6f48HTaqf2mN?=
 =?us-ascii?Q?ll8VyG9ASJf6QQhrq/8Dl6nsY5kLcXCSmTGIP4DvNtg6k+Qmrh/MiVEX0PRX?=
 =?us-ascii?Q?nsW4aLe5aexnvi7IqPjPJ5AplLff29SQDbyR1IISuCRxGOKSQNR5YTWUX502?=
 =?us-ascii?Q?isw1HLlk4yM5xRh9LZdUSHvQTR9Amn2UjPa1yhxVgN3+MCi2zoSnh6Myw5H4?=
 =?us-ascii?Q?D4y0oIfcsqML/DuGeJdZRvuDordjv/m1QejeCWToCo6CAWrHaTdsTCsZzrFn?=
 =?us-ascii?Q?VPvnPGoNcZuKHuq0FBrKRwFH+BVgsn2WO+Rx1V7DWz+fsoWnZ2PoBtjLpEa7?=
 =?us-ascii?Q?1O6YFTE2wbx0kV3ZzOQ/q4bfHwCmYm+nSRmDmFBsnhST2EhbQ0uM0/pk0HAW?=
 =?us-ascii?Q?JWEEFpq351mMXKRt3DXaGMyhP4h+AkfWeT7rzk4gYS1s4VUjzEheVTwnSKwX?=
 =?us-ascii?Q?EseMo7YqSOSzSatPXaBwY8COcW9nO1yDStSKUnDiKekm+shIRElYdM606Rt5?=
 =?us-ascii?Q?CBuogSPANfb+atQHpn3GJU/NQCH9F25oVthytfp/nV40VS+jwGfS27UKP1gV?=
 =?us-ascii?Q?5+9nc4PouZhj2/Ogaeqf2mTwaTJYbGaYD6rI2c+q?=
X-Forefront-Antispam-Report: CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:04:56.7352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc783edf-1989-4c41-eca1-08de0b2aa802
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7322
X-Proofpoint-GUID: Q465c8YRqbP50l8xS5boMoL9pFsKVAnY
X-Proofpoint-ORIG-GUID: Q465c8YRqbP50l8xS5boMoL9pFsKVAnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDEzMyBTYWx0ZWRfX0FxZv2ZLDXtZ
 ZdfT/LzTtRajHMhSd+p7NNdf7DYMjDp9ytqefKXU6TLAUMFdWkirHz014NozWJWVZCUzFMmgqwD
 8rlOOJ/cHR6xVNCfvsRZh5YMVSX98AjQZhd+PW0tqXqLm3LZA8cTjiCmiyswq0S3/9SOOHmRV1q
 QJCWhw0zaehEdLl4Kijg9IqvPKk7R5QnZ/vgd5DcbhVgk4ODG1lyAYl4hNp2dygwpPcI0vXBNKV
 H8/5dsot7sIBkjPJmTRp7DPppjIhkkQfcVWo1a21uzZvTNeeQGsQjSRv5PLg5vk1ByCazxLSgtT
 xmcYNhmiNQGkwgmAIzo1yCJOvWK5nxzbiugFAKjpIL8Qexei6rvF9x7QlzMP0enQdh3to7dxasN
 SW+X7TusFBTS62eSHAciKCSRr61WUQ==
X-Authority-Analysis: v=2.4 cv=dY6NHHXe c=1 sm=1 tr=0 ts=68ee588b cx=c_pps
 a=pOr88aQqtRPe188Gsff7+w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=YQQ0Qr8HmseqwsnO7Y4A:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_150521_591542_77083E48 
X-CRM114-Status: GOOD (  13.38  )
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

This v3 is a subset of the v1, split-out to simplify the review.
The old patches concerned in v1 where 05/14, 06/14 and 07/14.

This subset:
- introduces the generic pinctrl properties "skew-delay-input" and
  "skew-delay-output", as suggested by Linus Walleij;
- applies some cleanup to STM32 pinctrl driver to simplify the following
  commits in the series;
- adds support for the I/O synchronization in STM32 pinctrl driver and
  bindings;
- updates the DT for STM32MP25 pinctrl to use the new properties.

Changes v2 -> v3:
- rebased on v6.18-rc1;
- replace "skew-delay-direction" with "skew-delay-input" and
  "skew-delay-output";
- use generic properties from pincfg-node.yaml in dt-bindings;
- add the new properties to the new node eth1 in DT.

Changes v1 -> v2 subset:
- rebased on v6.17-rc1;
- replace ST property "st,io-delay" with generic "skew-delay";
- replace ST property "st,io-delay-path" with generic "skew-delay-direction";
- collapse the other ST property in a single "st,io-sync";
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/



Antonio Borneo (10):
  pinctrl: pinconf-generic: Add properties 'skew-delay-{in,out}put'
  dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
  pinctrl: stm32: Rework stm32_pconf_parse_conf()
  pinctrl: stm32: Simplify handling of backup pin status
  pinctrl: stm32: Drop useless spinlock save and restore
  pinctrl: stm32: Avoid keeping a bool value in a u32 variable
  pinctrl: stm32: Support I/O synchronization parameters
  dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
  dt-bindings: pinctrl: stm32: Support I/O synchronization parameters
  arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi

 .../bindings/pinctrl/pincfg-node.yaml         |  22 ++
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 123 ++++++-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |   4 +
 drivers/pinctrl/pinconf-generic.c             |   4 +
 drivers/pinctrl/stm32/pinctrl-stm32.c         | 345 ++++++++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.h         |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c    |   2 +
 include/linux/pinctrl/pinconf-generic.h       |  12 +
 8 files changed, 421 insertions(+), 92 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1


