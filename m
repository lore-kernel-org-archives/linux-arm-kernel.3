Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06F0C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/0Q7aHooBiqyxSxBMZSuJVXoe/AUeGaK3OD4LagyEc=; b=PCa9Z3uCnl5SvsapEruFM+8Sat
	EK0tctcfg0Hx8cVzt1etHJKCECGAhGFZq0/OT/Kt55MBx0PPSIGQ9zOqKx/46Num6pr8QgLnHcluh
	h+9FajaBbBDUa3CJJe7KHeltpMfJvOgkukglbK3oVJdozq0xc/pU1yzFo+Nw8zzg8udHzXW1yrFRo
	BQOjaKgl65cpbTpPaUEpRFawLUBMycmwTyD8HGXwWArHK0LsdHEeV/GvIib8KKdMY7fYDjzxMZZM8
	IpinV3jHRZ3PZ0rkMtA+2Um2LC50Uxa4xgsQZJaX2+kkocxPJFmVxHDgjC1zaDCc2AGMcCAkiGqNI
	vZPCgDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPK-00000002fOC-43jA;
	Mon, 27 Jul 2026 12:26:10 +0000
Received: from mail-japaneastazon11023118.outbound.protection.outlook.com ([52.101.127.118] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPF-00000002fIW-2vZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfNPg6g9VlZd7QfvzPy5wbOBOReYLtJYc/cvK57TK6eiPyggLqOki6Jpr2pB5QzsK1PAsFwamwZ+YIU42h4aEBpa8XYgtvJogPke1DuRdj4ulSsbLEaC3kPpaVa9DIvkrs317uSoklFbSd5cH353cNajDxiAYev8350t8g8wHTB3tF2642mTh7DU337+TjfaDJGRQTQV1liYbMm9EoYSYJIOaHNvoaaATm8378NL73/JMXkeNs6ayIeTDtoRaqszDm6AdVTqXtnJoD3TTsxZxdL11ueOk/1YgBCAlyxNBYbsPW0NQN6oM/dR8Sv4Iprkkb6Ks4xQo2KKUsPKJYiGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/0Q7aHooBiqyxSxBMZSuJVXoe/AUeGaK3OD4LagyEc=;
 b=uBwjHxAXQxfk7qaBfR4v7mdGN4vDkibmjufWs0uZJ5AIM+TTKG9z4Q6HnJoqqtLQMvB99R8d7++Wjammj9ZRTiI0eVg4CIlL3wqvnlnjEfsSHN5uYZSMhqjGfO6G8OF0kJo6XDGqOITAAE025AYq9U2CTO50Jd9p9EmdZ33e4VbIiP03tOT7Y8EEE077o9qwHc9hoemYQXEQdTktWEvZNMe6rD6A+Xpo0ajF/29ZJ6NfYlzIYu2rouf3c4S4wsFpmrGVGzOlQElaljKKgY9zgBdwM23wY8u4sdC9jhEUfHY9wvXPkNk1PFIAgf0v2gnDZBwmFSQiKPK4M3k6JtzKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/0Q7aHooBiqyxSxBMZSuJVXoe/AUeGaK3OD4LagyEc=;
 b=SGWr5Sb8zpg9SDMp9qZJU6aeGTopKqvTuJxNYsES9wwpYDrLOeFE53q0eDdo2MnC3S8H8HDkNDDLnhtqOKevFTwuhYRF0Rl+Iwfb35jITgqa96jbuFfBJeornxfV0Bp8gVvd+0h3AsCVqL9c+4uMF7oh0AK0wbTwiydmDn5xr2Q=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:40 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:39 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 4/9] arm64/kprobes: Make the single-step machinery noinstr
Thread-Topic: [RFC PATCH 4/9] arm64/kprobes: Make the single-step machinery
 noinstr
