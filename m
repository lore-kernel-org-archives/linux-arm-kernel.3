Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6C1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfVF/sVIizu7yBjtBo8OhVgOh4a314wgd47rB1vzduU=; b=Iv+aYzPwpeN9/TECAPvdf4kui7
	rMckzGUm1yFR0ime4olx2SrZ8earURGjczKyG5asCXsRuHG3pNI4YMkua1VqMN0sDAovimDPM2K6j
	nb5SjfvyJQPwzsrQX2SKAjzD7p4JkAM0Bdzn4OQuPdX9zG7Kc8+hLhlSPykASbeq2mOmb1C8RbraD
	w9siI2N2BNSD2dyZ2kMQMjQs2UHOWtpYSY1Uh47Lnyp2CJQI+/3tVnpYvWoyWQ0WRZFDYoxP6LMvi
	01cvvuAb8Ky9zWj+59oLqBc8hX1scJEB4C+0H54UcJIGbIqNrQDjb/6ARIBYzigzzM+oQeBeYkX+F
	hGPdIDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYUJ-00000005yWN-3Ld9;
	Thu, 14 May 2026 16:00:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYUH-00000005yVS-2wBL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpklNozB/F/xoCZdr1zHcaFwNcwZEAqviltRJWGc6fxSp2pnjtmSOeZA/YgHXiQd0TZtu/59uLR0wS/lZvLWksdJZPNXjFv+fcQuioTkqPVvxGednnfJ1yF+G081YVacMvtbhaROXQ2M0nE8s8ZPjLLI+kUvlNYWiMo3KTHncTii2SreuwqRpfbcmF0f3FR5Pg8MZoq48pZ0MH3HwgsNaHwqYiVKwUaby8K+RT4ilmIKe37sB2ZD4j2QMcI1mffF60pFGgHekhXs74qzYjKwQOnfcfJ9By7yfwAvbgDDJ4hSBs6gMObKYwH13WOmNCLn5E416yXYvrHAZtuSbEBCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfVF/sVIizu7yBjtBo8OhVgOh4a314wgd47rB1vzduU=;
 b=XtyA+Md1ifglBOCtv6NMSQVtEp4AzY2n+3QQx55EwMcdMZYlVOovJR7x05VMewmy+9Lefq0sHme2GU6FfZcXqFtDtikloVrqWcsOkwCHW3HTHCbz1LlTpCsRMYLTgkDvD+d7+oKv7oDdMrH3fJ22WawFcwAqaB2219Lbg0ljfoolwEXmC+rIMWXf3kZC4KLfHZDmc4/EXyCubKZlOeGlfwwvK18ZCtvl+fQm+V4yHPGgPc/r9ppT9Q70uNMdTNwZ/JzI9ASMgy0xrJNHnmSfn5Jw3cbsV9E2t4ODLWo9jsOb5tpLChUIVryW8nmvdXHZhiG7rerLJnDa7o0/PJALsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfVF/sVIizu7yBjtBo8OhVgOh4a314wgd47rB1vzduU=;
 b=pFTfuSz0p+44252M8rIAolfcc0pLO1FYf8JBxed51z0R3udQt4r3uvCf7TYrzz/uFdmecXazdIJlibLtmmMan+l83espbeka/E9DLKJVG22VRKNDsoNEaXvWggFEPvA1Eb6bH8HmB8OHDeVmz90zGYv1OwBhiGz9upX5eD0hQ0u66SPYCBimtKcpdKAMUTR9mCg/mPHWEnDbhClECffqC238lmv4gA01zDXrw3sfXdHLc+Hy+H5jd4E+1V1Q7sxgEfIh1AlbHctpIWrqEiBEkWRtEcPqS0f8TWCV+2zRunDNZXK5UEpc1njmb/mfDFq2vbR+FfxLoJpsGS6q5jUyIQ==
Received: from SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18)
 by MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 16:00:28 +0000
Received: from SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807]) by SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807%5]) with mapi id 15.20.9891.008; Thu, 14 May 2026
 16:00:28 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Saurav Sachidanand <sauravsc@amazon.com>, Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "aghayev@amazon.com" <aghayev@amazon.com>,
	"juew@amazon.com" <juew@amazon.com>
Subject: RE: [PATCH 4/4] perf: nvidia_t410_c2c: handle PERF_EF_UPDATE in stop
Thread-Topic: [PATCH 4/4] perf: nvidia_t410_c2c: handle PERF_EF_UPDATE in stop
Thread-Index: AQHc4z4hSNFVtg6au0Wn+5ONRoyL97YNrujg
Date: Thu, 14 May 2026 16:00:28 +0000
Message-ID: <SN7PR12MB7226B1387B53D0DCE6A0DB8AA0072@SN7PR12MB7226.namprd12.prod.outlook.com>
References: <20260514010629.76558-1-sauravsc@amazon.com>
 <20260514010629.76558-4-sauravsc@amazon.com>
