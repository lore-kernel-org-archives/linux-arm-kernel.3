Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2244FD1D47A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9IydClqwChD7bd+kZPcSc/jRZPRXEvrVnQEUNc4hbY=; b=vGFHQwaqJvk9B9isErdGFyrv1V
	U4q3KUzLYD7WmBUUWIs7itKD/0OUOtpdlHJvemI98/XB1OiO1M59MW6CfPOEatSZZ4w44Eia/jSNV
	FLSGjbc3KNrloAVSSJ53CYR8AEjkmkJ96Fhhmx/CP2r6zDbNFqkGYaCB4g03Y8rqeXgupGr/V7aYE
	44DlpzfNQcoZvVDXwGrzrTHSwQVjIDtmveTKbyjpfB0mGf97ctM9jYCbrNXAEM5KswVU+jW7o5zCM
	r5YbANpg7fFxN8RY04caRK37dbdR6+jAepxWMK+GfwRypH5Pfw7GnPoakoJgEDZZPX4yD5XezZGXb
	2S3INUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrsa-0000000HVsw-0BwX;
	Thu, 08 Jan 2026 15:24:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrsX-0000000HVrQ-2FF9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:24:51 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608F0rQ33010520;
	Thu, 8 Jan 2026 16:24:39 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhb7pft8k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 16:24:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz8q3fsHKgo/VVGeceEgX8e56GeUhGMOLvWKl6D9Z4FKWVF0Y3sGbZD1Ofhn9jY8+8JFbHAB2rdP4O88I8rp0DPOC7OwZQB1e24XXgYI5aBBf5kVOAdQU3R3UMXufozRGYEySfuNxN5L6M4XrwdSYlsK2DW8BNxPXPT6Hfp5bXal1PzcSeClSXV/nuPkhi4nO+oZnko/mY3Kzvpdx1woG7tm2VFBJn+x7LHck9bcA4PTZP2/rCMe05XBgU9OF1qIf0Ixv9+LOyqTfGMdrCsJWHAKOK5iTTXoWcYX/ftEys1d7z57gVWiIEfHIUywJHUoJ46fZnBMuOrb7lAyjOZWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9IydClqwChD7bd+kZPcSc/jRZPRXEvrVnQEUNc4hbY=;
 b=C/F8BUBkjv2etjrZtvnPcbT5sZ74Tuji7+su6Kj5nUhAmQVvCzlg0xh9iei06oK0sXUXfgdPTjggT/MKu+qLNYcv48P3LYH6MGgxVL9mZwTwWsunij0SH0QQJyOETsO6yEOtSDXvCppd/a8Y27afk6wDylK3JM4IP9CCNozHBRLUzVFfScLQEntZHealrpPDudTMwdzt/0hlM/nSeBkmvl1EcTk6pl0LzAoAU4JZja3DwFpXGUx7aKB/ni6qXX/rszQx2vs5YpqIqPquocVvIiTDrT84O24eEy8uqg/h8WKMpGxdZwv+dAzXQpFKsdcHA8qxN812XrbGphzUEzInsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9IydClqwChD7bd+kZPcSc/jRZPRXEvrVnQEUNc4hbY=;
 b=Z6j4zi0X+6YiTfKCjfyDSQ7jvy/AZHYfpcph5klq/564wRw+OTNp/oJRu7P0K9MJLBYAvdgbL/o7jwbE45c71qn2Y+5HrTgWk4j2YLz274/OAt2rZGnvMtkyylygWaTt20LhLw4QfToj9S1t/mwqv282+zaoZQ0Hpcd+SllwzGesK8T+OxS0LRPsVJXo2F4Mim/DjU756lF+7+zxTEmxJKJIwiqJCpeYWSbHtRedvmKSaXcIMPHnIlTaRO15dCy1LySRYgo2Biln+6DQnLOjXWFI0+eS0YDjoD7l0RkFQZYOKLM1U9DuQb+9/vkPyZSjhpZNEC+J+jB7IMXVNGqkXQ==
Received: from DUZPR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::20) by AM0PR10MB3266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:183::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 15:24:34 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::ee) by DUZPR01CA0026.outlook.office365.com
 (2603:10a6:10:46b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 15:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 15:24:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 16:25:47 +0100
Received: from localhost (10.48.87.74) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 8 Jan
 2026 16:24:30 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Leo Yan
	<leo.yan@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Tingwei Zhang
	<quic_tingwei@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Kim Phillips" <kim.phillips@arm.com>,
        Sai Prakash Ranjan
	<quic_saipraka@quicinc.com>,
        <coresight@lists.linaro.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] coresight: etm3x: Fix cpulocked warning on cpuhp