Thread-Index: AQHdHcMJrk8aL+lxYUGB9mDjchFthA==
Date: Mon, 27 Jul 2026 12:25:39 +0000
Message-ID: <6be9ac705b5dea5f03855e667f14a4967b55e5e2.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: 6ea3781d-9046-4c42-3a04-08deebda2b80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Q29S7hO14ENNV5C5ONeuAXF7kmZP9jQJrg//Az/5YC8Ru2pWCRnX8b45i8eC8evwCGc/LlzRLr+KoBylAjU3qAWRZtqMfiv8dA5XhBXKlf+3XEyhXdD4NJKhcklKOkkKvS5Ge9rZIoWrm1lUETMiYrpatTLSUEDcBeAnMuabvRuyzkKFj1KZsj76b43gxkOGjS2HNACDrckjnAgyISOROUWrJdO/DQKKUF1uNGJ2lM2eXx11gqv+pHC2GaMKxpl42HxOFoJqKWlScCmvNVsCpCdMsV54pPrmdIIEy8UItpM18ESI1TkAdV5LbVG1x9rJwpqcGdZ2rCUB4Iu7AvE10EE1NXOcmZCtK80sTpLgIEWITiJXqLlaCj+kimQ0w0tzNfTazJowQF3rFA55fY5pkrlMZesEp19FdBUd7SPN0pfnrxetqZXG21HuP1k7oeRvnoRw8g715xV8zIHQcKSPR+kWHRNF7cOpfYiy+v0gvH9NlU92TBSdquDSvhkYQuAbLW5b6/f2MOUEG38oajZUJvAheNoPROwzE1+1yi4JiXTYXvdEkkl7VEHytt+0D1XdtuvsSrWgYgFGWs70xD0eJc9Kr9Sc1AJrCK5e+jfq5+MExz62LDTfHjrD1V7ODM4s4glPDNQeMWSVF7/1/2MEtkbcHifP+Py28o2XCSow64RbvemrKgZ0iP4Yq9SynB2DEZ8DAnQyB8VUUuzqKG+8oaAnBGhmRG6KKOAh0UwGABw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CBC8AUlQSJ02kooLiZ6DSCbDBx4ks6cPXUQl+o6FEz0SckOaLNDjPqRa6D?=
 =?iso-8859-1?Q?BVDwPaEFv34Lw1FdpOsFglc59Ml0rc6sHKWJljByobEmFerpjBQJUu9LBE?=
 =?iso-8859-1?Q?H4Du4YjImibfz07eoyXADBqKfH+v93ZmFMCum/AFl8qeS+0lF/ZITUWu+0?=
 =?iso-8859-1?Q?RNcoqmSNxBLF/bNawp8z8IAyY8fcpgAU/zvqoXms0ip9fNesPcjm1E4QJv?=
 =?iso-8859-1?Q?nXgMBTLLoylWjGUVcrxmC8/zEmQaRvdkDap1rUX2EdNuNmK1iuQhEU0lkk?=
 =?iso-8859-1?Q?+oysHMe/WeLP2P9IXqNAttS21bADrdUl1Pwe4gG7hRYo/FRINI2eDGawhI?=
 =?iso-8859-1?Q?tv+HWWuTsjzud+YhwS5lBWQlxPO8NPeruojIVkQesqxHS0GiaEorHi5zn8?=
 =?iso-8859-1?Q?PpJPKUGyPkUwuex6B1tWb4rd1N4Jwuvcmy/4BOkxEYy6BVUROJXbKSUV+O?=
 =?iso-8859-1?Q?jQJ/jju+Kh8FGnwxFrmBTslHQmdw748+Mr2KxKeTAX+snxlSEz7csdTGe1?=
 =?iso-8859-1?Q?ucs6rq0pOKdf3sly3p7/tQPv0DCtWv8nvTTlhzy6AP7LWqy+lCbawXUYyw?=
 =?iso-8859-1?Q?MnSmUoucI9Ft23JmzeifmzksTaaSNOpkn6sVByxE13yGTd2mNPmwbAxGfO?=
 =?iso-8859-1?Q?5oAN1exoHeYTL1s37nsDB2Hj9bC4krhaPZy9hkZFnshZ0FkJIQ+E2G0u0u?=
 =?iso-8859-1?Q?xH6RAkXgrJEAmu9BMHteoR3ibDBf7k1DEEdMYspNoeGBEo3mKE0V+xFQdU?=
 =?iso-8859-1?Q?Y5LMkJCdWKtfh+GIFzS6bXeK6OUt7LWJGTOSwRDQbaRuu/riiL9Jdt6I1s?=
 =?iso-8859-1?Q?bDRClYlOIEDJ+DCSHnrTSXJjl7gz8p02/zdpbHEyrfiNfAYHK9k+eAjnsJ?=
 =?iso-8859-1?Q?vZZP1UXkcY5qagX42DIN9ag8U99dLEDRpTMcE6IvugQSuW8d5CFjk0FW6b?=
 =?iso-8859-1?Q?O6C77mLnqJb/OF31NTrExam5PiEUpAUr+dAt/rtKepq7xfDVte6LGVxCu/?=
 =?iso-8859-1?Q?AKZrgIFUvplBOWtwlGwmGRhObvqFS0EJVNx5s6lpdp76gvukQjYT3FYguW?=
 =?iso-8859-1?Q?hRmKLSfyNaoxaoAw/5bBACHG/vUBZ2ekdd//TMu0suxVK82rqeNoTSdJzl?=
 =?iso-8859-1?Q?wKU/EB/U0ha3QE8ziOdkvwNjlvfS2ZozOdaDlfJBHfCQ+2znwiEUuoqCeL?=
 =?iso-8859-1?Q?lMFHxNWnu+Jw94NHoW1GK1Hte6GDOD1aXpkup/e55gMNFupSsetU9S9tUV?=
 =?iso-8859-1?Q?lWRt/4eTeO26EFvbl+EKuxfh4mxcQpkTQBhGcK9MIKjc9PUm8QW/gSrn9+?=
 =?iso-8859-1?Q?yHOK/IfZlxy+Qfeyq2ZBcfBZIwI1N2i8PmoMIJDPNd9ibzalAqW0f8mL/9?=
 =?iso-8859-1?Q?ixc/pGemfyybnlKBVdY7XtMm47tLrmc42NOxtzgUbFF+U1Uxdh2mFhCgmw?=
 =?iso-8859-1?Q?hkLVR6TiLsO6IvM0FaHa+tIMOd/ite66umPdw45GtBHrj3KpkXz117nu5Z?=
 =?iso-8859-1?Q?J8G9IZfCauiCHv/C2mucsD2fFHTFgJE+6cV1z4M8+q1xcfFK9JuzoM8JC0?=
 =?iso-8859-1?Q?VBOAHN4g96zNoettSDUka2i7sYH0Bs1W2osaHy5fhVx8V3WibykQBIF8uL?=
 =?iso-8859-1?Q?Uut1zQFKBV/J64EH70TOW1jbkg3Jo4FtLUfV8h8N4AjQ2IEK/SybNb5+hW?=
 =?iso-8859-1?Q?mIloWdrMt0Ps6h/4DI/9Oo3Ry5Y9zFzxKUR3+DtoqWZ6VjCZnKKRYIfnQb?=
 =?iso-8859-1?Q?ulO2sNqnpv5LACUOmSuBqh22FqkJVKCMBC04dLsJGw32q3SKuVo7DgsAuR?=
 =?iso-8859-1?Q?McEqcHgR1w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea3781d-9046-4c42-3a04-08deebda2b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:39.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYsQ6a5c5gApXdi6uLs07CO2W5SjLdlLUmvdj4d8OyVMK0Kbb7/9jkTS+C1cIAhV68kuu32c8DZdpd8fkjtczvv7VRrHqeD87vWrGkM4ri8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052605_742973_441CEFB7 
