Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767DE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqFZZpm4TbWrFWlkKtchS2RX/dVUzmJpKjSOXCg3YWI=; b=IgSLyVBALvgGf1x4dQRo1DChTl
	cG68Wm0StGlO05OuWDRkI/5lG/7yInaTja+9LsARz9b7tzpriPWDqZUusPBflbOe2NDQhuGT44+46
	Cr0PvGrOfuQnqP+7DQIQxSXqMKnG2FXItlCNvqAsOCde22zLYFiMRfS96VLZhSh7L4HOYy1iSLJhm
	HQTBbBqc/HgMSTN1vaKjY6tKep4fExr5CNAUSR9YDNnlIZ+rXmi+BFAI/CYwwnlAufuH+NiWdpoiR
	xGSfSQr0IgpMPagE3PQGyWfxWPKzDKkZN6K3sjjyq69JXDbM2wKrWqhV2ewqzE7VcDEEO27u0w7Gb
	HiCnoclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYKQ-00000004Gxp-0wxM;
	Fri, 20 Dec 2024 08:25:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYJG-00000004GnL-48ZC;
	Fri, 20 Dec 2024 08:24:36 +0000
X-UUID: d4a2adfcbeab11ef9048ed6ed365623b-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rqFZZpm4TbWrFWlkKtchS2RX/dVUzmJpKjSOXCg3YWI=;
	b=UJGwAFwL7Wb/nDqpNTWqgBzzG6SqOG3gInsDHNNl2NNZRIObNfO1mnlb00++3b0MPUPbv//HxEjZ+8TrvrO9wK0yRwFPuB7+0XH+LKz20q/vG+FH6dSeveLUmhVNrtrpVE4siaFFCaKG5TJGutIRuCvKchqQFSjUoHN2ul4d2N8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fb90ff3f-7c62-4576-b09a-a2b884c1ba33,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b16eec24-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d4a2adfcbeab11ef9048ed6ed365623b-20241220
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1123919879; Fri, 20 Dec 2024 01:24:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 16:24:25 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 16:24:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzwkcRX+Fdh0PznrvKCB81uOht+wT7ACFR4m6UvavorQ4Q6p3HG+MmjWlKJWf1w7ARJif+1ThQmpCdxkhZCx+dkqPIlQNrsIhV1aaDwRTJ8UK2ZibjT6ppRMcPwj0mI5hU52aK3uOL2tIHjjczv2Fz6fwb1bGTGBXuBIsZD+A/ZNCbYeM7wHvt07csdzWEhHAgJ+33EYPQdTjVZaoxs/WMpDw05obyVFpRGgOb60eK4jx2Z5wmpqj06ayixyzF6GHdZmS8uHlsM+FzmIB26ivnAOlWCsOYvI9hcceB+AXxqVOT+4pd5fi5bAKi66SPMQkOXgXf6hqF/1DEwMuAJBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqFZZpm4TbWrFWlkKtchS2RX/dVUzmJpKjSOXCg3YWI=;
 b=b6Hoh7i5U+vzKZ74SJHp/fBrUKhyECGcrmXd6msrXptLQBwSewPM6MG0l27YBI/DIPdvkmMcvZnvohPFkIiqE3PpWCGwY+XwJCyitmA0zVaAaw8Oje0Pu8WnXV3tCLkE0xe74lJ9np0Bb9WzZXNd/EYgotx618dthXAUqNlYooGVIx4e0ROs2I1fG0JpglALOBwnYrDfCa/QHhMFxz9WlWHMY+IE0O7t3Zp6Rh0eN7f16MAVXcEoDgDoN3mmXLaukZjk0VmiQ6NH2OIUFgytJMRDVIuidVGISOS+B13F3cXyu7se2P7vHFdH9xjGHJqSXEVk2SQoCtJtfPxAo9EBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqFZZpm4TbWrFWlkKtchS2RX/dVUzmJpKjSOXCg3YWI=;
 b=OjOe1jLtUom2qH83wW4jaXAlVPhdlfwO9O9Pc268PkdDRPb2Rqxydsn+URLKssmAbk3A1zJNgGX0nKJStqXCWpK7e0zDH8jzdobwOVt8DO0hN0gU6NejYkHYwlbwSm8C0BO5/ea4El42CuoQXcAsbGgM1509Ee1RTwjkWoa1o7Y=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7651.apcprd03.prod.outlook.com (2603:1096:400:411::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 08:24:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 08:24:15 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 22/33] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Topic: [PATCH v3 22/33] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Thread-Index: AQHbUJqyFuCLLV4oqkOiGWWSy/SePrLuz+UA
