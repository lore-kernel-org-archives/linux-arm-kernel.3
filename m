Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B10ACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4l8kC1Bj+GgiuRgaWCOr3r8UJlzSs8VsA2jtucNHlA=; b=Ul0++gLFHeju/a8Jwl9c7lo4Uq
	RzwYAEbyftNDdLFIsZz49HtG6bfsBK4gumaw6gobQglxsIsnIr+fK3vcQBXZdI1w3RaJ0b8vYytQO
	Smjwldqe/+aR6NtFVlymXSyOP0tG1LvrvP0D72n2+ChXQh5lfiSRWlValpVy8R9+iw25BVQElNVl5
	FL+ezLPmPNxVxpV6EaVx0QMe78dCymdFgFtFfNWSnQ2YBNbcabuZRVcGZnHkjjlrczFwgjiZusgbh
	9dbEhVIO8DcOZLlXARFciCh8AwANvJ5ByLalRvwMBOovlBW1jEM7Ez2wCH26bgTZkAEwV8WN0gH/j
	FrSys7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TJP-000000029PA-13Y6;
	Wed, 24 Sep 2025 17:29:51 +0000
Received: from alln-iport-5.cisco.com ([173.37.142.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1TJL-000000029Mf-31sK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 17:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=458; q=dns/txt;
  s=iport01; t=1758734987; x=1759944587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=T4l8kC1Bj+GgiuRgaWCOr3r8UJlzSs8VsA2jtucNHlA=;
  b=GahuSNvnIgHNoVUgPFI6wiQLJP2YRcEXx7OAu72vkV0IVmbF/VG2SJBS
   mTs/AU7f/tr9YEZBeSMiIvX+POIo4DGveHvaXE3+ZezgYy80wZcS2ovv0
   zxhga1rq9WjxjwjqBm1MTxynUzg2W+eIU3venU/tWTZK/WxfYKTus+9Ti
   Ry47Xuodu9+HqQpqNsX7oMw+zccqz8BX2xAkfWKgkFa1dOCcfvmYfc7Qk
   yzs0iG9jhvTKdZZFUPh13HMhy22r9BKOzxdOm9BmJ4XkRJVbKhRfeXG+h
   /XYtddrqfewOGdcbPXhu2SD4W3qP18MkCvvAnX4qyBFqYNlEfo+IgtDaO
   A==;
X-CSE-ConnectionGUID: cCiVy5CDQpOjaWbRU54sOw==
X-CSE-MsgGUID: ekWzUY0FRwyeRYNhVFJWkw==
X-IPAS-Result: =?us-ascii?q?A0AHAADxKdRo/4sQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGwQBAQEBCwGBbVIHghdJiCADhSyGVYIknhqBfw8BAQENA?=
 =?us-ascii?q?lEEAQGFBwKMQwImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZaAQEBAQIBEig/BQsCAQgYHhAxJQIEDgUigmCCTSYDAQKpfQGBQ?=
 =?us-ascii?q?AKKK3iBNIEB4CaBSQGITwGFbIR3JxuBSUSBPBuCaD6EQ4QVgi8EgmZSkDCNI?=
 =?us-ascii?q?kgKYhYcA1ksAVUTDQoLBwWBIEMDNQwLLhUjSwUtHYEnd4QUhB0rT4IccoF0V?=
 =?us-ascii?q?0GDUx4Gaw8GgRUZSQICAgUCQz6BawYcBh8SAgMBAgI6Vw2BegICBIJHgRJaQ?=
 =?us-ascii?q?AMLGA1IESw3FBsGPm4HllaHA5Z7sB8KhByhcQQvg3GmepkGpFmEPQIEAgQFA?=
 =?us-ascii?q?hABAQaBaQE6gVlwFWUBgjw/ExkP3BV4PAIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:1to7uB1LiOglgFNgsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:t+PZlqD9EMYaUhVW/3Xiw5YqxClBgxIJ4kV8jS/XYbTApG8j02AEm
 GZLXzyFb6yKMTH8Ko1xPoy/808P75fQytJkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA7/h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyN5vMlBrFqEh4sF1CF5Ez
 8FFdCsqcUXW7w626OrTpuhEj8AnKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmsHgBfoO3WjPn8ME5k+leqjhVH0ciZTrxSeoq9fD237kVIrgOS9a4SEEjCMbchWoVSll
 zroxXvoDysrEtyh5xi68W3504cjmgu+Aur+DoaQ8v9snU3Wz3YWTR4bT122pdG9i1WiQJReL
 UIO8yYjpKR081akJuQRRDWxpHqC+xpZUN1KHqhiskeGy7Hf5ECSAW1soiN9VeHKffQeHFQC/
 lSIhNjuQzdotdWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:JAM40KOueErcesBcT7z255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHQYc2/heAV7QZniWhILOFvAi0WKC+UyuJ8SQzJ8m6U
 4NSdkbNDS0NykEsS+Y2nj5Lz9D+qj7zEnAv463pBkdL3AOV0gj1XYENu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVxUu2LQlM+c6zoodrNmJj6YRgAKSIGxWC15w+A2frRKTTd+g0RfQ9u7N4ZnF
 QtlTaX2oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweBfu1aKv+/lQFwhNvqxEchkd
 HKrRtlFd908Wntcma8pgao8xX80Qwp92TpxTaj8D7eSI3CNXYH4vh69MRkmyjimhMdVRZHof
 p2Nleixt1q5NX77X/ADpbzJktXfwGP0AofeKYo/g9iuM0lGfxsRUh1xjIILH/GdxiKtbwPAa
 1gCtrR6+1Rdk7fZ3fFvnN3yNjpRXgrGAyaK3Jy8PB8Q1Bt7QJEJmYjtYQid007hdkAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiTcg8Sj7wgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3f071E8WB0JBC7xiISmSgWjbmzN1Y+vFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTGPPnJXuGI/cB4+Q/YeglFZAzarxjhj9gYSP6niviEPyfitDm
X-Talos-CUID: =?us-ascii?q?9a23=3ALdDRjGrx/08WwMwVUGI30ynmUcsOc0PMkVz8Gle?=
 =?us-ascii?q?fC29WQoeoFAOL37wxxg=3D=3D?=
X-Talos-MUID: 9a23:AZC1/wuvh9nKYTf/bc2niTJdJvpZu4qUF1EAq6Qgu/eqFxNzJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Sep 2025 17:29:39 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id CC11F18000160
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 17:29:39 +0000 (GMT)
X-CSE-ConnectionGUID: gPWyVfTLT22JIm1DU9/uBg==
X-CSE-MsgGUID: sAQ7NA6wQouqj9FtoOeFTA==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,291,1751241600"; 
   d="scan'208";a="39253471"
Received: from mail-sj0pr08cu00102.outbound.protection.outlook.com (HELO SJ0PR08CU001.outbound.protection.outlook.com) ([40.93.1.74])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Sep 2025 17:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exHJ9iYTnZaXOgz1uPIeiGlfPvpm1hJD6OhK48shYYNolqUhCOjDziklMIDI1z06NUfGro2LgM7TGJrhoQpzGKFSG/neFcTQZxI3Znf0dfYoU+XkUUoh+pOGnqX3su6E26zYrjp7A8YQEZsriyWiFAvnEFVfJ6gWTmQHAjlATrVjh1oF6SdrbIA1JFC7oLaE86CmxxupzuSkSR4Vl9dBRckQCHhnRuBEthSBNCQCl/3m2MbxM9qfNEwvzrff+ME5hoQdWOE1KM07xQSKA1rQH6q2nJRHpo1OkzsrRENJfqk5POeKFVXlikU+vpe2mCRImVANXVsdRgiAoHrlg30HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4l8kC1Bj+GgiuRgaWCOr3r8UJlzSs8VsA2jtucNHlA=;
 b=WGFX6NEZgX9yYEQftwSOWWa6pnq5OBmJ76KEYdGh6Th6hExSWpNV8Jjg12qps81lMT+8yBgP65G6nCleAcPrf1VD3inD2MprUeMn2dK8fDpW9egTuUfTdM1R+tMjybtoUYIQEfPKZKsr4uuS8o0cx4GMZUUWAtxBMeznQE/D3Jx5e19NgFBzQBZEB7XSlaA/+HL/wT8Ok7FuRJMv1QeUqr+NgVufGEWBZ/fgL3bkbQOelgTDgUjhVK8JWwLUF6Sejav5ld6rPLQYC4QPrKVuiqDHmdNU7xGF/jYn+uhrmjLKB7Q0ZmxXOgduX8pGQY3wtF+Kdp9+hH2qxrFHgL+dlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Wed, 24 Sep
 2025 17:29:36 +0000
Received: from PH8PR11MB8108.namprd11.prod.outlook.com
 ([fe80::24f9:339a:70bc:39b9]) by PH8PR11MB8108.namprd11.prod.outlook.com
 ([fe80::24f9:339a:70bc:39b9%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 17:29:36 +0000
From: "Stefan Schaeckeler (sschaeck)" <sschaeck@cisco.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "schaecsn@gmx.net" <schaecsn@gmx.net>
Subject: Re: [PATCH] dt-bindings: edac: Convert aspeed,ast2400-sdram-edac to
 DT schema
Thread-Topic: [PATCH] dt-bindings: edac: Convert aspeed,ast2400-sdram-edac to
 DT schema
Thread-Index: AQHcKZ802JEjjJGaEkyYuLZKcCcm1rSelnGAgAQGvYA=
Date: Wed, 24 Sep 2025 17:29:36 +0000
Message-ID: <60D59E9F-B7AD-4A2B-A3F0-AE15EDC6B89B@cisco.com>
References: <20250919195326.2079446-1-robh@kernel.org>
 <0fc79e55e5fc0f8a43586ac3f90599b8f2a6c817.camel@codeconstruct.com.au>
In-Reply-To: <0fc79e55e5fc0f8a43586ac3f90599b8f2a6c817.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.100.1.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8108:EE_|CYYPR11MB8358:EE_
x-ms-office365-filtering-correlation-id: 5a03f50e-3b36-4201-91ec-08ddfb8fef15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|10070799003|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2CPPoivqXCAGpj3Q84r/QfUQyQ/DXF6JpgQyZixkTY3Y7qbtN/KSHuRdpIvj?=
 =?us-ascii?Q?buCGbX2EgC0zw1rRwLi+NRuHdOMfqjR0ZmFudfVTfqmQpeavUqgrAWqmrFN/?=
 =?us-ascii?Q?+JnI7prV3mluGnUgLZwQhN3jwxf/sVk92vj9sNHff44lsl5MPpz3/En/RiUI?=
 =?us-ascii?Q?WwqAOF3U5PgdTsNdN8ajtqMT1//hnchgIgyDKgzpwIP0GQYNOnvp+fdTnHIX?=
 =?us-ascii?Q?WoE8Sj0ciW7QfeTP8xFStaZR4BJjwfcDFVI7SNFpw8yihx/c6i0/dtmVRX6+?=
 =?us-ascii?Q?kimfe2ICv5Y0fDB95kabQcEpMFcYehhgXoXvTXX+/qsCMY0Y6oRiJ4Y5xfWk?=
 =?us-ascii?Q?BesF9aIhTpsKjcHAIUqXcyx6qniZEECrztsCV+ODwTGrF9qlRSnT13kAXC8q?=
 =?us-ascii?Q?kgY6KMEBt0+uRIRKgiUZlvQSAeCMrz3p6IYs4yKDwXDLkXfNyG0fQHiaUiHH?=
 =?us-ascii?Q?GDcIb8jxwIcsU6kGiMrI4xaUry99REcseRAQzgK9zdFSk0KvoMBlbD2rrn7j?=
 =?us-ascii?Q?10KqnyFvX+0mp7A9oLM62pCQUonC2WV9yIBCLW3JXfuSdekObujalyeD+v8H?=
 =?us-ascii?Q?JZ1gofqI9Ch4aO2Co0BaTqU1omH+IHdsI6t4yyyFyt+3F5JJQcp39j0zFlgG?=
 =?us-ascii?Q?DPYNfghQ8UB6GTyGOGmJBMa0S8q/dznTE9s4yHXqHsp6KxboxM8PkwLaebhN?=
 =?us-ascii?Q?mR77h8+Agfhk7QlzhAhpsEkBZ8oVZcw6gqRkBzsKXj8c2JMBVGYJucFn6MX6?=
 =?us-ascii?Q?V6fZ0oSYPkkNd3aiza16+xyV00ILEOgiDGfZVs+XdwZtG316khR3l66npuDc?=
 =?us-ascii?Q?n2R6ISAIyvsHPL1rc1EbtIT9n+2gSSWG2Uw/c6AzZtrIYLciaof4er7vQmv3?=
 =?us-ascii?Q?WlbCb053HCEH9NGnNYdmtzhm2PmsYwS/mi3b1Qrx01ZXDOsZzuO2QnynCYie?=
 =?us-ascii?Q?JiL8/+6PsAL2MCBxYznRZErQpmU3BX/Ybvsc5cGVP+VotW/fDTo8LZZs7rBM?=
 =?us-ascii?Q?X+N4DeT3HxgE7B1vkZMLf3XuMFL8vQbMjUb4EnQwY9CAYFrFm5fwbCsKzymP?=
 =?us-ascii?Q?2uA9Fuqg/r6rqN1Q35UilRfxJwTiQ8QQD3uWjCos2q2mPJ/FKMgnmvGCKcla?=
 =?us-ascii?Q?KfBctFqFTlbOd2SC0oWhZXRwFJUTr/gwuFp+W06ji84WZkyPqYj3fiudWop2?=
 =?us-ascii?Q?MaShDfaaDsuHhdmVCeq37Suvb+oUwTbtM4Szo4Uob2zXLaEKle0Gu9+uLPYW?=
 =?us-ascii?Q?OUdAZXLaIgGh1ZwDEM2ciykMSig1YlfC2P6mGlUVRBXluQVuuNYmZ6EuS8Ss?=
 =?us-ascii?Q?YHoBFB4+bfdlu0u63Z5RWo0sLziDNrXhuWK5mjG1HXHhOcb+PMeYSh53xoLT?=
 =?us-ascii?Q?OLLHx1+FGYY6TDovEbwqC0E3jMu6whaZyu7NRIC08nJ3jhzw7q7zQetnZz3n?=
 =?us-ascii?Q?AvdxfH7wly32iUqydm4KSKvkHtWPk/TDdZesecYdK0wIbbkgSYN+EgKGS2fe?=
 =?us-ascii?Q?/uIpEdmtSP2VgGw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8108.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XE1B9hZhC1Fgfz4/UWHyM6/N098A8QoePbWZ8MXR05nCXcef1pnFiR1U1e/D?=
 =?us-ascii?Q?dUbVJ878tKxqDu+6vgLr+qXdCJiIH7tk+pGWSFqDTJM+4jG/sEa8uhwlFpDF?=
 =?us-ascii?Q?7v4HPZXSp7oTxDiHvEM3Yuuna1nJ3zK2s9O/SWtTEF4TXod5jnJ2UDQvDMYR?=
 =?us-ascii?Q?kXB8ddBLT35hjrowDs2PYwpNinrAYqMQuyENXmaTAH7wd14lSPuw4xuKuA8/?=
 =?us-ascii?Q?VK/s5UuG9vhZCQM5zOr8kmv/a/g4kZBL+6BhR0SMehPjEDpYhfEdsVyAr67m?=
 =?us-ascii?Q?znSIhfqMk8Z21cisr1XSjVWdQ6zgMDiH6dpCPOQusU9j78buii+glVbn5UBg?=
 =?us-ascii?Q?rSiVAXwhOoppzyH4NvoapR0dmitxjWTSlMWRIik2A844F7CJqapWhkUiyNTf?=
 =?us-ascii?Q?LICCo8ceyZtbq3SIzr5f5UrPyhpo3SleAbKp5UXxb2GCr8zzSF2bh41Mg0F2?=
 =?us-ascii?Q?Wz1pCHQN3J48uGJlodsI/re+AqkSSppNiC+luzzqqXRtUk/ckFZLO/QR0Avo?=
 =?us-ascii?Q?h9pIJJJ+a/cr8M1E9vG8Wm/FI8VQ3t3EwJN/KailDwpk2wibnD2vsG4na5xz?=
 =?us-ascii?Q?okyf1ZFCBD9zripRFfADv3LsmUaOWWY7/Yv62Xhq5SwUagx3HI36/YOIB7Xt?=
 =?us-ascii?Q?Jd5Hk9ScpIfzEwddrft4BGdXmd71r4Je88cToMlXaGJ5SiVH1RWaKHx4aG6R?=
 =?us-ascii?Q?tcNtNA/kLwLarpJo1RmMn3y+LgC9Ln0Rxf+imPhNaklqkoMJxFObwvqbsC3J?=
 =?us-ascii?Q?Sco3H70SpnaopuBcOO+v5gJw9jZIehthbscUjtlp3sQjZ6WyiN/PvbnrkPyE?=
 =?us-ascii?Q?Rr5N75BUutZ99OjpZIXaqZjrqP1eonM9n03Dh36h6yvl8inuxPWAY4Xlmbj1?=
 =?us-ascii?Q?/nCRjoqwcKylDEAFutNnvLz6DRj4JU1dQIk9Nhbpnfyn5GKb1ZNHo7m7eXAi?=
 =?us-ascii?Q?8hCaY/ULuwRL5oRedKLdMIjLLDXKWfSPLZRmufFHK9wV6zuhG7g7CwOXVWQH?=
 =?us-ascii?Q?RuLsceKY6aA/HJPRxYuHjgdqgVYAz3uoPXMb8UIUjRtkO9vk4aFEIge4bl7p?=
 =?us-ascii?Q?mOddGAhtHQAp9BwjjNa25bMckOFJ6GmQcEFkaDiwfxfsAAip34d3zygZV+0M?=
 =?us-ascii?Q?N/pkk+bwZ+7pdEljge+h8oXfzSVkPPjzNsQ7mMviFf9poEwgUb/PIn3BtQXt?=
 =?us-ascii?Q?bb0WM13I/n3Q+Tn7+FJ/vur/yqXVpNJ4lTVdhhHDCg/H2MqJaDuwhfgVWVQz?=
 =?us-ascii?Q?Oa9e6y8kCbXv8K9RhBmKabzOlHkMvfXhrHf9X6cQa17GMgJNq6Fh94MflSbA?=
 =?us-ascii?Q?m7Edauu0Vhw8xvzFQ8Ft6Kbc+m6HsdVqliNJiGNaVGxkpFI43Z8pNoTnYH4+?=
 =?us-ascii?Q?oAsSNQblUiVNdKo/EM2F/YtJGR3oHLdi8tNYKuNXt6+agt/qlba9fvoP+N1X?=
 =?us-ascii?Q?XpbFUw//qDdEA1wQzm3Hn4dGzf+5+ibwHUT4a+CSjcKee7QohWcmnPjiGjkA?=
 =?us-ascii?Q?v0RM2bIIOrvQeoigO9aQH9DaeoZaYTxUjTPmhpQmu0nzfWtrqauQHDWuiNaC?=
 =?us-ascii?Q?BSmkPPnYM8I/0pnLGf24cFVOtMyGN9OPvQMrmxN1jtm0MYIurnESNPTXZlju?=
 =?us-ascii?Q?ZP/MBoinYhX6hNfRFq2HkAgM5BuiUz4aYQB543cYONaR?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDE87D521D42AB49AF5CCA71A6B06C8A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8108.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a03f50e-3b36-4201-91ec-08ddfb8fef15
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 17:29:36.6455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eZzLNZ5vpf1xOm7OthjfUIdGqi5/uv+wAQCzZzn2bqv60DCLZOEDAuo8h38gpZ4bCPDOES1mkEwgBS6y7awiCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_102947_844376_96B2F1A5 
X-CRM114-Status: GOOD (  10.81  )
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


> On Sep 21, 2025, at 20:56, Andrew Jeffery <andrew@codeconstruct.com.au> w=
rote:
>=20
> On Fri, 2025-09-19 at 14:53 -0500, Rob Herring (Arm) wrote:
>> Convert the ASpeed SDRAM EDAC binding to DT schema. It's a
>> straight-forward conversion.
>>=20
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> Thanks Rob.
>=20
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Stefan Schaeckeler <sschaeck@cisco.com>


