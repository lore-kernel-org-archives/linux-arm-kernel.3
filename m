Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46708CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGj0sTowS8OtAol5/o5IjX31B5Juykb8s+SHROGnJGQ=; b=WB/eSY4wxoJLlzwY4N1UQY1Ar4
	1cwqUiNAnSP5i1nNUuFYZ4RGPNLCv0Rfe42hJ0W0P+QIohr3f22VSdc5DkZox/kHtK2q0bx/p0DFJ
	PR57oV/afnI4Iu64WF1vnm3EzzwbBmtppnFZCRGWwKH+8AUoIdhxbMgYo4b/IGAjGaXiCgBkyizSB
	cK9d3nx7HxsNnjDbhhRJHr/vCE1xG4Y8hfV0pZjPruMmMuciMrkK3acG8PNKQPD1t39DdfjOT08cv
	xb8FT3kVHBNXe/4GeHw10I1+BQlo4FKp8rIMsGtnSd6aWC3SNjVSPHhdBpREDjaNB2oSdpCSeuMCy
	QndhSUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJnf-00000001Vu4-1fKZ;
	Tue, 19 May 2026 12:43:55 +0000
Received: from mail-japanwestazon11022133.outbound.protection.outlook.com ([40.107.75.133] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJnd-00000001VsZ-2KGA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCpTv1aFUShPScQeH1JKe1ugkPeJHoGLqW5+T7q661wZY9ziQVTh95PdXXfaIKvP+GLg5yG9RAx/5VSeQux+sfl7X4KBdDt3/VeGCY57J6BVA1JzihGBpdCQEThDEfxdQWlrGxv5kpdtY/d9EKxYUopxQA2MCSkiztu2D+uvcHUCdLFScJKEtFhtzIrCOGgwIJh2XAuoLncTckWKuvGp0P+gMVqajZPY3CYhce14q5mxyOU5nSK0FQBZWm3nEB/2IQEzR7JwbQk3gSAkuLe/Ryl2kBQnp3aaFXd/EVZR9Vh39ramPfg+EPtjag33goEM5Qpdy2GtjS2e+8PGKaR/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGj0sTowS8OtAol5/o5IjX31B5Juykb8s+SHROGnJGQ=;
 b=aldcNP6QxBZRWPSKc2+CBSN6fuRiix6+gzriPhePvJgHiXD6A3Qw1MAU9SxJtNSxmWG7syW81MxkWUwcajslp69G9gQCQHf4JUB59Jw2Xo/cZw2E+NuIZz4Sb060mVGAktmgf6uXf4bXIGVhVxiOR1R80H99D3Tn2UJMi4ukEVoWR2nC5fnxMO92furLRexocIxmLKKiBF+1GadZlPKhnAgKRldmDRZ9XCh0dWcWfktTLlCRQGbu88TUrnV+YLwoYmrsJVJ3jxr2ANHNw6LQS6nbJq6mRRXcCJeI3mNLZGWfORX69Rdn25dHZ0eCJHZ0gmPIW+bTLWsLydBY4nRhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGj0sTowS8OtAol5/o5IjX31B5Juykb8s+SHROGnJGQ=;
 b=ZdbudEHJJd+5GTc3R3YthC8v/YrkZ0eAzFJ+ydAupGiRLlo2saNpeqxvai0rBNHjDzySWfI9oFtis48/Tkgt5nXDoZHL1bDZJ9gPeUh/LcwBvLJQWopOL0PEXsQLCin4DytyrWlVSvSahklgBMXgOZSOHTL8FkW3hjTRMaoNWTPY7QkzLVI9gs3C9ymQ1uI0e/Q+mNuaSiyW7b0Ysd3CrbeS9/2aJO9X+jLIFGuAi7FOJnksOQOu6AqPft5H0EbQdX4TCJhhRk/c0UJzh7tLZEVRIDnkzOD3wicXhpKlw8p9HOiuQn2WbdMKPQInxO+MPzJQqKVncpez1fAECIlcNw==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SE3PR06MB8617.apcprd06.prod.outlook.com (2603:1096:101:335::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 12:43:44 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 12:43:44 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Mark Brown <broonie@kernel.org>
CC: "clg@kaod.org" <clg@kaod.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, kernel test
 robot <lkp@intel.com>
Subject: RE: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Thread-Topic: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Thread-Index: AQHc5qyzvJxCjvMx2EefRm4IMWbGfrYVMP+AgAAbHzA=
Date: Tue, 19 May 2026 12:43:44 +0000
Message-ID: <TYZPR06MB520319C6F48144C8B8470740B2002@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
 <20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
 <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
In-Reply-To: <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SE3PR06MB8617:EE_
x-ms-office365-filtering-correlation-id: 1ea2d6c9-c150-4c3f-5da7-08deb5a443b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|4143699003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: au2IFNXjyUadmschPXuF66E/JSOIG8chmy4LWrml1dXDsr8N9sFUIdb8SONgFBL0cGJ/Nox8kX+no1A9/XGvlKt0ua1R63B6saF/a0Lx7iELdh/JQWDm6RrsKSBLeqdkN7Hj1HeBxCS2UF8/DEKkGam1moNyusDm20kPrH2LgKgTMSYSqMHqDlXMCJ5sXxGvRxb/b6Jv8jFRlBm9EOlRlcfp/xOAlYoOtY8EMUZQ9VCivjp3fq1XalYuP9Lkgplkkm7DZ/hs1tlc5XauiYCnxHObH6PpwvAXibA2vK4QFgx/cmNN9KJXFZb1IbL3GPVYH36c+lwfhmu6mwB61Bla/ZjDJvOmXBBXaf5mmI45JoM2PTyF9pN7N/R3wZVjliH1s53dOTYRklDTQVa1qQRgEuYILRDwDsUn3gkcR7YyoM+t99aQkk6FRgGVxXLdfD+23Zg3kGTxGH+r64vh1yk4tbtBTgCzbfaSDpKpWjWvdF1cWwzByDUegMcBnwZ4jFmwp+LhE3zFORu7iZoTL+lA4uRbwqUOtdNUep+dOGi7fLPRX6o+9KMJGJNN+S5CnfMlC2diqih/sHdxls60AoLLj+tIDWDGEgTLlrbnjzLuIMxmwENzJemJpSIQGZEiFO0W8eaPSmWYprf2f8guRXgNerK/gLRS3zwYglVsFQ2QJ0yqbZAHDQoZLoh/cv7F7AJfFZDLcxm47/IOmMTGIHrMoCoMS1DE6PHqvI1dqg4d6RSb60WZR5sFpuZL5Yznir0G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LARz6+PxKlBhM9rnsTT6KWWkf/AM9JL8Q5wocdc80io1p/UZY5rF5K1AEDF0?=
 =?us-ascii?Q?v4PEYxINKkwswaBLVo7NHxYwSTQfzZB7AzUOE78CKoB080NpsoCh826Ieml6?=
 =?us-ascii?Q?40r2M0aOGi1PIkkpqyPv4gmBPrRO8zlrtvBSJXPErDJ30N8Qd9w+cFipAToi?=
 =?us-ascii?Q?OZt65E5Ki+9UCSpKiydT554BAVRpdIX1Dvvw9WfGSjKH1FZDRT15qofD8UJj?=
 =?us-ascii?Q?zhByLJG6eGNM1orinIOzG3bzdbgefFh91g6cnsfQbc+al0hKDD5TbJRPJ7jS?=
 =?us-ascii?Q?BWqlRNPDDiL5eZi5trwH2y/Lw5JNF7MOGNB4m9z58cEtkI0pkVLAcxundJwD?=
 =?us-ascii?Q?lex2AGNBOkiJ77kacLh4AAGs80jZri8PdrAE6V4iS2EYfW5mdiUsdpJVe+in?=
 =?us-ascii?Q?TFFmfZJn9rOQslnGM4J3CBnN53i7Xx6mMuqywo9Uty9II5U7cZ2GEwOfPS4c?=
 =?us-ascii?Q?vzh/CFl38/cnvWvfX9DovQnxzEZtDZ/Zoln7KUY6fcD2oupDsePhHD9o6e6b?=
 =?us-ascii?Q?kVyJ2Xm0srQcBYIQgQkr+z86k5ByELhE9pyHjtfL+mYIxMDqHexTZ42s7Lrd?=
 =?us-ascii?Q?2hpaMo3/mIi4L40EB4TPLia5Ar6Wp0cbQuDkZ9LLn4ckIwi36yn91pE4+s1q?=
 =?us-ascii?Q?gJy/wEZmJ4PWbEtqW3y6F9FGqCYU3iyZl6/vVvU9Y/wT+qQpf6LOgLO3Liap?=
 =?us-ascii?Q?gREubHUaXR7q4sNV4PalTTh8oIH7xDSs5pBjumPrXqbG5q7j6RB0fZknUDWu?=
 =?us-ascii?Q?P0BTGbxXzMmj9zFqvkLmVeZDf6J4D6zF6a7f5QLRVWETU/4baJQA4Xu42U+q?=
 =?us-ascii?Q?kEQ931NdcQ87qjH88Nn9aVTIIMEku1cw8M1a+AM3ZoYEp/+iUt87wX8OCXXA?=
 =?us-ascii?Q?D1AJaC9cnZfQg9aUzPmMBwErBh4AVLpzP3GSmZOnJlkpOfZJpIFxgNJYuaTP?=
 =?us-ascii?Q?2Q/s6zFwsT4jd4unw5z8RmTCEI1/0azxTRu0Oz+UVm8gqYx3fIoI9vsm3K6p?=
 =?us-ascii?Q?KpScPPFdL40Hv4kry9HpF8qIhaneevVtPrlf2PpVDjiFA9xFlJ4RzutNI7+Q?=
 =?us-ascii?Q?17K+8wn2cOa2YlDGOIAXjb2lS6zmdMcZV8X85KyAc5Ioqh47at3Xwj7jey/r?=
 =?us-ascii?Q?TtYnVVzdZWGjIX0Y+U8+RUgwo2sbCALncPXtHQtEtCeiocoPvHiOXPDHcwxd?=
 =?us-ascii?Q?mYMUvprE0g3WWyQV5SNBDzCQvxOl9Ipj0sV4Sf7uZ0XwxjzQIuKO6MZW/i1z?=
 =?us-ascii?Q?bnJSEMnYpv7GHn+bt3JXEFJF+IOcognd6aX+OIP7rHPEhngpUbCw7LNqJrXP?=
 =?us-ascii?Q?FgF02zxsmJcU0qXayVjeypBiaLhRY91KRn0qwd5pUUQ01ousmGD8Jt9DqCCb?=
 =?us-ascii?Q?l0eC9c4JbokAeZgZRVqSLcpCZG4FgZQbWLZuPbljpfyCPTWSbJXa4iJK6A2R?=
 =?us-ascii?Q?N74LYTCfFM1pgbD3tXDUgBeaTiJy/W82W+ZUS+igUauz7QSFpgtvkx+Q4Oij?=
 =?us-ascii?Q?xHgeV2g6xnJbs1u4cjhJEBNdDGA9Xcy6K0iVZlU5pqvpxObM8jlJFR+qx1oX?=
 =?us-ascii?Q?+nbBsdWW/ED9wJKOITwKiGJADo1AwNl/KMBKLlBTsW57C8rJvSRK/2p9zv23?=
 =?us-ascii?Q?DeRybHB3AEisoHMkA/meHVvsKzkYu9kOHRYyWTjm6f4DEKvQyHZGATnP/2k0?=
 =?us-ascii?Q?Di5iZ9Y87wFP2C8JstkSNw3+IE/ukM4xEKqTJWLTKAyxIQI/7g9uE1qj1C7k?=
 =?us-ascii?Q?AbdyzOvKQxfQX4DJH6nZxgkOs8qu9pg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea2d6c9-c150-4c3f-5da7-08deb5a443b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 12:43:44.7002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNbRfnZgI66JTu3IZrDs3WN1WsEeGV1Ykyec4QWtyXWyhv5WPfe+H2Ud9SJdr3rIk2pyeMXFoEM3m6I7SV9ArfxY4iAor2hCzvVIRHENff4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_054353_601680_852A4C7D 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Mark,

Thanks for the review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, May 19, 2026 7:04 PM
> Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer=
 in
> calibration helper
>=20
> On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:
>=20
> > -			while (k < cols && buf[i][k])
> > +			while (k < cols && buf[i * cols + k])
>=20
> This really needs () to make it clear what's going on; the precedence is =
well
> defined but not everyone is going to know that off the top of their head.

Okay, below change will be added in the next patch version.
while (k < cols && buf[(i * cols) + k])


Chin-Ting

