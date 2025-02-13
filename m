Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC5CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hic5Te4/qMTrCao5s3Ma/8xESaCxJSegfzlrkEGMJds=; b=uj3aoc/XR7iQSAfQEt1QY97WMK
	k3I8OwCvhohJzC82mKSx1Bw/5Fo4IqJuLwaDY1tkaxIZ79TisQjw8QH/P8vk2Wo9lDZ9MMRIeMezF
	LMY25r7EqRSvEWUampVjLdFXlrQiyQn16Ldw3y9u1CvUckG4AfpqI6+CM7Gldb1ecenSyLo3qxL8K
	hNHiksB/ap38VWILhyZotfCZ2LeiofMWPX69j6DPW1Hnnf20dDP3oHz7sLOJP/e9BYeZRlJvV7P22
	DQUwduQefdOXhsLiOK1UPVBKZSbJD3y0XH1y8rXF4Vsng/q1D7DHbyR4Pgu3JSVegur43yUd8iI0O
	2F0feqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXEw-0000000Ao6t-2ZIu;
	Thu, 13 Feb 2025 11:18:42 +0000
Received: from mail-bn1nam02on20629.outbound.protection.outlook.com ([2a01:111:f403:2407::629] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXCn-0000000Anjv-34LJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHKGyqRAP9EP6Vja0sNquEmIN/5i5poeTm1+onptMBXRkaY42myF0Js2R7H2808bseu7+q8uuj92fUgDGqDxTWBc1+xOE4RJk3FqcRS/7TNNBqiFuYePEq/RrP5UGhFLHuVfpE/wVJr7lHBV2GYnbdxaJZ3QD7YJDBrs8M09S7zFFT1B8yn/3gmkUHYWGKbVxxeOUMNM7uuJJ32RZTWmxJUSJxMu/MOB6U5qJt2ou6J7OsIqx+5KGfmF4u0HZoKEwxvdji6rtzn+AnpUrmqBpbu1SsP2kJSxcKOgWJAnqiTGtD8Ak+ocoD9f6U9/C+6WU9MfnSpaUnYAyqKCUxZWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hic5Te4/qMTrCao5s3Ma/8xESaCxJSegfzlrkEGMJds=;
 b=hrWi4zozBg60zYl7jTP2VE7gFSKkJPkci2WrfcrG+vTl4SXfzRXL0ucqJFdTO50SxHrS33QJjpH0OJ4a6OK7RmncdMVvCXRXtFz+3YGOiyGKBUNlqwXduA22tkSns3L10P12W8bOjIQtsrfXfAP+VY4W9/l6GiDGrHsQZBYlUnMkQF/WaGh36rPRhCWEzVOkQQB8sxJY7cqot94Nyx9MN9TkBDOP1eNc726WPAJHK3GVNszg557vxM7vHwvc9kvb33aBQ6P6+2BHNFMd9fcmfJC+J1UGlcLiY7lHOECXNbZfyN6Kon0sQPqn8BDjufiAGc9scdlXS0sCvvbRpDzegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hic5Te4/qMTrCao5s3Ma/8xESaCxJSegfzlrkEGMJds=;
 b=qoQq24Fl1AKIj0DZ0fcHz1vbTO5QmnZ5qAO51TF4YsPI00FleKPou9vcy5xrkKTQGETyDbXx32be4Sq4xwV3xZNn/b7LZwSoM7adhftYP3UPzcN1Xv3Y+Xxm5W0P/Ivi6tDK+8q521fK/AEe/8BC6P0O/XTmvAzuucEapGyoa2g=
Received: from LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Thu, 13 Feb
 2025 11:16:23 +0000
Received: from LV8PR12MB9206.namprd12.prod.outlook.com
 ([fe80::5447:387a:c920:8a4a]) by LV8PR12MB9206.namprd12.prod.outlook.com
 ([fe80::5447:387a:c920:8a4a%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 11:16:22 +0000
From: "Jain, Ronak" <ronak.jain@amd.com>
To: Rob Herring <robh@kernel.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, "Manne, Nava
 kishore" <nava.kishore.manne@amd.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: firmware: xilinx: Add conditional
 pinctrl schema
Thread-Topic: [PATCH 2/3] dt-bindings: firmware: xilinx: Add conditional
 pinctrl schema
Thread-Index: AQHbeKKktzakC2pjxUKURYxGjWc/ybNCrZ0AgAJyC8A=
Date: Thu, 13 Feb 2025 11:16:22 +0000
Message-ID: <LV8PR12MB9206BA2BC6BBBA184B3E2FCD86FF2@LV8PR12MB9206.namprd12.prod.outlook.com>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
 <20250206142244.2553237-3-ronak.jain@amd.com>
 <20250211215354.GA1244436-robh@kernel.org>
In-Reply-To: <20250211215354.GA1244436-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR12MB9206:EE_|DS0PR12MB6631:EE_
x-ms-office365-filtering-correlation-id: 286ca788-79c5-47f3-915e-08dd4c1fd93f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?epiHskvyGsM4KTGSV4ITEZaXuY1XBL+ORownzZuQKQQDO+yBB54uxh8fmudS?=
 =?us-ascii?Q?h34yTGKtDW7MAt6X5uxWu9JNK7DFGSuBtaIkT++UEqMHsC3AGBY4x9MMSrdo?=
 =?us-ascii?Q?K8LR+qvpI6/3rjFlI4mfHS8yaZ0qd54iwF200V5VMDNhovBwZUGmvF0vCQrc?=
 =?us-ascii?Q?B66emm6Z3aEVqKVL8TlO1VDyvANbLieDQc6bXDqK26CFSxDZ+NuJ5qmo5dlL?=
 =?us-ascii?Q?lEPtaWbcMgix0VmD7JIDX7ji6S4Qt66b2Vg5Wf+EWNBrbrqn0bM78Me2ujjo?=
 =?us-ascii?Q?BTPsNHJ169t0Wy1Im0qkNjsDSsr/lYnWgw8HXz5sTvVGE0q9Rd7dVHZeEq26?=
 =?us-ascii?Q?L4MH1Wvuc2MGgoB/y9nDui97LYCg7KQhh9qgA/StMlPFHSjnk4PW9m9KMLt1?=
 =?us-ascii?Q?/wtAfgtC2NR9tCxUgd8eElCUJjy6erZwWbBOQxFFvF/I3gdlHYp8RxZd9Uy9?=
 =?us-ascii?Q?TFJhWv24mRP+yoQZUgQmoeQMsDfp/YuPGDPu/FQlvWhifGC/D8PT4h/yASzu?=
 =?us-ascii?Q?1vsYIkfC87mmcozJ9Oxcq9uWynijA+R/7ZzEyKMNgqK4W2kHYKgvX3f9gZ00?=
 =?us-ascii?Q?4hXwuwGklTTNL4IoDChLie6hg4QkNWtW4+lTt8WkV6FRH9RJ8AfJnWvuA0fH?=
 =?us-ascii?Q?EEudOcCZvu20JdlZOhSIV5yZ4jcqBzZ+HjGOvwGhPxkiZZqgVqTj5tcOXG2E?=
 =?us-ascii?Q?kqjNFojep2x/HajR/Q4yeN8MO6qZfNpAWI0XmCoxogbWvnQfmyifWGfncNIn?=
 =?us-ascii?Q?EZX+YQlJ7BBVEQWSJxA9ek85844PgCUTpkFkj+L59amonwzdYJhc9z4gtbQb?=
 =?us-ascii?Q?KXW7PMlgBGFLrbbRLV1kpOWazOMcecf4IsX/SkNls3bKYUZ0A+79IgxXZtEJ?=
 =?us-ascii?Q?QepbyojRePEItJ8HhmSdiCcO+SwuJdhoLPu2+VBp1OGpznObrXq+dVYhaqft?=
 =?us-ascii?Q?xxj1bSS8nv/T2qngq/NIWWhVVLIgrv8+WaLy5p3M5NtGmvkNt4hIv/i2ZvaX?=
 =?us-ascii?Q?Z5wbihRpBRYxc4mSdBsOq9MSsKKO/RWMA3zJkuVf+K7NWbx67otzYVeMgLSH?=
 =?us-ascii?Q?BHeWD51gcnu4DL/A5B5OvJWQ1Ng9nlfT0xg59SBXHgjV4Dis39SszZJJ+7jF?=
 =?us-ascii?Q?c47FeF/DOoUypn1xKgc5vO+hYrIh08GqYWRYh0CBHSD9FNedk7KQWxQ7RbhC?=
 =?us-ascii?Q?HOBi8Xl90DLz4zhWOd62unZyteRrYzVDEcqAnQIeWocmuIg7ydyEhFav1TJb?=
 =?us-ascii?Q?eeN9pEngVeM0zLWYGSQizhn3vCfllgOxK6/oAi4HXoCTo0lYWMBDHvYt+vsc?=
 =?us-ascii?Q?Ydj41J6BDiAPbvoGPYlMmeJauWBlM+1dMjx1K/vYQdESVAR8cBXCqrQFvG8q?=
 =?us-ascii?Q?kqb8btkdBrzaUmC357uT+zZSLtDcYQ9wkwSmyhMkVJ5BdE11oTlCYl152FIM?=
 =?us-ascii?Q?6IGLJ2R30EtNDJr9r0tUBX/dc7Bw7uqf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9206.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nMQ5B1VvB9UHodVJp8DmSRg2CVOjSLNnkSDUo+DMPDX217IX9wb8+jyVy+Mt?=
 =?us-ascii?Q?f6/mGCgIUdh3jzRg2BRweO0wiZuekl/UH1zwtCg4Bg14EDaoC/sHG9lVP9qC?=
 =?us-ascii?Q?h2DLb3kzYO9SqRqrEvMOJ/yG2ip3+dqS0gN0ozcIx5R6vakYXWMypK5E/ZCT?=
 =?us-ascii?Q?P2lH2I73Sc12LhaO/u6mbtvkBo8O/PolQ22A2PsVaIckAqQVnilGx90fIyKv?=
 =?us-ascii?Q?pqAT+N3/Sb4AbVb4sBFGkb7bhIjoQJuD7MgyDz19TNse1hl/WEtGo2AilWOl?=
 =?us-ascii?Q?nxg0CYci1r9/cvrYfBCvPVLpQ+cSQAsQzt3DKoyH/8sDIlXRriaApIcdhgRm?=
 =?us-ascii?Q?Sdt9ThQScD0ySpr/LlX3GNFiIgV0HNzeUe+hC/1ka4t3thZrWvTwja6TEWIM?=
 =?us-ascii?Q?HKcIuJCaasTOMPMTfLIpgXu4hzFc9doNWr3IHCUluE/VMCj8Lw5a28+HCPnV?=
 =?us-ascii?Q?dOaXfZf9d/+izJm5CICa918kOw10Z/bMfKJhMqE5TL6dd0enOIbLCfYA310L?=
 =?us-ascii?Q?1MXzhr+BZVvq2+t/NCjqSEVLmEoEPMpqeQLAXz6x5bbCq6l+T4SoemWeXRnF?=
 =?us-ascii?Q?q14ZCR80a/c8OrLqAgrzD4rb890G67lAxd3pc2U2itjhqEqq/woX/xNRM/mY?=
 =?us-ascii?Q?EMM4MEPkw070RusRqXM+KvRGyuHZ6dnPvVOysc73TCvGi9shIFhqwg3H31+t?=
 =?us-ascii?Q?iahtaVdUruptChB0LtaAG1Ohm3S490udyf9Eb92lxqnaryMfTASBxiXDCk7l?=
 =?us-ascii?Q?i+L5kNulXy16Qu7pm7hUg9MxxfLZGHOyBorhB8fGnAvE/bQ7eJaMMe/jhMLw?=
 =?us-ascii?Q?ZTv5NnzmVd/jdiSbVd4kjCM/0YxHtjeYc9GAbJG9YPbobw+FNst8JY6mdqKs?=
 =?us-ascii?Q?KIbfDM2dytq+WMSF6TvmcV/ITgPPHDDMLysWGEFLvWMyI7IPh2HdfzJyPOG1?=
 =?us-ascii?Q?0/T22gjqNjPmOLg09eBEkyWzXa6APrNKAZzuXC+xLnYBEXPQK5O5OVqi48+T?=
 =?us-ascii?Q?377z8Xvg25KuT+vyX9HkYRdaDFDr4S9pvBUZjVa7zGXc0zwJzGLisAwV3Y50?=
 =?us-ascii?Q?VLkPCoHbhPAWdH5M2QShf6mYAc5Kl3xbLdK5MOqo5RJB1ZBdfMt61cF21lMT?=
 =?us-ascii?Q?k+Q2Hg5ugKqEdlwTKSwwz3tAK4AFA7a/KJLohAeMw1q0yEMivvDcSWni/pkv?=
 =?us-ascii?Q?7qAAbc7oxBlS6dfZRV7NcSPkCr/p6SnKILJrtfEVE+QjTfZxJ/DD2eaEFKae?=
 =?us-ascii?Q?+pstACAUucVyB7Ul/3M4mcJslv8hTrSxIiEtV1smOGd3Hsu2ShK3yY8c5za3?=
 =?us-ascii?Q?rpwMv/2ik6MKa070YdisxmFIGm6JHmKBQ63l9Z268UMmvT36Knk2bDsjSA5x?=
 =?us-ascii?Q?XG7Y4mT7VQKU36LVmyJJm5E+aenKs+G8qFPqfrnKtjwNpNKGbzy8DeoLO+hm?=
 =?us-ascii?Q?kcWNiGCnIJGInOgHt6dtGNcReTn4C5xRWwmVIWSiatPC/SbGnzyFlw6Ql5mu?=
 =?us-ascii?Q?bsRdz/x2LtjGqCgI4LUgnnoUDF9DQDk2tB9sWphhbP01wn7KZ9yB+SNH4T6l?=
 =?us-ascii?Q?0JkHDiS17qA20C/i0ms=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286ca788-79c5-47f3-915e-08dd4c1fd93f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 11:16:22.8630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CFyv1t9OaIqUKfd1bY7Jgh7wCYjXlLYNLRD5a3mWqCLWPv7gkAz7XUbfFyOib/X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_031629_793974_E031944B 
X-CRM114-Status: GOOD (  22.10  )
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

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, February 12, 2025 3:24 AM
> To: Jain, Ronak <ronak.jain@amd.com>
> Cc: krzk+dt@kernel.org; conor+dt@kernel.org; Simek, Michal
> <michal.simek@amd.com>; Manne, Nava kishore
> <nava.kishore.manne@amd.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/3] dt-bindings: firmware: xilinx: Add conditional p=
inctrl
> schema
>=20
> On Thu, Feb 06, 2025 at 06:22:43AM -0800, Ronak Jain wrote:
> > Updates the Device Tree bindings for Xilinx firmware by introducing
> > conditional schema references for the pinctrl node.
> >
> > Previously, the pinctrl node directly referenced
> > xlnx,zynqmp-pinctrl.yaml. However, this patch modifies the schema to
> > conditionally apply the correct pinctrl schema based on the compatible
> > property. Specifically:
> > - If compatible contains "xlnx,zynqmp-pinctrl", reference
> >   xlnx,zynqmp-pinctrl.yaml.
> > - If compatible contains "xlnx,versal-pinctrl", reference
> >   xlnx,versal-pinctrl.yaml.
> >
> > Additionally, an example entry for "xlnx,versal-pinctrl" has been
> > added under the examples section.
> >
> > Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> > ---
> >  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zyn=
qmp-
> firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zy=
nqmp-
> firmware.yaml
> > index 2b72fb9d3c22..d50438b0fca8 100644
> > --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-
> firmware.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-
> firmware.yaml
> > @@ -76,7 +76,6 @@ properties:
> >      type: object
> >
> >    pinctrl:
> > -    $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> >      description: The pinctrl node provides access to pinconfig and pin=
control
> >        functionality available in firmware.
> >      type: object
> > @@ -106,6 +105,21 @@ properties:
> >      type: object
> >      deprecated: true
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: xlnx,zynqmp-firmware
> > +    then:
> > +      properties:
> > +        pinctrl:
> > +          $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> > +    else:
> > +      properties:
> > +        pinctrl:
> > +          $ref: /schemas/pinctrl/xlnx,versal-pinctrl.yaml#
>=20
> The somewhat preferred way to do this would be to do this in the top
> level:
>=20
> pinctrl:
>   type: object
>   additionalProperties: true
>   properties:
>     compatible:
>       contains:
>         enum:
>           - xlnx,zynqmp-pinctrl
>           - xlnx,versal-pinctrl
>   required:
>     - compatible
>=20
> Otherwise, the pinctrl schema ends up being applied twice.

Thanks for the patch review and inputs. I'll update and send the next versi=
on.

Thanks,
Ronak
>=20
> > +
> >  required:
> >    - compatible
> >
> > @@ -164,6 +178,10 @@ examples:
> >          compatible =3D "xlnx,versal-fpga";
> >        };
> >
> > +      pinctrl {
> > +        compatible =3D "xlnx,versal-pinctrl";
> > +      };
> > +
> >        xlnx_aes: zynqmp-aes {
> >          compatible =3D "xlnx,zynqmp-aes";
> >        };
> > --
> > 2.34.1
> >

