Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4D8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqXUIW6NwtfaX1xLZ/pY8bwyBs7voWvpzbaCBq2i6Cg=; b=DVUcwJXJv4cYqmGg61X1DAQ+Kc
	FxACHLCqgvNVFCMSJCl8v53BKg1Tk/++YajiWkpWhUTZUNd14jBbXQy1CFPK1P3ArSdbBg0NWO5Hi
	QucpAzf5p4Be7KDcmzxroPhPD+sIcMoo8TpupXH4ze+SPCvLoZXNSo/yNnn153v6ilosG81AwjuMc
	r+0DzzKKWeT7/UU5p7+3/Dy/yVE2WSLeV45kVQ2Whnpb/u9NAL0e4r6sihOSWgDEkdmwGTOOJQHzw
	jYMnfQzh9Qhwm+cjWKkYFpTWQ1IFnJVijP8PJTHVhvE70lodq2f0OCyBdgdCEygPHf+vDs8APxeyj
	x75GCygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYPg-00000005xe8-2XRY;
	Thu, 14 May 2026 15:55:52 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYPb-00000005xcu-1G2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq2/5THT1mBxINbHtD1KUeXanz8qtxfkUAsNzzNBlxuSkPZAAArrPGslUpi/ZoyI0+TJN5SBjqziBmbD0fmUlIMmK4Eek7GPfdPcR8rn2HEkRuKvUsBHHNUwwWBURtJxLRJOWrI3QTxuUmRp4S2JZRBWv6VZ9+9tGsrOOr7NA2aa6wuEzYJbjekcgFabldHeE3/vE+vAiFdwt0YsB4LfAhlLPZdScvcbyESzn+HYWfktL1Po4ycVrLQOzCwzijdqmvIxJndhfUkkDlv48QH2Eax3m0VG1XC2nJReNXeZtEJnCYiBwE42VuDAxavAipkcSSgsRZGVIR4QU+zjQglIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqXUIW6NwtfaX1xLZ/pY8bwyBs7voWvpzbaCBq2i6Cg=;
 b=EgIeGee91sOTzxRdsJss3S3TsZdWkG5scI+R5mlh4vM+Ny6uij2QtJvtjpmwvQ8Y7pkJE097zGyjDoFJYmxXEgGBP1APQepgJnmVvhWabdr5dzopuxi7PmIo6HmZSNy5oiJ5xY5kP+rX8Jp7gCl7dfV8HkpT55lUwpigppnqtv+AWKRPjvctBEgA+fo/C8tMwL/868+Y35CW69REJ3bfS8qggUbdbcbG9iO+EAPJYVs8aMX1oEialfNkKr3FfbXqe1iR29ukv6OM/wRTNzqzUl3Dxj4zjsOWI1ufMlEQh7GydcDoxTSQNkoMDwJY+d69pjswpK4wiDEsXemzKX//EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqXUIW6NwtfaX1xLZ/pY8bwyBs7voWvpzbaCBq2i6Cg=;
 b=Y9H2gZn/2XdjZfNmcsRHGguvZMULoAnz8Hi2k0R2vRr1BOuk987z4QRGTMhn9ArEakVPp22UYB8sYaPUpmIGLxWzKklu+U30F/XaAWAvmH9BVwxinVowN+gXJXCG0aO3UQK9J6cqTrPqaXE7/H5WqiWNjAxS9AP9YZP6j0D5hfzh2RaTmE8xou69skZzjIWND+Ipzw4MM8ySYLshX551urUb8yg1tJGgLC30bkF9GrmyiHtOD+nTa8lfCf94UaX55qxpnbSczSorESuK7LVh0nwolxofKqJubscdy7UfuqR/wpWnGprN3xmD8Bgj6FrotlwwcgqBsLycdhjz2QSoqA==
Received: from SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18)
 by DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.18; Thu, 14 May 2026 15:55:35 +0000
Received: from SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807]) by SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807%5]) with mapi id 15.20.9891.008; Thu, 14 May 2026
 15:55:33 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Saurav Sachidanand <sauravsc@amazon.com>, Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "aghayev@amazon.com" <aghayev@amazon.com>,
	"juew@amazon.com" <juew@amazon.com>
Subject: RE: [PATCH 1/4] perf: nvidia_t410_cmem_latency: fix cpuhp state leak
 on init failure
Thread-Topic: [PATCH 1/4] perf: nvidia_t410_cmem_latency: fix cpuhp state leak
 on init failure
