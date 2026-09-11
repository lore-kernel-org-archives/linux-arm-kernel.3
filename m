Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61EAC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqCJxrK3tTlAXdP+zLntCStQYug6yvFda4QopLTvzB4=; b=ELJGdldX20PdwCqSAiVbcqsSO8
	qTABHViUWj7TdB0xxP69x4XyqwWnLTUg7VFg3rcdF16sVkw+VVT2QLiIGAVvTPFHS+RHPDFFDMv7t
	fNU/FCD7NCW+SZsIDJTT9vRuoJ0Lh/iC11E4wNYZeRmCzCtnkRzaaOTjSpefk6hywKTTpqZw81De6
	KxLfS+foZ2M4vtQrT57S6Xsn6QDcOV88ytjJ55wEkdHkR0kD/D2wrCMy9vD/18VASBJh+F4PWxogj
	0WxTkfmNtBt9RAftfIlyJeJrjmz4PvgKzXJ4k5knJXpvDHvVnNMf0eQ4llm/2N5+LP+d7vKX06KMt
	gifzWYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50gu-0000000Gg4h-3TWt;
	Fri, 11 Sep 2026 12:49:16 +0000
Received: from mail-westus3azon11010067.outbound.protection.outlook.com ([52.101.201.67] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50gs-0000000Gg4G-1NFQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCBxu3SxDYyGZBqNvm0c0hDLhCFrq5UfYHTnJP7W7XHTwqAINXU159rsQmK+GdxdPMjP6mJug79nleFv+/FXb1m6O/UCxlTUWXC/hRQfmCQvP6IZbG9c67rqBdBjiE7DidLw2fI7B9i6p+khCqDVxRCgdaOFGQdnM9aO2odhnouBHNqKnZKILnBK9HKQz40nWBouTFu93ner3mi6b2rvOGOTbrY33MkjI2AyUhotO+5mDLtcyV+21HzHRrvhPpD3B4uBqjW0ZanZ4mLzsNhgj6JK4+WuwxrDG5PAiirMNhhm+SNvN/bICAQ+jyM8bpAijzuf2swvP/5rldNpImphiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqCJxrK3tTlAXdP+zLntCStQYug6yvFda4QopLTvzB4=;
 b=Bsv+a3zZuBlz3NDmOzFqxRmgIiIBVPxfskIFRPfEsoeJ+UWjjCy8aHM4IdkOdfa9k8I8icBC7Guzc0GZt8yQhIGtIvM/vji/ZAIBTpoXxiOhenYEjyuQBH53JrxMbg2d/lDnjtaY+yVEBQgtxAouFcTVxJTxqaiLYXvagiAXxetsayWfv6IiI7fjquYPGTbhkLLpA8sGLDphla2PABbC+T8LwjL9V5aT7Q9YWU/l+iuRajwhwQazMZWWlauOhHiK+2UNp9oyWjScZNvafI01LihpHUCp5NbBBBDVxurIp50yQLwBZttK6OEKpCkiZiSRJfk77VroMnQccsfxpx4EXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqCJxrK3tTlAXdP+zLntCStQYug6yvFda4QopLTvzB4=;
 b=svYaCS9r1Gzi5xDK/mTyQvtbeD4dLhMfAN0yMFKNM5tKREaqeXeb2Jq35JtKr23unREv+C3Np1CCA6ydyI8mCSTWwsrpWtWp2nk4SgGi79AZvioCFMjM7K2E4phXgBzsmyN/HMXyhAr7jQjRY2nd7aadquzZDHByw1t1UcHt38LNyV/U7ubGJfBDvxsX319pD7nvMqhb+S7aFoW68MZKP+Q7WH1PrKh5gmrRnacqcPE3Ub6UADlfCrbco0zIzYmPVTX3hH8QErFCa6Yl+SCJWc6q4sY7BZJVcq1Opy/PQgR+Bu6mU/IcAZZB76P6VUn2tc/Vp96ZQbBDU4dHpBbjew==
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Fri, 11 Sep
 2026 12:49:05 +0000
Received: from SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b]) by SJ0PR12MB8614.namprd12.prod.outlook.com
 ([fe80::fe0a:6e6a:fe60:a43b%5]) with mapi id 15.21.0406.005; Fri, 11 Sep 2026
 12:49:05 +0000
From: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
To: Wentao Guan <guanwentao@uniontech.com>, "sashal@kernel.org"
	<sashal@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen
	<nicolinc@nvidia.com>
Subject: RE: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during
 devm teardown
Thread-Topic: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during
 devm teardown