Date: Fri, 20 Dec 2024 08:24:15 +0000
Message-ID: <2c65e6fbe42fb4d7491413b44daefd2af74c1579.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-23-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7651:EE_
x-ms-office365-filtering-correlation-id: 17939cff-8955-48f3-161c-08dd20cfb0b5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2I3djJ4NHZUSW5Rb1NpdUpOcUMzSVNFVVhXOFhXSWRQd1ZySGN4MUZkY2VB?=
 =?utf-8?B?ZUtGSHF3ekdEdXRTZWVQRFBOMjRNUHVTYjRKU2FiRDZMT3N2VlplT1hSKy9u?=
 =?utf-8?B?d0laM1lCZ0l0WjViUHNRZ3pmYWV2Zmt2bXRBT1JmakFCeUtZbXdXN05DYm1U?=
 =?utf-8?B?aGcxQW5tU21kajBCU29nRmI2TUw4bmFGNjJNVjE2bmdtditsSjByV04xbmM1?=
 =?utf-8?B?ZnBRUkJzQmIwSUtzZE9maXVmQWwrR1R0RFk5ak9DM1B3Tnh0akl2OVVVenQr?=
 =?utf-8?B?MXpHZkw1NDU3Y1hlOUZtaVBoY3hJYSt6SWdDMWpmL09FODJQWk50elpsT2JB?=
 =?utf-8?B?YXVibDRJR0FjbEtVSWtESnluczFFWFIwZEhOK0VCdFQ0YlhzbGdBNlZlRmRs?=
 =?utf-8?B?c0pseVZwN3htOUcwYi95bW9OWUVic3dXemk2bTNXODhrdEluR3RJRjBadnhq?=
 =?utf-8?B?Skh0bjlPWTlNczlpZGxSSlFSa1pPQVBzUmxBWnFRTDJoLzRpVy9LOFNvWFhj?=
 =?utf-8?B?REF2Z09tUzNjOHJPQWIyR2ZIcUF3OU8yRlRiUlljdm5HQUJJOHB3ZUU1YXdE?=
 =?utf-8?B?c0VnVDZWZ3J1dWNHMjJNVmFXL0FRWXd2Nnk3QjdiZEhocVJmeTdLeEdOSUZs?=
 =?utf-8?B?QlZkT2I5bWI2N1RwZ3NMc0xQOGNLK3RKNEQvb2xtSXhhV2FUVndRbG1xdU85?=
 =?utf-8?B?Umx5L2RReFYzdytzOFhXRzZOeFV6Wi91ZERRbWpyWmZadGN6SWJVd1phNkc0?=
 =?utf-8?B?REFUZkJub3czblJFdG9hdC9STkxKenNqa2gxTksrYmJOZUpBdDJJZXl6aVZM?=
 =?utf-8?B?ZGJZaHRnSGNGSlhMNnRQdk02QUpRSC82NEY5cURiVzJ4bUZWS0F5dlVPcm1S?=
 =?utf-8?B?WThvLytFVGNpRU1UajNOTUdQTElNUTF5Y080T2dpNmxzMy9zQWprM2ZpUjdv?=
 =?utf-8?B?YnZ6M3lBK2pTazhmd0dpcmxLUFltR2FaVHhpM2wzeFpIOVFRd2xzeFp6MzRq?=
 =?utf-8?B?eURrcGxWc052WDV5ZTF0WHFTTlpQQjYzcUxBS1NRTTd2OHVPMXRtbHRXSGJM?=
 =?utf-8?B?bEk2dWlwOHQrcU5iSVVNNjNRWFBqNTc0ZUllcVhVV2dYakVpWGMrMWx4RmQz?=
 =?utf-8?B?Y0wrczd6TEpxN1VPaTJuZjZ3M1VCdk8zMWpCdCtRcnYxRzEycUMwSjdlSHlW?=
 =?utf-8?B?TjZQczBUbTY0N3VxTEVTOFBqNU0yNFVGdzlqK1N0OXExa2hYQUJwdm80Q2pq?=
 =?utf-8?B?dzdkSE5VaUh5YVM0OUNMVFZLMlgwSlg4cUFyaEFheFF2cUhFcGI0WDByVU42?=
 =?utf-8?B?b2tONWg5NjNhSUVCcUJVSnl5eXhkQnM1YU9hOU5Jb2V0NU9oT2ltd2V5by90?=
 =?utf-8?B?VjBxNUM3OGxYSFpjcW8wa09oQi8zT00zMFhtVEYvcVFKVHFMdDZVcTdTMFd6?=
 =?utf-8?B?cUFnOHJ2YWlueGt6cUoxdDEwRUIxcVZla1d6ZmlkbU1OLzY0MWp6ZmUrQmN5?=
 =?utf-8?B?ZUljdTNjY0RuMlZpcGEyT09CWm4vNUwrbEhkQTEyam96MWxVMXNteGl4VGpX?=
 =?utf-8?B?UHFPK3BWUjR4UlFlWktiWmRNTGNsakFCeTc4RDgxMXZEb0cxZW80bmdrN01N?=
 =?utf-8?B?VlViVUVCTkFPSUl5NnMrNGtVNDM1QTVQU1VBbjRMZ3R2ZkNuUWY1Vm5QeGM1?=
 =?utf-8?B?N1lWTkkwR0tvVHhoT1l6azJqU3c1Z1dXSkFsRWNiemxCR0E1U0R0dW9OUkxi?=
 =?utf-8?B?dkNkR1FSc0dWRTVzZUw3ZWFGUTJFV3hHR3BYcDdsb2k5UGxIK2x6VjRHM3RQ?=
 =?utf-8?B?cWxNR3VVYlVEUVI0R285TjdOU3FSeXFVYUxjUVlURXFNSDB0NU13WmVFdG1E?=
 =?utf-8?B?QjdjcjEySjhtT3MxUDZKSllEbStEcTFGVlJ3K1hVRkt3SUwrQnkrNCtWdUJm?=
 =?utf-8?Q?FyxcPUL4LLpXhLrZmkYLBuLZeHEQCF60?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhhaGdFSDVDZDNwWHMwbStFL0NOa1Z5SllQN1pUN3A2bjIwTjBiZjFJaU5E?=
 =?utf-8?B?QlYrSlZyRmJKYUNUUWYrWlNyM3BUa0lBUEc5c0xLUmpxQ2xhbTc3Y3kwa2hy?=
 =?utf-8?B?QXNxRXp0U3ZOV2loc29GTnIwSmRsVUNmSVRXbWp5cWM0dUZaTU16Q3RlaVZF?=
 =?utf-8?B?ajBGSGR1blM1VWttRk12VXZqK2IrY0hwemxhWXk1cHZWMEI1VSt2RWV2cXV3?=
 =?utf-8?B?N29sWEZPUXMwanFKSDFpZW9VdnJWZTc3WXhyeGlacUQ4c2pDVUxIUEJMR1dK?=
 =?utf-8?B?NEhyeGhQS3h0MnorYzZoUkNEd1pZa0N2aUc4UTMwcERCR1dObzFZdHZ2TTJj?=
 =?utf-8?B?WUFmdlB1cTRVOEVRTVdIUDZKNnNRQ0lycThEUU96R1h3YVZuS3hjWlFLRHJP?=
 =?utf-8?B?RTAwZmlvbldCclh1NG5NR0c4MXYrdkV4amxlM1hidm80UDJBb1kya1FKaVlZ?=
 =?utf-8?B?dUw2STQvVUpHdWtiUmxoWkhxWFljeDhiblh5TXZXRDBnYTNEcG13R1ZjU21Q?=
 =?utf-8?B?dks2OFE0YkxEeW1KeHdrZlJWKzhkbG5Gc0N1cW5hcGh6RHBmenM4dWJxSllV?=
 =?utf-8?B?bDJNS01nMzYzR0hZdHNJRklRWmtHdFZmWUlnSEdLVmdKY3hJUlVQRUk5RE1k?=
 =?utf-8?B?bUcrY0xMTmxvUXZKRDNCOTJ1RXBiNCt4ckhteHhwRW90a2hkSnh1RUJ1eHgw?=
 =?utf-8?B?TlFjRk93WW43NUtOTTg4M0ZnMzFXU3BBQ3p5TWYzTEg1WnBqNGdqVytldGda?=
 =?utf-8?B?MHJtMlNCVEJJVnJ4bkt5aXVhQ01peWhiU1FPenFOU0VRcnFkZXFzcjl5QVNR?=
 =?utf-8?B?VHNVZm04OG1XelZDMDFhUTM5Y2dLT3EvWlZXUmlxQmJ4UFAzRGRMYnI4Qklu?=
 =?utf-8?B?bUdMbElZalRxWUZyVmVwd091c2xEZEQzbXVneVlyMDVEMDRDNVUyaDRLQksr?=
 =?utf-8?B?UktsZWEyQi9PeG9PaHlrdHVDclRWU1FOMkpzK3VmQjQrOHpWYVk2TVUxb2tF?=
 =?utf-8?B?V2t1MFNHYzFLUTVhQWV6MllSa2dZREE2OE0vU0JhRVpITnE3Y1BNTVFJQ2M4?=
 =?utf-8?B?MDY2V2RuUHUrV25WN3Zkdm5aSlNHSVZRZnlNMnpNa2NFYXl3Qkg3TGd1UUNq?=
 =?utf-8?B?UEFzcUdZaEFuZ1dFam12LzNsQlJhTmNKY1dmckdpamxhbzQ1WUNvQ09aTURJ?=
 =?utf-8?B?cDJQcnQvVnpwMFV2RnBuOE43RlBVejhTbXRBSUZ6V29yMlBhbjN6dWlxRDQw?=
 =?utf-8?B?ZytPYks2SmJQeGpGeTJHTXcxd055ZnJTUDF1aksvRW9NczNUakZSZXRWOHlk?=
 =?utf-8?B?cDM3WlJHQTFxRTNkV2xkb3JlWFVFVWZTSERTd2VRN1U5eU9LakFNcW5mb1BK?=
 =?utf-8?B?L2FEWWlzVGdmZHo2WVFZcHVHaE1ldUdLWDJac2xHOWxiM0xHMVk3Y2pXWW1m?=
 =?utf-8?B?SjZhZ1h3VHBzckYvQ25BRFV2QjlqRk94bzVNN3RqZ0dWejFQUWZWVGRldzV0?=
 =?utf-8?B?aE5Zc3orVHZUbzJhc3dhalhlNm5UZmt2NVMwTTB4SVU2Wi85MjdzZ2N3SHhh?=
 =?utf-8?B?elJTeXpGM0tLUGg2WFdiZ3ZaYjd5TVQreU8yMy9BL29oUXBCS3ZVVXJ1bUJv?=
 =?utf-8?B?UnJlNGpNUWFTYmJsT3NmbHEyVlFTT0pjcTVnODMrMGN1dG0zRW5JTHI5Yktz?=
 =?utf-8?B?dWhjTkVxT3ZiT1duWHQwRHlQSkZDVEIzZ21oaEk2Z3FDd1RIV0pObmhJUUFk?=
 =?utf-8?B?ck13bXdFamVGd2xmMElCRmx5eWVMS1k1NXAreEVYdkdyKzRSOUIySmppKzFZ?=
 =?utf-8?B?bkw4Qzhqc1lYY1RlLzNWalVueWl6TnkrRHR3cG9uVFYwQzBnd21sZko5c2I1?=
 =?utf-8?B?TGFOQXVtYTd4RFFFS0hJL2VwYWFjNjNYbjBRUW1jNjRTNytveENENEl5b0d5?=
 =?utf-8?B?eXMzL2JmYWJxRXExUDU3b29oSlI1RDRkeGV4L3JiYmthY1JUQVdxaHF4STJw?=
 =?utf-8?B?TXE3Y3l2WXhvV2tqNjJGeCt3MWtGR1N6Umt6eENTVk1KY3dwNmhNT2F5aHdW?=
 =?utf-8?B?N2Z6QldBQi85N2pUZ3BHb1RHOW8rcGRlYmFtUHJ6SnE4QVNXL2xvUklmU05V?=
 =?utf-8?Q?JmWuzOJ1Je03rNCf2HudVgd7S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <390A753F27EE96469C822123296F882E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17939cff-8955-48f3-161c-08dd20cfb0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 08:24:15.1420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9/gmnFtybV2qQGlWX/w0CKKWxhm/QoxyfI52yhksvQZnOrkRmWTasodbDvNpNhYUejZ5l79PTr+Wf3OdXeBCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_002435_036881_3607CC65 
