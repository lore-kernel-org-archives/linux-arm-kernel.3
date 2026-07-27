Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF83C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcVYBT25yXSYu+o5/kQP3nZCKwHJc67obzg4sQAzJG0=; b=UIa8KFXv8IXYsp1gUAr5Mq+ths
	lHnO1DQbw9FLQdI95N1jh4yhyUSjAUx1wti3Oy1iwTEzIkX28AWsU2IzVXOSO2s+JatYeeGW7p+3E
	TnOL+NTCNjPQH2xfubvCbRUeQ6eu0Tp5Mhr1aGRCYpBRdGIW0hjRuXDVivLepxfaQhNrU2JCMSsst
	2sNzV2Hpy+GOWjAtnMYwsJIKmSlb9JSDsLdSxl5mhCbu6jmwylm1vmrboldB7ndbgjcUk3Orlk1fX
	kcWklRuDznCifDkII8t3m+1RQU89IFO0o4Eiua2p7RmoEtrc0YeIxl9KgKxiJUk33U02LnNlZWbca
	loBL6Bmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPK-00000002fNp-3Yhx;
	Mon, 27 Jul 2026 12:26:10 +0000
Received: from mail-koreacentralazon11023138.outbound.protection.outlook.com ([40.107.44.138] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPE-00000002fJ3-1goQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLK+5yOjHnH++CvCSjcEEQlSMdOSqkfHCOFzek/AePrFZAPtO0LFA/eJCYfMrCvMZzYnOxIiq/AgXscthaKKI2dapW+BbofydFEpAuaJqvTwaXUHAfpyo8jwhSqklSbPGibFd1Q1TqWSJScwqR49CB/N7R/5SLXOuodlEpb9LaUp66xvMEiWsN7UJnkbkgsHgTC9ENl5WnOWLpy7EM5wVNL6RGkOvhqCLn0BXUv2aC6M/kT9Z/I5+el61pYQyrDkTCYdK0+PS4ILetNG/qU506e4nwqc8JvFeDVkmrId1+xWBlKpv3AHQPUItkMpEA1Lsrmt3zuSoIliZ7jGZto+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcVYBT25yXSYu+o5/kQP3nZCKwHJc67obzg4sQAzJG0=;
 b=j4dAg5wvVTgJI+EhrkspQOi5zhi9c1lwgA9cDfCyL2O6DDbm5T2/6GIR+AZzfdfgastSlFtdWzIJ72f2XYJCXSRiUaRM/S6NYhLte9bhIv3yU5h91b/gf7OtSd0ef3PeK/sgj4W2kuhX1DJ8eFCxWpuJwHVjkQaf54gT993+7enJSHmaFZuJLByc3xtdhZ5DhWvYgdyBEuHzHMC5/zk9I8sjjkgq9fCkIpR9AFuCn5U88l8gQaRfFIbuLvDGPmWqR+Urn5c0VdhbXKGoVWnDFTc7QW7jjbBnA+ik9JL+1YWGg5ubhhIdQeUFGR2TTn3Spa6Q4KW+1hpKHEsJ4y8GxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcVYBT25yXSYu+o5/kQP3nZCKwHJc67obzg4sQAzJG0=;
 b=P+A1ySMHQOq7e3mjJ29F8rTwZN4dvWvo0MsG49zyIqSMT4OSzaDPZ1lVxtUW9qXfcI99x8mykkcHU1ePiJTU72Ol8E1ZV1KlHJkkNo6pjlMjjnMuJJs82BNNijbKIh+sqem5V5NVbSOaUMnyHGLonbgvXNjGJIe3v7dcLUCKnec=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:36 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:36 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 2/9] arm64/entry: Make debug_exception_enter/exit()
 noinstr
Thread-Topic: [RFC PATCH 2/9] arm64/entry: Make debug_exception_enter/exit()
 noinstr
