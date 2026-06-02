Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A8BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auz3AlezDJS0L3kUl71lr84Hi0E5LE3/x1Vnv+blXtg=; b=ZWkKqwTmG5n+sTEZMoZfPdRd+D
	z92WEvG8RwiTc1cTnoTXIlBm2mS9R3X39sv5qXcnWbEczpFkpT+aQa53jI/S8aHpTiI+Xe9ELqsy8
	zqbSoGgk6Fn65YzM/tCmmLdalmFOjKlwxLRqcf61DPlPNFSTu+nDYSGgK2UTm9hzUvwV0CnUFR7LV
	cgwaUbO+78GXohlgNo9pG/GZRMgjMuyikN/R0NyiVYSSKFJAf158n0yXxNq/5c95gaHOTJjCg1tJH
	1k6X+PBhH51z3NZgjE+TTdwVnJLDplAUn5MBcN0qOWA5USJMT3PisJpH2fTQEUDFC/UzsaEmEq667
	/4jjgWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSYx-0000000DXWV-39NX;
	Tue, 02 Jun 2026 17:05:59 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSYv-0000000DXVd-0nNq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDkmOnd3Fh49DEUOFRXaW/wTo+muY7GZEoZQwN00bifzV7Uq9+oezEMvVDQPnVGfBePM1966jDSrMiabQ1L7TCBn8iVtGFUNmvM4io/2FZOHaWYw4YYYIFz9Hwe/xwy2fNW+99TXpTOSqQyJuiIDpKFDLr2od+Wo4AwbUyg+tePgDpR0tXWk259Eml1xCp2bxGm7/7RbPUQ0FgSIjvwgsiwnqvAjYSOazVpmTINrwnyDCEonYSWt0NskIWVTrMgSimu0Lc805nyl3BjNbZlROtFnEpoWBnhcyyQbWaoxTGpKHD1gJZxGKXk6hB9vSUNC1CoX6gez2lwTffwgFP4G+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auz3AlezDJS0L3kUl71lr84Hi0E5LE3/x1Vnv+blXtg=;
 b=RK/i86gIwqeNh0gyBhJj+ZuENqsqCdksJF9l4p6zZ7y4JSCiX6oD/Kf+9zf7IMLVhpYafGZ/1YYpuNr5omc/YLPExII5dmr6TP/Lby8+mGLu7YYwcOrSrgtA9CPkrrTvt6Qp/ZXUGHMlhggZ7N1ZEZzBX5d7pwOU6MPXnSlVBtzYWPH9pHjI7b7ZYfPDDUw5Or+VDrfWBJHaKQwKI3Me30dSrZYVcHveYnuKMH39gXUCSqNLu5KQDNdoQo3VwGoyKVn1koYHHYj7dIVOyUr7ABkrt9K2XFZVOFP2cFHozztHZ5aEl83M9mMBoI3BEI1Kxi4JmVC84MtZHp7kSP9viQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auz3AlezDJS0L3kUl71lr84Hi0E5LE3/x1Vnv+blXtg=;
 b=Cv02swpeTCKq8CJb2TB4cE6pYM/tGxRSmaXP8qXGHmo+uDYjZvoLL8bbWvvmmsiVQUVxCeiSqrGoijTKJ+lNakyYTetrtum1yAtPki8tZu72N3Sx/G/YFzrmBvqrOO7alnI5Mb1wtr55oT2IJ8+ZAPqD/GWS15Phfdks/VAED28hmuZyR5dB+9IWiASBk3IpBcXi8Oc/BWEiU9PKcZX7/uSF5/fEcvdaDf27i1bJhDn/FbU7AXxVA5g1A8IR+OC9sx7EXTHdsR6RErgf3ZmputBWTyWjuihIA8FmP28247F6JmT9KDio/b9fuA+B/oCF4SDOkfzcZUIkRjDxCUHBKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 17:05:49 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 17:05:49 +0000
