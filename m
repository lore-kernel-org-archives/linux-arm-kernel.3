Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE01E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 01:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiodhvZbaK4WZ11DrA/PEmHwBRisZUaQdNJx4kBuVPU=; b=N+Lm3erQVlmrKsOUQb2ksw5qbY
	pgEXJYIxpZLV1TrddcZFfmRx/8KsQ6qltzoeDX3YwKxegeMBxMz14oIChAGJzCyohjfHuonScy3Py
	MER6XY/ZvT5rRhg5gS8Jg6VkgA6snTnkzyGkOcTLVVTVf8BbmVKMl2PKq/gPnDDyzSCCxgaY1XLBC
	3AgIB5M5j9R1hUc3mGHZYqIbvN7X4vkEPgaOtVO5pHLIYNiJgF+yZfNE5zJHUtno1uC7Yn/7M9a6Z
	q85khTortLyNJM/FbmwJkoYPWHciwgjQMIYUboA5IHn65P8FnbSr3scMpxJNfwIy45YzIN3CIY61s
	IakIHxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyji-0000000399O-0uQr;
	Tue, 07 Jan 2025 01:50:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyiT-00000003934-0Non
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 01:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD65GcRIm2512Sp09+xb0qxadgbkp6W65gyH7WwGBcMl3KQIKSV34hQQhvpjVJ914Bi2D7W1NXqvgN9/1Km5eJKNIOcipGEc5or6qYcNqr520WTpOJHpAy/ErEydwTAOPOYIYLKKLYGz6hCn7onlsFE6/CnSGLWwux4YJoChopdeQxOPqKziuoB6ZCSN2MQX1Ha4Yzx0fEWQ5bM3LTP0h3ha4lY0JJYDO9frm73Iy0mqtJr8AREvAyJXgxO6ti7q8pCS+f7y/TpOa8o1UVUmpMa7yB8nfurCElVr9uHBs9C95FaJvgoM+UfRCDy145ETkOd88jRAivaz02C+rZUyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiodhvZbaK4WZ11DrA/PEmHwBRisZUaQdNJx4kBuVPU=;
 b=Jat4JVG/FRUEyoV0lEzQCpqTryZfuxp2T6iQ/dOiiEZvQFFjTbROCBJJz6EAqKE6B531Avuwt/xvyTsUJ3bczGRALsYBJYV2BXDXoQvTqzTeUaTTKrWpdTz++4CbJPgWtt4+zIvNcBzVN6DO35YD6CW72GhUwloaVBPaHxvKqrgxWT7HTMJXmbU5dEZM3UwhTWP+HamiQyg9xBlG7a/HLXcL4uGWOhQOWMn8znWo3C9A8Pz38iLR0Ok0MaYGbFdawFqKKwmwDRHAqVOFJFmx4BMBZeCBSGPVF2IolzjUuRUVA42h/dFdBE8qTiZcOQNj2e0HPN8hd5PYT0uJ5z04FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiodhvZbaK4WZ11DrA/PEmHwBRisZUaQdNJx4kBuVPU=;
 b=j4NHl5026tWX2K0siyhJNJntqvfswROZKWJiLYdqaJG/v3Pl6Yxr4yb78DRupmlHf4+EFr+yK/Ngm4gZ0tbREw0tcVc3RaEc5h9wGnmMEanlXVB4Ql8B7P8Ae4mkiLI3YwGRvkHUc3+l5DJ5KvyTUwFcv5x0f2IBfT3qStG19F9wk6nJJ2AcZSzSDqE3VaXp8ZJA+dmZ3Cl//oJkoP+2ifq8j+w9UPOjgrtUxFQoBHm8CjfIIB+hCshsazGDZwS257BXl+0qP7DsCSvYSVFQleZg7qoCwL+9w7Me3R1ZQQKcgEtwzdq4SCsmTABhDh+OL7Gw7KFoyS12r8z1FnWMZQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 01:49:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 01:49:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [RFC] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Thread-Topic: [RFC] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Thread-Index: AQHbYAhZZ5ahNneqjkC0am8GhShmhbMJ2deAgACx7qA=
Date: Tue, 7 Jan 2025 01:49:04 +0000
Message-ID: <PAXPR04MB84591748D80473930E1E450488112@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250106065724.3674510-1-peng.fan@oss.nxp.com>
 <094fc69e-a7b3-41bc-b5a7-cdc8a8deeef2@stanley.mountain>
