Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEkdnBWFY31e9vqj4SyUfcFH3DVQhsNEgBtd4HlErSc=; b=sIrcpLnpf9TdjnXHF9qw72Rlwc
	OJ2oV5RHP2X0mI8bmr66H85+iCIKDorR1UBmi/lYow6aFtxoZPZTvIFFyf+Kup2ogbnuW0qTMaCMQ
	0fK8ANPVmX49+Wyx9YMSyKQ4qgkke9x/p+c5pECZijRhVSchgDiQOAuBNMjT1y9MDzetD92FjKorv
	QipUyti1dCdKJwjuRrXs/SECIVD+8oG8f/HpaGEsEe5uj2gY/49Ek9EK4mK0rY7mOzDxeOaXXX3jZ
	wexjYdcP86ncgQ+Mbg9hQT/O6yN+L3xr1Vfw7PdbRCbYs78KwCpZohj51DPLi8kBEcoV+Ziy9uvc4
	g2hWDoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPL-00000002fOc-0N9g;
	Mon, 27 Jul 2026 12:26:11 +0000
Received: from mail-koreacentralazon11023138.outbound.protection.outlook.com ([40.107.44.138] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKPG-00000002fJ3-07Ox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvuczFPDSFKbHysFU4R9RGdY92SfFXreIPb2P7CqOkqRjZv0Z+dh8RX+BeJw0J44Zf9djBDSe7cSTigZXa8CMtk/WzIyNgLsZZWNWezMRmFxAEoBgXOOrKm9XRtDziq7yJRcawWceEkGYjzXLIn3KVOUNgeb98RCyxyVrI7T3iGYCx4y+F1H6oGNPd5KyLEVpFomP4Aq54PrY98hpc8CAt79YTk+z9FbkOan2VRASGLQ2hit+63YfJShkq6NWQ4/ROmRgpq2QHwufzUBOy40QAA2DiSkryHmAAKzQqOHXuntpd6E2O2W6UsNJywCw+MaoFdauBrDixV4bfe+G6f/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEkdnBWFY31e9vqj4SyUfcFH3DVQhsNEgBtd4HlErSc=;
 b=EYzt0FOkGxdEXDgP8/nNztKXMthY1zT4O160R9J0USTWPJWdZMgz7/1LgekkxtbxJSGwdxtUdHy19sPi2JRnQPMCAlIIbYFcHy0I57uDD3xupFHkRGfKFHLR97KiwlwT9vI+MfegUgLGk5aIPtcaTm/0/kMwdCtmknF8vp4C62qyIDcrdpICfXzvAxL6h0BtNGTOA8omsgj8welQCG/BlRB4MS9l5iaxKyQqwEs1Mk5BsOqbjhBYQnmF5ycKdEb2bUKeei6Wmzid2oglL51j7duyroIMoPe20HklQnLTZMUrgOnKXJd2ilGnPMryMlFmNsbMyX7ktO87hUPCquUm+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEkdnBWFY31e9vqj4SyUfcFH3DVQhsNEgBtd4HlErSc=;
 b=QbstccQ3hIGhop3mU+wv9JOByABMrMMOtkOFMcRQskkhIXJ8bGy2rjPsS2F0MW6ktZEW0h4EGiSqIo4/NQsolhsBKlPYFE1l8wTdi1HkGYMwH7oUVAj3CsWexhATAlkJuXHwAaYiRuVYn3QSB7nTp1WdnkkpxYgDjDRuH0xuJoY=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by TY2PPF7B73AC350.apcprd04.prod.outlook.com
 (2603:1096:408::add) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.8; Mon, 27 Jul
 2026 12:25:41 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 12:25:41 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
CC: Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH 5/9] arm64/kprobes: Invoke pre/post handlers inside
 instrumentation
Thread-Topic: [RFC PATCH 5/9] arm64/kprobes: Invoke pre/post handlers inside
 instrumentation
