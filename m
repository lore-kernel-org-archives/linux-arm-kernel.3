Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE98C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq+1TreuByGdI5aILvKqgzqIz9cLtqHdnWVHFZHd3xg=; b=w/FZUeB20XfVf4nuNaVgzdPRNj
	yvNHY/IO/bDTTievF2PQ28f0NpBIpP4Bm62uRrP6C/aLY+mt4dnH0uh3KnUeno3uDGISPmtoG18yW
	2BH1ix7AE+sN0YqeSwgodO8UjsZEE3Z3MO9bKb2QP3CUS+WQh21mym9DOdTsa066KM3FNIJpWvj7w
	IM9rjcxUnAFX3dXO63OL7W3dB0gzCqdRxvKgq7wPiELtnLDzd5s2a2ftJ/lEYboW0DUXE627GYqWO
	8yRIy82dCP6k2FVJL7m6uaiVFYq679Hjd7i6Hf2JYvhOITiWRbZDWC4Tk9Wv7uc6oqTxWohW57G3z
	UmNa406Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlQn-00000002xfB-2xeK;
	Tue, 11 Feb 2025 08:15:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlP7-00000002xK8-0X8l
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 08:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rq+1TreuByGdI5aILvKqgzqIz9cLtqHdnWVHFZHd3xg=; b=ksLtfIVvAWEdl5/A3JCNACRDy+
	TumgFZ0oeW9aODQakX7l9Q50otEcwzZi940Wx0YB67wvELoaXDWbzHPrS5GPpcglvVaRHjb+qJa+2
	OuPZVLl0i5n9NNPCbDh2otS7XD0yCm/PXsOIcc5lLREfarvzvnL3pQAz6mAIPuU7qP4XjF5nDmyhS
	pjQwVkHxAucUm/31Jx6zCulpZnEoOM4yP8FvsUuSnsSpZsmVV0BdIfNO4z0QAXZgQwfww4074xNUo
	toMrQAIQkQo7zMkaZjHJPOYRQhy/uKFxmK619ETcQLXJFPxwVgE29QStYIQS1eiRhOS/ETsVt+7Vg
	nC6hADcQ==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlP3-00000000WGQ-0gIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1739261637; x=1770797637;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rq+1TreuByGdI5aILvKqgzqIz9cLtqHdnWVHFZHd3xg=;
  b=JHpaCC9KymlzW0vIN3DG+rxjBYpLZR5Ti/iaw37Choagdw6lXW0YUfVQ
   DErEoC8Hmu3GXcx7jj9joBS2pgqGU9ZRqnQKyzoTZP3SvU5xh2yTZuvuR
   2nxOZVg9afhJTHgVs5yUi/fxbevgEWP/1fuau2mRrEPROlJsyWNgOHuc2
   i3AfevHBxgcN6bjoCV4QTi2ZcVpaO2tceJTZFOR/iSQJI8muCGghx6V1L
   fitHhqhCCzyaJzGIUl3O/pp3egRRNFVs1Q4Hn7rXeGOgnALYDsJm4BPlh
   BwsWVFMKah5KULbItXfXlIQ3C+ea3Lk17CaweTeJhO2dhlxm0CYWnmsAx
   Q==;
