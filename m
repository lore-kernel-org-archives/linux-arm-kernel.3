Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D451C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEEeJGObwp+mTRyKzspqBlj11VOcGzsmfgQM0INldPY=; b=giMNMoUZveRhV3b+rDS5SQAWE/
	QlNwifyiTetf1ihfNtc6e4M3gVdn6hollJYGWM+MeGa/n0OZTeog0UfeDAoE/fiZi5nsfnXwiOk2x
	OJGxUHJk+tswUDIWF926WPb62MVgE56DTLY01rQaxxi7ZFgLR5ms+WRdyAD7S3w4P8/wTwBXm13cA
	nU+Asp8jNLBSOxGFsVGi+uTQprOfT/3XI8tUyfPFK5f05TtBSxgWB4SwdFwnaTn207tJtvOMDH3jn
	zvlT3qn0STC3j3Tw3TG87yE2eeTFtFEuB8VfEY5+QXyDMgkgpnTW+AwUg4o23eU/1dq5lmVL7Kl2X
	al0bv58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPK-00000002fNX-37mn;
	Mon, 27 Jul 2026 12:26:10 +0000
Received: from mail-japaneastazon11023118.outbound.protection.outlook.com ([52.101.127.118] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPE-00000002fIW-04Qn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8Gj76dMP+8ozXGytiw3Jx8wvQ67W7kCG1vsoum1uNWsgNt2XyagI20H/6I9Dd8jID3GUG0ia+3X4w8cn0o02+Ay4GrTP2ZAS5lmPnMJfP5qKv3RZF93IBBR40M80haSYJs/lANvLMlebTCpKKG0xyonj5HrsGTICgt52hSLBzURpL3fVA4mCBc6PZDCDfnmmisoCEfNpptUfrZJogD4VvbIkkKwkL+cwVN9ss8AcaYUBWodKbeo3iWvaWTFbE4BmD114tBR/nVcIwi1O981oDWWS9nHHMVWaUt8mqEkod8rULCnwDHAZ6RRb2Lgt944ca5W5zVu/kJTFlplKvy3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEEeJGObwp+mTRyKzspqBlj11VOcGzsmfgQM0INldPY=;
 b=LL7nb+SbXp+IZS3QC6HF4IRwqK5MC+vW+ZUB5tjE86bkVtto6nBlbpDmpBLjZFueY6M0SiZYv48H5DiRBAwKrirVem3yo/5re1S8l5eUg1ttY9R1SitTDf9zrVcA6Xzqn7DCNwjoxwpdHXYU1vMv3tMq7+9cgX6R8XLafHuGAcNjlywr6iV7LyXMCZeRaJoA3n77BqElgibbzBNEyFphHLh/S30E+hDUHZjbYum4g/i0kIrfnVlQLogQQ/IjzgsO/D+QsDT0YfvWocDt5YXxHuD0HUGf9PBGRpi+8CCDM1HubqaTXciSfM0vqJ2DHUiWHCrlsPRmzohjcYQCvrmf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEEeJGObwp+mTRyKzspqBlj11VOcGzsmfgQM0INldPY=;
 b=PoZp8lvCjMzoqNsME+VFs7qHPHaeiWf2OJaGILBucYRch0Hv5qv5RKMo8qRDKYj/5w+yTV8MOrdtSiB/0JdbTD+OrZK1QlNuJ8Mh12bn5bwe87/hySY4JljxodeligwEOlC09fBCJ+dSf5VFa4sBWJ6ysEKZoaWH9N8twaweNv8=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:38 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:38 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 3/9] arm64/debug-monitors: Make
 do_el1_brk64()/do_el1_softstep() noinstr
Thread-Topic: [RFC PATCH 3/9] arm64/debug-monitors: Make
 do_el1_brk64()/do_el1_softstep() noinstr