Date: Thu, 8 Jan 2026 16:24:27 +0100
Message-ID: <20260108152427.357379-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.74]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AM0PR10MB3266:EE_
X-MS-Office365-Filtering-Correlation-Id: 221e0a5e-9ed9-4b5d-7706-08de4eca0707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4DHFWyTDtH2MRqFqLpbZhd+XQmSui9TSbjLYfl2NrB3EXOz1m23MRbRWpzfS?=
 =?us-ascii?Q?uCkBEI87d4J6y49oQUecRiyKRTCWaJ4h2JPZYMK/huT2yIIzqwYPUPZwZyNT?=
 =?us-ascii?Q?L+9+TDCdKZo5M2GTBGPG82ko2UvULGy9Rn1TTaH87gJKV8z3FRRqDPJPaZMA?=
 =?us-ascii?Q?/8dcHZnF2TVJrw6X6wsvExisNnoBES5ncEquti7qJaDGcCiNykAwptM6tUlt?=
 =?us-ascii?Q?GbaW3LqdTAiSukN/cu9Kg8tzT7NleSDKOtXU+oPRBht5T9+cTvn7TXgQo6Sv?=
 =?us-ascii?Q?XNxENB+8o/IuzARyoHcLYx5htTitCPIU4tIeiv8Q2JIvvbrtVGX7ssSU/j3z?=
 =?us-ascii?Q?xVEJieLIz9xQcgyJF++UbMa71Zx3ZsEza5s09zZ9BXfFfccf2r2w2w1UTib+?=
 =?us-ascii?Q?S1v7mDbRBzhRKgwYlQoXKpxFuvxMAE3PXf3pYpxBdTXgLMDJnTvPXFMuHkbJ?=
 =?us-ascii?Q?qnj74NKIU4KbQyTZe9FvV0biqbdsUDYRTKD8jCGfXoU69b73tDaMaiWBq+wQ?=
 =?us-ascii?Q?RKaIwwjGc4HPnPz4DYhZ2LfjHWWu/An2nITKvbjGj30fnaf0VF72I6fw6TUF?=
 =?us-ascii?Q?0JEWmmRsp315gFH8hy46J0/hnjZifbn9X0ZwxQ5fJrkvFZfD+4V24ojK84SM?=
 =?us-ascii?Q?1/92gQF2dVg5gzKBmXdFizEVO7007Fv5foeDR68bsrEi+Z8c8H0Yfy43Z0ze?=
 =?us-ascii?Q?pz3s0qBDOFmEpXi8F9teDt29IEAJZMx4m3ikzQdj/Lo08nAnbnEwDaaIKZ5E?=
 =?us-ascii?Q?mAFShFFyGyH4U9clUpD2Qwjdcx9Yyyk07G7M+sH1TSSDiyR/D7aPQfAKvUt/?=
 =?us-ascii?Q?nO27YKTRmnywN9Z07pb9Qu60fFB7Fwai1kmQEVtVI9NRgaLu1EAi04e4AP6d?=
 =?us-ascii?Q?eHQlYv/rOcl50866YJbN/mQXJvKxzbCJIss7ojYaMdfxgISEBuSFiQhD9fNI?=
 =?us-ascii?Q?gyVAykMZ6plazrVqmgSUjJQreOPeePksSUM34XmMbXybG0G7Eu4qvvNJfxj1?=
 =?us-ascii?Q?eR+Mn+uKXPQ4+vZw7OCPwRi6EXBMkcDnMtpsmNgic7FtsJmyENMx8JOx+ktE?=
 =?us-ascii?Q?bo2j1Xz1g2bb8UfO96lw0sGohZ9unpUTwh95LaciruPbnN7Q0QyefoyZ2NCG?=
 =?us-ascii?Q?hQ3s+o2zH2z1eUbkWW2vxpnfEeY5cdpWYKChdQcjZweQbdq5yL+nQzTqbUDZ?=
 =?us-ascii?Q?tM9a6XTXqr1XwKHdmneJ3Jk4YNJGmRdyUFvhXdiNzSgQ65NwiFD1BF9Fnafh?=
 =?us-ascii?Q?0leI0q9KQKOe/8sej4+OMRO4NDKdJtEYkxNapCqJY8vJ4g2eS4RHAe/DBPb3?=
 =?us-ascii?Q?FNzzidIwA7FfM5A1V3ZaMsPbzvTc9LQkMnT8s+l00f14xv2O3Ln8BlnglPnZ?=
 =?us-ascii?Q?LdgkApSzITcLDp4uRNINY+o77K3Mjpvu9S9ha74MaPd8I8YKTSuWQK0uG9xb?=
 =?us-ascii?Q?FOeWNYJi3PYAA9n3JMShBF3YCk++o0lZ0XHeqeg/j976mniLJNKNMw3JxWiP?=
 =?us-ascii?Q?2wVhoboypNd1LrAqHTRYB7Tq3ud2UpfCSXpejiP8TVynGLR9XYwRpYU1ZZ++?=
 =?us-ascii?Q?IGQ1uuMReseyz1Cqs5yVUuLQ/qgcYlUyxMwu7cT/?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:24:34.0347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 221e0a5e-9ed9-4b5d-7706-08de4eca0707
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3266
X-Proofpoint-GUID: NkYVbEWH_SK-RyDEzff9GC125t1fxvh5
X-Proofpoint-ORIG-GUID: NkYVbEWH_SK-RyDEzff9GC125t1fxvh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDExMSBTYWx0ZWRfX0ZQo41QZ1Fhh
 mca12xXmcFtnUsmpdfxxS4VvLEDuw1asbzjqWfb8AIsgvSt3MGksSnf5d1athV+g4mgVTz4282C
 952tGtI6WjnuEyjQ3Qy9OwA1gkzdDOVU7X7b/+ztYz998tdnRYBsdTZjmUS3T+MepjCnFr45X8q
 skcXPC2FlBJXvgQ7fEarA9tRrEu82MgFo3h/wUFaH8ZGud0hUxaCFafY7JQWZg5EUJepstkp8cz
 jwuLgEOtb/R6kt/q98rB7BvFQN6lDZCtSuVO2YCmcACL1j68uaWN2oPkl4MPzompJfMGBUVpH8q
 OwfAGhcZ1tFbYnHHuUQ2ppVbZrcfNzo5YjR8TMzjciv4ICt1wdCIq0z/VhaIr/R1zNOZvAHaab3
 wFx8xY5i3cQYYdzKmdEQMiPC/ddNYNGn6Gi9UfMn1DPHWm+GkN1SIvebR5jhCOLe5iB7/wBZtMW
 L3aQdIjdEa7DvA9yyrQ==
