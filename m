Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC25AC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNCAa3atBJP/c1k9o0upgbXd2qjcIMXl10UMaLZybIk=; b=GR4FhZYae4U7eIOX7pavqRT59m
	xmrAF0svWuAuv/YNHqWBWJ9CzqKKXLhPUydVJW1I8bySNjiRVX5Wg5bbNLQoE5NuAyt3QPFhO3pL8
	OLRH+pLRFxLTt/bYNEHOHA6cHRt6eGFmFYogMBAVRLP0/bZ6bOcFsDurEZy4WtkaskoxZoPuDbCou
	2SVkagJG9p0aC8K77U8fEaYaW3n7Q0IgSXa1OpXd3ny+iF4Wxzl0PGZxe3MdQDeQPR7YjAMyRnCSU
	oJanHlsOnR5LvScO/loTHcYNtTqbf0tB28MusumXGqgw84fySc4OvMRn6JkNXh21RXrk4Vie/b8l/
	Da4Nya8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3Kv-00000008TVx-0geP;
	Tue, 21 Jul 2026 05:48:13 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3Ks-00000008TVF-2y8a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:48:12 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCNkG3427410;
	Tue, 21 Jul 2026 00:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dNCAa3atBJP/c1k9o0upgbXd2qjcIMXl10UMaLZyb
	Ik=; b=FLlUOWoV7lPwHmVeme2a1iC7GyuZswva0+tUtZ0NXATsaUNN0PKVUggyS
	jiR9kkmST/dDrvJaJLgkeDtYQPEnhpH1xbvz8FeDjEdeEwX5wiztZvYHXv0yzJHw
	HY2vbZW/pSGddPqax/lCXI0GHxb8UigfsIAaR9V1xTOWf9Venjq2+5O3a0QuRYsZ
	j/UrQyKZQTD/xT1Y29RKn5ImRGjzxmH5ILKT1a41q1cdWleWg7ytHKORFWNhDD1d
	wQ4b+rPhww+R1iIzwX6hDdsJm4P4RvRdQl5Ok2eNjf0eGOWl7OdHDhuWweTskdb8
	3zgAOGYO1ql2J14/Gd/3nz8OZofRw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhjnjwsrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 00:48:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM2A+VPOkfZEWxCH6dUfh8zxtEJ71CFkhxTfTPRBLiZoW4Zr9AhaApqW5PGqQ4GEv2T7jLb6DEKAe69fur4xh2yJsRN/JlFfSb73O+0wXWktwF476jc0qT5azEo5GEyYyjD0zmCF69AvlxAbk/MnYc6qntClHhTgU9SxIdXc7TFacR+qJSjvMQusi0PMai2fscoCA3I1tGQPQ1ZOacHBG1C134cuG7/nvMFrwyWFsZ7qGqhR+hy4TIp4UxbJeWY/F+gHPp+ffcwZjjm+Px1JYYAeoFi6355ocsn1r6NU5mdyMPtPABTqBVVOCcUKyLEqWV/MWsDjg4GGsXnaANgS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNCAa3atBJP/c1k9o0upgbXd2qjcIMXl10UMaLZybIk=;
 b=eROqWpi02tAQg8TOnh2mnXJ/R2cG3ozkDugPXd9S7azOjSq2TBbdmGB862Eiehf8dMiADzw2nVfNf7vfPYs7F/3h6mGSMP9YHn4uOX1qmBwTqHniPQUl3y2lngPkjDSg1KCQjwdBTic9vBdhl3+pxusp17f361RgWHT7p1o/i5CjJu/iQ0fyYqL0xNO3wvcprcYtgQ+v3EJGeMBD54J+9vgU1XJhOcJ0tFXarJI+Vm8o0koZRLMNjoyW2vVXArOwSi+K9axmaWLXF3fVEq6eAlGBhLoYlQc1aK5TlrfvhKD0b4fyCz3gKwyRVwHIy0dGv/lZKv2KfzYR8JaOQBR+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNCAa3atBJP/c1k9o0upgbXd2qjcIMXl10UMaLZybIk=;
 b=JQI5oT6yJ1ELcKhFQypUF+JQ1n844txD9zCqovBwVWHbtoGY/2hOU2alQ4ay/xHzoppSBS37deiCqwxVfsaaVtr7udPx86ZKyPCatSSnOWJynq+5uIsCjTmQ6Wh9yXROkLKlEWXmTkqrPPToQwZIVQu9nupYbhX4bhZaJ1wNOco=