Thread-Index: AQHdHcMI/uCdNQupNUGoWIBuCBmJ6g==
Date: Mon, 27 Jul 2026 12:25:38 +0000
Message-ID: <c914d2b8ff0421eb35665eba7b49c92f3857d2bb.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: e6e6374f-a446-4451-5d70-08deebda2a7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: LDI3xBgxmVIF/x66p8LjsMfCJHpw19mTVSHyfc8QrAL+05FtBuLeSGd4CzulAletj3G9EMYX2rBngdSGIvCkJJ6u/H3y3WakGXNpWrjPpstAfhMd8zwSJmY6hfv/nYQER4mZAIm7fPur1+sdFOMSaaHG1637h+YHE4lYwipAllWZ7tmm5To/L7xw4Wq6OyARjX3zswHWgOSKkr8U/nrrB4+18ld8lD3I+YZmQNvjjMvuxZ/LYsnPa3NEXLoRIv7kuZtwyusWO/lOQSysnYiWOTQ7k5iYTaS2Wa6X3U/HVxv/vi0o7kngAO27HK1kWS+EgR3faz5DVwEc6pa1AtsDDHDGo+RU6qhRNDo3y5pEO/psJpU52dWKeAnx8NEuEsyJ4tgpS2ry8HR8VNc8YueaZK2iLGrEx0GfJzaRWkjo42JsGIqSVjbS/LfN7EdBoxhaZxTJ5nP6wh6RoZOgBZ7/f8FQ4ojNZpHUdp3WRwmfgKU/AYe+GO0jcnYb7LSAW6iiU4ejpe9/CTc8jyyCL7yKcTYHJAgUY7pTvuVu/ETQYVga9aIiS2kLnc9nO5SfkDeTR8lzcRr9KZCATfD8axtef0/kUccPpKgh4XwbojWJ88/5Ej3qxILfAFePbgrUcMkqU5rrq+MCNZVTQoGs3FTPM2cPIeiSdrTaKzfc3lx96uEuBXbbvt7jpAaPuN1nuJRR2Znaek7Q0pmx+8yww3C8nShUaP6ne5XvGGIs9JyWymA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gOrN0SfJi1adc42l2uI5xabNGTipypfamGvoJ/pCRmoAl91wkrTAXRC6Yl?=
 =?iso-8859-1?Q?t8VOzFnAb9sEDcoTujeKGwyRMQ0baCRQ510M/UgPF0DxQVOKpg/INp1BUu?=
 =?iso-8859-1?Q?7tol4QGlmcawdnpmAQd220/WHiY7NpOVSYo2M8OfNSMql2J08TzbDPXbMh?=
 =?iso-8859-1?Q?00D0/xckVxfND/6c8NtssVN/kWiqESjG2yRGVCOfGwLPkDT8PLkmtRk/X3?=
 =?iso-8859-1?Q?0YNZTDkieaozvq39LaMIoYg/maosyWcqJ10vQ2M68s8gKR12txsmhyMhob?=
 =?iso-8859-1?Q?2teF5MuDZp0MxhEp4SVUFQqYLDvhR6JGPI8/ef2Szw2MAsjUXVlOurajSp?=
 =?iso-8859-1?Q?ekzMPRRzU3vjA0mjPvvQAbDUhelCAVCmIWesCxNwbshgxz8f9gT31Q32qK?=
 =?iso-8859-1?Q?bGf8TMc705skE2U0wy+pAAacFarzIoGWe5txu6XLLt3dURSXk0WXAvEt/v?=
 =?iso-8859-1?Q?oMh9emuf1/7axgOCWiN/Xsd94cgnUgPLavbdsoofB2tmEd86jVWJ5+2d3C?=
 =?iso-8859-1?Q?97osynRiZepGGpuyg2dRfdE9v7uYIL3JxcrssfDiRoe+7BUCUNmSDfssM+?=
 =?iso-8859-1?Q?mErqVuphNwKi3aSFK83A3QmaXBvoUUppj0bIQbWuVPTKuJgq0pnvkKRCVr?=
 =?iso-8859-1?Q?Pgo7IaI0bFQO9SmTauRM02AY87xo85NXYehcu6rSVI20GTwGRgMKvNtUfH?=
 =?iso-8859-1?Q?vrJ4cUr9WO6+GVtqPnMgGihQ6MDqWUCPM3+VSVXeFqtlbcwNMIsy75kd3d?=
 =?iso-8859-1?Q?Tu29pUHlfwe9X1Ge+It6RDAfbaAK0nHCpDSQCpgV99S5wDm4Rh9pT+cu8g?=
 =?iso-8859-1?Q?plc80ewhSMQZ6Smv34FEnouJ99o83DFwOt4tZ2n0QcG6tZfbqgPl1ZODmQ?=
 =?iso-8859-1?Q?EwveS6HuXMTJ5A9F1a8PABxCahYivLGyMoItOydlSPG4tbL3FgtlhmSWVY?=
 =?iso-8859-1?Q?bkVtMBZ8bfrNI0/JvOdQ87AK+k6v0Eq94nefSVDqT/Tiqu6nKuKnYE4eVA?=
 =?iso-8859-1?Q?POtWkkzERliiDo2ow+hW/OBl+x917zJfpltRqPDtTX8hpEVHunGR/v59ku?=
 =?iso-8859-1?Q?F+MZALs6NWMAFd8hiu1S7vtJqrd3+hNrbl3GZWtcrSBUAYoe1dIsTaEEvP?=
 =?iso-8859-1?Q?e8pYT60nNFvq2FWKDnZkhyGhqQWKGMBA+ebE0e0zoNQiJJ653dal5otEv4?=
 =?iso-8859-1?Q?oO7sOT6YmUBklPzswYh1OD3HpofA5fKdPikhE0RmUwyzicVp7QX14QUYBa?=
 =?iso-8859-1?Q?PbZc351xgbH6p9ZvEee4NZChy4t/tyFObyaBmDCKm80Q2vBkC9uZ5MtJW4?=
 =?iso-8859-1?Q?klekdSDOO6QGsFflDoyls0mAKjYYMe+F5XOKjGlhwGpUl3YCsn79uBjUA+?=
 =?iso-8859-1?Q?6cmZlTFuvjBN/Pzit6upi/P6fljH+d10Wb+cwduQyuA9g+HiC329T8g5pj?=
 =?iso-8859-1?Q?nbH772qRkzWu8Y7RvO2pg/Y7AhVI2LwHZxnKx93uP/mubOkyOLk/Ym7a4m?=
 =?iso-8859-1?Q?4r4cNsiQyHu6UzgoHMgO+YE6YMeERTaZZqPBMCKS8MNeR9gmoqyQ8UBiyE?=
 =?iso-8859-1?Q?sVcLXjCyLjLbt1yAEq1gc6nb4Eq5gDEfesdcHoZEPmG/mYOyAIdwyrDNgq?=
 =?iso-8859-1?Q?iMfflCw3h3Pj07GSwSqaKOPY3sp8ghyFcEsNZ6WABzjip0KEipl7hM0U/I?=
 =?iso-8859-1?Q?I6a3NVTY5g/EUmV7bJuAUioKT0hhpQXHfnfB5omtos/4Ffy69Xq1lo3Kkr?=
 =?iso-8859-1?Q?DinPoSpXB6odrvtsMIwSeh2i6yNUFVu86KTP2Zu7h30oFDExENvBFIjm/i?=
 =?iso-8859-1?Q?bbQvj0NfCw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e6374f-a446-4451-5d70-08deebda2a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:38.1249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnkPDmxFr7Lv0o/MVNXQ1qPL3prox9FCRYMrJptg6VcVcHFFyyLFNdm6PTlIBJKesvppaHmLyoR1+O/KdRggOpru3GC5kNcJbQdsXYi7wek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052604_063383_06241E5B 
