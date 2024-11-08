Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FA9D4335C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HgCFemWbQm7XJB6IunQj9rIEvo6a8ZbcHdq0VXRZS4=; b=jGf6HQMjNmAU4E6OKRxUMUuchl
	UORi4LlNUvsHMFa+8YhHxcupo7YoUewkjYF8YFpVzgJRUoln/A5ah4N2UHXIVe5RxEiS1kYxPW6rE
	iJZEEdzYb545W6DUPtyR3rjZkfVfJ9nzUPzJ8yfUWVKb+rT447lzgAd/rAQ2XbXfSL/d1zRxaQ27y
	84lhtUUMaY/9eHP8C+ZZA/DP2ubGBEnz+s6uA+054j6JV7p8APZpMQU69QmEi3Ff0g8OjO/myX9la
	oJCBxFLT1IeojQZUQrR6qzoQTkIWzLCxnJAvWfOV/PlMM28/ioLpAvh47sF7FiQVsD3l+6QdIO64V
	W7MgUPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9F7a-000000094C1-18ve;
	Fri, 08 Nov 2024 02:53:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9F5q-0000000943R-1SJi;
	Fri, 08 Nov 2024 02:51:27 +0000
X-UUID: 5569c5ac9d7c11ef82ff63e91e7eb18c-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1HgCFemWbQm7XJB6IunQj9rIEvo6a8ZbcHdq0VXRZS4=;
	b=dRV9bjFlI4O8rMS61UkM6wlXG+Nk5e0lWR+7wmHPYcYZYDD4WKeSsbCRB6PYBFf/N9xTn+K3I8TQkowPDW8jeqlDKm4El980avEsfiwxM8YvMHo9TrDBetXuE/jiyRMp41f7vgw6I+zgS9aBJ/veLxL92qaY+HVwxqaKzx5TYjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:b594a1be-b953-4d27-b442-637b65e9b903,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:8696b5ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5569c5ac9d7c11ef82ff63e91e7eb18c-20241107
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1966570317; Thu, 07 Nov 2024 19:51:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 10:51:18 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 10:51:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRFSg2E24eNd/Xmp/Oclij8D0DttZ0L1oI+8lUqHRxlUQDoaooDl07E1uQnyhNB2tjqLBgHABUMEgThDJqdVu3u+DlNl6/L1fOYkd5/A02gP622OmrwT4eTuJsc6JHHYd4BsqtL7umUlNXoPzp8UHhid+GDOehFppBpddNUBgAGenIMJRE9RzQnws4NS606mU44nOpQEwWXi3yLwHVTnz+RxhfLnNQvJ9u31FRbpkGc/CYxaRbTi44DPSPItBoyd5t+7Ov3IB6qS3SF+1RhiWHVbPjgCzR4F83c5Wk/1CKvxKQBNzjutdlLNkqoAObab0wgzsJF8IU/zR68+7BHX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HgCFemWbQm7XJB6IunQj9rIEvo6a8ZbcHdq0VXRZS4=;
 b=twiuXOlbynNRZvpQHtNgmPVb/W7KT4zW0tw11TW3gb015RO80p25RkKEnnp7UwZamBbp0MH33kNo5PI2Wz43KnGwz1GW/onI09Y/eiuM3cEUeLMAg/ZgTD3Rd//AdsWebh/QkFWC32ofnv701iZJRbUapA5N7HTvIewRIx/wbHEhBUVMiCy6HfhJ22WjH2BvxhhR0XslFOytKMJu4Lzhef4Olf6WUkE3MS+DoVzeyVzjWtCkERYQ2/tQpk8i94Ol5JkiLYq0wN5u2oBfIE3RWcp4IaPYD2aQztStVWMo2lzKH1hc/jOigG1LNTigua+Ag2O3KyVbzIOWuQlrUMQaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HgCFemWbQm7XJB6IunQj9rIEvo6a8ZbcHdq0VXRZS4=;
 b=NGdKtxxS+nkidibvVKBf0u5FWZksp5C//MChJQnW75Bwh62MhFbph0bWr277M3S63He0Oza4712ZFWFI4LRhRXZZ3CxBjBFeF3jfXEYSdqbTKt/u9rqNC3/xVPidUZugsNnflHDeGFjEFUVHjen0aLlQx9qf2WtRMmJJOgi8uiw=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by SEZPR03MB8094.apcprd03.prod.outlook.com (2603:1096:101:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 02:51:15 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 02:51:15 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "lorenzo@kernel.org" <lorenzo@kernel.org>, "helgaas@kernel.org"
	<helgaas@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Ryder Lee
	<Ryder.Lee@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Thread-Topic: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Thread-Index: AQHbMRw97PA6QAWRm0+g05S2U5zNfLKr8MeAgAALsICAAAOMAIAAr+SA