Thread-Index: AQHdHcMKoFsJAesnR0SsfyaA+/8OFQ==
Date: Mon, 27 Jul 2026 12:25:41 +0000
Message-ID: <400e92624124bb2f0efb8757032d1326ccd51d6b.1785153469.git.hongyan.xia@transsion.com>
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
x-ms-office365-filtering-correlation-id: c7298f57-9ebc-4bc7-d2e9-08deebda2ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: QtPTO7/Je5eBZLFZhGmu50boJToF7+5loUxRxLiW3UFD70c8yNA5BmdRpCyuLl39E36YsO0RiscMCXfwbaj7chZ9njQP6SX8ZLGxPLQQMAtUhT8qbj+DubT6BHQxHzKHKRcmDbCuxgAEhEaWrEt9I0YCZdTmzRFNJmBon9m8t+BqYGAmCfrifat0FcyKLRSPVne2dvqIufYd9MV9E3893meA9ZYCwl+Q3egFMpvDN8YuMnjxo3G0rcOwPDc6Q5QzzfN3yVcEZYLmoZyYi/sqb+OjeZkNk77oHq7b2Oi2uzR7BHBOnGJ3H1m6y6ZjCtG74tBbaJBJhIDDJ+rwiF+aFdw0qGkQoYtFC+pZXYaSqvRG9hCrRkxJINs/scv1/1aGM17KNKxztWUKjzdNgGmNNLxcNOMxbCuKI/umIbONXoyXdDLwZUuq0f1SxI+QUP8BVKdFen/jL+z37iASJG3wNWgzEUewa/U+CVDfYs1BbLmcYXOsHlftI/85azmXP6mo7TUdys/KjagdBi/YrIlNFrieV+qy8w0Q8iyCQelnb20t5jROb0/kJ1bbNVZc7EJR9NvnmQKCI3lqbUrdoSCPWjAQUneDM2PMVYSvMbbL7dxJvXdyCluSiHnHSaRYDtAeTcIZriVpCOQmhCgmgbIL/mOcmhkP1PLQgvOKL5F26d4q1qu+huwuOP/8RRL+W0Y/zaBSAabVHDCDJC9t5XTzhl89DLDC0S2vk+iPqoZ0k6Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sboyOPpw4i58Jp3gV8n7shQ9miTmRCnz2kIqUkTrNuY0r7+ishPytDLjQy?=
 =?iso-8859-1?Q?spJRgiyA1irogztzWnuyezElw+Pf56LwWjl6qYVMw3VyynwVI8r8Uzvhgb?=
 =?iso-8859-1?Q?IVyb/gbPFOW8fmyaOoG7ULVAHHwSmD1L7Hp6fQrcdJ0MTs3m7kOWJ8cPgL?=
 =?iso-8859-1?Q?8qywVhcvxqlLodRewjM2Ni0jlTkRvEtIqd6moipi+iRl2CFMMu1qZVEGoe?=
 =?iso-8859-1?Q?0803TfekMTiWqcocAf37V3H+IfJAFe2JaSUHwZajQpi+UxHfF+R0B0gvTR?=
 =?iso-8859-1?Q?qo5hSPZosYIZmcc56HKD7fpkTDUO/VcSFzwsxzLzHBiSMmV4RK+SHGqa4U?=
 =?iso-8859-1?Q?CMpoAOo1ezrrD+LkVYsdGpR3vLvYqwNGx2Jb1B1TOZBH4OyKXisnPQ0FyY?=
 =?iso-8859-1?Q?ZFbGQwO6fSTglS2M4m33qk4maH0E57C4ECcqj67qaiKqx6qtc1q4xXut8B?=
 =?iso-8859-1?Q?C5U5eT/LuXn42LH4rxbSld00TTsz43QRSoa4t7my8wDs2jcPmyLw2OYER6?=
 =?iso-8859-1?Q?c2gr69R2surWKUMWESs5+yQgE6GIkhvpZYLMsHBFUN5uZq5KszSeUCCibT?=
 =?iso-8859-1?Q?y1uQ+CCmeONO/R1aqEjb3GnAu2PNvbN6L0hGwk84ERj6LrIFMquVbIFBOR?=
 =?iso-8859-1?Q?onhGihnRzRQbYH9/GKUOOsxjjBvAire3y4ob8lhC2BoCjSwrvPeOrtvdPg?=
 =?iso-8859-1?Q?gRAGWnNqbpwYe/pRJ3NwXpzUCldDlHRvSOKcHM3+DdAr8sgAerf0I6xsPo?=
 =?iso-8859-1?Q?X1jJmxuALI0NClxIEStrWCfikDCgDlkbaZfiPCgVeSmX6ty3GqQIx+QchN?=
 =?iso-8859-1?Q?H8dMDmcd7NThQDagP78ZgF0Dj5WlM/PFfwnZYybbi0XiMLn6dzqpjGZ+a0?=
 =?iso-8859-1?Q?RtxN143nXyUTsbsVGqEwqhkv3S2GXTWXxUHBPee10RJdB5Mv+ZzM/jqgKz?=
 =?iso-8859-1?Q?Nba3eXaMEApp440lkntjcjDMaV7D6wal3cgIDSP9qhGrYtKexObegpl+mN?=
 =?iso-8859-1?Q?fWTNjyCE/yNON1kBcuejtJgUs85deymvBSvG95jFQubFNMYgOtOR+ygbnc?=
 =?iso-8859-1?Q?OoKd6qAIL5gZ8Id3V0fg7DfR/y2sBuyRq6slR/YUluYqzDN6NAB0v6GiYg?=
 =?iso-8859-1?Q?NLsHoT24xDR9tEFHbFDbqCyIuMN85YoR6uSmOjMXDQrRYXomSpQ58YgBS7?=
 =?iso-8859-1?Q?grZe5ef2V31ghFad7fb+HXmfnt514KoDOW4xFOOuABAX30fDtG3oD0j2HJ?=
 =?iso-8859-1?Q?9BBq1pVPbWFLrSbqHJlw5haKe+r22b9kvw+Za6y3Hu9pPMqDhfe/DtrRDh?=
 =?iso-8859-1?Q?ew/fEvOEEWtaj0t18PNoJohf1G4Ut7pr0EvSqBQIxjfaq6qC0OGGIPK6Gl?=
 =?iso-8859-1?Q?y7AzBD6qKVLa+jJynh2Ehu5iP97a5JQLoWQO29u30EL8hQ0ap4+uWrfEG6?=
 =?iso-8859-1?Q?b3uCzzBD/niYHpllrfykcq0QcxE8SVSyGqlJOVDgd8LChSH0O9oe6Erkth?=
 =?iso-8859-1?Q?l0OhCpG3wFbiHAdfhsvdZx3LZeXHL87Py9/3MJKzQOb5KZJ53y7lrTGgQY?=
 =?iso-8859-1?Q?xXsc8BorSOb0fh74XLpBAtHZZs8pqQmlTrRiouF+ciNzv9F8YBCAnMP7bc?=
 =?iso-8859-1?Q?8kWq/rJoW4yVAofL0ADiDaEXUipR6DhQu61LocpXXz+x853CsWLj5+dZB9?=
 =?iso-8859-1?Q?wKaoStBKANd4ZyzH2sXI+t+1kvGWRg6bMfAzH3W/Gphbef7txX109UcBby?=
 =?iso-8859-1?Q?NjltNK/9QFU24ZdAJXsb1AWa8Ab9QdtRGB11q12FDXKX2bJquNeoOnpJHB?=
 =?iso-8859-1?Q?eaue7KeuoQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7298f57-9ebc-4bc7-d2e9-08deebda2ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:25:41.6323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buDt30XtSpy80MfrF4nZPWg+O7cw0Q8JpGD4tITa1N/UikzLHXyDwOyKpL3kwjyQyOHNg1rMeFCyh7OESrvQD+wOZ92SUm1+LgwU6TkkKhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7B73AC350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052606_076461_F00315C9 
