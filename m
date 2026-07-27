Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0084EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZzRZ8kBDjnEAwJZBkTmzLoPG50WFJG0mNRKVUFBf1I=; b=zOsUZDqgMfgXrGFXJ+CnumboJ6
	8XWuGuKFSGDn/MgKeTeU/f5GWtppjqOzExPe15hflUHggj2wrd8mV3S4UIuw3io1xGZW4oRN0bVHf
	6ty7LCdXx/xEXoZ9N42Y315bwqf+Qb/UW3D2WfQbwLJVjm6a116Uz+AQEISmXFzwR2RqPLVabhBFX
	mIBNT8+9TKLzAccXWxlZwvXSWO5hk6GjtBWNzZhmjFiFKHVL10FEcLDz0iqUrBTDTVJ0jr44nXRnM
	ZNnGYxUz9JsxSVY2WgV0o9imUSqKE1ojv23MgS9s6dILAP5oq0cSBOvKW+9jDr0h/qWBD0F1hbb5x
	77ltMNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPE-00000002fJn-2gdM;
	Mon, 27 Jul 2026 12:26:04 +0000
Received: from mail-japaneastazon11023118.outbound.protection.outlook.com ([52.101.127.118] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPC-00000002fIW-2676
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPBagm1P6/8bzmBvSnXaGlPFrXpNV9h7/bQa1ARUenoatrZOEbwq/SSr5MDhQupfCCKmAPta+ffbGAiQl0C/DkwCJ1c2v/d/wRXiYioD4RUfkn1AWjlQAYrloMgv1BhfneV/3cDwr7ysLWEI3gqpjBlsLltyxBzl+K4ujf2cSs3WV1xDwmjNs6gAugHldIKCs/DX8ABBMz7i7gyDQ4Ji3NB32RAUj5FaF2AF5tvHe+IZ1S9aXryLiRNvk/w5B6H/ME6ekNOc9k0idPslG8o5p8nOxqtTZlJi6JDw3ahvGQQyD97nYDIfoxxc4oubaQ5MSkB80rh60blJ7GEtRdq8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZzRZ8kBDjnEAwJZBkTmzLoPG50WFJG0mNRKVUFBf1I=;
 b=X3LNhBvamzA6DtxU6YERZIKaNdfz/kgnrgcthCvgNjx2dKNKvWXkmcPIIWzez4iJnj7HajKbg5QBQ8F+xH2CvZrSCEA7KoA/W1H5xbrEQDHzqxlTUivCz6T44l/vuZDdlXXJKvIrp04xXawIJiz5VzWb543FUVeVpRJs8dGTcrTUhGSQIVwtX67dKLnat2oJk17HAEqG26YOIwZXygTIXBhNUceymqUXhWH6g0lM1PeT5HMPGT7gCgTY/hRmQv3gblRV/6E7YA+xEpmFfc1z48Qb3qzi8Rey7JNQD3rvhYw4M/aL0YtJpTmsBDwx7QvefbhfRv/G4uS2rlkadnFVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZzRZ8kBDjnEAwJZBkTmzLoPG50WFJG0mNRKVUFBf1I=;
 b=S7zhU+5kV+n2ohmo4jtUIZflVEXSzckyGIUfsSkgEHUpV2QoFbEAl96rnUuGlD02PHExRmy0pGYoLUayg+wS6VTdccEXFy5Q8u2Ut9adPd6DR7bzJrYnDtTaaoukvH4sSurm/e/4iACu6rFd455vj7RKrCxQ5lmEHeEyuvxIcCw=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:34 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:34 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 1/9] arm64/entry: Bound certain debug exception paths in
 instrumentation windows
Thread-Topic: [RFC PATCH 1/9] arm64/entry: Bound certain debug exception paths
 in instrumentation windows
