Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B939AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUNKFQrZvs0cxg1+21RTmOviqps3jNFfazUptPwfREc=; b=K09EtmqrnsUFFImd6DLv/nuVr5
	8Enz5qivffQGvwPxsc65/yGuk9lC62HOQ6iN2UXAe8SFkm0X+8RrrzUOxrS81ERHQIQHDM2WFKO4K
	AboiRRMQPkkkL6QOy1JkGDRpOmLPbzYMb9wTVsO9I2I4tAWampEvdlKkIuJTlNulGaLuUmSyBkXYM
	M8CScn6BZQQtcnIRWYOfm/PMOabMAT9d58GrdlK9lR9ICrC2Rn1EUxh0CNEPSrHnDoHkTzDaNhA7/
	s0QDn3CFYg+bldRQtg5558Wt1b9NmF1G5zJacE0hP3lf82tM+mhsDpaW6CnDfcolNr8/Du2ag8NqW
	V9n74V+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSJl-0000000G2Np-0Gss;
	Tue, 30 Jun 2026 06:51:37 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSJj-0000000G2NO-0WTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkgyknsWKF0mXFeDz0nbK7mtIAuAEgRI0vujZaZHhq9kGcSVGZMlv2sk5lYS+JcHqlI45SuP3BOZxZSNOHHjkuSDCOoeIwICOXjEAYPFFrtoIusNJGyd6JkAca5yeSX8c86hUxdNEdOdrQv2wilz0y32g1wfLwQjTe7unTpg4AYdwki1YexJKNTtC4aE7Dc0kpcWqjkWfVLd0upqHMNg8MTYQgD3jh15Yw/uZuzPzkgs7cpZuDO+oaVVrjPx7SrIUwKmFgWAF85pAek5d2hMRQX9bNHxzn3N1ANLCH1Gv7B804sXX1btcYE9KEVdoAtN7Necqqv+er7Ubx3/y6rh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUNKFQrZvs0cxg1+21RTmOviqps3jNFfazUptPwfREc=;
 b=tb+MXo8W3aaYMkvHcdHT8823taerPwXgjjLjiIer90FtiMqcvCbND6VRX0oe4EBVRrijsGfRZGVwLADw5OO15M/0d7C1mBOeZWII2ZnBVcyUynLWfHnI1LOt9HsUU5nUMI4RELfvuRe4uLuEaI8fEPeJXwmEwf2tGH/90OTMqkxg5AyrbcKKhSy6UxYq3eSTy0YWgRENrYjcX5WY3qnL1zm5VhY0p+79qKTNWtwWP4E1Bce/qIWrRt3hy0bJG9PMiqE6u+Ycc9W7R0UsM3RwoebqWlEEU7jVgM1cspl9ivRPi1KVMw7E+iTZhelO1IM68fMy/YJfUz9MOsQ24gTZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUNKFQrZvs0cxg1+21RTmOviqps3jNFfazUptPwfREc=;
 b=u+3/93WhJp9ROZ2+0FHl6sLea3NHOMQMgOCXUhiBxswRoBGglYzG4mXIu7rgQFrSVNPj2djGijFeMaOu7LrLAeSOJ4xxI56GVAg2YgJheX/UclGRWvzkVrf6+4zJjuovqe8iXDX8NLI3ujRqnCJynEJYDwye4MpOIlEW1I4cifY=
Received: from CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 06:51:27 +0000
Received: from CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::6a3c:6129:f3b7:8c00]) by CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::6a3c:6129:f3b7:8c00%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 06:51:26 +0000
From: "Cvetic, Dragan" <dragan.cvetic@amd.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>, "Kiernan, Derek"
	<derek.kiernan@amd.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] misc: xilinx_sdfec: validate LDPC code register
 offsets
Thread-Topic: [PATCH v2] misc: xilinx_sdfec: validate LDPC code register
 offsets
