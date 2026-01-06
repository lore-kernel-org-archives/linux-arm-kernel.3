Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4CCDC19C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFOBvHH904lt2xQBUYJGYUiH/ZRpj8H0ew9s6n+vHcs=; b=wS8E0dPC7UjXIxPoJbt1hJgzGm
	KcQQ8WjDfJ2Ig7qvyyZ9qdRatNM5Jd46i6jxrHWskSzLdq5ctINXNf0Co8kBSJNFdrNY726ZS8rRi
	JM99EPRanrlIipZws/MUvOJd3io8YZhPlxC9gcJAXcQxXd+Tu1dGvQS4cHwq8Xu73O7kURIsnG4+z
	QDuzd9yHnItl5mddgQpg96m1lnHTeTL51Z0s3RiBI3nmzfcrwt/3FDjP+LpyU3Im1CAjcc4WDzPuB
	t2nzPDQ+oSSc1w57KAuPMvIOspAmUAbVEXyMMY8xWUT0gfF5W76ktyC4UMeTXzQc3oOINo/MldvG4
	+Upi+QEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd71b-0000000D5Ph-1LyP;
	Tue, 06 Jan 2026 13:23:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd71Y-0000000D5OR-2FNx;
	Tue, 06 Jan 2026 13:23:01 +0000
X-UUID: d07709d8eb0211f08b17dd397dc63300-20260106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TFOBvHH904lt2xQBUYJGYUiH/ZRpj8H0ew9s6n+vHcs=;
	b=J3+APvNbNVuEQU++MOXIpS+l8feX75D1TJDteDI21nVApZS/SWx5FbCd4x2ry3qkg4JaLwhcoUXnOHBjRdFt3+UJsw9dLY//NPcvjgI3Eukm/Qz5dMBEnJXtXswWMvRdIx3x9fN2PTGcsBxOzUad27isuSQcg9iBaeyNmg8EN+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:c51e88d7-4fdb-4a76-8370-2605c52ea71c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:bc378a03-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d07709d8eb0211f08b17dd397dc63300-20260106
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 658076801; Tue, 06 Jan 2026 06:22:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:22:54 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 21:22:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+fvLP65NK2huaavXO9PBP7RaAEUBmKNozAHjxSaNSbsMde+nMxcFhalVmmYr6xv0z1f9C7ST7iUGH+YWyGWz80RTr3Eguq8XdJ3h15IJP3SYnJcl/ZHP3dSbtIjhrdD111wBk8J8Q6fj08sgwWWb81nIzHBM7puBV6OcTmzxa+HWQN4lUML2XBsyPn/724DjjTxOXdTdtWOvOVeOZK0yHlC4BEa7yrtUyKwkxvXFnlgSDgKFpdz9MYwp9/+6iHHDS5ShG2jW+HAhJ59lNrL4BmZfkt0SfJ/g+VBdw46gjFmPyqzdfZkP18YuAAp7mD66Jka5naAxE9byPZhw/hrbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFOBvHH904lt2xQBUYJGYUiH/ZRpj8H0ew9s6n+vHcs=;
 b=E/u2J07zzsQlP+FPmGmtQqrX0OQbwB8B72NvwzvZnGo/CrVkBlFpxm+GPEX6YJyMNXBisksB9ZBf4D3ydemQ2m42v28mG4/33bEu71u6oRfZkMTPOk1UJQqghFOSCzk5UouCD4/gdbSTSrMTPwnxfMd8vfHOPDS61KMw/ourWErrCPDbv+STqqdBwah8EFnquSL0BUoecotqoPgANpMd276D+nmmhqBFf5CIQNCL8kD9YGiQc+9JN6jClNH2+LrZxkB6blpzvo8YFEH92JillXM2ujZuDIPzhmAKtz798ysVUUUEjrFJat4YHjBM+Hv7To3DKVxT1iUI8FapsZw0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFOBvHH904lt2xQBUYJGYUiH/ZRpj8H0ew9s6n+vHcs=;
 b=DZHrOih24XnD491f9AEhTYFuMD6f4YWz2QDyUp+oWTnkLDmorvOXii7zduIfyzerYdw3SILl8XsoqiA2WEdeZRy9vaiZgnrSZ3vizgS5z/iJBr3mtiouQjbZy/M4Yf7YhjCkvoCpR3znjkJxXTWNwg0Sy8kR7j03xyikfTt1VHk=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by SG2PR03MB6826.apcprd03.prod.outlook.com (2603:1096:4:1d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 13:22:51 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 13:22:50 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
	<Chunfeng.Yun@mediatek.com>, "kishon@kernel.org" <kishon@kernel.org>,
	"James.Bottomley@hansenpartnership.com"
	<James.Bottomley@hansenpartnership.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "avri.altman@wdc.com"
	<avri.altman@wdc.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH v4 09/25] scsi: ufs: mediatek: Rework the crypt-boost
 stuff