Date: Tue, 2 Jun 2026 12:05:47 -0500
From: Seth Forshee <sforshee@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Honor maximum RX/TX buffer size
Message-ID: <ah8NazZm0Txf6K7a@omni-lfn-logwh>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-1-c071b12ae05c@nvidia.com>
 <20260602-grateful-elfish-elk-413154@sudeepholla>
 <ah8A05Mt9W1yZjFW@omni-lfn-logwh>
 <20260602-accomplished-illegal-mole-ef2acc@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-accomplished-illegal-mole-ef2acc@sudeepholla>
X-ClientProxiedBy: MW4PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:303:b8::11) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6c2ba3-9b9d-4d4d-ee0c-08dec0c931a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 9EpFaTZQlwMuENze5FQJUiClwQkMi1t4Ai+fVWs6a5Ir8v8R2ouEp+3tgoTiZAl21gZPxzazbU7QSEGVyutiSTDGVCYcJny/U+66BDP2Bxz89vCWPL2bRj/3Djy0xUEsgTTkK6jWO7pit6QCuY1DqUPbraX2OA5lCSe1iNMDqYlK0IxI5m4rp7mNmAskn/InsufnW203jUi8Kc0Ak5Flv0eO86jCKmBGmU0nvDS9+JMydMdgwuknSuFwhQKffwnnSYBq88FjMSP45hfolUYVNIEaxD6KAZfQYU1uXEeyndvd97b17iyU5w8yCus17PP1tO7VLOsrU0N3fytHOXKill38k011qNDVhzViihpxOiwedGy6I4+Iib0m0GzO7D07ozi45JgaKJUZgEiYwSKGNSgIeezg0vjnuQY5ngXlubtsWkDU5XlbYwCHhfLxAMpzI3uNSVQTFqxfoiccayijgpixgKJduYwS/i7c/+9t9JQ81ZsYSFbnc53P69kUZN3CdIY2qWYaqi8z9EE/15Er08SKQWhb3Z2KNInX4ceEdjlYBqXT0gITNGbhF8ued0k+IX0vgL/66opWqpHXSlgMAxZRdGv3wlqLvEhOqbbieIOWomTxGCFb4OUdDDjWOTBrfbzIPRrIQwUwNgvcCEU/oQpXe3mAXSAIG5Fss7OoHm+4yitQ/fVt3j4RP6wYdrV3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CV0l2ODWAxQ4SD4/ceZ9mrfao6HVeIvj4irHFL46GD//BR2pySHOSJMBDBZx?=
 =?us-ascii?Q?nuqxEzYQfuhRl8k+cUd+EYV9U9ivygVPeEBiJ+J03kPJZnuhu47MWSvHmPGW?=
 =?us-ascii?Q?Dwoea+qHTXwoVD2R1mJCEg6sEX6AnKltY8QN1x6QV715cxp5Jq3Lf8WEhYEm?=
 =?us-ascii?Q?z1LzxiSwyoWSKzVAjOLvb/kWwDuhWc7cGVF/DM44P6aU+QYHVdXiwuIxPyeQ?=
 =?us-ascii?Q?0ZiKyRGAs9Pz3jLdl+NWLOlZvoNO1kxdZAec92NdK3rO0YB351f1JNMmjrBL?=
 =?us-ascii?Q?1urwJWX4/yLTcMCP7Kqc+Ds4ttTO1OXqkxA3HOrQvv0tii7ZtVCwrI7qoEoy?=
 =?us-ascii?Q?qv/p49KoPkFM2k1JhWsMjqISIqjmWyrkh73hEvSEwVvDRgaO4V9M6ePFEvG+?=
 =?us-ascii?Q?HD+izT5fqlfRqjJZSAFrJ+LIk8d9556kvSeF1PvP1ea0K23cJte+tYKKD6LH?=
 =?us-ascii?Q?ztSu7bviI1FS8D89KroEk7yWzRR6XnaqCVqb3rPxHWv46e5jp43PpH75yyfw?=
 =?us-ascii?Q?wLLtK1lhN9LOw/nXYid/jd1YRNZaKMmxcTeCaqRKWG/fKnNu11Ug+6IK3JRh?=
 =?us-ascii?Q?zQnjTpEqJxwmJP0lICxwZicAQMZMZ/Oo7E2N0rPEgNGA9Em+e0yIdAWvSChW?=
 =?us-ascii?Q?E7QkwpBcdxub0e7eO+UAj7ECR3VYSoVxG0cLtIcYQ6A6O5lTK3LD3R8iJUW0?=
 =?us-ascii?Q?GDxy30KSjynlCwD5VsC3iCzI1N+kjlyBrBLH38k0mHUtUSvW6+k7x80qCNwT?=
 =?us-ascii?Q?kaaEj9eArT8oYD1gZBTVHl3awLlhaiO0RYSeRAr1rUT5CjB/MkTGeZ+X56ju?=
 =?us-ascii?Q?Iv+4LmW+L7whU4V0qgIu9Kkn5/6m0+Q3NmLRA+zg/PsRQddTddw4ky4Uw5dp?=
 =?us-ascii?Q?3bJTOoykFo5sd2XfZeVa/FdxsMHNyvZvWqbhLJJmC8XoB9VnBola48LGjQgP?=
 =?us-ascii?Q?357B6FwgvqnLx8YuzeuHMWiCuwVOItDC8JuKRD1kmJh1rwqCvA85KP5mbY+x?=
 =?us-ascii?Q?M9zF6r8jQeHuU3Fack+QZ+DobL3uDqXzWhUv6mPT8CEAK70vZOV3swtWgPUg?=
 =?us-ascii?Q?MZNXIkYyAw4Lt8uuStMGHhddxN6nJimg2DD71CdtFlbnhlpI8nsk7afk5chc?=
 =?us-ascii?Q?opz2pkc++muhNj0Ze4M4TQnVFIfRGWH5MItY1pB1mshswuNTLaPoxFZ9l6Op?=
 =?us-ascii?Q?NW8YJL+rGpdDPA5vhcK5PPORqEleNT+Ftok0SZ1Jf8p8LdnjAuFuq9dhGYB1?=
 =?us-ascii?Q?mzYIF6O8xDbahPU8Ja/nhK5M1OnA/cWe4H6KXoNriEGSHczb5B0AZshD3iBi?=
 =?us-ascii?Q?zbUtk56m/7E+eoZAS1NHB55LtvLFSMBpRHqkp5vP07wiK6tdezp3NHN+FmBR?=
 =?us-ascii?Q?9SruOn+wLHtNqDcnIub3/rRigPfXzO8SY1pDhbbM7GeHbYIdkEOhbzSMWorc?=
 =?us-ascii?Q?HBXRnSm4XdN4Ml5NC1zUEs4reg7oRSZNGV1bNPPO1fpdKwDZsIIu2tTm+Anu?=
 =?us-ascii?Q?iqMkpWB2l4NB0hKUJU7F/veCBobrn1imN+UHtui0RfufWGb6E2c+Fbnq5SH2?=
 =?us-ascii?Q?YtzU9PDuwF3pw+NxLlatjpV38UyqyKy4P9xquZJJZHMnPdmaoQU0jZi1BYiE?=
 =?us-ascii?Q?0bmC5t+M08QWrVf5mKAcWmY/K6BlBQTG5AQWAe8hw1+RD2mSi18VjyYCqElj?=
 =?us-ascii?Q?pkQo0wg+3yBHbdFpNbcSB0tUy8qhpnEtZdvkCfizYf2C979kM9RB4n3/MyGp?=
 =?us-ascii?Q?/Uoc+Jg1RA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c2ba3-9b9d-4d4d-ee0c-08dec0c931a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:05:48.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gsg9QowrnfW2rJEDoDUEvoQ/6L/SWKZe9qczrX/XG5+RBLPFBQa8/2hu3DBsHqBXM5PakL5b7nnEEa5MRkKCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100557_234222_01225441 
