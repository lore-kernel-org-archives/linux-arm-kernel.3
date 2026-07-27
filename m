Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518EAC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RowLfg12x8H+6/XlFJ3+Pbac5D+6d+PVUGCR1eeAB4=; b=Fi4QEknjFB8X9VSoti1SrBBtjc
	SA8jVIXEAFrb0j0S7t164grybO7XeNHisttHto1HKwr1jFrag8E+hMcP2yvSvijCbMrnsCJEgfia3
	2JFOeDcE1nOYYVv7lUfzpe6w6I9bxrL0fMpp3hCAq/1XboljsxxxOt8ls8Pzq0gWav8D8iOI+4gLP
	mUQMb+TSQDTh7bxdXkbHHF85LlFthjEEDL/OdJqTqPXsSbCrxasifdgm2ESsAXDDCHa0JcyiCrJMz
	DxSSi5QTbuE/1wKAI5Vgvu/IZqR/sicfM3NwjNgqRJMGxKgPc/QgDaYz6m9nmw+5zYVbRLO7l7eYo
	REAhTQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPM-00000002fPV-0D1V;
	Mon, 27 Jul 2026 12:26:12 +0000
Received: from mail-koreacentralazon11023138.outbound.protection.outlook.com ([40.107.44.138] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPH-00000002fJ3-2snt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsDDOHSwX7v48S7rWTMnIvCUDTVzKm4MMUQzEsg0XMlSBQ5wwojgIztNXYviMYMJEUg8A4mctInyxRE8/PFp0Na0jswfjXv/I0fajUuM79zcR3j19M6mYeL1dBVmGGb2TdIIf24U4DRzHxkzwXiMhCqwh9OpRe0OEkAD2zldVQoWFF/eA4Vqz2Ex9WNTyuY/Wtz+nGj9CMhdqCZ6TR4U6A8VGJJqr5XIw9rdCxqYEoqmL4IWfpKusj3SQWOVOWI/ihdIdgVBwWWCVtwa5cOiAUjCJ5QMcw3Zk2sEqPrVHjEJ8HakhMTynB2NUjVc+0FwcihnL/vsZD9iWnww0gd3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RowLfg12x8H+6/XlFJ3+Pbac5D+6d+PVUGCR1eeAB4=;
 b=Jophs2XYgm7hkmvbE5F6lVaGeS7GBmt+Z92kFoj02UBb4kVI6JUCDpnBCM0sLFeK5y2UBtzW7UUOCyP7t3RmvLTThMM+YYLDlhyQoM0dTesUkhej+8ZcQzPvVT8z4Glu7Q1vNHW8RX+Y0YKRGUQAac9c83BbzCj/W3KnC2XXlfm+D1SSnL7+abzTJN8bwOeMbuLVP9WPVyk0nW+ZRQ1I7tOMV7p3UnK0DKWE1PReZsNu2mMBW+jRNLd4Lzd83cv0+zcIZCxCtyDzntSjSTsAN286GBEjeyqNBygoLWqmySDBelbWF4DhkhDI0b5uBc39M8uXTyPG9tPWUj5twzWosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RowLfg12x8H+6/XlFJ3+Pbac5D+6d+PVUGCR1eeAB4=;
 b=kofkcH6Y/dncY6qV6pl7gx/scA5x/fOASe+dCVell1qx+GWcJjZ65s19jAiltIHfHKPp7Z3TqWcs0kF5OY6DPvw005rYMasK3hZm1YoZI0cgOwZYzQzU88BynfnYCGgHsBdilsGyF++2mejYHvlB9v2YVPyZ3XqFgSCk+/3Nxew=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:45 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:45 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 7/9] arm64/kprobes: Drop the KPROBE_HIT_SS reentry special
 case
Thread-Topic: [RFC PATCH 7/9] arm64/kprobes: Drop the KPROBE_HIT_SS reentry
 special case
