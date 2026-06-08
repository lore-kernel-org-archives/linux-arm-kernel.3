Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214ACCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lYMRunnbpNj9fEgtJbcb1CF/RtGCyl44Ec4Jk3FKns=; b=4xik+j75lTbS0S72JbuNrwNEnv
	sXcKL8EhwSUlYmpVOOXm9XEtVj+YkyoON0ZckawY9jlZqLN+DYzHhesbnTdp4srGmrAr+NSw+DfK0
	lmCxv3MqtgOCi2pSNOX5C5gWOj/foCHEgJgR8jJnWTLiYnROfY9Ma40bRF6FCnt2WUdhHzSh1iJr3
	y+iolaz68kpsSE+gADDjnVHZjCrJZD3z2Fy/C+6TkCeJyyeKwFDu9c8QFrWOQzjlw9sN/igmt8lHg
	eYzbfDJxGmkIeQne/yQilDwoqTc66U8vQeiXBL/TqQMaCS5z3yzNSzSvMoD74Eb6ELrhKskWuDhHb
	0HiSaRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUbb-000000030FW-0NQM;
	Mon, 08 Jun 2026 07:41:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUbZ-000000030FN-1k3W;
	Mon, 08 Jun 2026 07:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/lYMRunnbpNj9fEgtJbcb1CF/RtGCyl44Ec4Jk3FKns=; b=jzvECknfbpe1+03Dr6PQZKwjTa
	jrdct2ZLdcFFjR/sBeGZSDGG+E4lbXoUdcQ9eqTcj/iIJdzEAqnv1KIpMs6Wq9TDYORe0r7Wl3nre
	zzX4+z0mWOTwNCdCMUraHOKhv81MJvKK5v50PsI8YITvj2UORzGuWL5Yoe5UXU9pTyRbfkAubY3sc
	eMANKHr0jv/zwLw391kFzFQ0PYlTBUvKdVxggBl4jtqEgaq/dqLCBAa7hn00SzdBRLsvGPpw8KRsh
	SGx6MyCyZO6oMSv3ZRQce6jBsGQbe5IuSo/9sCaoOYb0kUb1cnYiHrChWElZ9A59KZryH0k3XFHZx
	eL9RhnVA==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWUbV-00000000eo2-0AW5;
	Mon, 08 Jun 2026 07:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780904461; x=1812440461;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x4lg3Y2+drsf2E3307P/64q6xqYBm38nPLaZj9U7DOc=;
  b=loLdQEI4WhhXlKrcdIzkz7Ms7il+KwIkWLPy5zysb+taMrpu/WNwAn6B
   xrFz8dDS2jSvTIgbzEvJ/W3ovz+bSXlxxR1wbCInNqfkbj/jm0yJQJGH4
   rt1We/b62YlMATaZmz8pSdXJndCkZvXkD/ipEV+Mofc2XSzB+nk2BoY+Q
   BlKbc36TVzDRj1fpMmeAYvZVSW4UcokN93f77Pq6C6HyqfIRYmUXzceM2
   x/el+w60CQnj2WKKdL82nbHdRHX6nfzDOKj3+wdecsV6d6R6rZtHSZNAx
   wAEgbWRCvofZjeDszPuL9Xk3NE2tHJ9dwdjncU2HVvG49Gq9X/NPaLdIQ
   A==;
