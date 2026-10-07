Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98ACA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4Kc=; b=TdmHOS+Ls07vzzQeJny8Iy8+R+
	zNeHHmqet+JR5BIwKBTdTjKnHhkmu++rV0slrkYv+7QcAV6aunacJx5SPiASJonzaYCZIdj2pS+8D
	n4/+EgqhMUrWFjAicymSY8WI8A5TPK7+NvC8QpEuGnKgPBFRq4Qbll3hHmDKuMrdMtNVP58W8k+dw
	itSOq5CXhJKwd0KjBigSjKiy76oqWGrTtwSAwC61TuCpCLgVUGTHKvGEvDOw/t9+KzWUD/IJEEkzf
	h+Y8RTy+nAVlcmmQoGOnzUC5i6jL4IrFLlqeGaGg4E3sLJw7UQG4c8OCNfUaHjq1NfABlgOml20C0
	Bxz5vvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOvJ-00000002A0G-2LpP;
	Wed, 07 Oct 2026 10:30:57 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOvE-000000029wr-0UtW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:30:56 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0RG753188;
	Wed, 7 Oct 2026 05:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4
	Kc=; b=NmeUj2LopZQ0AkGeQ4Txktc9nQRRBmSxrkn6NMaIQNeJxfsd+mcqEATbt
	sBoAjakMLbKei08ggPdmBu1VVzQRLRyogWGLC1KtAiADQX/XpyehVxIwC+kgyV3J
	HrqVUqUMcC0oFxPiQJjXiEPmgncAHEQ/OTfLa/TTqscOGGzEQOj1FbG+F37/S+ek
	CTCzjp6nTWIXO3WficWRbVylZqzh11ikcKkMunS9kBYUftqrW4hqdGXBsa0V1NdY
	ifO7H1dFD1eUg0qAQ0ygPN1HpQ3nPRxccU9MuDhZp4lda2bkwGCNuDPCOo05uwRT
	RB5s2Yi1iAGEJ0TMKnCCpJ9K9H8Qw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010033.outbound.protection.outlook.com [52.101.193.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78psw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKX1APkqdDJWeRTUiBk9BIipNDDIu9aD78A++i5RcvjCMMTZJFxqV7qu53CcD2rAfN0IgkBSd69k/nOPnEfYAxhpR0/mOvIxSXkn2JCU7PVaIVaLXok2+FxLlclDyfcBVMIDswHzbrkA5aDtvz75ifMhek/9xHZaOJiaol3mX6BNJ7YqAAuuEhITMi873/13FTuvODPtldKLMArpS5ZIOrS+FKSlNKezg9DUCE6TbH/XySFuWgP6HXKwB6Mzq9PqUS2HpSzD189s2ZEA5rjwC9JlBjG751HOlWGaL2xbFz6LseSQglwVaWWuREmcww9hB1ZuLbWmzepVkdvYjxmY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4Kc=;
 b=cmtG/sTsV6kNdxQQ5jIrbDT5YMKZE6dpY0MIQkiI43NC9zDSqtvh32y/3sgtds0BAdj3RRGgfhfYc6HDKcvO23qV6y4UNCQHhL58pXt2fCX0eSqi289vLbyTqsn1w36Cev3Kff95hsOrvqAUiZ2t7T8Z8oQfBPOuX4idk0l2YjOLKLqWDH5F4Lt8amLIDSShycqrKapB0f6cVZTWTqXkW69PySrTHQXQw4NQsFDhMJ8vpXaimOp7euYw6Xm6joHl88ufdNuZvHWlxw7y31LRf7BaXzKOyLGJbqamG6hm50HEOCKhPKelH8e5dgCLTVJpKQZlM98hREzNM1hmsyQS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBeVvxS174qeh1V0ZFXD+B/y1RS3PyreLwPPCCX4Kc=;
 b=dEyOszxUTbj9loSSQC3qotu/wS+nqy8DTtiL7Gq+vEVqEy95cATw+ocqCF501sR7SXZc7RHnr344MFvEAtJ95xSflYBmfSa4Z7TWsSg6TiOy4+KkupqrwnnXUH+4yfFvE781TcjHDKq2p2mRv82WAXTt04szpdk1ujn6bdfCHTc=
Received: from PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::14)
 by LV0PR10MB997591.namprd10.prod.outlook.com (2603:10b6:408:33d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:30:45 +0000
Received: from CY7PEPF000000E9.namprd04.prod.outlook.com
 (2603:10b6:510:348:cafe::8b) by PH8P220CA0031.outlook.office365.com
 (2603:10b6:510:348::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:30:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY7PEPF000000E9.mail.protection.outlook.com (10.167.247.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:42 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:08 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:08 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSm013473;
	Wed, 7 Oct 2026 05:30:04 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 04/20] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Wed, 7 Oct 2026 15:58:45 +0530
Message-ID: <20261007102936.2402427-5-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000E9:EE_|LV0PR10MB997591:EE_
X-MS-Office365-Filtering-Correlation-Id: 9354c437-3379-47df-9c63-08df245e0a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|23010399003|22082099003|18002099003|921020|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: g1kzNL54GM0dFa4EtMrH0rMY4Y5TyMHxJKe5c9yLugj8l6MjAevLDsDN15ZYt4S+M1+KTZ3is6qNYgaqr+XF9Xe3HcHlt8S/88A8c/+PNV0XnwV9QtRADBB4BhTKqYrOHt2J4CSMpy1Ymi5LRWJIUrP2fznLhcc/kAXeN7HRGl1taBvOl4B/1S7R//38SRces/bMg1MKENbRTzpX8MSRFuybNvvShtGmvDpC4wapwCj+t77H5sMJZEi0WiBtFbVtRLA4XokTtxDndxQ2Gfu4SbY4miugZwA86iB/cpgg1XytqR1Ods9iWgUDNcCnrbbr6XfwWIteo0Esgx4yQ1AQpQjWMjiwBiNqNkb14HwqC4Kz9YbHhvxix/8VBDgAl7yQBkZ+daxXVpoigA6aHM/7wYowTiRuQKB9suN0nt9+PCJsUUduiJXtl9J4qKxaLi0e2Om3kSmpBuuzSg2tu/otoPkHXjhPSzpr5aAGHtvIO+cE9o8Vb8IXYM1PZP+sLzRReHbne5dT7QA6vS7hRqVr1vdgUIDvkUvf0FYIpEh+1hpNdMw7YAwYkd/ztAi1QhNsYzMq5ExCDX/KGnaJN+/sDEaMHVHt6YgpZYbXpb+J7s07G1TiYheyXQ63kJczGWW71BiIzNZC4h9F5qhiWVzqvn5V78bW+os2OYA0oj9hoAVeJkqGoLwum4HdyI6cceS8a7xeLdSgW5QGK7IAcNA/VNuNywn08G4cvH36aOnm/C9u/eF37VkFvH8zzZtc9d0R
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(921020)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6BkWLZ1PaeIV2DHaQ5JAZ6JlcOURMkEaTPiPDwEe3r91ndaRfqjO6u5Lj4OPVvmukYBrjOBRiPKQWFMzPbsbkmhbXpSu1Y9tHl/vG3CCOhB683hgVforbgByPkG9V1PYbLdW5lan7HXOM8M3otRSZpVqw4qg+qyFDjXfMckdH6Vn/7IygiadWzN4JJWnksD+WWtDAJy51UJdNcWFw7Y4DkB7FliVB2HlqSX3BTZYyHkjqU6txl0m7f3Zq3LgGKNA1GiYApIxciM12NSyFAbU2IbSumKmIUSvDCTHORrfyTHCUQnmQauzIdF2B9GL4ypkQ56VeG4PWxz5Iqiu8yJpgSNE5cvhnmujld8SXe8qxykGfT9C0kJvca4AHrueBx/MC4lxfgeShmIEBs2l2gNty2ZYTE9tJnkmJRstUCw/8KIQRmkEC/zaQR9z3X/otVg6
X-Exchange-RoutingPolicyChecked: nExMYWfHbMTUVgRkX4m8jMGeSE/DJWSHtyE3CFrq0L14gc7ND71MWtOy9bjFPZHk0FVea+mib0BDW5R9W1Fv0LB0BvSmw7NznzmtfDRdyQY7CPaHqiaDjXJl9RnUZ/JYSFv1kVbUt3fZHnkgn9aYTuA7B8ETENoc2KtgqKEfibAZoXjPhB7ckJwrFkvGTPntHDaam2qBgndfcBPdMbaE4CgfJ2hZi7pWbaFpWqcoXqSEszFURaC/yHhFXSluD9+MGt2/nPl8DofIwaQSp6sSZYlWCEm/bKG3CuTtNXtnGnbomQnCY5FtzAI9DqwHjh4cudhbptm6FABVs9CO90ik9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:42.7305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9354c437-3379-47df-9c63-08df245e0a44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000E9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997591
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f58 cx=c_pps
 a=s4741YMcG+xsu4HPw1GdWw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=grpEhN_aSmkWsCgVS3MA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7DV+zBlBUgvQ
 EpmC2kmb/zLi/O8+0M2msefDq03ZhbbMuKBDAxlTTsxsq5BSOe0Oq53cCnAmqBaZuVR7xGUJbVs
 slXQf5XJPgdQBynWX+FMRGZRMG1Fggs=
X-Proofpoint-ORIG-GUID: MdRqYL_xJVXtZm61qoIONiX6tJwIKVKb
X-Proofpoint-GUID: MdRqYL_xJVXtZm61qoIONiX6tJwIKVKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXxklh3idyutRo
 TZapY3sePTgX9w7odzZkE0rHMxmOJs/l0UJDuiJAq/eBM+JqZk9A3GvDYDk2fhdEm7OfSNqaqUz
 IICnc8toZGnnxkp4GwN7Db0kQ2k3EIkeFlcbng4qtNpRILkbY4BWfWdYcns5lTpoxaBvB7aFj27
 t18TAjqHnlToPpvc2HRRSrISbUxFVOx6OEIopyFZRPqjW3DMI79HV5d+He2u3DAJTnYr7lGbsbc
 bisVypYA0MR5f77uA+oQmtrn7dEcFW0XYFe6aUHH+WlbSsrp5P8nEcMeZFUF8+jzdB/0DE/3v3r
 0ijv6XbfoacyemP6LCFetN/l00vwQz3YRWrsqXiLW1B/4oUT5XaBeR9LIB+y2Xav4doibICRg3B
 giDj/RVQbDTEPSBMcYnjCq6Joh9Z/AmsJRaZ2ff0n9JkhunefoGjCNA7OI1B4/ifnFOXApbLSwd
 LbjpzCdY770pUHTqEUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033052_327012_C00FAF4D 
X-CRM114-Status: GOOD (  13.59  )
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

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 110 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 108 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index d7c153c5321ea..5336ec9fe79ce 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,91 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static inline struct udma_dev *to_udma_dev(struct dma_device *d)
-{
-	return container_of(d, struct udma_dev, ddev);
-}
-
-static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
-{
-	return container_of(c, struct udma_chan, vc.chan);
-}
-
-static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
-{
-	return container_of(t, struct udma_desc, vd.tx);
-}
-
-/* Generic register access functions */
-static inline u32 udma_read(void __iomem *base, int reg)
-{
-	return readl(base + reg);
-}
-
-static inline void udma_write(void __iomem *base, int reg, u32 val)
-{
-	writel(val, base + reg);
-}
-
-static inline void udma_update_bits(void __iomem *base, int reg,
-				    u32 mask, u32 val)
-{
-	u32 tmp, orig;
-
-	orig = readl(base + reg);
-	tmp = orig & ~mask;
-	tmp |= (val & mask);
-
-	if (tmp != orig)
-		writel(tmp, base + reg);
-}
-
-/* TCHANRT */
-static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->tchan)
-		return 0;
-	return udma_read(uc->tchan->reg_rt, reg);
-}
-
-static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_write(uc->tchan->reg_rt, reg, val);
-}
-
-static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
-}
-
-/* RCHANRT */
-static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->rchan)
-		return 0;
-	return udma_read(uc->rchan->reg_rt, reg);
-}
-
-static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_write(uc->rchan->reg_rt, reg, val);
-}
-
-static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
-}
-
 static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
