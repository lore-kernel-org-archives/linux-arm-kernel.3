Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7550FC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 23:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgaimE+vjjQo3TM1YDOkSFNxukpz6K5lfxw6G1y+Rds=; b=kvPyzdjLooxt0q+yw3R8vXpUkJ
	vBYokGCyRx3SgBQYhH4HVfGxNWzdjiwnxkEJiAd3ToZvW+onzR3H6FsrhGQZ4RKlWW95upkYSqpR7
	CFV5WtFVuiV6PcCiqvTtSfvXAMKEj46/Rv07Q5ZUa458BPcloqpzlq2iSyWjoKG9k8uEQXmCzHEPD
	CWM3EEUxzqFyZnyyYmlAgoOjAnAaQMkiD+r1y5sUmMynKja21ZX4PhiXAS5nH9hgfWvAWZoOS9Vcv
	A8pLE1a42hOd8IseCzUdZiLO0AiOZ0seveVxxlirrzJpMV3+wpS9ZfLFYy8Kh4s1iOsmRQucZ5Zc2
	CC4BsZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVh-00000004cq8-2vD6;
	Wed, 05 Aug 2026 22:54:53 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVd-00000004cp7-2kl3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:54:52 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVnVg2147858;
	Wed, 5 Aug 2026 17:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QgaimE+vjjQo3TM1YDOkSFNxukpz6K5lfxw6G1y+R
	ds=; b=pwTRrPHxivtFGvCgwsZTG6+CuwunU0FGbeoV1J9xO/ljiIQTznjlDtWXn
	mblggLLKdhHbTCRYLqwnw5/sCQyCr5U21r+hTQhPxc0FQrM1F0GwqzRiB1zSdD7Z
	eMeNbcZdZ6ox8xba9OJv3dlTnG5LrO6EeW3yWD5alm7dVE+oIslC7F1cbBDIXcTD
	NVdVnJGUjrEWLMzecpHouF1C6IJ7y/CxTXsve0CnKD4umjgd93cgHXNkCHzaavIF
	ZuluH0MA+h3iXIKJ9viBR0pTQpIe1liFb4D/1s7BAstBySIjQ+FB32+SVR2q/WGP
	ixOckWqRIM8CjmWN8tW7p37klGaTA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fv43f4vet-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 17:54:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiXLvpT98FueqCIA5mzpZ0XmC6o33G6idVc+AZsYqO0vxZDD0nwf661D0SPsiNkj383ahFVRURgtNJySqoFdo+9PUcjr8leaUiUwMw2sXab8qJOgGNAiMsza5jymLZojw6M/cKU7KBWOJirwu2Xh8+7IcV4Sh926meWKQeBg6j4/wl+0CWbV+SwWm7aM8GlxVCrLe2xxJxrnwGPeu2dzH1M8odTjY06IELi0nMqh5JtCHiVmGFILx07czxKRMQBmtHA66bzQsUZ9fGKVTB+sbzFs9BIHhZorgrm9C86eLYUC8+Z51Rz/bm18E0IkLQUxgr5mWAv2le5TilXkO6xLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgaimE+vjjQo3TM1YDOkSFNxukpz6K5lfxw6G1y+Rds=;
 b=DntMvGqt/8X48I+yYUDfAaTNAGwqYc1BPY6+V9i+LKt/+ePDMRATOb3dPibo8ZGjoI/Je+3zeo/HImlEyO9ZCyzhOClsHCMx9aVd5/4k60vaFmskYycG0RqhwHxfIb64pDWG9GxzG+F7J/UWDQyVKqXguYFOcrLVunxNTKdIQT3InpVLae1HPfAVHl46MWYnYYvZoblAXxzk1NkiYvlAVHqINud37vBal1DtYz6iEWfpWa8ez59kH40pU6+IOiifJ97vS/cKXJEo1GlZgTItGptCZiVFZpcqpM9f+s6+D2tz9zYhetJbFpWInif3LS0XaCf7RQn8AQupph7Acl3XLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgaimE+vjjQo3TM1YDOkSFNxukpz6K5lfxw6G1y+Rds=;
 b=OjR2snKSzYhF2MbblAM1YTYv7Isg8L0gzt5jayRa5H1n5MLq0KY9nNfoQy0zrI3rH26f12iCv/sbuN1rCa3Xe5wPI/dsn949meSUSDvlW4cCUCtACHEyTqTb2VMYVKwtftoGd+uCQfci07t5ccGHn4SEkGFE8kXcNvJJx+m5qkw=