X-CSE-ConnectionGUID: NEeFZbLUSz2u+9412Pc+Qw==
X-CSE-MsgGUID: Rowq2XInR+qD0ybTK+Ydag==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80662157"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="80662157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:40:54 -0700
X-CSE-ConnectionGUID: /Shw36ljT9SrWC8yZPplBQ==
X-CSE-MsgGUID: 8sTCRFM/TmCsGG3svFu6Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="250575720"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 00:40:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 00:40:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 00:40:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 00:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym6twSZZWJtUQAtvI6tWtKxe7fs2LYo6vxVJ+tLlvocFIFj+G39y/lslXYE/8VYM8jTw/bM+NB8k1o/Ks9K9sQucx9Mw8fArqYl96WeoC8D6VM01+G4FqQwI/22Y+DeKv0Wt+Xqwhyp7dqGYEMjYxO8HUFFqGdEZtZQefrQjWEIB2CJYmltUTdLaqra1QZtU0hLr1NiTOT8e8y2Q+w3FroElobuwgx7RQpaYMT6GWPBgbn1YZg9z2YNYUga3VPQmf6c4UtIj9S/bj6rJNTSoT/XO91tEoYb3iW59ohwJx1GDew+xDP1qC5BhtMfhzwxCgO5AxCA9NEyp4z7zqVKEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lYMRunnbpNj9fEgtJbcb1CF/RtGCyl44Ec4Jk3FKns=;
 b=GyMsKl5kaLIb3ThH+e3TgoxZAsMI4bmSPas0VMtNP0FMReMQFj7o79Ix1VajjP1Byt3qzs87OA76IRWwEaYOntw9c4MKp2MPyhNiP2itKChsWMUFPDyNqCYf3BxeMgK15wQpgJzgaXpQRIm78ux45NFcAO0IjKXfX6UcCUE4039aIoRt46zR2/kwelFZlHSRuI3Du86Sx/nSEeVY6wAV11VpY09AA5gGwh1yw1eFfZaETfnCw0qZ7idy/33cPBqC5+5wJAstlBaKVilMvlszCJEX9USG+81SK+8EQz7sq8AhTy0xV98AGHWCz6sja95XVquBRn4anzGi73DaW+xNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 07:40:51 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 07:40:51 +0000
From: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>, Loic Poulain
	<loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Topic: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Index: AQHc71hIxbHjRBN+Dkur3cByhE7587YpkTuwgARquYCABlkS4A==
Date: Mon, 8 Jun 2026 07:40:51 +0000
Message-ID: <PH0PR11MB5902CCC89F0B7C8EB3DE84E4F01C2@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260529-t9xx_driver_v1-v1-1-bdbfe2c01e57@compal.com>,<PH0PR11MB5902127C590230B9FE50F78AF0152@PH0PR11MB5902.namprd11.prod.outlook.com>
 <c9e80369a7ec449a814cd85269f1135e@compal.com>
