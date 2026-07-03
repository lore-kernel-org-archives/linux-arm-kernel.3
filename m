Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F4CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cToIHeNm1uwsx1hKhW/rPGNuRADwvCz0u2OwIJYdyeA=; b=ZLJPDmUHLtCNCgkL/gv+4uCkVC
	gTeGydLWF42MoX7Gv/mE0NIfVRXxUqU7j/phjfkj8VmZvURsmmFFGjvptEevN3NEZbRVNVPWQtIjo
	IiVCqBRK3/KGqIyAG+htlQQeAsaTOKqoYCT6j4xl1g+mZTdKsImFXJuvjBbOrak8+ikPGQpJyNWYH
	saiaAMSl2BEqiJgzDJBUMSHCI3wTGFwIoBnbHkHMqo/hzgK+M7AkJPIGv8lvPMwsRA/WJJEPXGcac
	Q3DQNlY1yHJaXUezjFKRjhP5eUOyKgb72feler06LDoRMXqc4CsxX8llAkhBTPCdAtYaRWFZTAGBV
	EtSPvkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhSm-00000007azE-3iI9;
	Fri, 03 Jul 2026 17:14:04 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhSj-00000007axx-0Qc2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbwI8whwQUmpKUsUfmlNDKNc8B2PwcxR31vm26bYAJRMIqwAokls3X7xjWjTnifk5oQyupwu3FwoQIbiBnNwfg3MApkiQnT9Ek1DS3ghRKngxq4cX/ecSYDpCOb2PvDIINESmIAmtph7Dbv+OWhJsGZWreMevWP2wz8YbHwTMiSxGe+0PI2ZGIc9V1TIuOu60n+dsJvSb25HM4k9yHVtGgZGp4FJvc++TyoMr0Nx5i73aAgct0mqSaBgU6zb1ifPDrtVWrkpXtQMTmm4yjTISQzCxJ384xm1bMHjgWVCdkF/q24XjqTCTSZxtt/w/eTurdRyaYqZxSi4TyQtuOp6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cToIHeNm1uwsx1hKhW/rPGNuRADwvCz0u2OwIJYdyeA=;
 b=lNaDNu/JA4CdZXX/92HRtTF9I2wVQ560O02SGCCW2EDkQ4Pfc559XYs9W+e4LVMLCcrdi7PST84m6Vt4BZHkdWz+QjQwb6pDrOXaMXLvtN4SZMb4cwVtHrdyAF0nD5KG8DNhM0VEK5DuRGhbaJjy5YEYKYm/a0UzNMhPNiyoatxQNwGUpZr5eWehvyJuyJ5TYS+Dk8SEhdPzUfTlCEK5ZUMdv7uVv965krxBwgO5H4mpCu1aOZmQNa/0CC9MZx/fRCxUqUKDz/HaxBuS88ZK7kgydJGhedFB4WPPb0a3iL3HHwsllQjQyM7Y1g+bwMJKShuwB8wgXOzYiHH++70p2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cToIHeNm1uwsx1hKhW/rPGNuRADwvCz0u2OwIJYdyeA=;
 b=tNbkmVHtdWfkTvIDB6dISX0zPHiLG37ruSsC2lxA/mUJVV7tWL8HO2G0qnbv1CGqhusnTylzEXcAnpvSwIy21VmkSXzWmG3urb5Fe2Umr6YcbSC9/FhNH6doQBI+triCF1YiTap9lyPQPGoCAzkKpPoY9ZZsNXQ3d+G1CF0Q+fdyYQ9MxCyh7FcQlFqp0LzmXRkUkpeutw9ZbhZFcRuQBEkSIJWIjeSbPn6mZeftNNevxl+a1D0Le24i6nCzhG0FFtGtmg12VwJJOrEzPDJpuh+UCZAVQwuNMxqICY3m7keumh59TZHW2iIiZEM+HFwLyT1HzEKRipeg8/4+YP+qXA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PR3PR10MB3998.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Fri, 3 Jul
 2026 17:13:53 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 17:13:52 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arnd@kernel.org" <arnd@kernel.org>,
	"soc@lists.linux.dev" <soc@lists.linux.dev>
CC: "stefan.wiehler@nokia.com" <stefan.wiehler@nokia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "arnd@arndb.de"
	<arnd@arndb.de>
Subject: Re: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
Thread-Topic: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
Thread-Index: AQHdCaBP+enfFVZAVUyRNF7nNdcM3bZcC2KA
Date: Fri, 3 Jul 2026 17:13:52 +0000
Message-ID: <07055464188c90abead1c85972da2b68c92ab280.camel@siemens.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
	 <20260701212353.2196041-19-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-19-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PR3PR10MB3998:EE_
