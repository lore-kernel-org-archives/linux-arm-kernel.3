Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33222CD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVpIDe6JadckNZwk6VWjtoccY+4PRTht6TgQ5HAI7EY=; b=zGH33OhAdSHHb8UHfgxv4as8zP
	K3QlZpWRPVs4iFz2muIkqzpxF1xlkfz03+5/frZZHA+KZKa1l5Rgg80fh1yMcf51A3pHmWhuCdlX2
	O8WLsZxPjNC6NWVJqXXRZJQS147FE+kKgJ9Q+WsljyVaqW1KzNjRDIl8ZK5TiF5GJFSluQ2MvoZLj
	7nGOUMmOajDeXBpQP5qrIp0Mu4WMN9IGR+Q1roDgPVryDheHgABbDXHhcPydLDh7gjw9hAo2EN8k+
	iVskeDIIAjSavJXlwXCfYncNUh11/ih5Rxe1entRKGCWkTt2xGtONQXmBWs7ZI1SPbmJgEFCKNSat
	cxj9RF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUX81-0000000DrAN-345O;
	Tue, 02 Jun 2026 21:58:29 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUX7z-0000000Dr9t-1Ol1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjwFb86d9ipek4ugw9aK1OaPTX4zlTpwpgvtoSL7Six6nVjdkzKedVcLcSdqcRsi40SGOpVCaIIhfKcCwkxIK2aBL8JsOk/nfngO5MtKUYuEtBSn617YrGG0AMauoXu6OCx9+RD1zzhZT0tHpw+pNF1nGxyyBNjYcQZH3KxvBDD/l3Kf8Ta9MXohxVQC0yxMp0V4mclzRfA2nCDgSoFkRSOJeKa36C87VTloD0WGT5CSZHFuHZMEJm9XxMlBOuslQs8IIq7GnRVpPgGFzY1F+fPs3X/PHvMMRwg2vaE3YHi0wUdACWcsTk5eCP3t4wdHKkBJBkDfH8h5aKGyWf0f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVpIDe6JadckNZwk6VWjtoccY+4PRTht6TgQ5HAI7EY=;
 b=Gfv9EAlQf2L84ssMm5GgN0wTavulzkFzIkkeaHfTcxG+/HDL716kjiCrUB6tCoXI+nm7o7iZ1Ors+v+3nvikTgtkO/y0pBakJ2Eq8rDF059/Qn/1JzsnoQANbtHTcS54DdzzF0QbZJYNQM08y4/ROKxD8n+axRaOEcsEwE6AjB7jgqNXcEUii+JApiyGMLXikRnJgLq1rA4gLnkFmMdJ0x/XVjM3kR2t3kAH1DZohcSei9OSzi2kNVFdzBoHYPlwIMlOFb9tP7vpakTY9l6Vn/e4e4qIqzvVV0mpfjMuQkiUH4sIsVqCj5P6vSo4a0SjQ09gksddUlZ4UBEQz327nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVpIDe6JadckNZwk6VWjtoccY+4PRTht6TgQ5HAI7EY=;
 b=EgWT/bwarxZBkURNVq8UpdtsJ5ofAbh5yY+XaL8C4dr6TfigWzujrw3IXsupxkbh0XKkpn6oT5f3vuLijowzyomJwLusX48/qdIVLrYcC4i+7SeulcbLzsMLGoF7i4W+q88q5fobbgFRzHIeAETYqtDttVVKhl1fV0jlj8/FDE/b+9bXPs3gs8+ie80/cOnZI9WO0k5DJWLz0U3PWqsXyLeR9oMFYvVXCUCEn4k3quVVjfU5ENM+45mZGjGsKfZC2z4sHFlQF6oVZo9mU9Uvxe7DBYhoj2mxJs7Mvk5iXVvRXRmzdPW/3FFpUd12ONw2YX7B+0nRQ8+9ROFGzDhjqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 21:58:20 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 21:58:20 +0000
