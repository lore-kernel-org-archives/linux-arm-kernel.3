Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2440DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDekBqN3MbFL6z7cjlV2RPBi2kNhThHgIAK8IZcwknI=; b=AvZq62ovgYq23bjZF3+/Rscs2P
	H2B0X3fI7LaWR5spXpwwQDdHNqtcJ9R8xqCrCAoMQL1+QMj2qjjF4HxzG/IiBmbB/QWS+GqqsnNm2
	eQQvO9ka01vR+OJZ/bdVubavvdFFvl24IClyZ3AEhBEH881ybSwEjaVmWmFWFNI8yQ/oK+raA/lXI
	RyR2n2k1wi+ueRkzmoY6jx3fUuJccX6npJ/gUO5zemqPiVqD/u16WKKPzAD7oUrFciikrDVEokmjl
	Nee4E17qyT10OVbEHj4+mN6+fE9Pb8C7qp1zY0CIsIPDFric/tvso47rteCyD/uydq1GGXzen7DzE
	ESvUF2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MeF-0000000BgxM-2fC2;
	Tue, 01 Sep 2026 11:27:27 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MeD-0000000Bgwn-1hlu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4BrfaEwy53hMVpXSlFnHDy8ZMo1z152BEY1TJYoEZ/M6gGlejsuAL8i3xKMPK75lqtLN3Tl0mgwVHq385gZXH18/AFyuVcTKVBLTpjQAAStvaPdnH+rT3zur6V2Tp5FM2KAUpx+xfpJ2JGPY8ojCPJKALY6wjGgR5jTIU3jAHOVlDHGuHM+CV68l3KfEWoAHumBumtYwGFG5rvDLK5Ndw5hZedC5aTKfUAz94V1tGi5xMjrXAT+k4FTafYmYrnbgsy9/Pri9SuIjbM2eAoSHy/YWdJiSsOHSMKIqx60hkFUWH9c6TNEmH0POG9172MgtOTI1Rh+k+AxGYxb2g/oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDekBqN3MbFL6z7cjlV2RPBi2kNhThHgIAK8IZcwknI=;
 b=kpqg3czEDeiHfcKqGJ+LI1NDTTjqsRlV1pJaEn0+3m7cd/lXNeRUYodpmvwRmEy4N16Cv+K72LOgUGkRhxjCm3ty/9iuOGfEoQ3aT6OmIbAsb7lKk0lI9MuPTJAE4h8XBX7I64noKU94ge/Ev6xe4hWUb2XwaKuf43VuPDGTUa3fnjaPn+KToDCD20pYSSoHguM86/Sa6L8hy1nlOGroPxkl7V8r9Swe0dt3IBWab2V/QQye27ICug40Hkmx1nQNqtOseiRiaSVu4WQQnMtK4izyc8roOvRbNcQpz3/A6la7hARGaXUNtHoXTjnTQm7Huxhyax1L0Dl7PscmQ3B+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDekBqN3MbFL6z7cjlV2RPBi2kNhThHgIAK8IZcwknI=;
 b=L81KNO5Jdrzqonauxm0Cs0maQfeAMltEyRt+KPoRVL/gatojUKBu7WWuCnb/Cxt4hz4ZqMGN1z0PUH0NGetTxWS4FkZ55rRLI8suWJyYObGTf3PNdNdvidDSIUbckw+VfA22b8SJrAxaEIJwmBhweNCC5d3qfJWYK79s3jkrYsdp4cb7vW/SREbORzlUnqq0n9iHURct0mlMbRpnMmx3LUvOr4QwqUtA+ceD3ilbUsgtAX9INU8VDwhdT/Dzgm22xD7y5IlkcbeBHExzqVRJKQr+XJrrUhFVzHSEd8OVFnCm7JlrLwR8FVIQtU5Jp5rUpjbSAcBO/ShXIHNd0htWrg==
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 by MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:27:18 +0000
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b]) by SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:27:18 +0000
From: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
To: Khushit Shah <khushit.shah@nutanix.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver
 Upton <oupton@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v1] arm64: errata: pass REVIDR when matching target
 implementation CPUs
Thread-Topic: [PATCH v1] arm64: errata: pass REVIDR when matching target
 implementation CPUs