Thread-Index: AQHdHcMMTPNIXTHkr0uH/DLZrZAyEA==
Date: Mon, 27 Jul 2026 12:25:45 +0000
Message-ID: <c936364fb1c8f7f21d6659282ab1c9211ed9930a.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: 124609dd-c463-49ab-5c8e-08deebda2ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: LSpBnomRjDiZ6umfPFp7EZRkjlmipLIi/S/0hI73vD5HkOxv8O8bLpnDBwy7YGSL6EVthziYJyCAMWD391B+OblZYyxBd4rLUywf9gZW/bUu8HPjRhdvqclglBPxfdfIMu3ql97jkBpem0zZNoFeyxUoLNThkDs+P2fvKMprg/4WpQp4wU7JW6E3Z7SGBlPZl4HiVtVbziMyTXcz/GwlyMTYPEnFvz3KktTzFbCMh8JutMI4arG1tRCCW6bMekSit2CjQ87M3EKtkijfpZfQDOKmISfgAm6GOgCdII78hb5fXAL8Y8FwLXMV3/iBFoOSioBR6vRMxKRsWA1Mojgm/1n33BMMULn3mRcuvZh8eo4EtVPttnI4iNiurc3YjyJi0B18ic5jXG0Ms77xAgzykwuxgRw1yYZs5O4gxHyGOIbRVNYKeq8DnHpHDcwhG+u84PP09Z7Uygyyr27FCU1xgT6AJPTDZ4HthxqJAXu42hw4duFSHlfH0nrbee7GrHsS1vf8uM4uz7+MLkiUNfFvLXgakRQv6b+3ip9WuG+rGMSTS2lZgj3Arr5nE3InHzobKUqYnf7BqWzNT0j6VGa9PJjbMB1tXXINZf1U5iiCyBfE8gGhT6a3yR4LViOJw5jjmxV+vRpv1G0unREIRVPR52jpsiB7CPSTONGf9reQssx9fXLv+RCTRjBPkjtaQbv1zZ3VDCdDurOvAW+mAudJS5G9n4wCqu7HN+a4I8W7GG0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PdWrpLLUCTupIAQ/6CSjjiMuvPzFgUU4rk7s3xkMMKkA9dYZjSi2cmez0j?=
 =?iso-8859-1?Q?3KXOE3XYHnp9+CprzWSgimhwEzA4LSh5QWC1zgq4CInWvfbUcpmQ4T/mV6?=
 =?iso-8859-1?Q?J72AHdMbD68Xg7hh7XOesv3UqJCxInaO1+TLOhnB5cPTyTivvVWWRrTVH0?=
 =?iso-8859-1?Q?zqJ9Yn7k8GKHxioCLZXtAyn6KMrx/Qt0S+zvUK82CV13A2dqzIoWqDWxHL?=
 =?iso-8859-1?Q?6Z2sSl2ujpzweEERlVocyFks0ByrlSD2HjY/TM8KlCgwUsKx23pkM+mqVY?=
 =?iso-8859-1?Q?LS1gIxH4BldDqvEfoIm4gKIeJYYAVOLYQb503dj7up5+94iON076DyV0Ex?=
 =?iso-8859-1?Q?0I8nUuy68Lcs3VRonBh6uoi9EdSHM7yA+shBuFQlLHkrKKD8qVlIjHQBHq?=
 =?iso-8859-1?Q?LL8I8ZdJMvD1a+kTyz7QH8lArKHRndSG7QdGx62IV0IDsXggz/mDKuG7aM?=
 =?iso-8859-1?Q?/ikvjqri6HiMwTzPlDbFjt96U/YCccGYwjMa122pGEh9m1nC6LFtABWhTc?=
 =?iso-8859-1?Q?SqEMkP0Dtly7eo2fOwaXmMNCZ6050tHcDq2jJD7/kGunDpymhazsfYOfLH?=
 =?iso-8859-1?Q?vcGskdBPiRD88YWp55ORGZxml6avOQgpGWiQgR1De6ewvtgJGbyK14hXpd?=
 =?iso-8859-1?Q?Vf6KC1kANtFZdIxrUcTrqbCeLS6w0bF6d2meNHsrMO1ppXdjIvU/RwcBvX?=
 =?iso-8859-1?Q?uUqGL7mFfRyES0jh+n0WWgowEFrBE4+ay/gUpn1gg9avd9L/V4PEnfGrVp?=
 =?iso-8859-1?Q?73fBzQQDzavbxltpeCvZOypDE3dbVxGleInip5z8ReuFxOXsn/eK3VWbsI?=
 =?iso-8859-1?Q?YdceWcDEH4B8lH/7stZ8HBzxVi/8NzKCLPQqBKbk91VArIVkOph11Y5Hv7?=
 =?iso-8859-1?Q?My9QKbrQAQA54SpT369liY7LiL7vc+pxz5VC1y+OTSJfegsXg5lMymC954?=
 =?iso-8859-1?Q?RwRW+kmxtAunk43JueiveSlQ8q299lYfOOsZ5vsLx71XHCWbAmmG9zSp0J?=
 =?iso-8859-1?Q?qNXR2SJ9BPW58PFAWmJH1/Kt8wH7OLVCcbqQ786z2BfiZHM4BqHHstCKK9?=
 =?iso-8859-1?Q?X6EGo9sQ2eMLvtvV84G6CdsyfY+/vChBUeMuFVUdmWH6ujcYIZQ2fKmbM3?=
 =?iso-8859-1?Q?QE/mF+djg0/bzdSfSuy+FuQr3ZFw42cA0HfEejSr8O+T12tluuhjWsxCW9?=
 =?iso-8859-1?Q?uV44HK8024hUkFY3RW7vQnd19DO6nQXh6nLnqw5rDEXQjtcSSQ6QDH17Gz?=
 =?iso-8859-1?Q?8eGfnJI3BTXEXAYbjcdePsDX/T5hdf8O3vaypETQJyBEWgj5CXBi2TwVn5?=
 =?iso-8859-1?Q?LXQMhxcF37X6Q7+TM/sGJ9scz5SGdZKNDLFKfUCfvsrj3iEy/K8xA9Jx4o?=
 =?iso-8859-1?Q?oU6kyltWzKqEA5U4CzqbpeXA8r5VJL3bQEkoscuOt3/GLEjkxjwzpWnfZU?=
 =?iso-8859-1?Q?siygQ4EZbPFVjPkHa/E9pp2pqvDXdPRpeOnC/UVo8ocOD+CPzleYNNzH43?=
 =?iso-8859-1?Q?GWvcTJofPS4VJJJWWjjWhsQcaIG4vnsHc9B/z4c7xMdNjtquUY9OadZVA2?=
 =?iso-8859-1?Q?jA0IiXC0DILIGzLvriTmGm757zWmtnNALtlNi8NW6y8hD+53Zrs2dfE5oh?=
 =?iso-8859-1?Q?/fybw5WoMTtwBVNEtywdbhAxKiENLWAYf3LIPdK8/ofBSjZBV90w3g0an9?=
 =?iso-8859-1?Q?OKCoJdOS0iMMLv0caACZH/j9eXfi2LZr6qEt7yS+tfve20rALfqdvu73xH?=
 =?iso-8859-1?Q?M9u3ZcmVaZWPuabhKvtksHrNsWnpaxDn51VPMtVnFHC1TwKHjZ1khU+kXM?=
 =?iso-8859-1?Q?cV308kmt1g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124609dd-c463-49ab-5c8e-08deebda2ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:45.0539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IO5J0xcbNXBABkF+fihNRpA91RSzRkPDoFNaF4VmNIZt1zEYy6UFblhmPgJizPpOzA8/6w+nQRQVM+ngMrRboZBF7LS0sbDG7RchPSzgkR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052607_735427_1D320DC6 