Thread-Index: AQHdHcMGIGbIGmr9Dkuqs6C6/tMazg==
Date: Mon, 27 Jul 2026 12:25:36 +0000
Message-ID: <774d423f462ff2c245e5f796dad98dd1740fa5f7.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: cbc3f5e8-9e9d-40b9-12fb-08deebda29a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: DLqmb/9X6BgPidyndAQKjF+ud9SxtsC1IRkN+WoZDKiLjY4UTzyj8GPao7GqXygIN04ZX9w6sKShb+EeWJ5MEnejyaf8RiEmCNFCaxCUZVW2MN2PG0BBF1oDY+RGbJjoYP/OzdYRK7Sa5UBO2Ys3iBGEOHrVX8dF1ZCd9YrrmWlRH8RApq7W024eTujOjsrx4Arr/zBeJtNBFF5QksR3a8HJYzUTIo1HY5bseEjiLnMG8eOr9l8N9ErgIIPjxHwJC2DKS+9tGoFdwbkL9PVX/mIkJYECvsB757wwz9RpHiIGtRU/8GdgfZ6UGGd8iiV7kcFaLAof8gnQj2XZGLDHCfSEJULGpKYe29b2CmzzhJmP71dsZAmXtpmSrx513+NsMqWnbdcM3lDt8HxxYsnpNIzuw3MRBVnWAq8DNIsWVUdOoe3H9X78OygiPHVOAZBpzCFdCY7uKtdPa0L3s9qYgsWC7MHEjHMpfXILzaB2QUlXAHRu7eBPyx5sFY35ycCvdjplT4UTq5a/2o7psFL9O7sxDqJFeyu2cRhR9ZpKi0jNvHcIwOhNZsAkunSaeUN/15KmTCO+IwOP7Nn8Oz1S3TAULb4T12G/PbBbFkDVSR2Meq6Y3U9pI8XyZeDkrR1yaY14ypj/XSMK+05j8vdmIJqVx85JMnY2MCeq5nyUJ1SKlIjTgRkowUvPjNeuMzrYCuap7gUl2WcAzY+PFTINBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XHrDibJ6saasdKKSuzwSzTVz+AdPyAFm9nem1i+4F0sYA5vBIOI5ae0YvZ?=
 =?iso-8859-1?Q?B93up9znBsKmKNRerz8nwZ9dMxfGGb18cwvzhmlUQFRVAKy7eCMBssp89E?=
 =?iso-8859-1?Q?KQJFeXk4kOvXzNVWyiCqpYCRX8r3EKrGyjJJPtY/+8pdowV4gKqdzjXCIK?=
 =?iso-8859-1?Q?oB33vrwMLQo98PGnnNqF208++eenMnB8L7fi6oIYI0GCWwMqhaGAbq3egN?=
 =?iso-8859-1?Q?jEtirrKLaxDdgKbFnm04hXtvnyjfh9YTOPuZfZPO1S4D5rRr3aO1OoJ8k6?=
 =?iso-8859-1?Q?VQdFjMythAgQVwrG6iB3uEx+Kr35c4HgaSLuPCsQtATH2rZFN64AyUTBdO?=
 =?iso-8859-1?Q?Zm41MoJfjiiLADvSbSMaMZK9K08U0wjJHTc7hlK7CaBSKmhEHJux2GW5r+?=
 =?iso-8859-1?Q?DQuqGWZvQVzxim9QzshEl/oXupGs5wlYiAz23vlkakDTsuxF93pBHD5L90?=
 =?iso-8859-1?Q?njh+mL66uxkdDkmBS3aD4PeB1Xvh32wY9yVXneXbbl+uRfRnvamdydkcCN?=
 =?iso-8859-1?Q?okBIPpcAOQn44qqMfaaKyi0L6km0+RfSgNeZSZDVNtwRsvJ9k3cnDChzLo?=
 =?iso-8859-1?Q?n1a28AVGtU4TEd4Ejwn8MiEwt0K/GoJZLxJ//ctd59+tBXmiuFaW3+ESsc?=
 =?iso-8859-1?Q?hnKL3iU3GN93GStgFBpARS+r5UnHP/YTak6vT2iltcUpIsWfkA17X04QNW?=
 =?iso-8859-1?Q?1lDYD5L42HDE0y9imm3UCB2M2zgZbspP1N56RHxFtQrrtUSUYSImQ57qvy?=
 =?iso-8859-1?Q?AfzaCDxaurvbdqTheuWn03qWea5oYqt/P8fJYqDSXYMf0zfQqugwVIOhQd?=
 =?iso-8859-1?Q?fZxQ8SQX6yAlMsX1dZytV8crWUmYhCcuSpdTcML5YHxGnxqxBvBuE3rVYk?=
 =?iso-8859-1?Q?YPy1hPkqsizxG+llYn0XNAJd8GJs1MdQp4KcwKLinhU7/+6M3ZvE/QI+Hy?=
 =?iso-8859-1?Q?EbMTOYYY7ekK23G+T3X+vLYR7N1+mZOKlDxNK3TKYWeZV3AnqfUtR4fp79?=
 =?iso-8859-1?Q?r1BqzeqNTVqnUM1UzqK5//hXdznd7NIkfks4FgR6iNCKiHwo2dJeSiOOcV?=
 =?iso-8859-1?Q?/cPu8NqNiRrY935/ro5hd0JgdJi5PbzL5/wHB3fQT6ly9FWiuhjOHb+NHp?=
 =?iso-8859-1?Q?kQBY4BXFvbynFjppFFGFCEySpMS0I0E9cOm2JgQN64cuMhiURqbmhwSzXt?=
 =?iso-8859-1?Q?n4jHO6evb7XWGIsoq9qlf2xO6oyC5hnjGjvJZNsgr16qxwOvvxTwn14BNE?=
 =?iso-8859-1?Q?XN437siXFGbDQ7IiZRiFUzws3MhvDgVP2f+16tsbqPapUFfQ5tpx5s6fHM?=
 =?iso-8859-1?Q?pdAiy40KpDYF24Dgs6h/kfN4arYLAvBUutsqw9iMmggIzhkSvWMER1eTZ+?=
 =?iso-8859-1?Q?zsWm08QkpWQHvnPA6YzPfJxso/bFh1SwQW4mVi66zFHdFNaCHKUQ1/W8xk?=
 =?iso-8859-1?Q?fDwAyM1H+Gu8P+BMYbZNQo10nyjrnADXpemu+LP51i8LWL/t7Q1aEDN793?=
 =?iso-8859-1?Q?tT7qQP95ljN2dl9jscyIKDri8fhBv+uhNMgFxq99Bai1dF+POGbu9viPu1?=
 =?iso-8859-1?Q?7W2lIziSipI6u0D82dg2RQBTPFUkoCBQKtvJQU3cSnZ6m/VHYimEK2dkUb?=
 =?iso-8859-1?Q?sEiAof8muYz7l22Zy4xGGgF7Gteb5Q2YvN7Ec0KIoGVxJeTusXf5KLDckT?=
 =?iso-8859-1?Q?+xQVL6MY4jMetbWFlwb7RRkNaOefzILfb2UEh+HZaDCAO9xpC4fTtvLs8L?=
 =?iso-8859-1?Q?8ZP6VgKxVf/gMK2UW7lBS6yxDEackZBf8ESc98FId1Y9FYiRPnMMeNaUMy?=
 =?iso-8859-1?Q?q1RzqlXmpA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc3f5e8-9e9d-40b9-12fb-08deebda29a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:36.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hCxvv/nxIjttOtbsYsOJPl+sr8ya5KdTpxaWTq6yhmXUkrEvcdyJt6yIgzyU+VRhPlFJ412Ag/WI28nPGrqToNLuxgflv4eHXUDcxJnv7LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052604_448002_B5DB368B 