X-CSE-ConnectionGUID: a0eD3MOnTjmIxGhUGi9Uhw==
X-CSE-MsgGUID: Pnps0B/2QQC/Gyg0buD2aQ==
X-IronPort-AV: E=Sophos;i="6.13,276,1732550400"; 
   d="scan'208";a="37544571"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
  by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2025 16:13:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElxFtGDEEGwRO/l4CZvjnm9gNgI3odbS7cMI1ZtXwTzOO0nmv6vbXm7Z4Euh5uIusFwW2Y9Fgut8FuYebcIDcbKRYp6mFh/QEOi6bpaUjNCp75ToHBlQ4SPuc1dvMTYDHN8zHUywXeosYU+IIp0HV5EpILmGb4Ij9gOG4Ds5UpnHDydraZrRMfq+e0JsEZouuGNndRUF/MpyfXNbVkLenZrhKSc7IRK8CL3A7NRAPBybK+AaqmCLXY3hVoBSwXt56i20Uhby84NPjNskYnhU8jSur3WIVyZaYZvF8m5v1zgPJ1LAp0vTY+d/kBAJUyrsctMEhZDj0au2txfm2I+J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq+1TreuByGdI5aILvKqgzqIz9cLtqHdnWVHFZHd3xg=;
 b=eAKt1Mf+waaUzAUF/WlQk6Kv5wiY16mFhktOLzKy5P7LoJZrF8+p8BInuFOEbUX4vhvFNDMshiPqmb3uHK5DjxIoYCZ/E8MVCWaiMS2PSSyOPnyqp/pUn/MYBsXpgaMg3GexXNeYwISXab7SGM4E0cT18zGdfDSUWMGF0PG1AOqHF2CXZVamYaKW3YtMfjElcySfOEbWfOhr18qgKcI6TfHww/FZJBGtKnY24rXhe5Bfe98bR04LlIrZ6Cy3zw7rmLY3z9CUHe9CKJQrncyoQ18QLjKy2fH7l1fxzuEJEJ1H6bba04Yzc+R44uGd+50bJCQRyQwG+fHgBgDhso3xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by SJ0PR16MB4223.namprd16.prod.outlook.com (2603:10b6:a03:324::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 08:13:47 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::e087:8329:baea:5808]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::e087:8329:baea:5808%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:13:47 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Kamal Dasu <kamal.dasu@broadcom.com>, Jens
 Wiklander <jens.wiklander@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "f.fainelli@gmail.com"
	<f.fainelli@gmail.com>, "bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
Thread-Topic: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
Thread-Index: AQHbe96hg6lVP+XIuES1HZwNeWffYLNBwQAw
Date: Tue, 11 Feb 2025 08:13:47 +0000
Message-ID: <PH7PR16MB61967C18645C64E582B222B6E5FD2@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
 <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
 <115a59e1-75b2-4d09-bbf9-50dfcd2b62dd@broadcom.com>