Thread-Index: AQHc4z3x6qUUE6KScU+lvH9mSgBQA7YNrUmQ
Date: Thu, 14 May 2026 15:55:33 +0000
Message-ID: <SN7PR12MB72267A93F571C2D68296254CA0072@SN7PR12MB7226.namprd12.prod.outlook.com>
References: <20260514010629.76558-1-sauravsc@amazon.com>
In-Reply-To: <20260514010629.76558-1-sauravsc@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7226:EE_|DS7PR12MB5886:EE_
x-ms-office365-filtering-correlation-id: bc05b0f0-cf85-4f5a-1fd6-08deb1d13b78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|18002099003|11063799003|56012099003|22082099003;
x-microsoft-antispam-message-info: 3RFC+4PzYwp90XuA6NWIOxBLA+9Ca/78cPWHrYY5FodUxfYuGNUHAZ6yIvz+ZecRqbN79fCpmdAvoZTaiafo8M+GI3hDO3oGOLoZh3bPFJ9h7YBXg6HiGfT+rfvm4+M9BtOXtc3kmeaAEL2T7etZo33SWM+irBMmradfbyg6sAOD/xa71CPHrw3nLm9k41vZaBYNEHywFPvHSFKabbi56qE0HELByCZu6bnxSL0OeV1CuNNS9FSn6G95c+AitJsdSPmjzRM0WRzlpApgZNcgfaLdy9Z7fcy3yehmQGow/Ja9h9zcJdFRpjEkQCO+dSEycYDlfId+gCnC1dyHKwZp/KLdiUIdQjqPAvEo+uDm4j31byoOwvhvPXacAYYCAEChts155Ex2PD5XE4xHd97X12AB3y/q75W4UZdvpRjvGhtn/zg7dYFWZcQFJnZ/SR6J63PumX22h2uBQ8WJA5NUX1thkOxuggjRwmoTDtts8scek2UuEuaFeC46hLvNgPFYKpo41t8O1Q4wQGdDZWidDCzQDiLy9J7w6YJXK+l+770R0ZXp4qqcYvTz9DtAw8C0AW73y0hHGKm9xGSCoxld011l9HQaVGZr84hJi359AFqU6D6Un7fKv/TlpZU6ESMVQb4wKcrF5lXXRw/VuDSYhNopiM54+wu3sqQtfmYCZnaM5nPQ8sK7xOuadDh+cKvSVIRNZlYqN1z04LYRu+DDsFIsHe70+dJRCNYjioOoMis2zDbXhn18xDg+m9GDII/n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7226.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(18002099003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l2P7jFniZT85q+KILWbU/EqAFKUCI0G4smfqsBFVXdiKrVFfKJp6WsHrYgc9?=
 =?us-ascii?Q?q4JsYoo+LcIW9Nqqs4ADK1ZLcSRNo/QSc7fps1zMEEPd07Dg3b4l8nZMJBMG?=
 =?us-ascii?Q?qsLZGPS1CUd5YQrYYwL1z7nQHzMNkemRnkccX68VTQxoDxNUAPlRb+OHFq/m?=
 =?us-ascii?Q?6jrH2kO0n50q2xD6byZBls2850Uwg7rHbBQVmGLZjjYFWoIswMB1R/IwNEVV?=
 =?us-ascii?Q?hwm6PvptdVEr9gFsnngF0737zlPhPp9SOXvSA0HP4sn8mewaZbXkIElHFHTb?=
 =?us-ascii?Q?I/Cgi7cHuvT1gTo/fXga9Y2oFfr4nwpi6G8CDJ2jZ7B2XgPp2gERNe+oK3cL?=
 =?us-ascii?Q?Q7T2dUXBnpdGl9nG5CLiFfnzCuIlwMV0MH2MZhjpvT7wqN1XL3QunEjaT7jS?=
 =?us-ascii?Q?Z02HQfPWoKql5usF6JERwgVf6cZGc5kY8r/uy3SnFSCkN89n5el1HY9BDmoL?=
 =?us-ascii?Q?oGbpDeFNg7X2cHbsabagZhf9f9c6u4a6/R8MIQkRVUoyvKek0MrBhsxyBuON?=
 =?us-ascii?Q?tbyjOnYp4GYf1d8iLVM6HzfIR53B6gIAnXMwyB4GewYIysbDeEhKOr5f6Xrf?=
 =?us-ascii?Q?8rxvOU0tdWK9n/BXJn1M0/HHWxKRyeF1fw7oYwKgWmTM8ZtKxR2nHtENygX5?=
 =?us-ascii?Q?8Ed+ILimzVmIizxd+0UmXOKPqynqH+Z6kvj5p1mKXuUsQLTPxPQaEp44yKU2?=
 =?us-ascii?Q?GfjleZZbNb6TGXDLs96vUxADBtxlVU5DlyZM8AZYDGzVz1On4FUHfd4Mo95T?=
 =?us-ascii?Q?ssyQQLjGrw2EyJcsUJDkpNwoXHWHmN30V3yIG/nUJbEEy41NyJLKNwY+tumj?=
 =?us-ascii?Q?1VZpVXGmiGBp/pgJXIFWbb28afjFgq4s/sdRh+0Cg8TFEbG4oxmO2AASYt0i?=
 =?us-ascii?Q?X8XOjp30uDaJ9FooxT3KYefUlHh7jagKMKsHnee4OBMv9wEKnfEsfGulAZHH?=
 =?us-ascii?Q?mqV3Z8HZGbNLuU000aLOe3NL/3kO9RvBHYP2m97amGXHCU00Fvts9SoIhDbz?=
 =?us-ascii?Q?8f/9DwIWKdsXXja98WYwuocqtdy6Egs6MpMDR24yPvn79cN59esnrnQ3owk1?=
 =?us-ascii?Q?ibuo5MDk2f3XHu+QWbcWJ6CHeKUtME051sLaiQSG/bEe7YZ4ikDNwNDWJWxH?=
 =?us-ascii?Q?6+CaWCKmJoad6SkCXVWg5U/0y278623zoVFAITr4EjjARdKaEsxLdl4jlBdH?=
 =?us-ascii?Q?fQeCdJssfVhdjpzjNzW8RDOWbWtstYXJi0lchkjYcBcznmNdd4Hbd/vOA1J9?=
 =?us-ascii?Q?3HIwYsc1TjiA88+Z3MhfbIygmiB9RRaHk/zRc8usBALaPOYbeCfX1MjeDr4g?=
 =?us-ascii?Q?mpnDNx93ukngPxRHOxzf7i4dDfFPaYidJV815BM9CWWbTfQd+ryNWwmH2NEM?=
 =?us-ascii?Q?/7tU99Y1+P5Z9qncmaqYkcqWDHHURdel8VxvILFKM6OB7N7CvHPhft/hywSP?=
 =?us-ascii?Q?NvPLWAkSnLonxBaSa4403RAP1m3zhO5l6cAPT6rvLm7LiV1iLbB06POluIXF?=
 =?us-ascii?Q?i/TugTFLydpp1awo2foCFHv0Rl16Ut3JigdX1Sip5ZYZMzFxAqVvIejYQeGL?=
 =?us-ascii?Q?i0EfkWuyZw26r8gXjyEniZ7uCDcw+v3G+sc5LSVNCSD0dlTROjEfN7NncN/n?=
 =?us-ascii?Q?ZOc/QX0zLEtWPYz8J9drBw3FEJGyyYdLLRQM5SjxPbRbeRTOknXkOiPjwAB6?=
 =?us-ascii?Q?4XTEFtF8HuRjIpuuJ1Cdt9nPwqhF0KHMNQum6dm1CbI+/AUdhnRVr7Ot9XfX?=
 =?us-ascii?Q?6yIMmjJw2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7226.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc05b0f0-cf85-4f5a-1fd6-08deb1d13b78
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 15:55:33.6975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDqMl7IpvRYjFZv9alB+jNkSkN3Bn39Dst+phy+lhS0016asaU4O5oUfFXYtoaKxcjp8MS9NZ2rCpK9jS2Hi0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_085550_314961_FB4E9D59 
X-CRM114-Status: GOOD (  17.56  )
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
> Subject: [PATCH 1/4] perf: nvidia_t410_cmem_latency: fix cpuhp state leak=
 on
> init failure
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> If platform_driver_register() fails, the cpuhp multi-state registered
> by cpuhp_setup_state_multi() is never cleaned up. Add
> cpuhp_remove_multi_state() on the error path, mirroring the cleanup
> in cmem_lat_pmu_exit().
>=20
> Fixes: 429b7638b2df ("perf: add NVIDIA Tegra410 CPU Memory Latency
> PMU")
> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>  drivers/perf/nvidia_t410_cmem_latency_pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> index acb8f5571522c..e27bf31b2b366 100644
> --- a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> +++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> @@ -719,7 +719,11 @@ static int __init cmem_lat_pmu_init(void)
>=20
>         cmem_lat_pmu_cpuhp_state =3D ret;
>=20
> -       return platform_driver_register(&cmem_lat_pmu_driver);
> +       ret =3D platform_driver_register(&cmem_lat_pmu_driver);
> +       if (ret)
> +               cpuhp_remove_multi_state(cmem_lat_pmu_cpuhp_state);
> +
> +       return ret;
>  }
>=20
>  static void __exit cmem_lat_pmu_exit(void)
> --
> 2.47.3

Reviewed-by: Besar Wicaksono <bwicaksono@nvidia.com>




