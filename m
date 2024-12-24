Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBB1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 05:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoFqs3FIZ6ZKAgjSy568GtXbTRj88CaO4LciKhWg4Wc=; b=cFohAkytyj8L0TvKaE2JhNDucp
	HOCyRtbvwGbZrPUq1UKUQR6z3QLtyXUg1wBY2ah1VYjBCvQck/Gc2uVNcqmZWfmqqfjCm920SvlGI
	in6SudCHLaELdDZDz55UVFi4L5pKgnwKOaecX1EXWeOoYaBvK6wR7XgF9pI1HKDjzQmlxHxFQCGbu
	h7P952eC4bWyyiEu5YHaah2w9eb8aCjB2NQ/aPQjSKNYxG9b/FoxxWVX7jCw9mquZ9KKkt7FOq1d0
	7e+/UvSkqUiBPGszZyKGfzrAQ610DrOA41TnkxL2OvykfhVK9IQuAdcm8M7jtIlFPbCgR2Xbyegtp
	bBrhRm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxc5-0000000BJ3o-2aGL;
	Tue, 24 Dec 2024 05:37:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPxar-0000000BIx1-0diW;
	Tue, 24 Dec 2024 05:36:34 +0000
X-UUID: 04b39816c1b911ef9048ed6ed365623b-20241223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=KoFqs3FIZ6ZKAgjSy568GtXbTRj88CaO4LciKhWg4Wc=;
	b=HJ18CB1dOPzD8qfLzqaJfaL2cKGOMAJXz5M1MsxJ5ygtxyY7SGJnPehOTSDNM+OISs4CEIE6smq67JiqaXpC2lwhgz8hWvGu2Q+wckf6N6dQgvhU9pOAq2jRIMucCQ30Pr+CFUs4CemaFzCbMdyeOKUQ4/bQGM8Ne23bV9U1RoM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:dd6e49b6-79df-40de-aed4-253210f3bc9e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:9d5fc618-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 04b39816c1b911ef9048ed6ed365623b-20241223
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1410655986; Mon, 23 Dec 2024 22:36:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 13:36:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 13:36:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms4PqOdYqwYIbz+TueZfboMSEFk0DWPIxSFaG5C3/7SRvm6xRPuXQxZs3L/Sf27XDflAMkyHEHDIqy0DPlmm4H9wUwi3GgTMHXsX7lwDhV6kTKJvlgg7xnYYF63nkY+nfEF/9KCGw6cDMp1Lt/LmZMcc9bNS8s4kyD0WB8MnIf4sYCCMI252ICr98UWETZ+/itPSjltcR1lW/HN/VKzmr23M0Z9Wf4u8wqkKuvDlHo03bpTwx/B0PzGRX2EGc3PC182+yRm8+NWQRQ8ROacb9jn7G6V0VNR3JJ6xZ4OCfI9/ioVWK6gtD3BTvtZ3ClLzYyStM8Oq9eIzlF/CwXlxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoFqs3FIZ6ZKAgjSy568GtXbTRj88CaO4LciKhWg4Wc=;
 b=BgpZw6THXT9PducIf4i23WIJA6qTHXDkmsVjHQ96hDoNvW87k+dOEJW/3FonH1yVDgAITI52aPfY349lDxei413H+Xav+7Rwnx4J8gy17V4uCwAlHFmC2L6di60uFfIxIRVIY7CL47YG9jqaddZPB4NYOmQDARJwJIjgVl/3WCgE77VVUz8XfTm1v8l24lgTNCeSYiSZyXr8kcyJUChcP4AwL/clyMP3VpvEZVIYOj5ZaIJNK8aN4KxTalJpC5hIpHaN2dgaHE21F1RPXJOW532+PByd2RxvOLszegVh2mYYdg3hNYjUnJ6U3BCl1w3dGaxzcRC9+XdeXiJ/f/nvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoFqs3FIZ6ZKAgjSy568GtXbTRj88CaO4LciKhWg4Wc=;
 b=sgsvKv2CmXBpPWCMonIGNqZYVcMZ/INb4SR38BdOqGS+ffNcjlX+PP/dS5102ikBDe1RtmHozSGPqzlSP8b6kucQFm2Mb0IvjqZvdLWtvwRtDK0wPKd6NndoI3Br8eA/iFmmz0h++FwOcXJSYNnz+xLNCPufjJRZU1pRcsx22b4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8843.apcprd03.prod.outlook.com (2603:1096:990:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 05:36:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 05:36:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>,
	=?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <xinlei.lee@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix
 MT8186/MT8188
Thread-Topic: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix
 MT8186/MT8188
Thread-Index: AQHbUgkRUbpY26+GQkqaYKKzB8j8YrL053MA
Date: Tue, 24 Dec 2024 05:36:20 +0000
Message-ID: <fa6e2d5eb434915006f56055634b5f22d9766e56.camel@mediatek.com>
References: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8843:EE_
x-ms-office365-filtering-correlation-id: 4cb681ca-6a4f-4f8a-252c-08dd23dce5ab
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q1MvTG1RaEUzenpPVnZ5V0VtbmtDMnBlSjBBdnYxWHQybE9laC9jeldVRFJ0?=
 =?utf-8?B?UWVUWDVlTEdNNkhOLzZsbG5PaFVRUHZtY0IvbjludDZVaWR4c0IxQVN2Z21O?=
 =?utf-8?B?WXVINGZmUzc2SXNlb0NwSWRnbGtSVi9SR0k4VHJNWXFtMGgvNG1iRVFSTVgr?=
 =?utf-8?B?eUp6NElEbnlWcE1IWHhrRVNIQXN5OGNwOVN5OXY2NFB2OTJEM0EvcFpwYTZ5?=
 =?utf-8?B?VHBqb1h6VUdwL0RiNFAwOHNWN3dmMkFRQmNLcThyQXFyY1paOEVVdElEMlEw?=
 =?utf-8?B?MmdWN2E4UUxhcGVrYVdOZjVxcDAvSGdpRElIWTdVdTFrK1BVZ3lnVVZMRE5v?=
 =?utf-8?B?NVNUU3lFbnNHUUk3ZVVPZ2duSlB1NkJzWS9xcE9kZGtsV2xPNHF4RG1MWDBB?=
 =?utf-8?B?RlRKVzNZYjBEclBxQW5VdDd0MmNRbnk3TkxmeG1KdmFVcjF3MUZOdGw5MkU3?=
 =?utf-8?B?alFUWExQWUNXTnF0aEZGQjFSajBwQmxzYXgvVDlTUS83SG93S3RTb2Fid2Fj?=
 =?utf-8?B?dkdyS01mQjFmN2VlMmsvcnRVY3gwaWVYdERpVW14eUsrUm9jSXg1ZHhtRHpr?=
 =?utf-8?B?THBOUGY3Y1ovQzhMaGxCWDNuek5nc3J5bVA1UHB2M0JDeGpONzZUR0ZaZUNT?=
 =?utf-8?B?dU1NRExZSStSeGlSSUlqUXlpaGVnaTlGaGZwdEo3SUF3ZjBTTThJQkttalRP?=
 =?utf-8?B?RncvUHU0eHFtVXcxTTF1RmNDZDVmWnVBM2NPdVdMN0drQkc0bWdPV2x0LzZw?=
 =?utf-8?B?T0srbzU0M2ViRFovYjMxL2tKS3pYSC9SeWxWUjU4bEdnQVY0TzdqWkdNK2dT?=
 =?utf-8?B?NHZudEpTUVNqWmlMUGpOeWJCQTJHeTJ2UUFoazAyL2dJd1lZVHhJaEVHaWRT?=
 =?utf-8?B?VUNEbnlKd0twVGNZUEJhUGZkbEs3MHpCYmJ5dXlKbXBMdE8vajZ0ZXpESUJ6?=
 =?utf-8?B?cFB3ZEEzZjc3Q25mUG10MEtPd1hCdmVOc0E5SVdJUGdMSjJJNFMyb2NUeVBn?=
 =?utf-8?B?S1ExNjlFL2srRWg1bUdMYzB6bE0xWlRLM05UU2hvVmpRb1FHVFBLbXh1ZVQy?=
 =?utf-8?B?TjZjOXZtSk5HbmxNdHBrcm4waXZCazVJaW5KTThaRTU3K0Y3YzYyR1luREdo?=
 =?utf-8?B?TkkxQUJ3L0czZ3JsSzQxMVI4VmRsWmhHWTYzUzJneFFkZEVldWQ1TXQxS3RH?=
 =?utf-8?B?Wk9BMTU3NGFvMGJLWm1BOXFPbDhBTHMrYjd1anhoTDdpR1FRYlU4ZnNaUzF2?=
 =?utf-8?B?Vms2TkZ6cE9nRXVTRmpXOVRtZTQvMEc0bmpnb2ZvVDM0TFcxdnd0SXY2TzJ6?=
 =?utf-8?B?dGo3bnlrOWY4b1ZYWHlodFFOMnM5Z0ljcXFoejBieFBxTmZxVTVRNEg2QTN3?=
 =?utf-8?B?bFp0dVJkZForRVBOSEU3ZTJTbk1hODI3TlNLbkxEaXFRWHRYcUtzSUtKVy9Y?=
 =?utf-8?B?YTNsTWovbFdWN2dEMXYrd1VpdU03TkF4WXhvREQ5bE5VbEhwK2F3d2tESjZk?=
 =?utf-8?B?VjM4QUNsSHVSVnJ2aVB1djBJR2Vpa1g5dzFKa0Z2U1FhRmU0c0lkRWtISUc1?=
 =?utf-8?B?czU1UGQ1Z0U2dXFHVDJhandWSzl3Q0tZcGlzQ0toaldKVmg1eVVaWDUrSk14?=
 =?utf-8?B?UmZaTi9udyt6VmwxREYvN0JJeHgwem9iTi9Hak80S2ppalpjMi9PRThVQzhQ?=
 =?utf-8?B?UjEwdzBzSVo1RTBxUW1jWnNDeHZzeWZPR3g4R00yRmlZQ0h5Nlg3R2xwanln?=
 =?utf-8?B?aHJJcWtQYW55d1BlUnFjdzJsb09KMHlhSzNsa3VEZGd2ZDZ0Ymw5ekduV0g1?=
 =?utf-8?B?WXYyTlR4VlRuZDczYVhwVnBQWDMzbHJ3SkZqWXFYR1FmTDhwL3BlSWRoc1FD?=
 =?utf-8?B?dEd1YTF0UWdyUjZWRzZMb3I2MkhYZDRqbmlUMVg3TE5ZY2JqR2RNa2NoOU02?=
 =?utf-8?Q?fIZ98ii5jVAnu8UqsxgyKSnZDFUVjxkA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0VpNDlNbXlpMUdSeU9kUm4rYXBQd0lKdlNSbHVGZjFzaTNtWTVjbE1vZk1w?=
 =?utf-8?B?eS9RR2dXSW9JUnM1dUQ5cmZuM243ZmVEcVM2ZlVHR0QvVElvVGN0bHRlRmti?=
 =?utf-8?B?L0k1aDY5Z3NlMnViTHBFYXN1SHBERmY5eExMV2ZQTTkwZkQ0QnlmM3Q4Q2tz?=
 =?utf-8?B?OG9rQ3R6UURPbUV1bzRLT0wxSVg3MCtiVW1OQjBPbkhHcmRCU3dDdkZxaFAr?=
 =?utf-8?B?SlJKeWNKNGZkaVF6b29JV0F6V2lCa2hyT1dONzlub2p5VEsxeWtsdDVxWUI1?=
 =?utf-8?B?UzF3N1hGMnB4eUFCQWY1b01DTENSc3dZcXZVMFBGWU5jODBxQ3NMV2JDRmZF?=
 =?utf-8?B?bWlWUkZDMzAzcXZ3bUNMZExORTU2M21CUUt5WDd4VTBrNkN4Vyt2cHFFUzBv?=
 =?utf-8?B?ZlI0ZWNGK05kelFXWkRsUHJITlJFRXNsWlZUakllUFV4OTNUcHN5MHhLWURp?=
 =?utf-8?B?VDhsSTRwTjNNdS9xUUhhRkM5b0RFeE52SW9nbWdaa1Z5MEx0OG9zWmUvUlJw?=
 =?utf-8?B?bHBkY2RlakgxMjFMNmswTUtraytoYjl5OWF0VEZWdWJmOHRySElIQkRJSzZC?=
 =?utf-8?B?T1RPcHlXOTQ1dG9aeWpaU1pFd3dmSWEvQUJvL1lWY2hBTWdNQ21rZHdLNXlR?=
 =?utf-8?B?WG0wN1VzbytOQmV1K0xTS3BtK3JraTNuYkl5bGFMSjRrWVlrYjU0aEU2aDA4?=
 =?utf-8?B?eFU5amUxcW1qelIzQUtGMFdRb0hsM211dFBDOE4wRXpNbWVtMkV0NUp4NGNh?=
 =?utf-8?B?WDZQcWx3TWNhQ21WSGw0VDJRRElpQk13ME1sMHhPZzErRG54UXUyUDB3bWNH?=
 =?utf-8?B?anM2OXFHUGFrWlpyc0VtV2poN0ZGd3k4eTZYS2U0NFhJMEovUGFaWGFTeVFD?=
 =?utf-8?B?L1BKRWR0UFZsY2tEalFyUEw4SStueUt5cHhQUHpmVjZFWkJqRHJ5WTA3TlFu?=
 =?utf-8?B?bC9GdGNtNTRZM0ZoVGxxRHNBaWJOZGozUjltUVBkTFgxTzFRSnBUbDRzT1B2?=
 =?utf-8?B?VmFKNjVwVjZwbEgwaVVvMWFBclZaWWlyeVRoOEJtd0JORGFzdDI5V0hWbFov?=
 =?utf-8?B?cDYyQm5VN0JaZGlJK3ZzekJuRnlCZTNHZkF5bVRsZkwrZjI3cmdwY2U3MHhZ?=
 =?utf-8?B?aTBoeTZCTFBhV2xDWkRlVUYzVHpwVWlOcUpwOEx3eTZhdGY4U1VVeVQzbWZM?=
 =?utf-8?B?dzgzSGI1RzVoU0FieWxEdURDVGZJSThybzZhejVYcmhmMjBYMWd3aUNVcVhW?=
 =?utf-8?B?SzdEdS9Wa1pzWURmRkF4MUp4dFdkeDUxeWt2dTdqaVVpdkQ0djIzL3pEVFEy?=
 =?utf-8?B?MkVOTVFIaTFiUGQ5aFhFbG04UG9Td2JRbDJzbHpkUGJzNmFWaGtUcjNndXBR?=
 =?utf-8?B?elFlNE5sTG1Pb29LelNBREwrc29uanBlYVJ6M1B0WllaQVM3SUNEc2k4bExn?=
 =?utf-8?B?dmpsaE1sT0pNWVlaSVdCQUFlekRyRWI2V3piL21QWTdmS0dLaGlsNkxhS2FZ?=
 =?utf-8?B?L2tCd3ZXakdlSnBiK0ZwaHd3aGZTYk9rNHFScWR6NXE0WWhXTktLQkhLRWxw?=
 =?utf-8?B?Wi9LMFZrVUVGdFdZeVhFL0k3ZFVIMEFGY0JZUlp5Wm1hcGZsTXVrVXJJdUVa?=
 =?utf-8?B?djBEQk5ZVWhQSG1uS09vdklaRWU2NFlDMHU2cmlQeGt4dmxESlZmVXRwVWtD?=
 =?utf-8?B?YzlsZFBDQ0Y5YzdlOTN0MUtGKzltMjRYNTF3SE05ZXYzZ0lsMzg0bDU1WTRm?=
 =?utf-8?B?WjYwVS9FYnJGWlAvRXA1Q0FmbVlvTnRFY2YxZUUwejRGZit1MWIweTJKVlNv?=
 =?utf-8?B?TzZoVExnQTMyUzcyK3NZN2I3eFBrc08xUy9EZTlZTERCcDlRVnVqcmR3NDZp?=
 =?utf-8?B?TGxaRXhuNTV4Yk5iRFZUUUxvc1MrbXMraTZwbXp5NmdvTDMyOVFhMlh6S21P?=
 =?utf-8?B?Q29UdUkycHRYTnN3UEVqeXFUOVltZFVQRlc3NFFFK0Q2V2ZjdW5HSG5xVFl3?=
 =?utf-8?B?bHZWMGVlNDhlcW9zclNuV1FjY2pkOGJuaHArWThFR0h3UHNoejg2bDBlTXEr?=
 =?utf-8?B?bURBUmV0WGljK1lXVkhzdFBNSHpGbmg5djhhMUlhSUpNZnlIT3FUMjZ2cXBx?=
 =?utf-8?Q?Q8odEk8FFVZaoAhB3oJk8R6fC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E49E4D4CBF4657478525C47E268A002C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb681ca-6a4f-4f8a-252c-08dd23dce5ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 05:36:20.8847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65hWrWA/QeKn6QARZssGpJU+DRs+GhGTvZY4vMe1aBPfK3ESy6amE9vxkdxuoqFFCiYyNdelrk0BwKJQWXYp9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_213633_209337_654703BB 
X-CRM114-Status: GOOD (  19.61  )
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

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTE5IGF0IDEyOjI3ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBSZWdpc3RlcnMgRFNJX1ZN
X0NNRCBhbmQgRFNJX1NIQURPV19ERUJVRyBzdGFydCBhdCBkaWZmZXJlbnQNCj4gYWRkcmVzc2Vz
IGluIGJvdGggTVQ4MTg2IGFuZCBNVDgxODggY29tcGFyZWQgdG8gdGhlIG9sZGVyIElQcy4NCj4g
DQo+IEFkZCB0d28gbWVtYmVycyBpbiBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSB0byBzcGVj
aWZ5IHRoZQ0KPiBvZmZzZXRzIGZvciB0aGVzZSB0d28gcmVnaXN0ZXJzIG9uIGEgcGVyLVNvQyBi
YXNpcywgdGhlbiBkbw0KPiBzcGVjaWZ5IHRob3NlIGluIGFsbCBvZiB0aGUgY3VycmVudGx5IHBy
ZXNlbnQgU29DIGRyaXZlciBkYXRhLg0KPiANCj4gVGhpcyBmaXhlcyB3cml0ZXMgdG8gdGhlIFZp
ZGVvIE1vZGUgQ29tbWFuZCBQYWNrZXQgQ29udHJvbA0KPiByZWdpc3RlciwgZml4aW5nIGVuYWJs
ZW1lbnQgb2YgY29tbWFuZCBwYWNrZXQgdHJhbnNtaXNzaW9uDQo+IChWTV9DTURfRU4pIGFuZCBh
bGxvd2FuY2Ugb2YgdGhpcyB0cmFuc21pc3Npb24gZHVyaW5nIHRoZQ0KPiBWRlAgcGVyaW9kIChU
U19WRlBfRU4pIG9uIGJvdGggTVQ4MTg2IGFuZCBNVDgxODguDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQpJJ20gY3VyaW91cyB0aGF0IG9ubHkgc29tZSBwYW5l
bCBoYXMgcHJvYmxlbSB3aXRob3V0IHRoaXMgcGF0Y2g/DQpJIHRoaW5rIHRoZSBmaXhlZC1wYXRj
aCBzZW5kZXIgaGFzIHRlc3Qgb24gdGhlaXIgcGFuZWwuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0K
PiBGaXhlczogMDNkN2FkYzQxMDI3ICgiZHJtL21lZGlhdGVrOiBBZGQgbXQ4MTg2IGRzaSBjb21w
YXRpYmxlIHRvIG10a19kc2kuYyIpDQo+IEZpeGVzOiA4MTRkNTM0MWYzMTQgKCJkcm0vbWVkaWF0
ZWs6IEFkZCBtdDgxODggZHNpIGNvbXBhdGlibGUgdG8gbXRrX2RzaS5jIikNCj4gU2lnbmVkLW9m
Zi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgMjIgKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMNCj4gaW5kZXggZTYxYjliYzY4ZTlhLi45NzgzMzJjZDUyZjUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiBAQCAtMTM5LDExICsxMzksMTEgQEANCj4gICNk
ZWZpbmUgQ0xLX0hTX1BPU1QgICAgICAgICAgICAgICAgICAgIEdFTk1BU0soMTUsIDgpDQo+ICAj
ZGVmaW5lIENMS19IU19FWElUICAgICAgICAgICAgICAgICAgICBHRU5NQVNLKDIzLCAxNikNCj4g
DQo+IC0jZGVmaW5lIERTSV9WTV9DTURfQ09OICAgICAgICAgMHgxMzANCj4gKy8qIERTSV9WTV9D
TURfQ09OICovDQo+ICAjZGVmaW5lIFZNX0NNRF9FTiAgICAgICAgICAgICAgICAgICAgICBCSVQo
MCkNCj4gICNkZWZpbmUgVFNfVkZQX0VOICAgICAgICAgICAgICAgICAgICAgIEJJVCg1KQ0KPiAN
Cj4gLSNkZWZpbmUgRFNJX1NIQURPV19ERUJVRyAgICAgICAweDE5MFUNCj4gKy8qIERTSV9TSEFE
T1dfREVCVUcgKi8NCj4gICNkZWZpbmUgRk9SQ0VfQ09NTUlUICAgICAgICAgICAgICAgICAgIEJJ
VCgwKQ0KPiAgI2RlZmluZSBCWVBBU1NfU0hBRE9XICAgICAgICAgICAgICAgICAgQklUKDEpDQo+
IA0KPiBAQCAtMTg3LDYgKzE4Nyw4IEBAIHN0cnVjdCBwaHk7DQo+IA0KPiAgc3RydWN0IG10a19k
c2lfZHJpdmVyX2RhdGEgew0KPiAgICAgICAgIGNvbnN0IHUzMiByZWdfY21kcV9vZmY7DQo+ICsg
ICAgICAgY29uc3QgdTMyIHJlZ192bV9jbWRfb2ZmOw0KPiArICAgICAgIGNvbnN0IHUzMiByZWdf
c2hhZG93X2RiZ19vZmY7DQo+ICAgICAgICAgYm9vbCBoYXNfc2hhZG93X2N0bDsNCj4gICAgICAg
ICBib29sIGhhc19zaXplX2N0bDsNCj4gICAgICAgICBib29sIGNtZHFfbG9uZ19wYWNrZXRfY3Rs
Ow0KPiBAQCAtMzY3LDggKzM2OSw4IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfc2V0X21vZGUoc3Ry
dWN0IG10a19kc2kgKmRzaSkNCj4gDQo+ICBzdGF0aWMgdm9pZCBtdGtfZHNpX3NldF92bV9jbWQo
c3RydWN0IG10a19kc2kgKmRzaSkNCj4gIHsNCj4gLSAgICAgICBtdGtfZHNpX21hc2soZHNpLCBE
U0lfVk1fQ01EX0NPTiwgVk1fQ01EX0VOLCBWTV9DTURfRU4pOw0KPiAtICAgICAgIG10a19kc2lf
bWFzayhkc2ksIERTSV9WTV9DTURfQ09OLCBUU19WRlBfRU4sIFRTX1ZGUF9FTik7DQo+ICsgICAg
ICAgbXRrX2RzaV9tYXNrKGRzaSwgZHNpLT5kcml2ZXJfZGF0YS0+cmVnX3ZtX2NtZF9vZmYsIFZN
X0NNRF9FTiwgVk1fQ01EX0VOKTsNCj4gKyAgICAgICBtdGtfZHNpX21hc2soZHNpLCBkc2ktPmRy
aXZlcl9kYXRhLT5yZWdfdm1fY21kX29mZiwgVFNfVkZQX0VOLCBUU19WRlBfRU4pOw0KPiAgfQ0K
PiANCj4gIHN0YXRpYyB2b2lkIG10a19kc2lfcnh0eF9jb250cm9sKHN0cnVjdCBtdGtfZHNpICpk
c2kpDQo+IEBAIC03MTQsNyArNzE2LDcgQEAgc3RhdGljIGludCBtdGtfZHNpX3Bvd2Vyb24oc3Ry
dWN0IG10a19kc2kgKmRzaSkNCj4gDQo+ICAgICAgICAgaWYgKGRzaS0+ZHJpdmVyX2RhdGEtPmhh
c19zaGFkb3dfY3RsKQ0KPiAgICAgICAgICAgICAgICAgd3JpdGVsKEZPUkNFX0NPTU1JVCB8IEJZ
UEFTU19TSEFET1csDQo+IC0gICAgICAgICAgICAgICAgICAgICAgZHNpLT5yZWdzICsgRFNJX1NI
QURPV19ERUJVRyk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgZHNpLT5yZWdzICsgZHNpLT5k
cml2ZXJfZGF0YS0+cmVnX3NoYWRvd19kYmdfb2ZmKTsNCj4gDQo+ICAgICAgICAgbXRrX2RzaV9y
ZXNldF9lbmdpbmUoZHNpKTsNCj4gICAgICAgICBtdGtfZHNpX3BoeV90aW1jb25maWcoZHNpKTsN
Cj4gQEAgLTEyNjMsMjYgKzEyNjUsMzYgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19kc2lfZHJpdmVyX2RhdGEgbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSA9IHsNCj4gICAgICAgICAu
cmVnX2NtZHFfb2ZmID0gMHgyMDAsDQo+ICsgICAgICAgLnJlZ192bV9jbWRfb2ZmID0gMHgxMzAs
DQo+ICsgICAgICAgLnJlZ19zaGFkb3dfZGJnX29mZiA9IDB4MTkwDQo+ICB9Ow0KPiANCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDI3MDFfZHNpX2RyaXZlcl9k
YXRhID0gew0KPiAgICAgICAgIC5yZWdfY21kcV9vZmYgPSAweDE4MCwNCj4gKyAgICAgICAucmVn
X3ZtX2NtZF9vZmYgPSAweDEzMCwNCj4gKyAgICAgICAucmVnX3NoYWRvd19kYmdfb2ZmID0gMHgx
OTANCj4gIH07DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRh
IG10ODE4M19kc2lfZHJpdmVyX2RhdGEgPSB7DQo+ICAgICAgICAgLnJlZ19jbWRxX29mZiA9IDB4
MjAwLA0KPiArICAgICAgIC5yZWdfdm1fY21kX29mZiA9IDB4MTMwLA0KPiArICAgICAgIC5yZWdf
c2hhZG93X2RiZ19vZmYgPSAweDE5MCwNCj4gICAgICAgICAuaGFzX3NoYWRvd19jdGwgPSB0cnVl
LA0KPiAgICAgICAgIC5oYXNfc2l6ZV9jdGwgPSB0cnVlLA0KPiAgfTsNCj4gDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgbXQ4MTg2X2RzaV9kcml2ZXJfZGF0YSA9
IHsNCj4gICAgICAgICAucmVnX2NtZHFfb2ZmID0gMHhkMDAsDQo+ICsgICAgICAgLnJlZ192bV9j
bWRfb2ZmID0gMHgyMDAsDQo+ICsgICAgICAgLnJlZ19zaGFkb3dfZGJnX29mZiA9IDB4YzAwLA0K
PiAgICAgICAgIC5oYXNfc2hhZG93X2N0bCA9IHRydWUsDQo+ICAgICAgICAgLmhhc19zaXplX2N0
bCA9IHRydWUsDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2
ZXJfZGF0YSBtdDgxODhfZHNpX2RyaXZlcl9kYXRhID0gew0KPiAgICAgICAgIC5yZWdfY21kcV9v
ZmYgPSAweGQwMCwNCj4gKyAgICAgICAucmVnX3ZtX2NtZF9vZmYgPSAweDIwMCwNCj4gKyAgICAg
ICAucmVnX3NoYWRvd19kYmdfb2ZmID0gMHhjMDAsDQo+ICAgICAgICAgLmhhc19zaGFkb3dfY3Rs
ID0gdHJ1ZSwNCj4gICAgICAgICAuaGFzX3NpemVfY3RsID0gdHJ1ZSwNCj4gICAgICAgICAuY21k
cV9sb25nX3BhY2tldF9jdGwgPSB0cnVlLA0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