Thread-Index: AQHdQPFkFkV9WGtWYEGMTOjALaeTo7bJVM/Q
Date: Fri, 11 Sep 2026 12:49:05 +0000
Message-ID: <SJ0PR12MB8614E3D83FC2F5444A197B33ABBE2@SJ0PR12MB8614.namprd12.prod.outlook.com>
References: <20260910065429.1703706-1-guanwentao@uniontech.com>
In-Reply-To: <20260910065429.1703706-1-guanwentao@uniontech.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB8614:EE_|PH7PR12MB5781:EE_
x-ms-office365-filtering-correlation-id: dfd42099-a933-48b9-3815-08df10031058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|38070700021|5023799004|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info: Z0XQCQgGcIuePR/crHIAUEbakTGaE8NU/2RAEUJ8V5lB/XGWw7wxKC6/7DGaqycxhPspNvFUWBtrS41PxNmaBd2jpf67inuM88XaEQQZ+bBEiS3SdAQ1gzMlLSS4wVSMDzlaLoAclpTjl+NgU6AZmX4jKNCoO1rqMRa1TdIzAksUXRPJUvHKo3xz4iu4XX8YJ30mmkQukWGsrt5PUEZlxqiGpzp6D5iD8KkqCIDm7wfrEusFOr2sg8CcVcjKfTLloLW3WHv1CdWb9TMNr6waSjM+SIETpV8Z85IOQn2Jx2eRPEplM8TiqqDQW752avHnX5IuGvwSabe0ck4ZYCtOn7ZPiNQ7X7oLI1ZMxuxlyf+3VdPiWkEEz+owmHPshqy4nRNCefr2Hj8MYu0Wnjlb+CzevVk0jEFb+FCTEtq6DVOErZW9+TIcA3tqFuzRewoYUh6tO19C4pXQ7tO06OCzCIjWQjrpdQeF5gbQocde1fbGJ3mLYYQ2fs7nv0QzVEpxhWT5ar5PEsc02WNgf/DIeJwFtHKe5ygCV52sZfb9vC1a9giiSjfppKofEjnyn9tbSBS9fT++1xDoXR2nprK91KLK6RnhfiG5HrgooR9G2eecYuESmZ81FNyQNSzwFOsJUReLV4TShfw+FqB+u9gUX3Zz3nyoHLp30Jg0uqMqQVFHa5BeHjvtteFSjIPg4hU0BYtjXFp3DhupGhMqPYtiEoHpCKTheM62+gUxS34KkcA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB8614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(38070700021)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07MeWEtdmEfBrRd9Qa1K3/y1SijO9WRiQL++mXnV6pU1y5ryWD8V2DWUOPLA?=
 =?us-ascii?Q?X7gKNzsk7+LgIWLtugRN0viHoWaiXeA3uW8NEgggmetZb1gHExRBfnXUgZKG?=
 =?us-ascii?Q?bD1KYSZQt9ccEARuq+sp/aAyqVvnqcZgRUxj29BtA5Ra07CS/KJHBjlEBbyl?=
 =?us-ascii?Q?3EzvD29bQKIZBT7QEC9vl+bAoQJtGivAMECLaNrh5I0lyXT7Tw7N5Ry0jkC+?=
 =?us-ascii?Q?a4pS+9RpcNJhJA6K7cZDGkprMrdpvkVyjlL1Z4x22F7ND6aN2yS241mJMG8y?=
 =?us-ascii?Q?FKtHchX9MFHXK23DbkGk6oI6CglAeVlJG3sixIgwaFH59H6aSYyD/jEKjtp6?=
 =?us-ascii?Q?b+wqEt9hjGRkJBs9WLHSXhxED8XSoMDTYiOrJiwioiv5vIy/v1KwaoMShJDL?=
 =?us-ascii?Q?dIwJ7yfBymWZwjO0TSMQhTtTa26qtgJFfuFrIjH728Nizy06q5HMZFre2ElQ?=
 =?us-ascii?Q?JllVfYfwinrYzVHx6ex/TGaXPKnSQ2juRM1ZplCBg6n4RUlAEgZL5gIPoJIv?=
 =?us-ascii?Q?9DBv+kpBOrHzOwk4Oc2TAgH7LaifotvUjlcZes0KVdxlGr0JVOF12Ibi5CX4?=
 =?us-ascii?Q?XDWxA+IS8fCth6y6yxm7YmX/Swl9Ucl1uNT36/n/LcbE85NRXm15JrtBNZ1m?=
 =?us-ascii?Q?v3mJ7J2JAYieGHKzxursMofEjy+CveAx2UVh00HO+scJ7mWnyBj4RYpWk+Wp?=
 =?us-ascii?Q?hGpTVRX4JUIhX9BEGp/7bgMDIa8aI+HvZOelBW7ZMmJFQJntByvfB1X5i401?=
 =?us-ascii?Q?OSmGrSdO4hr/tUo3n5NYTkIs5nr1pkWJVOt+YIvQSEKpzvarDZNCF1acoKpZ?=
 =?us-ascii?Q?BzxqLvY/MGVTmqjfehesFg0AYw5WQeMmaRPXA79lSQ/NmXQ84WD2ZXDMPybb?=
 =?us-ascii?Q?V9ps/o0c9SOQ2ysGhjdcsF2ffq/3ZxWhgQ9r+bYwScNYZEbLAGBJSS6oKHWG?=
 =?us-ascii?Q?Rg4sFY/0Lb1trmCP2bsono7wc4mj0fjSIlxi1sE5morTdr9X4rle3AHa//Yg?=
 =?us-ascii?Q?5CtjgzracneRU4X+pcwFxjZLHcr2AGWYkps7D/XLicZphnKTaQ17Awoedag/?=
 =?us-ascii?Q?wjuJlVqwljV/IrC4XFeZy+YVqBuvXIGaqfpWASIah6cWMGrIfGqFHvY25w+p?=
 =?us-ascii?Q?bwVldy/VP/iA8sBkI/xKnai0osdlU7TBKNokN09AeZOJ/ToTb3nNO9fk1Et5?=
 =?us-ascii?Q?3VQcMizt7ZCjqFJyuqmT8IuVROvRVg2INyMPppvke50MfohmIEXh0ZXZWxZ4?=
 =?us-ascii?Q?GuY5+LkHa1YD+qbha42fGkXoog3ig71ppSPsvj8Pyi38jeuvjxkQ+9Yv7IED?=
 =?us-ascii?Q?hhWGus2YrADRsV37kuYQU2prwL6TWqZFkCjuhvIdMZqPU2I3Niwswbi6zvVJ?=
 =?us-ascii?Q?QvPcwPRIhFkb3vdJ7ZAxX5JG3bg3DfuOZ3REC0zxb+jHxh5+uRUIPVw5AHCf?=
 =?us-ascii?Q?uwTdqQ1963baxpYzmasFsMOFecKL37JP50TZm0lSIwECqfuetRs1jc4X7xQ8?=
 =?us-ascii?Q?EP67cGEd43VIKv7WlmoFDSlB7G71cDgjzV5eCgaA2wNCiq1q3hacHbuWbhrw?=
 =?us-ascii?Q?h1IfdrX/1bwlu8/pXZftRvirWnkLK2GPZWwu/9RVGyY6JAxXfnz0CxaRk5+U?=
 =?us-ascii?Q?kQXLCUboNWBfZ+OAjfi1mSGM9OjtqrUiPynVuXQS87XRl0vrael8123NDoZ2?=
 =?us-ascii?Q?X8ZPzZkaUNrpoPMp9hWUqxG4holnDJByR5k7E6GVDzkURhq+b+en4tZ5NLk2?=
 =?us-ascii?Q?b0ancuD+8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB8614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd42099-a933-48b9-3815-08df10031058
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 12:49:05.4671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jx5S+/PshVb6l7gx/Lx/c5Ij7ZrKxUwgvYRa3rDD4SOnPJQUsrOH9wULbCpRViKEHaqMihNI1fXthSzjEL1IaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054914_374542_6EEBCD47 
X-CRM114-Status: GOOD (  19.25  )
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
> From: Wentao Guan <guanwentao@uniontech.com>
> Sent: 10 September 2026 07:54
> To: sashal@kernel.org; Jason Gunthorpe <jgg@nvidia.com>
> Cc: will@kernel.org; linux-arm-kernel@lists.infradead.org;
> iommu@lists.linux.dev; stable@vger.kernel.org; linux-kernel@vger.kernel.o=
rg;
> Nicolin Chen <nicolinc@nvidia.com>; Shameer Kolothum Thodi
> <skolothumtho@nvidia.com>; Wentao Guan <guanwentao@uniontech.com>
> Subject: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during
> devm teardown
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> The Tegra241 CMDQV teardown fix moved VINTF hardware deinitialization
> into the implementation device_disable() callback. However, its stable
> backport preceded the conversion to devm teardown and could only invoke
> the callback from the shutdown path.
>=20
> Now that arm_smmu_disable_action() manages normal teardown, invoke the
> implementation callback there while the command queue is still alive.
> This prevents the subsequent implementation remove action from releasing
> resources while the CMDQV hardware remains active.
>=20
> After ("iommu/arm-smmu-v3: Manage teardown with devm") merged in
> stable,
> now keep the shutdown path consistent with mainline, where disabling
> the base SMMU is sufficient.
>=20
> It is a fix for stable tree commit to aligned with mainline, so no
> upstream commit id here.
>=20
> Fixes: 5994617e09ee ("iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free
> on teardown")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index c993e101fab3a..ea908afb0da9d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4789,6 +4789,8 @@ static void arm_smmu_disable_action(void *data)
>  {
>         struct arm_smmu_device *smmu =3D data;
>=20
> +       if (smmu->impl_ops && smmu->impl_ops->device_disable)
> +               smmu->impl_ops->device_disable(smmu);
>         arm_smmu_device_disable(smmu);
>  }
>=20
> @@ -5621,8 +5623,6 @@ static void arm_smmu_device_shutdown(struct
> platform_device *pdev)
>  {
>         struct arm_smmu_device *smmu =3D platform_get_drvdata(pdev);
>=20
> -       if (smmu->impl_ops && smmu->impl_ops->device_disable)
> -               smmu->impl_ops->device_disable(smmu);
>         arm_smmu_device_disable(smmu);
>  }

LGTM;

Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>

Thanks,
Shameer