In-Reply-To: <20260514010629.76558-4-sauravsc@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7226:EE_|MW4PR12MB6850:EE_
x-ms-office365-filtering-correlation-id: c933961c-8ec5-45cb-2c60-08deb1d1eb1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|11063799003|4143699003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 7sBpeMMEvFZYESb13rL59Qevpsez/HH/k3v3MZlJ9a9ZWxkG6ohlipyGR+ki3bQ+lkrEUMTp7yknLSCobf4TAGxcyOGlyTvU5EmeK/dGL72jcZIWt7Sgcj5acoK9aa5b5giZMVEBgeIaCx+02Xj3yW7hOP+OEy7bsW6/+4NhVH873XOS8PkpaNcbc6FZxXuJW2Q05XGCDmaK+zw3gTBscL3rvavJA5jEG+yJQoQWB3to8fLKHZCw7FMpC/NNsRmAc4YPeN/YWz9+y6EE6x438sZfAfkRaxKAYXKlUnMrprDqALXqFgZO8qWZQOjGmkwZFccjyHaPj+ykESFo3M8RwE+YibSbxPYkWv0qm2yqXgeHe1m/7uhREujkpBX5fnb8Yr4TLkexDfG6/y6Y5dOspvJ4PqQkL+BnKja8ih319pCndfPu9pdklaK/RjBx8B2dDT6FB4Ek7kXn83PhI/v/CDBl+U3jCtf0nuc6cIH6mwbCn8d6b6zHrtTHx9uf6pByiPv83xMpz3vQBi6Ihlr+BBzXXwu4Ts7zKvGQHKfF0oC8HkMr5jVc33OdJ3J5OKjBMme7/TZMIwj7PPULw1yWIoG80r8XdgpoIoSVC5tfd4abw0vr3ox6yr7VQB6Jod5p6birgBkRdua71xYTIpIBTSpGj9XBJnUCEIYsvXG4ktqgOn3pW0soukuI9Rbz/0ZNlYmjeUahlAL4M/HKsC2ma9C+AsfchY+FSzBzC6lro8uUpqwp0bRw2XeAWl4eYiad
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7226.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UVtD+vVrGj98IT6AsTzBr9NQObb6wE7c4hDUHgOyW3nmUeB++J6GCLGDvKzh?=
 =?us-ascii?Q?LA+6hpELT5Ly/bqD4I65s9hMvUAV1PoO9xXm+stKTPnEaD5PBs4xHx/eoYe8?=
 =?us-ascii?Q?0c2kwkwjMHH5iJLvAHgOu5WDwiCm0TWuF8w5XX4p+f1WyziRTaaZvfbbFTZq?=
 =?us-ascii?Q?/wsard7Jn9DneXK50ocvDayjOACnFDlr105gFf2I4K4Vj/HnBHU/XyfF8GQO?=
 =?us-ascii?Q?2t6POu+d4kcjCwPdmKtwHRWy0+Sji96rRraueVInngGNhGlFAUERzDlPk3zJ?=
 =?us-ascii?Q?F5e81GnMZrNAexRyDQJwrGY21nOuSGDXgp/w79SBqqMXVhXxMs8Vqqct4941?=
 =?us-ascii?Q?41gcV0fQJADlGFTdJY/eNbOUmogQXO8gasaYqP57VzfehX3qgCO0u1FcFbfG?=
 =?us-ascii?Q?x46bQuKJO6QPkRH7FERrXNUqQhJ1Tgj0eEUM+VWdwr/nXGU3krTgweM7Q4cz?=
 =?us-ascii?Q?FZkQ/P02AeZMKVpnRB4Z+3tzwgDx1BDWPu4wlmCkPI+8us1diQF06V+/s+1n?=
 =?us-ascii?Q?toxSD5vH1FwMWuhzSjEN7995JfcU+73ykZ3mse35WVc+x4yKNZIJ9OuSLR/7?=
 =?us-ascii?Q?24woO9Pjte6pHz4QSA7LospngjjQWOAdypaBCGDe0wwKXAeGkVJ+5zdkCDJs?=
 =?us-ascii?Q?Dk5xON5v3tptOoHOi7KvSVrGO9tWxmjg3++1KQ+4f+ZIWrRBdLQTNzB2Anpq?=
 =?us-ascii?Q?gMaxaKW9OJao0Iqyc8wezkSPBsK9H5WBZLDFA2VjpH9JoAoBrA5Wd60xdWBQ?=
 =?us-ascii?Q?g0veNpaLNpzX8iifG4Zs9wtCK5G7OYzzMhd07D1BmG7s0tEFoyVvW2ylI1nY?=
 =?us-ascii?Q?5G6Cj8TIs3k5kJDdDqbWS9l7cmykiawtsMV0xvb9zSVV5q0DJ5iiO30wQox5?=
 =?us-ascii?Q?6W2uH0WkQtnwokrI9WfVJag86sOmmd9wqJyNpLgKF7f7ojGg71jeH6hGR/vS?=
 =?us-ascii?Q?gn8clZ6uXNvLDCVqTvrO6HAsNluTYufdgoCRpB6c4GVuWCnbhoOOOgYipIi4?=
 =?us-ascii?Q?NMNsJnoV58TurFYu1b5nydTF6/HN7uYMwWGKeBeZNeWQSVN40QGGrvREYJtF?=
 =?us-ascii?Q?Q++ISyQhmGc93HM7D9U0LKkkHNAzc6o2VtnmIwelaHn7n2AX8j3mmqj+8FYa?=
 =?us-ascii?Q?Y9sCI8bmH5hlM/MCZslbZwOuSWx43CdydB8emKcuyPoldDQz3Wh3fA6GLMbD?=
 =?us-ascii?Q?Z5gzUbT4D52sg1YJWvklBhYc8HhSeSNSByqT5JKcEtvaMRoiVpYy7GqoJJ85?=
 =?us-ascii?Q?BdMNK8QvAZXudU7aC0Pb5JJsWSIvGAzMj4uNMUal5icohAncgEhEy+aaZ2Xq?=
 =?us-ascii?Q?rMaBRIRTDjDcgB1Eh/fLA3DCEwHeDMEZ0S29qYoRPLkhE3IePqIpYdVcul5D?=
 =?us-ascii?Q?WC0JgITQLgHbzX3DktiubH7+G91sLSb+rNfKc2iZjq2E5GhPsDE+I/Zka8OP?=
 =?us-ascii?Q?r2MupLCkOwzz4DvoQ+O3YxkT/Q8N7QP/9K1Y6zCCxL6ZFA37Kt2cEmAsA29a?=
 =?us-ascii?Q?aSkS6kMWHD1uJ3P88Org28RPtqH0wOpfr0eN2CzsdgOyXpS2acr19j45MBT+?=
 =?us-ascii?Q?Uv67eaJXRdykB4ME6sIYPuDU9FUbHttAUzZVQGmtqB5s8RDuxqNQoLxczGBY?=
 =?us-ascii?Q?aV+1wf84z5zs+mfUJXUXozbxDlx4nPnxcg15B+Ux/JZHUuO9cuBWIq6KYQS+?=
 =?us-ascii?Q?+9Jd88Kvny0n/Bq16rBunBVnoutRz0fLSLds17181DDzMrvclkmRjhEk+CQd?=
 =?us-ascii?Q?UzQytOLAXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7226.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c933961c-8ec5-45cb-2c60-08deb1d1eb1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 16:00:28.3859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7DirS0mUlpOK8P2l44sDC3cZKoaejrRcPd7jfAwjRD1t4rwD9t8mjn4OB+t27XByiejLbyM4cZeuTKFZkJvrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_090037_739649_67E5BAA8 
