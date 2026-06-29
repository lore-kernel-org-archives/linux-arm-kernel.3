Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD1DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh76jsCRg1wXjiLS/jrR6oPjQcZ1Orvna6o/y4iZM4k=; b=aOdmIVe8a+vBBNx5QBcbguIIDO
	XJHp6cOgNWK9rxHuvchq7qoDVLcQ2TVSrN7Yud5KK2gGXWfKm0qs14bhFuPl2nF3knSvKRnVOtANn
	tqX9VFE36SbTnmxJT35aHG1Jbn6/90yiU4Q/cp2ltzbamejM4L8dpS+DhD/NybC+HnCajJHWS3atZ
	wTiXmpAizwugfi7NY9lEVOaFsm9qRJFKexEGptd+Ej6zgJy5SRuhau8whbBrh7z/9kzF4EHN74AEz
	jrmT6FXYiNAFpDFiNWjg4bSIGkqTz60oSNxbO/fdsc0vW3fFor0zQ/Wnl+s551j/4dCEL/vtgFOLn
	kSqBXfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we78d-0000000Dz9Q-2qbY;
	Mon, 29 Jun 2026 08:14:43 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we78a-0000000Dz94-0SsD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkifuJXnfEhANEe40ugaVknVuu9cIoMShz/RlTaYqd53BwmiLuJxFWAEdlWWEzow2glRT4dB1JaKvBP41ct0dc8mf4pT87be06Mjrin9QXTH8hcRyrE6KZADi1v+kQ3J7aw+HXUaDkLriea68bhEru6KF8cojGezY88XtMGpF7m7Ab+y5waJ8udb0G4b4jPLrbUVo/BU8buM7yjKSZEvMIldzInKI9okUE5QrTmdIwmi60zdg2IrLpAeETTnl8nY8GEnNWjFyS1NeC8/NqGw4Lc9+TumLSa2rAQgKiW/UeLYXpH3SY1CZc4pP7SGKPFp/xgaBgkuMJIRvvO3op3NLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh76jsCRg1wXjiLS/jrR6oPjQcZ1Orvna6o/y4iZM4k=;
 b=JqyKvpOVWrHrZCSb3sUBDED2MZN6kwhwFfH0IYQNGj2r52/qImT90SCy0Lnmb1AWDs5hxv4XqUO+efuQUZzcfNSfxneIkz2Y63ZE/fhxzewTyZMyevJbdBnifEh8YuUCaopQxun0lIJQGkWpBJzp8eI16ibB1duiobm0a2O0p9F4w7KdPgD+LHuOml1tKwW7jMVjhclio//zHy8VfN1Pnv6MZIAwpXI7JXPzXRRfWb22Aa8IN+rCXlT+XJYRwXR7XxjvUVgL92/Ih+52AftsmG1k9RuaLmJnI8JJelWw9Henxd5L7wg+8eeBnN9xTve++wmxR66cdPFpJcWSug/+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh76jsCRg1wXjiLS/jrR6oPjQcZ1Orvna6o/y4iZM4k=;
 b=qLwZcbvKcazCntE1EhqrtGVKFuVN4HnvdG36Oeg3okimAyP3PI3mRNmSkU0bH1tK843Sx92hHkfLATZMv9HvdcGDUgB/dEqkXpVaDRZhy4ok9y6CPaD0iVFAv6/Dhl1ZEbLLC2aMnEAOz50pmqMGvahF+Ix4JW/uI4U5Gee6Aqg=
Received: from CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:14:34 +0000
Received: from CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::6a3c:6129:f3b7:8c00]) by CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::6a3c:6129:f3b7:8c00%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:14:34 +0000
From: "Cvetic, Dragan" <dragan.cvetic@amd.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>, "Kiernan, Derek"
	<derek.kiernan@amd.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] misc: xilinx_sdfec: validate LDPC code register offsets
