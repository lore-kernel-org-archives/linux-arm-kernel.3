Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86222C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSN69KuGGm6+HG3bL0TgXhPXF+rvuJ3FGFWa2ibn48k=; b=jCTS765CmkBG33ZI0RSgGwSz3Y
	XTgUPBSQ0/gB8Or5jxYs0+EANgm4olidkDoSmJG8BNwBWFvzns/FvUgZRuzhCOJLN104y0tb8ZLrE
	YY/vbUvsdvWFVBktVIn4HwncS9wRfmviGXcjTKrwv4Bwy3/JUM8WKswR2c1cmcGNRLSbdRYhep5km
	EDL3vZ3jpGoJpi4j+Igdkwt4qWG3UL0NC1aULQTWFlsZBa62tcVmJtlJtnuKpLiFFP28IXaGdxgUh
	hsRRHwHRaYuNj/ZWawFoiV4a4tLynvTrUk3IIOYMLmDy9eEFehZjBoATrAFpGCZOnB0MLU8QhxNbD
	/LBwy3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7FJ-000000010ov-3loH;
	Tue, 04 Aug 2026 04:59:21 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7FH-000000010nx-0VCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 04:59:20 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6742GjEB1214548;
	Mon, 3 Aug 2026 23:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qSN69KuGGm6+HG3bL0TgXhPXF+rvuJ3FGFWa2ibn4
	8k=; b=MBJ7irSY/J35ZlIxPRk7Xy0Qm4Ga6I41wDh+Sr7CIr401CGriEp0zfa1R
	oSODhKbRYmrI/5HasA4Ly5oAP20o2ZRQOjnDeZ0oDAErb2sEXbYIQxBNj/S2nuvY
	tsdmyB9BxJxNUsSSjaI7KlJ0KGeDInJ91dKXnMCtk4QvXZ/4Eclqfy0dhANkm8aN
	vDNwuPCvmvzHdmITqRKOPxrhH5o9yE6yV+Ga5YfrVqOgBC+Tt6fLWs7fuPr6Eb/M
	j6Nu2FUTpPxApjDFqTaNi+osgOp6kNyS2EUpOl7PilF+6hAtYsR4dlsnT64rGisb
	B7QF0KV0uI86CWkE4ji2K2LJ28d5Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fu75hrx1w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 23:59:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+lxpmVucN2pYzks26YXh0NjUreZmh7AXxPCgu2iBJXnpaKuoX+nlXs+2JBPMJonzTMzFCK4tZKsXohcmetFdz6jhxwM4NpGpMesF5a9XGI/hSJryB5uEHgaN/TzSjnPnyDQfar/bIvi1dNHTK/wTaSoiOlTxCGV/FvlrZ7ZHgJGnBsIM2TqGGi617HIkwuGvM1nRFOyDABylAd7K4CkRHmpcBV8CHFc5f1rEs9ZHBFMBKUSMUM6yufieJRTHPuyv8ILEuvXmZxk7QhtKIkxdhPRyPRq3CyashxecIshm/w8QJUpCAuT5i0HND6ZilHzn/fvvvxyVCwdNSRYK+p6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSN69KuGGm6+HG3bL0TgXhPXF+rvuJ3FGFWa2ibn48k=;
 b=Yhf6NDgj3ij1pygFW0iF+HegnYU1/wD0cApE5VbsBDs84Odt2qYwGUSfZnzpjohshblcioqZ3trNpnHXagJJemO0uqvXBjAggUrqxYn4xaNvtlvhoZeC+7XavoGXVzbIUBOYjemwPBdj5KVsJeZXyB38UBRR1d12C+Z0GL4iD9aABsWKnwf0vErra8sYeeihbPZxi7Gue8rFzhaAjDVLPbl072CDdZ5bOFPZi9u98KctgaOGWJKR1z9XbcSJCY0XZffZv6SitlVGSJ0p6zQRHuwt4ucP1asDopFa4OwZYrsA5VVemXGP7ADK9h3aQ3wCu1MfIbcIJlq0+yukSXLD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSN69KuGGm6+HG3bL0TgXhPXF+rvuJ3FGFWa2ibn48k=;
 b=U23Z2RQgyc0YpnsLyoNbv25wUWPdHFZS1uN2xPB8nkCWlgmPKZwkrx8ZV9yhXEIs8HnWdrbMZCpmrJp1uHy+NXBJbO4j5wQ/Axs2cWXUYRYRafV8FClJEiyRX/Y0oD/TJdFJBrunHeLDwYHVqZ6XsAQDrN306YWe38Od3yaGKns=