X-CRM114-Status: GOOD (  11.51  )
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
Convert the core of the arm64 kprobe single-step flow to noinstr:=0A=
save_previous_kprobe(), restore_previous_kprobe(), set_current_kprobe(),=0A=
kprobes_save_local_irqflag(), kprobes_restore_local_irqflag(),=0A=
setup_singlestep(), reenter_kprobe() and post_kprobe_handler().=0A=
=0A=
These functions only touch per-cpu state, pt_regs and DAIF, except for:=0A=
=0A=
- kprobes_inc_nmissed_count(), which is generic and instrumentable; add=0A=
  an arm64-local wrapper that calls it bounded by=0A=
  instrumentation_begin()/end();=0A=
- the instruction simulation path in setup_singlestep(), whose decode=0A=
  handlers are instrumentable; bound arch_simulate_insn() with an=0A=
  instrumentation window;=0A=
- the unrecoverable-reentry pr_warn()/dump_kprobe()/BUG() path and the=0A=
  default WARN_ON(), both bounded with instrumentation windows.=0A=
=0A=
The __kprobes attribute (notrace + .kprobes.text) is replaced by=0A=
noinstr, which is a strict superset for these functions.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/probes/kprobes.c | 39 ++++++++++++++++++------------=0A=
 1 file changed, 24 insertions(+), 15 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/=
