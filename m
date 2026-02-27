Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBD8FEFB71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57PqtGUPQAEfY3piJYfwIojyKJM0e7yZmqSpwX1hj3c=; b=BUkyk11YsM5Af6jG/k2d3tVPgz
	JpLxH18RfxNyZu7Dbrypy7gQmqX2joHAKrWH9ilBmBJlheW0xXaGdQ1HKeW4JyXbFtakQCRIDWRPd
	pXIQ2g+T4QLvVaJBFLU/0xVAGT3hjf6JUsumdhfcF9tqgPvhAE1YffSk7orXq5shtahiCr8Pjef8l
	kqevG4fOiCaZAN9KWzyFXR/EgRTN/w5SXocp0RIxWOUmVF/yH5SJqgC5bdJVQ5zc3BF3JW9wA8L5k
	Jn5rqq2fDtPSBkvoDsHLFd68YLh91GIe+zNgKTc5uDCZTsy3VsHvogutAASjRPhdvC9wi31No2W7T
	SEDgkcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1oT-00000008ooS-2bS5;
	Fri, 27 Feb 2026 17:39:41 +0000
Received: from mail-swedencentralazon11013025.outbound.protection.outlook.com ([52.101.83.25] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1oQ-00000008omt-1aWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:39:40 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wx1q+/hE4i4GSUHbFZ5HCAo3+iGkrbxwwwYZ04v/ecWyKlM0brcp4BFuFziWoZbNFmmijAGVkZqf3QO+48YrMWoei7KmsKpRdYI9l03CGpv1nirDdSGDTy0TBKjqAvOUfYm0AhClpTLNvT66hGaOWdxWrl5sn8iULfMbzILP9OjcgpbchWS/v+xLTQu2vAmg6r762PsyA3l07fBan9kVg8lv6fMtlXAyFskPARsrAnebhJbvWJm29yx8twXx4VSqpSv+oH2KgSg+4sNi/e/DvwxQ5K4fPGrfsU9sbu8ICBt4kypML43JWnEniqp0ZTW53+LHehDAjuBphYlUcFD2Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57PqtGUPQAEfY3piJYfwIojyKJM0e7yZmqSpwX1hj3c=;
 b=nG7kGlXsuCM+QM1u2M+HHPY4i5nYZxc9mKl17KqcDuZu3LMb98d+SgXrRndZ3r9j3RelzEZHeb5mqrU6cIStAmHob3Qa6jwIYdLf8cXEk5yfoDzS6Mp/otAU2lPOxexTangSqJ2MYZ7IC7KadbanybyNInQEemVL9Yvrn2IQuN4lr63XadS43fZll4mPno+YfUE1NN4QqTv/u5O6EtTgjP1DVL7h8YQjRXIxq6800WzH+dxkId/CmShlAqjZQzW2ElXKEEiNtEKHe7ApqS3ZTUwW15AA2Bhp7E/m+OSQ756r4fthl8JsZHUqMyVF2h7qm14Ro2jhIeQQOI4wzel/CA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57PqtGUPQAEfY3piJYfwIojyKJM0e7yZmqSpwX1hj3c=;
 b=o09SiW5Qald4WuUQlJtKSxiu5R8sTdkcIkUxYqTENP7oUXacJthBdlFzAZ+VmT1HGMnzckZDgdE2enBgNrZgMLwC+9El7jrBhbPGdbg4qQ11/TW+kfr9GfziQJqJe2T5uaVDpN0Nor9BczpQQ1znqOUeOitdGUmsDsyJy0QSesM=
Received: from AS4PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::19)
 by AS8PR08MB9292.eurprd08.prod.outlook.com (2603:10a6:20b:5a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 17:39:29 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::66) by AS4PR09CA0013.outlook.office365.com
 (2603:10a6:20b:5e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 17:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 17:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Du67tSkpMIDAtqE0KbB/inv5Yz/QeCb0b5MOymry5KIECHqR8hllGgnvivmYBkx2RfRgV3jh8yWZWHJwUdyusiLgQTq8Acvrnh1Lxs3w7zvFq+Wi998+cP3KFRN17KeMLUV2FKqOu26Hpv89o/ps8hTdBx6BIIPLZGPLRqJDBL5NRfSE0wyU1OicXeWKXIhVSUdCz0C8taEpPDHZ/oTn2cdyEiMYHCyFDe7MWnFuKUGZw+6vz5FkcdIbweKzAnTITIjlRtKDtTvgSkN3wDY36Y1f3yS2mmpjhfYLh5qWsHpkg/iH+Eo/PCuxYkdE1aM/2dueFzWy4zHSFcAydKESuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57PqtGUPQAEfY3piJYfwIojyKJM0e7yZmqSpwX1hj3c=;
 b=T+X2Pulxt7aPyEINVp8F+qopOsLU2o4BXqaP9SDWHbRuuOwt8ZhMCQi5AGylsLEZHHXy1gUOJDCCwS5lIxZece/xyOdsSNTxj0uvBIQ0Tzs6orqX/5hDZzR9uI3ivV3XC2SqMASpcpNgh0DT2o/sQK3THg+xt3I9NZf8mW9Z0F5zVGZC2aXMiuAPwm6i1Nm6l313CuH23zwEKG+N+0oAgV4tbckVcJ1IjCt0Ww9XQogPxXxaVk1bwhHG6BJr8EM9BxjcZX7ZJFpLYV1+3oPmH4xlTvqk+macZYfsROf36lu6erBsOYd4zGnb2LlEilwVZtlavEkkmlT96kKMnGLJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57PqtGUPQAEfY3piJYfwIojyKJM0e7yZmqSpwX1hj3c=;
 b=o09SiW5Qald4WuUQlJtKSxiu5R8sTdkcIkUxYqTENP7oUXacJthBdlFzAZ+VmT1HGMnzckZDgdE2enBgNrZgMLwC+9El7jrBhbPGdbg4qQ11/TW+kfr9GfziQJqJe2T5uaVDpN0Nor9BczpQQ1znqOUeOitdGUmsDsyJy0QSesM=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by GV2PR08MB11345.eurprd08.prod.outlook.com (2603:10a6:150:2a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 17:38:24 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 17:38:24 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: Joey Gouly <Joey.Gouly@arm.com>, Vladimir Murzin <Vladimir.Murzin@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>,
	Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
Subject: Re: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
Thread-Topic: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
Thread-Index: AQHcp/Fud0nyjHe2TkeXDTGfKIHzybWWYlgAgAADnwCAADPRgIAABlEAgAAvvgA=
Date: Fri, 27 Feb 2026 17:38:24 +0000
Message-ID: <e5866ce078ec235b52cc4bb7690d068405a66bce.camel@arm.com>
References: <20260227102049.8015-1-vladimir.murzin@arm.com>
	 <20260227102049.8015-3-vladimir.murzin@arm.com>
	 <20260227110626.GA1980869@e124191.cambridge.arm.com>
	 <3048e8c5-c14c-45fa-ba5f-1346df084486@arm.com>
	 <d1f1eea815dad4fcb9eeedbef8e50af68e415284.camel@arm.com>
	 <c91853f5-04f3-498e-9231-eb3876471609@arm.com>
In-Reply-To: <c91853f5-04f3-498e-9231-eb3876471609@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5687:EE_|GV2PR08MB11345:EE_|AMS0EPF00000192:EE_|AS8PR08MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: ae55984c-2fc0-49fc-15e2-08de76272901
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: gZUXLDIJ4TlKCjsq5FTdchjz4N3U2qe05XAV/LslZ9XvC2D+QLJiB+SX5xbbTvfLL2MC0MZ/JiJU15HjNA7IEHWXFR16SdK9MGrj9h368duBCfq5dAFO//NXQs5sIkS4sOXuh0zicKEDwr/ArJRcA1gm7zmcdWRyZonxqVf6r+5kdEoDhjSzFzVEvylpCE7ctJLvYuW+KKuCnq3ZFweN6JaSO97QHxAYFRd/2juQGwc42ZGF2sTTKdoDRHP9amJ/9os/jFewmMICXz3GGHXgfJ7HKlKzAdP2vyGvqzk36GoVhskD6CvZ8+z5f0oAKu00WljXw34siAsM0ulkVPnwxw+N0AWveMVNS/iUhkBat7/vfJA9boMHQwoLST2Iwmp3qPZfrBmAFahctkyek8Fr+lXl2fhMb1uhuC+b/7mSM+Kq/KriyUCp5uz8qcRnUgz94z2AltVGPMHzB5v6Ur7D1YDzeftf6+E+cjVBujFtGNAvvB3hIHmynUcujBOZsQTZNW5Huy5Ft8XQuv0i9vJt2ggJmMBuTlHKwWhRgnGVWGudn+8Mak6rRPIAni73ddsQ762S8CIaM/O6oWjpsiDpiPg0CymVArGjac7qspWLxTvIf0kaLg1y+n9OJBcc7Kh0DKKQrz2nLjcVaxx/D7DWxZZcLrdsQIfMpptKzjNVMgs2JdwBLWOg0XINi45SOo2gmhj6ILbhWrmp+M8Z0EU7U9R65BdUW9we5oM3uX1n6shrkUroFZ8nd0JAtyyKgdaT
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4809962C7C6261429CA346ECFB2DF8D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11345
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f22d930-10d4-4af0-529c-08de76270243
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|14060799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: RKH9sYqAG01Rb3u7W5FbeTM6VtlFM4maGsX9xINKGsbiKMfTAbFAEvjfccBIZfNrCUL7hPj2en7PUg6cMHD1BI/TASwLBHqxI5eE0+OSOqjU7tf5wcUXzGTf73yKTZZh3hXzrRAbG14bAlyajfB2TloOC+wh2O93QlwbQEHxaB+f/tz1GnQ5ZWDuoG9viowJp3UNKZ99yUksgZK28ICMhbygVoxxClQUVI5N8hcN8VbZCk52lq6AYyNwa9YBYvOzVjbXGRioJeGWJBiKkVONWgbchJW+wpP23tDakUafWR8HYtixy5irdnh9Q2Mt8Y+nkktJZt9fSU/tKVD1r9PiA2fmo1VqYzQy6Qyh3+cnmfYJ5sJBHyTilUxvDx2JyIS85IG+9Shjn5ShcojZs5h+WOXjpbV5zEDxl6JmbBxfg8p8Ebq76+OwPknc/MItfUXJkNn13UEMbT2yhpuClREiOihZmJoi/N5uPvI2EiB+z9CH9IO7rpR3slPPcVreJsNxpsQxzwDvE2mtYvIC93vqQKyR1j/yRmT7UfK566b95ydoyR27+H8CXyb/Ln8FpI01ro8GXO1yVIa7uh28+GdZewTYxGJWhEoQkiAtOakWlNN30tcpzJWyx2wv4nm0mfMc4V8vwVWzLMVbFiX0WWIQtWq2Ni7BtrUjmHzqG/fRY4jPNsjxnBnmPcv8+Vtw+YXhK10q8P+PsIOTouVgzWVIBnkcorG3eclbLd7LkC0rvgPOI9XP702a/V7n7ilMLvQSjsCjkRJoGi7b7avtikpQVSygJN7vld/ydak3aMXTQs4=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(14060799003)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NcquiUK62VnvKg1TXpX40IfgnS9qhzlIYmdyrwjrqpz+scoBpXumr0JFjkW/j6zVt9XcetwO1WKOOqAFp2y0FxlNS3zlZIczAQqYpZGQrjlOLqjtd8h1wOZhqX5yF8X+aRqaYDFMNKL/yo+jnKZk5Genyj2cCrAonKlkQ9Wl8LbfqWxyKbxw20i6pDof//d9M4Js9zEvGKIp5CvyV1kDkAQCf+ZKR1djzffpHPocN++6bndMEersNyAAusLV3YzzXbb0/8XeWDgFm5ljIoHHemcabozf1rlW7NYFzCzWZQxCh0oTVYimoErXfqmDt4Ma62nc3h140UzHeKqaAQb0WG6c2jdDUA1kBwx+oR3whCpVrnOlge4Ux0IgMemNaArhl5PJcVwmpzG5PSphALkkugF2sn0mNpXP0FvXifp9nFZ6RI5JTg1UFC7k9pdiNRS5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:39:29.6426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae55984c-2fc0-49fc-15e2-08de76272901
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_093938_684986_F9A50C1D 
X-CRM114-Status: GOOD (  30.74  )
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE0OjQ3ICswMDAwLCBWbGFkaW1pciBNdXJ6aW4gd3JvdGU6
DQo+IEhpIFNhc2NoYSwNCj4gDQo+IE9uIDIvMjcvMjYgMTQ6MjQsIFNhc2NoYSBCaXNjaG9mZiB3
cm90ZToNCj4gPiBPbiBGcmksIDIwMjYtMDItMjcgYXQgMTE6MTkgKzAwMDAsIFZsYWRpbWlyIE11
cnppbiB3cm90ZToNCj4gPiA+IEhpIEpvZXkhDQo+ID4gPiANCj4gPiA+IE9uIDIvMjcvMjYgMTE6
MDYsIEpvZXkgR291bHkgd3JvdGU6DQo+ID4gPiA+IEhpIQ0KPiA+ID4gPiANCj4gPiA+IFtzbmlw
XQ0KPiA+ID4gDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBnaWNfcHBpX2lu
aXQodm9pZCkgew0KPiA+ID4gPiA+ICsJdWludDY0X3QgdmFsID0gMDsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMzEpOyAvLyBUcmFjZSBCdWZmZXIgVW5pdA0K
PiA+ID4gPiA+ICsJdmFsIHw9IDFVTCA8PCAoMiAqIDMwKTsgLy8gRUwxIFBoeXNpY2FsIFRpbWVy
DQo+ID4gPiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMjgpOyAvLyBOb24tc2VjdXJlIEVMMiBW
aXJ0dWFsDQo+ID4gPiA+ID4gVGltZXINCj4gPiA+ID4gPiArCXZhbCB8PSAxVUwgPDwgKDIgKiAy
Nyk7IC8vIEVMMSBWaXJ0dWFsIFRpbWVyDQo+ID4gPiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICog
MjYpOyAvLyBOb24tc2VjdXJlIEVMMiBQaHlzaWNhbA0KPiA+ID4gPiA+IFRpbWVyDQo+ID4gPiA+
ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMjUpOyAvLyBHSUMgbWFpbnRlbmFuY2UgaW50ZXJydXB0
DQo+ID4gPiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMjQpOyAvLyBHZW5lcmljIENUSSBpbnRl
cnJ1cHQNCj4gPiA+ID4gPiB0cmlnZ2VyDQo+ID4gPiA+ID4gZXZlbnQNCj4gPiA+ID4gPiArCXZh
bCB8PSAxVUwgPDwgKDIgKiAyMyk7IC8vIFBNVSBvdmVyZmxvdyBpbnRlcnJ1cHQNCj4gPiA+ID4g
PiByZXF1ZXN0DQo+ID4gPiA+ID4gKwl2YWwgfD0gMVVMIDw8ICgyICogMjIpOyAvLyBEZWJ1ZyBj
b21tdW5pY2F0aW9uDQo+ID4gPiA+ID4gY2hhbm5lbA0KPiA+ID4gPiA+ICsJdmFsIHw9IDFVTCA8
PCAoMiAqIDIxKTsgLy8gUHJvZmlsaW5nIEJ1ZmZlcg0KPiA+ID4gPiA+IG1hbmFnZW1lbnQNCj4g
PiA+ID4gPiBpbnRlcnJ1cHQgcmVxdWVzdA0KPiA+ID4gPiA+ICsJdmFsIHw9IDFVTCA8PCAoMiAq
IDE1KTsgLy8gSGFyZHdhcmUgYWNjZWxlcmF0b3IgZm9yDQo+ID4gPiA+ID4gY2xlYW5pbmcgRGly
dHkgc3RhdGUgaW50ZXJydXB0DQo+ID4gPiA+IFdoYXQgYWJvdXQgU1dfUFBJICgzKSBhbmQgTlNf
REJfUFBJICgyKT8gQXJlIHRoZSBsZWZ0IG91dCBmb3IgYQ0KPiA+ID4gPiByZWFzb24/DQo+ID4g
PiA+IA0KPiA+ID4gTm8gcmVhc29uLCBJIGp1c3QgbWlzc2VkIHRoZW0uIFRoYW5rcyBmb3IgY2F0
Y2hpbmcgdGhhdCENCj4gPiBIaSBib3RoLA0KPiA+IA0KPiA+IEkgZG9uJ3QgZnVsbHkgYWdyZWUg
aGVyZS4NCj4gPiANCj4gPiBJIHRoaW5rIHRoYXQgdGhlIFNXX1BQSSBzaG91bGQgYmUgYXNzaWdu
ZWQgdG8gTlMgLSBpdCBpcyBhIHNhbmUNCj4gPiBkZWZhdWx0DQo+ID4gc28gdGhhdCBub3JtYWwg
c29mdHdhcmUgY2FuIHVzZSBpdC4gVGhlcmUncyBubyBwcmUtZGVmaW5lZCB1c2UgY2FzZQ0KPiA+
IGZvcg0KPiA+IHRoaXMgUFBJLCBzbyBpdCBpcyBqdXN0IHVzZWQgaG93ZXZlciBzb2Z0d2FyZSBj
aG9vc2VzIHRvIHVzZSBpdC4gQQ0KPiA+IHBvdGVudGlhbCB1c2UgY2FzZSB3b3VsZCBiZSBmb3Ig
c29mdHdhcmUgaW4gdGhlIFNlY3VyZSB3b3JsZCB0bw0KPiA+IHBva2UgTlMNCj4gPiB0byBzYXkg
dGhhdCBpdCBoYXMgY29tcGxldGVkIHNvbWUgdGFzayAoRkYtQSBkb2VzIHRoaXMgc29ydCBvZg0K
PiA+IHRoaW5nDQo+ID4gdXNpbmcgYSBkb25hdGVkIFNHSSBvbiBHSUN2MywgYnV0IGNvdWxkIHVz
ZSB0aGUgR0lDdjUgU1dfUFBJIGZvcg0KPiA+IHRoaXMNCj4gPiBpbiB0aGUgZnV0dXJlKS4gSW4g
dGhpcyBmbG93LCBpdCBpcyBhc3NpZ25lZCB0byBOUywgYW5kIEVMMyBtYWtlcw0KPiA+IGl0DQo+
ID4gcGVuZGluZyBhcyBwYXJ0IG9mIHRoZSByZXR1cm4gdG8gTlMgZnJvbSBTIHNvIHRoYXQgTlMg
c29mdHdhcmUNCj4gPiByZWNlaXZlcw0KPiA+IHRoZSBkb29yYmVsbC4NCj4gPiANCj4gPiBUaGUg
TlNfREJfUFBJIHNob3VsZG4ndCBldmVyIGJlIGFzc2lnbmVkIHRvIE5TIC0gaXQgaXMgdGhlcmUg
dG8NCj4gPiBhbGVydCBhDQo+ID4gbm9uLU5TIGRvbWFpbiB0byB0aGUgZmFjdCB0aGF0IE5TIGhh
cyBwZW5kaW5nIGludGVycnVwdHMuIEl0IHNob3VsZA0KPiA+IG5ldmVyIGdldCBzaWduYWxsZWQg
d2hlbiBydW5uaW5nIGluIE5TIChOUyBkb2Vzbid0IG5lZWQgYW4NCj4gPiBpbnRlcnJ1cHQgdG8N
Cj4gPiB0ZWxsIGl0IHRoYXQgaXQgaGFzIGludGVycnVwdHMgOykgKS4gSXQgaXMgYSAiUGxlYXNl
IHN3aXRjaCB0byB0aGUNCj4gPiBOUw0KPiA+IGRvbWFpbiB3aGVuIHlvdSBnZXQgdGhlIG9wcG9y
dHVuaXR5IiBzaWduYWwuIEhlbmNlLCB0aGUgU19EQl9QUEksDQo+ID4gUkxfREJfUFBJIGhvd2V2
ZXIgc2hvdWxkIGxpa2VseSBiZSBhc3NpZ25lZCB0byBOUywgYnkgZGVmYXVsdC4NCj4gPiANCj4g
PiBUaGUgZXhwZWN0YXRpb24gd2l0aCB0aGUgREJfUFBJcyBpcyB0aGF0IEVMMyBtaWdodCBjaGFu
Z2UgdGhlaXINCj4gPiBkb21haW5zDQo+ID4gYXMgcGFydCBvZiBhIHdvcmxkLXN3aXRjaC4gVGhh
dCBpcywgYWxsIERCIFBQSXMgImJlbG9uZ2luZyIgdG8gdGhlDQo+ID4gbm9uLQ0KPiA+IHRhcmdl
dCBkb21haW4gd291bGQgYmUgYXNzaWduZWQgdG8gdGhlIHRhcmdldCBkb21haW4gYXMgcGFydCBv
Zg0KPiA+IHRyYW5zaXRpb25pbmcgdmlhIEVMMy4NCj4gPiANCj4gPiBBIHNhbmUgZGVmYXVsdCB3
b3VsZCBiZSB0byBhc3NpZ24gdGhlIE5TX0RCX1BQSSB0byBTZWN1cmUuDQo+ID4gDQo+ID4gSSBo
b3BlIHRoYXQgbWFrZXMgc2Vuc2UuDQo+ID4gDQo+IA0KPiBUaGFua3MgZm9yIHN1Y2ggZGV0YWls
ZWQgZXhwbGFuYXRpb24sIHJlYWxseSBhcHByZWNpYXRlIHRoYXQhDQo+IEJvb3R3cmFwcGVyDQo+
IGRvZXNuJ3QgcnVuIHNlcnZpY2VzIGluIFNlY3VyZSB3b3JsZCwgc28gcGVyaGFwcyB3ZSBjYW4g
bGVhdmUgdGhpbmdzDQo+IGFzDQo+IHRoZXkgYXJlIGFuZCBhZGQgYW55IGFkZGl0aW9uYWwgUFBJ
cyBvbiBhcyBuZWVkZWQgYmFzaXMuDQo+IA0KPiBXaGF0IGRvIHlvdSByZWNrb24/DQoNCkkgdGhp
bmsgdGhhdCB0aGUgUy9STF9EQl9QUElzIGNvdWxkIGJlIG9taXR0ZWQgd2l0aG91dCBtYWpvciBp
c3N1ZXMuDQpTb2Z0d2FyZSBtaWdodCB0cnkgYW5kIHJlZ2lzdGVyIHNvbWUgaGFuZGxlcnMgZm9y
IHRoZW0sIGJ1dCB0aGV5IHdpbGwNCm5ldmVyIGZpcmUgdW5kZXIgYm9vdHdyYXBwZXIsIGFsdGhv
dWdoIGF0dGVtcHRzIHRvIGVuYWJsZSB0aGVtIHdvdWxkDQpmYWlsIChSQVovV0kpLCB3aGljaCBt
aWdodCBvbmUgZGF5IHRyaXAgdXAgc29tZSBzb2Z0d2FyZS4NCg0KVG8gcXVvdGUgc29mdHdhcmUg
dXNhZ2UgZ3VpZGFuY2UgU19GS1ZQVyBmcm9tIHRoZSBHSUN2NSBFQUMwIHNwZWMgWzFdOg0KDQoi
V2hlbiB0aGUgQ3VycmVudCBQaHlzaWNhbCBJbnRlcnJ1cHQgRG9tYWluIGlzIGEgTm9uLUVMMyBJ
bnRlcnJ1cHQNCkRvbWFpbiwgaWYgYSBEb29yYmVsbCBQUEkgZm9yIGFub3RoZXIgTm9uLUVMMyBJ
bnRlcnJ1cHQgRG9tYWluIGlzDQppbXBsZW1lbnRlZCwgaXQgbXVzdCBiZSBhc3NpZ25lZCB0byB0
aGUgQ3VycmVudCBQaHlzaWNhbCBJbnRlcnJ1cHQNCkRvbWFpbiBzbyB0aGF0IGl0IGNhbiBiZSBz
aWduYWxlZCBhbmQgaGFuZGxlZCBpbiB0aGUgQ3VycmVudCBQaHlzaWNhbA0KSW50ZXJydXB0IERv
bWFpbi4iDQoNCkkgdGhpbmsgaXQgYWxsIGRlcGVuZHMgb24gdGhlIGlsbHVzaW9uIHdlIHdhbnQg
dG8gcHJvdmlkZSB0byBOUyBTVy4gSWYNCml0IGNhbiBzZWUgdGhlIFMvUkxfUFBJX0RCcywgaXQg
Y2FuIHVzZSB0aGVtIHRvIGRlZHVjZSB0aGF0IG90aGVyDQp3b3JsZHMgZXhpc3QsIGV2ZW4gaWYg
bm90aGluZyBpcyBydW5uaW5nIHRoZXJlLiBEb2VzIHRoYXQgbWF0dGVyPw0KDQpGb3IgdGhlIFNX
X1BQSSwgSSBndWVzcyBpdCBpcyBhIHNpbWlsYXIgc3RvcnkgaW4gdGhhdCBpdCBjYW4ndCBiZQ0K
ZHJpdmVuIGJ5IHNvZnR3YXJlIGluIGEgZGlmZmVyZW50IHdvcmxkLiBIb3dldmVyLCBpdCBjb3Vs
ZCBhcmd1YWJseSBiZQ0KKGFiKXVzZWQgYnkgdHdvIGJpdHMgb2YgTlMgc29mdHdhcmUgdG8gY29t
bXVuaWNhdGUuwqBFdywgSSBrbm93LiBJbiB0aGUNCmVuZCwgaXQgaXMgdGhlcmUgZm9yIHNvZnR3
YXJlIHRvIHVzZSBpbiB3aGF0ZXZlciB3YXkgaXQgd2FudHMsIHNvIGl0DQptaWdodCBiZSBiZXN0
IHRvIGp1c3QgYXNzaWduIHRoaXMgb25lIHRvIE5TIHRvby4NCg0KVW5kZXIgS1ZNLCB3ZSdyZSBs
ZXR0aW5nIGEgZ3Vlc3Qgc2VlIHRoZSAodmlydHVhbCkgU1dfUFBJIC0gYWx0aG91Z2ggd2UNCmRv
IGFsbG93IHRoZSB1c2Vyc3BhY2UgVk1NIHRvIGRyaXZlIHRoYXQsIHNob3VsZCBpdCBjaG9vc2Ug
dG8uDQoNCkluIGJvdGggY2FzZXMsIHdlIGNvdWxkIGRvIGl0IGxhdGVyIGlmIG5lZWRlZCwgYnV0
IEkgZmlndXJlIHdlIG1pZ2h0IGFzDQp3ZWxsIGRvIGl0IG5vdyB1bmxlc3MgdGhlcmUncyBhIGdv
b2QgcmVhc29uIG5vdCB0by4gRG8gc2F5IGlmIHRoZXJlIGlzLA0KcGxlYXNlIQ0KDQpTYXNjaGEN
Cg0KWzFdIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1lbnRhdGlvbi9hZXMwMDcwL2xh
dGVzdC8NCg0KPiANCj4gVmxhZGltaXINCj4gDQo+ID4gU2FzY2hhDQo+IA0KDQo=