@@ -216,17 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
-						    int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_paddr;
-}
-
-static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_vaddr;
-}
-
 static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 						   dma_addr_t paddr)
 {
@@ -369,11 +273,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
-{
-	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
-}
-
 static int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
 	struct udma_desc *d = uc->desc;
@@ -775,13 +674,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
-{
-	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	memcpy(d->metadata, h_desc->epib, d->metadata_size);
-}
-
 static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
 	u32 peer_bcnt, bcnt;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 11d08adb0d69f..e65dacb68c19f 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -13,6 +13,7 @@
 #include <linux/workqueue.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
+#include <linux/io.h>
 
 #include "../virt-dma.h"
 #include "k3-psil-priv.h"
@@ -451,6 +452,115 @@ struct udma_chan {
 	u32 id;
 };
 
+/* K3 UDMA helper functions */
+static inline struct udma_dev *to_udma_dev(struct dma_device *d)
+{
+	return container_of(d, struct udma_dev, ddev);
+}
+
+static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct udma_chan, vc.chan);
+}
+
+static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct udma_desc, vd.tx);
+}
+
+/* Generic register access functions */
+static inline u32 udma_read(void __iomem *base, int reg)
+{
+	return readl(base + reg);
+}
+
+static inline void udma_write(void __iomem *base, int reg, u32 val)
+{
+	writel(val, base + reg);
+}
+
+static inline void udma_update_bits(void __iomem *base, int reg,
+				    u32 mask, u32 val)
+{
+	u32 tmp, orig;
+
+	orig = readl(base + reg);
+	tmp = orig & ~mask;
+	tmp |= (val & mask);
+
+	if (tmp != orig)
+		writel(tmp, base + reg);
+}
+
+/* TCHANRT */
+static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->tchan)
+		return 0;
+	return udma_read(uc->tchan->reg_rt, reg);
+}
+
+static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_write(uc->tchan->reg_rt, reg, val);
+}
+
+static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
+}
+
+/* RCHANRT */
+static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->rchan)
+		return 0;
+	return udma_read(uc->rchan->reg_rt, reg);
+}
+
+static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_write(uc->rchan->reg_rt, reg, val);
+}
+
+static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
+}
+
+static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
+						    int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_paddr;
+}
+
+static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_vaddr;
+}
+
+static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
+{
+	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
+}
+
+static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
+{
+	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	memcpy(d->metadata, h_desc->epib, d->metadata_size);
+}
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0