In-Reply-To: <c9e80369a7ec449a814cd85269f1135e@compal.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|SA1PR11MB8476:EE_
x-ms-office365-filtering-correlation-id: 06a86bb1-fd99-455d-b945-08dec531439e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info: jO+YFxECg/ueQyp4sEHQi/a01cf4TfdLvHQVrWtlukqC2opw+S0Te0WetPR7yQuKps+e0BIQcGK5yn4gyQoYlX0AmvjWuBlU/qF2w6DcmULPu5CV4d8hfVgdZNk7hXK9H+H2IAWvf3uq8ZGecnd4WXDBusUz5n93ZSNLOtx743o1tV+5AxuAUwgRsSXyyQThnvuCRKmMt1CFKsftUAiePMEbUqds84MQrEEV+Z4zCONL/AwVmKFkcISzn/PZMk+ojRjX4+Eyzkh2ZBxTc6yRryxLx/BTbtFDK1EjVHQG1SSqqvZ1P+IR9p9zD00+6xgREiseIbWa5g3mprKcXL+bDKYiAKi9bk3+fpHSJnKiz0LdXnDwEKaOmf7OIVDC6flz3teOOuvm7szj/klGSlnEIkkkXEe2ik0+hI3ceKxztRA0gX2Pa1sRGWxlkVbNnbTNi4It+d/b9xdGe8QJ1YFUrJBQOZI9HiWbJegQuMxpQnuSFu5eNcvCW+T0LlsmBIolFbqI1qRJeta3p1WwI5jtK4PirQhX4Cs22oF+OwbyBnM6exehLnexp6ylcAjlugg0AhyIXSGQEZhVIL9Hji8kgKADgHAyd64KtVQnlYB3tNUtq7pVvtSLBzqoULJZE4bZu+43VyPP9ipxjlEGrtbzvsHyJRcp/PGztNaV0WVBNJYpe8CEA9kg7Wc8oowvp7t5+yKTN4ZI01hsyEImTYOh8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b4qCdam7NrxxoElGg1cYdLcOL4yjePunzt7RmuwLxy7oukZBwg85Bfmu8Pil?=
 =?us-ascii?Q?2FjMBpTaX7usuQL0I3kZ1PjL4OgnGm8Ecgsm/BL9fuz1fXTR58l59JFObnSW?=
 =?us-ascii?Q?B9iV/ulPSG89hMnEleYk9gDWhpnJKi3Vmvmpa9Xpqf12nUTLxts8DlsZtYc4?=
 =?us-ascii?Q?0FVfmdw/HEatDXJI2xUTxmDf2tMZ7Nq0PssFP4xLeK7xfdMjdOAUmTOCYflM?=
 =?us-ascii?Q?BrmXN80oUUHQvJrejl+yxdm6XjZn0yiVAsYKbfq4TWSdgJ3VpnfIviUajWye?=
 =?us-ascii?Q?lCvhdBumL1QJ6OxOZMX0+UfeJKMT7N4h0xesieJ1RrOrr5Ot30hHJu5Hm07j?=
 =?us-ascii?Q?kDFqWDFIQB3NH5pdNNfxEKmKz3FuAnSiz+IbACX6kXshJJ0E1bDEUi7g3J4F?=
 =?us-ascii?Q?7kB5erJgY/x+LiF+5JiMUjXz8rlx4luE/UmOil+zaBbvunVdpyOs2Cb/3R/j?=
 =?us-ascii?Q?K6tJv4+Mk4Z9P/4ahUWE8jdPMjs15ul0lY1XMLVNnOYIHwSn3gGP2L9bbFzS?=
 =?us-ascii?Q?EueYerdkeboZN1S4sjrTKo33DApKTPBAP0k6rxfpp5DBMneM4KV7FBq+v4n8?=
 =?us-ascii?Q?WP3W5S41q5xMTIhf942rsC4BQuaA1nfL2zngYe2Fpz+qeqvfv6L1Dbg/2nvS?=
 =?us-ascii?Q?ZMOgIPxqvf6jlpWSxtzhQWNlBjS/mKlgl1XpVjqmW+xSFUUir8luJahS0/ms?=
 =?us-ascii?Q?9B152dxaZ0kmCe1SC1Ow1u1OOSfjVyShJTJyVl28Tpw+uH+j5mQgsiu1lQRQ?=
 =?us-ascii?Q?Q8j8FHrfNhoR35PqEmMaFULqSQZEYfgI38jIoHt2PRF+3XcoGVAh1gD/GApc?=
 =?us-ascii?Q?wfnepZWGqD4ttFbgsWgzOq/dtiom6uY6vm6glF5M50Zhp5WR76a/eNoop9aX?=
 =?us-ascii?Q?xHVe0BMUccR0sK3xKiY/bCjR3nFjidYfRyraxw4nwdsb4mBjiYWI3RwKYZKP?=
 =?us-ascii?Q?IvnaBXZz3d4sGQk/jrfAzx0lZipMZyMRADI65b86KbwDhBY1FvaDoqMpsAZI?=
 =?us-ascii?Q?jVPFxzatomGxVK5WAmCB29odiO7B/UJSb9wooCN8Ml5tcYDE426Zw5k2aM/E?=
 =?us-ascii?Q?3wTIVPH7OsVsaAfb+RWbqIF3qrY3vhdZqjIg/PP1gMmbecj7YTWi+2ikAc8S?=
 =?us-ascii?Q?mCYKm20nY7h2IIijubUQJKaRMHnfVooAT8COmgMuKbk+Bmo3jFQNFKYvywCf?=
 =?us-ascii?Q?lGC72YpuSxBLpxWnXblXVZtgqMFFkbNYIDyqBPTCcN/7UKAG0nYWsd6BLk8n?=
 =?us-ascii?Q?oYOJjQbIMtHc6VLJWEyJMvunNh4Cr3hWw8PbaRLvzsALkBx97XJkuxtCpqFA?=
 =?us-ascii?Q?KcnxNe9zMvXoDlXAU5rttBKzE9KvTtdUvU0DZ/Mrb1DFe7FX4H+lpfvnInQO?=
 =?us-ascii?Q?ngodF37LBY0KXQ9inkRwDEQAMuoeq0ahXB2ewHy7mtC7aX0AJz9dV+O9uDMb?=
 =?us-ascii?Q?QBifnlRqYt+Am9LPVUs0+Q9RCoQkckJQW8SPSdVmdElbRqyf43Ro6ELLFXkB?=
 =?us-ascii?Q?NqJwb/WCCIyLFb0+NFmgNSsRyLEGpsAShu5uMcPDeKjl+tEtRIMrOukGDdeS?=
 =?us-ascii?Q?DtH1IBhWN1zyjzegAB7W8YYOIF1eIizHBhGJ6X/whCWOALNj6aJ7LxoaZBVj?=
 =?us-ascii?Q?78wfKt9/fkjCbR+1Ly1vr4l2g/VZAoGL61L3SNUOrj6HPHUK9ZeXIE2TYIM/?=
 =?us-ascii?Q?++dMn53DOsa605lcVLmEBAjP/PBy7RyHwFrfrL2ijZcXx1yp+FdMLMF8j4Oz?=
 =?us-ascii?Q?PfwUVkfA3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y+TXNv45ZyLFvq443+p7ti3xD2c27mbEZpFjCKAkgGyr/m/ONvhLc/Vzd76G0GqJJVpH7dGcckUd8zJX2800bmFOHFhIyeTpn4/iUM48GhRCxmK3y4BEUzsjk9UqRttixU8mxhuAbjn+uQ0a6is25EnQL/Dd3sMMxTyHUBNOfOC1C8sjQdGfwtmv/H5cXLpmzDwF10nWLu3qoH/QPfvr6F90SE2Wa/Jw+zdKluqYtgDlLAxr8h3R2ZrNznQJO+eGzIQyN+Lhfo0/l1SPvNxoE4J34ig9PmdyEiSuuBN5iDfda4yM/ScdKeLudY3/XBIEVfI3YnGVEd6dFGyWfFl8Hg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a86bb1-fd99-455d-b945-08dec531439e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 07:40:51.1650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgAUnuswaDMhEPWFAnxfyTlFEoyT7yfLuIPq8MkBgYaz1A2Qrn6eMh/G8SyHO0ScYqrjYz5KZKk7oo1ZqV5zMs7197g8JJs6mcX6CP5lM20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_084101_878355_7480D290 