X-CRM114-Status: GOOD (  10.47  )
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
Convert do_el1_brk64(), do_el1_softstep() and call_el1_break_hook() to=0A=
noinstr. The kprobe and kretprobe BRK handlers (converted to noinstr in=0A=
the following patches) are dispatched directly. Every other BRK handler=0A=
are ordinary instrumentable code and now run bounded by=0A=
instrumentation_begin()/end().=0A=
=0A=
With this, everything on the el1 debug exception path from the vectors=0A=
down to the kprobe handlers is noinstr, and instrumentation only runs=0A=
inside explicit instrumentation windows.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/debug-monitors.c | 74 +++++++++++++++++-------------=0A=
 1 file changed, 41 insertions(+), 33 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-m=
onitors.c=0A=
index 29307642f4c9..a970ab6327cd 100644=0A=
--- a/arch/arm64/kernel/debug-monitors.c=0A=
+++ b/arch/arm64/kernel/debug-monitors.c=0A=
@@ -11,6 +11,7 @@=0A=
 #include <linux/debugfs.h>=0A=
 #include <linux/hardirq.h>=0A=
 #include <linux/init.h>=0A=
+#include <linux/instrumentation.h>=0A=
 #include <linux/ptrace.h>=0A=
 #include <linux/kprobes.h>=0A=
 #include <linux/stat.h>=0A=