In-Reply-To: <094fc69e-a7b3-41bc-b5a7-cdc8a8deeef2@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBAPR04MB7397:EE_
x-ms-office365-filtering-correlation-id: fb8b267a-0153-42f8-443c-08dd2ebd77aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kMoGYxZbpAVxM0ku2SZARjG4mLy1sowPJpahmlRZqp17B452tddOuOhvclcS?=
 =?us-ascii?Q?XEtz7g9dODyyD+fKdoDzAMi25JSsA5COFRoMFWmuMeJ2OpGhSF3h4sAVG8pF?=
 =?us-ascii?Q?zSHuE4Pw+L1vcLk6rKrjwi0c6sAfTSsuG1wtUu2ON07xj7tcj1ywkjvP/RgK?=
 =?us-ascii?Q?vpZD9UojSuIQrdru8e6x3u543A2BjyW7ufoMuUAirmYSNSa71POYJG05vUFy?=
 =?us-ascii?Q?Nknr+okLw17WiU70PA1PZPnO8PSO9umlPwJhMTdVP0h7r34UU/ktUrvbIq7j?=
 =?us-ascii?Q?juZv1JDwyTheunMlD70XXD3zfh3aUaRM0+T+DQfuSYB+taaKeFi21SN+nX13?=
 =?us-ascii?Q?VEN+bSpyF3UMv4u9pevlz7m1zotPp7k1+jpKocWD6F24S+GTOi/t6Dj2ihus?=
 =?us-ascii?Q?7X/SZlXI0njSS2BOSXQhSXhoFPxiupIUweXsgXPBT17LaQd7i3Vw0/F5RFg6?=
 =?us-ascii?Q?UdUGQZIYZJfrd190+8f+Vp+/iXsTPnReVafppVq6dMrWhHNERDdfdj+nWx7X?=
 =?us-ascii?Q?05nqjrcEZvtzRVAC3THQ2Z4rBkoSjjMC5YaLOKAj3c5adIfXlFyU5YuAI3hT?=
 =?us-ascii?Q?Caop7ZGED87QHqXNQNIpjl8oi9YW98Z74KTIcVoGKJPqV8+WLUEpOwNIN8Gm?=
 =?us-ascii?Q?f7gqR39JrKoLzWs+0dwLmxfNDcaBgveKXjS6DT3i0U0sdGfkQWA8dfac30si?=
 =?us-ascii?Q?ec3avDp2u6sBJ0eVuRaEI+uNsDZ4INRN57g5Cmm62JiIQmYTsbO4/OhwvAHE?=
 =?us-ascii?Q?nj36P1ycUkSjFlGUUEFQT5Eu7m7fP7NOP+kcHuwEmX9lT/qdv8coTTkSl/3I?=
 =?us-ascii?Q?BAXthB7Fgl/+X3wwZpCNHPP0+dzfZp97GH6AJLFqSrblvpLT/YNDM61BoDe5?=
 =?us-ascii?Q?MyOZw+dlLOe7zCQMto8f2M/9LB8/e95abg4FR+QOhV3aEZ/SlfHmDp1x5nYv?=
 =?us-ascii?Q?IBULnXFoVl9WRUfnP3+Bj9sanbmJ+nSz3sWNU3whSMUOfWn5pRdN3/J9iXlG?=
 =?us-ascii?Q?cCTKDDzovi8/NQp4rOjMi/T/NxuuY97CegvicNNoOwTWqc9w8gjyh5vQxr8F?=
 =?us-ascii?Q?qWlaICu5l0oHvqY+tXuXWNq/aQygH/7JfYxhE2kIHGcJmmAi9rnjmO24JrIM?=
 =?us-ascii?Q?jZwf6i07GjdFaHZVblUIv5wTD+u12BK6PzbCrcJAxgKSDvVl9TNzBVBT1ur8?=
 =?us-ascii?Q?K10jHrVxRYuwXXa8o6P0F7wZ/eukZrN3cZ5R7hvnRSCPedEV2SQawNIao/LU?=
 =?us-ascii?Q?U3ke2urdEM0pjSMi2R+tj5sG19nzS1pohdJp0sWfsYe6bLdWWRf0kDZ01NlW?=
 =?us-ascii?Q?oFQp3PGGJN5nWfqzxmB1iqmTY6Wi/TjPuCYcYIf5VBN365SVADJ4+ciFHjnt?=
 =?us-ascii?Q?CBN2qdXX6zeIAR4E7Y1rqp+k7GZXUkkd4e3OqUjeat27ppVZO1uSgBdpqUbT?=
 =?us-ascii?Q?QBjoY/i211nWxmFvUN48Oacs1aK9J41W?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hYaKa9wgLNyAO46lx0GH+aHIAodxoXycX0rJxLC7sKHupTlT4o4Fy288jSql?=
 =?us-ascii?Q?vosnVtLB81wVkwutRbX18HT0kSkOAImDJjHH4Xb/teM+BWXNWHQShFVQd+q6?=
 =?us-ascii?Q?jlui3YUTEOFdXNelUz3jrtU6/sqT1ISVHxJAZoJYlSo+sfewsaeEKGPANZuJ?=
 =?us-ascii?Q?MtzUSdIS2o+Fpb+0cfIu8VHza/bBJOi7pr8Elim/2lzG8K2SUoAtK3OaHf5B?=
 =?us-ascii?Q?sSHf2Hg1XaMCO385ei62uKAvRNoQ0GrjkMXZqtLf2gSqTszjqQzmCpJyFvSp?=
 =?us-ascii?Q?AabPZu/syLQHHDtR3mDvERvjP1iCAhXRRFyfkoU4eDfEA10D5E2FWyASteJH?=
 =?us-ascii?Q?YY7FFIMrMo5cHiH11uSdehFYSM7hxZK5Kt/+CeQGkNgFDWxZ9SrjueiZk4Uw?=
 =?us-ascii?Q?SQK0O5Tybpzv4vn9qjOKmfwH1+qYFlUJefEu8KKDT7veTYuymesJgbO4KeM4?=
 =?us-ascii?Q?sBS0jxiX54JMQMBk5DF5E3yGCXhMtI/S7yMIcHPiUBuwQ7a9p4p4sg6kWrOP?=
 =?us-ascii?Q?l0Pyd6VCEvMqJl8nzL4gx2bCOTRjcDBCTHTOWxt+kk1n/DO0Ord3WwEWNtkD?=
 =?us-ascii?Q?dDweqa3F3tMcQ6DgxkPivrrEZQGnnswhzxrFKBBFT8FPgJJho7ARfnXmtcZG?=
 =?us-ascii?Q?PXaiMWXPYdM0qYQgCMT1lPKPeFZOI1mE+sjBZw8G3ERVW+8sOLGrmUeZjJ2B?=
 =?us-ascii?Q?ebpzwIIZDzrp2mPfvMnNkJUcN+/jXCXtKOYUBOxjwuXHOQGgEWJFOqRziLJK?=
 =?us-ascii?Q?WJRuh1+xdvXUkCQmOUMJH0gl7KzLMW8y4uYLioHpBHAfIv9mr7CQUvAIi+Oa?=
 =?us-ascii?Q?N0gzk3IpnCNOKy/fR/UZQefJOw/u1VUapYmCE7IGd276XBZs6YIy6S1YSXeO?=
 =?us-ascii?Q?u8CiCQHNmh71t0TfEt7I4bm8JjsPVA9g7zcsq9eKQ6/dDsDcW7lq3KtirqYS?=
 =?us-ascii?Q?wX+wmAnAioCHVDpxaAy9xFK9TVE/dRs5sbqDNzsRyNn1dn5w0JEgADfTpmHe?=
 =?us-ascii?Q?aCfCE0pRhtk+avUeqvQ6e3uHvLpM0a0B3v5J7HURMw0nnVF6Ir5/TWE9HWpX?=
 =?us-ascii?Q?cLxdSgLoipW/3BMuptwW+Nm5Oa7Ljlv+AVtcRpqr/Tyg8bwgE/loONa06dft?=
 =?us-ascii?Q?3RFGizTZqGCKIEJc3PKJu1C1tl75ipcK4ZPz7QC89LYnq129oaV4eLHFjyl2?=
 =?us-ascii?Q?sfC+MRGAqF0VGAVr0daAeWYiACTAGqfDoebpA02w+k0l5AIv4ulZB9CWZobe?=
 =?us-ascii?Q?N2yaGshta/D4JzchAns+MM2/cSzTTiQlOgmgqUGJWfcMtRyxuYOaUWD+duX9?=
 =?us-ascii?Q?RwMINzkoD8sxVHr/JiVNCB5Nc+Dt7s+jDKJGGlaBao952oXvpTbRgftJZzDO?=
 =?us-ascii?Q?5I2I2e/iuXB47T2dkJgzq+P9Lg3E2MbsEFCRXKKw7OePJWfrilwoCNlRfgJY?=
 =?us-ascii?Q?WEG9/iFkpHez4f1mOZ7kbPiMCMGYRa7nUU+XXvTm1Hak/4IIprfCqnYZW4f7?=
 =?us-ascii?Q?zVSGhqJ+PCIqAmxPnyGr5/S9T78360zqkil2LAyxRA/VEkLGnncuKaJm3gHV?=
 =?us-ascii?Q?XvN0/QZfphDb//w3e48=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8b267a-0153-42f8-443c-08dd2ebd77aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 01:49:04.7252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: INhmLDDvtIeJalUNsJLTgbYXWg5lbJtL6IqzcctH4Bh6KHRaPwK5X9xlKi/CBx6urbTCSyUYM2ySEL3Q+tfJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_174909_143713_0C44286D 
