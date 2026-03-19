Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F79109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+zmQ/A7nIMx7lQmUAVOGVaENY5FcsJgWie0+wHSzlA=; b=tFQOy8glSdjwaGkAHcTtsQ3EPC
	hCGPj2srQj5mivnTpQXwlJiKV13IpIDzOvigrPHK/IzpxDjDiGkMHAxoLH1Ghp1VOme3KyshsXSDy
	PWcOXSyfcnUkOZXNfuQZIgogG8GTmz8yN90mgfATn3FKtm17g+AW08f2l9179OQaByUI9cwK3BIOO
	gkRQYh6HbrJuvUevBVRDoN5KttOVqOj2b3Wv00WGSOlxj7js4fWmxJVMD4ogfFoSss2e6wC0MkHRr
	u9Y2huZHr8A8exzp1/wb1qq6dCSjTUQH5Nl/S6o8prbe2ocWOOIbKG1k+ncIpX4DCMDJ1i4EkOYBq
	uJgoFzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fgj-0000000AxyL-1Dqa;
	Thu, 19 Mar 2026 15:53:33 +0000
Received: from mail-northeuropeazon11012028.outbound.protection.outlook.com ([52.101.66.28] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fgh-0000000Axw0-0itf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:53:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yV1j/gg2HrQAVTjfs0rxZU84r94jdZZ3S+vUO1mE9p6VMcIrTgKA0jV42YkUdONqgsfRytHW7JhcGrYWKPnzoM1T+Zi0bSIQW/YZBT29FWPOPs69bH8MccL2FpqvmDZ+ZevZmD6U8MYxRWzqEwxdU4pXcUxvmpvMWCh5cQHqYss9jJPnctTEwEFlUDkdf8k4NYM0+uDPNbR7sB0RJctmusBHGsDLgebW+5VncYgApKY3tUH3C3Wv38qftF8Ktcpp5RC2vpk5gYPC/wDGkWFEHGPCAAnocX85GTbyHPYPoHNEsAKDBQIyWB/JwmoWATc+8+nHFKthKA4WGjNz5ZmJgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+zmQ/A7nIMx7lQmUAVOGVaENY5FcsJgWie0+wHSzlA=;
 b=WSLDuG6HpTccYBid9uMP3UDN4fLv0vW3+dNHsWSEUGa/r2vwE30cXpZJkqRnQXIOg/qE6g/gKQMr+bHCUL/VUOrrlkN9b83LE9bnFIOVVdwbuCCTJvPG/RSM+W0HfeXBQvW4zwnMa2R5nndB2KAKC2LcQgQ4Qb4xcIxqrKYsHL8ySDZAWQBvFzpRz7k6a74G4R75M+YoOMasYZA1K6/iMLRqVqfF/RRxX/x6NT5HEmRR+q7GngCZyTsM0SlRi8mzxw8i3XBSfTUr1Fmx9cXmd+s6IFjq4x+eUzCIwvPOh0Zry6mpYl5fxa6l0T8CcOqSYBcrw2ZZuo3Lyh4wy0aX8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+zmQ/A7nIMx7lQmUAVOGVaENY5FcsJgWie0+wHSzlA=;
 b=ocipiIMydCe6YK7MOO1wK5ch/erjLsrh1RqFaqTu0I70lxrV8Brbvuewg3XaU2vkGS5wm+SZXL6vtE4XmkZFjYSZGL2C3WK0wLYwBUACs114Ju+Fmm1og93wYVG1N5zT3LLWJdL+Fn0pw2/WLMCC2DNPYnXKVyliBqdpsSiZ74U=
Received: from DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) by PR3PR08MB5740.eurprd08.prod.outlook.com
 (2603:10a6:102:87::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 15:53:25 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::c6) by DUZPR01CA0080.outlook.office365.com
 (2603:10a6:10:46a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 15:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Thu, 19 Mar 2026 15:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0JOLKBngt2cJfkZfrHOFL596YLQbit6LK5FuhuUOUE/D9iB61o4DkqD6GUG/q8Ep2kUEciJpp3VXUALiNVcOmtV1BhU8xEgVgnLe7toRy5FKVe2cB9CukfF0Ewyj5WJaavrSZEW463k/v+FZB/pebaD0RP9iwbCMEIaxTCSUrFbO63RMt0eRRJTCxJ23DGA0YJkE0UpXwe3Xei+URkaMd4cvd83EItUn2Oa3FL7oY8g0QXdB0yR/w3WE0V3vzW7hEoMz9GRmJtklGcTDkPppQ1uVVASMjbAD4gM9Uc27Wqv5noYpu/as/714Eerp6HXVUS6xq/OEnj88nUgsjTpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+zmQ/A7nIMx7lQmUAVOGVaENY5FcsJgWie0+wHSzlA=;
 b=MrYvHDZvUlTP8KWVuLsOsIKA9m6tmZm3IefCrC5db4YHlx6e/nxrDpSoPiO7TRpi1NbsOwkR4uXCC4JBiUtIWJFGFTqldZcdofT+9Qe10TG5W9KUqsvRl1VjbOOYSMzl9jE3SCHITJoscmWgj5vcehnojPYQy4cGgkyLjt0pSWerYLkp3XwdOMmEtj8HrTd6cROn0xIccxGhQIUGdEA+2I4b4OkYkC9P1K55puJ9Fxbealivd652QvePA503MF65pMai7MwqlF2KPcN37ydjnEWztNkey7SftfeZJgiwkY8eBaLOwuvsvKw1uvHaeMfuwxmhCIRRkebHtjvbpYRpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+zmQ/A7nIMx7lQmUAVOGVaENY5FcsJgWie0+wHSzlA=;
 b=ocipiIMydCe6YK7MOO1wK5ch/erjLsrh1RqFaqTu0I70lxrV8Brbvuewg3XaU2vkGS5wm+SZXL6vtE4XmkZFjYSZGL2C3WK0wLYwBUACs114Ju+Fmm1og93wYVG1N5zT3LLWJdL+Fn0pw2/WLMCC2DNPYnXKVyliBqdpsSiZ74U=
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:504::10)
 by AS2PR08MB10250.eurprd08.prod.outlook.com (2603:10a6:20b:641::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 15:52:19 +0000
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27]) by AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 15:52:19 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v7 10/41] KVM: arm64: gic-v5: Add Arm copyright header
Thread-Topic: [PATCH v7 10/41] KVM: arm64: gic-v5: Add Arm copyright header
Thread-Index: AQHct7hdOdRT16XybEauMfa+g0/yVQ==
Date: Thu, 19 Mar 2026 15:52:19 +0000
Message-ID: <20260319154937.3619520-11-sascha.bischoff@arm.com>
References: <20260319154937.3619520-1-sascha.bischoff@arm.com>
In-Reply-To: <20260319154937.3619520-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS4PR08MB8241:EE_|AS2PR08MB10250:EE_|DB1PEPF000509F8:EE_|PR3PR08MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a9f4f9-da53-4c1d-520d-08de85cfa806
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: laEeaHCRZ9KHoQZofKQ3ABdHbmHp6Fc5IP8Vaqxy7Wt0N374NjqRavB44jbbvRgFXXtreO43/KwFT762c+s0k6pqjIq3PuI7LuMa9YhAqJnpTX5aGpZ6paPvmEJw87cHlUjJUWDJjoQBQ4iDe3EX+/RPKSGGFVIBkLmTOOfGtQ0lVvXK75m5gP3mhU/z6Mdo47Gm8Hvu0zi5xJZ9yZ4hO5pVUgwR6GZfp7NRoobXMF6DElLCCVTEKN0XitEfSZGvlyqg0BQeM6IY7urdJ79ezjloilMcRczVLrzN1z4F0/FlfmiL1RCoIHTK/r3adpmAcrBesiLdSZOXt6nNGPJiQQ+soSGJcSOV8mGhqXgW4Xya6e7vIYVy6Z/FR4mW9UeWKilmntf2coLjthYNBEqm9rD24og+hYNEWUpwNbFvlPdAW1vmv38/JChvkPcAXPnG5mhfpr/72KH1NinJVNYnuWd4/sjXcoG9JKx2O6eFfdzFktXDkdF/pytuo5Kezi56172KCLhsY2wi46ywsl02NTk3dyAAde0ZLL0IS0Q1gTNUXJg1aE6Ng1Kz9eNZorwZwf2W8Q8H7wiLXqBxzxRUmWe5jmXlo46ZwkyvD0EqD6IGYNW/QgM4GSTWM5h2tRMzw+oEa5XfcFsNu21QmhG75lbXG5B/KEft72csjkIOd41k1nqpCmr26VZSGDQVcO22Tc9d4mqXcHEEj+KUrlfwSlDIeBhYVjJdaQSFwJ9DemiL0akBtH9WXZY1s02B4Fm2BaqyRCLH6BPUJpUAktbAbw97zWxXM4pXQRSra/vAex4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB8241.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qEly87Jsbex9TBEboo41ojgaQWQ9z+YTvOEKdNSJgwblCaJZ/6tx7iHSv14naJX+mxN+eLAYx+W/zeeH6AN08naY7OUOCNH9366RGvog32U3ABUNvt8GWTKHAIAHycS46fo5l6SVgY1+t6gpUoMoKbP1thmj42i4Xq1UDb8T8R9F/B7da61U97vW3QmdvhGQHavSaxcg8eXPdoGeIUaF67YAFdHqndjQCz+eWukQ/SY31IgJe/RliUiQ4tRSJXSQRz7bCIPVCyenEx4kJqL+rTidG/ucrTt8mfJ4yXhLcn+8F1PM5qyYoV2UbvQUA7f9IGB5EWTt3ec1HSe42UlYPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10250
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 86e0a201-4485-4693-dcdf-08de85cf804e
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|1800799024|82310400026|14060799003|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Cux7cVFTVp4P6FNy9HpNguqEEgyrnDkdEZSjgvjrGC4TJT2Ug4YYcuNr8TH4Pn4cQZ/bXMmDRwKDBysiSHPxbFw+1+9rcDpxEN+u7xn1THfAIQdGO1SEegY/jlsoDFsKwo236lAJS3lDazuqG0szc17UYd18LDav/X99vua7sA1M5aIw+rLaepS7KsYiArCQx8NZae4naTXJT79DF085kHvMisUBsg6kFKBOmbW5cYnXy7nXXIVJsX4gNt7gArOhRxpy9QaO9YVf0HA3/3Nub6SlT1oTOhXEaR1PpEPDgMveIIoFdgA3UCiMX87C7p7a6S9n3PRaOi5V7ujA+HaQ4uge1ID60jdPPIfIlfThNw1YeI/SrfFOxUUgOD/iJbojRYSLEJWwgaYYzFNJPlGICdyBXSeFBnWsZBNrYK6ZZSyNEOIbElk4NUn103Ile2Ni0FSnWZ9gFMepojltVs3MTsip5diuUE/r5KCkUJViVShHHuQTp1/Am7ZLfQuEsLGNBmX/yuEBox7VIEsIbULeNtOvIMxapLrR6b09/7tGStubIQkBM145lcP5rbHda/Rcp95p9nYMBWAoQ7laim2dlfiGKFLS9YbK7gP/IktZEhHNOPjogiiNYKx8nl0LuZD3xURW4OyKGKlK1VN8UK+UNubVlOmH1uFR5D/nWiF9w0i5uDrsUcu6ADNW91rGza7GhtPpnNaS/H+so82j8Xu4VVN/pEGcVsLB0NBJOJjOPEZ1Q9VkezlXm2fLUkn98lK0+2cThfUc7H9u1cDwOUeA8g==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(1800799024)(82310400026)(14060799003)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Uyt6Ig7R1xMcxrx7T5k8VobP51XAHZaAaTyXrpYCNqAJUIBHXA97vmDU18nZaW6/ZT1b6Lync5fINU95qndmscNvLK3+NO1XcTQHUC6YqHL5W1l2MAdnTLE6Z1i4d2/JaSLoj5CYl8WX8r744eDZNASyOpUNJ7o2SVLQx7r0VW0gpdMhoeeiaFuTqAFq7PbH9WkW/qoSMBjn59NIWxX7O/QCH616zGM4+1uEc2bwfnbS4TjpPbNhiDHodTG5EgA6YtyeWca9eS5cDCDx7Vz5lHupcF9+Y2vU3cV4q0U+2EdV7H29mJ7E+G/p8nKigkIABb20Y+Jhb7arQYXZlfrrm4upKVBiLrXr/+s9o1D0xbavm02bWjupsXDdjta+jn8qJTtNcDDQxbcIPh4oSFj3Uvx1Vo7aBUtA4lbmfCgCdlo38efJzf8xqHXCRW49dLq+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 15:53:25.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a9f4f9-da53-4c1d-520d-08de85cfa806
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_085331_210116_048C387D 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

This header was mistakenly omitted during the creation of this
file. Add it now. Better late than never.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 331651087e2c7..9d9aa5774e634 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025, 2026 Arm Ltd.
+ */
=20
 #include <kvm/arm_vgic.h>
 #include <linux/irqchip/arm-vgic-info.h>
--=20
2.34.1