In-Reply-To: <115a59e1-75b2-4d09-bbf9-50dfcd2b62dd@broadcom.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|SJ0PR16MB4223:EE_
x-ms-office365-filtering-correlation-id: 3a7ac44f-b6b0-4fc5-5009-08dd4a74026e
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enJaZXFpRVljbzNMN3Y2Mlg4QmNJQlJYWC9yYnBTYTdMK1ozUm8yWFU1Nmpr?=
 =?utf-8?B?MHlVWGJOSElxeVBLWkUwbWs0YzBjVUUzdGQ5Z05HNmhnU3Vpa0xOc1dYQXhZ?=
 =?utf-8?B?cUd4T0lDUG9HemZuWXloYlh1RGhNbVdhaVZnd0JoWS9QQnltOC9TVTAyTzA0?=
 =?utf-8?B?Nmt1M1ZvUTIyY2o2bFdwVlZHc3U0OTZTM2RxM3RDNjRHMUtJL0hhVERZb3ZL?=
 =?utf-8?B?SzdZV1VQVTZYRTZSOVgxQkhCa2hQZGNwdW52SnEyMUw4ZENzTHVDaFpsMnR4?=
 =?utf-8?B?NDIxWVJTZW9XMmNyRCtnNFhxdXpQckFETlRFbFYxTEVmUFJ3a3BES1krVmt2?=
 =?utf-8?B?Q3hvZHJ3VWpTYXdsTUszTk1NQTVYVzNOb2RGWEdtZEFKbGw4WmZWdklRcFdp?=
 =?utf-8?B?ekRyZE9PakFnQkJZd1N5UUdOdzZ1TWZnRTBpUjAzR1VYS1BOYjBWdTlEOWxv?=
 =?utf-8?B?SHUrdVU4QWE3Y09QUnhMZlBYcDBzelJPNHVSak44YXpSMURFTWhJbXh1aTdB?=
 =?utf-8?B?K1cwSjY1Wm8wUWhGdDRZZDB4amh6bHd5dko5NWc5alpJWFV0OXhZbm5zT3Bq?=
 =?utf-8?B?aGx3aTlRY0ZFb1NLK3NVdmxVL3AvOVJYN2lUVURNSDh6OHZKdGNnUjVjbTQz?=
 =?utf-8?B?T1B2RkJXT1ZvYzNsY2lXc3R3cWVCL0szRkF5VkM0ZDBVTXhCMkdvZUl3ZTEw?=
 =?utf-8?B?a05jVHVNT3R6VW91VGF6VTUraWVPT3dRT2I1N3pUNkFUSm9ieEpuS0lLQ2Z0?=
 =?utf-8?B?NmUxT203NERoOUpFakJWL3p2aUpaQTZienJUd3NRM2NhaVVILzZ5MC82aDhY?=
 =?utf-8?B?bWlUYzRKbUNvZ1hWeGVZTnFJckxuUWlDL0RuYXJSMGpwMStNaUUvajNZVHBk?=
 =?utf-8?B?WTUxaTBFbGxMSjMwUU9QMCtKT3l5UjdEVGRkMWdiUm94dkkzcUJLdjVkUDlZ?=
 =?utf-8?B?b1hCUlR6eTBWQlFyNm9LNS93R0NBc0E0R0tidWtNQUdWVERuR2Uwa2o4Tzc2?=
 =?utf-8?B?eUFUUmpIMFJxVzY3TzNQWnlGaDdkdzBtWDdxQnp0SGpsQ1FEQ2lCNFNHOFJN?=
 =?utf-8?B?UVhwb1VPZ3prMzBqNy85ZjlFTldFeE53eGJGaEpzVnRWYUxmYUhSY0FpZ29v?=
 =?utf-8?B?dWQ2Q25sa2FGSWk5Y1hEajFkdS9JQktwTnZwT29wcE50TXVKR0p1ekk2b2lt?=
 =?utf-8?B?amFtcXl4MnVTVE5Ga0pWMnRNWlorM2t1Mmx5Z1RjNnlQeGtoWjZIMzRvNUM3?=
 =?utf-8?B?ZkJMYUtVNmN2RVVaQlFIQnArNFg4emU1dVVhWWF5c3p1WmpHWWNvTll1S2l4?=
 =?utf-8?B?UUMrLytTTkkyV0dYRk9sU3ErcUdrdXNZaDFzYUw4bmxXekNkc2VKb1hZd2R2?=
 =?utf-8?B?ek1tcFBJNXVFbFZxTHFsOU9JL3NLRVpNZDViQ2o0dS9nTUd2K3VYdXVYMjc4?=
 =?utf-8?B?NFRUY08wMVQ3MHhGRzJBZ1didXZ0YkJXRDVuQlRaSlQ0SXMraFVMZXZXa2Yy?=
 =?utf-8?B?b1kwL3A4aGREeGxSV256WXZML1A0Mlk5cHlyYVhMdmpiUnlpKys4NUpsdWFU?=
 =?utf-8?B?TTZuZVlWSHdySkt4TE5LdU90d1NaKzdLNW5XTlRVQ3czNkhvekJwL3hRT2c5?=
 =?utf-8?B?dkNNeFFBd3k2UlRqZm9ud1RrNDRsSTVlVVhXK2F6TkZSOENFTVgwdmpDT3Fs?=
 =?utf-8?B?NVdTS09HMHhic1NEdE5FKzNDN3pVTUVHMTloSVJOOVdXRGFCeXZYYVNzZHRC?=
 =?utf-8?B?STV4WUVDbDhlNmxHMW1lT2R2amFlNlA5Wk9jNVJMeHM0NWE4WmZWTnV4c0dp?=
 =?utf-8?B?T3FONEgzTkp4RGJXSVZ2amJJc2hvb0E2M3hDeTVyNlMyRCs1M0h1RWgwQmZa?=
 =?utf-8?B?WlBmN2NyYVhwckp4L3NmQmpQdG9pS0l0YTBrcDRsUzZWdmh6VUI3ZjJWL0ti?=
 =?utf-8?Q?DSRT88hIJD/hlJmok72uQRMNsX6iauY3?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlRucTRJK04ydmdnSVVjbGwxdi80Yi9GSnpxT1RvRUo4NnZ1L3pkNmFFQlRC?=
 =?utf-8?B?K0lyZDN6alpTZkFNWWEwaE5pV2pXakNreGxWRldsaUdmZTNKdzcwbTRobVVa?=
 =?utf-8?B?eWRDRysweXprUjZYamlkc1BvdXFRZVpkVzZ6b0UyeEMrWDYxclc0TWlRTmtT?=
 =?utf-8?B?NE1Bcnd3NVZ1SG9Cb1ZWc0JZdFZLanJkNDRPN0MvVlppSmhmeWJzT09YNUVW?=
 =?utf-8?B?Ly9Cb0E3a1FSa0NicmducEt1UUM3QzlRdC9tWFI4YXk0ZmFwTE5rV0tnUUdV?=
 =?utf-8?B?TitheFZESzNhSXhKbUl6MzNjbmhqNXFzVGJ5UkgvR2QrWEIxdkp2Zm41aHpF?=
 =?utf-8?B?R3V1L1BqUnNDdjBZcytWd21DdiswRzlBYnJ1SCt1ZitSOU1ZRUFXdStJaU1s?=
 =?utf-8?B?bjlkbmprZC9XRUMxZmljRGpKYWZ3QVZ3LzBiZUx2QlhSVUVHd2c4NWVaS29n?=
 =?utf-8?B?OWJxOHV1VnFSMjhTMW5KbUd1VGFJeHA2Ymk0d0JvcW1sdlVUV0NQSU15Nllp?=
 =?utf-8?B?MW1uWkFCQ0tkYW1ZMGV4cW9uM2NhUmtEUWR1V2pIUVVKcFc5SmtmVmZORU5T?=
 =?utf-8?B?Y0NnSkIvWmJzT0RWZ1NxMWg4cDRDSDJmZGE4LzJwWjE4MVNiSVVaWG5FUlhv?=
 =?utf-8?B?TWpSVmNCZlJtSlRsMWtBbUVWN3ZtSG5XVlJRSlROeW9kc1cvSXpLb0Jtdlo1?=
 =?utf-8?B?SEtTWEJzNEdDRHZvYWNPS2dXemdOeU9DbW8vdkZvUVd5V0hRbzlCVmhXeXZP?=
 =?utf-8?B?L1lNREJBdkpha29kSXArR2tzb2N3elhUY1VTMW16em9GNnpNbk93WmtOdWdR?=
 =?utf-8?B?cm5CRCszNFVRR1ZYaTRwVjlRMG01TmN5bW85Q2hYYUZVQ2RCZFF0MnBCdEgz?=
 =?utf-8?B?QXFwWjlnWGllT0VrOUVaY3JuVytXamYzTkszbW9iS2R2VEUxWHY5c0FYNkFB?=
 =?utf-8?B?bFpTcGUvVi84eGxUN0RCOGg1SURZc2RTUktxOGxuelVuRzBOVmZSa3NRNmw1?=
 =?utf-8?B?MlBTaTNPUmFUSUF1UVZnZENUM1g5dy9pekZVY1RYYTV4MHFOVWtldHRMWUpH?=
 =?utf-8?B?VEVWRzN3NGNHdys0VE0vR01wYmtETmFLTEZqQXBwREhZTmlOTUs2ajBCUGEw?=
 =?utf-8?B?Yk1CTThxbXhRNGtJTjFtNWFhTHBFQlVzM2NsNXFISzlGelZjQTNLZ0JJcUJw?=
 =?utf-8?B?djlVYlNjTHJ6NUF6SmRWZ1VkdDhSS3M5V2JTOSt6WHZlanUyV1E1SnBWV1R1?=
 =?utf-8?B?eEZRTmtIYVhUWDhGZ2tKR1pTNWlCRWVlUG5teUFmY1pFbDkxdVhBR1Y3VnZK?=
 =?utf-8?B?dTJmRGExdGZXbHpMelNSTFh0TVZ1NWcwUi9MQngvYmNaeDZXRnVZVHo0OVNR?=
 =?utf-8?B?V0RHU0NONU1BTEhsb053Rzh5T0lPYm42NzJxeVZyY1NQbmdaeWJ6enpiTnlZ?=
 =?utf-8?B?dkNCajh6V0RzeGdvcUp2VnVxeFdaTVB4UWsrdHl1VEs0THhscGpGZnBkNFpO?=
 =?utf-8?B?cGhLMk5uT1BnbU5DRlNSeERNR0RFaFNxMWpHUVVTY201NUhjVmRyWHJnNkI1?=
 =?utf-8?B?Y3lRZTBKY1ZTY1JpTXpTMHRmWWMrUFRMZlBEc0J4dXNnZHZIU1RzRytFMzEv?=
 =?utf-8?B?ekV2Z20zbmJabVJ3UjVweVY2U1JlOGlxYWhyNEFXUXk5U0lxa0ZZTjhESEhW?=
 =?utf-8?B?cjFDdjJNTFNoQ3ZyZzNYUUQzUm9uYzZSWC8xdFlBaXI4M1RLVVNjdGg4dHF5?=
 =?utf-8?B?QlhLT0MrazdxamtIR2pwdGNVUmcyRCtNYjdnSFJneVBzYVhFaDNJdStRS05V?=
 =?utf-8?B?aUhBMG1IZ2VUY3QrSVpQQTdHTm8welpxS3Q2YzB0cGozdWJWeGpUMVZjb0c4?=
 =?utf-8?B?NTNvYzRHVnA2bkRVWkZXd0svaldjTFdQNFozMC9UREpDM05HaklYNTRqR0x5?=
 =?utf-8?B?REc0elo3cTEzYWh1YlYyVEsvRjZJV3p1N2d6MDFHM0VPaHJ6TEkyejROc2c0?=
 =?utf-8?B?aXlxeFZqVnFHUHEwdjRmWWFXaElQMyttaGVmVWdYVlpqQitBemFNNHhpM29B?=
 =?utf-8?B?eGQ3MDRJRVl4OEdzdGE1bEZ4Qmd3N3ZZV2ZnYldWcUdFWTloNXc1eXRNMEIw?=
 =?utf-8?Q?JsmptgYgOj3+sfCBkyhjfXwON?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SaqlZBV4NFEdIzsXUQWzeSPGZR6W1mqwuQ+wiLsoS/JN9fhdg8FOLtIttvh5vu+YIv4T7NsvyNRh+38kGRJn7d91feimjmKvKHUgevHvr1AkKZIESCyNHAhpyLiVj+yotG3Rteg5B/vMACZain9M3eJMpHufPQfv7fwFjaAEP7TnJN+RabxQUDNPUn8MlpnZdxMgI5cDF0Qkjy8ocj9UdIUl2ytCDKlhyXRiYzmHwIJcJ139XGmidJGHj3dLILd39qbZ5TuFVUa02xPN5/dhYG62F4iFnyxhUHbpAVTfxW4UgUFacyVtJ3qD54laXlF3O80i51QMXM/UAarxVvTiBDpI4Ka5czDOFete8e5p9UbK4/eW97Cj+TWEuV2SivvmbXuZ0BcOPm9VKr3sLCR46YDHaSJnwUQYRLDsTDGEb0YVLPXWtd3K6BMg6IIvNQsGuJsA1inEWh84NkJxktnAfBA5bqJkESbGF4vekAp+M4ugavz4uhdx/19wHPu7MdOnEWDxf7Xrlrp5+rIKs3q4Qk7fq8MOuBhwKw3G2lzjaUdUGZk6vXsgWS6cN9XV7q7s98i44OQ5hs9hkcLjVtHwBPYMbaUAhVDdWwxxgxobEhuQE5k8z3S+baQv8CG0555ba06cTS1iRQfhgj93ZYLytA==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7ac44f-b6b0-4fc5-5009-08dd4a74026e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 08:13:47.3882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6/ii8pcxWVFLu9MU9woIZhOnY3oTGk1gBl7oMau7BLDpxUsihYs9O9JSke/YWYgA/1ObciGM6Gf/caS0kIpnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_081357_872988_564F1106 
