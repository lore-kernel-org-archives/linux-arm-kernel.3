Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6512E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DHs9weh/tEGrEKZ21RBgZCK5RPIo2hbixaCUXvIPuyM=; b=yU5uUcNrhP6zWm
	DWGx59/aOHidOnpyww5gI6dUvydfE5pnsPiV5c5LMmzjAJLbf4e4P2FqXz1ABaLf4GV9UC0xB9vKM
	xAGRzj+way3kEVcHQ1w4QU2w+Ptyg9qIGvoAbRfBlTDeh9tvSx/PwpTKETtBvB3cNuL4QmxZmbEAT
	RVA9l8P1oTn3R+pd+Ir/vol9SUES04vqHJP13J7Evx4HBnqTrmAcvYfPp6tjO7tvtHLJOYh/+o8Le
	WbO/fMqkAS6UsMlgBFSRkIg2wJM3zNa7hBgiuodzIET4c9CEXFxD2McMkczWXd4hSLNx8gkJpzlCF
	rT3/Qu+C5VhXI3gd7iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vswTT-0000000AtZH-1Un5;
	Thu, 19 Feb 2026 05:21:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vswTQ-0000000AtYy-11tP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 05:21:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J3NlR44070805
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 05:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DHs9weh/tEGrEKZ21RBgZC
	K5RPIo2hbixaCUXvIPuyM=; b=P5iP7EbENANiyT4seQFuPE37atvJ7Tj49g88W4
	0F8FCF3rDTEE50pF6dYqRc15zeg9d23ZoxPrQnSwJGKrMv4QCe9E/l7aTZB2hlrg
	k8w39a27lutoWpzrA0V1Wd+9k66L8qOrdTERI12KE8bZfH7PU6sEgSBf4mPl5eKZ
	XtucFOGFMqxc/X9qbkdWXEsE0ezUgL2QjNmDsNTp9klzIBG+vutsKBVMHye0XxxD
	1iYiqXD4BynP0f2fX4TAZzf7RW6zLqQzp/KB0xBdYx7VJsPKlF3ybUhuepo8lHNC
	M068f/sfxKt4nhk58+JodfyulOEgRd5Azd4xJyjbBPba/0gw==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy06gr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 05:21:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzTGCZSd3O+ws8/sxNi2cCMi6dNectPtV5S78m3zbcu79XNcwkgEJ8c0vRztl0WswEBT8ZZzfkXzKrhY17QT+rMnN94o8251f0uYamAVXynojqWttckIoiavQPfa1aqz524vyHTxTPbJ9BtuMDNaftmzZonHq+gs9XRa5JNN7VYHCubqxJbSgMKxSyV6m3DfjZz8nGRIZKK1HrZCkUNAejSvKrdrlyJmvKAYtYVMDyZSAeeTK8oscycb9ZlTiobzQIHC9Nz8SLcRlnyC0xjm5jKqoIQauJxbMAfk3oVO2Ran9pxjl4xXFhwP299ZIwQ5/pSr40bDWy1EAYHQ7Vnn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHs9weh/tEGrEKZ21RBgZCK5RPIo2hbixaCUXvIPuyM=;
 b=LS3BtwkQFNvldc4jRmW16zEcRn0Te9KOG51+SP7D8qs3FosjyvXpsVDnPkUPJ8ohxhum8pudVTOcjCQKY8PQ7lRgu81yjilJwCv+xSVh7zSDlBvddrZ/hz15Nw+EMGGHIrYhItfxsdNhYV4cL9gCRnRcM4FwKR9kDDT+he03QjmTdo6o1G6hggS5jFTVoA/1um3nsh13/b8jQ+AlvPmNljQ7oKiSFBFjsCLTjJ0RRg51Xxkix2yPKORsxNfcrsvEO9JMO84mGmC4OTkdHbTywidHHoh01YGBfOCeuoZgMODonY3TwXyY2AuDOO+wZ1zXgPHj33U6zm392aFFb7PPsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB6548.namprd02.prod.outlook.com (2603:10b6:208:1c5::10)
 by DM4PR02MB8910.namprd02.prod.outlook.com (2603:10b6:8:bb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Thu, 19 Feb 2026 05:21:02 +0000
Received: from BL0PR02MB6548.namprd02.prod.outlook.com
 ([fe80::9806:d63e:66ac:501e]) by BL0PR02MB6548.namprd02.prod.outlook.com
 ([fe80::9806:d63e:66ac:501e%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 05:21:02 +0000
From: Manoj Ekbote <mekbote@qti.qualcomm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: FEAT_CMOW
Thread-Topic: FEAT_CMOW
Thread-Index: AdyhXuhPa68A0Lk/QPGwMNo0AxVtZQ==
Date: Thu, 19 Feb 2026 05:21:02 +0000
Message-ID: <BL0PR02MB654847527978D284F651C7BD8D6BA@BL0PR02MB6548.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB6548:EE_|DM4PR02MB8910:EE_
x-ms-office365-filtering-correlation-id: 3badd3ee-4456-49c9-0065-08de6f76ac6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?GSwbVPyUs8uPvKdr8XgBWgkme+3u76F1B3fgtIvQp/6e7pCfibDalnz1pgfN?=
 =?us-ascii?Q?mhVDMkbXgxJEauE0PNLttzWmIURYBtAVjLPdQu4sXCAU7fL1A/zYoZFnq2IO?=
 =?us-ascii?Q?PHTruajMMIWMYOwq6/lWolXk/Jxv+/vhQOGtrLcAcUVOEpII1luDbd7qEDhE?=
 =?us-ascii?Q?Rhqm6PA0b3TdIuHLRZ3pDsel6Z4EjVUneszaq4XjIXlw/Mi39t6dlGY/tzug?=
 =?us-ascii?Q?CRQdfpLcrb2Fdq3nZ4T3rsRRquQ1qf/C0k3q5DTHBcii0QyPK/xhZq2IhNBX?=
 =?us-ascii?Q?hGhxGNBAyvur3gOT/XzrI6jfzgYfD9+J1IMQjdTgApDufhzsm9/j4ry4hu6E?=
 =?us-ascii?Q?W730PSklTdSrSyUa0C495soRRIcaYC+9X8oDaWG7Xc5hUpV6B3/jsQ3uPR1i?=
 =?us-ascii?Q?8vSd8jeCwLnkrDfFnjQj+T4zGVKVX5sXq+iCyaZY5WB+gaE75Vbt06NlSiNI?=
 =?us-ascii?Q?EwUNYiYVJNCNHuBSi9aEUgofKi+uP1pNjyFrRazhkY45gPhCeEihzs+ryhl7?=
 =?us-ascii?Q?Pog1EDlOC4yXZLRE1gesPAbE2RQlbSI86lgZ2GkARrrc0N/fes6yUkP44r0D?=
 =?us-ascii?Q?Yq9uuOYsqTOPB2DXUIFxtTvb3MPIpemo+uOCJ8ohpiG4Da+BMiA7Gxt54+CH?=
 =?us-ascii?Q?IR+dlj/lQPLygSwDQQ3mvcYf48jTC6dKMBb4GA3Qty5G4d5i7ypMy9ZXNUHw?=
 =?us-ascii?Q?fdK9wkJUDfR1jF0ND3Z1lzrkyHdhcqbjk2PDVYEGL5K1QN4QsHA1U13wAYJk?=
 =?us-ascii?Q?ge+SHdnmfB5ear1bNGw1EVHQPWoVmWrgQ4GcuQVGwl055lx198TIfQZGL1OA?=
 =?us-ascii?Q?uVAfw8ctVYOTD7Rj/nVtMdGbgkk4X+qGXNvdQ1UE3SX+OmgpB0ddEgkWO3xX?=
 =?us-ascii?Q?+lragNDhSuTmDIDOFXh0Yaoi5cY7cx7HyIsXx/xxWwKlodAIsIGThOrQOAhu?=
 =?us-ascii?Q?R7Ph9sOH3b5uIvxeN8gYbKsRWZVgW1wGge9W10JfdNDM2/bWQxLOiRW6h+9x?=
 =?us-ascii?Q?Adri+ht/j3iNXs38VCDyG+NtTE1b5Q5BMo2vntH8I+N/CxfmjoTlz7dtW1xG?=
 =?us-ascii?Q?MYDrYduL06DBFQor5j1esLA3P5kfo8ILMprEJYJZ/fk3mzGZJ14jNTLZYqC2?=
 =?us-ascii?Q?qlnT5pep6b/OR7v7DqrUtMKcz+bSgSE1EthuDHIGmC8VEsuWjLxNG5uRYHQB?=
 =?us-ascii?Q?CyT8q4sg6zUL3i/dr2cTCyFJn+wHJA+URPq8BYq772J0lZe4vlwHNKh4wGxH?=
 =?us-ascii?Q?HIL45jW/TXo0JeiYrHG4gsCV+EGkAPK9Xl81K9JPcCRbTm7D4HFpWSFLvBZa?=
 =?us-ascii?Q?W0dRLwipQJn9U0OYwEMTyVoFD/DdGedsJrIymFUbMXCubFH8cNKxnE++jBAZ?=
 =?us-ascii?Q?MIOyTYJSMCptzVoYd3AttCgjM6jdaxFZpO+IEe2byDT/4L0jG7QoFG6OTU8T?=
 =?us-ascii?Q?MK1L1Bi1OQpX0/gr84S0y1PGwdcb2UVd31RpLYjCTbxrjr5C52iQ9F3/4hDX?=
 =?us-ascii?Q?BqcNOoWXAJW4Z2C5dhPP/JR4khtfX/cc+IFwtkWyf3C6cJ8A9XgnijYiTr7o?=
 =?us-ascii?Q?mca+XOpRsg+0zFo5birgVkSmYHoW1yXYs9x8iIfbfurszkfydRFli1eeBRRG?=
 =?us-ascii?Q?zYw39adjjKPv7Kdaz/sqwWY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB6548.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XsyVCAEdcrMByGiYoPdulzQkMtXSXjR3OWa347SPHLUReMXHecLwRYi7caFm?=
 =?us-ascii?Q?AISPdFn0Md9IVcgTd2uIRXYCF2RQiT8WzYFcEkdkB8jgiTMhEWnQMnuM2PRs?=
 =?us-ascii?Q?LsJMotGugAnXmqb2RY/7hnb3strZ+eZWqqfiSK0aGAFEcAZb+a8+vf+7kk20?=
 =?us-ascii?Q?wYrGADYP44w6BWNITGjTucFD51iAZPnVYRTdZdbOc8A+G/TCqaKqGacb7xna?=
 =?us-ascii?Q?ggWeH6xZ6WDPrSPWxtl3C2aSCpvpZ+sJYF+AoEv7aNkKuMJSQ0pXd/QXJjtg?=
 =?us-ascii?Q?9QfCBj/+V9UEyooBy8LWqmftAptYFfjFqxyWsFBX3dc5DWrHEBiispfyEKEM?=
 =?us-ascii?Q?PhGxLeeCDUlgIDVqYUawPRsJi3AT32vR+1EZtKkGsBL1yKaXmJTc30NkpA3c?=
 =?us-ascii?Q?CHAW7kQUD23TaJRWW6+6dZ4hls/WKQ9FO8Njjpes6qW1umKb/GdRiTp06QRf?=
 =?us-ascii?Q?xm5Fnw7pp7dS3kSAgDc9WDlrjy3XFlzPQGqDRI2GGNsMTJ9oCnVoVWBcGiYu?=
 =?us-ascii?Q?cWLSg2ViNzkbkNwQinpIeOE6cGhGDLRIwQrFK/DDE3RlnnSf5AX6JsppK75V?=
 =?us-ascii?Q?m5qA+hT6GxNzfxChPOXCLIU20oYFSyzVKxGEC68Ot9zQtQvA5zBAfgFqVU8c?=
 =?us-ascii?Q?5vy1f/YaQ2nlEB0zJNzV/02yxd6DrFiTmDQVV+/uYH9oKb35w0y6YqUH0CMx?=
 =?us-ascii?Q?oxLQwO4FZOIR52yiCZ+hGYHpqXMijvToth1LK2aFXCOSLVdHv6BA89zxPFMT?=
 =?us-ascii?Q?SUoV/gQpV/CZN968Z7ZIWAgXF+gGjWZmkY39VsdjUYm45wdhh7cNd/ruknof?=
 =?us-ascii?Q?fcIkmmyosTRt9Tf54oXY0x4ZfDbZoYKS6Eu9hkFAEh7QfNY+YdAKoN4/Yq8g?=
 =?us-ascii?Q?9jtSLrjMYZKJsHGnuNhK34Iiqm/UBMtGgp783648Saxf/8MhNkYCUuNqyUby?=
 =?us-ascii?Q?TSZhw4HX9kpDeS36iQRoTKeWDmVC9jcYFNAz3vjy+7qFrY7KSr8wbS84Yh/P?=
 =?us-ascii?Q?CaJUECPs7uxfMGdQGUeXhO+YQrYIuMYvj21sGZPGYqDICGsLrB9u072NeVxj?=
 =?us-ascii?Q?F0Q3eYY9xRV0Zk4nLRj5NjzJ585R6dzm4KVKzvnWS5cmRrUN2kd1Pp4nJTXZ?=
 =?us-ascii?Q?j0Hc+1lPuWcw4dmxL8DPoXw8AfVRA+0J41h9eZXr/LNi6fnhi5q/El6TG78+?=
 =?us-ascii?Q?UYKJnhS/HM8GYZSoa+NyP/0AOdHr/J8zpBtKH0FUL2QQfC3Am+XMCSt2Luea?=
 =?us-ascii?Q?TsK1WNljtRZaGjnWYbBpf6w2FMJPvL26pB3wKJkgx7P3s2vVP1GcdPeVw/8P?=
 =?us-ascii?Q?pb/eAr7cqHxHUXLZyr8ZyMBLXtaO9fxgFIRjyMHBopKNFkE0Ut1LY/diM+GS?=
 =?us-ascii?Q?tO1Pzgak1aET2KucCQyXDzMHBA5Ho/mZnUeyEBpZsn220sSHGemYbHAj+FXU?=
 =?us-ascii?Q?C7nL+6aW69NTMfaAmzUz72RgaBCwZYHjseIWB43jOe3I6Q6rtRV8Fj7sMxJu?=
 =?us-ascii?Q?EUxG4sDoTLVkbdBi1dvwIRDNUqriEC0muftGc7JP4gyNfQqrQ11qCPfR3F5S?=
 =?us-ascii?Q?kIAYaHMCbr6dG53WACm5R8ouS/Uw5K8YnVwwXjkNupcg48c0rVb0afo2Mdf5?=
 =?us-ascii?Q?NjY4Twd5m2EDKOeGvv94FT8Mr6o9o/jkfI7UErpA6Ko9t56tuuH3dDX4X80l?=
 =?us-ascii?Q?SNpYvjPHy94AS9VvBdA34mFu17n1X4foZ91oCKQ20VmDaH8TrDYGFZxROinM?=
 =?us-ascii?Q?zQh3L4ZFRw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kE53xGh5oXhPoWoQQlnjVR2RCB1WGpfZXDsCE5R7lEq0JB49cWB8h+Ofb1K3HoIk3X10GW/hAcvURb/II8ppfmvpkqqvDw/CiEQw5fSSwH+HdKFvZjkWOIJxFROF1o4fmeM0E1RnFSSkp+67yaVhzBThtb5bwI6XrVhR+pkaBFN4SILOJJHz4+XHxynKmfefT6bpS6SBw6NGLcY0my4OeV5a1rR6UzpSUNIczXLBGCtfkftGZOEO2hdR7aca6Y1wK46wfYXHaf2HVDVty9INZ41CxoSAOihrNqtgQRWpAXZjvbjj8a0E3XHXHsNUEtfuR9liY1ThdVyWRS8CVeI9bc9H0VtB6uueY8G/l0GZ8AqsA3Af0m20sEFsGLp62ivd/c6xN4mPHF4fdkOyMj+8eZZn1L8GZsGVz3eYXtyms7mwXe5p4w4vCTPtNuWWQz+ZAzlNFn1N5fCeQA91F8C9glO0HYwVyBMD18gQRXPXQUD5pYDY7cYqvcAAE/CF4s+LOnYmxI8DiTTSMyakv4Xe8M9TYK/wDSeJQORBIQtmzPoNptHY/V4pDcu0sJt0Ccs5klR+z0hT+M588Vh5RkmS4qNkTW4oG1QUksS1AbUYDUY8CrdGcPuBOM7MZMSqvHM7
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB6548.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3badd3ee-4456-49c9-0065-08de6f76ac6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 05:21:02.1915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49I0zmXvsYKH8333npuaJJnDgb99UujQ1agbZivlQJ68atDKCro8yZhLLSS9nGN2BzHq8ZLu4xIUY3Jqk/l7x/3A5rPPqjhBolr8v6tsCLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB8910
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA0NyBTYWx0ZWRfX5r66V5tdKaaa
 uFKZWQUNMZiq0dH/dKWhcuRD2e94Am6JF9GmknBAmGZv5n9Rw3Uowg9FfR5hamUq2FAYctUfeLc
 A17u1eDk/Z1e3nZFWuCdOHWhIfiF3K65nae8xx4jxpO9wUn6GRWBuuhY2rxtLlM7IJS7I0Q+ROC
 MdS2IHNK+SgDY1RBAdt2y7dUqX+HanWyLw8k/nOwZ/ZhlxngbZR9I5eMKoQH1UOTaEsTOdjlU6O
 +oC+Nqd7dOY+pz8yE8OlCN6TDQFgkWmQywh5OTMdNurqv8k2tJkVNmCX+h0+NhYD1giIuHGhe4r
 huke+TWGJK7FGEPzp4L3bwUJQEPtzuxypHILO77wMV10TeJizfMEK+3bwtj/F/Otg6z9qpLmbox
 hl8/tuHzupNICX7NbkL9/fVt5r5t7k9H/NhZMHESpyt3UFetb/Mg8ovuGiWpXsc5eRS/cH5qE4n
 X6FYO/qSnRO6WMhmUJA==
X-Proofpoint-GUID: SKLNXp9bJvh9DkCWOIf4uzu6P9I6KQhU
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=69969dc6 cx=c_pps
 a=vyniI6In/5XBr/U1JZq+ag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=PAUX7ejl7e2uLnwNU-YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: SKLNXp9bJvh9DkCWOIf4uzu6P9I6KQhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_01,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_212112_415069_5E89D934 
X-CRM114-Status: UNSURE (   9.91  )
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

Hi,

While looking at the mainline v6.18.6 sources, I noticed that FEAT_CMOW doe=
s not appear in the arm64 CPU capability table (arch/arm64/kernel/cpufeatur=
e.c). Since CMOW is a mandatory architectural feature starting in Arm v8.8,=
 I expected to see it in the cpufeature framework.
How is the cpu feature list typically updated for architectural extensions =
like this?
Is it done only when the kernel needs to make use of the feature, or is the=
re a process to actively add all mandatory architecture features?

Thanks