X-CRM114-Status: GOOD (  10.23  )
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
With the debug exception path noinstr from the vectors down to the=0A=
kprobe handlers and the only instrumentable code in the flow confined to=0A=
instrumentation_begin()/end() windows, a kprobe hit while another probe=0A=
is in KPROBE_HIT_SS can no longer happen.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/include/asm/kprobes.h   |  6 ------=0A=
 arch/arm64/kernel/probes/kprobes.c | 21 +--------------------=0A=
 2 files changed, 1 insertion(+), 26 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kpro=
bes.h=0A=
index a694f7d34f45..bff8ba9c1689 100644=0A=
--- a/arch/arm64/include/asm/kprobes.h=0A=
+++ b/arch/arm64/include/asm/kprobes.h=0A=
@@ -26,12 +26,6 @@=0A=
 struct prev_kprobe {=0A=
 	struct kprobe *kp;=0A=
 	unsigned int status;=0A=
-=0A=
-	/*=0A=
-	 * The original DAIF state of the outer kprobe, saved here before=0A=
-	 * a nested kprobe overwrites kcb->saved_irqflag during reentry.=0A=
-	 */=0A=
-	unsigned long saved_irqflag;=0A=
 };=0A=
 =0A=
 /* per-cpu kprobe control block */=0A=
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/=
kprobes.c=0A=
index 4172998d48d9..1658b6acd803 100644=0A=
--- a/arch/arm64/kernel/probes/kprobes.c=0A=
+++ b/arch/arm64/kernel/probes/kprobes.c=0A=
@@ -176,13 +176,6 @@ static void noinstr save_previous_kprobe(struct kprobe=
_ctlblk *kcb)=0A=
 	kcb->prev_kprobe.kp =3D kprobe_running();=0A=
 	kcb->prev_kprobe.status =3D kcb->kprobe_status;=0A=
 =0A=