@@ -193,59 +194,65 @@ void do_el0_softstep(unsigned long esr, struct pt_reg=
s *regs)=0A=
 	user_rewind_single_step(current);=0A=
 }=0A=
 =0A=
-void do_el1_softstep(unsigned long esr, struct pt_regs *regs)=0A=
+void noinstr do_el1_softstep(unsigned long esr, struct pt_regs *regs)=0A=
 {=0A=
-	if (kgdb_single_step_handler(regs, esr) =3D=3D DBG_HOOK_HANDLED)=0A=
+	int handled;=0A=
+=0A=
+	instrumentation_begin();=0A=
+	handled =3D kgdb_single_step_handler(regs, esr);=0A=
+	instrumentation_end();=0A=
+=0A=
+	if (handled =3D=3D DBG_HOOK_HANDLED)=0A=
 		return;=0A=
 =0A=
+	instrumentation_begin();=0A=
 	pr_warn("Unexpected kernel single-step exception at EL1\n");=0A=
+	instrumentation_end();=0A=
 	/*=0A=
 	 * Re-enable stepping since we know that we will be=0A=
 	 * returning to regs.=0A=
 	 */=0A=
 	set_regs_spsr_ss(regs);=0A=
 }=0A=
-NOKPROBE_SYMBOL(do_el1_softstep);=0A=
 =0A=
-static int call_el1_break_hook(struct pt_regs *regs, unsigned long esr)=0A=
+static int noinstr call_el1_break_hook(struct pt_regs *regs, unsigned long=
 esr)=0A=
 {=0A=
-	if (esr_brk_comment(esr) =3D=3D BUG_BRK_IMM)=0A=
-		return bug_brk_handler(regs, esr);=0A=
-=0A=
-	if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr))=0A=
-		return cfi_brk_handler(regs, esr);=0A=
-=0A=
-	if (esr_brk_comment(esr) =3D=3D FAULT_BRK_IMM)=0A=
-		return reserved_fault_brk_handler(regs, esr);=0A=
-=0A=
-	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&=0A=
-		(esr_brk_comment(esr) & ~KASAN_BRK_MASK) =3D=3D KASAN_BRK_IMM)=0A=
-		return kasan_brk_handler(regs, esr);=0A=
-=0A=
-	if (IS_ENABLED(CONFIG_UBSAN_TRAP) && esr_is_ubsan_brk(esr))=0A=
-		return ubsan_brk_handler(regs, esr);=0A=
-=0A=
-	if (IS_ENABLED(CONFIG_KGDB)) {=0A=
-		if (esr_brk_comment(esr) =3D=3D KGDB_DYN_DBG_BRK_IMM)=0A=
-			return kgdb_brk_handler(regs, esr);=0A=
-		if (esr_brk_comment(esr) =3D=3D KGDB_COMPILED_DBG_BRK_IMM)=0A=
-			return kgdb_compiled_brk_handler(regs, esr);=0A=
-	}=0A=
+	unsigned long comment =3D esr_brk_comment(esr);=0A=
+	int ret =3D DBG_HOOK_ERROR;=0A=
 =0A=
 	if (IS_ENABLED(CONFIG_KPROBES)) {=0A=
-		if (esr_brk_comment(esr) =3D=3D KPROBES_BRK_IMM)=0A=
+		if (comment =3D=3D KPROBES_BRK_IMM)=0A=
 			return kprobe_brk_handler(regs, esr);=0A=
-		if (esr_brk_comment(esr) =3D=3D KPROBES_BRK_SS_IMM)=0A=
+		if (comment =3D=3D KPROBES_BRK_SS_IMM)=0A=
 			return kprobe_ss_brk_handler(regs, esr);=0A=
 	}=0A=
 =0A=
 	if (IS_ENABLED(CONFIG_KRETPROBES) &&=0A=
-		esr_brk_comment(esr) =3D=3D KRETPROBES_BRK_IMM)=0A=
+	    comment =3D=3D KRETPROBES_BRK_IMM)=0A=
 		return kretprobe_brk_handler(regs, esr);=0A=
 =0A=
