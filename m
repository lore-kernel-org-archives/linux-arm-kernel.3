Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1189CD11713
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R9sfGpF36Jydqs6uLDP/LAYXqW3UYrmBqs6At0mVZDo=; b=SU2IDSfHJtffuQUIhgMafYafkt
	iOKHH06G8EeiiyoeIvMBb5dIOmBeS+wGpT2VCnfJciZl1dKCxZ5EhCxAyC1HBSWYQt7U5u02vThPX
	2nV0nZhZIgqin6bVYD7Jz9aNEyTraCwW3rA1OBUEdG5l2poqF0KZX5T/KJ9ihQVheRCBOd0MP/bEu
	Tx8C3yuwKhWhrG4fju7xi+pL7PmRzQ7xOI0/5izHNNSnKhkFRWggKe9W7SSLkj++Ki/IIFm1YO2l0
	PvTXDZOXtruF7lHs1ZgNU1fHna5A+EPIz1XBtBE4NijK9LCIScjDCeda2tVNxTtCw1l0awegLNmuL
	m4tPFx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTnu-00000005eU3-2BzY;
	Tue, 02 Dec 2025 17:04:42 +0000
Received: from alln-iport-5.cisco.com ([173.37.142.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTnr-00000005eTK-2G0d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 17:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=801; q=dns/txt;
  s=iport01; t=1764695079; x=1765904679;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=R9sfGpF36Jydqs6uLDP/LAYXqW3UYrmBqs6At0mVZDo=;
  b=fZuzPULPRwgWYgB66undz7Y2HVCCNHgUOxK1458zITvUewGlmKS8QmgY
   R58ypR/jrt8QDYwTYvwUfcQCY0iJm9EPooVIQl9r3gRCM8BV6mRx+odm+
   sHxMCLlbIE4THU+ODsDhemvJIrPHH0ktWiEGZsuR/Y3NVBWcGkF/sSMvj
   LjMEmsg5hPVVn0eqbVaJWlTpELIyGe79Avzrw2mw2/ncS5lQa2xPoHcQY
   1JABiLAomA5UC3+Q6+x7DaxnqMAms63h9i244ZQ3PcfDU7aVrN44cGxAQ
   akbDBTDvXQk0NJNaw//Br8a9aXgmetAotXcz7Z70dxOl6QK+UR0YeablR
   A==;
X-CSE-ConnectionGUID: S8YldYiPSk683aOjmHLUpQ==
X-CSE-MsgGUID: 7LP7uRgWTVCZd9u+bzicaw==
X-IPAS-Result: =?us-ascii?q?A0B6BgBKGy9p/48QJK1agQklgSuBblIHggoSiGkDhSyIX?=
 =?us-ascii?q?IYajHGNLg8BAQENAlEEAQGFB4xnAiY3Bg4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4Zchl0WKD8SAT4gIScEDieFVAMBAqQWAYFAAoore?=
 =?us-ascii?q?IE0gQHgKBiBM4hTAYVuhHgnG4FJRJAEBIIigQ6QHQaJNYFKHANZLAFLCjUMM?=
 =?us-ascii?q?4EwA4F5PGUSPz6BC4EUgUYYgnAPBoERgkGBDgaCeYYYD4k1gSEDeD03FBsGm?=
 =?us-ascii?q?EUGQAGDN8ZxCoQcojeqWJMpgnqCY6kVAgQCBAUCEAEBBoF+JiuBLnAVgyNRG?=
 =?us-ascii?q?Q/WWYE0AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:DE6GRh8LGnwOIv9uWBDoyV9kXcBvk7zwOghQ7YIolPcTNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:gJRKTav8jtxv+1bvqQwoY6CasOfnVApfMUV32f8akzHdYApBsoF/q
 tZmKWzUP/aNNmX9eop3bYS3p0sBvZWHytAyGwRrq3gxQSMXgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYDdJ5xYuajhJsvjb8ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwbZGBW1/9
 MQjK25dNRmkheeW5I+jc7w57igjBJGD0II3s3Vky3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgx/5JEWxI9EglHzejtZpVaKrII84nPYy0p6172F3N/9JIfTG5sPxhfGz
 o7A1zvdOk4HDtOg9QSuwH79m6zFjyLwUZ1HQdVU8dYv2jV/3Fc7DBwQSEv+qOO8z02zQdRSL
 2QQ+zEytu4z8kKxR9XwVhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9cQfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:xeC4D6j9bPnUiiOA/m7uaUZpa3BQX5p23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7SdW9qBPnmaKc4eEqTNGftJGPghrlEGgQ1/qc/9SGIVywygc979
 YsT0EQMqyLMbEXt7ef3ODaKadv/DDkytHUuQ629R4EJm8aCdAE0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRZ0/VLXLOlA1G8L4i5ngkpXgbRQaBxghxjWvoFqTgoLSIlyz5DtbdylA74sD3A
 H+/jAR4J/Nj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVIQdS5zXAIidDqzGxvvM
 jHoh8mMcg2wWjWZHuJrRzk3BSl+Coy6kXl1USTjRLY0I/ErXMBeoh8bLBiA1/kAnkbzZZBOW
 VwriSkXq9sfFb9deLGloH1vl9R5xKJSDEZ4JAuZjRkIPsjgflq3M0iFIc/KuZbIMo8g7pXS9
 VGHYXS4u1bfkidaG2ctm5zwMa0VnB2BRueRFMe0/blmwS+sUoJuXfw/vZv10so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCbKSG6XXp0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdduXQpc0zjBMWS1NlA8wzLQm+6QTPxo/surKRRq/n5Xv7mICeDQFchn4+ppOgeGNTSX7
 KpNJdfE5bYXBzT8EZyrnnDsrVpWAwjuZcuy6UGsnq107D2FrE=
X-Talos-CUID: 9a23:piLhKWxeeithCn3P1t+LBgUvSvEhfkzc9EzTfR/jAEFrTZ2xdEeprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3Aht+kxw7tbzBHafVIpZj8eVcIxow3x5zxFXoCrqk?=
 =?us-ascii?q?4kPuIZDEzMSWchz2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Dec 2025 17:04:34 +0000
Received: from alln-opgw-5.cisco.com (alln-opgw-5.cisco.com [173.37.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id CFE391800012D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 17:04:33 +0000 (GMT)
X-CSE-ConnectionGUID: q1AGIfKFSuuO8HZsgnYsig==
X-CSE-MsgGUID: n98xK05nSVWxesWU5D7h2g==
Authentication-Results: alln-opgw-5.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.20,243,1758585600"; 
   d="scan'208";a="37998051"
Received: from mail-bl0pr07cu00104.outbound.protection.outlook.com (HELO BL0PR07CU001.outbound.protection.outlook.com) ([40.93.4.4])
  by alln-opgw-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Dec 2025 17:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzsNQyzYn8d0aGtDCZEk4+duQEsS8clftB5JH8MzGEzsbMdonrtbcUcYqgvYxJ9+ojE1ixUXsEehnHGZdXjGv+xkxAebS/A5U0J+9zsVKmJ7b3sFUnog/rAxSPHx2lxEFONPRyVl1211e7fXUF3b3S5nYFYJqlT7Dh0lpjTnir5O1aLtSEAGhU6DSD+7nYYsSs8XIVbeDEzFH0e6s9KlZ8zUK1HCjt4CXVGKA5giRSMwXArYizAtooV7fQDpV+ZGsvFk7CGKR4NR5szvobOV6Njlsok1uMZMT9K2IEeMTFTfU6rwN9NHk479UhPimsFEEQKTRHSuWoGHFvTCBjIT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9sfGpF36Jydqs6uLDP/LAYXqW3UYrmBqs6At0mVZDo=;
 b=PB2JycFi8dZZn1Yf7OADlvgzsPDM3X6O+M0oyOM+csE8ziKleJSwgIoldHK+8ezDXh/1b/tXwufMWLdZkuQms4AwNsQ3Fzoxctc9BumWyoOyERInU13MJoo3MoZ2c2JG2kcr6whKTirSvj767zSUguzm32A6gN6vNp9jTzRcZenZIy4Tx549wpPP4nvsmK1UcJAfb9L9d+nl51yD1EsaXHV+hSYN8eUnUVrWIDnmjISfXxePRuQIm7QDvvXJIbT7fnCY4Ez2gQgwzu20sM9uRHAdIkcoHvKXICrda+h96oUsGBhOXrVVVTEYvT7rcPRxSzm+9MuPfxeQeUmoxHlsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:04:30 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:04:28 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Michal Simek <michal.simek@xilinx.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Gopal Saha (gopasaha)"
	<gopasaha@cisco.com>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: i2c-xiic driver changes from Cisco
Thread-Topic: i2c-xiic driver changes from Cisco
Thread-Index: AQHcY623j0lJJ9vjrUK5RiRmbr2vpA==
Date: Tue, 2 Dec 2025 17:04:28 +0000
Message-ID: <aS8cG4Otywg1kIcr@goliath>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|IA3PR11MB9037:EE_
x-ms-office365-filtering-correlation-id: 7171c0ca-489a-4a70-fcdd-08de31c4da61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?UnoLT+TaDhBwGgU+J3Kog5bZf9+PGj7LBw2yHh/cMR/ST//TY/GolagtdRkw?=
 =?us-ascii?Q?SHKgA3Bxi1pBgMrmBqjwRf6iVc2EjWhShNr34cqxtH08oi1qgbCwYqagyQRR?=
 =?us-ascii?Q?mx/9CclKOOmj4FnvHAdLSEacE9cfvyZQMNPs2YEh+gMN/WMI3kiIXC3Ih5Uq?=
 =?us-ascii?Q?+FChXR6mMIbSd9IS7b8cwh73GY7NLuCUv/q5yIq0HawqnXYO1wLEtpJvzLUQ?=
 =?us-ascii?Q?9VvS4ktmkOET6H9saCc8AJOlJp8bi5my1NcIkyOzGsKim/2a750ej8f4dE31?=
 =?us-ascii?Q?xyiF97/svyphJb4mEbpnGi1OHYZm3emb8kPAz0OOn/9wqTdzW0bIo8SRXoxa?=
 =?us-ascii?Q?ol7RfeItAK6tK9XFuXUipaSXqmzToBwmSYYyV18oX7FoUKb241N2p1DSxRW0?=
 =?us-ascii?Q?RB+YkYyL+MKq0OsECSWGPGFmG9tQVnWqpJIqhwjIooC5zTJXsxHNQimIb5s5?=
 =?us-ascii?Q?yuJIb4QlLQXNff9+wXi3tKGRW5NpK/c68rKn5sMtZkZxwxqzH0JxYdmlh0Xk?=
 =?us-ascii?Q?1mHEh0hE82b6WLgaEkMPmCNwrtVuV2EfncIF5dMua3/7yOOwKLz3lg+T9L4H?=
 =?us-ascii?Q?JzfwgbeiTwWcrXBcplCZGa+rNN8KtT+o+DeFUXYWIK6LtvcWDUR4F92nsuii?=
 =?us-ascii?Q?QIUw35CU7NdZJcQqWQAXamDVtDJo/lV9EU6Uk3spM8CuwBqCqJziX6OeFkry?=
 =?us-ascii?Q?ojBfXPxVIi8+b4N7KeiYLmY3nvjJ4BForazGsEY6QEmtOQmAf3LSKdC9JuO1?=
 =?us-ascii?Q?/lP9/yuFKb0U+YdK5aHtBoMCTnnitWwQJE0oSsSeFCwnN+07TSNY+aG3MNkr?=
 =?us-ascii?Q?OPUZzjK1cHe8gZM4RGfclTM7H+uV1C/S89UGZXuaNv+bh9iZbCU6uxRZ50t1?=
 =?us-ascii?Q?SjZq8B74fftCtxM1MrwtYVgq75Dm8MEQW0C8v5mv2jpXReempnQ5V4VoOTMN?=
 =?us-ascii?Q?PbcTIWn51pcb8PNqtA4IV8IoUAo08A4Klqs25tB8k10it7rtQDbNeWuYN444?=
 =?us-ascii?Q?XY3HXiP1+WcLv3et/aST2UWABOQ8m/AKvzp5azwdabluzY7MsrpjJEj54FbK?=
 =?us-ascii?Q?DlI9iBCKvHdV2+wW+z7/UM34AsoDZQ91V6dOkM/QuTcdIQqumF/NR0ep9ErY?=
 =?us-ascii?Q?CZ7YYZtzzxLELD1tSu9vgKvaRMjfXfXW2hm0ymIFKXjbQ5KGs7/ftNLm6wQL?=
 =?us-ascii?Q?lKbmGr48Mt6nIaShoQ4Zx+I6ctJ9fHX/An5xgS6L88Y7FruBBaPXbB4rAxc4?=
 =?us-ascii?Q?l91MFgLi51o4KLVYCwGMEo8qxtY/qdAPfBQXdFb3RZHCCU8U+ocKNgH53yEE?=
 =?us-ascii?Q?aUupTjjW+LkSgCRIZbmkaPtoCWXrCA+E5J7joBxZPRveBsmb+g/BM9+fvOfT?=
 =?us-ascii?Q?VkEdJBZHqGsdJZVT0SrFqjwgCYYnhBwvWnIgcAVRfkSGAhqfNG4/6uV15Dv5?=
 =?us-ascii?Q?l49KnkFqBzgkEuIMgwHLnJppt018G0tZqc21VxG1YSN0UXDwUjN15GH93nO9?=
 =?us-ascii?Q?U48BlgOwvNSxmGfPVSomIR9FH7cyPxuhnLxO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IgpljbO1uMPUvXIGpp8TlWuLBXYPK5dEJtNrK7bT4A8zI7gc6+WDsRg+sBA6?=
 =?us-ascii?Q?D+efD7jup7DiiUhhgJzivfsuHI2ZWef0nZKLe6wjZpnnwo1erzf52AXuAr6a?=
 =?us-ascii?Q?mkIWwu2d4IVer1Rem9VxVM/EIPXHp9oUhflrKpPkv7Kq9T6AK/uPqrT3t8fh?=
 =?us-ascii?Q?DsZpV+LTW44LkSJOplH7NH7f6IdlRCefDX2ANcukC12iHnoR8/1N/HkwoD40?=
 =?us-ascii?Q?ox8+zbJ8/7CkVekHzVJGkNT+6KtTsTAtMayyfyugbfYopln1BG+lTd2pi6TQ?=
 =?us-ascii?Q?YwhhO9LjRsVhvjCwle0HTdhap23c4ZJ8R6O4Yb2Xao9NIXDrMdDDHiKvDv2a?=
 =?us-ascii?Q?0yW99YPjDG6riZ7ej30N2bZutTyi+95ECb1gt7cEaxOsYH3ZhVakT0Fw3zQu?=
 =?us-ascii?Q?aIw9mjO8D0NeuW5HmpyWCNXOTcrwuvnr0FmgA3Q+hin6TNflbt2ixpZz3eEA?=
 =?us-ascii?Q?ymjFHcvX/+y2bEGQlYY/EW97UBfAeXm7b4TADpo3lBq8kfEoyygxBQcmloqB?=
 =?us-ascii?Q?ObA1/6dGiUG0wZfev0KVHBhHNYhCU28w8GJ8zaVTe0E623GqBNsnFzgf/bzK?=
 =?us-ascii?Q?IslZF8/19xMEClrQ/nmSEjavWrV9soHzEo9877FPLwW3NEUZP3WrOqgF+ID2?=
 =?us-ascii?Q?3RDrFdiyy8OXU8xiEobesWyIYNsLH+6lUt+RUiM3EbTVsA4lFtlXu4KURoxp?=
 =?us-ascii?Q?XDY1/PTV+2TwKQJueVPHNOzsbEPeXFqmcHDEypuUd8QCYodnSJLYh8fS8hrX?=
 =?us-ascii?Q?8gc1m3BFXwGfLwdN1Xk51oe/esPWOV9HgAWpke1dZhjYhFEMBA0nqcGeCons?=
 =?us-ascii?Q?xx6lR1dVNcZuBSaIllNhll+1gFLbSxvshEhU52rEKGDbbPbkGwTDfTBS7aO6?=
 =?us-ascii?Q?oWJAuwnt46+ANdxb0Kfg/F/205znoj3k3gFykn3fvSdPI/E9u/58q+LYZF9A?=
 =?us-ascii?Q?U7C4tuXQ8eohWtlnXUKIk5UWeEMkFpb8GeVr05oll1PeUlflloIOmZo9Rzm9?=
 =?us-ascii?Q?QcMtZ56nAgL3VE2lUnM5EQHL1lzNXo/DJl/wbjNq6rS8jMleqOxhP55Avy+S?=
 =?us-ascii?Q?+gIz16RmYfcAXyt4sTHJP2auBwGP3jKck05tMB8SPE2YNEv+fw6DqdeoCmVH?=
 =?us-ascii?Q?z2HidV9f7bqoD7dfuFKvdFVMuGdZ8xjIPd6gYzuToLJfFA+u56T9CMUHEWhk?=
 =?us-ascii?Q?OZMQVB4tiE/0xNzH8TMylsfJ/Qpxsa4HrrGDQlBHhDL49qqLKOA76Qh5+8FV?=
 =?us-ascii?Q?ZzeobOc6gfkF8lvLFllxEzzD6efiGH68au53J5KIzOiF46DtLwcC/B88IwQ0?=
 =?us-ascii?Q?snqPpgogx83yZUqFBNyQG+F4MG6IaTMQymqmNRobubEipASZg5wy0fT12tJs?=
 =?us-ascii?Q?dck9rfvoBErcsLszdobkw9rxTNGpE3jfrOdA1H/bB8HwJBiLkjbQXT5PGXRJ?=
 =?us-ascii?Q?8WdFtN4k/8LOVbnicatBHeKkloEVa7v6WSsCLn4Q4DJlPmapOujTp2hUAdc/?=
 =?us-ascii?Q?hgAuKdvTkluK+VxzxlCY+gSCGPT5q1EwsLAnlOzd5BPS9OlVG3iLcXXcDUUT?=
 =?us-ascii?Q?CK3QKMb6w7ud4peZVl+2XEUFu1h0O2jWCMIO0kai?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E5947C780E5744A9D5F28FD374A931D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7171c0ca-489a-4a70-fcdd-08de31c4da61
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 17:04:28.0128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXc+82le61i+lAxbyVzXWBxVcgqQ1llRAXaAcD+AYlf9KFHbdLflMFCLlGBpIr1QYsdHhixRohP8K/XkHgYyKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9037
X-Outbound-SMTP-Client: 173.37.147.253, alln-opgw-5.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_090439_748262_14BB5604 
X-CRM114-Status: GOOD (  13.08  )
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

Hi,

We have a slightly modified version of the Xilinx IP which the i2c-xiic.c
sources seem to support.

We made one (or at least one) change to the IP were we don't supply it with=
 an
interrupt line. It doesn't appear the driver supports this configuration.
Is that accurate to your knowledge ?

If the drivers doesn't support some type of polling mode, is Xilinx willing=
 to accept
changes which would make the driver compatible with a polling mode if an
interrupt is not supplied thru the device tree ?

It seems like it makes sense the driver should support a polling mode becau=
se
Xilinx customers may make a product where the interrupt line doesn't functi=
on
properly. In that case the customer would need a contingency which could be
polling for interrupts.

Daniel=

