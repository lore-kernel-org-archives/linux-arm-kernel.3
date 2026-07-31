Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7740C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHGjuKHU3ihlw5LPjcZzXa60k5baUPMSbSSTK4afgjw=; b=TcHIbK/TruLfF+pghw8KxO0Vv1
	/vqVMweLAYGY/kRP3/KJ0zzWJsQw1frOOdBBUAcHw7YiRfvDi1MFrHqu7KsCMQlV7EjZUGmwqCVF6
	tErJaS6lbT+ROF3CvoI/eSffLIbzAMi5gNlANHQX5mMw9wvUWub1pgxbxDrENPkGB71hLf20qS5m5
	mxg9PTwUdDkG9sGekY//kbMxg7684mKevhlu3bxVSOHd3EriiO+CmkQOWa1S03rAk/ktbJcPi5Tw4
	x/yk57qqeGCuKGh7J8kRDG8+grNdEhNCvnKjE9UEWDcftZIAj19yQ6BSKr8lGiDqaiADYQ3DkZ2qn
	0ZJ2acxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkvS-0000000CMit-3wIw;
	Fri, 31 Jul 2026 10:57:14 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkvQ-0000000CMiZ-0tSh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:57:13 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66VABddZ3828436;
	Fri, 31 Jul 2026 05:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jHGjuKHU3ihlw5LPjcZzXa60k5baUPMSbSSTK4afg
	jw=; b=eRJpwaH5Han0lyVWdyBB0HDP69SibqC8CaE5WFCV8b/JPdMBsbiCEmXfW
	Y265DYqNF1BkajC5oDXhgIHXlrEGpQ18+tv4onZJNqIuN6/s0StuJ8PTbvW7Kxgh
	URhbFuOzAX3Xus0xd1hyOPJ4eGmnd8HtNI98lwhByvLvtPzOnhPly4mVlVtBrhFQ
	T/JyzEpK+d9zn/QgP2HAaA4pxQX4sfJskZ0NDhuidi0rV9ASvql3xGzmlyfjtxo2
	JTl7nRGYCl1cvE4DbwGoibehTHGxPN+k2mWENVfwv0yzCpERrpR7LD2AiHcHoGdh
	TMCRFycsJvFvz+DlxWswag9YJG3gQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4frsr2r7e7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 05:57:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl/QS8I6U+gdNlMxfZh3RgMFKvLONtsGcn2dq7orRYoIzl5PoMeBQ9eOkWqK31NWKEbKFBgFi6rJY4BU78hDmvKEkmt33EiB3F4hWYm529BU0tCZW7t6CTpN4MKVTnNkFXG5SSlcfFl8ik/VeFG3Dlq6UhDcYffpM/S5qOmVqJhfjyH+9Q/ERl9kqVxVqSXy9kCEdNlKs//yzD/wZAN6ANy9tksT1cKaqSxpcKLS5WjV2fvRwVk8UU7YbsFJys/4Or2ddc4Yd0eONfVmVK9oH2ftZaRDQ8hD1iZe9OWko65Qq9RLnJW7+WBT2trWiSlQrZUR3PtTjSXXrA11sXGM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHGjuKHU3ihlw5LPjcZzXa60k5baUPMSbSSTK4afgjw=;
 b=x9YFNX82zZdkvI/Yu1Attx/eB290i316HOTi/I6ILlgc/ojHgPpJ40K+np1O/ADcDqna9V+EkDfRKC3peittZO3X2i/juEvhItknIoEYe9XI/XTIGuxMK61GK+mUSsoLf9z9t17Cp8Xzxftr/PGfBELBCWELG8kulro2HmREB2DqeokBbculc2CfHIaFiDkpHG34QWHEldWZuIAVk5SBvEw/UDRC067ruzLsDmqs1pDeHO85O0kueuzbzB3tSAruFUcLdfc/aW5JUgmDLfcoLqrBk6AbCgFIqAAGzo/C5hAF+kwSSHt87U7U4Kz7QETTPscdoTM1TdBc2jG9/gXX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHGjuKHU3ihlw5LPjcZzXa60k5baUPMSbSSTK4afgjw=;
 b=Q+o44YBjzqj/8Wzd3TonCTnyBiu9hITbiFuU2P+FvEKLaoEZzk/q/IsAHk+pLMy1xD5QemNeksssJnmW6OTph1DinyMtna64escJYQwxGa1O2GeLNkzi4Lyb+lWqn3AA1Sg2u6pcaGrgdNQt9G7PrZ+Dx5Ziwn3ry61LuBSfAnQ=