Thread-Index: AQHdOTc6q36QCGH2TE6BB5AWp4OAyra5lqTg
Date: Tue, 1 Sep 2026 11:27:17 +0000
Message-ID: <SJ0PR12MB861455EEA4A5FCA473C53F7BABA82@SJ0PR12MB8614.namprd12.prod.outlook.com>
References: <20260831105444.4065831-1-khushit.shah@nutanix.com>
In-Reply-To: <20260831105444.4065831-1-khushit.shah@nutanix.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB8614:EE_|MW4PR12MB7287:EE_
x-ms-office365-filtering-correlation-id: 42e9f929-aec8-4db9-0d36-08df081bfb24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: QGtJpgz6hP+lvIiUVmFVPDj00R/AT/OnghNTLCuVsp0YH2pI0wkK4QL2POXvLi2EJQRXT0qIDLXKH8jIxnJyCXiS51yXXduj+QKPlTKorbx8QBF54RqsK4XwH/c2ydpi2zbMMJflFPPWp5ZzYAy3wcT7NpN/3iM8WWo54m/hZx0lVUkbK9hrt8ZFD0jAcWC4CIusgQmAFgaWxQ6tuozSDGxAvycnpbTPbfPT+4pM0TkXu4tZWDYipJQlmSPQK5yDM88lvSGAuc+QQ5zqpRZs1sASkwKJVxl7ireNSLUELsn3dhbtcN8X4TBPDYBLIceQmlF8AnfJLImE3t9vfdWdbmQ7/lxRXN5QjYajlptKPgjO1K7qR2Zetj6fyRMq7EIN6ySLnPUJDGWW0Sfsfs4vL1sR3c0rSlvJuPEk72612q42Gh/zd6B9BpcM+Gu4SMzFZTYYLSS9s0RCE7uLaOCrs7Xd0sr5fIyHya4ANlkuDlPpbQBuElRct3k4FSE1eHTSKjxsg2jTQ6Kusl4XuFZ9/k/T043rDdxMTc6ocR5RaT1xpWyD2pwfTecHyflzEq0RnUPWHBupC/HYO2aJUC3WV9StzGL4c0v8XEJ6D6L9BEbqShFWplhO1ac3iew+zvxaa0L/CtoyTii/0eteMG1+IANxfjTiCmIkQOCJSoXXmWVG1ZqD4TlLA3kk6r4mZcjtxSW/KXbu7wHXC1g5l0LE1iscwYmldLORxTrOJ3KLYwk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB8614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YCExngR0TKzTJZzEcPclgAraLIj24tV8bAt1Bl50gUoiCyBR/fdITM6KMQJJ?=
 =?us-ascii?Q?Qsakbz9qh2OfqnnJmgl8HtDSbcjqnEnrlev01cVUomyQz4XZWcoV5CwZ+MYz?=
 =?us-ascii?Q?Nvle5Mll3y8z8BbjGqKKYGJSaX7lUO3FWGamXkOMTv7Rkr8p307Pt7r3Ar15?=
 =?us-ascii?Q?OUbw0oT23Fwng5k6ixhUuL8N1BW0OWF/eJ2TVaE0lxHiRJJcYP9jH+kIIRK+?=
 =?us-ascii?Q?SlO8A6TUCJAxzTOHfsP020rPFFVBZdCRpnER2Dsm6T5rdairVh1G4wOwgDsn?=
 =?us-ascii?Q?KfnFHAVxlMiaphxmSlV0jwcDIHUauc1dexYcVmm3ZpnOF3g0+/p0KJbOsbqe?=
 =?us-ascii?Q?VhMIZUbImAbAuku3g2Ebt6FcY73rdNRJev2MwDLuDC4TeCq4M17f/eO9XXwl?=
 =?us-ascii?Q?C0Aomd7fKhZJReSO+0S7pJO9V8GpVONrLZpBl80Tw9MZbozEish5WPENZzlN?=
 =?us-ascii?Q?ghlXk2NHu9g2q6Bb/bNLuZwqscKXtOrQY+32RPgFo3b5GeBfLE9YqeV+4qRQ?=
 =?us-ascii?Q?57WawYhbGyOm7sPGQyMI4ZCpcTj6RG2H/vgB737c7H55JvzxqYpMvmfw3Zvu?=
 =?us-ascii?Q?g554GC0E1IaU9GDgQeeN8u8k0k03Z50YKF7RbGerc9AjP95Kyc9WWDH1YH3m?=
 =?us-ascii?Q?ut4oMdRue7/DO8nLf2zG0TBqG2As9R0V6udWLvDoo8bg3CFyp3/RsEuGRmDk?=
 =?us-ascii?Q?owgXr73gOt8whOVhO7/wY1c2rTIQNS6FxTZd9Ximsbq62cXJDNG2yUmGXWu7?=
 =?us-ascii?Q?8xCkJdCIJGQ68TjMaFe16F69NTvXlhda8fTZvLv+vtbG4jaDVwqtd7kk1ylH?=
 =?us-ascii?Q?XnGR8uWurRyLsYhQSxj+fu5PUfZ9TICjVa+VauDdr+7/u+yb0iJ8CNPA6CKQ?=
 =?us-ascii?Q?aUdrOeEPKKXVkTKh/kCt5vJEKBQi3QUzpqKctllesKqKkbgupX2SWduXmkQ4?=
 =?us-ascii?Q?BQ5Epefhpk85hJ4ro8f0Y1juDY/1HIQktLYTcNUDcX9c0qbiufSKxnBPI0fT?=
 =?us-ascii?Q?WcqXddqBn8JaZCC9Kg8pRMvJXzCClBNTOToafhg/5L+X+pH3H632R8+ncUkq?=
 =?us-ascii?Q?RFgu3EKhUDbBJGeR5k3tdGi4jgaNKuFCRi+YSftl1XEqi9MAJIdCOdUy2aOV?=
 =?us-ascii?Q?nRFAQoo4ixhUb1uxXmh+U9/Ayu5mamGYpx0Om8JiAfdSVnhkZozpTUCI+k8b?=
 =?us-ascii?Q?q90RZef61PN63HtsA6hm4hbSRqxajU1xIC09KCH+oqUsJBADPNcBMnthLtMf?=
 =?us-ascii?Q?UA1E78YXecC73sn9XXfxHatozlGBxEicEt5IF19Tx6j9m2I3nsO0VAZe9vt/?=
 =?us-ascii?Q?FVYWEDQn/yOW6quJ1v9QcQN5OnzgMtbY9S1n573BUYynMPY9SMCFJx7xgM+j?=
 =?us-ascii?Q?oW8iRLMWpHi+vx5OZpzA6DIdfSXWQORPxcb66oCH8nUHxeb+iAH0Hv5keMRC?=
 =?us-ascii?Q?G2WB+CFiZIgURtR7mbtTXAWBlb0urdLmddG6kzjFPTvCiGHDbpHNiyu0qg3L?=
 =?us-ascii?Q?IoRItk5p2w6oOl+mH8npZ6rmgapglHdch5eybozEbOEVGsfzjjPg0BJEmSZx?=
 =?us-ascii?Q?COxFmvFWed2unWrMsXTp9l/g2szb7Hbmeq9gUMt7pYRXIekwb266ACZaFZHa?=
 =?us-ascii?Q?ZGYnYaE5GUEKJmuP5k3cYCMdty672gPnUsFxeHRbIWN+46fThIwmV1DwAuVA?=
 =?us-ascii?Q?CgBX2VHPiyQ1RC/T/GvK5vnMjvwRmtSDt2O+DsdU6Fdo5SWVT/Mph7PFktaT?=
 =?us-ascii?Q?mwQWZJaxZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB8614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e9f929-aec8-4db9-0d36-08df081bfb24
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 11:27:18.0026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDbYLTOamLbPW61mjIe5Q4Z/8PE42/pRfPF9qh7rhAqIRLVswS9uWHiPYstbcdpzF2NDfdKOZGQ68tMb1l73/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_042725_457385_EB4138B6 
X-CRM114-Status: GOOD (  17.44  )
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