Thread-Index: AQHdHcMFGBJ8XFLnCkSt77E101nvqw==
Date: Mon, 27 Jul 2026 12:25:34 +0000
Message-ID: <38af667517b99785ccbc2075f53a364ba2acc73c.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: 371dc8ef-9995-4d9a-7540-08deebda2860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|5023799004|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: FYAzQa+VLZz/HLivvK9txL/uCE9sOgmZSt81XyXEzXdkDybmr3ZwMEwMPDfhQZTAJRFR8LQ1qrANuh8+LkN7wnQGhOgmKlZplN9a3OhdE9WtIQyD2KNV1mK5JPERKc6k8ModhwalYFbimjTXbAdmUZtBlorjF2F41pGo+31CZZTTFuVYWcrhWkKdY3XORRcfVTnohswHIMe3xiX/k0499u/cO6Urz7Tbt1mEmPEz36qhiI/OXiZCrQIRpIJRVKQpI6ozZvBUrW5Ybm6bz59MscPrqcZ51004gWm0fIF/36CQp3D0IGj7jHKk3DPvRD7vq3G2TOavel4wSwO/GLa0kiemXkVk1xPmRy3gj8UCPt1aZvG228INMzPoq3ROycdwD3pQJ5ns9IaRjt7gKAMxnChUVqed+mLo1gFFsZ7AYXndp/PQN5WYgLX7u5eof6wc/am5eAV7jWAj9g3UMCbwHkSnKll2lPJouLCYYcMh4RNM0Sgkxf8WjbJw2tVfe8r8JuG1Df5K3qw34QqYCsHxTA2dFB9oodyoCoZ+sFxMkM5LtvJnNXUohqJ8sSwN05V+nS0iTkNVHaVA3RJm7UpeRieEGvI69NPVdI+KwAmDRt6aFjhx3TZr3RCOx7IA66PkCCaL42uOttQjq2AYOw0wBONied22LngfSgKN35OSvmMDXrTbsjSx84B9klG25aVCiTQtyAXOBN/SNxIvMOvoZNBqccgPyX65vWt9aUrxkkM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AWWJbL/z+G775g0PVxBLZJOLkYD/K5VP7Um9F78Om8Wvw7FuMFuGgSS1D7?=
 =?iso-8859-1?Q?/gwkcKRjSKaJ+MaOObf3gS58yH4BOh9LZAO6MvVJizB3B5xqpivAqvNV8t?=
 =?iso-8859-1?Q?5sQbkBZTApvOmjFmzOBoBg6njcz2nA6xRWSbmunno04HHURggnvxO2lXha?=
 =?iso-8859-1?Q?cgNuPXqtNDhtfmp56t24bEeQ7wMyrWQZkEKjwtCeNe247bPUUc3wT7iisG?=
 =?iso-8859-1?Q?iBif03sV8570xkqlczYW2Bcwnf05YwlXGHxMc6Wo8vnqdSN5yDx3hTypiR?=
 =?iso-8859-1?Q?Rh/t4IDc856sPvkYc/JLTgeRV1P8PcHzNCfOUmC/iVHy5+1WcrJuY4O6z4?=
 =?iso-8859-1?Q?XCdeoow+TC6oz1N6CKkGse+1tnW5iZVplKtjSg2nwaNXQOuMS4SrhDPyR5?=
 =?iso-8859-1?Q?uIvXsVGZCd5QFM7dXnqwMEZaLD2u/9fF5JzKIjFaawyp+wO7zhOw7iCoFp?=
 =?iso-8859-1?Q?Wi3iY1TTDa187RJcYEcSb+UgFOCWlAroEscJrfaL+/NtKLl/HGo/9LHum4?=
 =?iso-8859-1?Q?5Fe/GjI+cXRpi62E3528MBrFDV3OAt7ea/PUQXBusebUdbmPkqUyPD0+RD?=
 =?iso-8859-1?Q?dvDTY8A4ylsiznKB0a516Z2k0Zdtauz3ylfGydZ+MnPXhJyc6FX7wq7U7g?=
 =?iso-8859-1?Q?yctquXLG9Wexwsff3h7PAo3uY+ISx4Xq0BdExpulvQUGeijmaA+8xITIQE?=
 =?iso-8859-1?Q?VLXynXjs9DmfpM5F8kIpHvW6JmAO80YLSxOrpGO8yj2WN1wRCSY9/v/geG?=
 =?iso-8859-1?Q?7ukSwt7GGY99TenxpaPG9M11+BIeBfUjKRaZjhLM5MG9lrm8zoegNbGS8k?=
 =?iso-8859-1?Q?X5IRLKhKDOgyjD+2j4jRiO8GiH7BgYO0frv2gyxXsOZ3KsBZ2op+WxCMRB?=
 =?iso-8859-1?Q?CNBYVI4iXSvgqksGPCV8OA+YyPldKhqPgoirsi3pFK3fOR5Nixu/0aPFbb?=
 =?iso-8859-1?Q?4oY/ryANswRfalu7Bdz0htZYUTNy1PinR6AehdY+PmLlIdUKAvWFWVCXVv?=
 =?iso-8859-1?Q?u3KvPMdLwCRbtvMHvlvW3X88ganvJYnrY45FUdds0yUiHe7RDDV8Q7DzOL?=
 =?iso-8859-1?Q?5F80eRiPq7eggo6vXmlW6awPJbub7GM75ZRnRbNRJJ2Ts/WbCz7x5nZFB8?=
 =?iso-8859-1?Q?neBsDTGOmI34fuxDKmJJuQGGEihi+IV1idTiwqgLSOxmGfWs8E0z40EvPo?=
 =?iso-8859-1?Q?NWQd4xTGbyc/GacYCjZn0LxJWFl/r3UQGpfDMMJ91zT6aJWztqqKAsRVO7?=
 =?iso-8859-1?Q?Pb9njWBWiWiKwy6vMAmKDKPtLPUPf83XinyuCRBwimfyn7RTpuDTcy64s0?=
 =?iso-8859-1?Q?quoprw1E2Nwi4K2Pm/qujSiC1et/vA16vbBwcvBVeqm/4hj8WKYiMyEK2w?=
 =?iso-8859-1?Q?4LxC1UkmCgBlFBUPXPy2563SU0W65/pIu9EGsxtG9isMcXQTBKWLpWZblY?=
 =?iso-8859-1?Q?ac5GzUl1lYLCCGnK7y71+49JVQVfhE7tkkzK6N2konYJORiAaKLrtvhawW?=
 =?iso-8859-1?Q?etZGDf1O2Nsjp1/OmwNH55woJXkzG/iMo/JLiHcxk5Fp//YOBHjKcXtYZ4?=
 =?iso-8859-1?Q?cKYP42kYOIWwYYlFHDcz7zbPTpS29xarjWoT176MoA3O0Xtief6XcWl0Lm?=
 =?iso-8859-1?Q?firxhb7JfUK1nUOpokg0taZLQAGYk1PVPIBsbW73milRa6LkSkCP5uSGxq?=
 =?iso-8859-1?Q?ZrGD6/fq235JHdxBGyxniWKXi9Qu1gQZO9rQbzelvQGd9WtZ2zN0K04n7I?=
 =?iso-8859-1?Q?Q1+77UqMiKewlfhc+TJx4OWsJq2b5zPv3qNlTOrbRoDVCUgWOpC3valDkY?=
 =?iso-8859-1?Q?DTPorbGiMA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371dc8ef-9995-4d9a-7540-08deebda2860
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:34.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGQksN9jbti3Ud8sqRMsy/vHeJFJAjkVBV9H3BjJGnuRvwIyZdAyxtg0QhZnv9+4CvzsyRtgfbp2DDJ+oJpQOpWiIxp9+a6z7TsfK8N1t1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052602_541725_5D008FF4 
X-CRM114-Status: UNSURE (   9.40  )
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
The el1 debug exception handlers are noinstr, but their payload calls=0A=
(do_breakpoint(), do_watchpoint(), try_step_suspended_breakpoints()=0A=
and the Cortex-A76 erratum handler) are ordinary instrumentable code.=0A=
=0A=
Mark the boundaries explicitly with instrumentation_begin()/end(), in=0A=
the same style as x86 exception entries.=0A=
=0A=
The BRK handlers (do_el1_brk64(), do_el1_softstep()) will be dealt with=0A=
in later patches.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/entry-common.c | 19 +++++++++++++++++--=0A=
 1 file changed, 17 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c=0A=