kprobes.c=0A=
index 4e0efad5caf2..1b12341b2af3 100644=0A=
--- a/arch/arm64/kernel/probes/kprobes.c=0A=
+++ b/arch/arm64/kernel/probes/kprobes.c=0A=
@@ -14,6 +14,7 @@=0A=
 #include <linux/extable.h>=0A=
 #include <linux/kasan.h>=0A=
 #include <linux/kernel.h>=0A=
+#include <linux/instrumentation.h>=0A=
 #include <linux/kprobes.h>=0A=
 #include <linux/sched/debug.h>=0A=
 #include <linux/set_memory.h>=0A=
@@ -39,7 +40,7 @@=0A=
 DEFINE_PER_CPU(struct kprobe *, current_kprobe) =3D NULL;=0A=
 DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);=0A=
 =0A=
-static void __kprobes=0A=
+static void noinstr=0A=
 post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_reg=
s *);=0A=
 =0A=
 void *alloc_insn_page(void)=0A=
@@ -170,7 +171,7 @@ void __kprobes arch_remove_kprobe(struct kprobe *p)=0A=
 	}=0A=
 }=0A=
 =0A=
-static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)=0A=
+static void noinstr save_previous_kprobe(struct kprobe_ctlblk *kcb)=0A=
 {=0A=
 	kcb->prev_kprobe.kp =3D kprobe_running();=0A=
 	kcb->prev_kprobe.status =3D kcb->kprobe_status;=0A=
@@ -184,7 +185,7 @@ static void __kprobes save_previous_kprobe(struct kprob=
e_ctlblk *kcb)=0A=
 	kcb->prev_kprobe.saved_irqflag =3D kcb->saved_irqflag;=0A=
 }=0A=
 =0A=
-static void __kprobes restore_previous_kprobe(struct kprobe_ctlblk *kcb)=
=0A=
+static void noinstr restore_previous_kprobe(struct kprobe_ctlblk *kcb)=0A=
 {=0A=
 	__this_cpu_write(current_kprobe, kcb->prev_kprobe.kp);=0A=
 	kcb->kprobe_status =3D kcb->prev_kprobe.status;=0A=
@@ -197,7 +198,7 @@ static void __kprobes restore_previous_kprobe(struct kp=
robe_ctlblk *kcb)=0A=
 	kcb->saved_irqflag =3D kcb->prev_kprobe.saved_irqflag;=0A=
 }=0A=
 =0A=
-static void __kprobes set_current_kprobe(struct kprobe *p)=0A=
+static void noinstr set_current_kprobe(struct kprobe *p)=0A=
 {=0A=
 	__this_cpu_write(current_kprobe, p);=0A=
 }=0A=