> -----Original Message-----
> From: Khushit Shah <khushit.shah@nutanix.com>
> Sent: 31 August 2026 11:55
> To: Catalin Marinas <catalin.marinas@arm.com>; Will Deacon
> <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>; Marc Zyngier <maz@kernel.org>;
> Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Oliver Upton
> <oupton@kernel.org>; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org; Khushit Shah
> <khushit.shah@nutanix.com>
> Subject: [PATCH v1] arm64: errata: pass REVIDR when matching target
> implementation CPUs
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> When target implementation CPUs are provided, is_affected_midr_range()
> accidentally passed the MIDR as both arguments to
> __is_affected_midr_range(),
> so the REVIDR mask check operated on the wrong register.
>=20
> Pass REVIDR as intended.
>=20
> Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on
> implementation CPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>

Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>

Thanks,
Shameer

> ---
>  arch/arm64/kernel/cpu_errata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/kernel/cpu_errata.c
> b/arch/arm64/kernel/cpu_errata.c
> index 5db8f0619e4b..b33dccfafaf8 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -82,7 +82,7 @@ is_affected_midr_range(const struct
> arm64_cpu_capabilities *entry, int scope)
>=20
>         for (i =3D 0; i < target_impl_cpu_num; i++) {
>                 if (__is_affected_midr_range(entry, target_impl_cpus[i].m=
idr,
> -                                            target_impl_cpus[i].midr))
> +                                            target_impl_cpus[i].revidr))
>                         return true;
>         }
>         return false;
> --
> 2.39.3