X-CRM114-Status: GOOD (  11.06  )
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
The kprobe pre_handler() and post_handler() are arbitrary instrumentable=0A=
code and can themselves trace, fault, or hit other kprobes. They are=0A=
the only parts of the kprobe debug exception flow that legitimately=0A=
need instrumentation.=0A=
=0A=
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>=0A=
---=0A=
 arch/arm64/include/asm/kprobes.h   |  9 +++------=0A=
 arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++++----=0A=
 2 files changed, 21 insertions(+), 10 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kpro=
bes.h=0A=
index 35ce2c94040e..a694f7d34f45 100644=0A=
--- a/arch/arm64/include/asm/kprobes.h=0A=
+++ b/arch/arm64/include/asm/kprobes.h=0A=
@@ -48,11 +48,8 @@ void __kprobes *trampoline_probe_handler(struct pt_regs =
*regs);=0A=
 =0A=
 #endif /* CONFIG_KPROBES */=0A=
 =0A=
-int __kprobes kprobe_brk_handler(struct pt_regs *regs,=0A=
-				 unsigned long esr);=0A=
-int __kprobes kprobe_ss_brk_handler(struct pt_regs *regs,=0A=
-				 unsigned long esr);=0A=
-int __kprobes kretprobe_brk_handler(struct pt_regs *regs,=0A=
-				 unsigned long esr);=0A=
+int noinstr kprobe_brk_handler(struct pt_regs *regs, unsigned long esr);=
=0A=
+int noinstr kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)=
;=0A=
+int noinstr kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr)=
;=0A=
 =0A=
 #endif /* _ARM_KPROBES_H */=0A=
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/=
kprobes.c=0A=
index 1b12341b2af3..e9fa66fa4217 100644=0A=
--- a/arch/arm64/kernel/probes/kprobes.c=0A=
+++ b/arch/arm64/kernel/probes/kprobes.c=0A=
@@ -301,8 +301,11 @@ post_kprobe_handler(struct kprobe *cur, struct kprobe_=
ctlblk *kcb, struct pt_reg=0A=
 	}=0A=
 	/* call post handler */=0A=
 	kcb->kprobe_status =3D KPROBE_HIT_SSDONE;=0A=