X-CRM114-Status: GOOD (  37.15  )
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

On Tue, Jun 02, 2026 at 05:27:48PM +0100, Sudeep Holla wrote:
> On Tue, Jun 02, 2026 at 11:12:03AM -0500, Seth Forshee wrote:
> > On Tue, Jun 02, 2026 at 04:56:48PM +0100, Sudeep Holla wrote:
> > > On Mon, Jun 01, 2026 at 03:45:11PM -0500, Seth Forshee wrote:
> > > > FFA_FEATURES in v1.2+ supports a maximum RXTX_MAP size. This maximum
> > > > size is not checked when page-aligning the RX/TX buffer size, and
> > > > FFA_RXTX_MAP may fail when passed a size greater than the maximum.
> > > > 
> > > > Decode the maximum buffer size returned from FFA_FEATURES and limit the
> > > > buffer size based on this value if it is non-zero (zero indicates no
> > > > maximum). Include verification that the max returned by the SPMC is
> > > > larger than the minimum, otherwise use the minimum.
> > > > 
> > > > While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
> > > > consistency.
> > > > 
> > > > Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
> > > > Assisted-by: Claude:claude-opus-4-8
> > > > Signed-off-by: Seth Forshee <sforshee@nvidia.com>
> > > > ---
> > > >  drivers/firmware/arm_ffa/driver.c | 29 +++++++++++++++++++++++++++--
> > > >  1 file changed, 27 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > > > index b9f17fda7243..dc45724a29ba 100644
> > > > --- a/drivers/firmware/arm_ffa/driver.c
> > > > +++ b/drivers/firmware/arm_ffa/driver.c
> > > > @@ -32,6 +32,7 @@
> > > >  #include <linux/interrupt.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/kernel.h>
> > > > +#include <linux/minmax.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/mm.h>
> > > >  #include <linux/mutex.h>
> > > > @@ -55,7 +56,9 @@
> > > >  	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
> > > >  
> > > >  #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
> > > > -#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
> > > > +#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
> > > > +#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
> > > > +#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
> > > >  
> > > >  #define FFA_MAX_NOTIFICATIONS		64
> > > >  
> > > > @@ -2086,11 +2089,13 @@ static void ffa_notifications_setup(void)
> > > >  	ffa_notifications_cleanup();
> > > >  }
> > > >  
> > > > +#define FFA_SUPPORTS_RXTX_MAX_BUFSZ(version)	((version) > FFA_VERSION_1_1)
> > > > +
> > > >  static int __init ffa_init(void)
> > > >  {
> > > >  	int ret;
> > > >  	u32 buf_sz;
> > > > -	size_t rxtx_bufsz = SZ_4K;
> > > > +	size_t rxtx_bufsz = SZ_4K, rxtx_max_bufsz = 0;
> > > >  
> > > >  	ret = ffa_transport_init(&invoke_ffa_fn);
> > > >  	if (ret)
> > > > @@ -2118,9 +2123,29 @@ static int __init ffa_init(void)
> > > >  			rxtx_bufsz = SZ_16K;
> > > >  		else
> > > >  			rxtx_bufsz = SZ_4K;
> > > > +
> > > > +		if (FFA_SUPPORTS_RXTX_MAX_BUFSZ(drv_info->version)) {
> > > 
> > > This is not even compile tested ? I don't think this is defined anyway.
> > > Anyways I don't think we need this condition as v1.1 or below had it
> > > MBZ, so it is fine to drop it.
> > 
> > It is added just above ffa_init(). The code as been compile and run
> > tested on multiple platforms, as noted in the cover letter.
> > 
> 
> Ah sorry, my bad. It failed to apply and I must have messed it up.
> I have some changes in linux-next which conflicts and I dropped it when
> resolving. Sorry for that.
> 
> > I hadn't checked older spec versions, so if they have it as MBZ then I
> > agree we can drop the check.
> > 
> > > 
> > > > +			rxtx_max_bufsz = (size_t)RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
> > > 
> > > The cast is unnecessary, its is 16 bit, so max 0xFFFF << 12.
> > 
> > Correct, though linters complain about it which is why I added it. I can
> > drop it though if you prefer.
> > 
> 
> Can you be more specific ? Any way to trigger it ?

I've been trying out various tools for reviwing/analyzing patches, so I
don't remember now which one(s) complained about this. But I'll run the
patches back through them after I make the updates you've requested and
let you know.

Seth