Date: Tue, 2 Jun 2026 21:58:18 +0000
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Message-ID: <ah9R-ptksir3eKlm@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
 <20260602-grateful-elfish-elk-413154@sudeepholla>
 <ah8A05Mt9W1yZjFW@omni-lfn-logwh>
 <20260602-accomplished-illegal-mole-ef2acc@sudeepholla>
 <ah8NazZm0Txf6K7a@omni-lfn-logwh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8NazZm0Txf6K7a@omni-lfn-logwh>
X-ClientProxiedBy: CY5PR15CA0136.namprd15.prod.outlook.com
 (2603:10b6:930:68::24) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc286a8-fc2d-4aa0-0d67-08dec0f20f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|4143699003|11063799006|18002099003|5023799004|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9lcHJKbqDycB2lNZmDKBXeQDUjTZFOKOM+Xe6x9cFg0RtZGGq/30n3ORI5y2RxMi3Fyh1UmHQfT6K+c4/sCEYJ9kPdyJ8WzZfE1Jw69aYCf74Z5qG8+T4+53HZdgYPjoNY8FP0j2tvlcxTsdUcWqpSdZsZX1fGsbdqDrwAn0Uawd9mvHy7TA2xU+caGr/JzOpOWhSTj6x8G8IF6v0sPXAoMo7c+Y1kRoZPLSs4pRdRYVcW4Km42Efzphg/xWYoENuVnosdKC3JPPwa5CqgtAOIsBw5nr0ukJVWdxYi9UxyEK/2niNAc7qiqeWmFJXK0dU0QnSaca0ek/gghlDWjw3mWIt1FhTPKod8181L46YPK4nQUknOFM5BATR5gBxYwLO/VZ6IJYcrcsdRVFCXyeUO2ADfEJTGlN/KJZG5ElTa90fS4/zyj68awBVQkWNxGXhXGReY+K5wp/S98iDg7tq43jcBNorkju/sFSVwOMqWQwZVKxZAdPw7czvFO10wqulYx4DHcfN2hEaZ82wEvDTBAoI9Vh8ZUimSjKCbKJk+2eI1mbdQxhYomORgtmpG+10liwz4QHDhix4XfN+S/S4mql8VqYlZa0LDUoxV6EaTCT4AmhZVikGXKvbVQQTmn8sQY8fMuCsd6JjziWppOoebziXFjku58d6BDhc+zAH/69BW5MrTeztI197xTn+MrF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(5023799004)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NoFfXScRRz4VqasDH5hSkflAr6YNX+76J0HxaDXKl8vLDZjmisEeTZCtkxx5?=
 =?us-ascii?Q?k6CVBWSAuJ6euBvZGrGeykKg1t9iQCOW+14eVK570U3qdUVUxkNx6GP6E2/J?=
 =?us-ascii?Q?dM8NPOh5NNJmpcMNvDE+ObodwMYoDrlgY51CuwxBejW0MQf5SI/bubf3Kfkv?=
 =?us-ascii?Q?WFARpXqQTMe/B3WSKNEQbQWct34NDpUE4d1y/Ex8MyJmJcmwqNjeXIXBAMdL?=
 =?us-ascii?Q?9Do0BAN1IVpBHJgWv4qwSafQ+TppR0Sxgjj9BNeo2xvRgaxmrLEfOUz7w9jm?=
 =?us-ascii?Q?vmMjfIbawNFbXswOOzHekXv9l0zRWz2zUdWmg+LvaqY+A/hgms3l/TOtxvJv?=
 =?us-ascii?Q?cCcQV0Zbhvo6SqDH7doMUA0RVf2tLKFN04njdSxpkOhkCgLRSl31mzq3Bpi4?=
 =?us-ascii?Q?MBC4CJNQJiwjpYM0b77JxsEusRSzBCpx4FItrR81J9T24kGfmcYNYo2xSH8z?=
 =?us-ascii?Q?djeDtMurKFTil5snv6kTFWtlVnImeHJLPxEAiCeq4Dn7UOKg+U6ES0wZzKfO?=
 =?us-ascii?Q?7Xndc1jGzmKcI3uRHCUd6HZlXGWyNZ0b69p6jZl3ojAllbuivPa87EtWsQ26?=
 =?us-ascii?Q?u5fYxxdGfzElaPP2XbbgiqUYaK8/8SKpoYa/wybGwKx/6BCPX7dbia73w2Xi?=
 =?us-ascii?Q?b1zeUoavqrJ8Ybbi8aBHlisib516jfr9bpiz8E2eOZGQLL2o2qWOT3aPRLM8?=
 =?us-ascii?Q?hCw39pwDVdl0oPkIREb5QCcFib8fZJsMShBlpAklf6DxRezn/dH3bPyn4W7r?=
 =?us-ascii?Q?4r9MaKtD+PwofYkOdt9SQBqDSr94KHueC4K5DxMe/EKd00/MMBibnN5pVyKg?=
 =?us-ascii?Q?bj81BCwTK/72d5ExtD6m+hwGxioKZiZ5z5kO20bp6eIye9EqxtTnMWiHA9Sq?=
 =?us-ascii?Q?b/foOXp+fu92U8FN0nRXF7pJ0cBUA6bUodwue3vLRV5JJAoleMHnYXteYxFZ?=
 =?us-ascii?Q?U3xpBwZTnlI8ICnc5BGJFCr848Pzhg7NkkgvXkYJf02iPMmROYwyqZwY7BA8?=
 =?us-ascii?Q?VyT4s0CurtElxarLcR1TtQt81Md4bZx4qFfXw7oaoyjPpsV21W924g1rU1Qw?=
 =?us-ascii?Q?2dTVaRfbpAnTed0Wco04wx3Z4OXFJd6MO8xjUaNNPxq0pZ0DSTyY7IWrWJAV?=
 =?us-ascii?Q?6kM4g55eQZBpaq8859123b099aIa6gpKKHs3EeH8ZLw7O06OJZDQb6oVf5dC?=
 =?us-ascii?Q?YT+gBCYmfg3gn17I45oHuyXZgtaFmJevaT0cjsEFFx20sO0N84cubOr7Lyha?=
 =?us-ascii?Q?b3aqbwCTW0/Xm+yFnr72ZSeAJCP1xbjvfTQyS/aevFEcgl3nv4LfOGQ/SOZb?=
 =?us-ascii?Q?n5RE8Yn/hrzK3RjaOcRRhzIiyfrYkT4fLm6NsnvuZ1ZUGL8Yle2qIl+Dm0ol?=
 =?us-ascii?Q?RJXNkoAT3nEYjIF/Yzqxb9+q2JDhsXH1InZb5usZzTxaegN+ONekZrdNoKby?=
 =?us-ascii?Q?2Zw6X1iZVpT/KbfPceh8NPsSCRZ2XGC/vg45oxIebYH0VXOaZulEQHYX8tk4?=
 =?us-ascii?Q?CWKp9jnFp+bNtbwU2ay6vx9Qupk1Ts/nEmjkJdQBV6qmIt4qCuRnFovuOpgo?=
 =?us-ascii?Q?JNvsgzvAXLzPhQBVpJyKp8BxtMLPqbE8Rn2D4pUYcAquAMrosFN/kiYVM0VX?=
 =?us-ascii?Q?UEAhuQowIFMEAYE22KKK17GSJAlLrMaEOMtdDxuNYT6jb81tK/ZT89kKewme?=
 =?us-ascii?Q?cdsfC7Ct8h0Hp45hbsFPi3aRYdjXt7KdrDp+Ff27Ogw3urtrfAx8XXXixV6Q?=
 =?us-ascii?Q?2nZpLhSgEA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc286a8-fc2d-4aa0-0d67-08dec0f20f1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 21:58:20.2323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQlvWULE0hhXQJ9x/jxVzKEnFw5j4oYShJEjbMb8vttdZMiO/qjsSc6UIRZoq/ctZehH7oBTMBgjCTZy3gPfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_145827_380923_230E95FF 
