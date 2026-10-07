Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4011CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vicv/v78HBZKu1ubE6/NRjWzVAVZMybxK0yUX/P1V/E=; b=qJXj3cvW6+5l/ElnnlFsDlOkFa
	HclAyFaqZS+EwMZFMWjz6ZDPQU9/qBjh51cRt/BD4erGVPmYXSH4tsATbZQZXKuhkT5AqhG4TnQI6
	xnH68vprCD8ySjqx+9arcAIVT3KC9HksmRy3wArqOIDLjg5Kwz2ynpmxA8Dy2UkCzccb/70a3Skom
	rDkp+cm24nQgVnJ4P6MJrNPLhadysLqXpUv5trjbVTpQmpQ10/dsDHOPweztRF+M1vz6H/v6RzFbM
	mM0i66V7Y43kAzOCxA2MLRWeIG4wcx4E70LkqEWnaCESg3dG8NwD1CPINRZpHP2McsA8nTb/ddfAW
	R6HV+23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOw4-00000002AjP-1pwV;
	Wed, 07 Oct 2026 10:31:44 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOvt-00000002AW5-0Cib
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:31:43 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k0AX753186;
	Wed, 7 Oct 2026 05:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vicv/v78HBZKu1ubE6/NRjWzVAVZMybxK0yUX/P1V
	/E=; b=BqJDywXO8YC3Pg3WMk2zbc4dRMtBAtFZMraPivoy6KlWiAxJJU/LU8cjP
	a4b+oo1XSShRkk4uO4c+4PuQpa50K3YKCIwCTcyHNCIC71pMJrjzT4HffHQrP3w6
	fQTesxkx782B7jcdHw3dNpWpBQ6agVJwQWEyllBfsNKvPKiJIThbCutoJ6qBuTC+
	gqPF77kInEPRO//P3rXZiDT997qP2oB8E4O+uS91MRAIemeBeAuB2srzYHRRfVzJ
	BO+Xwv4H9O/Jlavosm+cB6IhRW0FxDXdgaUr63GkDEYCSK+uXmMMfTRfyVuGnnA8
	Z2KUZV4lX48s6VOVzJYwPZ38Ov61w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012071.outbound.protection.outlook.com [40.107.200.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78pw5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:31:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGtAlpChXrNhiYoRf7Wp6uPyeq9HpZ74qBqwc267CyGxlVLiElV0pvHJL1YRgs/9i4UHSzpOg9q8lhHmxX+GbddMnz74rvnMVqpFlMVHoHwBSniYGX5prNlfbspT8n4M9/XJs5GUGxDr0wMQtmaIxKCE1tFLhwXmkWFT9N/2N0Osr1Sfe1I/eaFaZsMr+5hYwc+plBhlauz5xPcmFOR1ySdJkhviItOBh22bNbmv4ZmKdtJEMG92FelyaHJnlK9QAcXu5B0ZgOcJmBNUvTBaeLreBjYSM6WfXfi93MnbzmSgBvwhk+HQuV5lrvP2S8Xz6lDtE5u3ThgzD5NcStsCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vicv/v78HBZKu1ubE6/NRjWzVAVZMybxK0yUX/P1V/E=;
 b=tqWPPgN426s0j8XlctR2yux9g7lwV3ZUYHtvVnWt9wgk9gtS53dDl1K/xDg9Pm1IdWLW1AzIoxmYS3gzdAlA5BJ4E4Fz2/42L0jiQlSSOM1Ppen9TLm42BFKGO1rbBaJ2wbp90280zW15QdwMcSF7SY96PN9BG26Tgq/xjHZHQiu0qBdOxcNQqziXUI5aLvpalw6QDq0RCquF5U0osou7yDms8UL5zwKzeZSi8DGYYTECP4wKsyhsqf1HUSNWu0DKwoushdzh42AOf/wmR7X74e5QrS3uQRCb4cc69qoNv7YefFjn+Gdh47m9PIsbgEURCiZ/kvSbHG1D8N7L9/OXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vicv/v78HBZKu1ubE6/NRjWzVAVZMybxK0yUX/P1V/E=;
 b=fmkRjVASwOAIcMw9jxsDBWvBxcthYdHOHD5zPCRn+b/qLkWaUbCMGTt8VH3mV7pLTJ/ewUcwS7uKEg3ydE+A3eaaCMSSBGsWp+yNuqU4AbZsLUFKuh03938C2hJbjE5oxGqU6xZ6VfxKiWPu661rgix0VH5iGPo4qUqS2eyD2to=
Received: from DS1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::16) by
 DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.12; Wed, 7 Oct 2026 10:31:27 +0000