-	return DBG_HOOK_ERROR;=0A=
+	instrumentation_begin();=0A=
+	if (comment =3D=3D BUG_BRK_IMM)=0A=
+		ret =3D bug_brk_handler(regs, esr);=0A=
+	else if (IS_ENABLED(CONFIG_CFI) && esr_is_cfi_brk(esr))=0A=
+		ret =3D cfi_brk_handler(regs, esr);=0A=
+	else if (comment =3D=3D FAULT_BRK_IMM)=0A=
+		ret =3D reserved_fault_brk_handler(regs, esr);=0A=
+	else if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) &&=0A=
+		 (comment & ~KASAN_BRK_MASK) =3D=3D KASAN_BRK_IMM)=0A=
+		ret =3D kasan_brk_handler(regs, esr);=0A=
+	else if (IS_ENABLED(CONFIG_UBSAN_TRAP) && esr_is_ubsan_brk(esr))=0A=
+		ret =3D ubsan_brk_handler(regs, esr);=0A=
+	else if (IS_ENABLED(CONFIG_KGDB)) {=0A=
+		if (comment =3D=3D KGDB_DYN_DBG_BRK_IMM)=0A=
+			ret =3D kgdb_brk_handler(regs, esr);=0A=
+		else if (comment =3D=3D KGDB_COMPILED_DBG_BRK_IMM)=0A=
+			ret =3D kgdb_compiled_brk_handler(regs, esr);=0A=
+	}=0A=
+	instrumentation_end();=0A=
+=0A=
+	return ret;=0A=
 }=0A=
-NOKPROBE_SYMBOL(call_el1_break_hook);=0A=
 =0A=
 /*=0A=
  * We have already unmasked interrupts and enabled preemption=0A=
@@ -261,14 +268,15 @@ void do_el0_brk64(unsigned long esr, struct pt_regs *=
regs)=0A=
 	send_user_sigtrap(TRAP_BRKPT);=0A=
 }=0A=
 =0A=
-void do_el1_brk64(unsigned long esr, struct pt_regs *regs)=0A=
+void noinstr do_el1_brk64(unsigned long esr, struct pt_regs *regs)=0A=
 {=0A=
 	if (call_el1_break_hook(regs, esr) =3D=3D DBG_HOOK_HANDLED)=0A=
 		return;=0A=
 =0A=
+	instrumentation_begin();=0A=
 	die("Oops - BRK", regs, esr);=0A=
+	instrumentation_end();=0A=
 }=0A=
-NOKPROBE_SYMBOL(do_el1_brk64);=0A=
 =0A=
 #ifdef CONFIG_COMPAT=0A=
 void do_bkpt32(unsigned long esr, struct pt_regs *regs)=0A=
-- =0A=
2.47.3=0A=
=0A=

