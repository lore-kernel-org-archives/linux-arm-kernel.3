Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2DkHBC9ODjQ96Nm3ewij7eO2weCaSekkyTaLJiKKCk=; b=iVeNxOWjCRDEeTLTdctkkoNjGW
	mwY6/3kZ4RoR2klbGNFReTJ4DV5qNMTn2R+hysrM10OpwfyqeAR+Sbs+pFhT0hCPuCAob9mCkHCvP
	/bTVhmJFwXfOoog9MFgx/n33pYKRTh+Cz6ALirqO45b0Nxd0ir9AMLRVZsJFrz/XcghbSmbtdDHsr
	tqpIbe9RtRkWRw24v7FYi514r6dzhmLkJ46ZS4JopvxN58EbE1nXQhpyd9+yiL5SQJMj7m31RjuPl
	/8kb6bhsmzK8Nvr+JFeM63E331JuxQ/iDb0sspcdmMr/Go9889Knj92SPDpgoVOijwoFzvNV8NewJ
	wrkzXF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubW94-00000003rB3-0Xvs;
	Tue, 15 Jul 2025 03:15:54 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubW37-00000003qbI-1UOJ;
	Tue, 15 Jul 2025 03:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1752548985; x=1784084985;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E2DkHBC9ODjQ96Nm3ewij7eO2weCaSekkyTaLJiKKCk=;
  b=G/rGC1YdQxEjeqmKvARrP3a5YpJvc4ZEbzVioovqSUNqv7sniYal4Gll
   vywWnU9CpICmEDj/V+FBANjlp8f3CTv1gPnYiM6m8oqpQFMgdU3kDrrlA
   9vAvo8onw3jOJXxYvv17ViXuPL01zRxAH6meCPVcMRG5msbhA7BNXjfM1
   j+btZoz2cb1aYNq+FGWgytdurW7SKU7y9Pd3pjTfHupqOU5l5HR4c/hPN
   xIAE49SkPhlL0tUJtUywmZNnUrj3ECVPKxm2ErdkgWgROfNQ075zAzOEG
   AAdxW/KpnjU+Nj5gvSxXYCd1VISzi0QtERPInvuZqw6YpQdewIIlRTUha
   Q==;
X-CSE-ConnectionGUID: n0oLU6eFRvyb5OFUuEXpjQ==
X-CSE-MsgGUID: 7rbmUzn2RPK20iqULD0r7Q==
X-IronPort-AV: E=Sophos;i="6.16,312,1744041600"; 
   d="scan'208";a="87021533"
