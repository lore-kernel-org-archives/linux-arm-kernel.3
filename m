Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAF8C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpod5ILUHGjPLgtvql4lp/+gcNIRXtKZkXxzmfKZKmA=; b=iAFY2RMpBMKB5+7r6TmDRlS20B
	RFieFzYvQFFP8cHtetkVlkxSTmUnM3pnC038tAXc2PbRrJTsHk4tkWA219AIHbyIrI/msoK898V/B
	l3RqvUPyMSSrnuy2SqKnt8OR1ZuSTcQvAcIjjYi5Kp3J4LUri2grqJNoPzmgQQd5uS50jPh+F7Xwg
	lDYOYq/Je575RLmyDj6cB3Qqceo0zcOwtJOZbXI2t03RThi1CqhRsHTMwKao0uDKlZgBnqoIAjWhP
	PDItsl/FynEAHZF5GJE28Vhr1RDXnni7xdXc8+TPcN47HbqesayAtHENJz7guFeuqRcNEwshbqtqs
	aKVuGo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCiE-0000000BoDm-3NSZ;
	Mon, 26 Jan 2026 02:52:22 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCiB-0000000BoDL-2v01
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 02:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk87jNAhkNCBNy+jUFSwp6Umb3lN0qjBDLvvpJQOh0oA/Wl2Xm+3m98sTFoTHzNkiReJKAf6hP7wRld+4VRzsoG7Js81dUk12vYQRZLy9FAmYGhA2A90Gglk0Vxo5i48XoDcsbsw/ceXFaoOB9rR8S0KWgYaAPXKLmZPi8e8phhpd3sLez4MiRYb6AX5rPYHDJ8RPsmwZrzgmxB65THzBEAp/yG1GnyQ0Ei5h8358b03mfw4eBdnKizAiGiYlyvYGsUsQijomVeMopwBxGUKNFsDlbE6TqEt07eq4pbC0+qXhqHeImE9NCAYJOn0ipIXFlaK4BBJeiF0gJexmZa8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fpod5ILUHGjPLgtvql4lp/+gcNIRXtKZkXxzmfKZKmA=;
 b=zJeV+/iSlW6K2Tbv+cgUh5OZ9JJDdkwY9oq158hs0W2J1TSAVMQzEDk8NV1Jft/eYL8JetKVHiXhdziJmhx7n/cI7yqEbRyObWaaJvjAnAgbt6Nkps94ZDtTAOnFGz1bbHMa8ufyBvPAkquCYpbpi9K+7YFqDJPeBmDpNrsI/OK8BRThA1CLv3FGw31aO0Vv/+M80FNWJBF+LOs/G9nRhdRBsOilgGVRLbNf8p8TXAloNEZ8XmeyGKpI5mwiDzyHBIZ9yvn1bRDZgbXCRO6av9Q9mY6DAmW5LCYwS/sq54/u6L/+hUnPj7/i1zqbR6RQFa3Hf5R2oc1hIGOn5zs2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fpod5ILUHGjPLgtvql4lp/+gcNIRXtKZkXxzmfKZKmA=;
 b=Nl9Yn9WIm12nb5NJVd4XLb7hu/Z/5v50+xSOW11jZhIpQbcTQDqCvH98Pf/Yc+Feww73EB9XrLqgHbUm/tiQBZI+FQmGnyN+dZ+q4dF5w1onSIlG8VaslSK+id+lMNKNrLB6l5guUScC+9mth2xYJjWgDqAYKIAMWPeL6Q+ULijitR5YuezbGg1zHLWdEwoIQZC4vKZYzxk6EFHXLcCvpeBm+GBcqWUs2UcdIJmJgPuUm+urAJicugRLd+RDXGbG7N2lWgaYxgMKV2F8mYFQgt+TFNegp31DNzOiz1bLeihu/cenPUhRGkooBXs/YMb7Ny1/dhthTP/vHFTBCoCYog==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV2PR04MB11636.eurprd04.prod.outlook.com
 (2603:10a6:150:2b0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 02:52:14 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 02:52:14 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>,
	"matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>,
	"y.moog@phytec.de" <y.moog@phytec.de>, "josua@solid-run.com"
	<josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>,
	"primoz.fiser@norik.com" <primoz.fiser@norik.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
Thread-Topic: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
Thread-Index: AQHcjBJvEUDuSKHKwUmr+BAPT1okw7VfdeEAgARGORA=
Date: Mon, 26 Jan 2026 02:52:14 +0000
Message-ID: <VI0PR04MB12114EDD17C2F37A3AE7D61089293A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-3-sherry.sun@nxp.com>
 <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
In-Reply-To: <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GV2PR04MB11636:EE_
x-ms-office365-filtering-correlation-id: 0d83b98c-57b7-4d5a-85c5-08de5c85e92a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?V0Q3RldaNkp5WlRDUzJpaTVxeE90eUNVY2pJSWtac1RNem1RZGczZDgvbjB2?=
 =?utf-8?B?aGNqcmM2UUtUTFhTNklZSlBuZlI1Q2tGUnIrMDNXbkhIeGx1Y01mTEpPUzBD?=
 =?utf-8?B?SWdRbjJIVFR1bUZQNWJlUVUvTzdha0srSTlWYW1xYTliK1B3OUhubDFadldj?=
 =?utf-8?B?c2U4a3lFYitPL09UUjlCbmtoOWNNeGc3S0N0SzdncjZuSlhhZ2hNcy80WGR2?=
 =?utf-8?B?M2lkeC9wMG9hY0VubDFxSHIyZGhkRmlYNFFJUkRQSU5nQjhzdlBWYVVmVm9M?=
 =?utf-8?B?Q0ZzRksrOXNhNWpuMzNoUkdjM1JVM24zTDcwbnNnaUxIOHZoczJ3OVFaMFR4?=
 =?utf-8?B?ajZnYkkwdkgzOVh1emhRQ3UrMFJTaTFRSWt3aHZGemcxWk9oOGZSNmgyWnFw?=
 =?utf-8?B?d0MzakpoMnFqSGF0UjN3Rk5CVk1OOTdSZFZoNklTakJ5WHZJSkt0bWF1cFZM?=
 =?utf-8?B?Y04rYkZsTldGeDlTT1oya2s4WUR6TTBIaUxoTXBIYjYycS81QmF6d2FwcGY3?=
 =?utf-8?B?QjYxMXFzdWlZeFB2RE80cTh0N3BtVmg1SUxUekUzMmhYRVJTbTJEbDU3Zkx3?=
 =?utf-8?B?a3pLSXNvd2dodndzdVZOTkN3c1RGeGxnay9FVVg3TlQ4dDZjRTJ2V1lVdVdS?=
 =?utf-8?B?L2FjamJpNGZjQ2hzOHJSeHJrN1JIeVR0MGpFc1ptdlkveWZRejR1Z21aVlpz?=
 =?utf-8?B?aHhCMUlOK1Z5UjBhS1hrNXBha3NQcThGNlRIOHZOY09mSmZSSlVYeXBpWElj?=
 =?utf-8?B?aXdBOXJWa2wwZU5VVlgwQkZheFQ2bkNiTXNGbFd6eFg2WW5UU25QSmNOWlBk?=
 =?utf-8?B?STAwK29WT2RwOE9oblI4QzMweU9SbWJmU2RYVGNGTm13a1VnZzFYRFBBdm1i?=
 =?utf-8?B?MzAramd6Q3dLQTMzZFhKMVNDOURubU9zeXNNY1FvdnlzUG5rdHh5a0hRNGwx?=
 =?utf-8?B?YTdkSFlRMVdVbHp5cTR1aEttQVpEN3AxVTdLWjR1MWlqUXlRRDh4OTFRNC9L?=
 =?utf-8?B?bXozRUl5dnRRWjlvRHp0b0Y2eTQwcVQ0cytxbHlDU25HNlFobDdXeTFOSUFl?=
 =?utf-8?B?U2pTbDFkRzA1ZmZQbjIwbyt6NVN0eVlXQXozU3NEVXJ0RUdWWGVLVTFxOE9G?=
 =?utf-8?B?dmh1cysxZ2F4SzZnYjNCeWo2QkVjLzRkWW0xZ2FiL3RFeXFmOFltUFVkUXho?=
 =?utf-8?B?U21zYmtoU3hLSncvTGZPQm55bUJjVXZqckxZVHB1NFBhZ205Y0lJM3ZneUVa?=
 =?utf-8?B?eG9ySnYyY2tOQnFnK0IyNFFwWEUrWXU0cm1VeVFHZmFJc1NaT3RJZk05VSta?=
 =?utf-8?B?YzBwcmhyVHhFdElwK1RiZUd5VGp5aXVlUlJXVFgyeE9XYXVpelJHSXIwTmFI?=
 =?utf-8?B?cE5KSU1xTi82c2ZacVJwYUwrM0Z2V2NLQzhvckRTTU91b294SUtsWmpobnV5?=
 =?utf-8?B?YWp2VXNJc2s3Ukl2ZnhXQmZHN0J0emwzcVd5MTRuSzF5dDljWVJ0eUd2anpx?=
 =?utf-8?B?SWFSTVJIcDN4Sld4UlErYkFFNG4rL2M3Z2hoZ0lpSHFPMmhlWGZ3NWltUlcr?=
 =?utf-8?B?UmRkWnhTZVQ4MzdkaVJyVEw5K1ZlTUs5d2lOZHZUVHpERWVmcjdNU3RKaHVl?=
 =?utf-8?B?ZWEzMWhrU3pFVXUwWlpqK3poczFqMGwwZUpNWG51N2s0R2pnMStPcDViUjFv?=
 =?utf-8?B?RW1NaDAwK1dhc3p6MkhPVWN5dVhwZ2FKMVVML0ZidXBRbGluWFBWNldhZU53?=
 =?utf-8?B?bjUrTk80SERJa1FKR2dETHhtTHVJdllEWXhTV0N6RHRoVElFUHVjbGJNU3p6?=
 =?utf-8?B?K0hoSWRiZlhzSnA3KzJPZ1dkczk5NjlaQXlJSEtZOGExa2pFaWk3Yzg4YWhs?=
 =?utf-8?B?UktHNFpyZlFSbkJaTlE2djFmQ2pHL08xWVZYNlJ3N3A2SjdCL3ZmeTVOL25O?=
 =?utf-8?B?YUtZVnBlcGY4VEY3M2FKN01JS2RCUlg4dldmRXpYZllqOTJMRUFNTXhEU1d5?=
 =?utf-8?B?V0J3WkM0Y1ZYRnY4OXFMSVpVU1p1WGQ2Nm1nNWZsbFZ2VWtjK21WemZra2U4?=
 =?utf-8?B?eWJLMm5scFBXMHJvMFErU3JLRHFmalltNXJKTjkrZ0JSMkM2NzJsSEgwZjFn?=
 =?utf-8?B?ZlVzVndsL3pFNkhsaG5uWC9UYWM3cDdaQm1uVXNRbTlzN3JzYWdMVEdHMFFC?=
 =?utf-8?Q?x0TSyblNvO0rsspvpHYEXyQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnpWd1EzWjN4bFI1cmd4ZXh5U1RrdEFpSUM0YWFkUlhpVVlnVjRKUXhMMXlj?=
 =?utf-8?B?TWg1S1RMRHFubko3T3pJcWpjaW13aElxWis0QUo4SjNOREo1ZjBPbHQyTGRj?=
 =?utf-8?B?UTdqMnBjM0FJYTBTT3VDU0dab04waWozMEhhUmpmMlZRUVZ4cVhqelB2S21N?=
 =?utf-8?B?WktRL0pmdDViZzFzcmtsd3V6c3A1VXNFWVIvRHdMdlllSy9VbWtoazZkUkJi?=
 =?utf-8?B?Vm9sY1YycHlXRXVIMUp3NnViN3JNMC84VHhicHFKRlY5dmtjOW5LRnVEK2Zy?=
 =?utf-8?B?dkZEaytBbHh3Y1k5Rkp3WGt5cGlWOFYvMGpGWWl0YkxrZ2QwSGc5ak1WTTdn?=
 =?utf-8?B?Z3BrVTR3K2FkM2V0VjJ5cTF2SkRsUVlOSnRtNFBVY0VvZENQQThzVnh1V0VN?=
 =?utf-8?B?WEt4Y0puUXEvME4rSkd0akhiYTRQNnhnN3Azak1oK3RPZDZQMnRiRVhDUFBm?=
 =?utf-8?B?MHlwUnhlY0FqTUFRVVo4OTZpb2w0cDNHY2MvbDdoYm55TzlzQXlHdXZvNzZN?=
 =?utf-8?B?eW42VTZrQmFPYWtLamU2UW5XRDN5aURoREhWWXE5QzNUaXIveG1BRVVuYjZV?=
 =?utf-8?B?bjJhLzJESlo3NllZVDg2YVVleHczOEFoRklHc0JZSVNtVGMyUC9aUDJzTnp3?=
 =?utf-8?B?OEVlbnIxZ2hDNDFNeFY2UDFoczZ4WGMxWko1dituS3R2aTJUaVUzS3VBODAw?=
 =?utf-8?B?emJia3poQVJHMW5aTzg4QnFheXcydnpKL1VubmI4WXUrK2pRLzdVY0c0clpN?=
 =?utf-8?B?MEM0aGJSV0J0NHllRmp4UUZLbWRLeU85SUZNWnhCVmpWSmhNMGZrTE9qZFp4?=
 =?utf-8?B?QnFYdlFrUEZjOTErL09pZ3orZnpBbzlPSWw2MUFWcnY5ZHI2WlpRd2pCSHFZ?=
 =?utf-8?B?anZQWDJ0U2hxTzROWGlXSzN0dHZtM2tkTUszZGZSWUhiNjJhdDlUSHZmMCs3?=
 =?utf-8?B?RCs5bXN5emk1Wm1iN04wa2tLMkJ1V1BTYTNzU3RYY21ObVZuZmNVSlBtb1RK?=
 =?utf-8?B?T1B3eHhxNTl1SHNmLy8ycUFMVEFxTllUQ3BTRTdxK2o4YzNFLzZTZjg5MWov?=
 =?utf-8?B?VlZoWWVsSUQ0VDFZSy9vMWI3Q255UDFhUk5oWW5mY29FZVZVUGJjaGZLMTRG?=
 =?utf-8?B?TUVoUHpYNE1KblBVd2lXaFZCUUJTNXNGc2l4Sm9hM2Q5cGpKR0w3ZStwOVhN?=
 =?utf-8?B?RFVjT2hmYVRqY1BObk5Bbm90ZjRVUERYTzdPdXRwbEd1MW1kcXVNaFhwLzdM?=
 =?utf-8?B?T2Z4NXJOdGNveVVsS2hEaHBrM0FqUmpKb08vVWZTMnFZNkIxa2c4ZXZKMXRy?=
 =?utf-8?B?ZkYyU1lwS0kybVZiQ3E2d0g3bWlNN0ZKUHZhZWpXRnBpbnhKNkRiU2xXd3pW?=
 =?utf-8?B?QmJlNUVMcklIZ2NTN2tEREtwUUZmMTBxdmRvaUNnNkJKWGRPbExlVDRFUkpa?=
 =?utf-8?B?dEF0MXh3M2pwZjhCSzN5amdpZWNzRSt5TjlmUDFzS0JrU0lQU0ltVEQ2MHNh?=
 =?utf-8?B?VkVkTkRIMDh4OGF5a1J6cnp3SXpRRVlROFhNbU1DTUVCM1NwbnI3ZVUrN29G?=
 =?utf-8?B?ak9CK0tmSTlmbDhlYnJaaFAvVE9KN0JPeDE2ZGY4RC9CdEs2ZVJBNkhvdGVD?=
 =?utf-8?B?ZDdqOGdUUVNJVjRnWjNjQlNnOG5OLytYTjhTbTZHTmw1elU2UXRpdFpEWlhi?=
 =?utf-8?B?a1lrdDVENHRXbENsU1dSSG9QOE15VCs1NlhlMHpWU0lRcm1LcTNXcFZqVXZE?=
 =?utf-8?B?Ri9SYTFVRWZEVW16TmtxemV1bmcxSGluQ2NPSTg4Y0F4NjdSTThiM1UwZ2No?=
 =?utf-8?B?YXFsakZncWJkK0ZaNExCU2FhYVludEFJa1EzYWNVaFJZOWUrZ2tDRHZpY2tR?=
 =?utf-8?B?ZXJxcEZ2UW5KK0prMTdaUThmY1U1YVo4Q1A2eWg2azlNRkx0UXNIWWRMTEMv?=
 =?utf-8?B?MnRoRHJkWDFlVWNISlVoQ0ZRajI1ak9TU1diQWxhTmdvTC9aMzkySGRiZy8r?=
 =?utf-8?B?RnI5U1l3U2RZNjFuQ3RSSld2WnFwR3ptYmtUMk54NFFETnhiNjBlUnRUQU1W?=
 =?utf-8?B?aUxhTkswM0NrS3dWWngvQndmc3JBOCsySHdqVmUvR1NKZXIyblZJWURsNnoz?=
 =?utf-8?B?b0Q2RWhyV3lsV3VHUG9qU0RwNmdWWnNFZ0tnRTZYTTJ4NjZPKzc3eUpBaTFD?=
 =?utf-8?B?YUlmYUszWXY5NHNJeHkzRmlIcTRCbVRJRW9yejJoU1kydU5UekloUlNnMVNk?=
 =?utf-8?B?SnlVVi9QZEVNbzdpRWZqOGtkdG9ja1lkbWVxRHRnTldJNDA0ZmdnLzJtbnJT?=
 =?utf-8?Q?hW+owd8VS0Td6/lFc3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d83b98c-57b7-4d5a-85c5-08de5c85e92a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 02:52:14.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bSExGGAT5Oa+Sdshn59A94kILNDzYlUpRAvtxKuPgMQNJ4qbTClz2bWCPV9u1xlkZAlh5mOeedROB4DjB7Tb4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_185219_885093_CBDA303A 
X-CRM114-Status: GOOD (  20.91  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDIvMl0gYXJjaDogYXJtNjQ6IGlteDkzLXdldms6IEFk
ZCBpLk1YOTMgV2lyZWxlc3MNCj4gRVZLIGJvYXJkIHN1cHBvcnQNCj4gDQo+IE9uIEZyaSwgSmFu
IDIzLCAyMDI2IGF0IDEwOjQ0OjQ4QU0gKzA4MDAsIFNoZXJyeSBTdW4gd3JvdGU6DQo+ID4gaS5N
WDkzIFdpcmVsZXNzIFNpUCBpcyBjcmVhdGVkIGJ5IGludGVncmF0aW5nIGkuTVg5MyBhbmQgSVc2
MTAgV0xDU1ANCj4gPiAoV2ktRmkgKyBCTEUgKyA4MDIuMTUuNCkuIEFuZCBpLk1YOTMgV2lyZWxl
c3MgRVZLIGJvYXJkIHdpdGggdGhlDQo+ID4gaS5NWDkzIFdpcmVsZXNzIFNpUCBiYXNpY2FsbHkg
cmV1c2UgdGhlIGkuTVg5MyAxMXgxMSBFVksgYm9hcmQsIHdpdGgNCj4gPiBzb21lIG1pbm9yIGZ1
bmN0aW9uYWwgYW5kIHBpbiBjb25uZWN0aW9uIGRpZmZlcmVuY2VzLg0KPiA+DQo+ID4gSGVyZSBh
cmUgdGhlIGRldGFpbGVkIGRpZmZlcmVuY2VzIGJldHdlZW4gaS5NWDkzIFdpcmVsZXNzIEVWSyBh
bmQNCj4gPiBpLk1YOTMNCj4gPiAxMXgxMSBFVksgYm9hcmQuDQo+ID4NCj4gPiBGdW5jdGlvbiBk
aWZmZXJlbmNlczoNCj4gPiBGdW5jdGlvbglpLk1YOTNXIEVWSwkJCWkuTVg5MyBFVksNCj4gPiBX
SUZJL0JUCQlJVzYxMCBpbiBpLk1YOTNXCQlJVzYxMiBNLjIgbW9kdWxlDQo+ID4gTVFTCQlOCQkJ
CVkNCj4gPiBQRE0gTUlDCQlOCQkJCVkNCj4gPiBNLjIJCU4JCQkJWQ0KPiA+IFJQaSA0MC1waW4g
SERSCUxpbWl0ZWQgc3VwcG9ydChwaW4gY29uZmxpY3QpIAlZDQo+ID4NCj4gPiBQaW4gY29ubmVj
dGlvbiBkaWZmZXJlbmNlczoNCj4gPiBGdW5jdGlvbiAgU2lnbmFsIG5hbWUJaS5NWDkzVyBFVksJ
CWkuTVg5MyBFVksNCj4gPiBXSUZJL0JUCSAgU1BJX0ZSTQlTQUkxX1RYRlMgKHNwaTEuUENTMCkJ
R1BJT19JTzA4DQo+IChzcGkzLlBDUzApDQo+ID4gCSAgU1BJX1RYRAlTQUkxX1RYQyAoc3BpMS5T
SU4pCUdQSU9fSU8wOSAoc3BpMy5TSU4pDQo+ID4gCSAgU1BJX1JYRAlTQUkxX1JYRDAgKHNwaTEu
U09VVCkJR1BJT19JTzEwIChzcGkzLlNPVVQpDQo+ID4gCSAgU1BJX0NMSwlTQUkxX1RYRDAgKHNw
aTEuU0NLKQlHUElPX0lPMTEgKHNwaTMuU0NLKQ0KPiA+IAkgIFNQSV9JTlQJQ0NNX0NMS08xCQlv
bi1ib2FyZCBJTyBleHBhbmRlcg0KPiA+IAkgIE5CX1dBS0VfSU4JUERNX0NMSwkJCW9uLW1vZHVs
ZSBJTw0KPiBleHBhbmRlcg0KPiA+IAkgIFdMX1dBS0VfSU4JUERNX0JJVF9TVFJFQU0wCQlvbi1t
b2R1bGUgSU8NCj4gZXhwYW5kZXINCj4gPiAJICBJTkRfUlNUX1dMCVBETV9CSVRfU1RSRUFNMQkJ
b24tbW9kdWxlIElPDQo+IGV4cGFuZGVyDQo+ID4gCSAgSU5EX1JTVF9OQglHUElPX0lPMjgJCW9u
LW1vZHVsZSBJTyBleHBhbmRlcg0KPiA+IAkgIFBEbgkJR1BJT19JTzI5CQlvbi1tb2R1bGUgSU8g
ZXhwYW5kZXINCj4gPiAJICBOQl9XQUtFX09VVAlHUElPX0lPMTQJCW9uLWJvYXJkIElPDQo+IGV4
cGFuZGVyDQo+ID4gCSAgV0xfV0FLRV9PVVQJR1BJT19JTzE1CQlDQ01fQ0xLTzENCj4gPiBJMkMz
CSAgSTJDM19TREEJR1BJT19JTzAwCQlHUElPX0lPMjgNCj4gPiAJICBJMkMzX1NDTAlHUElPX0lP
MDEJCUdQSU9fSU8yOQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hlcnJ5IFN1biA8c2hlcnJ5
LnN1bkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9NYWtlZmlsZSAgICAgICB8ICAxICsNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OTN3LWV2ay5kdHMgfCA3Mw0KPiA+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTN3LWV2ay5kdHMNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiA+IGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gPiBpbmRleCA3MDBiYWI0
ZDNlNjAuLmQwZWE3NDZjNTliOCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL01ha2VmaWxlDQo+ID4gQEAgLTQxOCw2ICs0MTgsNyBAQCBkdGItJChDT05GSUdfQVJDSF9N
WEMpICs9IGlteDkzLTl4OS1xc2ItDQo+IGkzYy5kdGINCj4gPiAgZHRiLSQoQ09ORklHX0FSQ0hf
TVhDKSArPSBpbXg5My0xMXgxMS1ldmsuZHRiDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykg
Kz0gaW14OTMtMTF4MTEtZnJkbS5kdGINCj4gPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBp
bXg5My0xNHgxNC1ldmsuZHRiDQo+ID4gK2R0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OTN3
LWV2ay5kdGINCj4gPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg5My1rb250cm9uLWJs
LW9zbS1zLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDkzLXBoeWJvYXJk
LW5hc2guZHRiDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OTMtcGh5Ym9hcmQt
c2VnaW4uZHRiIGRpZmYgLS1naXQNCj4gPiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDkzdy1ldmsuZHRzDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5
M3ctZXZrLmR0cw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi5mMDk1ODdkYzc0ZjYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTN3LWV2ay5kdHMNCj4gPiBAQCAtMCwwICsxLDczIEBA
DQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQ0KPiA+
ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAyNiBOWFANCj4gPiArICovDQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSAiaW14OTMtMTF4MTEtZXZrLmR0cyINCj4gPiArDQo+ID4gKy8gew0KPiA+ICsJbW9k
ZWwgPSAiTlhQIGkuTVg5M1cgRVZLIGJvYXJkIjsNCj4gPiArCWNvbXBhdGlibGUgPSAiZnNsLGlt
eDkzLXdpcmVsZXNzLWV2ayIsICJmc2wsaW14OTMiOw0KPiA+ICsNCj4gPiArCS9kZWxldGUtbm9k
ZS8gcmVndWxhdG9yLW0yLXB3cjsNCj4gDQo+IElmIHlvdSByZW1vdmUgbm9kZXMgdGhlbiBjbGVh
cmx5IHlvdSBkbyBub3Qgc2hhcmUgYSBjb21tb24gZGVzaWduLCB0aHVzDQo+IHlvdSBzaG91bGQg
bm90IGluY2x1ZGUgb3RoZXIgRFRTSS4uLiBhbmQgZGVmaW5pdGVseSBldmVuIG1vcmUgY29uZnVz
aW5nIHRvDQo+IGluY2x1ZGUgb3RoZXIgRFRTLg0KDQpIaSBLcnp5c3p0b2YsDQpPaywgaXQgc2Vl
bXMgSSBzaG91bGQgbWFyayB0aGVzZSBub2RlcyBhcyBkaXNhYmxlZCBpbnN0ZWFkIG9mIGRlbGV0
ZSB0aGVtLCB3aWxsIGZpeCwgdGhhbmtzIQ0KDQo+IA0KPiA+ICsNCj4gPiArCXNvdW5kLWJ0LXNj
byB7DQo+ID4gKwkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJ
c291bmQtbWljZmlsIHsNCj4gPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiANCj4gS2luZCBv
ZiBzYW1lIGhlcmUuDQoNCldpbGwgZml4IGluIFYzLg0KDQo+IA0KPiBJdCdzIHBvb3IgcHJhY3Rp
Y2UgdG8gaW5jbHVkZSBEVFMgaW5zaWRlIERUUywgc29tZSBwbGF0Zm9ybXMgZGlzYWxsb3cgdGhp
cy4gSXMgaXQNCj4gYWNjZXB0YWJsZSBwYXR0ZXJuIGluIE5YUC9pTVg/DQoNClBlcmhhcHMgSSBz
aG91bGQgc2ltcGx5IHVzZSB0aGUgRFRTIG92ZXJsYXkgZm9yIGkuTVg5MyBXaXJlbGVzcyBFVkss
IG9yDQpleHRyYWN0IHRoZWlyIGNvbW1vbiBwYXJ0cywgc3VjaCBhcyBpbXg5My0xMXgxMS1ldmst
Y29tbW9uLmR0c2ksIG5vdCBzdXJlDQp3aGljaCBpcyBiZXR0ZXI/DQoNCj4gDQo+ID4gKwl9Ow0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArJnBjYWw2NTI0IHsNCj4gPiArCS9kZWxldGUtbm9kZS8gbTIt
cGNtLWxldmVsLXNoaWZ0ZXItaG9nOw0KPiANCj4gV2h5IGRvIHlvdSByZW1vdmUgc28gbXVjaD8N
Cg0KV2lsbCBhdm9pZCBzdWNoIGNoYW5nZXMuDQoNCj4gDQo+ID4gK307DQo+ID4gKw0KPiA+ICsm
cmVnX3VzZGhjM192bW1jIHsNCj4gPiArCS9kZWxldGUtcHJvcGVydHkvIHZpbi1zdXBwbHk7DQo+
IA0KPiBEbyB5b3UgdW5kZXJzdGFuZCBob3cgaW5jbHVzaW9uIHdvcmtzPyBZb3UgY2xhaW0gaGVy
ZSB5b3UgaGF2ZSBjb21tb24NCj4gcGFydHMuIFJlbW92aW5nIHRoZW0gbWVhbnMgdGhleSBhcmUg
bm90IGNvbW1vbi4NCj4gDQpPaywgd2lsbCBmaXguIFRoYW5rcyENCg0KQmVzdCBSZWdhcmRzDQpT
aGVycnkNCg==