Received: from MN0P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::16)
 by SN7PR10MB7101.namprd10.prod.outlook.com (2603:10b6:806:34a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:57:04 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::aa) by MN0P222CA0010.outlook.office365.com
 (2603:10b6:208:531::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 10:57:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 10:57:04 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 05:57:03 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 05:57:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 05:57:03 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66VAuxxe418390;
	Fri, 31 Jul 2026 05:57:00 -0500
Message-ID: <2aa271c4-7e0b-470d-addb-4aba73ba2177@ti.com>
Date: Fri, 31 Jul 2026 16:26:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] MMC pinmux configuration fixes
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|SN7PR10MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d1ecb2-f8e6-4bd2-00c2-08deeef274ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|56012099006|18002099003|3023799007|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: ++LYdumPlj09B30afTnnonIjxUbSAP+iS0w3jpy4u2RrLQHoOnyMJUQ7xzWb4mhZ3iCckB/UcB0mkqX/9scZjKbe4nF2SPYrbmV9H9heVtZOJDare3uBLEQOkVOpHcfOJIFNylyT3Bm6N//tfSvtn+FXcphXLpWqa20qGJiwkmhpGaXalumtS/axalgsaYlATMl8QlJpumzgWllGkvoGJ62XoFAmXDai5+swf7pNc3qyzPeAo8GrBHMxl+mqfFuXzCrxspJCsgX0H+TLr8hKuyDGCNyYF3NSu8QeVpG7t1Qh5mk1ItayfaPtWL/pgpDxJK4iWJLtkVTy9Isc22apDZctDaf97MuhMnrM55Z6Byl2FxtD4y2IwC1u/yqpkZOPjWOvRG3LJMc4OHz9sOYH/VpxuKBrBfgfxd0eyKOhuZOVxgI96/PnO0B9j/2mcPGiDqVzsBq8LY8X+Zv0USKJ5lES2AKwCUI2QTsuUALa2OvnJxqbhom80MXrwhEgFGxHDRQUnbBbnxsKG4A4gfMp5x8nSOWbGfe2ViKoNAsiAo191szYQJACcfvePgPRgTN3kV2Aefj2n1VVNsz4g61lKFVBQNwye4baLGNUMEKGyz8gFQEBGfLhvIjr58RWLmmpnZbP6i/GdSBSfCaOwXMW1/scRqEY0mOR57+Hs/D5FZmRNHRPqweYtET9LiqkiwFJ5GmSoJ+MMVn/lLy9TgyghA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(56012099006)(18002099003)(3023799007)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VyUe4/g5QqcC9CYCpTbvOi6qyVieFt/lfB7pbD9eocICXPhcPxYyvcrQbJV4RCTDDTVDM0C8Mil303kQTGu37GzTErkjCPlirUOfWYxQ+H1kOhMpF3OKVYKZzdDBFSOn7p++UO3pXF+28vnx0tMgyieH33Oz3Zek19+Ps7uwG+j+BFvesMHiOjt201Ayx3lFy8mZphd/f4DnLOSfum/cFA2YfZvtZeG1tZ7GYOXABNIiKoQ2+rMDqAUFeFISrPZw6ttkS8KKqe5XGjBt+ExG+Ne1issi9QfxlnGUbvno5Pyd9Q9REe/mFD6+aiEMOozrgirt8MY150e8pETlzh/ofEnau9uxb9+3/PZVF2JmqXDLvUsUoOlHV3175GNfhHmBUAYDcQfFyncg6qxG5AAHWxjyd9cSW0fT6qTLguhOnD9JoNMk4/u75vBDuJ4xeZhV
X-Exchange-RoutingPolicyChecked: POaZtjPVsmoSFB5YEoy/2Kf/JT8Ay0Ec9X17ZP93Mtb9+wbKdH1b7RmgAXH+2/Sx1jGmo8jel/jRIzHoJ8qh/9vzu84SzDXDaZJ59ac7LRszM8Y94ggNRKX8oIq/fZvNl3II1hNpN2WBC1tpuqGcXYcR8xT0EZvvr5CgqBh5oYgTzrxVc11jY4u4ogUGECnKZUO9uxd3MCa5Y9Uk0TNeFA9v8oAqJDpu9BxRlE3iQZkzJaOx7OxDGocFIeLbbuL+IuSezZeAJIJCAPaLEz1Ze/PKryL6H+5HSf/DVa3cgw7SdOa7369KwT9u5oCH9wSZUsxlK8EKkWAZuPe4MlAZAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:57:04.0875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d1ecb2-f8e6-4bd2-00c2-08deeef274ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7101
X-Proofpoint-ORIG-GUID: 8El7kGIJfW33ql0RVWZMun_g_Xrueief
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4MiBTYWx0ZWRfX6k2JUlXik8Ic
 fEnTvNv1B0JKT9YUqyQFcx1Kp3vwXq6QUjNC9lPXmLjPWxVycUbl1wQL/H6P6z0EueLHM2hyueR
 MfRFKhn/BHOfCTwyUvGb7ZJ0td+JAPn8y0qDQmEemRlCMX2WV02K7SwSElwin5ZyQ5AKXB6L46S
 Vl93J0/yX88lHHsg7jiVZGLfhPnRQY5uM9LfQGbBLYszQaQ73m6N98UijMNLJrJWse5W9Vcjeaw
 WGXRC5KaEGvs+xFrtLzQrbONn5UoWbxRWF1jKJb4RzsR1dzSN03ZuytknFQ75Av4Ucv3+Ob7Zih
 IxsI4pmxYCqSpj6eufX8Q3FEMJLZyK/g5Ghwo9LdAnjon/B/nYfM0e7TIsXBptPcQypfoec9YJM
 hSmQkAXqfMfdhyOeCqVRjOl8/3L1OR7EbU3MqA5/pUW94W1A5TXKpoKNSjm2e9IRAeBIzpJC6Ef
 IoMdsaO/pTiyOfsqUHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4MiBTYWx0ZWRfX9J8qfv0thmfA
 jhhhQlknWF8H07s4BVfb67H4p+2IWLZHbulsiRY9yw4G4ZODYzsBpQ2uxlGJrN5ddV9YeI81y0d
 DIV9Jnc4w51AKJZdPhmO2CxWWOyzBhs=