Thread-Topic: [PATCH v4 09/25] scsi: ufs: mediatek: Rework the crypt-boost
 stuff
Thread-Index: AQHccB3w0gH2KcfnIkajzkZXBJIOR7UwWXgAgBL6VwCAAesQgA==
Date: Tue, 6 Jan 2026 13:22:50 +0000
Message-ID: <b8e41f9ecf1231f41f2923099341e4e4c580578b.camel@mediatek.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
	 <20251218-mt8196-ufs-v4-9-ddec7a369dd2@collabora.com>
	 <a12f7ffe8448d205a7318219ea7a18f0f722727f.camel@mediatek.com>
	 <5038393.GXAFRqVoOG@workhorse>
In-Reply-To: <5038393.GXAFRqVoOG@workhorse>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|SG2PR03MB6826:EE_
x-ms-office365-filtering-correlation-id: c742ea14-bd5c-4a96-ad96-08de4d26b0fd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eVYrR2dZRi9LWHNjMUZVMnBFY0Qrd09xWjgvN0FieTE0NW50ODNraS9rdVp2?=
 =?utf-8?B?UVlTYzFJYkh2ODh4SFNwYVFRUjdyQnhQTXVUZzFNK0Y1eVFKL09yUHpId2o1?=
 =?utf-8?B?QjNVZVNaT254ZWxXQmNjdHNJZjJYQ1I4dDMwMUM0Wmh2T013a2I3dWM3bEV2?=
 =?utf-8?B?V3dEWXk0bm41c3pYVWFmWGtac2ZueFR5SUZRWXUxSzRoQitkQStYVXJBcVpK?=
 =?utf-8?B?RlBjSHJMRmhUWUhDTnZkcGJzRkZhRTFuRXBiMVlvS3ZhRFRPbkJ1b3ZGZVpo?=
 =?utf-8?B?RDFZRVkrQ1M2bHNXYjMxcFZYZTFXOVhmeUpvbWlsSTVnSndRWE9OTEErZWZs?=
 =?utf-8?B?TUlrMGxKN1FQTmN5REkyaDYrczdJZnNvSHVwZ2VueE80bTVsWmJUeGwyTzFY?=
 =?utf-8?B?bGJ6YlBCaTE2c0xhNUdUU0VXd2RiSDBCRWovYUwvTUhtZ0NUSEVqaEJmTmg3?=
 =?utf-8?B?VkkrNzFKTlg4bmUvK0dWc1YyMWw3RWk3SFdwcmF6SlNhVjc1SWk0bzc0eG5v?=
 =?utf-8?B?amN0UTRMUVJ3Z2U4V1p6Zi9oV3B0M1JUQVljV0ZVcS9YMWgzVm9LQS8wVE16?=
 =?utf-8?B?L2hlQ3Y4dFY0ZnFoaHhVUHZLcXk3bU5pa2RLemoxRzF2UWlYY2FuOFU2VWwv?=
 =?utf-8?B?aTUzSkIrZ2tVRllFbXpGM1d6dGhLbk5NV29tU21lKzlzN2h1TTdBNDBBL3Ns?=
 =?utf-8?B?cjhNWjhOOWNLcEg4d3VpVXJyc3NHYkYyUnFmUmhzVktFa1IxSkJlNEJ1NmY5?=
 =?utf-8?B?VkUxbmVsYVp1V3JDamo3Y0srRXZyM3lTL0UzQVhtcHlaMTYyOFZzbGdvWXkw?=
 =?utf-8?B?ZkI0bkE3a2tzN2pMZ2l1WGdsd2NPZ2pvL2dvekEva3JHYzZEcnExYVBnUU1R?=
 =?utf-8?B?SWNmVFVwc2NvOC9EcjE5b2N1Q0pjaFpZQ1FjRHZYZmJHbnNjdDJjVTc1OGhM?=
 =?utf-8?B?b3Q2aDFXNTBvNWx3OVB1MC9Ic2IzTXd1b2Z4bW4zd0JiaFhiSUhmeFVCMVFz?=
 =?utf-8?B?VmRPQURURGlpeHdUamxxSmZwVlJKQzJlR3dEcTVGY1haUGZCTGp0dTRnSG5q?=
 =?utf-8?B?VTNwT0VlUVRsMmlTU1M5b3JoUnZraGJ0Rk16SXBtY1BqK01YVkJPWFBaOXNr?=
 =?utf-8?B?dFAzVWsrTXVvZ3J3bjNGNVJoT1YwTGxyelN4eGJYVnVOL2JEVjY2TUdUaVNW?=
 =?utf-8?B?dlg1NlNMTjBHVVdmL1FqR25Cc1NpZnAzSHVDKzVSdGtKd1hjVnhuVHlqQlRz?=
 =?utf-8?B?cjBodnJCWDRtbkluN2F2bGNVaTBWbWxVRndKaEd4K0FLRGRxME8va0UvUHFE?=
 =?utf-8?B?KytUSk5qZUh6TytTS2czdFJxeEc3bVZESmcxODIvczNrWkMyMVN4QWQ1WEJm?=
 =?utf-8?B?L1ZtTFlBbnpqUEFCaVFoRXdOTFZoZjl0SERzRmRiRWlraTVFcTQzWnBxREtP?=
 =?utf-8?B?WSthUW9LY0hRVEd5dUF2RmZkamhsODBlTGtIRUh2TnpTeWc4ZUdxdkVqVnZ3?=
 =?utf-8?B?Nlp0ZXdPNnhLdmQ0Rmg2NnRUT040Y1VrZ0JYK1BaeGI2RVJobnY2bTBCMGNZ?=
 =?utf-8?B?MWExODE5VHduaXAwYnJNQ1ZrRmhYdmdJQ3ZqWmV4M09VQnpLdE9pV2ZBUkdO?=
 =?utf-8?B?YUsyTER6aEhCaFZCWklGVFFSWUorVi9ZVXhGRnlPUkV0ZnQvV3E3YVpIWWJ1?=
 =?utf-8?B?ME9QTkRGV2pFbzJBeTRUamw5OCtNdjhHQnRlSmZKUFdnTHhYRWJ5M1R2bTc0?=
 =?utf-8?B?VEszQXVVQko3U0E4SHR0OVQyM0FRQkVvMHIyM1R2MEtCY1c5SnFOcHBWaCtT?=
 =?utf-8?B?eXh6QVRLbTdEUTJxVFo3Mi9YQVM0RnZTOHQ0UE0yZGN4WHYxRmIwWGdGZG1i?=
 =?utf-8?B?b0tQNW9ocVJvczF3MXdDUjNJNUZZNXRXS0htbEY0am5JU2dYVGNqNVlKbVMr?=
 =?utf-8?B?YzcxczJBN1ZTYktEcjdQaFArSnNmOUZ1TWlxZzgxSEpnUVVDVU5SYmV5Ly9H?=
 =?utf-8?B?blJNcDVxaGNDUnRTblZVbDVHNzRqQTI2cFp6bXpTMnlhOXJlUGJ5TWpuMzZo?=
 =?utf-8?B?S2YwNW95ODFsU0k2MWhEVTlkOCtPNWpkbGtwQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkJuaEhoK0VTbFFjYXU5MVEyQVVVSTM1WmhWOGtuTE5BWUZvMERnS0YyWnRW?=
 =?utf-8?B?UGFYTktmNzQzcGduQTdYZWRZSUN2WklvVS83SGk4OXFoa2ZnSngycG1FdVBF?=
 =?utf-8?B?SFBJOHZnZWJIcFJLci9XTmtxeUwrdVZ3a0xkZzZWUDRIalRIajEzSzJLRlJp?=
 =?utf-8?B?MXRYZHpjZUJLejA4aE10allRSU9GWjU5M2xGaG1LMksvc0ljMlhKa2prUWxF?=
 =?utf-8?B?Z2lXVUluL2hkN3dFOG9xZUxUeWxWV1BBQTBJREZxZC9oOGg1L1N5MEN3eDUy?=
 =?utf-8?B?ejdvcG9QRGRORUJaZEJGUTZ0VXRnUEl3UzdCWElxd1VpcGVIVU9EcXVnNEVn?=
 =?utf-8?B?c0xUR0NFeWNjQTliOXNmWmRlbjZacUV6eEphT3dvVS9wT1QrNWN5MWtSL2hY?=
 =?utf-8?B?cVZsbUcxTDltTk9VZGRUcXpoUVdZMVhLc2xHWnRoTUtKWW9MN3kzYno3TFZV?=
 =?utf-8?B?eXRiUm9FcXUzTjdrSkpwMWU5QkpKczFhcC91YVhkSWljU1h3UVJlMmhzaDA5?=
 =?utf-8?B?NnpzTFRvOGhhZm5uNmQxWi9DOTZpd0dBNXJBRHpQK202K3RZVFdvWHNQMkpC?=
 =?utf-8?B?MUEvbFlvdFkvNU4zK05IenhYVzFxajFLZ1dOeTBXUmV0bzZla25oK2tQSzY2?=
 =?utf-8?B?YTJGcDMrbnBpLzV5RFk3bVEvOFhpOE5oUnI0WDdvQmNnZDNFd0l0aXZPbjk4?=
 =?utf-8?B?em5QZ2srZW5hMWpGWFNjWkt1ZUk2VURTNVEvU3l2SFl2aDd3VG4xVjhkaGJX?=
 =?utf-8?B?M0p4aGNId1VucVh0bkZ6ZjU0cDBUUTFVTEMvNHhVdGtJeXVlbGl6c2V1OVlz?=
 =?utf-8?B?VVZGMXVkN1lQMGJ6TUtXZ21vMzlhZXI4MDc5ck5uajd5YWdkL0dUSHM5SWtI?=
 =?utf-8?B?M2FreEpTcXBNUkhsakM3bndaOEhYZTJiWnlSUjQ0dlZyeDBvRFZIdVduc1RD?=
 =?utf-8?B?MlFWWkszZFYzTlFNMWNUWktrTG5YdmRUV1Ixb1RWQmNUOXMyZUE2R1VOYlZs?=
 =?utf-8?B?cjlWbkVXQTF1VkhuWHdrWktFVVRiQ1pBU2k5K25LdWRWdFhrTUJ0eUhib25J?=
 =?utf-8?B?SEJMQXBXZU5RL28ralIzcWRqaUh6Ym9LN2dmSFRqbEpMbUo1WG15U0o1VldZ?=
 =?utf-8?B?N00xYkhDUUdOcVF3MFc4KzluVTJpYlMza1Bod2loY3VvbXIxQ2xVWjZjUkdJ?=
 =?utf-8?B?ZXFUZDFYR3JnS3Bab1RiTjBSRG04LzZBOUhYV21YeGZ3MHNjWURhWldsam5z?=
 =?utf-8?B?NlZpS2FSdWxDOWlLM2hBM1ZnRmRYSS9iL1YzNjN2Q1JJcVZlcFdGRTFyWFpl?=
 =?utf-8?B?dTJLcFhvQ2U2UXhOeXVjell4bzhLUlBaZVF1ejR6dDEya2x1NVZLVWNPRGlU?=
 =?utf-8?B?ckwzMnZFSis3TzNobUsrNWpBV2xIS1pSOS9PdHY3T25SSnNHZWkwMDVqeXhP?=
 =?utf-8?B?MnIwMllyemxEYTgwM1ZSYzEydWErNzBmWExPM1grSjBaZkJ0SHY0U3J1cnVW?=
 =?utf-8?B?NFpQd2gwZ2lpeklyLzdJdEswbXpydU00c0Z6MW5hNDFQUlFYaldFL2VUMUVO?=
 =?utf-8?B?dVBocndnMStPRitSTUFFMzV2VGo0Kzk0bncvTmNuVldvdkpRYlRZT3d0RGxk?=
 =?utf-8?B?ZlZFVFpFL29OWDZpL0NrVWJnWXNpZ01rN2t1UDNEWE5xS2RPSmpyNWVaZXZt?=
 =?utf-8?B?QkQ2NUNzMDUwYnJKRHgydTIrcXRnZmpaUmxubENlZVU0M3FEVGxsbU11bVda?=
 =?utf-8?B?ZVREZmFpNzd3V0VjaTg1VXlvMEluL0NqQUZ3T0UrN0Vid1d0Rk5qS1d6bElU?=
 =?utf-8?B?d1ppVWxsSzhEbGRiSEFKb1RnWDgwRTR3VitzRXNYNVBNdlE0V3JWVGhOZEp1?=
 =?utf-8?B?MVlJYkIrUVlSNnlaQkMwQ3ZxUnJLWkJRRlZjbGM1UlBNNWNNL1JvL3UwcEZu?=
 =?utf-8?B?eWpXQ3FSVGpYK0ZvTHBtRjBwOWEwZ09VcnE0aXlXVWNCZDdFcm1ISEZ3RE1a?=
 =?utf-8?B?VjlBSXJzNWxkeFhrVXgwUDBTVWVtZlNsd1lySERZbDV5Wk1KSVIwMnlOQmRl?=
 =?utf-8?B?TFZ3NlVzSUI0UE5jVmtHTGh3aUpheXBsMkllRHZGYzhnZFB6dmh4VjVvcWFp?=
 =?utf-8?B?cjhoeld5UnlPZUE4TmdYRTdEMDJ3cWpza2FnLzdYMkZyZnRleHZiY3lJR0pE?=
 =?utf-8?B?SEdUQzVsTzZ2elcwc2VBaWVQS1FiTjV1SGoydEtidzhWb3oxTnlGWksxUWQ3?=
 =?utf-8?B?ZUlMbWxjRUdaZVQ0bk5Na0ZTRXVVYWU3Sk5ZVzZ3eHQwQ0loV3VSa1lDcUlX?=
 =?utf-8?B?WkNvYTBwdlkvNkVDWjgvVDBrOXFJK0Mzd0w4Y2pSSS8xZVNFYk5HcDJwd3RZ?=
 =?utf-8?Q?PDI3zv2IS66CmLrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93A23B97D75DC245B9CE51141EEFC10D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c742ea14-bd5c-4a96-ad96-08de4d26b0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 13:22:50.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LY4I8IaY/Fpe8Zv9bcHlaTlH5wIZ0UcyIhsEZmyw9E76cCZzrij1ye+8msJ7GlUWMMbRXXISNNYNBQQZWDDgOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6826
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_052300_594210_43329C72 
X-CRM114-Status: GOOD (  14.37  )
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