-	/*=0A=
-	 * Save the outer kprobe's original DAIF flags before the nested=0A=
-	 * kprobe calls kprobes_save_local_irqflag() and overwrites=0A=
-	 * kcb->saved_irqflag. Without this, the outer kprobe will restore=0A=
-	 * the wrong DAIF state and leave interrupts permanently masked.=0A=
-	 */=0A=
-	kcb->prev_kprobe.saved_irqflag =3D kcb->saved_irqflag;=0A=
 }=0A=
 =0A=
 static void noinstr restore_previous_kprobe(struct kprobe_ctlblk *kcb)=0A=
@@ -190,12 +183,6 @@ static void noinstr restore_previous_kprobe(struct kpr=
obe_ctlblk *kcb)=0A=
 	__this_cpu_write(current_kprobe, kcb->prev_kprobe.kp);=0A=
 	kcb->kprobe_status =3D kcb->prev_kprobe.status;=0A=
 =0A=
-	/*=0A=
-	 * Restore the outer kprobe's saved_irqflag so that when its=0A=
-	 * single-step completes, kprobes_restore_local_irqflag() uses=0A=
-	 * the correct original DAIF value.=0A=
-	 */=0A=
-	kcb->saved_irqflag =3D kcb->prev_kprobe.saved_irqflag;=0A=
 }=0A=
 =0A=
 static void noinstr set_current_kprobe(struct kprobe *p)=0A=
@@ -258,18 +245,12 @@ static int noinstr reenter_kprobe(struct kprobe *p,=
=0A=
 	switch (kcb->kprobe_status) {=0A=
 	case KPROBE_HIT_SSDONE:=0A=
 	case KPROBE_HIT_ACTIVE:=0A=
-	case KPROBE_HIT_SS:=0A=
-		/*=0A=
-		 * A probe can be hit while another kprobe is preparing or=0A=
-		 * executing its XOL single-step instruction. This is still a=0A=
-		 * recoverable one-level reentry, so handle it in the same way as=0A=
-		 * reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.=0A=
-		 */=0A=
 		instrumentation_begin();=0A=
 		kprobes_inc_nmissed_count(p);=0A=
 		instrumentation_end();=0A=
 		setup_singlestep(p, regs, kcb, 1);=0A=
 		break;=0A=
+	case KPROBE_HIT_SS:=0A=
 	case KPROBE_REENTER:=0A=
 		instrumentation_begin();=0A=
 		pr_warn("Failed to recover from reentered kprobes.\n");=0A=
-- =0A=
2.47.3=0A=
=0A=

