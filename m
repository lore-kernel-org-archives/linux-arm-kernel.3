Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD69C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaqedOUBH9Qtpd+RCbrStTJQbcjnrq4Q9cdiPtkUDK8=; b=YeXKqleyqSH104UfdB3YBVE4/V
	nOF+pWujiQYSIf5iWjE1EHUmd9basopJQn5UE21GXHdPLo2gk+Bw56hmbqmzPYdh66IAnn4pCA9HX
	ykn8Yq87chV6zTd9y+q81Kx29D3ttrXUAbTgzgqRuAW5JqDVubmj7bF882Z/9N336adVxVrmD5bZT
	Pcs7xVo9a/Cez8cybz0Fhk4WJyFhxxfSkwCz69sJZ79xz3SjA/thx+HlxwgWoRZCSeMsEZGLp3OTs
	RIFE1pEk67DC4NGXFKN5VgQvacgqiAgkaBtY4TOMWxy+4CqH3lV5h75ZtuX3zgVjUZJB4xMb51oT6
	6mf5nsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPM-00000002fQ5-0voq;
	Mon, 27 Jul 2026 12:26:12 +0000
Received: from mail-japaneastazon11023118.outbound.protection.outlook.com ([52.101.127.118] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPI-00000002fIW-2lWX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCsxy/4xO9u9nnsnnJbGEWU29u+J4lyzgRyM9PEI6PKbQH7pFfAip9f2fRmpOSRjHWUERJ+zyo/e5InqMCq+QzztuzIuqBbZYUDHhgeB3zFB7Vic3WS+g8HAF1ZMNuONqLzFHNBtCCakAZV6DEHoqQMy+1FVJNK/8SV95E59vA5OYjyCXSUn9+pkKc1FyOWDon4Oc1uLaPJlBLQ7bj6iqeW4JVRs90Tb+aPRzgo/XvvvqZ9hEjDA3/AL2P/Ofa+r3AAA1yHLO8LDUhO9Sul4KrkoG8xygjZ1XKvQASmW5sf8g4w6ehrAOncTpuY6nRDWtteDvKvWDidESo/A6pOEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaqedOUBH9Qtpd+RCbrStTJQbcjnrq4Q9cdiPtkUDK8=;
 b=Z88djtVlZLPSUTIu1zYoaziPqrx0etl/7lgnvNrQZA5lb0PjbNcRR4nEYBM25ctF+QF7AF6Sv+u8egsnQmJI7gETSZTdtTnJ1EEr9VLgphWVA0eiLlk7UAOCDUZoNNzrxyd56z6o5JZdBkTnzGCQblIE1M/HSTWj6BJmFwWk1JNjlOYxWFOW5uSdWE7E/49nzy5XBptF6kiaJAj8mrX8OXPOEyBgdhf8k9viuMBG3Xe2wiyiWOR0K+L+ru+pn+zI3J1MzjRbJIgz5SfFHMJHT8z/aok8hzwxPn1Gy+IT4tJaArb/ULJ+4sTybk4pq2g+Vefox9mipUcj07osYd74cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaqedOUBH9Qtpd+RCbrStTJQbcjnrq4Q9cdiPtkUDK8=;
 b=XkcwsWcX+8NOA3mdk98jnjluZiiekODVvMHB8Jusflzskv+2yu4Z1Te6Mn455IHNaQl/UsHsG86JGt5eoFgKa0uzHinf56Xi0dw+qMv5SHMXtcj7JB7c0Sdc8w3vahYXl1PzdBh7TnccAnd5M2NNgejRbuH8ANeBqVUMcaiEiGU=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:46 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:46 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 8/9] arm64/kprobes: Drop the XOL single-step fault PC
 check
Thread-Topic: [RFC PATCH 8/9] arm64/kprobes: Drop the XOL single-step fault PC
 check