Received: from MN0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:208:52d::16)
 by DS0PR10MB7456.namprd10.prod.outlook.com (2603:10b6:8:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:59:08 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::a5) by MN0PR04CA0027.outlook.office365.com
 (2603:10b6:208:52d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 04:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 04:59:06 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 23:59:03 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 23:59:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 23:59:03 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6744wwfg3035278;
	Mon, 3 Aug 2026 23:58:59 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jai Luthra <jai.luthra@ideasonboard.com>
CC: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Rishikesh Donadkar <r-donadkar@ti.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Message-ID: <178581953402.886571.13943377103110525794.b4-ty@b4>
Date: Tue, 4 Aug 2026 10:28:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DS0PR10MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cdb7bc-7380-441f-d1cd-08def1e51d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|7416014|1800799024|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: JaPX6Wju/3UedrjD8OTJNIY9RCMaAo9QzOZZSsLPlil6TrCnDw7PKAGjNUQ/BUX9Oo9r3yha3obyUxOeM7m33d+KRCZ65Su7lmb452r27PnUoOsHL7wfZDO8KdzxMSBM5fztFwjqmeTdLAeiPahgHFtrJ43tjDF3CBEfWqK/83NKJxve+rKlh8wjfM88daJNLdHIqR6SEzD0iEOFgoMp9AfMO/LW2tZJZqwMBLIlkUuqw30NRrIL+bPMyaFWLInwMtcTLgFYw/Lf7W+a6Ttpyx7vSRnETxt0fLhgJM5gYyvjvQGdzuqlVmD6Rib1G31Zxg9y3Fvyld6j4syzpSzupDbfzlR7ynyxKWppcE+MlkT1ivxvUMpC8Kflgyul61DiFo33OnYt48eh2hlmvgcu6ZXYyfmO9Iwm12aqgpraaheh5iqUa273CvZ8ogv9p7wwNE6Yjj7wKlI37qCSZz9QDq6HqlNlcLIspXb1jxgipI0TxjkQGW5rOljrL7RDKaNBjb3CwGfijGPLoeozo3S3nuLiEqqoJhMm7pJeVNgMi0Q7Bpw/zOQJ8bvNXQSE/LHkAmrIT79EE4sL+q7asg2eM8fZ1mVF0T0DrKEBaK+2k7YZaud7axl9w3ncY0ePk3Alc7a/x72jEL/0aPrNfpyoYpXCQTBFAxHahTcRQFPaVzVbQLgXNcXQdZMTOsb/FC1b+39ThqOef6pQYNP0UW4sLw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(7416014)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b/pOD/WXbbcSXAa8hB4yXlIx604FM2itKzQtRmtOCzst5d2X71pjGlyKhtXSBD4ksSzgDS2aoh6jBRcl7FZ8pU2mEUQQ4NAViy0M7ZGpmUoiQsqe9oOY2lFOo7JATjXgi3RIhiqazAdXRGVkujcdjNe4tNRJ2odLWqOrVm6G1JlSHZLO9iSwXN7K90FajzxxYJpWEiywdhgYcliT9ETLlCqjpmjwvbgFAE5GUV+ylAO2I6EAckKUl1sRlrduW4gkTAcg/F/dm/irmarg7XsL2VDSKCP/oe60HPmEdRazfZVQXrTjqX0rF97eh7mZH4csb3H/7DgLomZzjYnG8/wGChy+NVlX9O0Cp+KrH+y0QCEuLwyRhdI4/3kOzDaq5BtKv+x2B2VfnIFRqOCEYG1sAlfNyTvmqUsUAgZGOUnWpv/3owzYFvOl7lY4WENGNb/2
X-Exchange-RoutingPolicyChecked: Qo6xyAdrEUfik2/TSP6zPTuoe3za8/wbVbrUaT0FHeBIdVRVaUn+YrddlPLtSC8MjeBsZEvI03YyTQlhIjo76zIHhSELsALGPYHbDDU8k+BWU/WsmnyBf9QqkmKdxkM88lQ5V4w9EGOqY34ip97iKoEGHmwrgC1HZDlU8ak1MNoSs/nkgDXmG9l0FTQflBWRvIFiHF0QYbemWJiwlEFA/8nPYlAMWaEp/iJonHPX/fVPEBNyRgCtOrCKXLK0qoADU7ZbLKRaCqg2/CPnzQEj6PloMM4LRe7qje0w+lLpnm+adK04SoDmoi0pVGGi1llBy+W5phuE0ofs2wHVTi+oYA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:59:06.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cdb7bc-7380-441f-d1cd-08def1e51d0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7456
X-Proofpoint-GUID: H8fWRBtaboibr-nlkE3XFGzJfZL_yQYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzNiBTYWx0ZWRfX5bwvbsQkaE1s
 N5I+ca3kGFN2P+OHUPe89e3/tSHQjle6rIPgGXgPSsTQ8uOQcPLQowEyvbpMHy2MyePMSF0Cz53
 AwGRpuZ2EGHCDYfpORmXFQLkN3VYJhbEjcrA6CMe8+OO6vHlbAOZD+O/vD9kpB425K0i1mC87Wa
 rWY/MrljCqi0byv44e+5NcD452k8uNddWVR3TEQ/+s1oaNXrq4zuhGrJYS98pO8ROoHm5/bBaWw
 1S/OqdwZNTUcLeBxrvduTMAchMQjTkB0t+ho1T7t+gg4MPotVb4sKcmI2WgrExDx2oARfblNWtN
 8K9lOjg7XSCaVnDgqXpfaTJFZMXvfiCncSXlGpi0QzmzjSOg6Q3RQ0Zxmdc9TsIkjNcdybw+Yqp
 cqK73p2c2t1Gq/5LNo0qTEPDrZyf+TBcVUoHph+g5tz+6jw9A6T+el/Kc1gjop2XFV99ued0YgX
 feCR5tG2NCaHuoBBs6A==
X-Proofpoint-ORIG-GUID: H8fWRBtaboibr-nlkE3XFGzJfZL_yQYk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzNiBTYWx0ZWRfX2mPpYVxb9zj8
 5WPXweqjalUwjvYCvaehbIXZAyS+77JVwhhv2sI+MHiuv9ao5NrU1MFwblpJFjjISVR5fTMiBR/
 D1MmbsZk6K3jlqnfxJHhsHJXIrNOk94=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a71719f cx=c_pps
 a=VrK8WKSpsKTEY/+VWLGgkA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_215919_278291_756E093E 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Jai Luthra,

On Tue, 02 Jun 2026 18:29:26 +0530, Jai Luthra wrote:
> arm64: dts: ti: BeagleY-AI camera overlays
> 
> This series adds support for using RPi V2 camera module through the
> 22-pin CSI connectors present on BeagleY-AI.
> 
> The first two patches add support for I2C-2 (used by CSI0) and setup the
> DSI0/CSI1 mux (used by CSI1) in the board devicetree.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for CSI/DSI connectors
      commit: 68488e617e9f5f9e828ac90bca5ee1a5378cb6c2
[2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      commit: 27d87eba99fb9c3c2a2a2d2126a51f494d3c65a1
[3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      commit: 167f68af7759075415ae09c94662664a25a595b7
[4/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1
      commit: 9e23573a516956a6026cf880cac347e4cf99f2bc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