x-ms-office365-filtering-correlation-id: 128d0814-8bdb-45f5-c918-08ded9267493
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|38070700021|18002099003|55112099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: BUM3PKMh1vw7CnjGvd+NBxxeaqwACKWbqIMFqW/aQDa+vi7zLVrVKRiw7/XFACaUH9O0fASafRNbaUz8KEcr2Uajgr/9yf2Sjhmq1CFsNhapgsFGAfdjGm8SwBSyy99NX9KBHXuRp40/j6I+jUvJ0MtogW2/AlYYu8OUXWkYIH4D9UyFVLnUrbWDyc/+8sd0IOQHqKDwpSTPhgeVylWPwGkLgw7JiE4p7V6NSUi4lYLwfGLAubCGAbhVeWnP6CNnYkTBZzVP6pH3wzi8y1APz7enpzUziNL2vmLeu43bDHREIboLU9x6K5CULY/HlQmGsl133Y7qTkfBzwBaZLq+XT7K03VV2EytpgDVHQR+X6C47bU4z4THRf4bNHDAq4HNCMydBAH5Hkaf0ZEHoBh3rsRQqxNAk2KSBm0vc/JyiiGbcsCVX0RpG8zzuZTHYS2n/fmA2OmlVsv5LA/4qCw+rejjgPqy9VPadQypKB4WXj7xe3i6I3+aGWwlKhqCK4yzYW2zXEi8iN/gMDVdpmvIPO+5vY3k8X3mQpSbfNO6Ncmg23tyKMPZI2G4LZA2ODL4Yd/9Ao9f3avd1FKys2J8U+FOxhmYIJCJ/YA5zTKPn9pXEV7PyQTm0AN6cMGVYqEForFdIH54CC3TXnQvPiUFmJmRc9/qQDpbBYjC1PclEkg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(38070700021)(18002099003)(55112099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGltNCtObU9QVWl3bEgycDNxbVFuSHQzVFhCNFBBSWZFSkZBcFdDeTRDQ0h0?=
 =?utf-8?B?clU1a212Z1lVNEhQUVhiRm5pWnVPb3FnK3ZiS3BtSExUZ1c3Rmc2Q2dnQXUr?=
 =?utf-8?B?dXV1TENIZkdQZHNjMnRaMnI4emNLVnNBWWRlT2NaL1Qvc2N1T3hwdW1hYmxq?=
 =?utf-8?B?V0pPdndjQnlBMlJmOG1oNEhwbUI1WXJKclFvUlNENWErenVIcXZGTGdydHhv?=
 =?utf-8?B?ZlhuZ2loRjNGWjhxUndFWWk0YjVpek8yelQyTFVpK2FyMkZKKzYydmNSRWc0?=
 =?utf-8?B?L0VXVUd0OFhrQm00NnZqbTQ2TXI1Nnh6QTl0ejc0R2k4VXdVSVZLSm55bE9Y?=
 =?utf-8?B?RFk2bVFOSmdTU0Y2R0dmdGhFcEVDZE5nUC9iT3h6QWRENXhEL1p0MDBXZlNK?=
 =?utf-8?B?Q1NMS2RjN1lSWnVrOHF2SjYzRlQ2VktqbThPSTYxWURIMm1QcjJPRFU4cG9Q?=
 =?utf-8?B?NXJqQm9WRWl3TThZUHNpS3EvaStFOEJ4ZUdacUc0MzR3OHVTcGc5N2ZwdW9x?=
 =?utf-8?B?V0VNYkJzWndkZUZTVi9nVXZucCtSRUpMRUpPeHkyTGJ2VDZkTDMwOWZKQjJh?=
 =?utf-8?B?Lzl1WkxlcUY3ajdXNXNiWW8rL0NaMnh6NVdDNnVUSk5oSUo5KyszNkQ3Vmo1?=
 =?utf-8?B?TFZBWEVTMlVsVWcyK2FMMTQ0VkQwYVE1eU4zNFdSKzNHNHRTRVNIRnZZYkVv?=
 =?utf-8?B?V1JGSDllUStVdEpsK1lkaVhrTDdJSFVhb2JCWWxqY29sR3lWZjBRRmMyS1Va?=
 =?utf-8?B?REdjKzVGWkhmSStTb2VuTnhhS2dRZ3dTM2NPTkFXRkZNck0vZFlqSGVaMENv?=
 =?utf-8?B?MkNCUjNyR2NJQ0w4QUJraDJHTDQ1dnRRM1d3b2NqY285UzNiK2tKWlNsektm?=
 =?utf-8?B?QUZKek1KeEl3c1duZHZuODRsdVJsWmNQUmswSGJ3T01HMk5qQjRrQ2hsOFlE?=
 =?utf-8?B?L2tnKzAxQklTLzhwSjY0RmMxUUpQMXUzVWhJdWFMSzdjOGdHYWkxRlpKTHk2?=
 =?utf-8?B?ZzlJc2N0Z1l1V2xkSFJuVGZSNzRQcS9NMEMzS0lJakk2eHFWQkM3bEYvZjdi?=
 =?utf-8?B?ajJvMGRIUHVMRG5vM2tWMjJucFZmZUhUZGhha0NWTWNvNEhjK0dPWGl5RTh4?=
 =?utf-8?B?dVJOTlZ3anB4SFdQNU0yelJodXFJSlVIMjZNRlB0UHdFR1dnZnkreDRBc3J0?=
 =?utf-8?B?aTZNZlQrVllrUWRWOXNMRW10Vm9uc1dXOGxyaW1paDNiTjRvMFB4ZVo2RDFU?=
 =?utf-8?B?SWZTVXYrSktQdmt6bkRyTjlvWldtdEN2eUx2aENzejJzK1VnRklPazZEMGNk?=
 =?utf-8?B?cVdMc2ZCb05SU0tVbnpGeWx2d0JsQTlwWnJ6YmdyeWQ5SVJvWXFHcVk2RXBq?=
 =?utf-8?B?amY4QTVQUGF6T3lxeG52SUp6NmorWHZwTStOdnRoZFBtRXBYSlVFbFkzWmtt?=
 =?utf-8?B?RXB3ZHVqVlphV3lCM1hCOXdoZUx5MjhxOWpjQlJielJ0eVNaNlc4ZjZ3eWtF?=
 =?utf-8?B?OGs3ekhOZnloS0JGcHB0bUZyc0NyT0pwUnZYNTFQdnpLUDhRc0N6eHBmeVl4?=
 =?utf-8?B?a3ptSmpzQjQxMmVSQzA2ay9hdytrRmFYRCtUd2hRZHlyNUJsWXAyOFVpbHB4?=
 =?utf-8?B?WG1BcTZwTllKYy9ZZ1RJRkxCVUtYQ05xZnp6V29RanRMU0ozWDFlWndWa0t4?=
 =?utf-8?B?OEpSK1FlSzY0d25wUTZlN3JjdkJLNHVJMkR5RHVtZitWbEhWbWJwbENBNHRx?=
 =?utf-8?B?NXRaK0pxNHFtU001Wmh6WEtqSUF5dHBvY0tRVHEwNFhvcTlvakI2RllsUlcr?=
 =?utf-8?B?TllGdTBrcmhuVHVub2hUV0d1Q2JKSHpsQjdBU0tBNVFzdEIydy9OMzRXZDJX?=
 =?utf-8?B?L3ZaeG9QcHhjU2lENGg1WWk0dnlDUndvQW1mbnJock1aYU8ycnA0Qk11eEgx?=
 =?utf-8?B?eVhwa2xaS3ljdklUSEJiRDdLOFc4blJYd0lUdE5hNklxM3hQbGNjYjluRVlF?=
 =?utf-8?B?eXpncHJFc1pOOEl6SzloMHplWkNRR1Znb1JvOHhLUHpnVnVrQVpkdHMya0lp?=
 =?utf-8?B?emY1RUZHSFhtRENLN05ReVAwYy9VSnFKVnJ4UDNQWFMzTzdnZjkreW11cURH?=
 =?utf-8?B?dHU3Y21XRmtZMUw4b1oybFdXVXJsQ0g2d0xsNWxkZ1NHejd4RGczRnhuMDdu?=
 =?utf-8?B?NkQ3YjJSa1VyZ0NUR21Od2loaWRYd3RTeDVoTmE0YmQvMlNpcXFINjhieWI1?=
 =?utf-8?B?NjdlYlBheVFqNkE5R1ZvV0hJbUVlR0hBbTVvbWlhY1I4R0NRL21QVTh0eDI4?=
 =?utf-8?B?TS96MmI0N3hBS1FjMlYxK1ZqY28yU0xpRGxjRWxOQnBCVSt3cUJMSWV3SWFa?=
 =?utf-8?Q?LvESDj6Dh5HTKBOY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79ADE3131076CF4687DF06F5D9F44793@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 128d0814-8bdb-45f5-c918-08ded9267493
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 17:13:52.0950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSu5he4VKN7O0VuTuE2/7PCVABQ3OlJu+tps6BnFrNMhS0pwB9QRvp3yvtrtELDSla1FQS1qOkgpIrsdnKSyk7D8WsMRkPgtEI2/A8PCkfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_101401_496336_401CED0B 
X-CRM114-Status: GOOD (  21.85  )
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

T24gV2VkLCAyMDI2LTA3LTAxIGF0IDIzOjIzICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gVGhlIEF4eGlhIHBs
YXRmb3JtIHdhcyBpbml0aWFsbHkgdXBzdHJlYW0gYnkgQW5kZXJzIEJlcmcgZm9yIExTSSBhbmQN
Cj4gbGF0ZXIgQXZhZ28sIGJ1dCB0aGlzIGluY2x1ZGVkIG9ubHkgc3VwcG9ydCBmb3IgSTJDIGFu
ZCByZXNldCBkcml2ZXJzLA0KPiB3aGlsZSBtb3N0IG9mIHRoZSBpbnRlcmVzdGluZyBiaXRzIChu
ZXR3b3JrLCBwY2ksIHJhcGlkaW8sIHVzYiwgLi4uKSBvcg0KPiB0aGUgYXJtNjQgcGxhdGZvcm0g
c3VwcG9ydCB3ZXJlIG5ldmVyIG1lcmdlZC4NCj4gDQo+IFRoZSBkb3duc3RyZWFtIGtlcm5lbCB3
YXMgbWFpbnRhaW5lZCBieSBJbnRlbCB1cCB0byBsaW51eC01LjE1IHdoZW4NCj4gdGhlIHByb2R1
Y3QgbGluZSB3YXMgZGlzY29udGludWVkLiBLbm93biB1c2VycyBpbmNsdWRlIE5va2lhIGFuZA0K
PiBFcmljc3NvbiwgYnV0IGJvdGggb2YgdGhlbSB1c2Uga2VybmVscyBkZXJpdmVkIGZyb20gdGhl
IG91dC1vZi10cmVlDQo+IGRyaXZlcnMgcmF0aGVyIHRoYW4gdGhlIHVwc3RyZWFtIHZlcnNpb24s
IGFuZCB3aWxsIGJlIGFibGUgdG8gY29udGludWUNCj4gZG9pbmcgdGhhdCBldmVuIHdoZW4gdGhl
IHJ1ZGltZW50YXJ5IG1haW5saW5lIHN1cHBvcnQgaXMgZ29uZS4NCj4gDQo+IE1hcmsgaXQgYXMg
ZGVwcmVjYXRlZCBmb3IgcmVtb3ZhbCBhZnRlciB0aGUgbmV4dCBMVFMga2VybmVsLg0KPiANCj4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL2F4eGlhL2xpbnV4LXlvY3RvDQo+IENjOiBTdGVmYW4g
V2llaGxlciA8c3RlZmFuLndpZWhsZXJAbm9raWEuY29tPg0KPiBDYzogQWxleGFuZGVyIFN2ZXJk
bGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3Zl
cmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4NCg0KPiAtLS0NCj4gwqBhcmNo
L2FybS9tYWNoLWF4eGlhL0tjb25maWcgfCA0ICsrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
bWFjaC1heHhpYS9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1heHhpYS9LY29uZmlnDQo+IGluZGV4
IGQzZWFlNjAzNzkxMy4uZjc3M2E2NmMxNDAyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9tYWNo
LWF4eGlhL0tjb25maWcNCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1heHhpYS9LY29uZmlnDQo+IEBA
IC0xLDYgKzEsNiBAQA0KPiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
wqBjb25maWcgQVJDSF9BWFhJQQ0KPiAtCWJvb2wgIkxTSSBBeHhpYSBwbGF0Zm9ybXMiDQo+ICsJ
Ym9vbCAiTFNJIEF4eGlhIHBsYXRmb3JtcyAoREVQUkVDQVRFRCkiDQo+IMKgCWRlcGVuZHMgb24g
QVJDSF9NVUxUSV9WNyAmJiBBUk1fTFBBRQ0KPiDCoAlzZWxlY3QgQVJNX0FNQkENCj4gwqAJc2Vs
ZWN0IEFSTV9HSUMNCj4gQEAgLTEzLDMgKzEzLDUgQEAgY29uZmlnIEFSQ0hfQVhYSUENCj4gwqAN
Cj4gwqAJwqAgVGhlIExTSSBBeHhpYSBwbGF0Zm9ybXMgcmVxdWlyZSBhIEZsYXR0ZW5lZCBEZXZp
Y2UgVHJlZSB0byBiZSBwYXNzZWQNCj4gwqAJwqAgdG8gdGhlIGtlcm5lbC4NCj4gKw0KPiArCcKg
IFRoaXMgcGxhdGZvcm0gaXMgc2NoZWR1bGVkIGZvciByZW1vdmFsIGluIGVhcmx5IDIwMjcNCg0K
LS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