@@ -207,23 +208,23 @@ static void __kprobes set_current_kprobe(struct kprob=
e *p)=0A=
  * simple and avoid nesting exceptions. Interrupts do have to be disabled =
since=0A=
  * the kprobe state is per-CPU and doesn't get migrated.=0A=
  */=0A=
-static void __kprobes kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb=
,=0A=
-						struct pt_regs *regs)=0A=
+static void noinstr kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,=
=0A=
+					       struct pt_regs *regs)=0A=
 {=0A=
 	kcb->saved_irqflag =3D regs->pstate & DAIF_MASK;=0A=
 	regs->pstate |=3D DAIF_MASK;=0A=
 }=0A=
 =0A=
-static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *=
kcb,=0A=
-						struct pt_regs *regs)=0A=
+static void noinstr kprobes_restore_local_irqflag(struct kprobe_ctlblk *kc=
b,=0A=
+						  struct pt_regs *regs)=0A=
 {=0A=
 	regs->pstate &=3D ~DAIF_MASK;=0A=
 	regs->pstate |=3D kcb->saved_irqflag;=0A=
 }=0A=
 =0A=
-static void __kprobes setup_singlestep(struct kprobe *p,=0A=
-				       struct pt_regs *regs,=0A=
-				       struct kprobe_ctlblk *kcb, int reenter)=0A=
+static void noinstr setup_singlestep(struct kprobe *p,=0A=
+				     struct pt_regs *regs,=0A=
+				     struct kprobe_ctlblk *kcb, int reenter)=0A=
 {=0A=
 	unsigned long slot;=0A=
 =0A=
@@ -244,13 +245,15 @@ static void __kprobes setup_singlestep(struct kprobe =
*p,=0A=
 		instruction_pointer_set(regs, slot);=0A=
 	} else {=0A=
 		/* insn simulation */=0A=
+		instrumentation_begin();=0A=
 		arch_simulate_insn(p, regs);=0A=
+		instrumentation_end();=0A=
 	}=0A=
 }=0A=
 =0A=
-static int __kprobes reenter_kprobe(struct kprobe *p,=0A=
-				    struct pt_regs *regs,=0A=
-				    struct kprobe_ctlblk *kcb)=0A=
+static int noinstr reenter_kprobe(struct kprobe *p,=0A=
+				  struct pt_regs *regs,=0A=
+				  struct kprobe_ctlblk *kcb)=0A=
 {=0A=
 	switch (kcb->kprobe_status) {=0A=
 	case KPROBE_HIT_SSDONE:=0A=
@@ -262,23 +265,29 @@ static int __kprobes reenter_kprobe(struct kprobe *p,=
=0A=
 		 * recoverable one-level reentry, so handle it in the same way as=0A=
 		 * reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.=0A=
 		 */=0A=
+		instrumentation_begin();=0A=
 		kprobes_inc_nmissed_count(p);=0A=
+		instrumentation_end();=0A=
 		setup_singlestep(p, regs, kcb, 1);=0A=
 		break;=0A=
 	case KPROBE_REENTER:=0A=
+		instrumentation_begin();=0A=
 		pr_warn("Failed to recover from reentered kprobes.\n");=0A=
 		dump_kprobe(p);=0A=
 		BUG();=0A=
+		instrumentation_end();=0A=
 		break;=0A=
 	default:=0A=
+		instrumentation_begin();=0A=
 		WARN_ON(1);=0A=
+		instrumentation_end();=0A=
 		return 0;=0A=
 	}=0A=
 =0A=
 	return 1;=0A=
 }=0A=
 =0A=
-static void __kprobes=0A=
+static void noinstr=0A=
 post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct =
pt_regs *regs)=0A=
 {=0A=
 	/* return addr restore if non-branching insn */=0A=
-- =0A=
2.47.3=0A=
=0A=

