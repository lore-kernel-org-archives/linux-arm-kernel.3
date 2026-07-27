Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67536C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TajQysbQhAvpeIS8LMNM5wLATY0iVLQF1nzveV1paBs=; b=XCNbMcuggywvYO9XjiMnGDNvEu
	+Ky7/Y+Snh52ZjU6ogFalXeYvyXLAALzMEaKSEUVUXzj7GET8NtszoE2j4sF6IIWlzR/WCwG4ntf2
	M8KJnT50H49dCCLQ//r4tkLL1cm6VDyhWRPwdB9S3rkx3TyJUl03TlwufQSJh2oU99M7dQ6CBECIL
	44ElB+HA/Y2MG8CrxfmfomXy2H9RRm0Is79KGVIWeHZvDOGpo9bLL95Q+ObTU70QKgzcBrzJVpzCZ
	hT78IluD3qIkHar7b95tiStGIaDNUR8EDtHEW9eCmq/JWglCB+e8AlhhJqDv3UmO9/2OqNnUAKfmN
	hKhzNvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPL-00000002fOl-143j;
	Mon, 27 Jul 2026 12:26:11 +0000
Received: from mail-japaneastazon11023118.outbound.protection.outlook.com ([52.101.127.118] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPH-00000002fIW-0hlT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnaGpyoGXc97eCT/ihLfSy0yZAJ87fGM3PUg3dKiVakkXrAxvZuf/KINtGecTpEBBSl2i421eGkosyQdT2VN+/KQe1h1v6+U+ipDFSle6aIgUFY4EWamGk1qn0ws/DsoWs+3F4aPyY0GUghwB91YiGs2NHHNkWOvhVBBEjU67t1yX1O8cSke4SEzxuEjP+NDPVYu0NxqiOAPyReVCdwmAZjZb18JHPii9BUGWIV+0/kbVYabEWC7qA1DEcc4DF3XYK+5FgDewSP97MY6TDHcYGYxQsEt+9+CpeyNw0/dAdh1cg4JCd6sC4W2yR0P2LNt5LE/+TK5tNmWxVuAMbqiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TajQysbQhAvpeIS8LMNM5wLATY0iVLQF1nzveV1paBs=;
 b=sa+CEQrmXKCOiwuPQaWq7yqWEJNf6PVhh9fWIXalPVQK9Ku4PS7va/vA8f5ZO4Vp8NL9e7ZTYO4iSkcAnKyj6b/1CGmJmOIfy/qXJ22BxGxqRfcBktIZfOCAkHLrH4R3AKnx2BF+gpvUvR/DGVJLYBLZY8JzlFhNiIgYj6KJHmCNH071PhXn+d4x6uXG2DR4kuQVEYQYGNwi50nR91gOLQS8MoP9j5lHA251MKVrv/AUd+URqrFDyHACaz549Nw4ZTva5iN3ZUUFo3iXsJ/u7rckwiVztszTxybnFnMEhSdPgyQ0jqEIY+dNe5w/Lr/Ds2erx26mqKrsL/mOUm8W5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TajQysbQhAvpeIS8LMNM5wLATY0iVLQF1nzveV1paBs=;
 b=jJWjEoiePMX8DKiFReiO8MuCJZaU2I3buPi0nOluQTAhrSJGm5OYckcysYW6IG//QDgbO2GBtHyibV/d6AwoK77FsMWu6PbUHwB0F9yJKHc/rXwd/n24Osxs8Z/PbFWokRFa3LCeuxYk7uf2TpXoByXPBVYJmaHcAiXCKlFxdMo=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:43 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:43 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 6/9] arm64/kprobes: Make kprobe_fault_handler() noinstr
Thread-Topic: [RFC PATCH 6/9] arm64/kprobes: Make kprobe_fault_handler()
 noinstr
Thread-Index: AQHdHcMLnDH+E+QiOkqCwHQFbscIjw==
Date: Mon, 27 Jul 2026 12:25:43 +0000
Message-ID: <c18bdf933f9712d9c1d5c06a6c07600d8e62746f.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: 0cf9f42f-da49-4bb7-06e1-08deebda2d92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: n7LWOzW2JKmLkcSxLYM+nkRDjEasvH+W0H8Qe6N4F+46Cf0rBaYhAsAGtvTG5JlGcZdvSd+m8BxwsDFQWQ8pItnDUK2zn9W4BRBz64nyQI+iApGpOY40I31cfBXWodzC1Zlardkxj6LJ1/L4p9inFaAqxSw7hNIcyKMaD5ftMmhoAeeWW8UGGjpBNOGSLASQPJjstbkIVHqqK+yY9ZkkzGIOkhvMTanacBIa2Rezzb/5MmMCjCC2xyYpheyNIgq3NMKZ2NPrQo4G3GvrWlizdvvgpCe6iwAzKSwonDnwcNdMm1G0RAqHMGTJVhEZkri6VKs/0W1TjLQaK04xVEv4nFyw7MehvJloBEAz9Husl9olN2QLqLLfLEeMKo8o5hqrr4hamoPBfG/q5TiEUaPFv+bt1If38MSzoH7ZRXdxFKI07kgmzX6GsLzqXQf9vXIsOZcrjnvB5Xm2V470SFfZPDQg3L0uvj3LafIqCboZyM4uRCs4hp23JPC6ThnmrTtNgxNb4lNOES/o5ho4gZ5lvIKz8RvxBkCIPe1C48u7+8DzcbLNPgabKcxNTGJUuQkj5mfJ7rnZ3Vmh3KTdznzSiLay8wlYgggL2li2GaT/ADYRmhfSLbsBNWmUxlZc7Dp1ctTARUICAy/Fw12vZDohK8NsABM8gXLobVLm493nh4fO9aZOW86O69KwSYLQrcgEZHdVbVVIXBoGB2ZCD6kiJQ9i3sJ5UolyY7jgbIOEjFs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PluKxpxI448za3lQC2xLHnzR9N042ORCwbUb8TM44HBb5YmiOVOc5yZWDa?=
 =?iso-8859-1?Q?7sREoh75mApnFoasNbk9kIpu9fj6iyniSiLCRdpNSOfM53FkrdV0qNVokt?=
 =?iso-8859-1?Q?Gt4W0LIoSNToWAYWAbmiixQhFL4VK3DTeB09drhAcTuio7aYKn48nB3Ag0?=
 =?iso-8859-1?Q?XwNQ6GohpxlaLlBKi2a30Nj0okSDU8MkthZlLv5Yu9mJvMx1W4kVM41hEm?=
 =?iso-8859-1?Q?jOwAcQWKzzDPvJlDt2KP1vGK+F+OShOViS8mOLk8WZMezZhO4HpYbz4GrD?=
 =?iso-8859-1?Q?YX0ExaiJMR3yXFQGoZ7/ovDk4Wt0w/XSpG0MYqSf/ShvNYHzbOZ9sCJ5yP?=
 =?iso-8859-1?Q?7mNTJdR6nRNpDCEZpx7rWPQOnqmHpFfqEs1jAZAXI4KuRKOhpuFTeLd5/r?=
 =?iso-8859-1?Q?aNf/D/tPwLJ64T9s0AFhc/9C/IX4qdAuIQ2fRmcnkT+Xh92WPnt1Dz8lPH?=
 =?iso-8859-1?Q?gGblbAjtP9qoNMNSwQc7YxypdtOnFkcwKR4R+OHt9l4GYU0psYgmZnek1c?=
 =?iso-8859-1?Q?yassaNzpDkRzeHHxSmr3pUeVpDrGqcslY5QeMCd/8krLylP4y8+HVwH4pL?=
 =?iso-8859-1?Q?Us6ozlGyRmAqwrsGmX4Y1Q++cPTQWlLRQcX4kqZYCo7eH73hWzys+QnMfv?=
 =?iso-8859-1?Q?TcwpzE4gUMfxZE2CJPVN5c+DZD06nlrZpXdXJoPxiIpVOB37qLi7/pnBsa?=
 =?iso-8859-1?Q?O2oJasQBcP7yGsU4dHkHH87KRWQiO/0JFOZz60fzMS6xrWLv4xXtnl6Cz5?=
 =?iso-8859-1?Q?J8SlQ7cMstf1gKW1wSvunyna8GviY1ql6hbKB3o+JBMVOW1hZARPUw8LGP?=
 =?iso-8859-1?Q?RVpeeuL76iDjonFM022FAJ5xUUBav7dBKa4ied6fp+t21/qB++frdqGUUy?=
 =?iso-8859-1?Q?7/qcb7Q+oAyyI49m6NP7zPzp4Xjl50JeHEMAso40njECRvaCwLSPg31tOJ?=
 =?iso-8859-1?Q?PeidCDu/nWsOAH0y396TA3VSEemeRJdhh1Qz04k+s0jj08++hbX5svji5X?=
 =?iso-8859-1?Q?Ly0bi3lCVIRuFm/mVPdglgsrZbhJp/7vN8HssmK9Jq8Ia6PTOGxRCCsTc1?=
 =?iso-8859-1?Q?sxI06g4heply0SZpJDN84luGIgz3wYFVnAvQ3YP981TiMybAEOXllsOSna?=
 =?iso-8859-1?Q?euQQggAzbbvYCG8PX3YauLUguwPdK0TwdUjY+CQJtTporZNrDkulWbjgK1?=
 =?iso-8859-1?Q?VMst4nEIuMg9frSGfCx2h620qaTSnDuI/+XxKt3sjxeNvvbkgbUjiMHY1X?=
 =?iso-8859-1?Q?VdubE3wdGLMuf+vaJNBLmLLrpsdajna5ZR88nX+JB9h9abo47NlgwlXbb/?=
 =?iso-8859-1?Q?u/w3xhVt8vnABeSpZvh1qlw+AASHZGuK3iLzVnh6U45L9bggZ2EZTIdoFP?=
 =?iso-8859-1?Q?ZPH+1vtEOTeThm+/QUPwAG64h1P8yPAA2l+GZ+fW1oj05t3Jn+yIfC0VuW?=
 =?iso-8859-1?Q?LCVhkqXN4wbppjZ1MMGW2AXHy59LBx24dNBsY1w7TuIO323jsDfzSgxuCn?=
 =?iso-8859-1?Q?Iyel5+aFAujPgOJnpuTaXKwL3EFSYiVsVyj89i4sdpenRu5a0M5P+ll8uh?=
 =?iso-8859-1?Q?foGW4TcXNTcpht8Z65VU8wUcL3a+vaBAY06tpvPY6PAMT/REU/34oYhRlv?=
 =?iso-8859-1?Q?F8nDqeaXchQHwCYJ9yMc5bNZZuByuE6C/EGFfh9fuiNjVeIOodDhM526ZJ?=
 =?iso-8859-1?Q?fMwUWYAjEVIg/OeNZIQZ0Oby1a7/sKxzxRJS9hJNV21cmXoKK1Dz/E6cmi?=
 =?iso-8859-1?Q?1g/eZ7bRLVvYSZCXnzVE7bQRFSfVYGromtORpp7zkOz6Ba4HA3KOrAsxEC?=
 =?iso-8859-1?Q?n7xJKUcJWA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf9f42f-da49-4bb7-06e1-08deebda2d92
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:43.2888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJKnNZw0BN6ARWDv5rn5wI0AUSmTM08daL7akmKG21CswCT0pJqoefzyX/Mcb4LLt6j4lVMrL/bVCtklPIXm7tBdcUfLQzEy/idXWxcxfKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052607_229945_333159EF 
X-CRM114-Status: UNSURE (   8.78  )
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
kprobe_fault_handler() is reached from do_page_fault() when a fault=0A=
happens while a kprobe single-step is armed. Everything it calls (the=0A=
save/restore helpers, kprobes_restore_local_irqflag(),=0A=
reset_current_kprobe(), register access) is noinstr after the previous=0A=
patch, and being called from an instrumentable caller into a noinstr=0A=
callee is fine.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/kernel/probes/kprobes.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/=
kprobes.c=0A=
index e9fa66fa4217..4172998d48d9 100644=0A=
--- a/arch/arm64/kernel/probes/kprobes.c=0A=
+++ b/arch/arm64/kernel/probes/kprobes.c=0A=
@@ -310,7 +310,7 @@ post_kprobe_handler(struct kprobe *cur, struct kprobe_c=
tlblk *kcb, struct pt_reg=0A=
 	reset_current_kprobe();=0A=
 }=0A=
 =0A=
-int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)=
=0A=
+int noinstr kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)=
=0A=
 {=0A=
 	struct kprobe *cur =3D kprobe_running();=0A=
 	struct kprobe_ctlblk *kcb =3D get_kprobe_ctlblk();=0A=
-- =0A=
2.47.3=0A=
=0A=