Thread-Index: AQHdB9wfXZklkDLsjESfEunpn6rw4rZWqS8g
Date: Tue, 30 Jun 2026 06:51:26 +0000
Message-ID: <CY8PR12MB7491ED029CC4094906CCB183E2F72@CY8PR12MB7491.namprd12.prod.outlook.com>
References: <20260629152857.13553-1-alhouseenyousef@gmail.com>
In-Reply-To: <20260629152857.13553-1-alhouseenyousef@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-30T06:48:26.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7491:EE_|MW4PR12MB7261:EE_
x-ms-office365-filtering-correlation-id: 2bb2ae3c-98e4-49c5-4e8b-08ded67401b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|22082099003|18002099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info: NtCatBu13wtYmZgP4z6/1Q+taxF3YxK5HbCUFfckdaOfCo3gQvP7M/Lx3UNNpaaXuUKKfy3qfc0g1HUG4AGjigjQb5RoVlceql1wukz9mUDsbmJDtzq58qrNbXyc19l5s0qWvMoewMBPMWOTvahPAgcXcZIfWIxqVs6pWC/MvWoyvz7+EgsDbr3q+vGKqbfCLC9chElopgXgbd61WCUO7vnWYqA2ADQVw3oIG+SfG7SiBJ7zCMyIhxIVicbYV6Q/BEnYSpWHCrXd3SRujEENav8UlTIDMsMOPQqRhoUJCii5PGOYt4YEDQBNe7YbZiiNxIW3iNfKjz/FaDgqwfpy7HU9vKJk03QgGrP7mGRj7rUbR75vrkwCWJ+y3j5eutppFOYvalenfEtZlBVObQTMQfiXJGridODCJGn7xvpP6o9jNkxPwTDOVtRYEvO3WBko7iRvEgxZrfvcFcMbTAkh2eR7ztW5c9X1xKdbQa4O+8lctr0L9wUslNdH7CpmpSbjJTLC24GreClgzHKc/xb8KtUlLfJrs5BfC0j7KIdljPScHp5boskzmu0lHGPdmIfYgGpGuouG1v1xJwlvVbbhZiOGNE8R9Q6fc4gDi6hY0z9553h6N4MFEGqDPL/ghJON6zZyJb604wR+EI76p6Jpq/SX6f94hn2xAIH1VDkFMc4cBHfwFs/HLTTIZjsNDrqmvYSoVaJfKKY4ST08W5XDPD+4acUeXY/mWpPBg2Kro4A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7491.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LnNMR9AXAQHchd+3WIkqU96J+3zIUBotgQPXCSY6ir3GVqqP3o58RsfmmOEZ?=
 =?us-ascii?Q?T9KSN2NQdD7nVU/UWhjq6saCmNNEQBWD6xhU9YygVGkYnmcHyTFrCL1ZGRU9?=
 =?us-ascii?Q?k5cIYCci+G7Cvz8HDOlpBvU7IR79TZSQB3Gmvvz96oK1GQ5Z7wHvJ1kpGtae?=
 =?us-ascii?Q?RmiYFNgp7Q8k4El4QbfhUwph32luMH62i1iDcVbxG7kZo+HtzylldReYZnsF?=
 =?us-ascii?Q?kWaCUooiu6kk8GgIo21iVKw0qIn4Bgw8Rq4tEqPtrQfIbuMzMESsXKAarS++?=
 =?us-ascii?Q?bk1M2z/tXw5OHwVFOw1BVKjt3wHrq3M+bB6eMBczC3xt7fHe6dlTd2HU0Uq0?=
 =?us-ascii?Q?LtqzEv70a7+IRHP906ZRwfVI+QVaErofj25tK8LHkVZxWJTrlScmwVPkxOwW?=
 =?us-ascii?Q?BwGOQCjijBUCUFckOX2FE1W6QMv0Y5Ur1AsV9rhiKgYwy4GGh8cxZZLkS20A?=
 =?us-ascii?Q?yzvRj7+2tdk3dQuM/AbO7aNPGW4rkmxlXiN8mrn0n8JxG293WIpnEIw30wXP?=
 =?us-ascii?Q?A/xQdXSVM4ynF8O/iPNDdMMmnEmFdQUOnMFK0uyqX0BOAIboTn1w6oqazJe7?=
 =?us-ascii?Q?dGJ95pJFZOM12KaDDdciTBQNjtzeK+7auw7AAv5l4PKIsC8Z3rq6SGKDPs54?=
 =?us-ascii?Q?DQ9tL0Rm4dQyW48CI38xuK2Z1eQEcCawWh+sbL7rQiP1Vg4Uo7PljELf28pP?=
 =?us-ascii?Q?0RZB67FJWHFPN0NRVaDSrm3PpiR3j85MJA1UGQl6Vg3ZI0fOcNq9WMd8ecmD?=
 =?us-ascii?Q?R2TJWHp+GnpfTZu5Lg4Y5vyPaN6uogIUjaTeKrAQ3iVnwHBkzbrS6r9O0Bdc?=
 =?us-ascii?Q?uyTAD20smqut2df9WjBwCHRwOqwBR6huefMe0colLSQIzrHPF/j4E8/S2Qtp?=
 =?us-ascii?Q?MgMrMPLhFw3qYQO2f/JQbple9/3Z3JCXNOfgpTnfqymi0+SrG+WHjiOx9iwQ?=
 =?us-ascii?Q?wLVUy4afD6i6XtM1G5KgTnhzwwDDct3vbWX7YhdRZGMUqNnvGciJNM3UAq2S?=
 =?us-ascii?Q?k2EXq0n/4T5z5T9RIs1fAU6vixCEGpe6pjGWhRmDiFH7cXBKIQf2Q5kMlqHU?=
 =?us-ascii?Q?+h8RJ9KLFED/WTad0wzaXFvaAsAd7gTIxMRIrdvD6/0ffNKYXZdR7ka2c8EE?=
 =?us-ascii?Q?a88Xl/WxQuutwXXXcK45hAzKtFJQ2rI9kqpF8K7eWoAW/ClQD32Bxn3y+OiR?=
 =?us-ascii?Q?PMEjWEjpaym8bxJUiRNY9qvztSeDWHIEtQI0EZAcD4XraEftIUUN5d3zUXUF?=
 =?us-ascii?Q?qy5sGAnotI4QzY6/Nc8o5xQ3tYd496XCjVptbXEao3QUVU1rQ3Zzdik5lR0i?=
 =?us-ascii?Q?2yyvJiNGFU9Yh3TEsxfRMGgNWrMRShhd58o0RNpwtm9QFBvZj3M1tKIOaxZ7?=
 =?us-ascii?Q?gocdQWrVjWlX4UWuWO47pZdt6u0SDrYEDlLDRWY7sv1xSiYMHkPkQvJ2yNVh?=
 =?us-ascii?Q?QwzXQb6eSt3ZwGLE0x/Lm3QpgzG2m3IQzFYP8WgTGtSktj/sZadYs0owcRY9?=
 =?us-ascii?Q?71OsyrS0T4gi8q7kIv6OJpKoTg1sKOXFzXh6m68AIZqzuEw/uT9kqY29ADrK?=
 =?us-ascii?Q?g0v12uohxTCo+4zfmrTjXaBBFLoL96JdbbsZ2x7OG7DbNj3VP5/1YOuUusUR?=
 =?us-ascii?Q?2vX9+YTF8hTfwT44LEiYLBGxrRu7M6vl1D1ut5xESqXetZy9vgHwM7H+q/5u?=
 =?us-ascii?Q?fiBcWeofwEnevN0+xnYWLdYX1ekub96POfAWs+UVoPAuq1Hx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb2ae3c-98e4-49c5-4e8b-08ded67401b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 06:51:26.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTkIo7G6v5DLo8zR/WXw0Yv5oQBLKIDeqRG5LB74FhSdnYPXkaf/ik9TwNKDPHB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235135_209453_3B885377 