Thread-Topic: [PATCH] misc: xilinx_sdfec: validate LDPC code register offsets
Thread-Index: AQHdBAzYwGUZlqcKYEmZUCbQ9Xiu1bZVM1cg
Date: Mon, 29 Jun 2026 08:14:34 +0000
Message-ID: <CY8PR12MB7491641494EEFFCCA582058FE2E82@CY8PR12MB7491.namprd12.prod.outlook.com>
References: <20260624190812.3075-1-alhouseenyousef@gmail.com>
In-Reply-To: <20260624190812.3075-1-alhouseenyousef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-29T08:03:08.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7491:EE_|CH2PR12MB4039:EE_
x-ms-office365-filtering-correlation-id: 99fcbdfe-51e1-4700-73a9-08ded5b67429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: BR0Aoa5KnOnEBJmdPKHWcbPwtHTCiPh6tywH6HXYMdIDiSagAF78HnAL6OMb9oj6ohkfFbZSeehzbOVGwB210Ck6cmdil8WFgM/bXi9m7ernao/TI9Rq3fQX6oGtWQnw4oXSHquS9prsxTRn7peD9v2Tdu1EqBCIxSxZyYwQb1ywp7lJjrSrNUnoOjRZRthJXt9e76ARRwnARU5XX01GKWQVBLqfWaBy4899lKe0KZlj093eU1Roby0s0CujsBXQXZ98qbl5RcviFl97DbdvH5xxIDRHmsWSGbDejkYp5QKQ8saHBREKWU4N0vBko8si4b1z3j0tLyTzZKw8Bq9vZEQ/K7G6jo9O/ukMPcX/X2FGa+hbv0ww+bkP6gGyCO3pt4XjoVEtiZS1zits6nzlZjXuUPkAt3/UlJfp4+MOPnBCzuC/dn6dbRi3XtUgF77fTGu5Xxy5ycu/Hbhni4MoQL1aYHE4V2ZZLVWFu36PGpkPY1yCjY6F+PP+Grh253+C+STePzixb2iaibMF2QIv5B4+krSZb857SlQV8iBu9a8B/w3Yo71hzY3ktNL9lXNcTNuicbHzAq/NpxG9MltfVREfgkUIhD/vvzHV0ExNHM7toFQQYum/i9NTPhRl0KWDf0mmif1DFPJbAS/55FpYHO03/IdpgQjT4zqFo+iNwm4+XJV99mxIGz75XufH1jq1Agh6P6cR9FXIu5xaZjTA3YKGPy3MatnzqVmrRanb0Rc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7491.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rv8SrpRNqM4G+ZwJ4+6gYcEfRN+R/qlX7MeeJJBXwE3DUzF2kcjfC4Evx1eB?=
 =?us-ascii?Q?8d/ZsA364VRoB53PxxwxE7cwY1yrdjqMJIxLobVF+udJ4vlFWiXoraKiyli0?=
 =?us-ascii?Q?NG7GHfpQo//wducYEtwQwBVeAwQv62BMVB/HRVJPW+3EWCPCrHlQ5ycP+nS4?=
 =?us-ascii?Q?VoLYpQWy8EXkrL41shkQa53G26Ez+JrFQePMnoS+UHv/mw0p9N1iWlu5WvFp?=
 =?us-ascii?Q?aNTTgV3HH1Fzhay7C4kci7g0ogrccHAxT6FaJewpz/THO+ZLWb9oVbsufQwN?=
 =?us-ascii?Q?0BHZIruWgkAs9h4hq0JahVvQaxf3+pUSnQMZD1f27ApWJhEtH9GB9YeCm4+U?=
 =?us-ascii?Q?UV1A4kCktbYI0cHLoJV/XBOVwivRyJJKslR3fOsQ33D+PB4smtioHhbVwM0f?=
 =?us-ascii?Q?MN+Fq3pQZnOtMvCf57ik3d1mszWqnSH++8Dmip4JXOOFhzpal3kLz9CfDuXV?=
 =?us-ascii?Q?A95foxS4LZqSlOkWoQZL7FiLOvol/YR9AOdwhJyRLXIPF14+acmLhPz0A3+G?=
 =?us-ascii?Q?r/JtOuYAf24FOKPD2OYSaK8Vd0rxiG6JBJ/5VPdf8zB6w899Ay6uH18KNFLa?=
 =?us-ascii?Q?TrTvzR4HAu1SMtmJKclgagWEbYXoPQtuMd4G7edK9FEjsQ4EuPNR6I4ndr0c?=
 =?us-ascii?Q?2DJ7V71BrQqk9CFIcCVFN2xmlGBiK/5GMyDhj4fSu8ToQlVabyQMuRzYO5jP?=
 =?us-ascii?Q?Q/spO5dqWha1+CchpaXMkO+s0tjYl3RxyCmreCJssior20g+mbkS6BQwjdy9?=
 =?us-ascii?Q?SioaQpsNEb5qoo3dR76mGPY6sqjyJl7FO44SnlatwhGm61x6A1QMhKcOge+M?=
 =?us-ascii?Q?Jx2dmE2h7izDCWy2rdWFiKGCiMGkidTK093wJeZcpu12t6wn1ogM7Ijnvx2U?=
 =?us-ascii?Q?Rgnlzb8b+SptWQuuevJvIO74kUWlssFG9S8SrWWs6t1suTLWIwRHKu56aXlt?=
 =?us-ascii?Q?cb7rKzA+oEMZw+ysq4m0Gtg/opNDkg1klpEP+YqA/LRge9374l7JIhBPphtL?=
 =?us-ascii?Q?EuoHaJBFEFEz6U4Jp9aNWQO5MFGZ7wOYmcyGBgSQce8iXzE2z66EGcPU7BQt?=
 =?us-ascii?Q?EPPILqdzKRuIyIwZFq4V3O/UtWB2jb+Z9AhcOKBCsXUlnHhxrd5NLeDuo1G1?=
 =?us-ascii?Q?2gtCr5hRb+JNi9Hpj9bUR6TNd/kYijUOPycFqyeW3Qok24JaPv2NihiEJF+m?=
 =?us-ascii?Q?iTMj2ce6AaiFHCjcX0l6eoE7ejTpm7MSvqLsrT69WKtxsHEWlOh3jhuB8y7h?=
 =?us-ascii?Q?JUm78vQMl/73gqjiP0d9kPL9Hu5rKXoBw3UL1D/FSrHuSud/07HuD237uqwa?=
 =?us-ascii?Q?Ur2z/yRjYI+UWUHkcP/EXsPUWv2nWP17PR8s3mGT/PuHtZ56mwVWwjT7PAo3?=
 =?us-ascii?Q?BtkWVbnSLKcA8dO8uyEDCZqpGII7YqfpctHL8rrsLApz2yM8gq8BnX4h6Qwl?=
 =?us-ascii?Q?+bmeHP13deg4+k4jKAZIpFZ0lTYFZ/Nri4v/3SR868QLkD7sfjECtT+5HeLH?=
 =?us-ascii?Q?hHncKKvwT+MAHJ44aanlm3JpsgbIOoY5LqSWb91Vidd5GGBVk5VRMXvJAhhw?=
 =?us-ascii?Q?b5SWbRyLwzYdx98lYUvf9h7UTOiCGaNug2MzxCOD7eVMzRMCTw6LiRe9bdrH?=
 =?us-ascii?Q?qEv/GMM93vMMs9G69Y3tOGbD3zwkTMNS8oqCaXG4G3xIXNGWivFwVX2yySCB?=
 =?us-ascii?Q?LRREezB9yebmv61f48qSj+HfLYck+AcAZFszTZo/+/zOlyYH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fcbdfe-51e1-4700-73a9-08ded5b67429
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 08:14:34.2772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8IVzeGGcrct20ec3yLLXw135m1lbgILOpTfZR7c5FvTluSzt4Dx3viBToQm0j3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_011440_159077_E1656EAC 
X-CRM114-Status: GOOD (  21.31  )
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