X-CRM114-Status: GOOD (  17.49  )
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
> From: Saurav Sachidanand <sauravsc@amazon.com>
> Sent: Wednesday, May 13, 2026 8:06 PM
> To: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>; Besar Wicaksono
> <bwicaksono@nvidia.com>; Ilkka Koskinen
> <ilkka@os.amperecomputing.com>; Andi Shyti <andi.shyti@kernel.org>; linux=
-
> arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux-
> kernel@vger.kernel.org; aghayev@amazon.com; juew@amazon.com; Saurav
> Sachidanand <sauravsc@amazon.com>
> Subject: [PATCH 4/4] perf: nvidia_t410_c2c: handle PERF_EF_UPDATE in stop
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> nv_c2c_pmu_stop() does not read the final counter value when called
> with PERF_EF_UPDATE. The last counter delta is lost when perf core
> removes the event.
>=20
> Add the standard PMU stop pattern: bail out if already stopped, call
> nv_c2c_pmu_event_update() when PERF_EF_UPDATE is requested, then mark
> the event stopped.
>=20
> Fixes: 2f89b7f78c50 ("perf: add NVIDIA Tegra410 C2C PMU")
> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>  drivers/perf/nvidia_t410_c2c_pmu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c
> b/drivers/perf/nvidia_t410_c2c_pmu.c
> index 662fa1bc833a5..39d0e661e4c5c 100644
> --- a/drivers/perf/nvidia_t410_c2c_pmu.c
> +++ b/drivers/perf/nvidia_t410_c2c_pmu.c
> @@ -394,6 +394,12 @@ static void nv_c2c_pmu_start(struct perf_event
> *event, int pmu_flags)
>=20
>  static void nv_c2c_pmu_stop(struct perf_event *event, int pmu_flags)
>  {
> +       if (event->hw.state & PERF_HES_STOPPED)
> +               return;
> +
> +       if (pmu_flags & PERF_EF_UPDATE)
> +               nv_c2c_pmu_event_update(event);
> +

Hi Saurav,

This call is not needed since the driver called it on pmu_disable callback.
Adding it on stop callback would be redundant.

Regards,
Besar