Date: Fri, 8 Nov 2024 02:51:15 +0000
Message-ID: <547216d36f8eaa313690ff8b52407ae46b8e9c40.camel@mediatek.com>
References: <20241107162136.GA1618287@bhelgaas>
In-Reply-To: <20241107162136.GA1618287@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|SEZPR03MB8094:EE_
x-ms-office365-filtering-correlation-id: b1483d67-f55f-4c79-cde5-08dcffa0365a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Kzg3NkRZYUo5QU9WemJ2ZjA4TFlzTGYyNVBkWk93MWFWVldKS0NoQVVScnpD?=
 =?utf-8?B?N09WUC9XUldPbSs2QzV2T05WRDJiVGhzQmhrU0o0VDh3ZTFNclVBdW9GM0FT?=
 =?utf-8?B?UzVnWEx4MGgzTE5VMjA4dXIvelhUMWtJNFE1MVlQM0ZRSUprVmJ3MjJlZFRw?=
 =?utf-8?B?clNHaUt1bzk1SytYMnRYbi84TUpSbEdoVGl6RWdVVi9mbE4vdFJINk1QNEpC?=
 =?utf-8?B?MEo3OVdnUTdLOW44dnhNYkpHMWtWZ2M4UVNhb0Yyd0hqdk1ab3FTemRja0gr?=
 =?utf-8?B?dmU0RTdjbnd6VU5ESmt6VlgvOW40MWhjZldYNGdFYXZuUkJYSkpibXJYRnFQ?=
 =?utf-8?B?Rlo4N3pnWnZtQ1lXMEVwWXpvV1FHSktnQ2tHWUswYitXWE1IeE5FdmthWGxC?=
 =?utf-8?B?eHZQUkVhUWRrOWt1cG9vLy9hQ1BjZXE1YjRvbHBBeFQxQzdTQ2dTZDRDVHJK?=
 =?utf-8?B?K1QzQWJnR016d0YxSzNqd2lLb1VFNmRDNGRSRjFuc1dtc1lsZUlzaXRvQWJa?=
 =?utf-8?B?Vnp0dE51ZjNKQkR4M05xYmMyTXdJM1NUS2dOYVkrM1J5ZzNtM3VqUnVsYTEr?=
 =?utf-8?B?RVRMbGRjeU9IQWdSU0FoYzY0NThxUGlDVmN4SEZ4RXllTkJaNjBoZjZKcUov?=
 =?utf-8?B?RzFsU25tNXFkSE14b0RWZmo4SWJWZDYvME9GcGtoMlB0ZXRac3Q3NnNPeGJ6?=
 =?utf-8?B?RGdIZ2ZjTUdKZjR6NHRySjRWTldkM3hJVGthOUt0WlRoWi9lNkNvNXVpaFhx?=
 =?utf-8?B?U2sxS2Vjam9FUUZhYndveTVtYjh1bGduWVZQRHB1VVQ2bkFPK1NBZnZIekJM?=
 =?utf-8?B?Tk9ZM1NJK05rOUdoWWdnY0QyV21UbjFyU0ZEajlmUjhVbm1VSW9IOHZGMVJM?=
 =?utf-8?B?K25YNk5zc2s2N28rc0xtRnMxZ1FmbXZkTXNRdzY4Ymc5c3lsRm5hS1pBOG9o?=
 =?utf-8?B?TEdXSDYrQSt0U2Y1S1JSd3ZMYy9wN1BJdkJINW1HVGpsQ21ScXEzeGwxT0wz?=
 =?utf-8?B?NnlJbm9vZHB3S2xWdUx5aDdOakY4blROc1E1K2l0MUx0VFpWTE5QZjZYRDhv?=
 =?utf-8?B?NnQ1UGh5TU8rZHZVckVJbWFHb0pQY1ZKVUtoYkJJQWVjK1UwakNMRTVWRVJQ?=
 =?utf-8?B?S0NUNjVGRUFIVnhyUTdJM3JEbFlkaFJRajlwV2dXU3pjVUxTRm16M2pmN3Mv?=
 =?utf-8?B?Zm83Z2ozNmFDalErbTFLc0MwaWFnZjNEdDZ3b1Y1TlE0OXR3aEpLbDVWK1BB?=
 =?utf-8?B?QUR0SHBCQWZ4WUZYQTBPcU16Y1UwYm9JVGdrMHA3VDdLckdVUStsZUtTRFZ2?=
 =?utf-8?B?QmNpUDZ1WWpzb084Y1R1TU5YS1k0anJBbFpxR1J0b2NwNXB1eHFmbWVhbEsz?=
 =?utf-8?B?b1RoQVhlQ2dCTDl3Y2hJRXdHalhOcnd6Yi9US09YSVdTbVBxRkNnYXpBUTNx?=
 =?utf-8?B?Nm9XekMxeGZ2TTdOdDlkVzRXUHpiS1A4cHVyVHFWK1FIbU1FVTd6K1Z4a3Vl?=
 =?utf-8?B?QkhveGIyTk9iQkp5dHFuTEJmT3A2eUVROWZ2d0swRmZFenJ4OFBLSWdMaTdF?=
 =?utf-8?B?bEtSREx4Tlc0cm9LOXh4WUZ0WkdzQlM3SUJSZFRKd3F6Uk50SDNIZ2VtbTNk?=
 =?utf-8?B?aWthMy9vWlNQNmFwalp0VjFHbkVyZFM1bkJNaDdOMG9HeUhwMjdaWXMxTzJW?=
 =?utf-8?B?dkZhbUFYWE1qNk14TU44TFVFMHZneUtPZVl0YzU4UjlBa3liSVptMUphcHdC?=
 =?utf-8?B?cjBKcktUY3JnU0lFTVZmMTZadzRxaVZPYm95TFRrYnZJNy9oTXA0Z25PeUhp?=
 =?utf-8?Q?SWvU4ax2DddooJtZy8D9QtAH6OlMGH7sQtnkI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WStLR254Nk9NTWJUd3R2aXhsQjVlRVRCTG9NYm5URWNXbFByMDJyaVF1VTRP?=
 =?utf-8?B?TmlEenRJNjhtU2x2QnZabmtvemNaSW05cnpEeWE0UTVqSjlwTmhOVmRkUVVa?=
 =?utf-8?B?amJBTzdHcHFDWmtKZ1E0QnhkOGhVcWlVUjhLc2JvMVBVMTdCT2NCYVlCcVJu?=
 =?utf-8?B?Wk5XTldmTnMrVkRsOVdtSUlDQ1huUDd3aEFta2hBNndacDgxMFdYbEJBMElZ?=
 =?utf-8?B?MGNkSUZhVDZ1WWNqK1M5azBCdCtwWGxLUVllRENGSHFrbTRTdysrc21JL2dS?=
 =?utf-8?B?RTNiZkMwOGd2eGphOEZWb3hqVnptQjE4K0M1RVF1MnE1Yy8xWCt2azRQbXA2?=
 =?utf-8?B?UkpucGg1YU9WSmpMUU9yTTdSOHgzTnFjYzd3akZ1ZHFrdWlHdUNOemRLaEd3?=
 =?utf-8?B?YVB1Mkw4WWxyU3ZsV2Z6L2Zhd09tYVRDNUhBcjk1aEVnbTlNSnh1OGRhL0Ev?=
 =?utf-8?B?dmJ4SDJ0Q2hHWHdHMllFWENMWGxwZXNacmF0UW5KdG9sNENBWVQxRmxWcENr?=
 =?utf-8?B?dEY0Sjh2bUFHWFRROUNvRXVkbXpnRjhSbkY2c0pwbE04MnRqL1dya2JPNmRZ?=
 =?utf-8?B?VCs5ODhvTzc2MkxmdHBXbk1JVkxWZi95Rmprd2hRQlJhODZ3S25SdVhBYjEv?=
 =?utf-8?B?UzgrS0NTa01ScE03NXZ6U0dMejkwUGFycWxCRlRmelExWURRMVBOUzNmNjRD?=
 =?utf-8?B?OWx4bGxRM3g5dWJCNkZOWHhNS1FSaitBNFlWYmsyNzlKMzJvVFlacE9wbzJq?=
 =?utf-8?B?UnRuNXY0S1RVRHJTWWpPczVQUFh4SFRXK29ndlMwRnQwYlh3UE54ellLUmox?=
 =?utf-8?B?aEhoelA3bWVSNFM1eTBxZEo4MG5PRTN0UUZFai9rMk11dHduTCt2b2RrcEh0?=
 =?utf-8?B?aFVFMFQwZFZ1NHlmM1ZDUUpTSCsrQzJYdlc0cG1UMjY2SlFLSDU2ekFsOFUx?=
 =?utf-8?B?R3hUUHY3dmNvVFNoNFhCVURYbWt6cnVCRDQ0L1Q5aGMyT1JGZ3Y4RkpRUFBQ?=
 =?utf-8?B?bGhyZk13WlNNY2o3VkxJL3hqSnJ4c2tBc3RaK2R1QW01aXhjUHl6ZFZXdENF?=
 =?utf-8?B?S2ZHWlNFaEJOZG5wK2MyTUJuUW1aM3ZCQWFyWWY1b2ducXByUC8reEROY1p0?=
 =?utf-8?B?Y2JGMUZHUE82OEZxclRhY0V4TUdPZkJOdjlrM25hWWNVLytuSGNrTnJ5WGdN?=
 =?utf-8?B?NGJ5YmRTSWdxL0lGb21kRW5qdGdoTUcyTHJGQXJwRHlackpRdDFTenZuaDRj?=
 =?utf-8?B?RXNkY2I2WHRWTWNJQUFFNlV1NnRZLzZxTDlSd0hLaWZSWlI5WUpoemxhaE05?=
 =?utf-8?B?SWhkTWo3bWtXWVFHVEJsOU1UUGdlcGVDckIxaDlZeC9TWnlFMEFiUXZVRVIy?=
 =?utf-8?B?cC95M2tkUzNXYnFxRHVjNFVGWGdQK1JPOXhNRFhTMVh0QWVtT3ZNTDJScWp5?=
 =?utf-8?B?dkMwSXRzWUFtUFZTb3dOVnl5R1pGOXFLdGd4TXROMnBtSFdTQWh6VWJOdWJW?=
 =?utf-8?B?ZzlJWDU3ekxIZ2ZEdlJwNzMrYThGQm5WUzVkWHBxZm9ubjIrWmZGRzQyS3ov?=
 =?utf-8?B?MFpWZHJiUktKYjF4MTJ5bXpZM3psNHpGNVZNM0lJamZUL0RhVm4xanNUNUx0?=
 =?utf-8?B?UW9Bd0p5ZUYzYzlWTXhwYTlGWFpMM1VpbFQ4MUhGWStSVXRUZ2cySWZkR3R1?=
 =?utf-8?B?d2VrbjM3ZzJibTRQeHBZMkcwYUIwRDFIUCtUZFFwVUJ4SFArRk02dnc2YTRa?=
 =?utf-8?B?MVJUMnNmM21XT0piWFJrbUlCclBNeE5PTWpUMWdZalJOQnErK3ZvM2dPS002?=
 =?utf-8?B?c1RoVmRRQWxRRENZMnZYa3pVbE5oTmhIcXV2aTlTNlhoeUtzY05xMXhwT0JZ?=
 =?utf-8?B?WEluQ1ArbFUwRlpUcjcreURYMEgzM3FYdGg1UWpCemFsRVJqT0MwLzVjWDl3?=
 =?utf-8?B?VXV2VjhXZUxKMkZQM2d6R3lBaDBoMUZidUdpTDhQQjJDT0F3d3BnaERleTZU?=
 =?utf-8?B?cTExRU5yUGJ2Nis1eWV2TG1ZVUF6bERQMm5lVG1HbHQ3VStCam1OZGZqVTFB?=
 =?utf-8?B?bjBOSUlBZ1JPTk9IeUw2QVVldXQ0TkRNVFRZRlNwZDZSTTJKOHIvN1Y3RERl?=
 =?utf-8?B?Q2tLU3RaYTdUcWJRQUpTaFhBc0JiNGd5UnpYQkk0TUViZFZrUVdITVV2czNm?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0839A7BF962B824791AA8CCE0072A762@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1483d67-f55f-4c79-cde5-08dcffa0365a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 02:51:15.1494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K67GaKeuB8InQKv4m0fGW3Ve0evafsExuowkfULc1RvPR6+hT4DB0oPc4xo+eyB3X4TNx8h02jm48YqjeK8pNhaUw47A08ys2xkatjmJmSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_185126_423285_E3A1E8D1 
