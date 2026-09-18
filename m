Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324B4C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3oCUeU/QfnCX52cxfUjOmB6CxbfczOWH2BcGVdKT7I=; b=Gljksc0hKviIexDMbRNhL4QvhX
	MxcpWUx1952v0wr3O4noYu3dPSYEuAr5YASi/JfNem/2XoHUrLxtMf61QgWFmtqHdYyI8E/gZ70iq
	O9hOYZohOGMLYvA8VBqYrPTg1ms1f+IepmtL0Eqbv1srafmssxp6CAY0Plot/ozbIwxg7oQnxxO5M
	7Ce6b64J7U7rJTREeRRhPK2WMxSZQ1IZm57YgcFKtfW9Cs/9Q9RbVDBnf4xhprWCGnWkxtXdhnKkt
	UwUcENxibw02dzVbNTzI3EbDZygafuZsFhJJLyNLD8Sn8ugXLPNUsuFnBFfJdRU2PdjFbLmEFcbU6
	dhjgXjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y9j-0000000EQMu-2Ena;
	Fri, 18 Sep 2026 12:57:31 +0000
Received: from mail-japaneastazon11023098.outbound.protection.outlook.com ([52.101.127.98] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y9g-0000000EQLv-28ZW;
	Fri, 18 Sep 2026 12:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7lRXxkdLAGvDbv0SntGDpRg1b7WMPoBFJJGkPjRyzsBxejQeFAwFe+TVqe5RSegDp2a0w3aPUgOwTNIxJ/glFEp/GO1tTFId5zTfg+RCQntzMNmLp8Z+MhXT77rRfpHhbYJnXSRv895GNTtjxqrAhh7hBy0umwhNIF1a40luWVIWoureR6voVnI3+UJhk7SKaGe6atg2oMUswMzFdi1gyVqRcollkZsjlKeGH/SNy2ec9IX4lp59h1lAVi5FelTEBoVejBQhaAmk0cAbAQRXlvH4fFicVMZsyTC+AS+xH4/9VptphpYozXUG/lsZUWRIM6jWIOxnauQ01nEx7D6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3oCUeU/QfnCX52cxfUjOmB6CxbfczOWH2BcGVdKT7I=;
 b=qtuNlW6vpDS29L4rUL9/1LmI7ZKiKAJlnYZ3H+gO8VryQG/5uuzd5MWpoHyiiYyfW82alAgQWtCvX88kH2MJvz6WepDDkyx706z9TPxnb0iMl2hORSjD0j2Ewpkvcq1u1zPpwjrxgCx8QrStNzcq+imP1oC0nIcCdaRFbHtRsGfZI2j3owlFi4WnartyVmnlPZBCV7nH9jZ3KyVCeSxEhEc/fxmQNL2Y//isO9YYLrnj4IUyV2W1TZtmsr7payxIX0pmHu6/fmTIQGEj5GkqcfcDjWcAUiWqZ/+U1qBki9r2oxibsLanrEWovZKSH9zTZeTA825DUGzupLPbSsTQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3oCUeU/QfnCX52cxfUjOmB6CxbfczOWH2BcGVdKT7I=;
 b=KgSPBvoYggCLul8MdaZZ3lMy3DrbClxBnrCU7kqojlHsQ6QPmfR4an9hLbdh/Lb6O75sn3VXunNP1apwJD/rA6Nfh7omaKwJTgtf6lNXSjULMavCsrLh4fg5dxEinnYruwm4GLTQ7I/OKAcd9h5i8KVe+lI4so2FCT6rdmhjrYBQMQgwTH9vhFgqaZby0ZqMyrz1+8NjoD69/xuG/pW9wrE8yOgfiUY5kPof9VjkUwTcSsifPVXu9vK/8QxYPTBZnnuTk3h+Jxz4/ZxxHs6KXK2wTS6O46DtumdKZpU+ROfGh4jq9RjL2X/BQYRpYq1QY/g7w/T2WAkqcsSpu4+rjg==
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253)
 by TYUPR06MB5980.apcprd06.prod.outlook.com (2603:1096:400:357::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Fri, 18 Sep
 2026 12:57:20 +0000
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf]) by PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 12:57:20 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: [RFC PATCH 1/1] ASoC: codecs: rk3308: add support for codec revision
 B