Received: from CY7PEPF000000EC.namprd04.prod.outlook.com
 (2603:10b6:8:455:cafe::2b) by DS1P220CA0010.outlook.office365.com
 (2603:10b6:8:455::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:31:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY7PEPF000000EC.mail.protection.outlook.com (10.167.247.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:31:25 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:45 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:45 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSu013473;
	Wed, 7 Oct 2026 05:30:41 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 12/20] dmaengine: ti: k3-udma: pin owning module while glue clients hold a udma_dev
Date: Wed, 7 Oct 2026 15:58:53 +0530
Message-ID: <20261007102936.2402427-13-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EC:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 9938a64a-5cd7-4769-66e0-08df245e23b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|7416014|22082099003|18002099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: Da+peH41ecDlC0X/iD+VUqkYGGlaBVPHSGO514YMfW7qXbdghZj/U7ERZSKevF/J9uPiMsAtXKFMcGB7LbEFnUzZ9ha342X6suR/uD3AijxFrg2IBGhyiM8m6sScQAAkkfO7TDD5QZ2uWV0ndrzpCCVSTWCHh+UpX81CPriyKUZB6mZyXpV9e5op1iyvI3M1HN1d4/9TYu4lAYYmDp3nsfPxGZn2BrcCqGiId9xqzO+1DC70EkWM4B179AD4ihvan2ptzdMoa5mkzPhbgrCFFVpBLJvzCPmJFLLST/SNgl5S7c78p4APGTXVFt1HLrPe59HHzCJFoN4WTHzPZoolK9rbcaczAq0M/KghXNBXQDQHPzIztuBqkx/JqUWmy0bNSQb6PRMPYgfJ3899oypTWvapx5MHdWOY2KqIOJV2AT3Oq19SD0UF4QIKFAwn0Nk3XiwfYs87MgNABhIjXM00b2peZ5duJq2FMMQhhpsRgA+yry3Dky0qewUsMVrqYBVG9vTMOCSWJ0ammUCUKOQ/ZUsiT7BxtP+on2XWmQnW/eldMyOk/dT0yD1I1UFgniH0JaB+bQpP7dtDNsoUqr6dofxkaY+vU40ZfmF+ezbyzY3Vqz1TfY8iM6aU+bSrCPSMnR0Cy/Qnw3bM920TAC67n2p6Q8wv7qj3n8XmvgC+2cfOfM88t4GgJi1ltLVoYa1mdZV6i0ZmNLol+Ffpts2jVSxgzccOdvRJwJcLuR5fFlU29NjsOSRCXZyyqRQhf7O8
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(7416014)(22082099003)(18002099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YUgzLiEdXfVt64+jvYeOsdDTEEQUafXinQBkXcBnBKj+0xtOr46E5x+BZVV6XzFyvj6LspCL8mDDO49Vjzrzsg3j7b9cnVBQMoM+FTWn4Q253wAQ9CCXl6zXjKOJsxM/M3FfSafuHbmk0z5PXOkSxXFSh3B5nHAiqNLRybhIarYxCibjP4lvz2csZyOOa5S+gBKNiohRtMunHLX3HhFEttAYftKd+H40IyW/Q3c2vxgB5U/saHV+iPcrpoF76uaAFd4VuoJ8Qpx065UkVQDOgJeyPYfKbjTF3Iq7FLiO3EVepMC4Wlp+lDpq6+r+TR/eYznktPV4nAIVHP/jcg5iNkDzAeK9yABsGnPMI9Qr/kVKWuIznHneYd6mTHPnhsgGVLKVsWX5ByAwp8uf9YURe5vS7TkQ5BIWqHttqtvhJ/2iC933F/CWT/pYOk9GRFi7
X-Exchange-RoutingPolicyChecked: 2eLD3PxmpPHQpXfQGrwPKvU/rsvRA/9WIWPumQNOI4vcSrfy3hnbRFqPohnIElGVrgi0fb+Vk/JWEQjF8XpMD0gcd+OnsfAXNzTpAbrwlI/qxJGDNBdU5fVIpexNBpR1g+dBEFnbilv3zvmgfCKUoa2hDxUeGiRBGpGSW3UmjLbdpo2DS34oSbrJA3kgHnuJVkV1P8JdjBwJ7n1onBtnQV+MLxad/2xeuX8MK+uYgsO11EDv9Y7HF9GgTscQyIF14/yhuuq3Zdf1fN3zmxAwRKEmAakIB8lhOCgZ8LKqtFgN1KdCMs4bmIV0PNFRaNo08AInt60DKKUUqB0sAPuNug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:31:25.3320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9938a64a-5cd7-4769-66e0-08df245e23b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000EC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f82 cx=c_pps
 a=il/B+BFNnLmOqkoxAJ/ciQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=FsHYa2aWbwE-ciTauWIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6stbvh9u+lz0
 oeBgQpNTQlCVGhRwrUtLM6E2ps4KKUrThGXljjcUL3zW2zD1hdsJm7uBcnvhwjGrCh5WmGZxmjk
 GM+9cDuGYd8za/ajaUnWaAc7JxdY9uI=
X-Proofpoint-ORIG-GUID: N0VN9G9mkYeTn3Yu1B6JVk23USKpw8oT
X-Proofpoint-GUID: N0VN9G9mkYeTn3Yu1B6JVk23USKpw8oT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX+If7UZPnljcc
 6o7i2h+o5Pg3hS1uPeGkFcAcqI+svrs+oxm5l6BhjWlctS5wRmBTAiQAsoscyxx+LkIJDM2wG6M
 NxXnR0Rub85iamXvUV97xVwPbxyPkmyxiuCLJFd7xlI7mitmVIVFIzdG8YXGRYnxewkX7BqGrPr
 htP+xZ/NTisUt5WK9+Y8UOYMaYenghN5VnLOijXReGnBEYr+xNb8dg7+SoTP9t0n6KoPx4KzkII
 WPuXX7PSHvH5BfIE3pZkCUtTKyneVaCbdyfAZ88YRickpvvoRJwUNjAT8itKiUh+6UasgzZZnio
 Hifl6LnLxaUbLx011iQyJHSBqsevqZ2hD1LRnLo47+HiidmZERRNienQYL7Eei/JFd0PJGKr66u
 QzSo6Dacdt+4fLljBEa5ehYy44PERJTeHU7HWlRl172bKNTowxvJ32Ji766v5G394bSJleOJRNj
 HKTCWFuF6BmvAMGNlNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033133_540594_4F960C01 
X-CRM114-Status: GOOD (  16.17  )
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

k3_udma_glue clients obtain a struct udma_dev pointer via
of_xudma_dev_get() and keep using it afterwards (e.g. through function
pointers like ud->psil_pair) well beyond the call that returned it.
This bypasses the dmaengine core's own try_module_get() protection,
leaving no guard against the k3-udma driver module being unloaded
while a glue client still holds a live reference.

Set ud->ddev.owner so the module can be identified, take a reference
on it in of_xudma_dev_get() with try_module_get(), and add
xudma_dev_put() to release it. Update k3_udma_glue_release_tx_chn()
and k3_udma_glue_release_rx_chn() to call xudma_dev_put() when
releasing their channels.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-glue.c    |  5 +++++
 drivers/dma/ti/k3-udma-private.c | 16 ++++++++++++++++
 drivers/dma/ti/k3-udma.c         |  1 +
 drivers/dma/ti/k3-udma.h         |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 70eaf7ee57e68..f9e2a1e1e0a50 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -466,6 +466,9 @@ void k3_udma_glue_release_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 		device_unregister(&tx_chn->common.chan_dev);
 		tx_chn->common.chan_dev.parent = NULL;
 	}
+
+	if (!IS_ERR_OR_NULL(tx_chn->common.udmax))
+		xudma_dev_put(tx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_tx_chn);
 
@@ -1260,6 +1263,8 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 		device_unregister(&rx_chn->common.chan_dev);
 		rx_chn->common.chan_dev.parent = NULL;
 	}
