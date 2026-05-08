Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A394CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bIEzXgJRQJ5AzfHbm8mdJo4RA6PZzWuU2j9Loi+fcY=; b=tPDeYXd5hw4pD7Sxfy8ohY702K
	HARNeNAf+u/YnXBJ5Ab+E/o87YMcr3amjLrBu8cLsxJNs4gPTKhxrNoSbCbOEQCQ2/ag3iLcuQPF7
	JkN6SiThNv4xPZ192PXV9VKcwEcRnAYHpI/lLUqXWtK173NPDitt2718/tgmcV4Kz6Hf16JT+/1cg
	QD9H1y9/FNakvveoxGLiMM8FU37ebEjfh03iejOI344ra85AIbeqbHRdxGFgMzVEn3Z6ut9ywjMCx
	aotSNdVQUz+GDwzaubcZvPvhf9JCceQHaG2JvLhtkU+QNOx0L0yKDPZ3RyWeSte+SbefeWU8qU/Qc
	sECLDHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFrd-00000005tbq-3Xjb;
	Fri, 08 May 2026 07:43:13 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFrb-00000005tb9-1dOb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778226191; x=1809762191;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/bIEzXgJRQJ5AzfHbm8mdJo4RA6PZzWuU2j9Loi+fcY=;
  b=iiRivKLlpnGUY0n9s95/mUaQ3FjWjbS4iSr4CLwN24x4nun9DacfTpCP
   c6CJcLCU21FZgkfQ+/AqyKxIpX6xbgWyr3TtUO7VfyeCS+oe/iGtY2ONT
   Q4hyEydF5f5V/1/dcSyKbyR0bIQv1nRPYW3BpHY6eh9V3Q9SVXU3ENqXW
   4NMD+XHWlikapiBTdQCGRQDZPOEKIjJGx17Ly22NSTN9oKo/pd9JPCJ+a
   4poJJxUd9NBC8N+IYYLSU3TzBYCdbUiWqj6FkDGjEuvmlnIzP/aCQBw3C
   VHRqSCuc/4jUpH5X8/NkOnWzZK+Dv14EGgQUT+5pLQHGFEpjh25TzfBBC
   Q==;
X-CSE-ConnectionGUID: WJEPwEYuRvG6CDP4v4FgYA==
X-CSE-MsgGUID: nOalu5YRRg6NC053lXXVlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="81754067"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="81754067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:43:11 -0700
X-CSE-ConnectionGUID: nVLYPPCVTcSnF9UcbUr4Bw==
X-CSE-MsgGUID: f89XEddhSKit0BDSaQLr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241704357"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:43:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:43:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 00:43:10 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdYNUCUf6TE7lQVdRZZqNRHS1J840pn1TpAhZOaQ4B+couNPWxrr6oR0+/6WFptmPITqSe454fg0BN+9Sy4cI+KT3u1276ajrE6OdWsnawUpji3NW2C2bo1AquwZOB/VPOOHFnnc6BxIusHitouCJDvK7FCrS1f5hRMKvjFNIZgZ2EPoIhEx7oxxKxblrU5PvyV49RbNn0z5rOe/u79q+MfthUq7x1/mclL21e+oj/gbENgTG4wgidHd8leYwFCYU2zweLnv5IsiokpaAmEmFi+mnF2yqX7gIXLGGJtFJ+hYqTtCLe4JznsdDoNnWXNF7uJvKdFz75wTwuyz4B+fLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bIEzXgJRQJ5AzfHbm8mdJo4RA6PZzWuU2j9Loi+fcY=;
 b=aem6AE5GjqjaixpPpLh3aOIYnzHu8vclkT5/TOFg4ynxfVHiY+f+NZ8lmJy6g2PtYTKbeNMYHK4E8vq0Q2ejxaGSiUnAPic+eDITcErcganiVz6nZ93WJ0vVa7fOh7N1/cDpmGKLg04m335KFsydK9QQ8OW9c+32UIHtgLaAgZdTFEIDrTp8IjrPT1C3jKP77Ill0aS8V2fJbWCE4O+DxlrMz9SPP+KSKEevL90YajOvIFs68KByo/Td/5psEq8Az5ggaUL/vcyImDFdidBJ8rysDeCkYkqv2NeRHblZXcmI/BDK52nytKhl9zsoZP1NJIqjbcQiCevM11ehdGTVHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 07:43:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 07:43:03 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "praan@google.com"
	<praan@google.com>, "kees@kernel.org" <kees@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>, "smostafa@google.com"
	<smostafa@google.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, "jamien@nvidia.com" <jamien@nvidia.com>
Subject: RE: [PATCH rc v4 4/5] iommu/arm-smmu-v3: Retain CR0_SMMUEN during
 kdump device reset
Thread-Topic: [PATCH rc v4 4/5] iommu/arm-smmu-v3: Retain CR0_SMMUEN during
 kdump device reset