X-CRM114-Status: GOOD (  24.25  )
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

Hi Dan,

> Subject: Re: [RFC] firmware: arm_scmi: Optimize the iteration of
> scmi_requested_devices
>=20
> On Mon, Jan 06, 2025 at 02:57:24PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > scmi_requested_devices is organized in IDR based link lists, so only
> > need to search the link lists when there is a match protocol_id.
> >
> > Back to search the next id with 'continue' to save cpu cycles, if
> > protocol_id does not match.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > RFC:
> >  Tested on i.MX95.
> >
> >  drivers/firmware/arm_scmi/bus.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/firmware/arm_scmi/bus.c
> > b/drivers/firmware/arm_scmi/bus.c index
> 157172a5f2b5..42deab5903fb
> > 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -79,6 +79,8 @@ static int scmi_protocol_device_request(const
> struct scmi_device_id *id_table)
> >  			if (rdev->id_table->protocol_id =3D=3D
> >  			    id_table->protocol_id)
> >  				phead =3D head;
> > +			else
> > +				continue;
> >  		}
> >  		list_for_each_entry(rdev, head, node) {
> >  			if (!strcmp(rdev->id_table->name, id_table-
> >name)) { @@ -89,6
> > +91,7 @@ static int scmi_protocol_device_request(const struct
> scmi_device_id *id_table)
> >  				goto out;
> >  			}
> >  		}
> > +		break;
> >  	}
>=20
> I suspect your patch is correct but we could go further.  Removing the
> test for if (!phead) really helps readability.