X-CRM114-Status: GOOD (  16.34  )
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

From: Wu. JackBB (GSM) <JackBB_Wu@compal.com>=20
Sent: Thursday, June 4, 2026 8:43 AM

>> Sent: Friday, May 29, 2026 12:32 PM
>>
>> > +
>>
>> please also take a look on sashiko notes, there is some number of them
>
>Hi Jagielski,
>
>  Thank you for your review. We have fixed some issues and are still discu=
ssing others with MediaTek. All of them will be addressed in V2.
>
>  Regarding sashiko notes, how should I handle them if discussion is neede=
d? I cannot find sashiko's email address, and its website does not have a r=
eply option.
>

I guess discussion is needed when any of the reviewers directly refers
to any of the notes posted by sashiko.

If any of the notes was not directly pointed out by anybody please just
check which of sashiko notes are valid and fix them respectively
if needed.


>For example:
>  https://sashiko.dev/#/patchset/20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57=
%40compal.com?part=3D2
>
>  Q1:
>  The commit message mentions implementing TX and RX services, but the pat=
ch primarily adds empty structures and boilerplate code. Is the patch missi=
ng the actual TX/RX implementation described here?
>
>  Reply:
>  We plan to update the commit message. Would the following be acceptable?

I believe if you want to check if sashiko has no any longer problems with i=
t you
need to send v2 and check that way, unless im not aware of something

>
>    Add the control plane transaction layer framework for the t9xx
>    WWAN driver, including configuration options, device structure
>    definitions, and initialization/cleanup functions.
>
>    The actual TX/RX service implementations that use this framework
>    are introduced in subsequent patches.
>
>
>Thanks.