Thread-Index: AQHc16jr95QIrzCuok+nTMxHb1R8o7YDzTCg
Date: Fri, 8 May 2026 07:43:03 +0000
Message-ID: <BN9PR11MB5276421910DF2F109D0A88808C3D2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1777446969.git.nicolinc@nvidia.com>
 <38bbcaae651ccc3adcc78e232bdb5ce217c86693.1777446969.git.nicolinc@nvidia.com>
In-Reply-To: <38bbcaae651ccc3adcc78e232bdb5ce217c86693.1777446969.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW3PR11MB4697:EE_
x-ms-office365-filtering-correlation-id: 1b31cd39-462e-4748-3bb6-08deacd56fd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: AEOaYD/63bvSZ08mu7ZmCfPkajMZ5yDo7is/dqkGqN9B+DrmAqiOZMVKhlNg9MGUvKj1cCTTY0rW+FEMj9RBnfQh3GzUxceowmZ9qhsdVPKzemtj/J8IE6lqnyFFYwbcMhDKhX2PcgQ/yDkX07V5o/3RGI/uQcxtAljgEmstjdf3YPb/FmxHHT+8wzkPJDhmGHn+dSUUiIA/fAkZYg88EFgSA0nBDqjFUM241dMW2YnpmacMREggPp2amtew7ax+RoBxdZ48USivb2sNLO9fJmNX9HpOCQ2fnPZTFrfDJmkf3Yauy03Tdw0K4DwJeAg0mKog5eyW/YcZGR2nAh91skGPfEy/A2Su6rTYKXLAFa3EfikwWtcFblZliEXY/oGWSkajKnjTC1LGM8umFnLErWANFcbDfJkR/dBpKCGWAphIviM553cQz8G0Pw8A6nG+TRcetn6ICpUM56DDPI2qQqlxcvy590kg0+FEhYAcChcIywnJH1CRGsXIEwlGEsXiIDH0fyTA64FIaWKE1I2EAFV3hMUEIa80Xb20dTjeMoh9nhu7/p0P85UryCguNItN5BWpKkTBbdwuIb0W7ptBd1NWH9QtVzfnqOiPvbY2waediRCAO37mV6Lu5MlkkxfsbQm+9W8r36zgob1CEebhLLjDykZR7eUZ51BonnKy+sncuc9C1jrV4xZT22QeCyVKN5NmdLV8U0MPfRRhhvLWT5HziOzbs5Gc7Ok1KixCDieZYbeaWYziizQOzS/qYOVX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wit6lA0CK+Ep0UfRTw2xI/WlmeeEYz5lcL/bEvOxxc5xFuwFG1LYJaHAfDUe?=
 =?us-ascii?Q?8apiV27hmhVcaoptYpc0G/D7uCgSBLVPJ/jlG2zMCmaceEERdM2VWpWOsJK4?=
 =?us-ascii?Q?hbF+pGqVLwC2oOzX8zPvF9Ac0YS0Lnk14UwUZ+7d0eZHwPpUF0HRUoBSoweV?=
 =?us-ascii?Q?Z6u+uu+NW3vy3mSaO2HRBED5q2VcV+SwiAXij/5U3sqJHDsTKdDQoYK4+2Ll?=
 =?us-ascii?Q?orwwSyvslZd7B0IjaRXocXnJbFIAAnKzR+DWtUSPJxo9oO5og7AEqiuzp/Bx?=
 =?us-ascii?Q?kuuqjqP7jE47HifrYPloXrP7zcw6qDlF4yVHaAKNE+d9XpY8RgHPpVwCqdld?=
 =?us-ascii?Q?YHqd/AQ1aq/Ta0kR/CKDLeviLrDGD8XTHf+f/Pj/weQYhNKtBTJ3SDGqwEpv?=
 =?us-ascii?Q?xjcYggCWfBexIsSPysAvcdAj91Qt60E10xnlqzwKckK0AaGVQeMERaQ5X4Tf?=
 =?us-ascii?Q?ox2SmEoQ7QV0WyxLFe0AS2ppRzhsnmf1xaKY4s1eCHuE7mzBFVlNWXGnkQK9?=
 =?us-ascii?Q?4hScqg/wmA5D6F47MOXR/XDPscY/OmFYYs6SaaxtI1Ux7kKku4xNb9qtYWw2?=
 =?us-ascii?Q?2cKYs3D39wA9g3NcwKffq1zySRaseBub2AmJVT4ShUF/J9SI6C2VplE1eisQ?=
 =?us-ascii?Q?OoFEdPij6/4o5ncOBZwU5sJQ44Q9pxCOEnjxC7o2tHyadpUhc3nsmlhQt5xX?=
 =?us-ascii?Q?LqPXpUmz5eTuC6gsp7AMDSSXexWglClORTxalKl76taxKuGw9C6yqDRi0cbq?=
 =?us-ascii?Q?fS1MBKW/e5nJqF6K4sIhefzUlePa57NcMMBwOK6JAFox623yE+HmbxGI3z8v?=
 =?us-ascii?Q?HncsoBt5ZNv+L/d0yDvvlwziLDLBZRteZTyLxcvXVvxLSFbjKGB9LzUHtm9J?=
 =?us-ascii?Q?gTbQBSMDkCcXYVFJPMN+FiE40nQTNQ4bjdbdx6+zJ0JT1rVj5heoKSGM4MPE?=
 =?us-ascii?Q?aCv7IRiLHaT/g9HCbGE3CIcEizRCVPZJY03MsaU1uxq1MwhiS9j9iXQSvJAv?=
 =?us-ascii?Q?x+R4menj+VQBVu+yd7phL5W9+SUBR08BgJjjeSGYU76j3O1BjPPES8AQrLwR?=
 =?us-ascii?Q?7xi+RI7F1iSimrA7QYLLjZcPzq8XYse34M3S+kVXxumjBuNOXqDj0iUTdXzl?=
 =?us-ascii?Q?9DetSrV9B4xfDAZXQ9ZBX2LmrzYz4cPhLGZDsSlJrUqHVEBgb8zZvcEbmYl6?=
 =?us-ascii?Q?0uq+c66slSISVInXl2/SThCGFgnYEn49f9Yth0YbgA41GCWjuzRNtOVQ19Ip?=
 =?us-ascii?Q?AJL3I17G29TjAMPBsr8t9tXdAjWtA7Ti3AI8Dv8ViMt0JEvnz32oNieY6kCo?=
 =?us-ascii?Q?ISCIyUOz5JX2RfYcU7mDp8qtcUwtM21VTGHtku/FpZWJgtsL/upL8OC/NM93?=
 =?us-ascii?Q?QuNIIXbyW7HvQzYjO0g1FfM+tnc2Uvndi89regecVM6KCiJhOo75H1rdW0jH?=
 =?us-ascii?Q?quaYTKb/ZTOyH7WTWw0gaq5QjqXqLPttz/sK4e3IEMj/Y/9QNWCMioqtuszX?=
 =?us-ascii?Q?7Gye29D7TyIdCx+AGHWRAFiMvZleUWng2MAX2R1SXayWkMP+5OQKJd2K13iW?=
 =?us-ascii?Q?jKeOkX4Zhiif93oLqYhmhjXv68zzH56+kvNueO9Sc+gRNPKMJd1CGGaNGqmq?=
 =?us-ascii?Q?2WIIBmUJUVu/fVqdxyg4lZ+tUliq7T86+QmFLu2LsFb5mP2GcIw/63H5QTjp?=
 =?us-ascii?Q?JShRtmsalm8oC4XyuclIBwM2wIxBVASE7InEOETvGVmce265arO2tJzZPm6d?=
 =?us-ascii?Q?FD7CGPxNHg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vcUZYYmTI0KWbl1xrtl3FHouMXas+sqqlIkvS66tODTOWhFQNMvweMp+6lUeYQ6awIi5P0onU2R/U31ONRwNQ9BhkqL5+En3E595NmFA9/tDzKlRxggJMXLP4D2ga+AHkffyqs2S/Wua0fXxpFawjakeCEb9uYMYcb57pH97P2b9mjR1l4LFUPTVjapLgdBmF1MovzJYVNQE+7oFJD8HnTbBpYv6aDqsSENJyOIq938VTvgWpXeBZBr2vo4DZ1/ndsp86KoC2l3MUOWLXnw8mf/B9Zy5NONRsH4iHzJ4BSWJC8/1Hc85XspvNzFOQIjRPZBFv3T2NMthnY5XWl1+4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b31cd39-462e-4748-3bb6-08deacd56fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 07:43:03.7092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQjxqI6qoHYf+Yjj93O3+xK56QESUK+6+3QW19ImwBUN3c9mkVFXw3cGh5F3wezcuGD4l+W4BE9PWSfhIbViGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_004311_487429_5D319EB9 
X-CRM114-Status: GOOD (  11.13  )
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, April 29, 2026 3:21 PM
>=20
> When ARM_SMMU_OPT_KDUMP_ADOPT is detected, do not disable
> SMMUEN and skip
> the CR1/CR2/STRTAB_BASE update sequence in arm_smmu_device_reset().
> Those
> register writes are all CONSTRAINED UNPREDICTABLE while
> CR0_SMMUEN=3D=3D1, so
> leaving them intact lets in-flight DMAs continue to be translated by the
> adopted stream table.
>=20
> Initialize 'enables' to 0 so it can carry CR0_SMMUEN in kdump case. Then,
> preserve that when enabling the command queue.
>=20
> Clear latched gerror bits if necessary.
>=20
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU
> is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