Thread-Index: AQHdHcMNwoLe+I6U3Eqfn1J6GXNQUg==
Date: Mon, 27 Jul 2026 12:25:46 +0000
Message-ID: <747c80a43d3345cae59ec1456dfff45d237981dc.1785153469.git.hongyan.xia@transsion.com>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
In-Reply-To: <cover.1785153469.git.hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|TY2PPF7B73AC350:EE_
x-ms-office365-filtering-correlation-id: c9eee637-cf52-4764-9212-08deebda2fa6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|5023799004|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: O4MjcoRyZm7yJBpxlwM8Rgbx0m4wV8QBLZNJlC/dNJp6oYOFHIKFXu/HkVj3Qj7lQ3Qgmw2EaiJW4kCfSw/OVVOC83Tp/93ztInoDYXODJwprHanFJppOSNmsmB8ewmwpbV04oJrfR75kbe4nE2vxgdJ02gt5l9zmH/XCtDNQWZigkQgvI8JWnFWdRW/qE4rOMobKVx/ALWVnla3RlBg3GofFUlZl5exNnjedKkq3PjEYgRnYyT9hr86gemv97oGZlezPpXfmbOiNQFcS6UT/k5o0dKd/O4Cn8VGUmdvVbnGqkB7Gaqv6GYe8uhF5MVagDR5YJwcjo8/7YiSex0CZCOQtecouXgCa/lOHs8CtaopArqaiuTKJVqT6nv0pmPHdrKHD58WJf5a4kiAHLMa1kh/dfa3SOHDJrd7MwFQGMKIKcSBTCCFIgmDvypRftBWnRZGz9MzQxfDMiKf5f6LyXTGm85kCfvLcMyejQ0Jo8JB3rMkcum5RRi+Nc8m2YSQG9ycjQ5nXDoACxbdrXKG0DtnBzbzsiR0HSFpiRdQPr3B2WfLTTi8NmA0f4xPwC+O9sNL3v+z+ddD0xMfFbb4nPjC8w6L9OnsNekBrn4HYnKJm5q16XiCK3EFgpOg76dOTORocKfRJd/HybQrDljOtGR4KpIle+Cy1kip7zkm6oTjJx+aitjY3J5XS9ResZr7KDBlUltlbijfutE9NE43tUCHfZurDX4cZsiJZ52pBC4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LVsD0vujmwME8/PQIjcmno8fHXLKihZs56i6jenetgKiNXRXOwK8XMNaBc?=
 =?iso-8859-1?Q?nPLQ0Qgp4+ExJsQbQBdGCGfB8uxlydjfgYXc7zNiUcJ7ng6wSyhmErAGox?=
 =?iso-8859-1?Q?oqPWsWDB9zB8/nJtgh7nQZVliPoyOTkBX7LRSRBdUTUUi9+xQu5gupz9BW?=
 =?iso-8859-1?Q?pjILUF//nYRJ9DC12vFRb1u6QpfnaIdDfpbeSygi3tP3FCQ2PIMp6d9idh?=
 =?iso-8859-1?Q?UDCoUrJ3RH3p2yG2dwByypsxdmSQlkR4L2poJDnkLaFwITRq6O1fJDCD/+?=
 =?iso-8859-1?Q?F5hNHd9udhil7rqx/7ZHM0VU7WwBrdbmx0Fx5uXyK5rPSijA6gtCbIzgik?=
 =?iso-8859-1?Q?Tbo7vWZVelqE2rkIKUIYoEc0rstlSerxmUj6v1cp0EYEl+Th21UzwD1JHh?=
 =?iso-8859-1?Q?R9+BbxXORxVqLym5YpXiLpyR9JU1FVt/zRRJLhz6EG7TNHjcmUr2C/nC86?=
 =?iso-8859-1?Q?0A2txxqSXpsFNOf4EW/cf/B35ijr6rZT7QeH7y3D7i9TfbXiSzNI5yXZXQ?=
 =?iso-8859-1?Q?8CkqOMyaRhbQBG9mFF1O/2rZN1izrluLPLu3qGRVXuRyAJQ2mwSIf5KM4E?=
 =?iso-8859-1?Q?NWDVOEw+qh3YshzVsT/gyWWHmAQTKKOdQ07P/Cr0saETemekUn40doQ8OJ?=
 =?iso-8859-1?Q?Sxzhp2o8Nq3nFTCfndCcDj7YTTUvjMSA5Ya6xT6cZXhZeftjMO6lSqbevm?=
 =?iso-8859-1?Q?6sxVPMGLZC0vfxLSq9CBFivzikIjvq/23rMk2ldxe//37hcW3oVvV8YkVj?=
 =?iso-8859-1?Q?AxOLgeDfIt9CS01KlVUn0xKtN5IMcJuN6frRL6/JhtPhjYiqYJwrd+pLOi?=
 =?iso-8859-1?Q?b+YEkMIgxJ+dgH+Pw/iIsjebcwDsvQH3sDXcm5sUpO4y7nX2j+U/bcHwxL?=
 =?iso-8859-1?Q?o/VXrwGt0r296pNUlz9ZKkKA3kqPxDZ9Rei55IhJh70z5jcJPXcxCzpnSn?=
 =?iso-8859-1?Q?Ee6+cKpfd7hXqqC8YScriBiUXpf9KoYsoTQ8O/D85qQDwM6gZ0c5/2Rpyo?=
 =?iso-8859-1?Q?hNBrJp9I1LRf0fYF/C9fV4cCpGsWScfzHbIFUdNkh8EI/Vot/eUJxBagd0?=
 =?iso-8859-1?Q?wV/mXhuu2L3zFPUOjDSJCiMzV2PjVyjrp343MZMQq50PF9pBD6ZIidCVak?=
 =?iso-8859-1?Q?1KsHDfdKbTLOyJzYfwiTP+2MLFkenBMS8E4/8oH8OspavkucxfzLfaldyE?=
 =?iso-8859-1?Q?STAcCbW1UtaMInnRMoR6lmCmDcU8vjuRDlXJgZHmVzkT5jYpOQ7sTUr0II?=
 =?iso-8859-1?Q?ZcrHzMUA4zkdkC8QSmcpxIijhOxQNj4d8/GPdcn2snew2urIKN/MsZvBir?=
 =?iso-8859-1?Q?2SnMkLZcwtn4Q3mhryEE4CjU5OL3C5pLC7CYG/vCNn+5su4xsUPYTyph/1?=
 =?iso-8859-1?Q?Ub1JQGIGSMwzzX9uLCb9FuMGV9/gIO8h7RAhePE6Cm1BZvRbMZ2OELETpO?=
 =?iso-8859-1?Q?mO/gLNkEh/jCnbN0Tkm+nOhMAFqIxcCFTf+jcH0Oy8Uj7hLGjQpaTm0oXx?=
 =?iso-8859-1?Q?z+nNipynqjl4OaA0/xZ3PjJo+IwtrJa4KtUURM0O2X2l0W/KAsGRBafdj9?=
 =?iso-8859-1?Q?gCiQjRrNROoJsZ8vovIXn0U/NGvKixVLsdqd2qtcHIxeYF0yyM/VHpPHUZ?=
 =?iso-8859-1?Q?939f8CZ1v4oPNEOoJAz0iIdUXvFxv88+WfPd5HDo/PBKkgX5+zBCZzqjjE?=
 =?iso-8859-1?Q?G5JK5n85e9Orqi9OdCi/dW04r+X6YlqfFPveb2GfH3o1UyIGUsmqdTKnWJ?=
 =?iso-8859-1?Q?UF9s/fSqc0Iu3PgkoFqFF9Sqi3qvLT9Bz2a6chbffuTV4kXiTvrHDM14gX?=
 =?iso-8859-1?Q?e1raGmyTBQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eee637-cf52-4764-9212-08deebda2fa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:46.7570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJaeYRTuXHG2tXdIvdXP3XRXL1t2DsjH36WkTWKKwF9kKIf9j3fJE0/BVwqd0TgGfRjgIqZUo7IaoWtRJVLCd+2uewLvAKiZLOYyG270uf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052608_716717_CA3A633B 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Hongyan Xia <hongyan.xia@transsion.com>=0A=
