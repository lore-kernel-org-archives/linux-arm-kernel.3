Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzL72BMuK/jVxwRCv8CDKAA75m0/j47jF1DPyWUiZ48=; b=a8y7+e9aX/wmhPwzuhvThYh5hM
	W7x/nVwKaMb1uUHMWlj3juAEoo5dXO/OiwfYVzCJOgBBzkzC2ZpZXyooEQTS9k7LNREQylSGJB+mj
	T1ckDAyw9UohqiqReRUAufD25a/d1F6dd2p1Zy7PJt2UlUSaZs//6OVIHTKlToE4maKJsWhlq8pCK
	jI5HChz58LgO64D5NSE7kppQ2FTqArVIJ98zohbtsEExpqakxwcm5yHrTYKZHT/RNgjT9NM4U7ZNy
	Q48JOuBpGmbUjflCBp19z3Ld55ifmvoNVgZWONzH+AEDfKQrSOMjN+wBMBLr/FPv/aExfuB323Eqz
	p1amW0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhUz-0000000FrLN-1WEZ;
	Fri, 07 Mar 2025 23:53:01 +0000
Received: from mail-eastusazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d003::] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhNV-0000000FqcO-18cb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:45:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBG2tANxX4widnXib/8gwpfehCLoMEUMGfIyo2gpNcZThfgCh4UwpIO3ALpoOO/pkEvkiBqD9cZyerItzoZUmuAkgUq8f7syMrxv0891j+ZtPy9llMjqEJvSXfYho3YYpmN4EXH8a2KPbqzp3zga6XhuGqRTI1olVO5UgKY0EI369TFbEZkWlaZFVvK1lLa1mnuIdMTep21fND5R9iGSF0WDDwqzXpY61pvWb+HnLzd2d5yU1FlFfjRw/voAy00Mp5FJfbIE0zbuxsuWnSHlFPdXIDdihX5bhIimFkSdUML9yRVm8HZWyQerkZEMhi5Tl2s9e2jWyPFuuBZeF+Chzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzL72BMuK/jVxwRCv8CDKAA75m0/j47jF1DPyWUiZ48=;
 b=CAbTk/dpcRBAJdxoFA13PlSPsq3dkmlDbW66qRUCSu5t+vnTHBpk+EMBg5KpTQuL74OFxmiwHlDThLChZqww2qyiHNWbcA+QJkEbk7EvrTqS/4txOCuPy2FnhAZmdSwNmAEt5zSGWR2YH/UiLGzS5ykadg4G7QeiDYuvwGYe+ug6kDNYFh8p37c2blYd1udxwdInpQvB3yQnZlXg6B79gYjUaIQzIX3A6H+beufS3ziPfiKIb3sskikE3uND2Ip1HKwkYpq0gu14Uq3OV/ngaoGxpQ8v/KE+DOG6j+E2uND/GOMOFerlfV3dnlK8tovDp1eqFE3L21Jrv5va54P+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzL72BMuK/jVxwRCv8CDKAA75m0/j47jF1DPyWUiZ48=;
 b=ihTX+4KsGyE7L7ax7OZyn+SZMJjR81SX1115QF5ZUrTAREuO+Dcq1Uz+MNGCQehW4jFByVjVVWsz33nLiUgcvhuDVnTBU3iAYIKXqBNeu7XYARijaqRM0CVMYQ4+yHbf/889gC/QNQpEl0Fwgd45F4bryhZBtASRG/0XacgvLgTE4dyRwkUDlkNglmU2T249T4DF7XTZImOdBXoo9GSZd9Uc3HoGbJUdPzlz6SMhOg6/VJwkCg825I28uVDHqj1OOqSrEzK1boH7XSWiB+43AEalicTJMmjnMkDF3zgbMLMyi0S/lSIP4P9mivvwCAT7zzderaTWtE+ROKjh3PYZNg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH0PR02MB7205.namprd02.prod.outlook.com (2603:10b6:510:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 23:45:10 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 23:45:10 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"joro@8bytes.org" <joro@8bytes.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
	"muminulrussell@gmail.com" <muminulrussell@gmail.com>,
	"skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
	"mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"apais@linux.microsoft.com" <apais@linux.microsoft.com>,
	"Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
	"stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "prapal@linux.microsoft.com"
	<prapal@linux.microsoft.com>, "muislam@microsoft.com"
	<muislam@microsoft.com>, "anrayabh@linux.microsoft.com"
	<anrayabh@linux.microsoft.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and
 setup function
Thread-Topic: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and
 setup function
Thread-Index: AQHbiKNt6Dmf5ml0nkycDSKgcIRUw7Nn/hsggABiMICAAAK1cA==
Date: Fri, 7 Mar 2025 23:45:10 +0000
Message-ID: <SN6PR02MB4157F84C1CE53A12F042C71BD4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-9-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB415730AA9A9BFFBB9A62F195D4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <86bf7bae-9423-4413-8986-364d96243c82@linux.microsoft.com>
In-Reply-To: <86bf7bae-9423-4413-8986-364d96243c82@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH0PR02MB7205:EE_
x-ms-office365-filtering-correlation-id: c14a8e9b-5167-443b-ab9a-08dd5dd21942
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|8062599003|15080799006|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?TGFJVXFseGh0WDJ1b2crTWJWR0tUV0VTNkM1cllNcE9rMFYxK09WZnpjT1BO?=
 =?utf-8?B?QUJXQ2pLNWk4RlFsbENKaFZZaklPWVdLenNuV1RuN0daOWoyN3Bic3IvZ0NJ?=
 =?utf-8?B?MnhxYWhPOTlpVVplbFVXbTk5VEJjdVpPNk9QK29hT1lFSWNYeXQ4MEwxbE5r?=
 =?utf-8?B?ZHhQdzNYNUpTU2RRVFdIMDBGT0dUQnN3SCs5dFVubFB0eGhqMHNiOG5FMk5p?=
 =?utf-8?B?OURkTWhDR29UZ1JKTjRubXNKTytFMWVpeGNxc2VEcXJzVDdxK0lKcXFack9n?=
 =?utf-8?B?MWZBMVQvamNJMVhBVzltRHF4TmNTSDRucmkwelA3SHY0U0xkL3hTZERNSjdC?=
 =?utf-8?B?cWgyN1BpUXpTR0tOTmJ4SlJ3eUhlbTZ4OXNHdFJXd3o1dmF1bk4yMmJ2cis3?=
 =?utf-8?B?ZmlKOVhNckdsd20yMVlpM0JKK3R0bzBTNFc1ZGZDNlhTcWpzUnVtckZMb2dr?=
 =?utf-8?B?M2VqcGlmbUVGV2NlQ3dPR0R0UzZBVzUxSitGWU4xZFJqK1ZZUHc2RzdwNjlv?=
 =?utf-8?B?ZTlqb0h2MTNPZ0cxRWdqNUMwbDkySDF3OW5iY29uampKc0psRElDeWRpS3Qw?=
 =?utf-8?B?cTRrOUNsT1dxYTZjWXBzWDBMak4yd0ZCRDdDb25td29zWU43OXhSNE5WcHRI?=
 =?utf-8?B?WVk3MkF0RGQ4enJEaTQ2aUNBUFZlWTNBR3VMbGh5YjhBN01qV3dUVkE1cmNE?=
 =?utf-8?B?anVlSllHaDl6UUN0VlJ4VVh6SllFRkMzT1UwdEw0UmM2YityanFXRDh1eWdt?=
 =?utf-8?B?OXRZMFdYbWV6ZGxFV2htZEh3NDJZYmtWcVBOSFNUNVJhSTFYV1lyWllHWFNq?=
 =?utf-8?B?emxzOURqaVRuVjRuek1POGdBVVdTN2ljT0JvdnByeTE2Zis4VXphUWFud0RW?=
 =?utf-8?B?SXN4bExGcGJSVjZ3dzFPL1ZiMjVRRkVMNllXL2hBL3puek9Wa0pabnV3Sith?=
 =?utf-8?B?LzVCcTJJV3ZIWWsybit3b1hSWmtPZ3NRQTJsSG1vSWpzMGVXMEVtSElmVWxB?=
 =?utf-8?B?b0RIWE9RTklFRDRlOHJEL1hqQUhOSU1OR2pWOEpVVStxRFlXRk5hRkw3bDVN?=
 =?utf-8?B?MVlqZ2k1Y2xSdTlMY1YyQlFDbkJZT2cwM0RjY0FieGd0WEVsdDBMaFlPWGVN?=
 =?utf-8?B?SjBNa05BQ21ZR0R6UlNUQ01odlRuVjhIU0tKb1F5Ym9wWUFsOEpFSjcyUm1u?=
 =?utf-8?B?WTBncFBjSldudmZYcy9xd2o3RnUwUHQwZ2xWWDVhWDFXdzRqQWhlUEJjN2FV?=
 =?utf-8?B?dzVZblZMZjJnYVlhaW51c1B6T014ZEdzZVRjSUlYSVpOTUEvVTZ6ek5OSm9R?=
 =?utf-8?B?WE82VWdFQzJoeGIvcXJXcnNkVm8zVFA2YVFZeUZXMWVKdDVXUTlWZ0pNMHFF?=
 =?utf-8?Q?Eq/W/40YOwUACD3T9Ra/omM7bo4qcIK0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FiYW5yN0kyNEJTaW1pQ3ZwckhIYjNCNFNkWTBFa3hEK3lCVldNcEZDcHZZ?=
 =?utf-8?B?cTNpN3BETERJYWd4djdqSUx1MnV3L2JseHhkWUFxTkJuczBXYmFmM05jSU0v?=
 =?utf-8?B?K0hkN1k4SGRwTlUwOXZnVktuNlBTOERmU0psZWNNTE92UWQwZHpKNjRXZHB2?=
 =?utf-8?B?NXNLUDFJeDFIbDJoRmtSQWx6b3hobHhHMkg2OXQ5VnNRRVgrcHl2M1dQbWZ3?=
 =?utf-8?B?ZWloaXl0akJtQmYxVHJRSkYzMEtwaTlZN1J6V28xbUlrMElRbVNIMGg5Wi91?=
 =?utf-8?B?ZzhWZ2NpK0gyTk9Zd2VKb1MzeHZrUGcrc1RFTDdvMkh0U1JUc3l2RU1WVTBU?=
 =?utf-8?B?UUhlME9MWHBzV0IvblduanZUL0s4MlBpQTcyaVlCRllpeWxLV0FIbUpWU0NQ?=
 =?utf-8?B?YlJERnVtVXBHVytmbTVFTW13ZmpDNVExNEZSV2VBSXY3dStkaFQ0ZlZ3ZzFt?=
 =?utf-8?B?M0xBVEVyemdWWmdLR2kxWE1nL1pyTHI0SWQ2YUp5T25MMndGUEdDOEtpYnBH?=
 =?utf-8?B?cjZGMG1FTHJHblNwSEh2a25tVGZoeFQ4bDJpaVUvTHBDa2p1dzdqRzcvL0Jh?=
 =?utf-8?B?Y3IvODg1c0NKb01Bd201K1ZtMmpJVlFzRWV5QnM5OW5nd2NYSnFNdTVhWHJ4?=
 =?utf-8?B?elM2OU5lN2tOMzF5L2ZnY2xRZmxKMG9MdWFtbUtTWnhJandMSG5CdHNTUkE2?=
 =?utf-8?B?V29Td01kMUUzS1dDeU9YVGY2Rjk1ODVudkR0VXBLMGxoU2IyUElxQ0V4OXBN?=
 =?utf-8?B?UXlkMnkrK0RNN2QyNFJaMWVxeVoraGxzNkpFSkF0L2hsWGF4ZDhuOXZicDNF?=
 =?utf-8?B?aDNVTW4rQk95Mkg3SmFyVTg3eC9GbUViN3h5bkd3WDhWTU1KR3VSN1ZXR0FG?=
 =?utf-8?B?Zjh4eGl5d0lIM2ZmVjg5Mzk5a1Z2QXJGT25EVmVkSSt4NU5JeksrR1hVdTMz?=
 =?utf-8?B?SXl0c0VJNG4yVHBvb2w2NFNVZTMwem5IYTJMK3B3QmNxRUJ5clh6bE5rRGRm?=
 =?utf-8?B?Ui9yWWtmTERZWTd3UlpsQkZkZmNlSWR2UFhTeUM1NEN1SlYvNEs2YW5jN2R4?=
 =?utf-8?B?dmltL1FNbVVBY0J2blZCd2hES2hJUnl4dFVZeURsR0ZwT29UWWlqaURVckNl?=
 =?utf-8?B?Rm1pcWVGRFpIQ0xOakZVREI4QjJLcitrdHlaY1VWYTdPQTJocFl1QXA3ekdI?=
 =?utf-8?B?ZHNUbXdKcWIzZE9OWlkyS2hwUk5DUFlVVHhBblhyWnZvVlhwU3lWUkttZ3pY?=
 =?utf-8?B?bmJDaERNNGUzMVplZlNtNTFFd3hoL1RCOGx1d2trcjBPSGI0d1piSHUrUlNz?=
 =?utf-8?B?b2JaQTM5WkluTkJqbUNoVkJPb1A2aGN6YTE1NFpRMU5lRWltUFdBeVhKMnhy?=
 =?utf-8?B?NmNsT1NJZGEwNmFnL212RWJQb2NaNVhDaWZSbSs1b0p3dUNFT1JLZ0Mxb05r?=
 =?utf-8?B?MVdSYUROQngxajMwVzA2N0xtcVM1K3VjeVFLZm1qd0NnUEh1a2gvVjZPWUx0?=
 =?utf-8?B?L2V1ZWdabzByMVU2emlpRlRYV0tBUzVBYXFOVE82Z2FQMEpZbTJZYVRrdGNt?=
 =?utf-8?B?aVlUcDJCSjBYZytNUWkvdXhyd0ZMUkNSNWt4V0VXRVZveVpyMGFkNG9CcVB0?=
 =?utf-8?Q?IhSvqBZovOeGaCSlA0CFm8sG410xkb6UTl0iVct6zLJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c14a8e9b-5167-443b-ab9a-08dd5dd21942
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 23:45:10.4765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_154517_322827_2242EABE 
X-CRM114-Status: GOOD (  23.70  )
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

RnJvbTogTnVubyBEYXMgTmV2ZXMgPG51bm9kYXNuZXZlc0BsaW51eC5taWNyb3NvZnQuY29tPiBT
ZW50OiBGcmlkYXksIE1hcmNoIDcsIDIwMjUgMzozMCBQTQ0KPiANCj4gT24gMy83LzIwMjUgOTo0
NCBBTSwgTWljaGFlbCBLZWxsZXkgd3JvdGU6DQo+ID4gRnJvbTogTnVubyBEYXMgTmV2ZXMgPG51
bm9kYXNuZXZlc0BsaW51eC5taWNyb3NvZnQuY29tPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5
IDI2LCAyMDI1IDM6MDggUE0NCj4gPg0KPiA+Pg0KPiA+PiBUaGlzIHdpbGwgaGFuZGxlIFNZTklD
IGludGVycnVwdHMgc3VjaCBhcyBpbnRlcmNlcHRzLCBkb29yYmVsbHMsIGFuZA0KPiA+PiBzY2hl
ZHVsaW5nIG1lc3NhZ2VzIGludGVuZGVkIGZvciB0aGUgbXNodiBkcml2ZXIuDQo+ID4NCj4gPiBD
b3VsZCB5b3UgcHJvdmlkZSBhIGJpdCBtb3JlIGRldGFpbGVkIGNvbW1pdCBtZXNzYWdlPyBIb3cg
ZG9lcw0KPiA+IHRoZSBtc2h2X2hhbmRsZXIoKSByZWxhdGUgdG8gdGhlIHZtYnVzX2hhbmRsZXIo
KT8gRnJvbSB0aGUgY29kZQ0KPiA+IG1zaHZfaGFuZGxlcigpIGdvZXMgZmlyc3QsIGFuZCBJJ20g
YXNzdW1pbmcgaXQgcHJvY2Vzc2VzIHdoYXQgaXQNCj4gPiBrbm93cyBhYm91dCAoaW50ZXJjZXB0
cywgZG9vcmJlbGxzLCBzY2hlZHVsaW5nIG1lc3NhZ2VzPykgYW5kDQo+ID4gdGhlbiBoYW5kcyBv
ZmYgY29udHJvbCB0byB0aGUgdm1idXNfaGFuZGxlcigpIHRvIGhhbmRsZSB0aGUgdXN1YWwNCj4g
PiBWTWJ1cy1yZWxhdGVkIG1lc3NhZ2UgYW5kIGNoYW5uZWwgaW50ZXJydXB0cy4gQnV0IGl0IHdv
dWxkIGJlDQo+ID4gbmljZSB0byBoYXZlIHRoZSBjb21taXQgbWVzc2FnZSBvciBjb2RlIGNvbW1l
bnRzIGRlc2NyaWJlIHRoZQ0KPiA+IG92ZXJhbGwgaW50ZW50IGFuZCBhbnkgb2JzY3VyZSBhc3Bl
Y3RzIG9mIHRoZSByZWxhdGlvbnNoaXAuDQo+ID4NCj4gPiBBbmQgYXZvaWQgcmVmZXJlbmNlcyB0
byAiVGhpcyIgb3IgIlRoaXMgcGF0Y2giLiA6LSkNCj4gPg0KPiANCj4gWW91J3ZlIGRlc2NyaWJl
ZCBpdCBwcmV0dHkgd2VsbCwgSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgdG9vIG11Y2gNCj4gbW9y
ZSB0byBzYXkgZ2l2ZW4gdGhpcyBwYXRjaCBkb2Vzbid0IGludHJvZHVjZSB0aGUgaGFuZGxlciBj
b2RlLg0KPiANCj4gSSBjYW4gdHJ5IHRvIGltcHJvdmUgaXQsIHNvbWV0aGluZyBsaWtlOg0KPiAi
DQo+IG1zaHZfaGFuZGxlcigpIHdpbGwgYmUgdXNlZCB0byBwcm9jZXNzIG1lc3NhZ2VzIHJlbGF0
ZWQgdG8gbWFuYWdpbmcNCj4gZ3Vlc3QgcGFydGl0aW9ucyBzdWNoIGFzIGludGVyY2VwdHMsIGRv
b3JiZWxscywgYW5kIHNjaGVkdWxpbmcgbWVzc2FnZXMuDQo+IA0KPiBJbiBhIChub24tbmVzdGVk
KSByb290IHBhcnRpdGlvbiwgdGhlIHNhbWUgaW50ZXJydXB0IHZlY3RvciBpcyBzaGFyZWQNCj4g
YmV0d2VlbiB0aGUgdm1idXMgYW5kIG1zaHZfcm9vdCBkcml2ZXJzLg0KPiANCj4gSW50cm9kdWNl
IGEgc3R1YiBmb3IgbXNodl9oYW5kbGVyKCkgYW5kIGNhbGwgaXQgaW4NCj4gc3lzdmVjX2h5cGVy
dl9jYWxsYmFjayBhbG9uZ3NpZGUgdm1idXNfaGFuZGxlcigpLg0KPiANCj4gRXZlbiB0aG91Z2gg
Ym90aCBoYW5kbGVycyB3aWxsIGJlIGNhbGxlZCBmb3IgZXZlcnkgSHlwZXItViBpbnRlcnJ1cHQs
DQo+IHRoZSBtZXNzYWdlcyBmb3IgZWFjaCBkcml2ZXIgYXJlIGRlbGl2ZXJlZCB0byBkaWZmZXJl
bnQgb2Zmc2V0cyB3aXRoaW4NCj4gdGhlIFNZTklDIG1lc3NhZ2UgcGFnZSwgc28gdGhleSB3b24n
dCBzdGVwIG9uIGVhY2ggb3RoZXIuDQo+ICINCj4gDQo+IERvZXMgdGhhdCB3b3JrPw0KDQpZZXMs
IHRoYXQgd29ya3MuIEkgd2FzIGdvaW5nIHRvIGFzayBob3cgdGhlIHR3byBoYW5kbGVycyBjb3Vs
ZA0KQm90aCBiZSB1c2VkIG9uIHRoZSBzYW1lIGludGVycnVwdCwgYW5kIHlvdSd2ZSBwcm92aWRl
ZCB0aGUNCmV4cGxhbmF0aW9uLCB3aGljaCBpcyBwZXJmZWN0LiA7LSkNCg0KTWlub3IgdHdlYWs6
IFN0YXJ0IHRoZSBmaXJzdCBzZW50ZW5jZSBhcyBhbiBpbXBlcmF0aXZlOg0KDQogICBBZGQgbXNo
dl9oYW5kbGVyKCkgdG8gcHJvY2VzcyBtZXNzYWdlcyByZWxhdGVkIC4uLi4uDQoNCk1pY2hhZWwN
Cg0K