Received: from BL1PR13CA0397.namprd13.prod.outlook.com (2603:10b6:208:2c2::12)
 by MN2PR10MB4271.namprd10.prod.outlook.com (2603:10b6:208:199::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 22:54:42 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::53) by BL1PR13CA0397.outlook.office365.com
 (2603:10b6:208:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via Frontend Transport; Wed, 5
 Aug 2026 22:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 22:54:41 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:39 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 17:54:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675Msctj2968446;
	Wed, 5 Aug 2026 17:54:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for MMC0
Date: Wed, 5 Aug 2026 17:54:38 -0500
Message-ID: <20260805225438.464184-5-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805225438.464184-1-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MN2PR10MB4271:EE_
X-MS-Office365-Filtering-Correlation-Id: d88fd53a-07cd-4ad4-251b-08def344894b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: p54RJrtZ9WsZ5tVa/eoxzKQz9yIgy2nf/DVrKky/PmUanL9LGQdrX4V97eGcA8p1m5EFc7kt5/OeCDTlGRRPdXWonMr98GjSl3ZR2fyV23zgoGTVYCmbkB6w5+Vs/DyxnQCiCVHDMg/wthMMKkf2WuKR25HgUmrbZPezFe0c5CLHoN3QcrY0qLoMvTuGkJfnMNjw+sunzgzXvL+RKRK1toNaK/qOAgGUEg/Ce4VdD0TamLKdCpwjZEX9uqMKydHfSl4hI9X4D6eIajPQZzi4MZtOwjLNkx3WoPud8EvrTvlC8ZkYcOzLU1sXF0/VakncBPXq9g/yuvSCgdh2YI9Z6DhWvRDmIvo/6fVcJ2Vy5X7EAQA3Bvz7cVSlxwDhilB58/Ku43wzLDKKpDGeWd/+ZDQ/yltjfd3+nXafZEI5TLGfOXVrYJz/s+W/2UcMyaUaP8IaspJMaiddCtLATfo9dKKbA6XhBW5igWKqhOvTykOIwsxqPNsJ79rBk0DRMd53MY8MXq40OcozNtRce+SQCfBdY2bIrx1V3hQQMc3rnqdCzU9maDSTbdF87+Og6nLLphAW5wzuz3/rrgXuS9IQ7w7VvQokzyfBPJo9xsA+M35iGsQMVF018ruw09eWrGS5f6Dic1B1sHkoCliueVBCjXUHm7eBZkbswWqql38yLIEC8WBQNb1EJRd2+Qr2x1aqzEnbsx2mredxdYlhxkIDQg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sMVlb+wS4n+gDT6OYjoIh9aViMnA04OJmOWOmZ8+aQAOz85RdL0OtRxkjfdJ6vnRVZobcjeJyLPpY55uNi16tz4Ehsv0TAPM4QKTPSygEI/kTfERojE6+HAslWT+3f2Hliht2aHK+OdIe/Hk2uZwjHzR++56ttpGbjpCQlWIsK2guanjb0XFYuGw6Se0mh1p1f2iR+51ytbqwMO5ygW8eHx9Apg3cKhAdnyBzCM8vV5JaHNP+BESkhGVGmS/GiVH+7QiWxRQcDO35h+GaihuydgN/ze9/zXLmsanjZY9pvZz8DWRluAidZL7X4TeLLLTmBMhPDUM89Q1tVDIAZflVP88N+M0+KFvl4lx2MGnuqvvZUA47eXJWEa8jumaS7KJNhkJnl3la5WTl1uq+cLSYwSar6X91+uLc2MBgQk78oZXS8cZ8dPft9HVgdk0S8JQ
X-Exchange-RoutingPolicyChecked: epB/lLeAE0JSbH15pRfyEpUE5ubSM4klmisTgZGbjgiZGyI/Vt7fcs7im+jC3u4B4SM1V5AxTFGT2yTrU44Bq6/VEYw0lanS1WEyKosBqR+FVYwaxBWeyT+6bAYlC47rRfXgAUlHOi2Ifv6C9kyN92XVe5H9a35IqUk74VxmTGh1wH5BXEVwkz/lcz/bV17m4Uy4atAV6VNWCCfacY3c3s6BU/YhL92FZNY57/EOABw4P7P8EpekQdEMgKE6jIJdr56KbvvPsoW6nkr6pQMpoZSgOEf0fMfUILltA8W5BimcT/RMKQVgcR1QA3jCa67brmKLJi83i6o/IwEGNKPGQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:54:41.8814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88fd53a-07cd-4ad4-251b-08def344894b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4271
X-Proofpoint-ORIG-GUID: l1t_H95Md7MOyHeEm9cKNWDyx1_unLtt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX+vBsftAb8Uvc
 8MyJLMr9uyhf4aYgmmj41s9Q8pETNBKMLoLqHk+x+HMzPlym0PNRgrLKQC05qtCrikYxWRCRtpH
 KuDzQyaNJzCUie0k6oP9QK2vZ6QaLww=
X-Authority-Analysis: v=2.4 cv=Ircutr/g c=1 sm=1 tr=0 ts=6a73bf36 cx=c_pps
 a=0JRlrhwbVVPmsaj0kffiDg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=ejCK19o8EeXzOiwc5R0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfXwl/oGzwPHPQS
 /EDw7I77+4s0FSo0OkOPJEei/lsomQhheoXxGV7iQLEkXtfayIxuFMZxo/sVlwjfVxCVWRBxdhm
 2YkhNtdZtFHhyS9UfYK2712aPrl4eAJgJO7s1Z3WDKeqla0VNC2B70oqjR7PDvWGkuNRf4a1O8R
 YhdkDOqldMHqUT4LRM3uY4Jv+nn6oD1xvYNH27HY9ZWiOE0DHUMDJZVg6g47w9Di6Oq3XCBrmjn
 +5iajqhFhZUmkQ95x+iKjd2I5gh5rFBeWMphuH6Dd9mOdOqzR/CTEAx466R5gi9aAw/k3K/DHqn
 CE8QlEXN7QKkCkusGo2y3JRBfSidu33+HhXnWxSDvaq0TQaa+mbMsFkVeesfG+3Vj++2USyoLwd
 jtFlfqo/Y4OFnattMWWVygtL2lfEmRqoOZYxvLnnTlTCkhzcpemGU3REIzbPpE1aaX/jBviSgxj
 GrgRhI88MqYfuSCKSYw==
X-Proofpoint-GUID: l1t_H95Md7MOyHeEm9cKNWDyx1_unLtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_155449_968386_96014832 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Add patch
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
2.54.0