+
+	xudma_dev_put(rx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_rx_chn);
 
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..d2501e074bcfb 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -54,10 +54,26 @@ struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	/*
+	 * Callers keep using ud (via function pointers stored in it, e.g.
+	 * ud->psil_pair) after this call returns, bypassing the dmaengine
+	 * core's own try_module_get() protection. Pin the owning driver's
+	 * module here so it can't be unloaded out from under a live glue
+	 * client; xudma_dev_put() releases it.
+	 */
+	if (!try_module_get(ud->ddev.owner))
+		return ERR_PTR(-ENODEV);
+
 	return ud;
 }
 EXPORT_SYMBOL(of_xudma_dev_get);
 
+void xudma_dev_put(struct udma_dev *ud)
+{
+	module_put(ud->ddev.owner);
+}
+EXPORT_SYMBOL(xudma_dev_put);
+
 struct device *xudma_get_device(struct udma_dev *ud)
 {
 	return ud->dev;
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ddedd51ab26d9..cb0bdfa825f5d 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2700,6 +2700,7 @@ static int udma_probe(struct platform_device *pdev)
 	}
 
 	ud->ddev.dev = dev;
+	ud->ddev.owner = THIS_MODULE;
 	ud->dev = dev;
 	ud->psil_base = ud->match_data->psil_base;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 4dd597ef435b8..65243c9ad1346 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -656,6 +656,7 @@ int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
 			    u32 dst_thread);
 
 struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property);
+void xudma_dev_put(struct udma_dev *ud);
 struct device *xudma_get_device(struct udma_dev *ud);
 struct k3_ringacc *xudma_get_ringacc(struct udma_dev *ud);
 u32 xudma_dev_get_psil_base(struct udma_dev *ud);
-- 
2.55.0