Received: from mail-dm6nam12on2074.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([40.107.243.74])
  by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2025 11:09:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQVi1CWlgmphEmv1THFOU4FJCcEFswltQwxH+oRfhCBx6ocr5oqkzVyqfOspTu3zdcj//3R1gjpRlJeAbDWmWJij1PkicJOYBtFjTTBxaRnvJgXGsN6dwP7TRD+7ifbKIRdxtnz+ocFV/QmXRPG7iwO94fYxFvuPsCs0YbcP5EvZlknDjJLRVIiYd8A3Y999vNuFO7vpAR3petYdAMVgYPcxqQOBsCg+kw4hcLsat6nT8eEkLPRMha840I+QDTYqpmUlozhhAxiJsQrF+ImHmPgcgQsiJcbqE2J4nV69Fjho50cSlrdHmEPelKu2g/8cUnbEOs8GBTLp1no+OEudXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2DkHBC9ODjQ96Nm3ewij7eO2weCaSekkyTaLJiKKCk=;
 b=rgaHcVpUTf6UyflbuRaNzBRg2tLmpei+Oq8KkPxOuAB/F4HzKtKB3naKHytJ8uAWajQ4Wwwh6uK4ADRkQ2RAfe0M6cndf7JIlJOT7r8D7hxZDQaSJKJilbHnwH/7G8k2sWnMNJH+VsRj4VMyAbY8gbUZcbfGLpC8vq/CbNX2afh1dnM0XOrQ6VIVXRMP5orVglPm/7T2sXpOA2fhwQiHLQ/oJE0TRmdB+xqnk6mkKfyUqxIyKV9Oflse0/Sxw/gvLTkwfVWZr3b+5YLDtzOM2llaala/HZpgi9q90M4bMBTI/8p0zI1RY0zCYgVfPJ2bYVyqdIlsxgs6/DvxHlmpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2DkHBC9ODjQ96Nm3ewij7eO2weCaSekkyTaLJiKKCk=;
 b=HMMuhjJ42LxSa/WGspKmC5ZBtoZJiLblf7gix2Q3rXBUzgAM+CTtHxY9TCEcCVQEXJEgk/WVd/YPE7fMwK9WMtY0b+vlm9smi48+oErcb9ykpK+M+kEL6tZyNAA2HTs+NGozOq+DMrLxnuWt/Xu2y5XurGjGH5c+JdnU74KZtl8=
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by CO1PR04MB8298.namprd04.prod.outlook.com (2603:10b6:303:155::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 03:09:40 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 03:09:40 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "david@tethera.net" <david@tethera.net>
CC: "dlemoal@kernel.org" <dlemoal@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"alistair@alistair23.me" <alistair@alistair23.me>, "cassel@kernel.org"
	<cassel@kernel.org>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
Thread-Topic: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
Thread-Index: AQHbwIpZ70Uk8zYD6UqKMlfLq36i/rQt6sSAgAT/9IA=
Date: Tue, 15 Jul 2025 03:09:40 +0000
Message-ID: <f083038e43899cbe17624bf10c8d118fe92bec29.camel@wdc.com>
References: <87cya6wdhc.fsf@tethera.net>
In-Reply-To: <87cya6wdhc.fsf@tethera.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|CO1PR04MB8298:EE_
x-ms-office365-filtering-correlation-id: 011bbb30-87fa-4bd5-8454-08ddc34d09d7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SVJRRk56NElHREdrRGNXcm5SbDZWRGs5WVJrMzNYYnM2N2Vpcy9CN2FRMzBv?=
 =?utf-8?B?MW11cGt2OWZQL3Y5TFVyM2FoUVJMT2dZRm1FK1FhRHJKekUxeGN2eUdoakRI?=
 =?utf-8?B?N3loa3RVUWprM1NCSGRPd3kzZVBic05XYThWMzBTUHZJdVhMQ3MySHFXRTIr?=
 =?utf-8?B?TDd1Y1JFQWdXOVZlcU5pQmpsN2FjNm04aVVIRGlGMnA5RCs4MzZIMmg2cThN?=
 =?utf-8?B?cEJQU3ZadmU3Smg4WDZRSmtScGZ6cDVDdmhlc0svejVPYUVwVkxTdzIwNitJ?=
 =?utf-8?B?Tk5UaDlmSlZMakt3MTlndDJNSFdxSlRjTEpsN3Ixby94NTFLSkNPb1lJSHRZ?=
 =?utf-8?B?UElZZ3BoVjZyekYyZzJsWjJCWG0rcVBJOU02dTBCRUU3aFVMUW1TbktkYnQ5?=
 =?utf-8?B?cXBFRGJabXlxaThLaTJzZTUyMGw1Y1ZMRjNIdVplYUVYdUtJYm5QRGlxQ1o0?=
 =?utf-8?B?eXQwalB0Q3RCNXljVkJMY1hwUEIzZU1Sc3pQem9oaTJmSmdGVUJRdjc0Qm1C?=
 =?utf-8?B?WWVxc012Z0tSVldEQVZZR2R1alBUNWRNd1g0alpQVnN5cjFQTWN2bkZNMW14?=
 =?utf-8?B?OFJXbFhJc2ppWWVOc3oyR0tWWGxnVmJ2QkozTUJ1YjJmRnZLcGdSeTk0YVNk?=
 =?utf-8?B?OUFYeVNkOWgxQlBCbXhZWDJuVk84RW40OEtVa0kvckhBeko5RzF5UVhkelcr?=
 =?utf-8?B?ZTRBQjVCYkhqMFVmR044Q0FXMCtwZXV2MGJwZjRScVFNa00wZ0lNYlhwQUM0?=
 =?utf-8?B?NjhDZlNhNGl5bnVldWRzc0h6Sk5KZkZwUXhWUytTYkhNUzZGZlVuZFRmWGRt?=
 =?utf-8?B?RmZVSGY0alZLZVFKbTNHMUVNOVFuOTJ6R0kvSUQvY1U2UVJ5NGJjWDU0dEJE?=
 =?utf-8?B?UE5RTmdOVXJKR1ZtelJPRU4wSW9wdlNHSjhyYitOQURyTlF0NlVvS2U1QVU2?=
 =?utf-8?B?TFdMOUJPMWpCc0lNOWgyeUxwNlZqK1o0R05BSDdTS2RCMzBrK1JGeDRJcFha?=
 =?utf-8?B?d3V6R2R0L3dXQmlmZXdIUCtxOTR6TnY5NTBZSFRKWExHQWZqRFgzT1c1WGI3?=
 =?utf-8?B?ZU1rWkNManUxVVQrUk1BSjF0N3BCM2VqdHE1TVlmNE5YM1V2QkMwM1hDb2Nn?=
 =?utf-8?B?WGpyb2tmdlNodzl2cklydHZSUVA3dndwRXh3bThYVi9mdjg4blJuZEh4UmZK?=
 =?utf-8?B?ZzFQSUhSYXB4VlhMT2pJMk44VzJBVTFsV1FlYnRjY0x4NDZ0YWhEaWw5Rzh0?=
 =?utf-8?B?dFhpcjdITHFyNHhBWVFSV0ZEMGpVM2NXWE5PTzJMNzJOSzNVRWRJM0M0SzdF?=
 =?utf-8?B?TDNxTHFjanZmb0FvOG04VjhaTlpic3dVN0w3aStSSzJ1WHJYbWxZRDJzNndz?=
 =?utf-8?B?S1V5QStpUGFma1l1K1VZTlZnNGQ1L1hrcnczQWFEeEFiN0hrNmprZ2k3emE1?=
 =?utf-8?B?S2tBbnRCZHJ4QzNaUDVMdGIxR2thN0tjTldxaGJ1dVBES2lpTmxIZFBlaDdY?=
 =?utf-8?B?ZFcrZXpLc2pyTHpkNlZOdWVTb3J5NmpuS1pzUklGdjdxa3BKME41V053TGt4?=
 =?utf-8?B?Nm12cHl2bjQycDJLSS9heGV4cW5wU0E0a2VMMGI4WEVMaEVLekMyd2pZUGJP?=
 =?utf-8?B?ekJZOEU0QTRBSzVITG50OXhMYUI4dm15Q3M5TEs2Vlg4UGdEYkNNWGhTaHJP?=
 =?utf-8?B?eGN6RTBySlY4Y2tDcnNQU2pudVZiRGZ6akhQNG5LSlBLNTIvb0tQbCtZbzA4?=
 =?utf-8?B?K3NkK2cvZ0R6bmRZMDA1am8rdXk3a1RqR2lZRlpqempEdGwwYVdFMFZKUnpY?=
 =?utf-8?B?YWF5VFExL0VTOUQvTzNuMlhmSkNVa3VrYm1hWDZyOHI3a2lzZWhvYUJpaG9r?=
 =?utf-8?B?dDRuTitZL2JwOHBmV3pNajlhcmpnRTRsVkE5cFBGMUhweEZGUk5UR3dmWnZ2?=
 =?utf-8?B?VjRiYlMvaHBPL1QvUWUvcE1hS0U1d0JkMFpTOGlhL0o3SmhsNVBOa0diSmJI?=
 =?utf-8?Q?7bndOsE9Ok6xFQWmqC4vLw8gYWX76o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR04MB8549.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkd0VlRxY3RFMGdHZmNkZlNoTzlWUjhWWFVudWtzWGpzanlkVWIyQ1pqeGZW?=
 =?utf-8?B?S1JQcm5oK1lXV1RyK0cxMlJtc1RvSzZZREcrUy9tTjduMElWaVV3czZSd0d2?=
 =?utf-8?B?VlFleTU0K25XRE9QU0gxaUxJQXVuZFptUDBpWldCaVdmbS9NL3FFOFJ6ZmpM?=
 =?utf-8?B?d05aSTlEWmJ6Lzl5UTdYMkVZQ0FmVExsZFJ6b3N1YzB6Qmw3Y2s4ZHpXaFpK?=
 =?utf-8?B?d09KQTVRbW5lNnVuTzN1SHpxUVpsNFVBa014dUYxK1RMVWxmMTZvNWJnc2Iy?=
 =?utf-8?B?TmhZODhsSkJkM2phMk9rUERxU2VoN0RleTllMlRtSDFsSGp1UW5RRkt5clVa?=
 =?utf-8?B?Qjg1SXNsaC9mblBhRnB6RVM2ckpkblN1ZXo4cUZOOEYxTkQ1cS81UzY4TENZ?=
 =?utf-8?B?WmRGL2tBRWlmd1lDdUNpY01aSWYyMU1qaDNMYmk2WHNVYS9ZQ1NRd3pzTkpp?=
 =?utf-8?B?a280ZzNWdjREWnEwT0ZhL2s2NTdhT3ZnSnc3NlBtRWRyVnkxcUpNS0RocUNG?=
 =?utf-8?B?WU9sNHFmN0dXZVlvMUN1M2V6a0xrQ3lhQU5IUlRnSDhKV3d5Z2d2bDRRajFK?=
 =?utf-8?B?SDBHWGlPZVYzTG1MV2ViOWFJQlVKT0RKUEtIbGFrMmxSeldSZHhDQ3lSU1N3?=
 =?utf-8?B?YlhUc0hDWlF3dEFJNGhBbmc1c0FwZWdnYkExQ3d6YS9GZCtaVmRKUlBIN2pS?=
 =?utf-8?B?eDd2RWNXU1ZtU0gvM0hyclM3MHRuaTY2WGFKZGdaYUh4d2FrRUxPUXJWMWxW?=
 =?utf-8?B?RkRkQjhuZW1sZHZtWGdoMERYek4xeWQzMkhZMXBwVTV3ZWNvVmd0Z3hqdUQ4?=
 =?utf-8?B?K0kxUE5EVGo0UGNoRHBRZFUwNElnYnoybFgvS2pzL0cyK2dJNnM2M0gwQkxt?=
 =?utf-8?B?d2tkU0huanZmak1mZkU2RDJBSjV2VkZMd2E1b2NTYXJ5OVBYSjFUS2dMYlJ1?=
 =?utf-8?B?L28zQ0RVRHVrR2Nhcys4V1d0SFhUd1NKeW9HL09mWFRCc3l6S1l5TlBvQjhn?=
 =?utf-8?B?WktKRXNwRjVuazZkYnRia0lrR2drSlgwUDNveDFvZnlOY1BNUlBUQk9aOFFo?=
 =?utf-8?B?MExKaU0xdzVyQjgvZjhia0FNU1NlUTlDemRoMk9oelEvWHZJU2owMjFoRmh1?=
 =?utf-8?B?Nm9ZUnBBdkJTM0dTbWg3NEc4SHFjZVVEQ0pjVkxUZDFXM3JXS1NFNVYzSzdV?=
 =?utf-8?B?b2pSZzdYZ21IbkZWVnliN25jTmhWbGladW8rSXd5RlM3U2pLZExJYWlxN05H?=
 =?utf-8?B?MzRNbW5BVXJOTzVHS1dQMnBNUHNnYTVCMHViUzJqOGN2N1BoT0d2VFpmSlRq?=
 =?utf-8?B?aXVzaEtOUmtvNDNOYnF0ZlFrME93TXdseVJ2cjRnSEg5WEYxWTN0RUh4d05V?=
 =?utf-8?B?bTdrZWxkSzUyUXdNYURZUTBteGFhZDR5YzU3TXptUXBwZi8vaVRxQ2hZRnVt?=
 =?utf-8?B?QjNQaG51NnpnU3pqQmJQM1oxdWpWdmFzYjFCclRhSFdUdWM1emQwM3MxOUc0?=
 =?utf-8?B?dnJCaDI0OStZK21rcjVYNkNNZHlRYk5rbjVkTlNmYzVjU2gvSUpYSkIvNmlE?=
 =?utf-8?B?VDB3OXVPL1hqb1dSMHdESmphZWRKL0c4WDh0bU5uTTUreGZmTHV0N3ExQUtn?=
 =?utf-8?B?RlBKYjNGWnA5ZURYT3h0WjI4Ty9YNUgzaFh5SFhnOGxjL3JLNHpRZTh0S3VM?=
 =?utf-8?B?VE84V2FHMWVXbW5VY1RmcXQ1ZzcrZk0rNytLTWlmMUdPelZjK0k5elk4dnpa?=
 =?utf-8?B?eWdPQnZ6TzhBVHZtVVVveEdneFQxTDhNMHE1bUhFSWZKRVdLWE1SRTJGOHhv?=
 =?utf-8?B?bmxxR0tBY0o3MjBBak4yc2t2UWFzOGtJWUJJRmtSdjhsMFpuNjNEUDlVYzc2?=
 =?utf-8?B?dmVUeG5YczBHdVY4aTQ2TU5JaHlnNTNIaTBBcFBkUGxKOG5ZdGRqSlJqQUF0?=
 =?utf-8?B?ZW9CY2lRajFLNUkxcGRyazBHTVgrMnBHRlNlZWJVVnJIRTllRStXMzMwWEdM?=
 =?utf-8?B?MjdvV3RCYzJ5a2pHRHZmanFCam1MMm56L2EzTEZJZVpBeVAxQkoybzBvZmNQ?=
 =?utf-8?B?ck5TSkpxS1Vjdm8vVVRYTFcvZXhvVGZmQzRTbGZ4ZXo4THZaYSsyL0loMkVo?=
 =?utf-8?B?cGJPdmk5endwWTdmOUc1UzBwQ01GVVZOejBJTjk2RzFUWXBwcGRuUitLb2xt?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DBC1C94742FAC499A64A7D8DBAA4F66@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fdhCDby0BvNPo7q+JrsYKGUhVqI+T5AR8wvILuhJQ/WZ5kxni1EKawzKLI3QYfmI+tpRAK774QJ+WkYfhdV1xqvpJ+k7MzJ1r8yyL8SpU97lENYSl94jhPeGFBRLpJGmaY5lejWoeTNpUN8rUTeFzBYGyIaWWu5AW6RTtriERzs59IEHxKjcypszpPSSNQKsVFyFQh0Csswg+EuDGP1awDH2vB4WN2PYmHlcXaZCHPyopZNUJA7fm9R+cP4sza328BNFG9kAoXksbVzfwNM4zlp9u/w4g2d9fHH83XQAiCfGPR/OJLXavQhJsLzhueiSakLYKhdSRXaFPdPidVXwdmjYIuYxv7c/k+1mNfUvir3nTKy3hWzpeUiEaIWMPU0XTRQdWgGTbHvGkEmjFwQwX47Ss1KQdOyBss7lm01n6i7nPpVibEh6ayeJZU/29wJT22aGRiknhPUSiaIwMDwT+pu8wT3k040hgoRVdKroCLX0m2CAhGrTNIfIe9PzE5WqK6Q836ADgZUbtbqeMRK5UFL0iNter3mMTp0SgccVP1KLcW3QDMEKmf6M5nx+M53tEJ98PHscAibSck06l4RlHZVAsKighUoJF6L1AEHSmOowqWx0rtg0nmp7s0TZky5t
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011bbb30-87fa-4bd5-8454-08ddc34d09d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 03:09:40.1251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bc1r0dpTsBDb42n5EVNVLCA7HqcMdFTT3zjXs1rwE3WblJHml+L8N6O6fJ444iTeKx9Nn8cm/Jg82cQQHuTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_200945_431143_EAD4C1CC 
X-CRM114-Status: GOOD (  18.75  )
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

SGV5IERhdmlkLA0KDQpUaGUgc2VyaWVzIHdhcyBkcm9wcGVkIGR1ZSB0byBzb21lIGNoYW5nZXMg
dGhhdCBuZWVkIHRvIGJlIGFkZGVkLiBJDQpiZWxpZXZlIE1hbmkgaXMgd29ya2luZyBvbiBpdC4g
SG93ZXZlciwgeW91IHNob3VsZCBzdGlsbCBiZSBhYmxlIHRvDQp0ZXN0IHRoaW5ncyB3aXRoIHRo
ZSBhZGRpdGlvbiBvZiB0aGUgcmVzZXQgc2xvdCBzZXJpZXMgWzFdLCBhbmQgdGhlDQpzdXBwb3J0
IGZvciB0aGUgZHdjLXJvY2tjaGlwIGRyaXZlciBbMl0uIFRoZSByZXNldCBzbG90IGNvZGUgc2hv
dWxkIHJ1bg0Kb24gYSBsaW5rIGRvd24sIHNvIGl0IG1heSBoZWxwIHlvdXIgY2FzZS4gV29ydGgg
YSB0cnkgOikNCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyNTA1
MDgtcGNpZS1yZXNldC1zbG90LXY0LTAtNzA1MDA5M2UyYjUwQGxpbmFyby5vcmcvDQoNClsyXQ0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMjUwNTA5LWI0LXBjaV9kd2NfcmVz
ZXRfc3VwcG9ydC12My0xLTM3ZTk2YjQ2OTJlN0B3ZGMuY29tLw0KDQpSZWdhcmRzLA0KV2lsZnJl
ZA0KT24gRnJpLCAyMDI1LTA3LTExIGF0IDE5OjQ4IC0wMzAwLCBEYXZpZCBCcmVtbmVyIHdyb3Rl
Og0KPiANCj4gV2hhdCBpcyB0aGUgY3VycmVudCBzdGF0dXMgb2YgdGhpcyBwYXRjaCAoYW5kIHRo
ZSBwcmUtcmVxdWlzaXRlcykNCj4gd2l0aA0KPiByZXNwZWN0IHRvIG1haW5saW5lIGxpbnV4Pw0K
PiANCj4gSSdtIHdvbmRlcmluZyBpZiBpdCBtaWdodCBiZSByZWxldmVudCB0byB0aGUgcHJvYmxl
bXMgWzFdIEkndmUgYmVlbg0KPiBoYXZpbmcgd2l0aCByazM1ODggcmVzdW1lLCBidXQgaXQgaXNu
J3QgY2xlYXIgdG8gbWUgd2hhdCBJIG5lZWQgdG8NCj4gYXBwbHkNCj4gdG8gZS5nLiB2Ni4xNn5y
YzEgdG8gdGVzdCBpdC4NCj4gDQo+IFsxXTogaHR0cHM6Ly93d3cuY3MudW5iLmNhL35icmVtbmVy
L2Jsb2cvcG9zdHMvaGliZXJuYXRlLXBvY2tldC00Lw0K