index ceb4eb11232a..466529cce1c3 100644=0A=
--- a/arch/arm64/kernel/entry-common.c=0A=
+++ b/arch/arm64/kernel/entry-common.c=0A=
@@ -6,6 +6,7 @@=0A=
  */=0A=
 =0A=
 #include <linux/context_tracking.h>=0A=
+#include <linux/instrumentation.h>=0A=
 #include <linux/irq-entry-common.h>=0A=
 #include <linux/kasan.h>=0A=
 #include <linux/linkage.h>=0A=
@@ -380,7 +381,9 @@ static void noinstr el1_breakpt(struct pt_regs *regs, u=
nsigned long esr)=0A=
 =0A=
 	state =3D arm64_enter_el1_dbg(regs);=0A=
 	debug_exception_enter(regs);=0A=
+	instrumentation_begin();=0A=
 	do_breakpoint(esr, regs);=0A=
+	instrumentation_end();=0A=
 	debug_exception_exit(regs);=0A=
 	arm64_exit_el1_dbg(regs, state);=0A=
 }=0A=
@@ -388,9 +391,15 @@ static void noinstr el1_breakpt(struct pt_regs *regs, =
unsigned long esr)=0A=
 static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)=
=0A=
 {=0A=
 	irqentry_state_t state;=0A=
+	bool handled;=0A=
 =0A=
 	state =3D arm64_enter_el1_dbg(regs);=0A=
-	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {=0A=
+=0A=
+	instrumentation_begin();=0A=
+	handled =3D cortex_a76_erratum_1463225_debug_handler(regs);=0A=
+	instrumentation_end();=0A=
+=0A=
+	if (!handled) {=0A=
 		debug_exception_enter(regs);=0A=
 		/*=0A=
 		 * After handling a breakpoint, we suspend the breakpoint=0A=
@@ -398,7 +407,11 @@ static void noinstr el1_softstp(struct pt_regs *regs, =
unsigned long esr)=0A=
 		 * If we are stepping a suspended breakpoint there's nothing more to do:=
=0A=
 		 * the single-step is complete.=0A=
 		 */=0A=
-		if (!try_step_suspended_breakpoints(regs))=0A=
+		instrumentation_begin();=0A=
+		handled =3D try_step_suspended_breakpoints(regs);=0A=
+		instrumentation_end();=0A=
+=0A=
+		if (!handled)=0A=
 			do_el1_softstep(esr, regs);=0A=
 		debug_exception_exit(regs);=0A=
 	}=0A=
@@ -413,7 +426,9 @@ static void noinstr el1_watchpt(struct pt_regs *regs, u=
nsigned long esr)=0A=
 =0A=
 	state =3D arm64_enter_el1_dbg(regs);=0A=
 	debug_exception_enter(regs);=0A=
+	instrumentation_begin();=0A=
 	do_watchpoint(far, esr, regs);=0A=
+	instrumentation_end();=0A=
 	debug_exception_exit(regs);=0A=
 	arm64_exit_el1_dbg(regs, state);=0A=
 }=0A=
-- =0A=
2.47.3=0A=
=0A=

