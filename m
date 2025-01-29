Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F6AC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTS1SKnbmw1KvhtD9VwpUmAaG4gqdFDgyDjw2iInKWk=; b=v2geydi9AGLBK31/Oe7OeHoa99
	o8qKtr8Ipr0mN8UIDU7lI7qTVukpyati/P8DRBL9SKGtR/7RLFitJO1UOI4w0+FgEH5gkJnDc295h
	v2m3Z8ebl6NDRga+lxlBfSxX/4e7zpLhMSSJPvTl6jfrCw4OTJgRBXBsukv68DeVzpWKlPQtnfoJL
	HCQ0eqSJRJYdwY3HKO1QIrL4sbLnrLNYSwzs5GAkrHTOo7/whWTVTxDFH6NP93xe2XMPZVy1LC0GX
	q1mLUfehlpg4rbEtxijsuYnaO0c7SaSbC8OM54VGhx7Sbr1A+7mGcFAXBHMul7NW1mOS+JpyAPonS
	D/4fIJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td5WB-00000006l93-1yPv;
	Wed, 29 Jan 2025 10:41:59 +0000
Received: from esa11.fujitsucc.c3s2.iphmx.com ([216.71.156.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td5Uo-00000006l1F-1TZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 10:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1738147234; x=1769683234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=41Ip1SvuOollES0llFlJeVMOz8qhzQ8dY7UTAdE5Gx0=;
  b=G6x2dV69qHNHNgXoAMGUIr5sO2rml07DCkx/r/K4T90OtwC5fyVVA0WK
   ycQWPuxo8WrzjfQLUGO5DZS3cwjq626ASgpdgtbM642eo+aAEeDqrRhUN
   llS/zffqfZrbZsuWVN+wPkbnmIRVduo7E/dXP0U1RKEzH3T+nGhHb9oKL
   y7p9CjbIxOH9BNb4+3keLopc1HsF+RwvG0XR3LkZQ8PIHZacYHC6HZoRv
   wS2/IWXmgxbuwEdMrzIzzC2srJ1F2p7JKcTdLnZkIcvTagdWDqpaXjUMN
   J5j7O2dC9nCyiO6z25yObrU0ItubpFkBs1xbW881T+pAxIm+InTcVuaDr
   g==;
X-CSE-ConnectionGUID: 6N/3xc/ERKuQ4sXVQpTIUA==
X-CSE-MsgGUID: R8N0d+zrSH6B5pU23GRMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="145503658"
X-IronPort-AV: E=Sophos;i="6.13,243,1732546800"; 
   d="scan'208";a="145503658"
Received: from mail-japanwestazlp17010000.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 19:40:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAbljRarJdy1DS04u2/5DcBAOVxeexmbfVQy4wQUVmO6C/8YiwCmSro+D9jGR1v0pVv7WrlOaXfrxxbjTfEMTZcVdsTIHtORrCV+2bDai1A9AWpa83ETgGrztyTpj0sQvSYv6elRwosE/tdzwPWSqG6vMWjwYL9T+r4gRZj//ts7V5EmhHfgvLKBKtVZgGBeHmvzWbE87EUl/j7gwNmq3H6QO6NK497Xd8HlcVhi0gSRevSE/RNJloAqO2k8L2o0a3WrVfBMJlUOuuQ0noV3UFA3TeQueUbPirTQtjrgjuf8KhfSuxP88tteN/lC/C3Ls37QIsNeUykT/ShelEXwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTS1SKnbmw1KvhtD9VwpUmAaG4gqdFDgyDjw2iInKWk=;
 b=ArxSEvKcQuBT9YCbBQ4Q/gWxMDj/sA6q18GdBEYguEldHim5GYOm89VusnoYUoYAemiwhN9kbrcg9vm/u4kYhvwRKNJcKkDZdz+LvtByyD7/FYSLw9ZhAeEV9ApRhxJLpV4L+Wji9Rqe7zHsyFvaMYEbOZruVcVVxb/YthmPHnfVMKwbYRGT7H3xIitfH5AgxEvVd98YjmJ/Agj1PFPWB47HINlJkDfLnzH2GwxC2SHCx3CKb/vmLa9iV5YavOR3GKdQrfqaG8rbRmrLCOwssLruWTlYcrj8Le263LYrm0+LWB6LwzxH2aZdeZEIZ68eccks8ADvrUg3c40bOfhKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by OSZPR01MB7770.jpnprd01.prod.outlook.com (2603:1096:604:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 10:40:11 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%4]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 10:40:11 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Dave Martin' <Dave.Martin@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Zeng Heng <zengheng4@huawei.com>,
	James Morse <james.morse@arm.com>
Subject: RE: [RFC PATCH v2 06/11] arm_mpam: Introduce flexible CLOSID/RMID
 translation
Thread-Topic: [RFC PATCH v2 06/11] arm_mpam: Introduce flexible CLOSID/RMID
 translation
Thread-Index: AQHbaPIXAsM4v2Ejj0+4N9DQJVV+0bMtocSQ
Date: Wed, 29 Jan 2025 10:40:10 +0000
Message-ID: <OSZPR01MB879854F9606549F19953BFAE8BEE2@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
 <20250117151033.1517882-7-Dave.Martin@arm.com>
In-Reply-To: <20250117151033.1517882-7-Dave.Martin@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=0b4c526c-3cd6-4d97-905b-76e5357b52de;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-01-29T10:37:44Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: 63f8ce3320c24dc29bb510d90982c04f
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|OSZPR01MB7770:EE_
x-ms-office365-filtering-correlation-id: a489b3ab-1705-491c-d12b-08dd40514e6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|1580799027|38070700018;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?Rm1BdXBYWVVzbjF1NGJWU1RFS1ZrN1pMUU9ZaUFpaUtmSitQVXpOemM4?=
 =?iso-2022-jp?B?TlRYSjZweVpXU3FMK2E0emt0ZU5TcmR1Q3NyQ2tGSktWQTRPSUxrNXNj?=
 =?iso-2022-jp?B?OSs2cG9GbmVhdTcvYkptclRRMTVqNnU3S0RSR3psVy9yWmFObVVhZlhi?=
 =?iso-2022-jp?B?ZVlUMGdjYjJvTGhBajY3YXVvcVlBc09PY1pQd1p4QVRSVGtLNUFNdjRK?=
 =?iso-2022-jp?B?WkhzUzcyNDcrVldQL01pMGhLUXVzL01mZlR3dUlsM3RjSlU1NzRVbDRN?=
 =?iso-2022-jp?B?akswb2hVbkxidTNJSDI2RWRJTi9CQi9QeDRZbWpNSjB5OVl5bm9JTllO?=
 =?iso-2022-jp?B?c1lYOGNPa2dCNzlML3dFY2VjTWkwdjJJRk5uWExRVjdQRG04OUZNbkVD?=
 =?iso-2022-jp?B?LzIwdWpXdTkrVTc1bUlHUlFYZXl5b2FObmpVVStpeTJYYlc1Q1lwRCtD?=
 =?iso-2022-jp?B?YnhGZnZ2TmlmUVMwRXRHOE80bUwvZmRNZ04zK1kzYnpoSXpBa2gwVyti?=
 =?iso-2022-jp?B?dzRJNmU1VFNONm1SRzF6MWhjVEpyVjJheUQ0TWZBRDZiQm1GVTVvK25z?=
 =?iso-2022-jp?B?WXMwZGVMK3NLYm1lWDloVWZCV0xqeHgzLzlvM1pocWREbVg4WnFCWGRR?=
 =?iso-2022-jp?B?RDVHbE4zMmF3djJnRWxBK2tTZHoycTZwQnFtL3J4aStXRjdnZWNqSVRQ?=
 =?iso-2022-jp?B?TE1KbWRxMFl2MGRtdEU1bGhNekdyMDBGVS9EdmFGNlpnRXlKZjVlaW9G?=
 =?iso-2022-jp?B?TGZkN0x3MGt3TWR4Tk15T3IzampMVEFMcHZYUUYzZFNuU0Q0S3gzWG45?=
 =?iso-2022-jp?B?NjZSWHUxcGlXNkc2N1Avd25lRWlxcmR2QVFKaVNGNGdOc29tcDFZSUlD?=
 =?iso-2022-jp?B?SmtGaEJ5cFZUU3FacDBTemVuM1ZwSGJZSDY0MUdXdGdvRzcyQ3JJN2Vs?=
 =?iso-2022-jp?B?RjZwYk9HZjQrTnR0dU5aMkFlWStuSFRpSE9hY0lmV05FdmJxc05kb2Zs?=
 =?iso-2022-jp?B?ZzV4bjlzdkFUbmdlTWhXZjF2amxWZkt6TGFtT0dCNElDMUl3cDdZdUhU?=
 =?iso-2022-jp?B?NmVnTGVXTDBUMlNrNU1KdGdOdjNyL0VwdGdBQXYzWDJNYXJRemtNV1R6?=
 =?iso-2022-jp?B?YTREMVVST1l4RDdpQ1VNeTY4TlJpeGdZYXJSeitpOERFYkZ4MlJqa1Bs?=
 =?iso-2022-jp?B?S0M4dThZV1VMa3l5cDAwcmxzcm10M3QyVUZGVFA2eGJrZHkzL2FXeDhM?=
 =?iso-2022-jp?B?bFgyVTR5OS9HeEFBV1hadFplNnFGTkVENFRsRWVzZHNrNzlLSE10M1pq?=
 =?iso-2022-jp?B?cllzSldkdGpoTVJUT1pUdlhJK042cHl3eWJEY3BzTG9OMkhtdEFsNDZ2?=
 =?iso-2022-jp?B?dGYxMlRlbGRmY0R4ajZUSjJNL3ZYbEFHWEdsd2NYcFVIL1krUkhKSlhv?=
 =?iso-2022-jp?B?YVhTeXhuWGR6SGFlWFpmV1QzN0l2QzBYTFI3c2owVEtjYURrRmZNSis2?=
 =?iso-2022-jp?B?RE5NUzdENko1YTRKZ1JPM3ZRb1Q3STcrZldLWFlQcE9Rd1RlWGNqeWQy?=
 =?iso-2022-jp?B?MnhGUzNOc256YUY2OStiMFd6c29WeGFGb0dhdkhmSHZJMkxzd3ErWVRV?=
 =?iso-2022-jp?B?d0laZlZhKzI1cURxM0MzbGpBUlZUaytYcXJVWnY4Smw5VUhWU1RXNkNn?=
 =?iso-2022-jp?B?M3U2RzhHa3IwaEw3dFF0bWdQcUF2MHVOMWllS05TM2RMaXFFYWJjL3k1?=
 =?iso-2022-jp?B?ZFg1OElYMDJpNGIzODVVRWo5QUE4QkpDK2thRUk1RWpDZVhwK1dleU9M?=
 =?iso-2022-jp?B?Sm5jMFZVbzRwMysvRTFtbnNxNG9QeFdjM0VRb0RzUmZleUF0YjlwdUFh?=
 =?iso-2022-jp?B?eUExY2h0L0QwRmFoa0xIVHVZcFlJZmtlUWlkQTFDUnZvYTZzMFkySkpo?=
 =?iso-2022-jp?B?Q0hicU16d0xCdnJmWHkxa1BqRld1a3hJU3lDNGVkdUdFZ204RWRBa1hI?=
 =?iso-2022-jp?B?eXA3Y0RhanpPNW1uZUovWXFxblg3MUh1ZDNMZUFjNWowdUJxek84RlRG?=
 =?iso-2022-jp?B?YkZsNXdZUVNrT1ZlL1Rsc09JMy9pclQ4bytmeTNPaU42VG5CazRmUXpE?=
 =?iso-2022-jp?B?OVVScWFHNGZwS1g0a2xOSHpMQ1RBK2hnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?dktDL0VvNXFJenRZYzB2NlI3azJiUmZTZktNNlBCcHdVZ0s2QnpQQlc5?=
 =?iso-2022-jp?B?NUxTTTJaaE91Ny9zcUpsQVBjdE0rTGdjaUNQZ1Q1NU9NMnVJQ0MrRzFP?=
 =?iso-2022-jp?B?b2cxdW9GaWRXTXBEdk5qSlFFYlBZbEl0Tjhqcm1BZGpIZG1zbWlOeklZ?=
 =?iso-2022-jp?B?MUxvdi9hSGZMWlpldkJRNk9tcnVmaURzYmdnN0xxZmtwaGZEVUZ2eDJJ?=
 =?iso-2022-jp?B?STBmeUI3L1NUZnNWWERvdkF0N25xUTVxTVJQdmJsR1d1Z05yZFpPQlpL?=
 =?iso-2022-jp?B?REM3Q3ZRZHExUEhSakJ1b3VRWHlHdHF2VUlMc25ycFF5NUZDVzBFWWow?=
 =?iso-2022-jp?B?NUxleXU0WUZKaDRvM2dHNU5USFNGdkhJYitETlJrVk1wRTVlTjNIM3hR?=
 =?iso-2022-jp?B?WGUwRitUVjVqd1dPUWk1dmg1a1ZBVFBvd0ZOV2NySWtGSGRISmpYa3Uw?=
 =?iso-2022-jp?B?WHh4cUNwMXVkaEdWalo0cXFCdHFxZUorV3pWbU5tanhNUEdPQTM2OTdx?=
 =?iso-2022-jp?B?TjlFZkRWOHcrMjFXK1Yzc0xpNnRsWUx0Q29BOHhoU2h1OWJjZXdHbjhi?=
 =?iso-2022-jp?B?NnFGaHVCUTM4S2h6WDYyc3ROcnovVEZuejBydXorNEsyc3BOZk9rQXd1?=
 =?iso-2022-jp?B?K0VhNXcwSGxSWlNoTVY3UU04eE9RSkxtaVZPOGF6L3YvZzNWei91MjZr?=
 =?iso-2022-jp?B?aXBtRm1Fc2hKblpBSEhYL0VKLzUwWlpaNTJjRjNJZzhoTzNQWjFiTVpK?=
 =?iso-2022-jp?B?T0hJUEkwWkdSRmZ5ei82a3RLSVlMSm5tNmowSnFzK3FUMVZ4S3BITk8r?=
 =?iso-2022-jp?B?UFFTS2hhdHU2MC9lZnh5a0ozaE9VQWZha3liV0xPRS9DODJzSHdDQ1FV?=
 =?iso-2022-jp?B?OWR5OXV3Ym1VNy9aRkZLaWFhN0lnMXdxTzBVOGw4ZkxJRXBPMnNoQzBj?=
 =?iso-2022-jp?B?c3RvdnN0clpWQjRpUjRrQ1FVYWtYOU02Q2Q1cWVqKzZZeFFQV2dwNFhv?=
 =?iso-2022-jp?B?UXd4NXZJZFpwSDRpV2hiWmdyRStUOE1kQUhBa2ZjVTFzbG02aUx3SFRM?=
 =?iso-2022-jp?B?QnR6RnJ1YmRGd2ZjN3Z5OGtFR0NScmtDMktiV0l2NWNRekxiOElRZzBs?=
 =?iso-2022-jp?B?NWgrcWtXQVdaSkFSbjRrRTlMQ0gvU0NEclA0ekpyM3g2Y2Vqbm51ekwr?=
 =?iso-2022-jp?B?dlZtSU1SS1FDelJWSjdEdmo5VGxCVFJEalZHd3J3ZEpVYVkrVGZZVWNz?=
 =?iso-2022-jp?B?MllXM0RSTXZqMWVjQVp6NXVoaFc5czdJbHcxaWhqSSt1WHN6VDMzMElI?=
 =?iso-2022-jp?B?c3BQRXkrN0ZidEx4S3BqOWZrUFhFSHRwV01KRG5IdVFLOFA5N1V6Z25n?=
 =?iso-2022-jp?B?UXZFOUd5blo4WnUxVFd2RzNJTThYYm5MaFZRN1g2ejY3VnFQemZJeG5X?=
 =?iso-2022-jp?B?a1Q2UlJaSlY1T2hHTVdSWmJwVlpUelJlWmI3a3BNck43RE1qZEJPSlVl?=
 =?iso-2022-jp?B?Rm5sQUFrQU5wdUNubTJSWG0wN1paMDY3NmlmbEMyZ3RuNktNVktVcDU3?=
 =?iso-2022-jp?B?RURNT29VbW9aUHlHQmgzUUk5R3pPcjBodC9rRGVscmZydEp0Y2ZMOHZV?=
 =?iso-2022-jp?B?VzRPL1oxN015SkpIL0NURUpVRzhNNUIrMUdEZzRxQ3pMQm53UENBRjNV?=
 =?iso-2022-jp?B?ZVFzZmE3a3BKdTAzNWZqbnVzRkQ2U29mSHFaZXRZM05NcTNrWHZSWWRv?=
 =?iso-2022-jp?B?VGs0RHd5Nnl2UzQydEU5bkQvczVENWNmczhra3dkZTNlYXlUTTlPU2xM?=
 =?iso-2022-jp?B?Z0kwR2VUK1ZOYlhhb1V3WTFoTnZVeS9nQkRWQmczMmFNWExNZHpPR0k2?=
 =?iso-2022-jp?B?V2pTbjdtZTFFd1FpL3h0VE4rSDduY0xaaXdSVHV2NmpkQVdNbzBjUEdt?=
 =?iso-2022-jp?B?MlNXbGVxYW1DeWI1ek9Wb1c3SVh3QjMybTNFcE82NjdhdWx4YWVQWTE0?=
 =?iso-2022-jp?B?N1NGYUcrYzBZTTNCemFYQjIwR1dlbytYR2JabkZTUGxtOVJxYWpDREdu?=
 =?iso-2022-jp?B?SDdsNjgyNGtkTHZOWnlSOXZYTDZYS0lpZTZnbjdyaUM0dm1UU29xdk12?=
 =?iso-2022-jp?B?YzBHNEJCMU1PQnRIWWptQldpTTY3SXdVSmFCUEpDVDRQbExQYVd3bmN1?=
 =?iso-2022-jp?B?dER5eUphZkx3dDdJN3hGRDBpbm9Tc0lxYTQvYTBUV3h3U3hjZW1FeS9Z?=
 =?iso-2022-jp?B?S3JiNkI5STZSb3ZheG5HTnF3WVM2eEtGRmMvdEhUeExKTDZpT2hZN1g4?=
 =?iso-2022-jp?B?SnowQTlSS1FyeURkQ2tETVoxRmtWVGJSdFE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +uwpuamh637VIPU6HQkzj0UtnQF33kb9qPGBj4vGzbP1mJYvBrY87h6y8C5WN+nsEbUZU5VVAcy0yHiAtz3Sfs7lFy2ZRMQxD14PHHyWCB012SHbi304e0MVJSrYni5I0t60N/Dpg0ey553UxLayqL4VJkfi7l0mLSsyLKhRXgz9jphORsUtW6Wk2zF5mR2llxLz6xsz7og/Ciin8xg7Ufcwi4ehXZ5i+znXoI4MVfYGUmbYO3pAFIli/pk2LzECQV2EaSxpmDdAZPsTYuj3LgSMTDbM1rf6YZsQLsDl+6AMq0EfQvztjGGsOeBe7Wtey+8IojVG2aVeqlgtx3Xw2cvZlo9GpNmvYsHJsVXBG/auKmY2O+oa5kMJ7fpDdp9xP5+55TdE9mNW1mXKScUeB+jEPbyyd6zr+EgOCDhPfBTaL1EZAuZXqroSBMRRRovPVf467ZkeokQHk7LkUk3qtxZq+6d3Li95/hCcd8Nj2JyjXJSJn3lcGFiBefoGCM46oM2yzUsgyhoqCiZZJ3yZgae2cGs9pJHeCOGmLNXziyJxrZos8tsp5bIBXgkFveYEbB7ruKxtFgt8sBQ7FY6hZ6zTKoPHQ53Do+InNYgAejHCU+w62TpwQIaRECJax1q4
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a489b3ab-1705-491c-d12b-08dd40514e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 10:40:10.8596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cwkcXR+JSi2xojx11kYWU5WTsjkcGZWsIMuGCakTmPcidULLLoTqY6hm5MK/uttbsBHcaFLQxRlmt76Ar6Mx9avct8AE5NgGLVUQlWHzGwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_024034_924122_C36F262C 
X-CRM114-Status: GOOD (  17.82  )
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

Hello

> Currently, the MPAM driver uses the resctrl CLOSID directly as the MPAM
> Partition Identifier (PARTID; possibly modified to give different PARTIDs=
 to
> code and data when Code/Data Partitioning / CDP is enabled), and uses the
> resctrl RMID directly as the MPAM Performance Monitoring Group identifier
> (PMG).
>=20
> In preparation for using the MPAM PARTID Narrowing feature to allow more
> resctrl monitoring groups to be provided than the number of PMG values
> supported by the hardware, a more flexible remapping scheme is needed.
>=20
> Factor out ID translation operations in the MPAM resctrl glue code into a=
 couple
> of self-contained helpers, and call them as appropriate.
>=20
> The translation scheme has a single parameter, partid_per_closid, which i=
s
> currently hard-wired to 1.
>=20
> As a result, this patch should have no effect on functionality.
>=20
> Logic to determine / control the mapping parameters can be introduced lat=
er.
>=20
> The ID transformation may be visualised as follows:
>=20
> without CDP:
>   +---------------------------------------------------+-----------+
>   |                       CLOSID                      |    RMID   |
>   +---------------------------------------------------+-------+---+
>   |                           PARTID                  :       |PMG|
>   +-----------------------------------------------------------+---+
>=20
> and with CDP, where the "CDP" field is 0 for the data sub- partition and =
1 for
> the code sub-partition:
>   +-----------------------------------------------+---+-----------+
>   |                     CLOSID                    |CDP|    RMID   |
>   +-----------------------------------------------+---+-------+---+
>   |                           PARTID                  :       |PMG|
>   +-----------------------------------------------------------+---+
>=20
> where each box represents a non-negative integer spanning some fixed rang=
e
> starting from zero, and horizontal concatenation denotes multiplying the =
value
> denoted by the left-hand box by the span of the right-hand box, and addin=
g the
> result to the value denoted by the right-hand box; thus, most-significant=
 fields
> are on the left.
>=20
> (Except for the span of each field not necessarily being a power of two, =
this is
> conceptually identical to concatenation and cutting of
> bitfields.)
>=20
> The dotted segment indicates the least significant part of PARTID, which =
spans
> partid_per_closid PARTIDs and discriminates monitoring groups that use th=
e
> same MPAM PMG value.
>=20
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>=20
> ---
>=20
> Changes since RFCv1:
>=20
>  * [bugfix] Add CDP index properly in mpam_resctrl_partid_range().
>=20
>    (Also reported by Shaopeng Tan.)
>=20
>  * [relaxation] Remove requirement that mpam_pmg_max + 1 is a power
>    of two.
>=20
>    (This constraint is redundant, due to the use of multiply/add
>    transformations of MPAM IDs in place of shift/OR.)
> ---
>  drivers/platform/arm64/mpam/mpam_resctrl.c | 211
> +++++++++++----------
>  1 file changed, 112 insertions(+), 99 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c
> b/drivers/platform/arm64/mpam/mpam_resctrl.c
> index aa8a6c077918..f834753a3274 100644
> --- a/drivers/platform/arm64/mpam/mpam_resctrl.c
> +++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
> @@ -156,6 +156,18 @@ static bool mpam_resctrl_hide_cdp(enum
> resctrl_res_level rid)
>  	return cdp_enabled && !resctrl_arch_get_cdp_enabled(rid);
>  }
>=20
> +static unsigned int partid_per_closid =3D 1;
> +
> +static unsigned int mpam_num_pmg(void)
> +{
> +	return mpam_pmg_max + 1;
> +}
> +
> +static unsigned int mpam_num_rmid(void) {
> +	return mpam_num_pmg() * partid_per_closid; }
> +
>  /*
>   * MSC may raise an error interrupt if it sees an out or range partid/pm=
g,
>   * and go on to truncate the value. Regardless of what the hardware supp=
orts,
> @@ -163,35 +175,73 @@ static bool mpam_resctrl_hide_cdp(enum
> resctrl_res_level rid)
>   */
>  u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)  {
> -	return mpam_partid_max + 1;
> +	u32 res =3D (mpam_partid_max + 1) / partid_per_closid;
> +
> +	WARN_ON(res < 1);
> +	return res;
>  }
>=20
> -u32 resctrl_arch_system_num_rmid_idx(void)
> +static void mpam_resctrl_partid_range(u32 closid, enum resctrl_conf_type
> type,
> +				      const struct rdt_resource *r,
> +				      u16 *min_partid, u16 *max_partid)
>  {
> -	u8 closid_shift =3D fls(mpam_pmg_max);
> -	u32 num_partid =3D resctrl_arch_get_num_closid(NULL);
> +	u16 base_partid =3D closid;
> +	u16 span =3D 1;
>=20
> -	return num_partid << closid_shift;
> +	if (cdp_enabled) {
> +		base_partid *=3D 2;
> +		if (mpam_resctrl_hide_cdp(r->rid) ||
> +		    type =3D=3D CDP_NONE)
> +			span *=3D 2;
> +		else if (type =3D=3D CDP_CODE)
> +			base_partid++;
> +	}
> +
> +	*min_partid =3D base_partid * partid_per_closid;
> +	if (max_partid)
> +		*max_partid =3D *min_partid + (span * partid_per_closid - 1);
>  }
>=20
> -u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
> +static void mpam_resctrl_hwid(u32 closid, u32 rmid,
> +			      u16 *partid_d, u16 *partid_i, u8 *pmg)
>  {
> -	u8 closid_shift =3D fls(mpam_pmg_max);
> +	const u16 pmg_hi =3D rmid / mpam_num_pmg();
> +	const u16 pmg_lo =3D rmid % mpam_num_pmg();
> +	u16 base_partid =3D closid;
> +	u16 partid_stride =3D 0;
> +
> +	if (cdp_enabled) {
> +		base_partid *=3D 2;
> +		partid_stride =3D 1;
> +	}
> +
> +	partid_stride *=3D partid_per_closid;
> +	base_partid *=3D partid_per_closid;
> +	base_partid +=3D pmg_hi;
>=20
> -	BUG_ON(closid_shift > 8);
> +	*partid_d =3D base_partid;
> +	if (partid_i)
> +		*partid_i =3D base_partid + partid_stride;
>=20
> -	return (closid << closid_shift) | rmid;
> +	*pmg =3D pmg_lo;
>  }
>=20
> -void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
> +u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid) {
> +	return closid * mpam_num_rmid() + rmid; }
> +
> +u32 resctrl_arch_system_num_rmid_idx(void)
>  {
> -	u8 closid_shift =3D fls(mpam_pmg_max);
> -	u32 pmg_mask =3D ~(~0 << closid_shift);
> +	u32 num_closid =3D resctrl_arch_get_num_closid(NULL);
>=20
> -	BUG_ON(closid_shift > 8);
> +	return resctrl_arch_rmid_idx_encode(num_closid, 0); }
>=20
> -	*closid =3D idx >> closid_shift;
> -	*rmid =3D idx & pmg_mask;
> +void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid) {
> +	*closid =3D idx / mpam_num_rmid();
> +	*rmid =3D idx % mpam_num_rmid();
>  }
>=20
>  void resctrl_arch_sched_in(struct task_struct *tsk) @@ -203,21 +253,14 @=
@
> void resctrl_arch_sched_in(struct task_struct *tsk)
>=20
>  void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 r=
mid)
> {
> +	u16 partid_d, partid_i;
> +	u8 pmg;
> +
>  	BUG_ON(closid > U16_MAX);
>  	BUG_ON(rmid > U8_MAX);
>=20
> -	if (!cdp_enabled) {
> -		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
> -	} else {
> -		/*
> -		 * When CDP is enabled, resctrl halves the closid range and
> we
> -		 * use odd/even partid for one closid.
> -		 */
> -		u32 partid_d =3D resctrl_get_config_index(closid, CDP_DATA);
> -		u32 partid_i =3D resctrl_get_config_index(closid, CDP_CODE);
> -
> -		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
> -	}
> +	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &pmg);
> +	mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);
>  }
>=20
>  void resctrl_arch_sync_cpu_closid_rmid(void *info) @@ -236,41 +279,38 @@
> void resctrl_arch_sync_cpu_closid_rmid(void *info)
>=20
>  void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u=
32 rmid)
> {
> +	u16 partid_d, partid_i;
> +	u8 pmg;
> +
>  	BUG_ON(closid > U16_MAX);
>  	BUG_ON(rmid > U8_MAX);
>=20
> -	if (!cdp_enabled) {
> -		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
> -	} else {
> -		u32 partid_d =3D resctrl_get_config_index(closid, CDP_DATA);
> -		u32 partid_i =3D resctrl_get_config_index(closid, CDP_CODE);
> -
> -		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid,
> rmid);
> -	}
> +	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &pmg);
> +	mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg, pmg);
>  }
>=20
>  bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)  {
> +	u16 min_partid, max_partid;
>  	u64 regval =3D mpam_get_regval(tsk);
>  	u32 tsk_closid =3D FIELD_GET(MPAM1_EL1_PARTID_D, regval);
>=20
> -	if (cdp_enabled)
> -		tsk_closid >>=3D 1;
> -
> -	return tsk_closid =3D=3D closid;
> +	mpam_resctrl_partid_range(closid, CDP_NONE, NULL,
> +				  &min_partid, &max_partid);
> +	return tsk_closid >=3D min_partid && tsk_closid <=3D max_partid;
>  }
>=20
>  /* The task's pmg is not unique, the partid must be considered too */  b=
ool
> resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)  {
> +	u16 partid_d;
> +	u8 pmg;
>  	u64 regval =3D mpam_get_regval(tsk);
> -	u32 tsk_closid =3D FIELD_GET(MPAM1_EL1_PARTID_D, regval);
> -	u32 tsk_rmid =3D FIELD_GET(MPAM1_EL1_PMG_D, regval);
> -
> -	if (cdp_enabled)
> -		tsk_closid >>=3D 1;
> +	u16 tsk_partid_d =3D FIELD_GET(MPAM1_EL1_PARTID_D, regval);
> +	u8 tsk_pmg =3D FIELD_GET(MPAM1_EL1_PMG_D, regval);
>=20
> -	return (tsk_closid =3D=3D closid) && (tsk_rmid =3D=3D rmid);
> +	mpam_resctrl_hwid(closid, rmid, &partid_d, NULL, &pmg);
> +	return (tsk_partid_d =3D=3D partid_d) && (tsk_pmg =3D=3D pmg);
>  }
>=20
>  struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
> @@ -370,6 +410,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r,
> struct rdt_mon_domain *d,
>  	struct mpam_resctrl_dom *dom;
>  	u32 mon =3D *(u32 *)arch_mon_ctx;
>  	enum mpam_device_features type;
> +	u16 partid_d, partid_i, pmg;
>=20
>  	resctrl_arch_rmid_read_context_check();
>=20
> @@ -391,27 +432,23 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r,
> struct rdt_mon_domain *d,
>  	if (cfg.mon =3D=3D USE_RMID_IDX)
>  		cfg.mon =3D resctrl_arch_rmid_idx_encode(closid, rmid);
>=20
> +	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &cfg.pmg);
>  	cfg.match_pmg =3D true;
> -	cfg.pmg =3D rmid;
> +	cfg.pmg =3D pmg;
>  	cfg.opts =3D resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
>=20
>  	if (irqs_disabled()) {
>  		/* Check if we can access this domain without an IPI */
>  		err =3D -EIO;
>  	} else {
> -		if (cdp_enabled) {
> -			cfg.partid =3D closid << 1;
> -			err =3D mpam_msmon_read(dom->comp, &cfg, type,
> val);
> -			if (err)
> -				return err;
> +		cfg.partid =3D partid_d;
> +		err =3D mpam_msmon_read(dom->comp, &cfg, type, val);
>=20
> -			cfg.partid +=3D 1;
> +		if (partid_i !=3D partid_d) {
> +			cfg.partid =3D partid_i;
>  			err =3D mpam_msmon_read(dom->comp, &cfg, type,
> &cdp_val);
>  			if (!err)
>  				*val +=3D cdp_val;
> -		} else {
> -			cfg.partid =3D closid;
> -			err =3D mpam_msmon_read(dom->comp, &cfg, type,
> val);
>  		}
>  	}
>=20
> @@ -423,6 +460,7 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r,
> struct rdt_mon_domain *d,  {
>  	struct mon_cfg cfg;
>  	struct mpam_resctrl_dom *dom;
> +	u16 partid_d, partid_i;
>=20
>  	if (eventid !=3D QOS_L3_MBM_LOCAL_EVENT_ID)
>  		return;
> @@ -433,14 +471,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r=
,
> struct rdt_mon_domain *d,
>=20
>  	dom =3D container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
>=20
> -	if (cdp_enabled) {
> -		cfg.partid =3D closid << 1;
> -		mpam_msmon_reset_mbwu(dom->comp, &cfg);
> +	mpam_resctrl_hwid(closid, rmid, &partid_d, &partid_i, &cfg.pmg);
>=20
> -		cfg.partid +=3D 1;
> -		mpam_msmon_reset_mbwu(dom->comp, &cfg);
> -	} else {
> -		cfg.partid =3D closid;
> +	cfg.partid =3D partid_d;
> +	mpam_msmon_reset_mbwu(dom->comp, &cfg);
> +
> +	if (partid_i !=3D partid_d) {
> +		cfg.partid =3D partid_i;
>  		mpam_msmon_reset_mbwu(dom->comp, &cfg);
>  	}
>  }
> @@ -1051,15 +1088,6 @@ int mpam_resctrl_setup(void)
>  		err =3D -EOPNOTSUPP;
>=20
>  	if (!err) {
> -		if (!is_power_of_2(mpam_pmg_max + 1)) {
> -			/*
> -			 * If not all the partid*pmg values are valid indexes,
> -			 * resctrl may allocate pmg that don't exist. This
> -			 * should cause an error interrupt.
> -			 */
> -			pr_warn("Number of PMG is not a power of 2! resctrl
> may misbehave");
> -		}
> -
>  		err =3D resctrl_init();
>  		if (!err)
>  			WRITE_ONCE(resctrl_enabled, true);
> @@ -1081,7 +1109,7 @@ static void mpam_resctrl_exit(void)
>  u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_doma=
in *d,
>  			    u32 closid, enum resctrl_conf_type type)  {
> -	u32 partid;
> +	u16 partid;
>  	struct mpam_config *cfg;
>  	struct mpam_props *cprops;
>  	struct mpam_resctrl_res *res;
> @@ -1097,15 +1125,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r=
,
> struct rdt_ctrl_domain *d,
>  	dom =3D container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>  	cprops =3D &res->class->props;
>=20
> -	/*
> -	 * When CDP is enabled, but the resource doesn't support it,
> -	 * the control is cloned across both partids.
> -	 * Pick one at random to read:
> -	 */
> -	if (mpam_resctrl_hide_cdp(r->rid))
> -		type =3D CDP_DATA;
> -
> -	partid =3D resctrl_get_config_index(closid, type);
> +	mpam_resctrl_partid_range(closid, type, r, &partid, NULL);
>  	cfg =3D &dom->comp->cfg[partid];
>=20
>  	switch (r->rid) {
> @@ -1126,7 +1146,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r,
> struct rdt_ctrl_domain *d,
>  		return -EINVAL;
>  	}
>=20
> -	if (!r->alloc_capable || partid >=3D resctrl_arch_get_num_closid(r) ||
> +	if (!r->alloc_capable || partid > mpam_partid_max ||
>  	    !mpam_has_feature(configured_by, cfg))
>  		return resctrl_get_default_ctrl(r);
>=20
> @@ -1147,8 +1167,8 @@ u32 resctrl_arch_get_config(struct rdt_resource *r,
> struct rdt_ctrl_domain *d,  int resctrl_arch_update_one(struct rdt_resour=
ce *r,
> struct rdt_ctrl_domain *d,
>  			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
> {
> -	int err;
> -	u32 partid;
> +	int err =3D 0;
> +	u16 partid, min_partid, max_partid;
>  	struct mpam_config cfg;
>  	struct mpam_props *cprops;
>  	struct mpam_resctrl_res *res;
> @@ -1163,8 +1183,10 @@ int resctrl_arch_update_one(struct rdt_resource *r=
,
> struct rdt_ctrl_domain *d,
>  	dom =3D container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>  	cprops =3D &res->class->props;
>=20
> -	partid =3D resctrl_get_config_index(closid, t);
> -	if (!r->alloc_capable || partid >=3D resctrl_arch_get_num_closid(r))
> +	mpam_resctrl_partid_range(closid, t, r, &min_partid, &max_partid);
> +	if (!r->alloc_capable ||
> +	    min_partid > mpam_partid_max ||
> +	    max_partid > mpam_partid_max)
>  		return -EINVAL;

"min_partid > mpam_partid_max" seems unnesscessary.

Best regards,
Shaopeng TAN

>  	cfg.features =3D 0;
> @@ -1190,22 +1212,13 @@ int resctrl_arch_update_one(struct rdt_resource *=
r,
> struct rdt_ctrl_domain *d,
>  		return -EINVAL;
>  	}
>=20
> -	/*
> -	 * When CDP is enabled, but the resource doesn't support it, we need
> to
> -	 * apply the same configuration to the other partid.
> -	 */
> -	if (mpam_resctrl_hide_cdp(r->rid)) {
> -		partid =3D resctrl_get_config_index(closid, CDP_CODE);
> +	for (partid =3D min_partid; partid <=3D max_partid; partid++) {
>  		err =3D mpam_apply_config(dom->comp, partid, &cfg);
>  		if (err)
> -			return err;
> -
> -		partid =3D resctrl_get_config_index(closid, CDP_DATA);
> -		return mpam_apply_config(dom->comp, partid, &cfg);
> -
> -	} else {
> -		return mpam_apply_config(dom->comp, partid, &cfg);
> +			break;
>  	}
> +
> +	return err;
>  }
>=20
>  /* TODO: this is IPI heavy */
> --
> 2.34.1