AMD General

> -----Original Message-----
> From: Yousef Alhouseen <alhouseenyousef@gmail.com>
> Sent: Wednesday 24 June 2026 20:08
> To: Kiernan, Derek <derek.kiernan@amd.com>; Cvetic, Dragan
> <dragan.cvetic@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Simek, Michal <michal.simek@amd.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Youse=
f
> Alhouseen <alhouseenyousef@gmail.com>
> Subject: [PATCH] misc: xilinx_sdfec: validate LDPC code register offsets
>
> The LDPC code register helpers check the target MMIO address after adding
> code_id * XSDFEC_LDPC_REG_JUMP to the register base. code_id is supplied
> through the ioctl path, so the multiplication and addition can wrap befor=
e
> the bounds check.
>
> Validate the code_id against the register window size before computing
> the final address, then write using the checked address.
>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/xilinx_sdfec.c | 72 +++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 3135ba3a5..63f0eb2bd 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -456,10 +456,23 @@ static int xsdfec_get_turbo(struct xsdfec_dev
> *xsdfec, void __user *arg)
>       return err;
>  }
>
> +static int xsdfec_ldpc_reg_addr(struct xsdfec_dev *xsdfec, u32 base, u32
> high,
> +                             u32 offset, u32 *addr)
> +{
> +     if (offset > (high - base) / XSDFEC_LDPC_REG_JUMP) {

If someone accidentally passes swapped high, base constants in the future, =
this underflows because they're unsigned.
Check if (high-base) >=3D0


> +             dev_dbg(xsdfec->dev, "Writing outside of LDPC register
> space");
> +             return -EINVAL;
> +     }
> +
> +     *addr =3D base + offset * XSDFEC_LDPC_REG_JUMP;
> +     return 0;
> +}
> +
>  static int xsdfec_reg0_write(struct xsdfec_dev *xsdfec, u32 n, u32 k, u3=
2
> psize,
>                            u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       if (n < XSDFEC_REG0_N_MIN || n > XSDFEC_REG0_N_MAX || psize =3D=3D
> 0 ||
>           (n > XSDFEC_REG0_N_MUL_P * psize) || n <=3D k || ((n % psize) !=
=3D 0))
> {
> @@ -476,17 +489,11 @@ static int xsdfec_reg0_write(struct xsdfec_dev
> *xsdfec, u32 n, u32 k, u32 psize,
>       k =3D k << XSDFEC_REG0_K_LSB;
>       wdata =3D k | n;
>
> -     if (XSDFEC_LDPC_CODE_REG0_ADDR_BASE + (offset *
> XSDFEC_LDPC_REG_JUMP) >
> -         XSDFEC_LDPC_CODE_REG0_ADDR_HIGH) {
> -             dev_dbg(xsdfec->dev, "Writing outside of LDPC reg0 space
> 0x%x",
> -                     XSDFEC_LDPC_CODE_REG0_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP));
> +     if (xsdfec_ldpc_reg_addr(xsdfec,
> XSDFEC_LDPC_CODE_REG0_ADDR_BASE,
> +                              XSDFEC_LDPC_CODE_REG0_ADDR_HIGH,
> offset,
> +                              &addr))


Put debug message, previous code had debug message.

>               return -EINVAL;
> -     }
> -     xsdfec_regwrite(xsdfec,
> -                     XSDFEC_LDPC_CODE_REG0_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP),
> -                     wdata);
> +     xsdfec_regwrite(xsdfec, addr, wdata);
>       return 0;
>  }
>
> @@ -494,6 +501,7 @@ static int xsdfec_reg1_write(struct xsdfec_dev
> *xsdfec, u32 psize,
>                            u32 no_packing, u32 nm, u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       if (psize < XSDFEC_REG1_PSIZE_MIN || psize >
> XSDFEC_REG1_PSIZE_MAX) {
>               dev_dbg(xsdfec->dev, "Psize is not in range");
> @@ -510,17 +518,11 @@ static int xsdfec_reg1_write(struct xsdfec_dev
> *xsdfec, u32 psize,
>       nm =3D (nm << XSDFEC_REG1_NM_LSB) & XSDFEC_REG1_NM_MASK;
>
>       wdata =3D nm | no_packing | psize;
> -     if (XSDFEC_LDPC_CODE_REG1_ADDR_BASE + (offset *
> XSDFEC_LDPC_REG_JUMP) >
> -         XSDFEC_LDPC_CODE_REG1_ADDR_HIGH) {
> -             dev_dbg(xsdfec->dev, "Writing outside of LDPC reg1 space
> 0x%x",
> -                     XSDFEC_LDPC_CODE_REG1_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP));
> +     if (xsdfec_ldpc_reg_addr(xsdfec,
> XSDFEC_LDPC_CODE_REG1_ADDR_BASE,
> +                              XSDFEC_LDPC_CODE_REG1_ADDR_HIGH,
> offset,
> +                              &addr))

Put debug message, previous code had debug message.

>               return -EINVAL;
> -     }
> -     xsdfec_regwrite(xsdfec,
> -                     XSDFEC_LDPC_CODE_REG1_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP),
> -                     wdata);
> +     xsdfec_regwrite(xsdfec, addr, wdata);
>       return 0;
>  }
>
> @@ -529,6 +531,7 @@ static int xsdfec_reg2_write(struct xsdfec_dev
> *xsdfec, u32 nlayers, u32 nmqc,
>                            u32 max_schedule, u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       if (nlayers < XSDFEC_REG2_NLAYERS_MIN ||
>           nlayers > XSDFEC_REG2_NLAYERS_MAX) {
> @@ -563,17 +566,11 @@ static int xsdfec_reg2_write(struct xsdfec_dev
> *xsdfec, u32 nlayers, u32 nmqc,
>       wdata =3D (max_schedule | no_final_parity | special_qc | norm_type =
|
>                nmqc | nlayers);
>
> -     if (XSDFEC_LDPC_CODE_REG2_ADDR_BASE + (offset *
> XSDFEC_LDPC_REG_JUMP) >
> -         XSDFEC_LDPC_CODE_REG2_ADDR_HIGH) {
> -             dev_dbg(xsdfec->dev, "Writing outside of LDPC reg2 space
> 0x%x",
> -                     XSDFEC_LDPC_CODE_REG2_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP));
> +     if (xsdfec_ldpc_reg_addr(xsdfec,
> XSDFEC_LDPC_CODE_REG2_ADDR_BASE,
> +                              XSDFEC_LDPC_CODE_REG2_ADDR_HIGH,
> offset,
> +                              &addr))

Put debug message, previous code had debug message.

>               return -EINVAL;
> -     }
> -     xsdfec_regwrite(xsdfec,
> -                     XSDFEC_LDPC_CODE_REG2_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP),
> -                     wdata);
> +     xsdfec_regwrite(xsdfec, addr, wdata);
>       return 0;
>  }
>
> @@ -581,20 +578,15 @@ static int xsdfec_reg3_write(struct xsdfec_dev
> *xsdfec, u8 sc_off, u8 la_off,
>                            u16 qc_off, u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       wdata =3D ((qc_off << XSDFEC_REG3_QC_OFF_LSB) |
>                (la_off << XSDFEC_REG3_LA_OFF_LSB) | sc_off);
> -     if (XSDFEC_LDPC_CODE_REG3_ADDR_BASE + (offset *
> XSDFEC_LDPC_REG_JUMP) >
> -         XSDFEC_LDPC_CODE_REG3_ADDR_HIGH) {
> -             dev_dbg(xsdfec->dev, "Writing outside of LDPC reg3 space
> 0x%x",
> -                     XSDFEC_LDPC_CODE_REG3_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP));
> +     if (xsdfec_ldpc_reg_addr(xsdfec,
> XSDFEC_LDPC_CODE_REG3_ADDR_BASE,
> +                              XSDFEC_LDPC_CODE_REG3_ADDR_HIGH,
> offset,
> +                              &addr))

Put debug message, previous code had debug message.

>               return -EINVAL;
> -     }
> -     xsdfec_regwrite(xsdfec,
> -                     XSDFEC_LDPC_CODE_REG3_ADDR_BASE +
> -                             (offset * XSDFEC_LDPC_REG_JUMP),
> -                     wdata);
> +     xsdfec_regwrite(xsdfec, addr, wdata);
>       return 0;
>  }
>
> --
> 2.54.0


Dragan
Regards