X-CRM114-Status: GOOD (  26.04  )
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

PiA+PiBUaGlzIHBhdGNoIHNldCBhZGRzIHN1cHBvcnQgZm9yIEJyb2FkY29tIFRaT1MgdG8gcmVh
ZCBhbmQgd3JpdGUgdG8NCj4gPj4gUlBNQiBwYXJ0aXRpb24gdXNpbmcgc3luY2hyb25pemVkIGFj
Y2VzcyB0byB0aGUgY29udHJvbGxlciBoYXJkd2FyZS4NClByYWN0aWNhbGx5IGl0IGVzdGFibGlz
aGVzIGEgY29tbXVuaWNhdGlvbiBjaGFubmVsIGJldHdlZW4gdGhlIHRydXN0IHpvbmUgYW5kIHRo
ZSBob3N0IGNvbnRyb2xsZXIgcmVnYXJkbGVzcyBvZiB0aGUgcnBtYiBwcm90b2NvbC4NCk9yIGRp
ZCBJIGdldCBpdCB3cm9uZz8NCg0KVGhhbmtzLA0KQXZyaQ0KDQo+ID4+IFRvIGFjaGlldmUgdGhp
cyBMaW51eCBPUyBhbmQgdGhlIHNlY3VyZSBUWk9TIG1ha2UgdXNlIG9mOg0KPiA+PiAtIHNoYXJl
ZCBoYXJkd2FyZSBzZW1hcGhvcmUgcmVnaXN0ZXINCj4gPj4gLSBhIHNldCBvZiBTRElPIHNoYXJl
ZCB3b3JrIHJlZ2lzdGVycyBhbmQNCj4gPj4gLSBJUEkgaW50ZXJydXB0IHJlZ2lzdGVycw0KPiA+
PiBUaGUgc2RpbyBzaGFyZWQgd29yayByZWdpc3RlcnMgaW5kaWNhdGVzIG5leHQgaW4gcXVldWUg
dG8gYWNjZXNzIHRoZQ0KPiA+PiBjb250cm9sbGVyIGFuZCBjdXJyZW50IGFnZW50IGluIHRoZSBx
dWV1ZS4gVGhlIGN1cnJlbnRseSBydW5uaW5nIE9TDQo+ID4+IHRoYXQgbmVlZHMgYWNjZXNzIHRv
IHRoZSBjb250cm9sbGVyIHB1dHMgaXRzZWxmIGluIGl0cyBzbG90IG9mIHdvcmsNCj4gPj4gcmVn
aXN0ZXIgYW5kIGlmIGl0cyBuZXh0IGluIGxpbmUgaXQgY2FuIHRyeSB0byBncmFiIHRoZSBoYXJk
d2FyZSBzZW1hcGhvcmUgYW5kDQo+IGNvbXBsZXRlIGl0cyBtbWMgcmVxdWVzdHMuDQo+ID4+IE5l
eHQgYWdlbnQgcXVldWUgc3RhdGUgaXMgY2hhbmdlZCB1bmRlciB0aGUgaGFyZHdhcmUgc2VtYXBo
b3JlIGxvY2sNCj4gPj4gYmVmb3JlIGl0IHJlbGVhc2UgaXQgYnkgbG9va2luZyBhdCB3b3JrIHNs
b3QgcmVnaXN0ZXIuIHNlbmQgYW5kDQo+ID4+IHJlY2VpdmUgSVBJIGludGVycnVwdHMgYmV0d2Vl
biBsaW51eCBhbmQgc2VjdXJlIHdvcmxkIGFyZSB1c2VkIHRvDQo+ID4+IGluZGljYXRlY29tcGxl
dGlvbiBvZiB0cmFuc2FjdGlvbiB0byB0aGUgd2FpdGluZyBPUy4gVFpPUyBoYXMgaXRzIG93bg0K
PiA+PiBSUE1CIGRyaXZlciB3aGljaCBhY2Nlc3NlcyBwYXJ0aXRpb24gd2hlbiBpdCB3YW50cyB0
byByZWFkL3dyaXRlIFJQTUINCj4gPj4gZnJhbWVzLiBDdXJyZW50IGltcGxlbWVudGF0aW9uIGFz
c3VtZXMgTGludXggYW5kIFRaT1MgYXMgdGhlIHR3byB3b3JrDQo+IGFnZW50cy4NCj4gPg0KPiA+
IFdlIHJlY2VudGx5IGFkZGVkIGFuIGluLWtlcm5lbCBpbnRlcmZhY2Uvc3Vic3lzdGVtIGZvciBS
UE1CDQo+ID4gKGRyaXZlcnMvbWlzYy9ycG1iLWNvcmUuYykuIFRoZSBvcHRlZSBkcml2ZXIgKGRy
aXZlcnMvdGVlLyopIHVzZXMgaXQNCj4gPiBybyByZWFkL3dyaXRlIGZyYW1lcyBhbmQgcm91dGUg
dGhlbSBmb3IgdGhlIHNlY3VyZSBPUy4NCj4gPg0KPiA+IFdoZW4gdGhlIG1tYyBzdWJzeXN0ZW0g
cHJvYmVzIHRoZSBlTU1DIGNhcmQsIGl0IHJlZ2lzdGVycyBpdCBhcyBhbg0KPiA+IFJQTUIgZGV2
aWNlIHZpYSB0aGUgbmV3IFJQTUIgc3Vic3lzdGVtLiBJbiB0aGlzIHdheSwgaXQgYWxsb3dzDQo+
ID4gY29uc3VtZXJzIChhcyB0aGUgb3B0ZWUgZHJpdmVyKSB0byByZWFkL3dyaXRlIHRvL2Zyb20g
aXQuDQo+IA0KPiBZZXMgd2UgYXJlIHF1aXRlIGZhbWlsaWFyIHdpdGggdGhpcyBzdWJzeXN0ZW0g
YW5kIHRoZSBtYW55IGl0ZXJhdGlvbnMgdGhhdA0KPiB3ZXJlIHByb3Bvc2VkIGJlZm9yZSBpdCBl
dmVudHVhbGx5IGxhbmRlZCB1cHN0cmVhbS4gQXQgdGhlIHRpbWUgdGhlDQo+IGhhcmR3YXJlIHdh
cyBkZXNpZ25lZCwgd2Ugd2VyZSBub3Qgc3VyZSBvZiB0aGUgZGlyZWN0aW9uIHRoYXQgdGhlIGdl
bmVyaWMNCj4gUlBNQiBzdWJzeXN0ZW0gd291bGQgdGFrZSBzbyB3ZSBkZWNpZGVkIHRvIGFkZCB0
aGUgc2VtYXBob3JlLCBzY3JhdGNoDQo+IHJlZ2lzdGVycyBhbmQgaW50ZXJydXB0IGdlbmVyYXRp
b24gY2FwYWJpbGl0eSBzbyB3ZSB3b3VsZCBub3QgYmUgZGVwZW5kZW50DQo+IHVwb24gc3VjaCBh
IHN1YnN5c3RlbS4gV2UgYWxzbyBoYWQgb3RoZXIgZmFjdG9ycyBwbGF5aW5nIGludG8gZGVzaWdu
aW5nIGl0IHRoZQ0KPiB3YXkgaXQgaXMsIHN1Y2ggYXMgYWxsb3dpbmcgZm9yIE4gcGFydGljaXBh
bnRzLCBpbmNsdWRpbmcgYW5vdGhlcg0KPiBwcm9jZXNzb3IvZmlybXdhcmUuDQo+IA0KPiA+DQo+
ID4+DQo+ID4+IENoYW5nZSByZXF1aXJlZCBhZGRpbmcgdHdvIGNvcmUgbW1jX2hvc3Rfb3BzIHJl
cXVlc3Rfc3RhcnQoKSBhbmQNCj4gPj4gcmVxdWVzdF9kb25lKCkgdG8gbGV0IHRoZSBob3N0IGNv
bnRyb2xsZXIgZHJpdmVyIGtub3cgd2hlbiBhIG1tYw0KPiA+PiByZXF1ZXN0IHN0YXJ0cyBhbmQg
ZW5kcyBzbyB0aGF0IHRoZSBhY2Nlc3MgY2FuIGJlIHN5bmNocm9uaXplZC4gVGhpcw0KPiA+PiBo
YXMgYmVlbiB0ZXN0ZWQgd2l0aCBib3RoIHRoZSBzZGhjaSBhbmQgY3FoY2kgYWNjZXNzLiBDdXJy
ZW50bHkgdGhlc2UNCj4gPj4gb3BzIGFyZSBpbXBsZW1lbnRlZCBieSB0aGUgc2RoY2ktYnJjbXN0
YiBjb250cm9sbGVyIGRpcnZlciB0byBhY3F1aXJlDQo+ID4+IGFuZCByZWxlYXNlIHRoZSBoYXJk
d2FyZSBzZW1hcGhvcmUgYmVmb3JlIGFuZCBhZnRlciBhY2Nlc3MuIFRoaXMNCj4gPj4gY2hhbmdl
IHRvIHRoZSBtbWMvY29yZSBkcml2ZXIgZG9lcyBub3QgaGF2ZSBhbnkgaW1wYWN0IHRvIGV4aXN0
aW5nDQo+IGNvbnRyb2xsZXIgZHJpdmVycy4NCj4gPg0KPiA+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
dGhpcyBpc24ndCBuZWVkZWQgYXQgYWxsLCBhc3N1bWluZyB3ZSBoYXZlIGFuDQo+ID4gaW4ta2Vy
bmVsIHRlZSBkcml2ZXIgdGhhdCBjYW4gcm91dGUgdGhlIFJQTUIgZnJhbWVzLCBidXQgbWF5YmUg
SSBkb24ndA0KPiA+IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIHVzZSBjYXNlLg0KPiANCj4gVGhlIHBy
b3Bvc2VkIHNjaGVtZSBoZXJlIHNjYWxlcyB0byBhbiBhcmJpdHJhcnkgbnVtYmVyIG9mIGFnZW50
cyBpbiB0aGUNCj4gc3lzdGVtLiBPdXIgaW1tZWRpYXRlIHVzZSBjYXNlIGlzIGZvciBib3RoIExp
bnV4IGFuZCBhIFRydXN0ZWQgT1MgKG5vdCBPUC0NCj4gVEVFIGJhc2VkIEJUVykgdG8gc2hhcmUg
dGhlIGVNTUMgY29udHJvbGxlciwgYnV0IHdlIGFsc28gYWNjb3VudGVkIGZvciBhDQo+IHRoaXJk
IGFnZW50IHdoaWNoIGlzIGEgcG93ZXIgbWFuYWdlbWVudCBtaWNybyBjb250cm9sbGVyIGZpcm13
YXJlIHRvIGJlIGFibGUNCj4gdG8gcGFydGljaXBhdGUgaW4gdGhlIHNjaGVtZSBhbmQgb2NjYXNp
b25hbGx5IG1ha2UgaXRzIG93biBlTU1DIG9wZXJhdGlvbnMuDQo+IC0tDQo+IEZsb3JpYW4NCg0K

