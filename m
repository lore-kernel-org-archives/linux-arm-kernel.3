Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289B6CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIG4RZ2jHuQ5YcVakcDFB5KMtraDr2u95HvvoVoqz6c=; b=zb1a7D1SpwUWtAv2sfpWKZOWac
	5EgAn7JH7YvGl2oDWL1HnUj0+a4B9KCvmBXVKrWxJoj2WtuOb+9p/KqTHhs5zuofVNEqoPhaYjAGG
	2jnmrg+S9o+Qltb0UwqYZ9dIldm/VspPPTf79HBweSj9i0RqR30zjfH3BUkjGZAoVZ3+bJwAkTA7j
	wo+WGMmQyYaVlvp4nKyGvQ8F25Y0rcMH1FkI3D9a2x2yzSVec+x+QN5Bk7TzEULf2kSyIj9i0k7vH
	OKIPHu7q8KvmGdSOMp7w+W/Ywwf0PSbZHbi9jCvkRsmWjAAgF8qdLLNJoV8BVabLawK0gTT5vM/5M
	Jeh95pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5k-000000096JN-1usE;
	Wed, 12 Nov 2025 15:49:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD5R-000000095xg-46UQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:48:48 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFXfH01080074;
	Wed, 12 Nov 2025 16:48:39 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acq20hra3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 16:48:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z65c6vNSBx35cUULDlTPYnvE9LYvlRfew3VqmsC9mKESlwlbJyqZ5qQvaU20q4FK4HS4MaUi6XtkDDgJTuYMHPuCCGKZTZwbRnvpIFdpLO5+jofPuyCBj+Rc0nrS74ECo0AIMo3MG/YmZTVXtqywbqbwUYsCySE3RL3uwbevzYR70ocMLcxgXvtOR5fqP9dYMj2Ftxr42CpufAtt1feVZ9h2o/zFvDSvrmB1f8vkO1O9bnBAOc7xrKIFDu8RW6K6iMT/Frb8J/jMs/p9aQ3xOfJOUAaDnQChOFkCf0bCb+TsLC97VA5YYH31SgTID6Eb0sdNAyJQ2lkXPXvYi1nGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIG4RZ2jHuQ5YcVakcDFB5KMtraDr2u95HvvoVoqz6c=;
 b=Lgx1lXtQo0+aqA9bEdY8Hbq17Z6MbsemfDOLqWrG0TmTsVFqRSvIxRpNFconqrqDIhfqfKnY1Lo2/vfpMPdW0SRshUF9YVG4PQbMVjnpvAKH1Zlwewe7ELcuJid1GxV0gGTxqWOZkuHPSZHpen7xR6sAbSuMWu/PTezeziHclnPfGdKpUiI80CPv7JigNEx0OkUJBiHiTP4+XA11iUIq5gyYdtE4OBHG7X0k+bwBC/rwNpo+MfCA8WdbYkmjrtUjTq2fdURliJV39s4pGFjleuSE3azu5CwSS0RB1fFiiABwXZ4Orqhboxx4cWieFRqFDalH103RexjrgNtwoV6nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIG4RZ2jHuQ5YcVakcDFB5KMtraDr2u95HvvoVoqz6c=;
 b=DQcSNR8zUtX8P8es8wbBIQ47cC3asc1QsBnlVeBvmGp2wXFObUe8rBkE55LmqG8yR0Fthl/idviqi7wGPVtQgIOLe5dRvyAH3ttXeyCnY1mr52j94V+J/PmWVUeVPGhjh6pxoI1XvRnO1KsKSXeMVGGoeIMGQrdEjkQyrZh/mq+ODYipqZbujbBW/NWBI+LM6WHAjdI/qFnxR+fF+qwN/xx40Elg9OT4L1a3y+t/cmmuo6/LwlOZGTbgVOWhdCxEF98MZdG/HXkW3jBrW98X0aKyaQ/iJUmL51mKuVCLf2Gd/AgYghps91iPpaX9gCIQjb94q/uQ2ZNqPUrMIKG45w==