X-CRM114-Status: UNSURE (   9.09  )
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
Commit 879a6754d3d11e30af24b7dc486f561510d62641 ran into a crash because=0A=
debug_exception_enter/exit() triggered page faults caused by perf dwarf=0A=
call graph tracing. That patch was a band-aid on top. Instead of trying=0A=
to band-aid all possible paths that can happen during instrumentation or=0A=
perf tracing, simply make both functions noinstr.=0A=
=0A=
Drop the RCU_LOCKDEP_WARN(): arm64_enter_el1_dbg() runs first and=0A=
enters NMI context via ct_nmi_enter(), so RCU is always watching by the=0A=
time debug_exception_enter() runs.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/entry-common.c | 24 +++++++++++++++---------=0A=
 1 file changed, 15 insertions(+), 9 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c=0A=
index 466529cce1c3..f06b5e2437cd 100644=0A=
--- a/arch/arm64/kernel/entry-common.c=0A=
+++ b/arch/arm64/kernel/entry-common.c=0A=
@@ -293,20 +293,26 @@ static __always_inline void fpsimd_syscall_exit(void)=
=0A=
  * accidentally schedule in exception context and it will force a warning=
=0A=
  * if we somehow manage to schedule by accident.=0A=
  */=0A=
-static void debug_exception_enter(struct pt_regs *regs)=0A=
+static void noinstr debug_exception_enter(struct pt_regs *regs)=0A=
 {=0A=
-	preempt_disable();=0A=
-=0A=
-	/* This code is a bit fragile.  Test it. */=0A=
-	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");=0A=
+	/*=0A=
+	 * debug_exception_enter/exit() can be quite delicate. The normal=0A=
+	 * preempt_disable/enable() can be instrumented or traced by perf,=0A=
+	 * which leads to a can of worms including triggering page faults.=0A=
+	 *=0A=
+	 * Instead of trying to make all of them work properly here, just=0A=
+	 * open-code the simpler version of preempt_disable/enable() and make=0A=
+	 * enter/exit() both noinstr to avoid the entire complexity.=0A=
+	 */=0A=
+	__preempt_count_inc();=0A=
+	barrier();=0A=
 }=0A=
-NOKPROBE_SYMBOL(debug_exception_enter);=0A=
 =0A=
-static void debug_exception_exit(struct pt_regs *regs)=0A=
+static void noinstr debug_exception_exit(struct pt_regs *regs)=0A=
 {=0A=
-	preempt_enable_no_resched();=0A=
+	barrier();=0A=
+	__preempt_count_dec();=0A=
 }=0A=
-NOKPROBE_SYMBOL(debug_exception_exit);=0A=
 =0A=
 UNHANDLED(el1t, 64, sync)=0A=
 UNHANDLED(el1t, 64, irq)=0A=
-- =0A=
2.47.3=0A=
=0A=

