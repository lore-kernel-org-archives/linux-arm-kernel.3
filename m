Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15260D58CC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKxwU520RHL6cXa/bQNsnYlhDmv57pzaMrXU25jOgds=; b=ZIKghTfMFREOvApeCzoUW0gqEQ
	xz5BhiO4+0HJflUuUKudGCfwwHqcdi8wsLwzb8F88/MhppzSLPliaP/1JkWouUqz2dVSOjdNYqNsc
	POzYswMz54tXLX02jjPTDaogK1erHI3A6hRr59dvcGcHO4OHga5WMKIS3my1L2Y+EA4Qs6DfqVgsM
	epJ4Kx6MqThepDNNPrGlFd0NcyVVPvzGwxoNj+5ZpMef/Ne4Uwnbu94FUY/AT87iuqfJ1FiIn98Pw
	fSsk2UmqGOM0msLNrkRGT51dhV8jmv1Ja4aZC2ONrnorWofTd/eGjE6km7tjqWMtTQR2q9UpZzJni
	lqnACWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514I-00000001Omg-3SJS;
	Tue, 24 Mar 2026 12:41:10 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514F-00000001OmC-2Nyp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:08 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lom1rU2dsnHTjWK8FKjEZ7Uud/9IU78uuQOHQzxrCNEqcOgh1S6qDnS6FmIQsy8bO31x9PJBmAKKKiAj8tBL71JwYfe3vzC8tZfz6p8Z2IABaK7HqhwzbMZaarwXC3t63Zt1u01lSnjSBhF+joJE+VNkKoVVGqrUuFkdS6+vD90lisGxBdsplSaQkcPKbAL+dFTMVVekH1HItqtgDs0qvZOH7+u0JdAAocrKWro0Xceh3Ma5XI6pqPddQ9vwVzuG26MkKzlzk0Wqry6dm7LJGvitHrpj8QZgQ2MKNUx6kdn12xW/RuT1FxMluc8MM0vDUvXYPvJRoOnRUTuyEjTrZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKxwU520RHL6cXa/bQNsnYlhDmv57pzaMrXU25jOgds=;
 b=mL2ehk8V6avjyKTQwWN8radOv3JPUozQBpcLCSz9K/Q+/GkreMhJjO0iOb5IGDBxbm+MunZQt1dXXQ1ciXzwCySWbUnUbXseox2zfsGjXLsj3MbqzcLcLsFpUax6HT85+bzz2EJZRZ8q0YJ+cROC7ZUXTzX4e6IOHu1g0/8lhwyfuuoCOhoNadTSE84vY2Z5glyIK7lvs8T9PN7oZE0pXibGG5Wug7js8uVmKwJ/W+C7rkiW4uT+KYZDYaqeD+yXDESoEG5zpnkxCGH/KVKzJukAglmoloE1GQhjkbTupIYQsYbiA/SBrjzenGHwYHhEC0sV6TShaxOquxvf/CFvkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKxwU520RHL6cXa/bQNsnYlhDmv57pzaMrXU25jOgds=;
 b=WQSkzsbsQU+w5VY54OEjCX/Ck7sWcxJYGZt5l3gmOpZhox3LrYWYOhNOPpdeh6bVEpgiBi/5ujiGWHc6Cf3jHGO2oBRIkOiTtfAmNivmOcYeqv1JNUlB0iqPDPHoYc/EHxusuO8mpQJ6I6egO1eh100wEdma2Z00iT+vwG/Bqj4=