Received: from AM0PR02CA0168.eurprd02.prod.outlook.com (2603:10a6:20b:28d::35)
 by AS8PR10MB5903.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:48:34 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::44) by AM0PR02CA0168.outlook.office365.com
 (2603:10a6:20b:28d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:48:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:40 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:19 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 16:48:12 +0100
Subject: [PATCH 09/15] ARM: dts: stm32: Add boot-led for stm32h747i-disco
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-upstream_add_boot-led_for_stm32_boards-v1-9-50a3a9b339a8@foss.st.com>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AS8PR10MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: c71ad2ca-c8ba-4040-60c4-08de2202efc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akpETDZ5Z01CTkoyVEg3b2g4SVNsVDJCNjB0OFhDVHFJRVdZVXN6WVlQWnRE?=
 =?utf-8?B?VklGb1VaNDRRMXdTeEl1OGpUQS9teFpDQ3M2b3RPZGtyV005eTJBekdISW4w?=
 =?utf-8?B?VFNVZUdKbXhwVXBnbnZObEZueFk4RGFPaWFUNHE2UWxpOGEzZklJZC9MVHdS?=
 =?utf-8?B?L2YyM2dTbGNnMmRGNWVHelVHQllDTHlnaDIveHlQMVA2U0pxVUNJRVNwQTVi?=
 =?utf-8?B?ZG5OWHFTQldCN3JkSlk4V1VXb050YUhDcXVJLzM4dkZIaWZaSHg3Zm1WRnE3?=
 =?utf-8?B?Z1pHWis2Q0wvUlJrcWRzcngvU3hTamlHUVhXVFg4dUMyUkw3RVErN005TU52?=
 =?utf-8?B?aFp2QVAwMS9aWTFNS0taRXN5SEdDdko5YVVvZHBVQ3kxQjk4VGgzM0h1TG4r?=
 =?utf-8?B?bjd2Z05qSlFSU2hjSlZieHQ3UlJrUmtsOW41RHpudjRmZFB3YlZvR0FPSE8v?=
 =?utf-8?B?KzJhV1B3OHdEL0dWN01yNVU1bEl1VUh0RXlIdjRONlVQTkRDNnZGYTBvRjRR?=
 =?utf-8?B?VWpyUmdtMEFoYlMyRnZQRkQwN21lcXkrajV0blN1dU1qekhoUEFJbXNxTmpz?=
 =?utf-8?B?L0lML01rbVJ5VE9mVFYwSXFUVnR5enNwWHBIc1c0UUdZQUdaSHdNUnMrMHNh?=
 =?utf-8?B?cEk0VzFacHY3Z081b2grSVVQQ0NDMjMwcytGZUo5VjhXM01jMmlKV2d5UTgv?=
 =?utf-8?B?MG1lR01NOVMxSk5hRXJKOERuT0RFcDJMSkthbzYwYXFVQ2lQOFFsaEJNU3FH?=
 =?utf-8?B?RXgxZ0tYVGJucTBZZWtJSEVMMUZHcVJaczZiZjFNemorek41Q1hvcWp2VnEy?=
 =?utf-8?B?YUxmczE0dVZUQ3NlMzZzQWkzWmdZZUpGdGEzWjAyVTNxUnRHa2JjdDYrOGVn?=
 =?utf-8?B?VWp3T3FjdW1QLzFOYllLNnJ0MGhHckRtbXlhSHhicHpSd1Rrb1o3QVI1MUpG?=
 =?utf-8?B?UU1oVHlIOHpFUXRmU2dMcEtqc1R1MlVZT0tENSsrMk5NRmNHbFBSa2h2UGRQ?=
 =?utf-8?B?K2c3U0FjTUE0YmRIMlZGNVVXMHMvdDVrR0ovVXNGMWVDTDFid0Z6QzN3M085?=
 =?utf-8?B?bitXcGltdGcrRnRBeFA3US9XRzEzUTZLMWEzS2g4Q1RPRDhpSThCNTVOajFh?=
 =?utf-8?B?REZzQkUrcnFhMU5xN1hOQldneExFbVJBRENxTjZTME1MR3ZXblp2WnI4RC9z?=
 =?utf-8?B?TUlTSzFHUzcyWjVHQUVteWlubGxKMTk2Q2lsOW1PYVorSkdwaU0rekoveUxq?=
 =?utf-8?B?UzlDOU9UWHlMaGNSMjcyRWNLbE5FdmliMFpWWEZYcFE1YmxVd0s4OU0ybGVm?=
 =?utf-8?B?UW1JQUhtaEM3VnNBUHFmOVRhYm9BaVVyK05ZTFI4c3gyTGtWdUJZV1lYdXd1?=
 =?utf-8?B?WUlIYmsrYm1tSCtIUUtLbnJrMS9LMlR2SVpLRVJQYlNLSG5MRXk2WTBZNmZ6?=
 =?utf-8?B?d0wvUGdseDN4Q2FtVm1xaXNuVS8wWXpCY01USTFtdjByL28wVS9KQ2RkVTlF?=
 =?utf-8?B?SzM4dTYwN3dEdHA0YTBFTWhLL1c0VDZJd2Nqd3ZNWVR2aTRzQXBoWlhNTkNm?=
 =?utf-8?B?Y0NpWDJaV2EvZkVhZFkxcWhlL1VkL0k0a3dYNzQ4VEtyZ21ydkI0Tm5sR2I0?=
 =?utf-8?B?U2lWWFNndkg2dm5LZ3JDelRSK1I1QUtnSUVFNjY0dHg0UFpFeU9XL25XTDE4?=
 =?utf-8?B?cGpyRDBRdFlkSy9UamdjNWVobUsxWnZLcUd4NzJPVWUram12R3JLODk0M215?=
 =?utf-8?B?N0swNGV5S2ZSejlSUEZ3azRTRkNHbjFxMnJCUGtXRWhRYkExTHE1Zy9GUDJ0?=
 =?utf-8?B?TDVMa3JtUFBCZ2Z1TmxrckQrMmltZEJpTEZOZktjd25naDRFZ25OcFR6aDNL?=
 =?utf-8?B?WVJZWHJWTkJKOWFRdW5IcUk1YmZTQkk0M2JDYUE1b3A1WXUyQzY0SDZ2TkVr?=
 =?utf-8?B?U2ZtcEdpYlMzaDNvczZTemdZQjQrangySFg0SEZqOVhVakhUMzROK3ZDamxs?=
 =?utf-8?B?NUdpRXhrcFdoeWY3THVXYkluRllwTk4vMlh6SmlBUHNsY0lHTGYwVnc5Y05u?=
 =?utf-8?B?UmtEUmwrcWllOTdZbm1NdVNNQWFJWDM4czZ1aHNMalcvUzZXK2NJZnNUdmZ0?=
 =?utf-8?Q?7XhE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:48:33.9974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c71ad2ca-c8ba-4040-60c4-08de2202efc0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5903
X-Proofpoint-GUID: LU2dXzbzuPZu_pt1Vl_kAnzS0M5OwfVw
X-Authority-Analysis: v=2.4 cv=LaQxKzfi c=1 sm=1 tr=0 ts=6914ac57 cx=c_pps
 a=sGfeb9PwuAfiW5dbaiAd6A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=FXgdm4OetD_g86Dx1wkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: LU2dXzbzuPZu_pt1Vl_kAnzS0M5OwfVw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyOCBTYWx0ZWRfX43uz69g9zCmn
 hbtty5pp4eIKpFTWZoD0h/gFT1SZTa2AXQz6v2I14BQG3mOYJ5bPsCWbwEA6jNewKEs/AJPxcPg
 hd1oxs0hkeifjpv7M75cc6alLl1uJLRGtBqGsFU4cDJUZEHBER8HctMlv3+qlvevp/SYLVK9wPB
 So0Dqt7sB8o0K3ib60ZMXPuG/9r0Ih/2TpOmtnWcDxyv7Fp9RQr6C8kKA15pW/JbaY9rqNLRj/T
 EOcdfZRuJrG5TutB2APmOPmz+MRtMOatUSXHdm6MNplLOD9JlyQxcbM+85xby2FKPMDzrfotkvF
 bOdD2HlX52/vzN6kMvoB1hasWCk2oR8xhibRC76IA9rhRT7OCfOEMORC7Wqnb+cPUKYMlarQPXs
 fOEQD+hEvzinIlmlfzbcv2lsMTF1mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074846_312263_23925384 
X-CRM114-Status: GOOD (  11.16  )
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

Add options/u-boot/boot-led property to specify to U-Boot
the LED which indicates a successful boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32h747i-disco.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
index bb6649a58bc1..c9dcc680e26d 100644
--- a/arch/arm/boot/dts/st/stm32h747i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -39,7 +39,7 @@ v3v3: regulator-v3v3 {
 
 	leds {
 		compatible = "gpio-leds";
-		led-green {
+		led_green: led-green {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
@@ -93,6 +93,13 @@ button-5 {
 			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		};
 	};
+
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_green>;
+		};
+	};
 };
 
 &clk_hse {

-- 
2.43.0


