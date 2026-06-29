Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4357EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=108ZvFGYrjja1QXVk+QhKvaf2Naxpxu+R+McxuXGkJE=; b=Gq/QywPVKZLhFjhJT3Z5aZ9gpc
	pcsVcswWAcIIKEuGOIFmHNdu1XJ3d0+mraOrnY0cOQ6SQjpSQCy0F17O1cfV1FRitsQnwdoMNTUt5
	hd90ABXgx1hJ/guhCoh3HRCGDoTMOhD29H7i4c+eC7VTTVHdHxm5DW2AgWSKsPcylFUmsVnqDSfTt
	8ViqcGFPfY1IRjmfM2LWFqJ3vJGnOCfaeUWG17EKIxoReueOBBb6amUHVIw6Ix/hpf+wPgEcFhMYE
	zaoBZ7IVOH9klCSB//CQIntR1C92QApWRx63TxuTnM2b0710fGOHtMqYcyfMQd93xwJujy4ixwrgf
	YA360gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFIn-0000000FGi1-2wSj;
	Mon, 29 Jun 2026 16:57:45 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFIk-0000000FGhf-2c7V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:57:44 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGUPNa2579641;
	Mon, 29 Jun 2026 11:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=108ZvFGYrjja1QXVk+QhKvaf2Naxpxu+R+McxuXGk
	JE=; b=GaYyGcxsDIGLmcNj5sFhmP6t+IKVzAZmRH6CsKYpH65frgXN1wa/zJGTe
	1aANjxhzIR298GXYNK4OycbioynnnfrjCew6cmjeCkP6Gv4gUAByjqAqxhdL4y4I
	V/p7wvMSlBtA8dENEr/jkaeghIjWOWSvJJDr29CONgWTrRZulrQfJMKghdvnAO9+
	FXPrGaofWxtiqomMwyQbnS+dxhjFDbCtWNLuBPqRqmF3C4qlZQixTFwMVyIQ4lo6
	WQxqkdhI2R+SU5Mi4uNTGROD+Z5ZECOALJ2acfG/twwVMG7YW3AkpC3DDTN0iHbF
	I1SoxcP7y+fDiJ05dNf7v/sE5tNNQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qp5aqkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:57:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBHqvx3hntjOXW9vF9Rfpw1F1iFyDgvWR9jEriZgU2yJdVVdw+RAEFHjWcSss7ub47G8rVQ8kLiIxmh6bzmg/VM2cGDj4lEoXIrUndTGQ7pxfB4dLylDxMn131NtCgwfpe9sbKwAQOjbBUIKjBhnC/3Wg8iMLoucmECeAQTi574BZKCEGpkWVOvemnfvk7AZ8uBIJY/IU/EPQdhetATpxqSVd+GqBKUFwEulNWV2WOxfGKNMvaCxZwOWxPhhw8+iA6QKyR3fuXWcxWX6IiMkUpjHRLkSi3rRJnlxPbltcD+NxhWrU7H7JbysTUyq5PTRtKmsM3x9YZudjcLcNcNAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=108ZvFGYrjja1QXVk+QhKvaf2Naxpxu+R+McxuXGkJE=;
 b=jpPWGw7E1m/pyVpYfS9KVKY8BN0D+37UAd+FZYBxLUWc2dWsSEsSQSvhteohJtt7TPIW75FmlcSreSePoUSctEra5qFTFr2Y8WQoPdPUC+A9e+FDCARrfafiWFjXdDFSlMjaLTVrADSAUnGb3xKPPWPxet+GRoOP3bFIFPXNbK1m5878SxkCwtRavry24g0iG6R+5sIIf9DWw1s2Ich1+OlNkPzYF/58qxgUhhdZcp4Lwcv3CBNYS3PEIyoQs+IzbRB43rwGui6Fwanin8KRKLW0LfwAn309tyJw5c0JdWK1ckZSY2DjZDGv5ECOnDstWOsaVIJB2uWjUKU+zmcIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=108ZvFGYrjja1QXVk+QhKvaf2Naxpxu+R+McxuXGkJE=;
 b=gTvCoHSYa7TN+M2eWEmHeQLyzUAeV5P6IscW9/sDhJfPc9mtwD7MKkeTRK93czZHjFdCYDrSXsuuAbewAi2kkNQLEva8X9+mOzjGrklNU6azHvkkc/NSJmINlm+vPUjqVVgS3d/sCXsKeJOGW616k7EfFQxRbX5RtjRD8KDrrPE=
