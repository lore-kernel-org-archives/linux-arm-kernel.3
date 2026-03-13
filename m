Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB64E105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=; b=R4HI3w1vVveR4uXC7dYPNl3+vR
	b9GK8MHxwAOpmhBn3YSVAp0A7CqDPQ2nY+OlitJVm9xCSNx8ueYJaz5IJ1FkwXUEp6HJUMc6J4I9h
	3dQ0MUL7We/qOzaLjW5NpbQSB5OCGdlkrmQe3Me0gADSuS8m/+CX1q9PfWJHxuVeMVgA9muUSBBSv
	AsfQCoplLWkOZBkVvNkPIjjj9TewXu8i8OqqzqhKRixHJkwjWMEhhjQSyQGG19+o7quNAEFLhV1cb
	atY2PLeoScbMDOiq8xZ4209RpO3/mbhzXs5jeYKZ0lrDeNIC/rJEl5KuMf4kbhqdNOBwCfunfpuYl
	aQXKx2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13c2-00000000P4h-0LR7;
	Fri, 13 Mar 2026 14:35:38 +0000
Received: from mail-francesouthazon11021088.outbound.protection.outlook.com ([40.107.130.88] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13by-00000000P3j-2kgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:35:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nBib3pvgzSTCzisL+BJrCI1Xi9Sj8S+Dbg5/t9zaT/9Z6Kj6gSpNGfDnUneKGxgMSWibhnEFM0UnPtxsNxALcPxvGz4sGM1rpWq9LOdoLXIbgBd7TkuF4KSui+2PMLDyudkPDFXQD4JQs9madGGtki0zftwF/112tcb/QGnQ7Wp8raiDBj9Lquyl5frH0RvDDQHt2vmNOK6DAYeKohpG+531niVtJgw4RgdE5F7AqkjShXzV9TrwOPQdxWxq/PzbVpKqhjHTSjgautXScG7Ar/GYzQZnvomy/XrSLhHsouxyMIzxJrPaulHW0mwkX1tqkbbn3vXIjjAnbvottOaRFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=ONpaUMtdM6FOJIr9jq0vLZd3tzDo1OrV9F2tZ3S0rptjjCb9mKtdQSTtm+5Qw0OBHQKavfsPr9g6qznI9FasjE+9Ah08+vJzcLZiJKAM8jxYA9c8ldZ2dPV2TpPl8N2Cj9u8DhrvrWqcN1LXmp7r4JGN4nRbrHyryzY08aKoqVyJZD76rs7uIlC7oTeozMxJJveEuigru29WEaWsrydlpmh+kFlKeI0FUUVDNhZoQ7nWhew1WldqDSxIT4cQRuFEaYtPDWBBd5Uki7/+TxU6ZXiVBQVF8xDsBYZS6FhP5SKb+5axkDUrmvMkCtrin8teJU/xPuMgpxsaAnTZh3n7CA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=MeWbFovYQMcKu+2xYN2t/l8HNGgFKqB+VBO2V0e5WECKj4YtnTFh1gC3ybhsHSXv6S6rk1XkQkmq88oDr9sJtRzqhpORmPIOxd4um3Nq+htVH+gmu7z3ADT0kbSb89jiHG0zA9Vx/RHndBDWMPK1+DW+BVYc8ZofhmxL2VAM0Vc=
Received: from AS4P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::6)
 by VI0PR04MB11671.eurprd04.prod.outlook.com (2603:10a6:800:302::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 14:20:59 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::85) by AS4P250CA0001.outlook.office365.com
 (2603:10a6:20b:5df::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 14:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:21:06 +0000
Received: from emails-9471980-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id F20F380C9C;
	Fri, 13 Mar 2026 14:21:05 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 14:20:57 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSJfQcwPN5Q1DA7ZIP3/1tIkAzEl0DTsQVp8u9OFxKNa1to1zLxCHPphKZ5g5gqyXSkH94qMJ1PV+87UlHBTQ8cwZubHhdERSPCt5KGtMD1449qXZwrt5gbJljSTMOOPQi+n1E/CVPQBDAsI9QKZx22rwTJ7q8nduE37NLa/oeb2heJmWRTPIYUkIsJMUjy6cQpaU2l4Wcunj7eRViATgMCGh2OY4bWyK111PjzBCsLhcRNbzztkPMAaHLcV4hcofXge276jKrDqBojYTrIpOyibRk+1Bbj2/fw4jwGI1zk6tR9pefSePf9WISoKqeBZwM6+hEZondSfJelWOFQDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=oOPmLsRVCNJB31F6PX0KZy0t8x5NVVx9Dm4z9WRU/XElfIbIek1h/+3L+DxsIvGKYv1rT1XkbRhsiYCWghAJuvRAE0bqeXjtaHW2DmFr5ymWW7H2BpxFQ1o/Z5crpahJ1kuonkRgGWst79tXKw9qgTU8b7ge06GX9ZIGq1MUMaQXch7G8bPaElrf2DRv55c9CQRR58MBmNLLPkz6H7wRRAQXmcMR3UR5Fyf3ILtc9bTos6zPXy15+95ZzTQuBtonmdd+rDgtLLdKKfPOgc1hBkFqbHId6No2HNLK/M6CfkqP/XreVRr3vRnFChthrH5/N/PNYPGVonmXFLgbeyhwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=MeWbFovYQMcKu+2xYN2t/l8HNGgFKqB+VBO2V0e5WECKj4YtnTFh1gC3ybhsHSXv6S6rk1XkQkmq88oDr9sJtRzqhpORmPIOxd4um3Nq+htVH+gmu7z3ADT0kbSb89jiHG0zA9Vx/RHndBDWMPK1+DW+BVYc8ZofhmxL2VAM0Vc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:20:54 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:20:42 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 13 Mar 2026 15:20:51 +0100
Subject: [PATCH v4 10/10] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lx2160-sd-cd-v4-10-aabcf230fbff@solid-run.com>
References: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
In-Reply-To: <20260313-lx2160-sd-cd-v4-0-aabcf230fbff@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8355:EE_|AMS1EPF00000040:EE_|VI0PR04MB11671:EE_
X-MS-Office365-Filtering-Correlation-Id: 48489168-4d20-468d-3e48-08de810bc3d4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: G+dKucX/idCUKltfIC2EkygT277eG6MHlV+jw4WyLzbrFEa9sH1E0jdL9raxIQz+FqtwCx8NoElh2Y0aMUTI5JKKEIKvJCHrTw4VQ2GYg1NXo26f6H9Yl+OCKfrsvzGayMrQVaujAht1hAbA8puHefsfLr1RnT/Gua5pu1QWhEzEvDuHz4LT0qm6W4s9aMi68Ue/rI2LXXZ6KDUeOLFIYkHGRqCHkGpoVCw3j5qmX/1x0K6HLKaaXJuELW9KpIQbiDLqFsu1fqOLC4ppUkn7FrZQ9iLq4F2GrKs3pAP7k4xSf1A+YJBJ0kg0o405JT36Qv/tzMV1erAkeJ8R5T1g88gIfRmRaIHrqIAEvtjtS33OAwviDMcKagGS/2t+ia12KtoaOA987WyZtiH/gHno2TZVdBMLJwHRZvC9OvVLaUCWQaGmeq4U9bHS6giGW7lN327LWFCYZN+toY4uCmdpvPI/AKSijv/T0PepXBam4uxzRx/9T8nHaDS3FXrvfkfQg/eN1nFDVFd8Ma9uGqafRldqP0g4+k9uPsc6GL9FHi3Ko7pJkIV/8htzDBBWAtNFfBA0mkA9jWNRz344yfzLKvCmzXAWT5Gcscys2p8Z35/R3ORccWHE/3xatveCf7TxWX6pfQ+sIf9zo89h5f5W/CuUuK+v9v1JP+VHPHM5AcfcQ0FRFw/EogNwh7N0H+yyx4g0EKCUy4W592GoNlnBNvUCHTaVouT3EbyWW99XKww5SfW+Qjo5b4mzbFaRh148mblJY0QZ3f6PGm+OeFs9X9WDZULF3T9jb77Xu5UenPo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: CvIVRNF6crLXRQouOfBlhuKJJRqyUJpw7cF6Van+/b/4BkmzuvBAjw44fVXTvOuTyy7P9uJxLdR7iSL8FsjNN7nOwTuUOBZBGmrpuXwbWo4fRIhKVbRdfAcIhmFP2yOXG/xIz2jOjJXH/Knjswk6CY2xag7rypY3WbAduK2CLCXaNUAPJlP4sLzzdoRprIzKFfcSJYuuhP4AorEQw7x8aWoDPdm9IbaVb6oyVQNbv50WrZ4Y1UVmaUes9c+cDTwBK+iTwUPiXRENlXhFV/smynQrmfOc2/5JrO5SR8rOMKEB8ZBnd7Be6rtGlM2CBms+x2zQtz44qxtXSdAJL2MdYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 07557889abc1462289f3a0e947e76a05:solidrun,office365_emails,sent,inline:63fc3aa5d97fb79fbbc6fc70877a80c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 54e218c4-dc8c-48c3-e625-08de810bb548
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700016|82310400026|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: TUoct9leLsRFmlu8mzLwOFfuzDr6Z/jt71EK6MT71Qkbe946uN1PMDEs1kaV7abRNjZXwb6vtNN8LDnZVSEtvlFUwVQwLs+v9oe2PD2QWCPXn/gYmedVX3/cZpohLpWjy6rWj2wlJpLmjzrGBw2Yg3rtzRpwMNWyQu2PI5H+bONqf5SeLy2o3MLpd7vlw3yiOgyhhU0aL8b0ONtfK9SWVUeEXRyiOzqv8bNolh6nWgcqn3DnuWNWc9OUJnvmbsYDBRL++Y+MsbbIaQQQbVD1MsivjJ6ib/vaCFxzGqju7oWrhWvVpi+E7XdBgtK6yPR7tObHj4frtHHKDONxornZlIjZtFPrqTiqvpxlNpmiD+Lslsm6vQEn13Fa+exvRSQuFYZy3RWXkIuDMQES0zC4YZxG/sC47c3hjxP0IbN+lHYJ4i+YKiSKzktMnM5ChWMwdSUUa0znmbtneN3jjdseU5OsZMDiO9988ZxlsShoa8ZJCdRY6WxGcTSe9Lejq3IsyXuPNjhuffeS44X0ZZtd6VXzPXd5fTzbN7cGyCO8xV9VXPHiO4R/JOa/PIEg1K9uR49olGt+n/IEvfwbM7qdl0CrHoGrei7SBiij4DYzJYiTqZ0Q73cxl3wtgM4A2h3W9ub+C/pdfFViYIefmLaheAUPDiFtYZneivw56Sz5YhTHd2uMnGxbWwj+nY1Ms0xkKT3ZVy26U3e0eKLz1qN4Xyx7cDsQQHooZTmVOLpSGXv/5TforD7IDGGK7ph2fsorybTvq/WfOSbpv0zzBN4JUw==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700016)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XNpuCZCyVYYoGBtbBEcpGpwEZplEz8sKaMxFBMx28NPA4uNSfDenoyeOTJXgQowyAJKVuNjHcd3tY7LDh1sRtGrNutdXG62kQv5Mwh9FtiuY4430BdiOnRqUmfSbO7O9pRDz4yf1j4T7qg/jcJ85dOa7I2LAHzpnmcQ7AX+FpdTlFD/OolPO6feoOJhuW4osms/S9yF3HKRxhlTkax8Z8TiuZbGh46V8z4sI34/L+scy7JXdX07zQYl0Pci/Ma1i03kwkRUyUHnE+MQiFW09iY6tggoGsRKc3Ph87QCcqoYRLZXbY20QWggzBhMOYskhUr/CvCzZ9EP0lhgmGpIZbeipyK6TTZo68MhFfv7cq2S005QMyScqKBYMDl4G5xQqF5FMCApJCj19mTgmzF7CPo2MbiCYLulNjlKWl5SD3WxpicBdznkXL091gOqg6oTp
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:21:06.2250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48489168-4d20-468d-3e48-08de810bc3d4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073534_767537_D354B5E2 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

LX2162A Clearfog has four LEDs attached physically to the 4-port SFP
connector. They are intended to show information relating to network
interface status.

Select "netdev" as default trigger for each LED, and link each one to
the respective dpmac instance as trigger-source.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 8920326a06735..9d50d3e2761da 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -41,21 +41,29 @@ leds {
 		led_sfp_at: led-sfp-at {
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac3>;
 		};
 
 		led_sfp_ab: led-sfp-ab {
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac4>;
 		};
 
 		led_sfp_bt: led-sfp-bt {
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac5>;
 		};
 
 		led_sfp_bb: led-sfp-bb {
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac6>;
 		};
 	};
 

-- 
2.51.0