X-CRM114-Status: GOOD (  17.45  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgbW92aW5nIHRoZSBjb21tb24gYml0cyBvZiB0aGlzIGRyaXZlciwgbWVyZ2UgdGhlDQo+IGNv
bnRlbnRzIG9mIG10a19oZG1pX291dHB1dF9pbml0IGluIG10a19oZG1pX3JlZ2lzdGVyX2F1ZGlv
X2RyaXZlcg0KPiBmdW5jdGlvbi4NCj4gDQo+IFdoaWxlIGF0IGl0LCBhbHNvIHJlbW92ZSB0aGUg
IiVzIGRyaXZlciBib3VuZCB0byBIRE1JIiBkZWJ1Z2dpbmcNCj4gcHJpbnQgZGlzZ3Vpc2VkIGFz
IGluZm9ybWF0aXZlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDI4ICsrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXgg
M2VjZDBlZDU5ODUxLi4yZDVjZjczNTJlZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jDQo+IEBAIC0xMDI1LDIwICsxMDI1LDYgQEAgc3RhdGljIGludCBtdGtfaGRtaV9z
ZXR1cF92ZW5kb3Jfc3BlY2lmaWNfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4g
ICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IG10a19oZG1pX291dHB1
dF9pbml0KHN0cnVjdCBtdGtfaGRtaSAqaGRtaSkNCj4gLXsNCj4gLSAgICAgICBzdHJ1Y3QgaGRt
aV9hdWRpb19wYXJhbSAqYXVkX3BhcmFtID0gJmhkbWktPmF1ZF9wYXJhbTsNCj4gLQ0KPiAtICAg
ICAgIGF1ZF9wYXJhbS0+YXVkX2NvZGVjID0gSERNSV9BVURJT19DT0RJTkdfVFlQRV9QQ007DQo+
IC0gICAgICAgYXVkX3BhcmFtLT5hdWRfc2FtcGxlX3NpemUgPSBIRE1JX0FVRElPX1NBTVBMRV9T
SVpFXzE2Ow0KPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX2lucHV0X3R5cGUgPSBIRE1JX0FVRF9J
TlBVVF9JMlM7DQo+IC0gICAgICAgYXVkX3BhcmFtLT5hdWRfaTJzX2ZtdCA9IEhETUlfSTJTX01P
REVfSTJTXzI0QklUOw0KPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX21jbGsgPSBIRE1JX0FVRF9N
Q0xLXzEyOEZTOw0KPiAtICAgICAgIGF1ZF9wYXJhbS0+YXVkX2lucHV0X2NoYW5fdHlwZSA9IEhE
TUlfQVVEX0NIQU5fVFlQRV8yXzA7DQo+IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gLX0NCj4g
LQ0KPiAgc3RhdGljIHZvaWQgbXRrX2hkbWlfYXVkaW9fZW5hYmxlKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSkNCj4gIHsNCj4gICAgICAgICBtdGtfaGRtaV9od19zZW5kX2F1ZF9wYWNrZXQoaGRtaSwg
dHJ1ZSk7DQo+IEBAIC0xNjE3LDYgKzE2MDMsNyBAQCBzdGF0aWMgdm9pZCBtdGtfaGRtaV91bnJl
Z2lzdGVyX2F1ZGlvX2RyaXZlcih2b2lkICpkYXRhKQ0KPiAgc3RhdGljIGludCBtdGtfaGRtaV9y
ZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgICAgICAg
IHN0cnVjdCBtdGtfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiArICAgICAg
IHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFtICphdWRfcGFyYW0gPSAmaGRtaS0+YXVkX3BhcmFtOw0K
PiAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX3BkYXRhIGNvZGVjX2RhdGEgPSB7DQo+ICAgICAg
ICAgICAgICAgICAub3BzID0gJm10a19oZG1pX2F1ZGlvX2NvZGVjX29wcywNCj4gICAgICAgICAg
ICAgICAgIC5tYXhfaTJzX2NoYW5uZWxzID0gMiwNCj4gQEAgLTE2MjUsNiArMTYxMiwxMyBAQCBz
dGF0aWMgaW50IG10a19oZG1pX3JlZ2lzdGVyX2F1ZGlvX2RyaXZlcihzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ICAgICAgICAgfTsNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gKyAgICAgICBhdWRf
cGFyYW0tPmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiArICAgICAg
IGF1ZF9wYXJhbS0+YXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsN
Cj4gKyAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5QVVRfSTJT
Ow0KPiArICAgICAgIGF1ZF9wYXJhbS0+YXVkX2kyc19mbXQgPSBIRE1JX0kyU19NT0RFX0kyU18y
NEJJVDsNCj4gKyAgICAgICBhdWRfcGFyYW0tPmF1ZF9tY2xrID0gSERNSV9BVURfTUNMS18xMjhG
UzsNCj4gKyAgICAgICBhdWRfcGFyYW0tPmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9D
SEFOX1RZUEVfMl8wOw0KPiArDQo+ICAgICAgICAgaGRtaS0+YXVkaW9fcGRldiA9IHBsYXRmb3Jt
X2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSERNSV9DT0RFQ19EUlZfTkFNRSwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUExB
VEZPUk1fREVWSURfQVVUTywNCj4gQEAgLTE2NDAsNyArMTYzNCw2IEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfcmVnaXN0ZXJfYXVkaW9fZHJpdmVyKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+ICAgICAgICAgfQ0KPiANCj4gLSAgICAgICBEUk1fSU5G
TygiJXMgZHJpdmVyIGJvdW5kIHRvIEhETUlcbiIsIEhETUlfQ09ERUNfRFJWX05BTUUpOw0KPiAg
ICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gQEAgLTE2NjksMTEgKzE2NjIsNiBAQCBzdGF0
aWMgaW50IG10a19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAg
ICAgICAgbXV0ZXhfaW5pdCgmaGRtaS0+dXBkYXRlX3BsdWdnZWRfc3RhdHVzX2xvY2spOw0KPiAg
ICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGhkbWkpOw0KPiANCj4gLSAgICAgICBy
ZXQgPSBtdGtfaGRtaV9vdXRwdXRfaW5pdChoZG1pKTsNCj4gLSAgICAgICBpZiAocmV0KQ0KPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGluaXRpYWxpemUgaGRtaSBv
dXRwdXRcbiIpOw0KPiAtDQoNCkkgdGhpbmsgd2l0aG91dCB0aGlzIG1lcmdlLCBtdGtfaGRtaV9v
dXRwdXRfaW5pdCgpIGNvdWxkIHN0aWxsIGJlIGNvbW1vbiBjb2RlLg0KU28gdGhlIHJlYXNvbiBp
cyB3ZWlyZC4gVGhpcyBtZXJnZSBsb29rIG5vdCBuZWNlc3NhcnkuDQoNClJlZ2FyZHMsDQpDSw0K
DQo+ICAgICAgICAgcmV0ID0gbXRrX2hkbWlfcmVnaXN0ZXJfYXVkaW9fZHJpdmVyKGRldik7DQo+
ICAgICAgICAgaWYgKHJldCkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgcmV0LA0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