X-Authority-Analysis: v=2.4 cv=DZ8aa/tW c=1 sm=1 tr=0 ts=695fcc37 cx=c_pps
 a=UL8Y2u7OeXHk5zuoyLvCZQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=BtnWsgAew7IA:10 a=vUbySO9Y5rIA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=phlkwaE_AAAA:8
 a=dzAp36qkVSUYq1pfGiQA:9 a=T3LWEMljR5ZiDmsYVIUa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_072449_875407_1A2CB6EA 
X-CRM114-Status: GOOD (  16.15  )
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

When changes [1] and [2] have been applied to the driver etm4x, the
same modifications have been also collapsed in [3] and applied in
one shot to the driver etm3x.
While doing this, the driver etm3x has not been aligned to etm4x on
the use of non cpuslocked version of cpuhp callback setup APIs.

The current code triggers two run-time warnings when the kernel is
compiled with CONFIG_PROVE_LOCKING=y.

Use non cpuslocked version of cpuhp callback setup APIs in driver
etm3x, aligning it to the driver etm4x.

[1] commit 2d1a8bfb61ec ("coresight: etm4x: Fix etm4_count race by
                          moving cpuhp callbacks to init")
[2] commit 22a550a306ad ("coresight: etm4x: Allow etm4x to be built
                          as a module")
[3] commit 97fe626ce64c ("coresight: etm3x: Allow etm3x to be built
                          as a module")

Fixes: 97fe626ce64c ("coresight: etm3x: Allow etm3x to be built as a module")
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
To: James Clark <james.clark@arm.com>
To: Leo Yan <leo.yan@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Tingwei Zhang <quic_tingwei@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kim Phillips <kim.phillips@arm.com>
To: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a5e809589d3e3..0c011b7041696 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -795,16 +795,16 @@ static int __init etm_hp_setup(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
-						   "arm/coresight:starting",
-						   etm_starting_cpu, etm_dying_cpu);
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
+					"arm/coresight:starting",
+					etm_starting_cpu, etm_dying_cpu);
 
 	if (ret)
 		return ret;
 
-	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ONLINE_DYN,
-						   "arm/coresight:online",
-						   etm_online_cpu, NULL);
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight:online",
+					etm_online_cpu, NULL);
 
 	/* HP dyn state ID returned in ret on success */
 	if (ret > 0) {

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.34.1