Thanks. Looks better.

Thanks,
Peng.

>=20
> regards,
> dan carpenter
>=20
> diff --git a/drivers/firmware/arm_scmi/bus.c
> b/drivers/firmware/arm_scmi/bus.c index
> a3386bf36de5..2c853c84b58f 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -72,14 +72,11 @@ static int scmi_protocol_device_request(const
> struct scmi_device_id *id_table)
>  	 */
>  	mutex_lock(&scmi_requested_devices_mtx);
>  	idr_for_each_entry(&scmi_requested_devices, head, id) {
> -		if (!phead) {
> -			/* A list found registered in the IDR is never
> empty */
> -			rdev =3D list_first_entry(head, struct
> scmi_requested_dev,
> -						node);
> -			if (rdev->id_table->protocol_id =3D=3D
> -			    id_table->protocol_id)
> -				phead =3D head;
> -		}
> +		/* A list found registered in the IDR is never empty */
> +		rdev =3D list_first_entry(head, struct
> scmi_requested_dev, node);
> +		if (rdev->id_table->protocol_id !=3D id_table-
> >protocol_id)
> +			continue;
> +
>  		list_for_each_entry(rdev, head, node) {
>  			if (!strcmp(rdev->id_table->name, id_table-
> >name)) {
>  				pr_err("Ignoring duplicate request
> [%d] %s\n", @@ -89,6 +86,8 @@ static int
> scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  				goto out;
>  			}
>  		}
> +		phead =3D head;
> +		break;
>  	}
>=20
>  	/*