X-Authority-Analysis: v=2.4 cv=AND4Gsx+ c=1 sm=1 tr=0 ts=6a6c7f86 cx=c_pps
 a=fIWvqWWOoOps8dVAlNTpGg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=lauEvP0RB7_Ebu6t6v4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8El7kGIJfW33ql0RVWZMun_g_Xrueief
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_035712_262714_4C7E18E3 
X-CRM114-Status: GOOD (  12.11  )
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

Hi Judith

On 30/07/26 01:29, Judith Mendez wrote:
> This series fixes MMC pin input/output and pullup/pulldown settings
> across AM62x, AM62AX, AM62LX and AM64x boards.
> 
> All patches have been tested except patch 5/8, so tested-bys
> are apreciated.
> 
> Judith Mendez (8):
>   arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
>   arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
>   arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
>   arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
>     MMC0
>   arm64: dts: ti: k3-am64: Enable IO expander interrupt
>   arm64: dts: ti: k3-am64: Let MMC1 clock loopback use hardware default
>   arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls
>   arm64: dts: ti: k3-am642-evm: Remove unnecessary internal pullups for
>     MMC1
> 

Apart from 5/8, these patches seems like bug fixes. Please repost them
with appropriate Fixes tag. Its better to separate out 5/8 as standalone
patch.

>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      |  2 +-
>  .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  2 +-
>  .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  6 ++--
>  .../arm64/boot/dts/ti/k3-am625-sk-common.dtsi |  2 +-
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  5 ++--
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts      |  4 +--
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
>  arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 19 +++++++++---
>  arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 29 +++++++++++++------
>  9 files changed, 46 insertions(+), 25 deletions(-)
> 

-- 
Regards
Vignesh
https://ti.com/opensource