=0A=
With the armed single-step window closed (the whole path noinstr, and=0A=
every piece of instrumentable code confined to instrumentation windows=0A=
that run in KPROBE_HIT_ACTIVE/HIT_SSDONE state), no code other than the=0A=
XOL instruction itself can execute while the state is KPROBE_HIT_SS or=0A=
KPROBE_REENTER. A page fault taken in those states therefore necessarily=0A=
originates from the XOL instruction, and the faulting-PC comparison is=0A=
redundant; revert to handling all such faults as single-step faults (as=0A=
before commit 879a6754d3d1).=0A=
=0A=
The simulated-kprobe early bail is kept: simulated probes have no XOL=0A=
slot and execute (inside an instrumentation window) in debug trap=0A=
context, so a fault there can still come from the simulation handlers=0A=
and must not be treated as a single-step fault.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/probes/kprobes.c | 12 ------------=0A=
 1 file changed, 12 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/=
kprobes.c=0A=
index 1658b6acd803..73bbbcdbbfe5 100644=0A=
--- a/arch/arm64/kernel/probes/kprobes.c=0A=
+++ b/arch/arm64/kernel/probes/kprobes.c=0A=
@@ -309,18 +309,6 @@ int noinstr kprobe_fault_handler(struct pt_regs *regs,=
 unsigned int fsr)=0A=
 	switch (kcb->kprobe_status) {=0A=
 	case KPROBE_HIT_SS:=0A=
 	case KPROBE_REENTER:=0A=
-		/*=0A=
-		 * A page fault taken while in KPROBE_HIT_SS or=0A=
-		 * KPROBE_REENTER state is only attributable to kprobe=0A=
-		 * single-stepping if the faulting PC points to the=0A=
-		 * current kprobe's XOL instruction. If the fault occurred=0A=
-		 * elsewhere (e.g. in perf or tracing code invoked from the=0A=
-		 * debug exception path), leave it for the normal page fault=0A=
-		 * handler to process.=0A=
-		 */=0A=
-		if (instruction_pointer(regs) !=3D (unsigned long)cur->ainsn.xol_insn)=
=0A=
-			break;=0A=
-=0A=
 		/*=0A=
 		 * We are here because the instruction being single=0A=
 		 * stepped caused a page fault. We reset the current=0A=
-- =0A=
2.47.3=0A=
=0A=

