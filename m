Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1FBE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBzN3aPCcCyTCxNL9ljzH1wHBYqL8v8K6gZmFMrB+40=; b=d3gVMh8gnpa51v2iLwSYv20eNC
	WopotRZC6/QJGBX6b8spvz/d/V3PMEAowyZvEEY4GWqZilbezJE3ysyE6A7TTabLlUZ+Ecsz0Vd6v
	/pVeGniyEX8QM60lBc+d1q+IbfU66FETye4kIzN/2N28yWHYkGiAbYMWWfWDUepJeuxCyaGU2wc/F
	x1WBSUBe9bGfECQH/wpZHGl+GrJFivMLJtQzMyMocNyeESjyYRe8hI/SOGMSckqXIeKoDPDdVrdAg
	WjNDr5SERjLqh3ggQ3jObkp+V7zsHsVUwHjVGUQAtD+VSnHoR5EI1xPoEbKPD3upNVYl2paKHQ1Mp
	UAYdd5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPerI-00000009fG2-2XwA;
	Mon, 23 Dec 2024 09:36:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeq7-00000009f9Q-31Rr;
	Mon, 23 Dec 2024 09:35:04 +0000
X-UUID: 2c38b05ec11111ef9048ed6ed365623b-20241223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VBzN3aPCcCyTCxNL9ljzH1wHBYqL8v8K6gZmFMrB+40=;
	b=UbtvPR9tx0laVojY0Eaorsgd62uM7Z3jIkQPNJA+5ILpmoe0z7PQxF02npK9oP2/9g5yhNfpLV13ZhZvzVe4TxHFsl1xDkMl3fWTOxOUsfY8laMQhwUWhIHnPRpe45AE3DX3vT4hypcrod543An6SH5HbUDaQ89FkfzpsMR63GY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4982b080-8484-4c4b-aa98-fcd5ab4bf9ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c269ba18-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2c38b05ec11111ef9048ed6ed365623b-20241223
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 966706573; Mon, 23 Dec 2024 02:34:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Dec 2024 17:34:54 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Dec 2024 17:34:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pq1CkDM0ahQ95bBdx2Mcsbk+3tX8bK33wOmjo/T2Hyl5U6Mgr5uFxMVMZcFUw7K2wdgfhmp7gp/3kdgE2iDXCWOYTCrEVJPy9LMB3hKKHvUq7z4fsUsdBYvx8mpaJfVYM+A7gdofiQNnRvYRtvrwXiSd95xSZ+7rvJsBDm193uXTfzrLzK9XjNKUsL5VK9zoVb61KPEShh5f8zy+4Dnt4G5VxVuz8yHdNKsBCaPCzjA6gAblpv5vXC3/VZO23u3rO78Uc4zef2FmrPaMDi8iA1ixhzRh7WGHWuVsLmHnLM3bG91jW6wo2zF5kbqsm5ymxj3uWi3s9ejwa9OWI0PlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBzN3aPCcCyTCxNL9ljzH1wHBYqL8v8K6gZmFMrB+40=;
 b=oCdwxt8qdcs8na5x9Om4n2Y3j/7IbFALP/eu9Frq0zcYNpR04dvBMkCf5mB8PC423JbDjUal5Lo/ilMocLzSj739nDVsEcjkHaO8zZktAbrk/SfyhOrl/hhJlutJ+XY8dove48QdIeWGVWneQxGsVkrKTWaikN4VuYawXnysWXKs62S8NeYU52aLJZzriZOr51zK3KH+y7xe0YT0xZ0rXbDHuX5s9UocoHFd1ZoYU1r34HEEnjdwhG3QdXaAhiv9LovNOSVXyKyhJXf+pJb3LaMHNMy5TpU63eGxRYPu5ZCNW3UZxUBZhhRhkLnrMlmT7XJPYAnsjJhzBOFUlRjYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBzN3aPCcCyTCxNL9ljzH1wHBYqL8v8K6gZmFMrB+40=;
 b=vljo9yzaoMssx3SXVLTAqn8qk/JOMB9pyfcIn5xg8vHapJTeu1aj6t4Ggd7nz7lMZycX3qFFBTHdHKgmHXMDDboiHCWGtoXVDR+WPsxfhyLMEzNyMzg4gvDczS4toDZy72CaFpnIFwi0RaLvbg4ryTu+9aMPTNODfJZg3LfbvNM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7452.apcprd03.prod.outlook.com (2603:1096:400:430::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 09:34:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Mon, 23 Dec 2024
 09:34:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "fshao@chromium.org"
	<fshao@chromium.org>
Subject: Re: [PATCH v4] drm/mediatek: Move mtk_crtc_finish_page_flip() to
 ddp_cmdq_cb()
Thread-Topic: [PATCH v4] drm/mediatek: Move mtk_crtc_finish_page_flip() to
 ddp_cmdq_cb()
Thread-Index: AQHbS396JmDCuvsPwEKAwqfYT8pmRLLzpNWA
Date: Mon, 23 Dec 2024 09:34:51 +0000
Message-ID: <cee38f690b71d9a5ebfe749bf31d473ef2a9e716.camel@mediatek.com>
References: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7452:EE_
x-ms-office365-filtering-correlation-id: 683fde16-9c8a-4a38-8811-08dd23350d82
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VE9TY3Z3MnBIdG5hYk01Y2FhU2xDYTN3QmFZVmNBbTZvRmsvNFhBaURlZFVW?=
 =?utf-8?B?Qmo3VG0vT2dRUHdQSGw5YXV3T3dwdXcvbFdSYk9Ibmp6ZncvWXdoVmczY3lE?=
 =?utf-8?B?YWt5Y0tQUHd6d0pVc09mZ0xBcTM2bkszaUFJVTNqa0RvdVVIWit4RVpQam12?=
 =?utf-8?B?V2s0dU1FdjBqeGU2T1FDS3hCcXZFUm5KcU9md1daVUhyNWRUVTdXNVNkYmNo?=
 =?utf-8?B?NFBvdEgzaEIrcmRCQk1peFlqWC9TZjR4TUpBcEN3OVVORFQ2VStmUVZFVUpK?=
 =?utf-8?B?SjNEeXNmWjdHdjAvVWprUWF0STNqbXFkSVJTUW9hbnVBbUVkOERoUDlBRnBr?=
 =?utf-8?B?Q1hoUmNIQ2l0L3FMeC9vK1NNdmlWenVLSEpXZzUxc2UvWmd0MXRGRHV0ZnU3?=
 =?utf-8?B?NERhcU8vT0xEYVp2TWdORzhFM0lRWjRwdDhDQkVHbVY0NmlUd1JKYzl3UDVo?=
 =?utf-8?B?cFJhbFJIa010QkJmcnBaSkYwbXUwVjFkNUx2dTc4WWJBcjBWdTMxaDB6bnpw?=
 =?utf-8?B?VWxBOEdleEl2ZGcxa2UrR1NwRElZNlVkckE5THordng5NmVZUlJlNkx4U0tP?=
 =?utf-8?B?STliRUFHdFFEODB4MTZLSHc0MldoNHIxR3lhQk1DUUNiTHdlRkJoTWRORmhz?=
 =?utf-8?B?VnBja00wa3pIcGNXRkZnRUpBVEtQQm1CMlFqZG8xU1NCbXQvSHMxT1J4cDZi?=
 =?utf-8?B?SjBXMzhhSHRSbE9GV3IvUC9LdmpTT0hNa0dFTU40Qk93QTdMdGNKVDc5ZkNw?=
 =?utf-8?B?TmgwMkdYWXM0YjF6NUplVWVpdkdXZ1dDY0hGTDh5UTRoeFpPZzI4ZjJ4c3I5?=
 =?utf-8?B?VEl5dnUveXdoQXk1WHgrQUFwbzlPUkNEaThNUGNPNG9WSm41YWhQNUhVMHUy?=
 =?utf-8?B?L25uNWhFdEthd1NSMEVLNUE3N3NYSHNyeFJLaXFlSjVaN05FQnpQbmpNaU9V?=
 =?utf-8?B?Y2VFSURhQ2xmRUZRVlpmS2JsUkZ5WHhLcXRUejVMRk5idktxUHlIM1A0dDVp?=
 =?utf-8?B?eHdkT2RZRWtoRkxTQWoyLzNscHpWOGtwUGhFYVErRnpXL281TXo2Nnp2djZn?=
 =?utf-8?B?MDVYRnhBUlJjSVJ4VnJIQXlHZDVjWnNtbG9XN21vcGVoZE5CVmtETXdRTm5t?=
 =?utf-8?B?a2ZuNXJ0Z1ZoeUt4eVpWS2pnNk10VGRPVGIwZVE4ZHpvNjRhU016cWhlWHVn?=
 =?utf-8?B?QnIvbnplTzBZdVpkRWw5c2xmRDU3SXF1V0IxcER6WkMwdExXRXNGendmOHNT?=
 =?utf-8?B?NmFldUxGamgrOTFSV3NOR29VVVF6ZWJOUG5LMzA4RFR6aVBDTWdWajFVLzBR?=
 =?utf-8?B?WjRLUHNFcFc3aWlpWkc1N1hKY044SEhERS8rekZVN1BjeGVUMHFQQmZpekoy?=
 =?utf-8?B?NDdhWjU5VW1BKytqV1JhZkJZbjYyaDJmaXpNYndRV2doMXdZWEsrMEdCVjQ5?=
 =?utf-8?B?Q29zSStZR1B2OU9FbGh6TTVtWjVrNkR2a0E1MmNVN2RsN3lTc0p5dnlpV2Jp?=
 =?utf-8?B?ZGVvV3RJYWhpV1JOSy94Tk5CT0ZLcThEVUkrV0hwVy9ZTkdhZlJhWWhrbEVK?=
 =?utf-8?B?Y29HVTFHUVBTRkNjdVFjTWpzR2NUTWJuVGYySjZRRVhRcDVxa1hhdHZrZm5L?=
 =?utf-8?B?QStxcGFoK1piQm53d28rUTg0N3BuT0YxV2FJYXhjQjFmZUR2aXNoMGRheEtu?=
 =?utf-8?B?Zk5WMXBKM1hqSnlXR215dGpCMWQ5K2xRUlRyczFOazVxNllOeThGM1J5Rmp5?=
 =?utf-8?B?ZE1RWXFoMUNidXZwMHh6N05rSFZyVEI0UTFraXhYM21aNGtDdnF3ZG4wOVdn?=
 =?utf-8?B?bTJ2aFJjZXdGcWxEbUlqK2ZvTkluaUVReWQxc3Y4RnVybUx2Q0FScCt4dHdx?=
 =?utf-8?B?aDJ3TW9jOWI4UE5wVlcvV2IvbWZaR1k1MDVacXJrVWlIVEVhQ2diaURXeHY1?=
 =?utf-8?Q?0TNvvuqSa307+YFvSe7G2HVdMqebRUqY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlJGRnFPeXZCL21ocVJQRU9la21YVk0yYjJTRVIxT3VaUzNHeVhjSGF0cWZK?=
 =?utf-8?B?ZVNBZ3JvR01NTEptQ2h0RVE4UmtYRGV1SS9yRVhyNmxzSlFNZXpON2NwUlMx?=
 =?utf-8?B?U0NJTGlTZ1JSK0U3MnVVbVZiRzY1TkRlS0I0TThjTm9pYUFKQittbVp5SGFj?=
 =?utf-8?B?emVTY1BSMFV0U08ycnNMYmFic00zQWVCbUNxODNCQWF3cWpBWU13bEV1elJC?=
 =?utf-8?B?OGZJbGFNNGRYYzNqeDVjWUt5M0hLc0lpbzB5WFFpSnNqc3ZMVDQrMjVqUzMx?=
 =?utf-8?B?ODF6TUYzSGpDRDNwSStpMnVjcmV0Rm5TNzREQmdOSUo3REwxTHliaC93VGo3?=
 =?utf-8?B?MWFGeFhWSHF1WXZnQkcrTHVFd1hsUmp6STFmMUtZRDd0RHpuNTNyWEpKaHBo?=
 =?utf-8?B?YzFaS1I0N0VFQXNrYzlyTzhNOWZwZHpRMUViYzFzd09RbEdaVkkyVFJoeThO?=
 =?utf-8?B?MDM3Mm45aW1Pc1FwQ2M5ZDZOYlJqcFlRSGxCNXhaNWVRMjJyc2VsTVNLanpV?=
 =?utf-8?B?aUZIa1FHTDhEVGhUcTMvcUF6YXpGNDU0YU5rSThTZmJXa0c5OFF4aThWZi9q?=
 =?utf-8?B?SWdaR3JPQ0Z6RUxJdVVFaC9XUzUzZUNWVlQwcXNaR0ZxRmVUQjgrS0lXOGxv?=
 =?utf-8?B?cUR0ZjRpajJ1RGNiYnBSZTZCUVFBYWRpL3E2Yzg5QWhlRnJ3Q3QvMFcyUWlR?=
 =?utf-8?B?Q1dXVEhQbXdXaTVXaEhkQzl6VnZldU5GRXVHQW5xZkpJU2dsVWJiZjdJSWVP?=
 =?utf-8?B?UmpWYXJZUDN1Y2tOVWMrTnJpbTZDVkl5SHhBaFl6TzhYRWtmWUpoU2lIWG9V?=
 =?utf-8?B?c250YjhtaTNmNFNFRVk3L01xc3FBZkt3bVU5M3hTZVBmZjRiRnlTbXBBZWVh?=
 =?utf-8?B?SjlQZ05ReDhuMzZVUUhsR0xJelZhZFNBR0g3eGYySVlFbERiNG9Ka1MreTcv?=
 =?utf-8?B?SEkwN3JqSEpRTUJHbjRyZHQ4YktWa3hpNGtIWjFrenpQeFhkL3ljK0ZxQlRq?=
 =?utf-8?B?c2lHNHl3V2tYNmEwSE1rSVNTT2wyOGpSR09nV3N5S3owcjJDWkxObXF4WlZP?=
 =?utf-8?B?ODRmRCtHWTFVQ0NmTDl3ZXdFa2RRVCsxbGZJV3lDMHlnQ2ZNZUJHUWNuNWph?=
 =?utf-8?B?Q01vSWc3RzY4SGtkaWZVUUFpSlNQb0hTTEsvZFdLeGpFQVVoRy9ucmFqZDls?=
 =?utf-8?B?Uk9iN0pmc0ZDdnRKL05uK1ZXWG00L3Rwb3VpZC9tazhzRUx5ZzliS3Rva1Aw?=
 =?utf-8?B?Nys0NWFZUzQ4M0xJWlg1SHpBOG5KUVU0L0ExQmQvWXIrOHhPeHRuSktBY1gx?=
 =?utf-8?B?QlVMcXdEcUZXUks3UE9qQUkyY2VLdGcwUnR1RnlHbjZzUEticHE1T0FDbC9F?=
 =?utf-8?B?M2U0T0JxTjNoR29Ga0dMV1BMcWtOcUNVdEt5K3NaVXdrZE9ncVlvcjlFRXMr?=
 =?utf-8?B?N09YZkFDVHpjSTRISWRzZDFnWjMxZzMxNGtSaHl0WFVKTUcwZXFRMWlXeEpo?=
 =?utf-8?B?REp1cEFFa0Z4UG1RVldzbFBpUDh3K01oYjFGWVFyTWpQZE51TGFsYllremhk?=
 =?utf-8?B?S2FuaUI1aU9Zc2tUZlRsZnBlTzY3Y0tmaHRrNnhidU41dHdKU1UrVGtqUXZp?=
 =?utf-8?B?VVJtOWxIS0R4eGhmNDhTclJ5VTJVeHVRQmF6UWg1RTQ2L0VudmplWmJpWVZJ?=
 =?utf-8?B?V2M4NTJIUlVmUEtrRzhMU0dqdVQ0UDhSNitzU09yUWNXbmxkeTVMcVk0T090?=
 =?utf-8?B?ZDNJODBVY2NGaXRPZm4xTm1scmQwUmxXNGVVMTNSUngreTdHOEVvaWpmZEIy?=
 =?utf-8?B?Z1FDQlJMeXBqZXI5ak80MXJXTjdod01xVTRuaEdlSEN1cDQ4NWJPMG1Db1pK?=
 =?utf-8?B?YzB1U3FDbjZweGZWSkFBUEFmTHFJbEpYNFJnK3k1VVYwek9BV2h0WGxqUUQz?=
 =?utf-8?B?QksyT1EzQ2duQTNqRmdzcWtCaUM2Mk9UZTExeFE5YzJVam9ibFJ0TTRZc2lm?=
 =?utf-8?B?ZUZpQlZSS2R0MjlZaXBkOEkvZ0szbWh4UWVBQy9TODZxa0N0TzZHSEFjblh4?=
 =?utf-8?B?djJ0WXRrUDB3TkJZUmtEbGR0NjNRQ2s2V2J5WWFtM3Jyem1YOVlzTHlTQS9n?=
 =?utf-8?Q?ZeyJBmSXLDFTb/EnkK02bLqOr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <858CE28D5ED78D40827B1D317E91A5A9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683fde16-9c8a-4a38-8811-08dd23350d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 09:34:52.0030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o5OPvMUMwUxfrICu8nOg2nMmj3g9ihMZu9GoWzjvuYFunJhDZoDFs/0rveslJe0kRfvuY1PDxWBPiipNdhLsCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_013503_807447_AC41D8B0 
X-CRM114-Status: GOOD (  19.17  )
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

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjQtMTItMTEgYXQgMTE6NDcgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gbXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpIGlzIHVzZWQgdG8gbm90
aWZ5IHVzZXJzcGFjZSB0aGF0IGENCj4gcGFnZSBmbGlwIGhhcyBiZWVuIGNvbXBsZXRlZCwgYWxs
b3dpbmcgdXNlcnNwYWNlIHRvIGZyZWUgdGhlIGZyYW1lDQo+IGJ1ZmZlciBvZiB0aGUgbGFzdCBm
cmFtZSBhbmQgY29tbWl0IHRoZSBuZXh0IGZyYW1lLg0KPiANCj4gSW4gTWVkaWFUZWsncyBoYXJk
d2FyZSBkZXNpZ24gZm9yIGNvbmZpZ3VyaW5nIGRpc3BsYXkgaGFyZHdhcmUgYnkgdXNpbmcNCj4g
R0NFLCBgRFJNX0VWRU5UX0ZMSVBfQ09NUExFVEVgIHNob3VsZCBiZSBub3RpZmllZCB0byB1c2Vy
c3BhY2UgYWZ0ZXINCj4gR0NFIGhhcyBmaW5pc2hlZCBjb25maWd1cmluZyBhbGwgZGlzcGxheSBo
YXJkd2FyZSBzZXR0aW5ncyBmb3IgZWFjaA0KPiBhdG9taWNfY29tbWl0KCkuDQo+IA0KPiBDdXJy
ZW50bHksIG10a19jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAoKSBjYW5ub3QgZ3VhcmFudGVlIHRoYXQg
R0NFIGhhcw0KPiBjb25maWd1cmVkIGFsbCB0aGUgZGlzcGxheSBoYXJkd2FyZSBzZXR0aW5ncyBv
ZiB0aGUgbGFzdCBmcmFtZS4NCj4gVGhlcmVmb3JlLCB0byBpbmNyZWFzZSB0aGUgYWNjdXJhY3kg
b2YgdGhlIHRpbWluZyBmb3Igbm90aWZ5aW5nDQo+IGBEUk1fRVZFTlRfRkxJUF9DT01QTEVURWAg
dG8gdXNlcnNwYWNlLCBtdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkNCj4gc2hvdWxkIGJlIG1v
dmVkIHRvIGRkcF9jbWRxX2NiKCkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0
ZWsuY29tPg0KDQo+IA0KPiBGaXhlczogN2Y4MmQ5YzQzODc5ICgiZHJtL21lZGlhdGVrOiBDbGVh
ciBwZW5kaW5nIGZsYWcgd2hlbiBjbWRxIHBhY2tldCBpcyBkb25lIikNCj4gU2lnbmVkLW9mZi1i
eTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jIHwgMjUgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBpbmRleCBlYjBlMTIz
M2FkMDQuLjU2NzRmNTcwN2NjYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRj
LmMNCj4gQEAgLTExMiw2ICsxMTIsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9maW5pc2hfcGFn
ZV9mbGlwKHN0cnVjdCBtdGtfY3J0YyAqbXRrX2NydGMpDQo+ICANCj4gIAlkcm1fY3J0Y19oYW5k
bGVfdmJsYW5rKCZtdGtfY3J0Yy0+YmFzZSk7DQo+ICANCj4gKyNpZiBJU19SRUFDSEFCTEUoQ09O
RklHX01US19DTURRKQ0KPiArCWlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikNCj4gKwkJ
cmV0dXJuOw0KPiArI2VuZGlmDQo+ICsNCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmbXRrX2NydGMt
PmNvbmZpZ19sb2NrLCBmbGFncyk7DQo+ICAJaWYgKCFtdGtfY3J0Yy0+Y29uZmlnX3VwZGF0aW5n
ICYmIG10a19jcnRjLT5wZW5kaW5nX25lZWRzX3ZibGFuaykgew0KPiAgCQltdGtfY3J0Y19maW5p
c2hfcGFnZV9mbGlwKG10a19jcnRjKTsNCj4gQEAgLTI4NCwxMCArMjg5LDggQEAgc3RhdGljIHZv
aWQgZGRwX2NtZHFfY2Ioc3RydWN0IG1ib3hfY2xpZW50ICpjbCwgdm9pZCAqbXNzZykNCj4gIAlz
dGF0ZSA9IHRvX210a19jcnRjX3N0YXRlKG10a19jcnRjLT5iYXNlLnN0YXRlKTsNCj4gIA0KPiAg
CXNwaW5fbG9ja19pcnFzYXZlKCZtdGtfY3J0Yy0+Y29uZmlnX2xvY2ssIGZsYWdzKTsNCj4gLQlp
ZiAobXRrX2NydGMtPmNvbmZpZ191cGRhdGluZykgew0KPiAtCQlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZtdGtfY3J0Yy0+Y29uZmlnX2xvY2ssIGZsYWdzKTsNCj4gKwlpZiAobXRrX2NydGMtPmNv
bmZpZ191cGRhdGluZykNCj4gIAkJZ290byBkZHBfY21kcV9jYl9vdXQ7DQo+IC0JfQ0KPiAgDQo+
ICAJc3RhdGUtPnBlbmRpbmdfY29uZmlnID0gZmFsc2U7DQo+ICANCj4gQEAgLTMxNSwxMCArMzE4
LDE1IEBAIHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsIHZv
aWQgKm1zc2cpDQo+ICAJCW10a19jcnRjLT5wZW5kaW5nX2FzeW5jX3BsYW5lcyA9IGZhbHNlOw0K
PiAgCX0NCj4gIA0KPiAtCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm10a19jcnRjLT5jb25maWdf
bG9jaywgZmxhZ3MpOw0KPiAtDQo+ICBkZHBfY21kcV9jYl9vdXQ6DQo+ICANCj4gKwlpZiAobXRr
X2NydGMtPnBlbmRpbmdfbmVlZHNfdmJsYW5rKSB7DQo+ICsJCW10a19jcnRjX2ZpbmlzaF9wYWdl
X2ZsaXAobXRrX2NydGMpOw0KPiArCQltdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192YmxhbmsgPSBm
YWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtdGtfY3J0Yy0+
Y29uZmlnX2xvY2ssIGZsYWdzKTsNCj4gKw0KPiAgCW10a19jcnRjLT5jbWRxX3ZibGFua19jbnQg
PSAwOw0KPiAgCXdha2VfdXAoJm10a19jcnRjLT5jYl9ibG9ja2luZ19xdWV1ZSk7DQo+ICB9DQo+
IEBAIC02MDYsMTMgKzYxNCwxOCBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y191cGRhdGVfY29uZmln
KHN0cnVjdCBtdGtfY3J0YyAqbXRrX2NydGMsIGJvb2wgbmVlZHNfdmJsYW5rKQ0KPiAgCQkgKi8N
Cj4gIAkJbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9IDM7DQo+ICANCj4gKwkJc3Bpbl9sb2Nr
X2lycXNhdmUoJm10a19jcnRjLT5jb25maWdfbG9jaywgZmxhZ3MpOw0KPiArCQltdGtfY3J0Yy0+
Y29uZmlnX3VwZGF0aW5nID0gZmFsc2U7DQo+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm10
a19jcnRjLT5jb25maWdfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICAJCW1ib3hfc2VuZF9tZXNzYWdl
KG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLCBjbWRxX2hhbmRsZSk7DQo+ICAJCW1ib3hfY2xp
ZW50X3R4ZG9uZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbiwgMCk7DQo+ICAJfQ0KPiAtI2Vu
ZGlmDQo+ICsjZWxzZQ0KPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZtdGtfY3J0Yy0+Y29uZmlnX2xv
Y2ssIGZsYWdzKTsNCj4gIAltdGtfY3J0Yy0+Y29uZmlnX3VwZGF0aW5nID0gZmFsc2U7DQo+ICAJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbXRrX2NydGMtPmNvbmZpZ19sb2NrLCBmbGFncyk7DQo+
ICsjZW5kaWYNCj4gIA0KPiAgCW11dGV4X3VubG9jaygmbXRrX2NydGMtPmh3X2xvY2spOw0KPiAg
fQ0KDQo=