Received: from CH2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:610:54::23)
 by SJ5PPF831D4660D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 05:47:58 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::52) by CH2PR11CA0013.outlook.office365.com
 (2603:10b6:610:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 05:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 05:47:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:47:25 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:47:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 00:47:25 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L5lKim4177767;
	Tue, 21 Jul 2026 00:47:21 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Stefano Radaelli
	<stefano.radaelli21@gmail.com>
CC: <pierluigi.p@variscite.com>, <matthias.p@variscite.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook
	<kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
	<gpiccoli@igalia.com>
In-Reply-To: <cover.1783864932.git.stefano.r@variscite.com>
References: <cover.1783864932.git.stefano.r@variscite.com>
Subject: Re: [PATCH v4 0/3] Add support for Variscite VAR-SOM-AM62 and
 Symphony board
Message-ID: <178461283127.873002.18029849637908561186.b4-ty@b4>
Date: Tue, 21 Jul 2026 11:17:11 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SJ5PPF831D4660D:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d92c93-e3fa-4900-19ac-08dee6eb9dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|18002099003|22082099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: k2FFxYCBxhkGO8mdafblaolH8R9AaxXyfo9mA4U3YkZ2xIRrXE/uEtFD3ftYW/Hn+yWc1dEAD7DACdOaJefFFFM9+TA6fyycOX8SDgd3ViZsmo0Ne3FfjXYEDN+HnQYIkMyWJ7yuE2B3wYRWnF2qhNcHU3zHoDouS2/1Mti6Sx/Ua/uRNmtDJDFSGm7NpuoumybgpwoYl0FpTUe9TDBvI3bKcHKROFt3/qQ8wngcqNxjx9qySKh0Kf8PNG9rATtslLy/1uWsbFO63n25TZ9pchFwA3DMplPNkkw33DkkSQa+qgwgsn7WrgW4OEiRyo+kQEcwi+SjuVGzEi/jjeqzlbYXh9nRZJ0vySEhE9x4DRGTQJb3WKpr6CmCL27vKWMyyIFfrL/TkjIkWOXQ3t78Rbk995XCr/Lfe/7+4SBsmPxHQN8iwAQ4KhwLz59JoA1VA6JLX27Th3el4SaoMiUDRuZ5GlIM9ee5GVMONllMC/1UEss/f/zSTXakLsm/BqIaRMrUAlk+sCdRVRBySS5dlC7ni5ZBffHBegkcob9aFIVqAMGghqUY7hynswBriKoSJP8RHCVrYZcErQuVB2K5FCkoXalkyhfVInmnt+uKRLNnmsjwjwuHX7KFOHstXSLBaZyMLwl0Iy6WewuQ2g60UKObkDO6Qc04G7+aOOeqwTm273mBqLYExFepynxKS7dIzuc6X3xUyO2ix9oQShWkkw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d8H2NVrGNvFqt146SCuIGd0612AW5SRsTcSb+jOSKIvde18Rb2y59B+NczLcNPcWgG3HQKOJQixWqTHPWHV1oUUs5ufb7ZR667zswKnJ2VPKeLeH6j//Cb/FnyrwkGIk+pg24jF1LcHhBEHiaxLwzshcSyCFbaksZmZrQiBbXG1q1x7Ht/wRNMzxz4A+mwQ3sj/vuqocsQacwMgPP8ns3vLzdyL12ntdLSxetvSVBeKsTCCCzYzLevfqKaLT2BKaCMKpM36Xc8L5Q01WZMrmDMheJnU9BYwK1TlBimlxFzHNZiKQioj9Q8J85oXNYUzVYvyGd9FVexqiyEQmRq9Eqqk0z5UXADKYqyYeYYs3+39KpQfXrC2SpK9k+XkfiWppYTLsfHWJNXjhbcgJivQTejJqv52yif7YANK9CJ8N2HUCW9JYOOz2069kdC4995kK
X-Exchange-RoutingPolicyChecked: YUKff2UZ9S/cRBm2ec4TXQ2YIztKzpS2DDAPImarOrUR3dnJVzqObRfKPkmRJjXRsxqlAytnvN9mEV8VPo+vGKq6lQTmzlwNPL7kWqtTG1RIfuqDbJoOpK2Y1UN5BWWFNgCl6sVX145I16l/BXgRcafRr+r5fVAke0Y4jLAf1+tif3qTbo4BTl8v8y59PwbyxKDFzG657c7rcNvo1+R+7xZsb5xPr0EfpVmJWZU83Rrlf3FsBXv4BgRcdcQMPMW8UPOxy9AVxbF0r4I3NHM2ePa3XqjMpJghTK0F2zj+KTGsdhsvGd0oGYFBnKCgKaHTEwaghF3DK80eJ16oddi6CQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:47:57.1872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d92c93-e3fa-4900-19ac-08dee6eb9dd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF831D4660D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1NyBTYWx0ZWRfXzRV/uBfkjTB2
 55lX3SkuazG2x9kN7DGAPyH91XdhOOTKZbJPH4LDfHH6OtK1Nm+7ruA/dAE8zcEGYpHtRZWHhDl
 KzIJox7WlXMZcuF9PH6FYvQg6YOQ5GI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1NyBTYWx0ZWRfX6KSnde1SHRBs
 ubAhD91xFbHfN+60nYwx3BBI/pwXgszwz0gVe41n9NBNsnOQJ2NDyqtw6weXfIed0DcjkEEfBcU
 bQbMfTjHHQLS5TVHdKZmTMeuuCWCHVA4I09bI2ZoMbspz5Ciso0iQNe/fBjOSSj6hy73YjquJOj
 tUSNX6fsK+aG0rWw9omL1Qr5EuSrYrlGCp/dtIjdZEzrryP3ioRY98yCO1pAMIzthsNhgvsRPwG
 JwL+LAkX0Or2kDIS2745Fmal7iNOM+zLGr5BxoCUOLdHHMKXmK+wjScja5bgSN6YZgNV42UTyFM
 ZiMnLaDz8vqp6qplgNjHetS2SE+2YroVrz5uEUfc/uZ2/GZA2xrC9mcmrYJOrNqglzO5gbkf2Ry
 w2MoGrlrq/9HU+rrfwHVcMGZQRjt3OBbZWFVe4wTR27WKirjh6uDiF5HjVYQQC7EfkJMoZmymTS
 kgJs7iC8Kb/YkE5ZBHQ==
X-Authority-Analysis: v=2.4 cv=N6wZ0W9B c=1 sm=1 tr=0 ts=6a5f0811 cx=c_pps
 a=u8Zh/y5cvmLMdp3U04oolg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IYZqSnRt4d5Z63W8hWlkPQP6SyxwyP6j
X-Proofpoint-ORIG-GUID: IYZqSnRt4d5Z63W8hWlkPQP6SyxwyP6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_224810_889067_4CD1FB7A 
X-CRM114-Status: GOOD (  15.53  )
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

Hi Stefano Radaelli,

On Sun, 12 Jul 2026 16:04:47 +0200, Stefano Radaelli wrote:
> Add support for Variscite VAR-SOM-AM62 and Symphony board
> 
> The series includes:
> - Device tree bindings documentation
> - SOM device tree with common peripherals
> - Symphony carrier board device tree with board-specific features
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
      commit: 8571d1e223a5d220aba7e323b4de36d7341ee37e
[2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
      commit: 5f865bbef8e5a91780064b847365d755845bc974
[3/3] arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board
      commit: 5fde9c21c671ff501523d55138b4f5eeb577b97e

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