X-CRM114-Status: GOOD (  39.49  )
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

On Tue, Jun 02, 2026 at 12:05:47PM -0500, Seth Forshee wrote:
> On Tue, Jun 02, 2026 at 05:27:48PM +0100, Sudeep Holla wrote:
> > On Tue, Jun 02, 2026 at 11:12:03AM -0500, Seth Forshee wrote:
> > > On Tue, Jun 02, 2026 at 04:56:48PM +0100, Sudeep Holla wrote:
> > > > On Mon, Jun 01, 2026 at 03:45:11PM -0500, Seth Forshee wrote:
> > > > > FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
> > > > > size is not checked when page-aligning the RX/TX buffer size, and
> > > > > FFA_RXTX_MAP may fail when passed a size greater than the maximum.
> > > > > 
> > > > > Decode the maximum buffer size returned from FFA_FEATURES and limit the
> > > > > buffer size based on this value if it is non-zero (zero indicates no
> > > > > maximum). Include verification that the max returned by the SPMC is
> > > > > larger than the minimum, otherwise use the minimum.
> > > > > 
> > > > > While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> > > > > consistency.
> > > > > 
> > > > > Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> > > > > Assisted-by: Claude:claude-opus-4-8
> > > > > Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> > > > > ---
> > > > >  drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
> > > > >  1 file changed, 27 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > > > > index b9f17fda7243..dc45724a29ba 100644
> > > > > --- a/drivers/firmware/arm_ffa/driver.c
> > > > > +++ b/drivers/firmware/arm_ffa/driver.c
> > > > > @@ -32,6 +32,7 @@
> > > > >  #include <linux/interrupt.h>
> > > > >  #include <linux/io.h>
> > > > >  #include <linux/kernel.h>
> > > > > +#include <linux/minmax.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/mm.h>
> > > > >  #include <linux/mutex.h>
> > > > > @@ -55,7 +56,9 @@
> > > > >  	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
> > > > >  
> > > > >  #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
> > > > > -#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> > > > > +#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
> > > > > +#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> > > > > +#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
> > > > >  
> > > > >  #define FFA_MAX_NOTIFICATIONS		64
> > > > >  
> > > > > @@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
> > > > >  	ffa_notifications_cleanup();
> > > > >  }
> > > > >  
> > > > > +#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
> > > > > +
> > > > >  static int __init ffa_init(void)
> > > > >  {
> > > > >  	int ret;
> > > > >  	u32 buf_sz;
> > > > > -	size_t rxtx_bufsz = SZ_4K;
> > > > > +	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
> > > > >  
> > > > >  	ret = ffa_transport_init(&invoke_ffa_fn);
> > > > >  	if (ret)
> > > > > @@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
> > > > >  			rxtx_bufsz = SZ_16K;
> > > > >  		else
> > > > >  			rxtx_bufsz = SZ_4K;
> > > > > +
> > > > > +		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
> > > > 
> > > > This is not even compile tested ? I don't think this is defined anyway.
> > > > Anyways I don't think we need this condition as v1.1 or below had it
> > > > MBZ, so it is fine to drop it.
> > > 
> > > It is added just above ffa_init(). The code as been compile and run
> > > tested on multiple platforms, as noted in the cover letter.
> > > 
> > 
> > Ah sorry, my bad. It failed to apply and I must have messed it up.
> > I have some changes in linux-next which conflicts and I dropped it when
> > resolving. Sorry for that.
> > 
> > > I hadn't checked older spec versions, so if they have it as MBZ then I
> > > agree we can drop the check.
> > > 
> > > > 
> > > > > +			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
> > > > 
> > > > The cast is unnecessary, its is 16 bit, so max 0xFFFF << 12.
> > > 
> > > Correct, though linters complain about it which is why I added it. I can
> > > drop it though if you prefer.
> > > 
> > 
> > Can you be more specific ? Any way to trigger it ?
> 
> I've been trying out various tools for reviwing/analyzing patches, so I
> don't remember now which one(s) complained about this. But I'll run the
> patches back through them after I make the updates you've requested and
> let you know.

Nothing flagged it this time, but I'm sure I only added it originally
after a tool flagged it. However it got there, it's removed in v2.

Seth