T24gTW9uLCAyMDI2LTAxLTA1IGF0IDA5OjA1ICswMTAwLCBOaWNvbGFzIEZyYXR0YXJvbGkgd3Jv
dGU6DQo+IE9uIFdlZG5lc2RheSwgMjQgRGVjZW1iZXIgMjAyNSAwNzoxNjozNCBDZW50cmFsIEV1
cm9wZWFuIFN0YW5kYXJkDQo+IFRpbWUgUGV0ZXIgV2FuZyAo546L5L+h5Y+LKSB3cm90ZToNCj4g
PiBPbiBUaHUsIDIwMjUtMTItMTggYXQgMTM6NTQgKzAxMDAsIE5pY29sYXMgRnJhdHRhcm9saSB3
cm90ZToNCj4gPiA+IC0NCj4gPiA+IC1zdGF0aWMgdm9pZCB1ZnNfbXRrX2luaXRfYm9vc3RfY3J5
cHQoc3RydWN0IHVmc19oYmEgKmhiYSkNCj4gPiA+ICtzdGF0aWMgaW50IHVmc19tdGtfaW5pdF9i
b29zdF9jcnlwdChzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgTmlj
b2xhcywNCj4gPiANCj4gPiBQbGVhc2UgZG8gbm90IGNoYW5nZSB0aGUgcmV0dXJuIHR5cGUgaWYg
eW91IGFyZSBub3QgY2hlY2tpbmcgdGhlDQo+ID4gcmV0dXJuDQo+ID4gdmFsdWUuDQo+ID4gDQo+
ID4gDQo+ID4gDQo+ID4gDQo+ID4gU2hvdWxkIGZyZWUgdGhlIGNmZyBtZW1vcnk/DQo+IA0KPiBJ
dCdzIGEgZGV2cmVzIGFsbG9jLiBJdCdsbCBnZXQgZnJlZWQgb24gZHJpdmVyIHJlbW92YWwgYXV0
b21hdGljYWxseS4NCj4gRnJlZWluZyBpdCBtYW51YWxseSB3b3VsZCBiZSBhIGRvdWJsZS1mcmVl
IG9uY2UgdGhlIGRyaXZlciB1bmxvYWRzLg0KDQoNCkhpIE5pY29sYXMsDQoNCkdvdCBpdC4gUGxl
YXNlIGZlZWwgZnJlZSB0byBhZGQgbXkgcmV2aWV3IHRhZyB3aGVuIHlvdSBjb3JyZWN0IHRoZQ0K
cmV0dXJuIHR5cGUuDQoNClRoYW5rcy4NClBldGVyDQoNCg==