X-CRM114-Status: GOOD (  22.69  )
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

The patch looks good to me.
Reviewed-by: Cvetic, Dragan <dragan.cvetic@amd.com>


> -----Original Message-----
> From: Yousef Alhouseen <alhouseenyousef@gmail.com>
> Sent: Monday 29 June 2026 16:29
> To: Kiernan, Derek <derek.kiernan@amd.com>; Cvetic, Dragan
> <dragan.cvetic@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Simek, Michal <michal.simek@amd.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Youse=
f
> Alhouseen <alhouseenyousef@gmail.com>
> Subject: [PATCH v2] misc: xilinx_sdfec: validate LDPC code register offse=
ts
>
> The LDPC code register helpers check the target MMIO address after
> adding code_id * XSDFEC_LDPC_REG_JUMP to the register base. code_id is
> supplied through the ioctl path, so the multiplication and addition can
> wrap before the bounds check.
>
> Validate the code_id against the register window size before computing
> the final address, then write using the checked address.
>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
> Changes in v2:
> - Guard against swapped high/base constants before subtracting.
> - Preserve debug output and include offset/base/high in the message.
>
>  drivers/misc/xilinx_sdfec.c | 74 +++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 3135ba3a58ee..e73a139f3ffc 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -456,10 +456,25 @@ static int xsdfec_get_turbo(struct xsdfec_dev
> *xsdfec, void __user *arg)
>       return err;
>  }
>
> +static int xsdfec_ldpc_reg_addr(struct xsdfec_dev *xsdfec, u32 base, u32
> high,
> +                             u32 offset, u32 *addr)
> +{
> +     if (high < base || offset > (high - base) / XSDFEC_LDPC_REG_JUMP) {
> +             dev_dbg(xsdfec->dev,
> +                     "LDPC register offset %u outside space 0x%x-0x%x",
> +                     offset, base, high);
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
> @@ -476,17 +491,11 @@ static int xsdfec_reg0_write(struct xsdfec_dev
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
> @@ -494,6 +503,7 @@ static int xsdfec_reg1_write(struct xsdfec_dev
> *xsdfec, u32 psize,
>                            u32 no_packing, u32 nm, u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       if (psize < XSDFEC_REG1_PSIZE_MIN || psize >
> XSDFEC_REG1_PSIZE_MAX) {
>               dev_dbg(xsdfec->dev, "Psize is not in range");
> @@ -510,17 +520,11 @@ static int xsdfec_reg1_write(struct xsdfec_dev
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
> @@ -529,6 +533,7 @@ static int xsdfec_reg2_write(struct xsdfec_dev
> *xsdfec, u32 nlayers, u32 nmqc,
>                            u32 max_schedule, u32 offset)
>  {
>       u32 wdata;
> +     u32 addr;
>
>       if (nlayers < XSDFEC_REG2_NLAYERS_MIN ||
>           nlayers > XSDFEC_REG2_NLAYERS_MAX) {
> @@ -563,17 +568,11 @@ static int xsdfec_reg2_write(struct xsdfec_dev
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
> @@ -581,20 +580,15 @@ static int xsdfec_reg3_write(struct xsdfec_dev
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