Received: from PH7PR03CA0005.namprd03.prod.outlook.com (2603:10b6:510:339::31)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:57:26 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:339:cafe::aa) by PH7PR03CA0005.outlook.office365.com
 (2603:10b6:510:339::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 16:57:25 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:57:23 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:57:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 11:57:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TGvNun454884;
	Mon, 29 Jun 2026 11:57:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Date: Mon, 29 Jun 2026 11:57:21 -0500
Message-ID: <178275222394.2162147.13459463877313723046.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260615132640.161584-1-francesco@dolcini.it>
References: <20260615132640.161584-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f31438-1a4b-4343-3cd5-08ded5ff7eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: nKDYVJjEbxBxW0COmwuyOc/bLwEmOfOirjnHW2gDKQkO0JcpWgvAIUSg+Whr7JgN2FO1wXNB0JaivSQF6JROcI6q2nuDGkIl1Xodpqtye5rnZrSDtI6bdpxgf059VBfBeCHXUT/0+NmMjH1T2IQCMWE66wXtRGjkObU2KAe5oUu1jHXY/jOVPn1mlueXL7TG+52fbU4bFQaoVxXFHyxwoIOkogO5mT2B8KO3o8UB/h0ClFKsJiOCdDs7ef3falKZSgR3qPkgLrJMDQMUCann7D0gqt94HWawegWfuvZx8JLgh09Nnpl3sqhJZ+I9msNaQR9H5oy/XGeDZ+WpuEDOUDy0VI5eRTPDs7F3kS4xMh/L6yibRLFBhq1031ilUeUbIxrRVpk0wQo8db1d23VUDfVtBIHhROp4nCIlwWtxHptH/l0T/6X+E4i8FURSsfToZVjMy2NJ0jJB1o3TWv1OlT1ui2tqiK6vXHxlZm9aS3jjA36gQMQNFNDUuWAeVDJGaQ+aHzhtzO0c2+ZbmKLslSx+gpHWVLuDmCAyPqM6uNt4UpkEFR+Irb4otLcnN5bbLAzh1Qqin+oNTY/eEtYCCzXkyhpT8cSY3YQGjBrbUKzUBc937ollDefLtTz4lk2nKLlDXnRgNWJdg7mGAMjFrbmcK31ny5PpNpxhcrb/aRltZvqhXTFDMQCUuJUfikzghCz9FG7uxhDfxAyKrSeeVA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fmeXcDYCSrpljm7BNF9yH6nRAjw00oI/H/VyGMiR9jPTxNk6yrbKKRMjic9BBj6R0ev+sVRdrVMtj3DbcMk9goOhhejFz7hSLl0HsFHKglzq+EdaJYSbB/FmA3Rmr1QN5NJCZ3GuVONtQNtVVOP/G5+VGEDYHT4kg+RKIWi/613PeGEIotitwz+ntG4hgnZhJ0Ys9mhIZkNMrkejMY3f2GfU+D1HGw01Rrb3xqQBdg93Vk8labXow71OytCIYVZN9Iggn6IRqh1LHs5ejugz+kboPQzmXbwUKx7xn+Dnr5D5xmQeAQTUpb4q3YrNQvz+pldXwRthMFNG9renpZ4GoZpjhl2E8x3GzTla0BWthyArmFk46Xl5QTn7GCJAK3zjUWGX4OnLW2Qim8VD+R5GQ+aIf8DN2C+jewS72tbCoNu3rNvU/ATH1wRZi51xmJoT
X-Exchange-RoutingPolicyChecked: crfwH3n6DymQZ9gWZIQRwy8XzeIqgM22WybW4bMgQ3yrWjgpUuBffdzkMCnHY1ZuFym6cFv7L4+iMrlhN8qYsXBApK9vxSRT9CZzFiXIM97cW7eSY+QOYieP2oNKfvNl+Ks2DbiiXkux170Mgofxqip7XtL3OvfyXJgMCQUAmjF08Tu9yoaE9c6RCmE2CYHCwtaH+ummDHV2PmvabBSQ95he7DHDOJ436Llcs/eC5nCjuOEuHQcpoFS5ixRDN7fwNf6HoTsAextbMGEZnNNPnhK2meRjb7iyjsco5PgmCwapK4vcmR1P0+vzPdUO+sHpRzPCyS1pF9SRqPl1vah+XQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:57:25.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f31438-1a4b-4343-3cd5-08ded5ff7eb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-GUID: A0fhLakc5x2xWIBQe5G3pFJqiazb_b3p
X-Authority-Analysis: v=2.4 cv=ObOoyBTY c=1 sm=1 tr=0 ts=6a42a3f8 cx=c_pps
 a=INYzEgT09ABq+JfORImVWw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: A0fhLakc5x2xWIBQe5G3pFJqiazb_b3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfX+NdHompTcZyr
 Zs51bA4CAlZvlLemcGYWF3fg7nu9MP+rWWeXU39h69lyAEQ3K02OJx+AX2N0hpjqYmUSZdSLJ7R
 B6NLJCDW3ZX57BOiC65iMmlW+ZMQU0ABWUjshBiIVebHfI+YcK4b41XAbtCQQTLrPlqLhUjFTTb
 zVy2jXXqmdEV9AnG7NVlxReFCJfVSYzvYv+N218DxbQ95IRESeGa54EJ4zVSJ0pLkCklJaqR+yC
 7pI9PNP3GD1yCXyrPKj+RTPSnAlRefEmvdfGEp2ij/ot5J88awpj6dRZE2sCZszBdmKS9Leqlrv
 iRvtFhkmrn5v6Gbw3XezU6xj2fDxNAKQ2S9iaF2oMtk0qvA8XXfA2AuE4qV1EWntrjzi2T4XPgN
 oEeR1Q2bfzNJMN3bhM+2EODJzsTvdmQcNPPv97Wlk5gPdbRaKkKecqQtlxII95vHxiwqdKmPmMC
 4KwIct2x4Vt6wN05CfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfXxEh+BzgsaYum
 l3+Ry1lgwj9BFsqfOw8HfJaxq/QhCd5dn73rAL0eIx/xpODZ8E/LPiqNV5gOOnwQSIka2Saj6Yn
 RfFDrD+OEprc2RIXAqGLlrHvHd8kocI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095742_781141_3148FFAE 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Francesco Dolcini,

On Mon, 15 Jun 2026 15:26:38 +0200, Francesco Dolcini wrote:
> Add git tree for TI K3 architecture.

I have applied the following to branch ti-k3-maintainer-next on [1].
Thank you!

[1/1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
      commit: 4fb6763ec70d49f592cc6e684bfc5f17a7db7133

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