Thread-Topic: [RFC PATCH 1/1] ASoC: codecs: rk3308: add support for codec
 revision B
Thread-Index: AQHdR209FKBudBxAWU219pfDz4ypYw==
Date: Fri, 18 Sep 2026 12:57:19 +0000
Message-ID: <20260918125711.94361-2-founder@crepuse.com>
References: <20260918125711.94361-1-founder@crepuse.com>
In-Reply-To: <20260918125711.94361-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF6469DE8C6:EE_|TYUPR06MB5980:EE_
x-ms-office365-filtering-correlation-id: 6a1d1d7d-4302-4951-e823-08df15845ff7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|22082099003|6133799003|18002099003|5023799004|56012099006|10067099003|3023799007|38070700021;
x-microsoft-antispam-message-info: 71SBP57xf3ITWNqnuHvB8cE3Mqd9mfhSQH0HH2wOSTk6RWo6C9UQ4zOg0SuYKGHW4w2rwcIrSvW0TtEhLEXbpGgZJg0CRHKcLE32rjSGOGJsVHY/+QCgRB3naPvBwlcmhWBv3KV+cZfupmn2YoRsoGHIjYWVYXZzaZixfcSkKekqOC+Ual83i3xgbNWGSYN3AsWau+fHYxGHs7mb29RcjYG7POH99qKLZpPFspmjuwvCnFzaEAmKZcv+pX7uld2wYw4hH0Irxco+atzAsTi5SurW/i3URzPN3mc3fhq3RfTAt5mBYE7vABL1R2tSBBhsKsru9goK7JSHN0gMlY+FxikBkSz4OdcJZHZhcx7gNtKDGoYa62jVbdQ2ZHDHydilK55DnJBhzMX59exHEf+3RYSiacJixRGtaRGN2nTnnPioSlwYdo0xigvwcYkZ8z/XbNOdJ/NCdPdcyAIPa9TVbdJnYyE/ZOweI4q8fzB8xOFUQh8i2kIuq92N8290WGs9dXLuPgGqu+FywK+3VXB6sgOgcu501+NRRy+O993JNHOu/Kt8+9TbYahjJjq++mfzzmmZ46N2Dutdd0jhrzg1QKDRh/eFc0W3IyBJIMygTDnN7Bg6y31v1MMHanuADr151y0wF2c3kD+R/epFeu6zJ2c1do48HU0xB5k9Y8FYTYkMVBwEnxKG7wrJrBV0yUX8rCLpdHUFkpZ9xS1yQgHbq2EtXHlnqBBy6phV6vP4wGo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF6469DE8C6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(22082099003)(6133799003)(18002099003)(5023799004)(56012099006)(10067099003)(3023799007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/o6YkM8Qp+077xuttqn/jjjuZxrFqadjMlMElmAwQQXHv9Aw5vpVdHmKX7?=
 =?iso-8859-1?Q?RUCW3lpxmXYrDqGH2KZoziHfLVMo9mMcQ27LcM4p9fCLvfB/hzhijEi+rq?=
 =?iso-8859-1?Q?aX1qfsYBmNs77NfnXcbfBO3ZqgG4QJ4DDeorAWp9ZzqFPF1RKzrp3D4KJt?=
 =?iso-8859-1?Q?5Mhy84TwNxG86gIiM/Hf7BvDEY6wSAiB9G5g6U8kvBDgOLcIMKvwVwUGD4?=
 =?iso-8859-1?Q?b5p19rxCtGghQcBSlQrQNS4IzXTbLsRiYLqdJ8Y+s1E9W0tN4BfTQv37fI?=
 =?iso-8859-1?Q?gMunfb2aRFE6zp20UULE7kApyfNe7JsqpxmftTd3+9HWD4WFg9O9F5ZfM7?=
 =?iso-8859-1?Q?HWGDXXBmD/ITnYasgnVQqp9G5Lc2pLROqg6r/kaJcMjPPVIWOv9fRbEep/?=
 =?iso-8859-1?Q?53IL7DCWVRydsDJvzr50x/yiiUXBLEnkoNP/2uiLKTaDTnKpcCkJOCcKVS?=
 =?iso-8859-1?Q?Fk6URcM+Zz4VghklU/h66I3EMxRNRXR2NooVNQoMeHnwucei+75tNIso48?=
 =?iso-8859-1?Q?l1u/pjG1Q8Vfq6/lcyFyat5fn2f0oM2X+Rsoi3/a1VSqXIH2IiObVQozCK?=
 =?iso-8859-1?Q?Sj1HTcumI8TzFdjbkWG4XH+WmsYukoquT2uQZQClH5+OV686p9z294RnRB?=
 =?iso-8859-1?Q?+wYpDBcIweSN1QklOHoyzsaP8XbD4hx3NcpMw2jXJqgSzt53iZ8L5gRlfo?=
 =?iso-8859-1?Q?1iJF8eBimHbg+VUlViZStenIlrt1p6gbYQDNXzdv8keyZTWFaYUkMSRB66?=
 =?iso-8859-1?Q?nCIa6H1LjDOTFtzXpG21K1/tRE92GurF2c18ACUkmcYX3A5lVtpjCKaXU/?=
 =?iso-8859-1?Q?6cNccnh0XioxsPTfTOX99tITDTD5FvBuGw5lUm23+f1D7BIrlCHQgFcJS7?=
 =?iso-8859-1?Q?CcWRItPtFuK5Oj3QvZrIQj8gn/+HvWhQXIoR1/GPuWFWhomXANnO748BhV?=
 =?iso-8859-1?Q?r/o/kLe4m2SrEi+LttAZ7i0ThYZrRALHG/dqDhlbTco3yPLovaqS6xH8Nu?=
 =?iso-8859-1?Q?vCJIyAfJYqMKyboBjSnJ0S/nxJhx3S1FuH+39Nl7BTemXKThkDKIR/4y1A?=
 =?iso-8859-1?Q?FApAZ08fFqMtV61NMcHXB2z9KjsmP/IYcboU+8+sC7KpjT7MlPtLQCQU3d?=
 =?iso-8859-1?Q?ASzuCNz1ZK9wmMfg1ghm4lQxmlr6e2PKgfFcgnNE/t3K/Y8LDMksdXYZZ1?=
 =?iso-8859-1?Q?EDYz6GUYDrGkV4P8NHVRpvda+UAmyEePQruSnOM/X+MkxbWtxyQO8ClUr8?=
 =?iso-8859-1?Q?x8ZJjGT4Kj0Qm3sXhTZPI9VAdksZtx2FAAJwoJVLwqv0vsUwTlvk9WYxpr?=
 =?iso-8859-1?Q?aGuX0Ta3usiZ1+8wHR0FhiKay/cZZj/zzZj/cAjRZtR+NJofTHDXNoSOjW?=
 =?iso-8859-1?Q?gzy+i47NN3iaMm31m2uyp61maftx3Q7bxIEnzzFtIAeCXn3npxe19VTg46?=
 =?iso-8859-1?Q?vTsYDVN4LNmx5xm98b9mkebqRr1Y9wGliqeos/ATXU+inJKdWich+ho2+p?=
 =?iso-8859-1?Q?b/SAEyupSIPr3fc0rOIhEm2qOYKutxbNIxo8mPjlTwaAHXgjdVgC45whZC?=
 =?iso-8859-1?Q?T5Ej5U/0JNOCZeoFDyGDa02avfCCZn9DX0r4h2JaHgrKD+OizMgyfftKTO?=
 =?iso-8859-1?Q?vvP2rtLACobH4OyxClOHi8ru9cO0MVfpZul03aGU0d3KLCeQwWO3UJ37FQ?=
 =?iso-8859-1?Q?urgsZx2muZ5z+swuStDjpjP5lFkStTfnLMdhRRS4GGRgn//uvEqLJ9bBUJ?=
 =?iso-8859-1?Q?AMaokcNbfPArP/yl5pGRcGVfGud5TzQoMjg+wBzl8Nm50z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF6469DE8C6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1d1d7d-4302-4951-e823-08df15845ff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 12:57:19.9676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1d352272-7d70-4a91-9c85-0db444db1bc9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gksFxSgMEWmepfqTLTVPO3WIxUtlHzfBbqcRIYVE4jQCtzmo07Jlwiv9FqlEZKO8IyAalkFuUKTF+bcNdVWdSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_055728_688310_056F1ECF 
X-CRM114-Status: GOOD (  14.42  )
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

The RK3308 codec driver detects codec revision B (chip ID 0x3308),=0A=
but currently rejects it during probe. Revision B needs an additional=0A=
DAC output VCM charge and depop sequence using DAC_ANA_CON14 and=0A=
DAC_ANA_CON15.=0A=
=0A=
Model the shared revision-B DAC output VCM as a playback-only DAPM=0A=
supply used by both HPOUT and LINEOUT. Charge the reference while both=0A=
CON15 channels are connected to VCM, then establish DC_FROM_INTERNAL as=0A=
the playback baseline. LINEOUT events switch each enabled channel to=0A=
LINEOUT_FROM_INTERNAL after its output driver is enabled and return it=0A=
to DC_FROM_INTERNAL after disable. When the last analogue output powers=0A=
down, return both channels to VCM and disable the shared reference.=0A=
=0A=
All new register writes are conditional on codec revision B.=0A=
Capture-only streams do not traverse the new supply, so they do not=0A=
touch DAC_ANA_CON14 or DAC_ANA_CON15. Revisions A and C gain no=0A=
additional MMIO writes.=0A=
=0A=
For HPOUT-only playback, keep CON15 at DC_FROM_INTERNAL, matching the=0A=
newer Rockchip 6.1 downstream driver. Physical HPOUT validation is still=0A=
needed.=0A=
=0A=
Tested on a DFRobot UNIHIKER M10 V1.2 with codec revision B.=0A=
Revision-B probe, the board MICBIAS1 route, and physical onboard=0A=
microphone capture passed. A short capture-startup transient is also=0A=
present with the Rockchip vendor driver unless a longer wait is added,=0A=
so it is not treated as a regression and no generic 250 ms mute delay is=0A=
added here. Capture-only isolation from DAC_ANA_CON14/15 and playback=0A=
PCM, DAPM, and LINEOUT register endpoints were verified with the=0A=
preceding clean LINEOUT-only candidate. The shared-output revision is=0A=
compile-tested only. Physical LINEOUT and HPOUT audio were not tested=0A=
because suitable hardware endpoints were unavailable.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 sound/soc/codecs/rk3308_codec.c | 102 +++++++++++++++++++++++++++++++-=0A=
 1 file changed, 99 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_code=
c.c=0A=
index 60befe9d37f0..8514d94d4051 100644=0A=
--- a/sound/soc/codecs/rk3308_codec.c=0A=
+++ b/sound/soc/codecs/rk3308_codec.c=0A=
@@ -192,6 +192,90 @@ static int rk3308_codec_pop_sound_set(struct snd_soc_d=
apm_widget *w,=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+static int rk3308_codec_dac_output_vcm_event(struct snd_soc_dapm_widget *w=
,=0A=
+					     struct snd_kcontrol *kcontrol,=0A=
+					     int event)=0A=
+{=0A=
+	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->dapm=
);=0A=
+	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(compon=
ent);=0A=
+	unsigned int val;=0A=
+=0A=
+	if (rk3308->codec_ver !=3D ACODEC_VERSION_B)=0A=
+		return 0;=0A=
+=0A=
+	switch (event) {=0A=
+	case SND_SOC_DAPM_PRE_PMU:=0A=
+		/* Keep the DAC outputs at VCM while their reference is charged. */=0A=
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,=0A=
+				   RK3308_DAC_L_SEL_DC_FROM_VCM |=0A=
+				   RK3308_DAC_R_SEL_DC_FROM_VCM);=0A=
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,=0A=
+				   RK3308_DAC_CURRENT_CHARGE_MSK, 1);=0A=
+		regmap_set_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,=0A=
+				RK3308_DAC_VCM_LINEOUT_EN);=0A=
+		for (val =3D 1; val <=3D 0xf; val++) {=0A=
+			regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,=0A=
+					   RK3308_DAC_CURRENT_CHARGE_MSK, val);=0A=
+			usleep_range(200, 400);=0A=
+		}=0A=
+		msleep(20);=0A=
+		break;=0A=
+	case SND_SOC_DAPM_POST_PMU:=0A=
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,=0A=
+				   RK3308_DAC_L_SEL_DC_FROM_INTERNAL |=0A=
+				   RK3308_DAC_R_SEL_DC_FROM_INTERNAL);=0A=
+		break;=0A=
+	case SND_SOC_DAPM_POST_PMD:=0A=
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15,=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_L_MSK |=0A=
+				   RK3308_DAC_LINEOUT_POP_SOUND_R_MSK,=0A=
+				   RK3308_DAC_L_SEL_DC_FROM_VCM |=0A=
+				   RK3308_DAC_R_SEL_DC_FROM_VCM);=0A=
+		regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,=0A=
+				   RK3308_DAC_CURRENT_CHARGE_MSK, 1);=0A=
+		regmap_clear_bits(rk3308->regmap, RK3308_DAC_ANA_CON14,=0A=
+				  RK3308_DAC_VCM_LINEOUT_EN);=0A=
+		break;=0A=
+	default:=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int rk3308_codec_lineout_event(struct snd_soc_dapm_widget *w,=0A=
+				      struct snd_kcontrol *kcontrol,=0A=
+				      int event)=0A=
+{=0A=
+	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->dapm=
);=0A=
+	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(compon=
ent);=0A=
+	unsigned int mask =3D RK3308_DAC_LINEOUT_POP_SOUND_L_MSK << w->shift;=0A=
+	unsigned int val;=0A=
+=0A=
+	if (rk3308->codec_ver !=3D ACODEC_VERSION_B)=0A=
+		return 0;=0A=
+=0A=
+	switch (event) {=0A=
+	case SND_SOC_DAPM_POST_PMU:=0A=
+		val =3D RK3308_DAC_L_SEL_LINEOUT_FROM_INTERNAL << w->shift;=0A=
+		break;=0A=
+	case SND_SOC_DAPM_POST_PMD:=0A=
+		val =3D RK3308_DAC_L_SEL_DC_FROM_INTERNAL << w->shift;=0A=
+		break;=0A=
+	default:=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON15, mask, val);=0A=
+	usleep_range(20, 40);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
 static const struct snd_soc_dapm_widget rk3308_codec_dapm_widgets[] =3D {=
=0A=
 	SND_SOC_DAPM_INPUT("MIC1"),=0A=
 	SND_SOC_DAPM_INPUT("MIC2"),=0A=
@@ -322,6 +406,10 @@ static const struct snd_soc_dapm_widget rk3308_codec_d=
apm_widgets[] =3D {=0A=
 	SND_SOC_DAPM_OUT_DRV_E("HPOUT_POP_SOUND_R", SND_SOC_NOPM, 4, 0, NULL, 0,=
=0A=
 			       rk3308_codec_pop_sound_set,=0A=
 			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),=0A=
+	SND_SOC_DAPM_SUPPLY("DAC_OUTPUT_VCM", SND_SOC_NOPM, 0, 0,=0A=
+			    rk3308_codec_dac_output_vcm_event,=0A=
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |=0A=
+			    SND_SOC_DAPM_POST_PMD),=0A=
 	SND_SOC_DAPM_OUT_DRV("L_HPOUT_EN", RK3308_DAC_ANA_CON03, 1, 0, NULL, 0),=
=0A=
 	SND_SOC_DAPM_OUT_DRV("R_HPOUT_EN", RK3308_DAC_ANA_CON03, 5, 0, NULL, 0),=
=0A=
 	SND_SOC_DAPM_OUT_DRV("L_HPOUT_WORK", RK3308_DAC_ANA_CON03, 2, 0, NULL, 0)=
,=0A=
@@ -329,8 +417,12 @@ static const struct snd_soc_dapm_widget rk3308_codec_d=
apm_widgets[] =3D {=0A=
 	SND_SOC_DAPM_OUTPUT("HPOUT_L"),=0A=
 	SND_SOC_DAPM_OUTPUT("HPOUT_R"),=0A=
 =0A=
-	SND_SOC_DAPM_OUT_DRV("L_LINEOUT_EN", RK3308_DAC_ANA_CON04, 0, 0, NULL, 0)=
,=0A=
-	SND_SOC_DAPM_OUT_DRV("R_LINEOUT_EN", RK3308_DAC_ANA_CON04, 4, 0, NULL, 0)=
,=0A=
+	SND_SOC_DAPM_OUT_DRV_E("L_LINEOUT_EN", RK3308_DAC_ANA_CON04, 0, 0,=0A=
+			       NULL, 0, rk3308_codec_lineout_event,=0A=
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),=0A=
+	SND_SOC_DAPM_OUT_DRV_E("R_LINEOUT_EN", RK3308_DAC_ANA_CON04, 4, 0,=0A=
+			       NULL, 0, rk3308_codec_lineout_event,=0A=
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),=0A=
 	SND_SOC_DAPM_OUTPUT("LINEOUT_L"),=0A=
 	SND_SOC_DAPM_OUTPUT("LINEOUT_R"),=0A=
 };=0A=
@@ -466,6 +558,8 @@ static const struct snd_soc_dapm_route rk3308_codec_dap=
m_routes[] =3D {=0A=
 	{ "HPOUT_R", NULL, "DAC_BUF_REF_R" },=0A=
 	{ "L_HPOUT_EN", NULL, "DAC_L_HPMIX_SEL" },=0A=
 	{ "R_HPOUT_EN", NULL, "DAC_R_HPMIX_SEL" },=0A=
+	{ "L_HPOUT_EN", NULL, "DAC_OUTPUT_VCM" },=0A=
+	{ "R_HPOUT_EN", NULL, "DAC_OUTPUT_VCM" },=0A=
 	{ "L_HPOUT_WORK", NULL, "L_HPOUT_EN" },=0A=
 	{ "R_HPOUT_WORK", NULL, "R_HPOUT_EN" },=0A=
 	{ "HPOUT_POP_SOUND_L", NULL, "L_HPOUT_WORK" },=0A=
@@ -475,6 +569,8 @@ static const struct snd_soc_dapm_route rk3308_codec_dap=
m_routes[] =3D {=0A=
 =0A=
 	{ "L_LINEOUT_EN", NULL, "DAC_L_HPMIX_SEL" },=0A=
 	{ "R_LINEOUT_EN", NULL, "DAC_R_HPMIX_SEL" },=0A=
+	{ "L_LINEOUT_EN", NULL, "DAC_OUTPUT_VCM" },=0A=
+	{ "R_LINEOUT_EN", NULL, "DAC_OUTPUT_VCM" },=0A=
 	{ "LINEOUT_L", NULL, "L_LINEOUT_EN" },=0A=
 	{ "LINEOUT_R", NULL, "R_LINEOUT_EN" },=0A=
 };=0A=
@@ -855,7 +951,7 @@ static int rk3308_codec_get_version(struct rk3308_codec=
_priv *rk3308)=0A=
 		break;=0A=
 	case 0x3308:=0A=
 		rk3308->codec_ver =3D ACODEC_VERSION_B;=0A=
-		return dev_err_probe(rk3308->dev, -EINVAL, "Chip version B not supported=
\n");=0A=
+		break;=0A=
 	case 0x3308c:=0A=
 		rk3308->codec_ver =3D ACODEC_VERSION_C;=0A=
 		break;=0A=
-- =0A=
2.55.0=0A=
=0A=