Received: from DB9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:10:1db::22)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Tue, 24 Mar
 2026 12:40:43 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::f4) by DB9PR06CA0017.outlook.office365.com
 (2603:10a6:10:1db::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:40:59 +0000
Received: from emails-5594358-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B960A80715;
	Tue, 24 Mar 2026 12:40:59 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:40:51 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyrwsIfZ4vyzZDMnwb9fdjt8q8OSPiQGk4GzGSzBlZqU+fl+JeYZzY2CoBlCqNHN5FgkNuHj4LA/kmrnfYK0gbx6sTWJx0KmrsaS7anC6YNef/dzPEdhS5plUvnCo/60PfaP2hUiRV70zpSukI8Xy3SZ6eqa1ySSqKiPP69jWAE0sIt6cblQsKGPnIVQy//LR2daoGYOJgXXaASoV1H0fLnzxIOE3OBOm6ABm2ZvAK9sSWFCoRDtLpbsaed5m/vC+dCpdWbbyXix/G6O1VrvKbUkl5rqg4SDOObiX5s4EmGqJRmhM8u8C8Ya2p5Gf/W3OW9p9olhHY/YJ1fWHLrmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKxwU520RHL6cXa/bQNsnYlhDmv57pzaMrXU25jOgds=;
 b=afR3VlutS9ck/vXjlIS3MDnzZ1F2gnaIF+otNfd8TOMFxTMlBxkITGeblZowpPuPV1RZbdPm0c8n8edDHWiyIxM+BTaFsaHeqaYqyWUjW3SGrlgYnpAklow0KTZqLmZcZ5Sj5mhUvtHqZ9TM0/uGPLrZaPwux1HRx8Sgx1MRkc82dKs5csXezyRhXQvIZkqlybplnXUsiXmnf+AeTLn+h6OhpSX/cBYx6TvwM0D4FX+75XEs6YnQlUOJnN4sEV4HIHDsxODwwGz4n8rbGjUv3xG89YUdbBpB88OCrADy7O0ex5I+uXOdO8p74AGU5KFYsb4fxqHNmTBUI7C1vyeuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKxwU520RHL6cXa/bQNsnYlhDmv57pzaMrXU25jOgds=;
 b=WQSkzsbsQU+w5VY54OEjCX/Ck7sWcxJYGZt5l3gmOpZhox3LrYWYOhNOPpdeh6bVEpgiBi/5ujiGWHc6Cf3jHGO2oBRIkOiTtfAmNivmOcYeqv1JNUlB0iqPDPHoYc/EHxusuO8mpQJ6I6egO1eh100wEdma2Z00iT+vwG/Bqj4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:40:38 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:40:28 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Carlos
 Song <carlos.song@nxp.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>, Rabeeh Khoury
	<rabeeh@solid-run.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Thread-Topic: [PATCH v5 04/10] arm64: dts: lx2160a: rename pinmux nodes for
 readability
Thread-Index: AQHcs6rJIV8a+JSJwEOfuuvDAS71FrWx5NwAgAEYdwCAAVcyAIAJWwQA
Date: Tue, 24 Mar 2026 12:40:28 +0000
Message-ID: <388225c0-ee26-45f2-8441-27843b1ef747@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
 <20260314-lx2160-sd-cd-v5-4-83de721585e3@solid-run.com>
 <abiiDr4bLYIufKwp@lizhi-Precision-Tower-5810>
 <52a09ab1-ab55-43f9-91fc-c35f6a0d4730@solid-run.com>
 <abqtOFohYjf0q6P1@lizhi-Precision-Tower-5810>
In-Reply-To: <abqtOFohYjf0q6P1@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|AM8PR04MB7905:EE_|DB1PEPF00039230:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d200378-88a2-4eaf-fb25-08de89a29a39
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: OpGcpcNMqkzfL7TMVgHRdGIIN9j7iDGjN3rnjJp60V1JakPTwDuSabqVRiMeQJ2P6Oc5kaGLqqyP+/BovSC/9Jw7IYmatOPxmceoptDQNgahmctPVPihv3y6DWIZqU52I4/rmdS2gl9C6bKbyi+u3p+W7LdZCNE1sXDEKmx5y9a840jNF3SZX2FTdQdqr9ISD8eJ8kRI7s22StTxYUUqpJj5IBel3672gcBXBXrof0RporhscDFn9+WAwZTwQ8a54TZPZieD9gsV560xvRFTBPm1EvgIzpjCP1e4t9qPIEsS8Dnqe08atoIcZkEUMYc1wy+F2+hX1cZiEX4oZhxcfehvH9jHHanGYQ9mY/FS15ejEtiuF1QvcBVZ629J4gTFa9sk4mrM0SUtlwyJiU/anEY0hQvl+/wpnXlyN1AIJF+N5o9nIvKx496naHbo5bWog4hyzrrmheOBY0Ij22tPL6zsSKZwN7ki3Q4jHEQXTuAqdCO+Q0Rwwj/1j4Q/7YiGJ6wlFlE4qe+TihAlweRSkHouRTGo079Rkwv75XsFj+DPIcU1xSLM5ajOSC/snzjKB1lCUv4bGIMjHSHpwPc6xptH48aOofAxDk1kH5KE35ILIkQmEu398ke1V46d/C+2vlpc53Mz7bkTZfd1hOH84CaeIzrK9Lm+Bf97gNak8diqMAxKWWCDZ/6jyVscu1eGtqXdqjZ6yKkFidgjTOeGBqg0hrdTYsAWVaQ3Ff8ZGAnWRaC+rV3jQby0hu6w1gd93RvGnFGlnCrn56vgST7W97G2gh9F+3RAwmzJVdfaCSU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <669E6A027DA61948968BF91AD03453C1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KroG0SKx9kUy40GPAuYMwJf05jZTKzSOwIRtR8ceDusSUuRdvt/qSrj7SvmGZrrs4ci5Csiw/TVNADPybY56HnhNvDeCGrq1pp/kMcwm9FGe42/XieRYLk57KAfFqGEM4TLWIx+pl5Vz8RzKDXDE1ymin3ZXo0pc38JtDV1HAlsu7IsQmwYsVhCT8i2DCWCO/1WIYEd2khInp6D7LnUvnKpx16Ir7PEqntQWrYqS8q9nijRXxZ7lDYu77D7kOTUMY8lOiLKRslS8ZBwYfjR/AbGFHAUR3YjPCHrYGR0qJVNeCw2GrW21ci7ABJFvzzsr647reONDPs5bVi4oucomcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d54febebfbe94154b7cd39968d6bcfad:solidrun,office365_emails,sent,inline:f6f1bdf983f706161a555fed21aa9639
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 27d37467-df6a-4f84-e693-08de89a28755
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|35042699022|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZELJuEmlS6bTseZpIWDkNcdYhY2LG1+9s5ggMemVNhycBkWyMb/Wl0nDQolUrdo+5uMC0bP+7lpYiw/RvewcOWADhoahT0sSPLn5q+cE4lAslNCGbte8xfvt5S0G3J/lAqj4noMN1y6U/YZ03z22CkU5gnQLU91EpkCASE4g/MkXZQe156KgCzdJRlVRPg2D+uuxRbe8v/CjrS/iKjy9amKZAJ3l1RmvhvUyEgmmHSXzr5SV+iu7A9ZuTWIJ3FJnCyUxO308NVcWtZAs+ljD3IRnC6WDqnB2k1UFNWr07WKI2doHzwvgPYWSam2Zcoj//2GpBIzLHz4Fm5Xxg1h8oWLCJfbhHd6nAWH4EJ8AFPRvvTTNxQnonVUsIPaaJBysaD64rHhUd3oL24im+2rDh64/MpQxmUG8KryT9ca/PAKnTh9COH92VmDGe9HbtCJ+IgjI96nMOVRzBvH2loUiOFBqn9Y/JN3KHKBdypy36JbvegoZLCxQSPgY7rc3RuZVz25y6J4OK3JopWMOva69uSWyv2c5qy5GBsVGsET+kI8uaCNZOLdIe3pW2tjGXrT4l6PsCKe+FdJG0Qx0xpasKJwhyrCLnZE83na6/Z+YK1VNyFWQ/lWNt40cRFl43HvFiUwOnkzgru2EE6WlMfJo2hfaVV9Lqm/26hSD/p1s3lsgaicjBKnJO6ZRusVlY++Kt3+r6WXXZcBKDxWxsj6RnO1dhcHabCKQOi+hx9fLHBA7sDCTxbaXWbKS5wThxhooZI/dHbJlUhiYFZJ3UGqb3Q==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(35042699022)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z/ICOidTWJ3gAYIksmSpkuhi4bATNpDsSXP4nZR2ZiVWrd6espTB3JI9kbIjIbum1bJzWFK2i9vmB6kRHx+zQ1SxI5XlDWdzBJ5G6hX8XXDi1fGwvxHVsOYlRBWMBDJohs2HlMLC8v1+xvyuA5t8OOF7hfTsN0tGyEgs31pH7nJF1H9UquzBVxIy8MWN1qOuG3z5MHwnYhuCPoZZzbwbTuHKCArmt5AxGpb3JyaBmHOLG0NZsKqGXK17ibRbsZu26ORPK8K8KWUoGW2eqm7UDs+zMqinHDSp1+YA+G0+LYiG7Via5POBOy/9sqaJSegsgoz7HWs3n9UW9bU8Sh0pNP0zWd53qu15DhFSfk79xh81MEb8qEUxf0m+zOybt0efxaDFC6qzFoJmUL6sCa4vrN6RIJ9NGW2ZjYHMaOZWOMr0eLG6rDqjBNd6hD3jnFVm
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:40:59.7977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d200378-88a2-4eaf-fb25-08de89a29a39
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054107_798747_3B853CFB 
X-CRM114-Status: GOOD (  14.99  )
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

QW0gMTguMDMuMjYgdW0gMTQ6NDggc2NocmllYiBGcmFuayBMaToNCg0KPiBPbiBUdWUsIE1hciAx
NywgMjAyNiBhdCAwNToyMDoyMFBNICswMDAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+IEhpIEZy
YW5rLA0KPj4NCj4+IE9uIDMvMTcvMjYgMDI6MzYsIEZyYW5rIExpIHdyb3RlOg0KPj4+IE9uIFNh
dCwgTWFyIDE0LCAyMDI2IGF0IDAxOjA1OjE0UE0gKzAxMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0K
Pj4+PiBMWDIxNjBBIHBpbm11eCBpcyBkb25lIGluIGdyb3VwcyBieSB2YXJpb3VzIGxlbmd0aCBi
aXRmaWVsZHMgd2l0aGluDQo+Pj4+IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzLg0KPj4+Pg0KPj4+
PiBFYWNoIGdyb3VwIG9mIHBpbnMgaXMgbmFtZWQgaW4gdGhlIHJlZmVyZW5jZSBtYW51YWwgYWZ0
ZXIgYSBwcmltYXJ5DQo+Pj4+IGZ1bmN0aW9uIHVzaW5nIHNvYy1zcGVjaWZpYyBuYW1pbmcsIGUu
Zy4gSUlDMSAoZm9yIGkyYzApLg0KPj4+Pg0KPj4+PiBIYXJkd2FyZSBibG9jayBudW1iZXJpbmcg
c3RhcnRzIGZyb20gemVybyBpbiBkZXZpY2UtdHJlZSBidXQgb25lIGluIHRoZQ0KPj4+PiByZWZl
cmVuY2UgbWFudWFsLg0KPj4+Pg0KPj4+PiBSZW5hbWUgdGhlIGFscmVhZHkgZGVmaW5lZCBwaW5t
dXggbm9kZXMgb3JpZ2luYWxseSBhZGRlZCBmb3IgY2hhbmdpbmcNCj4+Pj4gaTJjIHBpbnMgYmV0
d2VlbiBpMmMgYW5kIGdwaW8gZnVuY3Rpb25zIHJlZmxlY3RpbmcgdGhlIHJlZmVyZW5jZSBtYW51
YWwNCj4+Pj4gbmFtZSAoSUlDKSBpbiB0aGUgbm9kZSBuYW1lLCBhbmQgdGhlIGRldmljZS10cmVl
IG5hbWUgKGkyYywgZ3BpbykgaW4gdGhlDQo+Pj4+IGxhYmVsLg0KPj4+Pg0KPj4+PiBUaGlzIG1h
a2VzIGl0IG1vcmUgY2xlYXIgdG8gZnV0dXJlIGRldmVsb3BlcnMgdGhhdCB0aGVzZSBub2RlcyBk
byBpbg0KPiBOZWVkbid0ICd0aGlzJyBqdXN0DQo+DQo+IE1ha2UgaXQgbW9yZSAuLi4NCk9rYXks
IEknbGwgcmVwaHJhc2UgaXQuICJNYWtlIGl0IG1vcmUgY2xlYXIiIHdhcyBhbiBpbnRlbmRlZCBy
ZXN1bHQgZnJvbSByZW5hbWluZywNCm5vdCB0aGUgYWN0aW9uIGl0c2VsZi4NCj4NCj4+Pj4gZmFj
dCBjb25maWd1cmUgYSBncm91cCBvZiBwaW5zLCBhbmQgaGVscHMgd2l0aCBjcm9zcy1yZWZlcmVu
Y2luZw0KPj4+PiBkb2N1bWVudGF0aW9uLg0KPj4+Pg0KPj4+PiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZC4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDhhMTM2NWM3YmJjMSAoImFybTY0OiBkdHM6
IGx4MjE2MGE6IGFkZCBwaW5tdXggYW5kIGkyYyBncGlvIHRvIHN1cHBvcnQgYnVzIHJlY292ZXJ5
IikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIx
NjBhLmR0c2kgfCA2NCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpDQo+Pj4+IGlu
ZGV4IDQxYzliNDI1M2Y0YTUuLjI4NTAwZTg4NzM5MDkgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kNCj4+Pj4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaQ0KPj4+PiBAQCAtNzUw
LDggKzc1MCw4IEBAIGkyYzA6IGkyY0AyMDAwMDAwIHsNCj4+Pj4gICAJCQljbG9ja3MgPSA8JmNs
b2NrZ2VuIFFPUklRX0NMS19QTEFURk9STV9QTEwNCj4+Pj4gICAJCQkJCSAgICBRT1JJUV9DTEtf
UExMX0RJVigxNik+Ow0KPj4+PiAgIAkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJncGlv
IjsNCj4+Pj4gLQkJCXBpbmN0cmwtMCA9IDwmaTJjMF9zY2w+Ow0KPj4+PiAtCQkJcGluY3RybC0x
ID0gPCZpMmMwX3NjbF9ncGlvPjsNCj4+Pj4gKwkJCXBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsN
Cj4+Pj4gKwkJCXBpbmN0cmwtMSA9IDwmZ3BpbzBfM18yX3BpbnM+Ow0KPj4+IHdoeSBuZWVkIGNo
YW5nZSBsYWJlbCBuYW1lIGhlcmUuIEl0IHNob3VsZCBzY2wsIHdoeSBuZWVkIGNoYW5nZSB0byBw
aW5zPw0KPj4gUmVhZGFiaWxpdHkuDQo+Pg0KPj4gSXQgc2hvdWxkIGRlZmluaXRlbHkgbm90IGJl
IGNhbGxlZCAic2NsIiBwcmVjaXNlbHkgYmVjYXVzZSB0aGUgbm9kZQ0KPj4gcHJldmlvdXNseSBs
YWJlbGVkIGkyYzBfc2NsIGFjdHVhbGx5IGNvbmZpZ3VyZXMgYm90aCBzZGEgYW5kIHNjbCB0b2dl
dGhlci4NCj4gVGhpcyBuZWVkIG1lbnRpb24gaW4gY29tbWl0IG1lc3NhZ2UgYWJvdXQgd2h5IHJl
bmFtZS4NCk9rYXkuDQo+DQo+IEZyYW5rDQo+PiBBbmQgcGxhaW4gIiZpMmMwIiBpcyBhbHJlYWR5
IHRha2VuLCBzbyBJIGFkZGVkIF9waW5zLg0KPj4NCj4+IEZvciB0aGUgZ3Bpb3MgSSBhbHNvIGNo
YW5nZWQgdGhlIGxhYmVsIGJlY2F1c2Ugd2UgYXJlIGluIFNvQyBkdHNpLA0KPj4gYW5kIGdwaW9z
IGFyZSBub3Qgc3BlY2lmaWMgdG8gc2RhIG9yIHNjbCBmdW5jdGlvbi4NCj4+DQo+PiBGdXJ0aGVy
IGluY2x1ZGluZyB0aGUgZ3BpbyBudW1iZXJzIGluIHRoZSBsYWJlbCBoZWxwcyBzcG90dGluZyBt
aXN0YWtlcy4NCj4+DQo+PiBUaGlzIHBhdGNoLXNldCBpcyBhIHN0b3J5IGV4cGxhaW5pbmcgY2hh
cHRlciBieSBjaGFwdGVyIHdoeSBpbml0aWFsbHkNCj4+IEkganVzdCByZXZlcnRlZCB0aGUgb3Jp
Z2luYWwgY29tbWl0Lg0KPj4NCj4+IHNpbmNlcmVseQ0KPj4gSm9zdWEgTWF5ZXI=