X-CRM114-Status: GOOD (  15.47  )
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

T24gVGh1LCAyMDI0LTExLTA3IGF0IDEwOjIxIC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIFRodSwgTm92IDA3LCAyMDI0IGF0IDA1OjA4OjU1UE0gKzAxMDAs
IExvcmVuem8gQmlhbmNvbmkgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE5vdiAwNywgMjAyNCBhdCAw
Mjo1MDo1NVBNICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3RlOg0KPiA+ID4gPiBJbiBvcmRl
ciB0byBtYWtlIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUsIG1vdmUgcGh5IGFuZCBtYWMgcmVzZXQN
Cj4gPiA+ID4gbGluZXMNCj4gPiA+ID4gYXNzZXJ0L2RlLWFzc2VydCBjb25maWd1cmF0aW9uIGlu
IC5wb3dlcl91cCBjYWxsYmFjaw0KPiA+ID4gPiAobXRrX3BjaWVfZW43NTgxX3Bvd2VyX3VwL210
a19wY2llX3Bvd2VyX3VwKS4NCj4gPiANCj4gPiAuLi4NCj4gPiA+IElzIHRoZXJlIGEgcmVxdWly
ZW1lbnQgdGhhdCB0aGUgUEhZIGFuZCBNQUMgcmVzZXQgb3JkZXJpbmcgYmUNCj4gPiA+IGRpZmZl
cmVudCBmb3IgRU43NTgxIHZzIG90aGVyIGNoaXBzPw0KPiA+ID4gDQo+ID4gPiBFTjc1ODE6DQo+
ID4gPiANCj4gPiA+ICAgYXNzZXJ0IFBIWSByZXNldA0KPiA+ID4gICBhc3NlcnQgTUFDIHJlc2V0
DQo+ID4gPiAgIHBvd2VyIG9uIFBIWQ0KPiA+ID4gICBkZWFzc2VydCBQSFkgcmVzZXQNCj4gPiA+
ICAgZGVhc3NlcnQgTUFDIHJlc2V0DQo+ID4gPiANCj4gPiA+IG90aGVyczoNCj4gPiA+IA0KPiA+
ID4gICBhc3NlcnQgUEhZIHJlc2V0DQo+ID4gPiAgIGFzc2VydCBNQUMgcmVzZXQNCj4gPiA+ICAg
ZGVhc3NlcnQgUEhZIHJlc2V0DQo+ID4gPiAgIHBvd2VyIG9uIFBIWQ0KPiA+ID4gICBkZWFzc2Vy
dCBNQUMgcmVzZXQNCj4gPiA+IA0KPiA+ID4gSXMgdGhlcmUgb25lIG9yZGVyIHRoYXQgd291bGQg
d29yayBmb3IgYm90aD8NCj4gPiANCj4gPiBFTjc1ODEgcmVxdWlyZXMgdG8gcnVuIHBoeV9pbml0
KCkvcGh5X3Bvd2VyX29uKCkgYmVmb3JlIGRlYXNzZXJ0DQo+ID4gUEhZIHJlc2V0DQo+ID4gbGlu
ZXMuDQo+IA0KPiBBbmQgdGhlIG90aGVyIGNoaXBzIHJlcXVpcmUgdGhlIFBIWSBwb3dlci1vbiB0
byBiZSAqYWZ0ZXIqDQo+IGRlYXNzZXJ0aW5nDQo+IFBIWSByZXNldD8NCg0KRm9yIE1lZGlhVGVr
J3MgY2hpcHMsIHRoZSByZXNldCB3aWxsIGNsZWFyIGFsbCByZWdpc3RlciB2YWx1ZXMgYW5kDQpy
ZXNldCB0aGUgaGFyZHdhcmUgc3RhdGUuIFRoZXJlZm9yZSwgd2UgY2FuIG9ubHkgaW5pdGlhbGl6
ZSBhbmQgcG93ZXItDQpvbiB0aGUgTUFDIGFuZCBQSFkgYWZ0ZXIgZGVhc3NlcnRpbmcgdGhlaXIg
cmVzZXRzLg0KDQpUaGFua3MuDQoNCg==