+=0A=
+	instrumentation_begin();=0A=
 	if (cur->post_handler)=0A=
 		cur->post_handler(cur, regs, 0);=0A=
+	instrumentation_end();=0A=
 =0A=
 	reset_current_kprobe();=0A=
 }=0A=
@@ -359,24 +362,28 @@ int __kprobes kprobe_fault_handler(struct pt_regs *re=
gs, unsigned int fsr)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-int __kprobes=0A=
+int noinstr=0A=
 kprobe_brk_handler(struct pt_regs *regs, unsigned long esr)=0A=
 {=0A=
 	struct kprobe *p, *cur_kprobe;=0A=
 	struct kprobe_ctlblk *kcb;=0A=
 	unsigned long addr =3D instruction_pointer(regs);=0A=
+	bool handled;=0A=
 =0A=
 	kcb =3D get_kprobe_ctlblk();=0A=
 	cur_kprobe =3D kprobe_running();=0A=
 =0A=
+	instrumentation_begin();=0A=
 	p =3D get_kprobe((kprobe_opcode_t *) addr);=0A=
 	if (WARN_ON_ONCE(!p)) {=0A=
+		instrumentation_end();=0A=
 		/*=0A=
 		 * Something went wrong. This BRK used an immediate reserved=0A=
 		 * for kprobes, but we couldn't find any corresponding probe.=0A=
 		 */=0A=
 		return DBG_HOOK_ERROR;=0A=
 	}=0A=
+	instrumentation_end();=0A=
 =0A=
 	if (cur_kprobe) {=0A=
 		/* Hit a kprobe inside another kprobe */=0A=
@@ -387,6 +394,10 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long=
 esr)=0A=
 		set_current_kprobe(p);=0A=
 		kcb->kprobe_status =3D KPROBE_HIT_ACTIVE;=0A=
 =0A=
+		instrumentation_begin();=0A=
+		handled =3D p->pre_handler && p->pre_handler(p, regs);=0A=
+		instrumentation_end();=0A=
+=0A=
 		/*=0A=
 		 * If we have no pre-handler or it returned 0, we=0A=
 		 * continue with normal processing.  If we have a=0A=
@@ -394,7 +405,7 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long =
esr)=0A=
 		 * modify the execution path and not need to single-step=0A=
 		 * Let's just reset current kprobe and exit.=0A=
 		 */=0A=
-		if (!p->pre_handler || !p->pre_handler(p, regs))=0A=
+		if (!handled)=0A=
 			setup_singlestep(p, regs, kcb, 0);=0A=
 		else=0A=
 			reset_current_kprobe();=0A=
@@ -403,7 +414,7 @@ kprobe_brk_handler(struct pt_regs *regs, unsigned long =
esr)=0A=
 	return DBG_HOOK_HANDLED;=0A=
 }=0A=
 =0A=
-int __kprobes=0A=
+int noinstr=0A=
 kprobe_ss_brk_handler(struct pt_regs *regs, unsigned long esr)=0A=
 {=0A=
 	struct kprobe_ctlblk *kcb =3D get_kprobe_ctlblk();=0A=
@@ -422,13 +433,16 @@ kprobe_ss_brk_handler(struct pt_regs *regs, unsigned =
long esr)=0A=
 	return DBG_HOOK_ERROR;=0A=
 }=0A=
 =0A=
-int __kprobes=0A=
+int noinstr=0A=
 kretprobe_brk_handler(struct pt_regs *regs, unsigned long esr)=0A=
 {=0A=
 	if (regs->pc !=3D (unsigned long)__kretprobe_trampoline)=0A=
 		return DBG_HOOK_ERROR;=0A=
 =0A=
+	instrumentation_begin();=0A=
 	regs->pc =3D kretprobe_trampoline_handler(regs, (void *)regs->regs[29]);=
=0A=
+	instrumentation_end();=0A=
+=0A=
 	return DBG_HOOK_HANDLED;=0A=
 }=0A=
 =0A=
-- =0A=
2.47.3=0A=
=0A=

