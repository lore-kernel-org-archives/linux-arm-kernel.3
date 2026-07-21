Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4E9C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Cc:To:Subject:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzQf/AiEwxmeENNk8YLXq7gBtg3Uq6wOrqo2FfT+/Z0=; b=5GesaE8Ot+SSN81oeiUVNpMF4u
	crW73V8TSVSZZ42QtQjWOpuZ1xPg22tpky39sQ9pY8NyoqjjLCMecgvRJxF2AiAqMyXmi4tY985S7
	QwEQW2jM180NCThtuJLKOvkz7Bnpy1wy3krRsUQ8xl4I6J9UDS9rDeI340aWRLilDNYC0bmVixQ8t
	nLML8Ks4buEVpUSEAJAEigAu2mvExQDgHCjZhiMu0V0ZflLWcfX4M/2Dqktjn4TfM1X28DMe5OlP6
	2f94P6NJZX9sIP6sz0hJWwUonHEs07QAnnmgCtwcAqW2uC4s6xKLhdnnyXNP6qQpJx+yRwnwwcnMv
	VZbP1mHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzPo-00000008CBc-1vh2;
	Tue, 21 Jul 2026 01:37:00 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzPm-00000008CAt-0m3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFN/ZcqUyRur87ytJ9ahjXzQhk9kb9THaIOrmh6dzLf0sOIBdmPBjpHB/WP/0yVK+Qr/ZgsYMBYyeWHM4nK/QGTdKm06nv9kNFZa6z+GgCb/aumRUnRMGO4akHTGInC+WtQx7EYcGAIyE1J3zJ8BIHq7VJTxv6XQNHscR4XVgdJ81B1mAjyKQzyQScaWmsWsNfh9EOQvL56ekNLYwJSzprPXBFeX/1yKjxJwRGzrYIUUfEg606cF0Bvn4pG+uBEX2Y3OSV5VHNkyGTMxM14FAIK5f4ilZYOLLGTEY/jos1qyi/Wa9UcK4ORbJPWsIQ/b+AWyORv3Vu0he4hVCyn5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzQf/AiEwxmeENNk8YLXq7gBtg3Uq6wOrqo2FfT+/Z0=;
 b=fQiA7yb9gecDta5fPVcn9fepo41YLUyhijsn1ctUKHvkIpqrZ3GMZssmxLzssUWmOz3ghVxXlWDWpI1C2rPchCgU2qSc4HpiGl9FBE2RDHXyUbNsYd5r7pMLBiojgvf9iJrUmi3daItWrZfQl/M1YsDLBXz2D33huVxss2Sg9n2gcu1UdLD9CtGHeY+6526BwVVcjZXX2muVDkUqkmxzvhlet4OCR46FHgR3+2gAAFPh6CWdg6U/p+1012gUUnY3+zBqHzpHw7YgcmJwXVEAJ0ZPcvIriYDcCrWNUgKalHUAe5KQlSNLnkFScYa7lOC05ym5deMxjc6/tFgm3tzOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzQf/AiEwxmeENNk8YLXq7gBtg3Uq6wOrqo2FfT+/Z0=;
 b=f8hOTBvtPxPvnMOqYrJT4aVFewF1PTa/iWb0NS3UrhZZkn41cLcY5UfwpgrPcxcWtnvN8UuBubLStgxTYfUwUtD8w3Pl/aw2UINraFyozy2DXOSVuXNRLNot2X0TVf2B53O+mTtc866luJ1lTv0DsB63/Zm64oarTgOdbhnwopU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17157.jpnprd01.prod.outlook.com (2603:1096:604:458::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:36:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:36:52 +0000
Message-ID: <87tspti0ng.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC 1/2] ASoC: meson: meson-card-utils: use meson_card_parse_of_optional()
To: Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:36:51 +0000
X-ClientProxiedBy: TYCP286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17157:EE_
X-MS-Office365-Filtering-Correlation-Id: e160f99e-2372-4133-1633-08dee6c88a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: aP1P4TaPhdAFljWmoDghgyVb6K+w+BnuSpzo7NhR9h26RC1NaXCFXUyCc9dZgow9xAWc2iFKdqoxFYJ61b74s3vwgBbcxsq3nzuI+a4okVzYpVCcOjqFObR12oGVmOt+3i44nkbX9jKk8Ibx4pqShFA2jMZgFySzOpSnaK4Mnuwzq+4GMzrfIJikw1SXnPgElS5PXd8LsD/UC5nZrlFrqHHbJ6uXI16zHYsklGhFHoI2EKeBZAV8aNDulv8E9GMgHSFVheVCR+lPK/kDMWMEw3qY19XsAkOqRts4GGH18EMOEeYLu7CbovckRcbnEMD+y0Cc9UadJbGK1HbbGWdsc+ulYVOnXXVG0WaT/xW8gH12Lnc8Osry3DaBSLkFTPojnDH7itYEMDxH6deseQaA+KbUTMYKdn+1/7qDT343NdAh/VQ6PITSObgA0ryHFQAAHeUkqsxiyxocp0v2+1I+qSFXd4WP99nKSsyMyj3WpCMkJFOggEV2VZq4AsQzEumK1YfXiV7Y6QBgG0ys5T0x5f7EgFJ5qajThLmr4kzAXKCPEHjik5Civ4Z5TqYUmomoJs6JESQD2cuB7cqTXiicnnK0b7ksqO9YnblxDGTqeo8eXwNHoo2oTJbxJBTnYpSpurt2uRje7qMqHMTZb9k2+CDKbALbOAl/vMcyzvgtYOLpazl0uGmL9apUKwt0DaxpxQYP0Bfa7Mj8nsoweKp6bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AulBB4jxF8brp640JmDZ2MEgQceyVjnp7GTY0/Z80fCHHy/kqeU10JnYqp8a?=
 =?us-ascii?Q?JKeOVgMvEUp+zDMcF9LkKSHcqqPiTFGIX4BLJbWLg7EcJjJf48LETIGZXmNR?=
 =?us-ascii?Q?AVNDo+HBk5QiL4j+DQW2wV16L+VUkzqNTS0ZufbXc+wYddSl+mHnSPgR4UpJ?=
 =?us-ascii?Q?ue5jG48qnXSJdW/ARtAl/58S9jtzrgeEp0lqFGIKz363Ux55XpbCpUjqzY9N?=
 =?us-ascii?Q?BOH2sol3Gpdr72n4nquXJsM6vYbXcFJJ0YuzByyHZGMmyCfiIfFJsV7Ty7Xm?=
 =?us-ascii?Q?HzJJgUVrNVdfHbxS+VKxSEmB4FaMElq1HLh9nmZnB1snHYGLKiVZ5rm7ytXk?=
 =?us-ascii?Q?R2DhZPzAITP+YXXBdfYn4qBhUFp30GCS7gVPbUl4R31v3jT2Uoumn5pzWL0V?=
 =?us-ascii?Q?nIl1X2eVLSf8FINyiduzXbp12P2ZBpsgEBGmBukxBU0U1jvBVByvj12lXJhQ?=
 =?us-ascii?Q?GN/cF0w48CadZEh8FtM43YctK09Tpklmbb3P6uR1HpoVTBIxJsYsWyToVPe6?=
 =?us-ascii?Q?woD4sL9zWUGmfRpHiCfT9Qj1EQuJk2TAs9z4lJW/hGbSRvOe4vpXH4b/wG+z?=
 =?us-ascii?Q?s8bsYRGhUV57AGaxe41zAqqAPHIethxaRJcbaprah+9gobTOVIjtpqxD0nd+?=
 =?us-ascii?Q?wvsfToG6qKojIZC5LozcaoOh46rsXFu4D3s/J+duWeWJAOgz00SO70ipuqeI?=
 =?us-ascii?Q?34emBnas3SaX6duw6Cxvwe6kp7zZ7N1GF5FKZT1SLdW0HbonL7aCbXVGwRG+?=
 =?us-ascii?Q?jt7lohb9luQZYw3iadpnVKsUleb11kkxajPUzSgvXVXwHdfEX82ORdQ8MGnc?=
 =?us-ascii?Q?kUEQez47f01G2zSJj9ImNMTwdvD9j7UbSWMpYHY1aUK/Cwn4enGyN0fxiQDN?=
 =?us-ascii?Q?3vKDsbPNqtnWr9kWJ8R4wDnuP9YSIXvswPhHt8wL8uk+An0yoYBp0BVU+E/t?=
 =?us-ascii?Q?o71HRyFehpf5/u+NSszFqJFyZM/jRfcF1ZDc8ZEH2J9xpX3jOQjV8sl0fHIj?=
 =?us-ascii?Q?xKN2IS6qRx29xbGwLmSEgSY2yPi7Yvc+wvLcG3DDbERAeeVSlUQCw3Z0nyCW?=
 =?us-ascii?Q?4BJRYyG2pOTjQ/3B8P4adwdfBaWSZ3yq836+XWYLojfPwKUQD0DenG/i44YV?=
 =?us-ascii?Q?qCs2C/Omoa+wcsyZM8te310RhzcZMCP+HtGUIm3KI5/XgywpMNX8pEfJzaNZ?=
 =?us-ascii?Q?O/ix9J0Fq5WeTMU3qP4h2JP5lkHGhT8FBvITDbcVl1dWSE4G9AbC+m4uSCi8?=
 =?us-ascii?Q?v7sFWLURFvgDyUp0naGTiSZohOO8GX/rdc49NSrCykZekostx0I2N+5kVBU6?=
 =?us-ascii?Q?9s4gBEtfYNgT3/5g3nyrqJyP9MYDR+G1Jf/I/9iXkM5enkp0No+k8NMyhv1N?=
 =?us-ascii?Q?IAZcoE08/hudl0siM4Ha84Jeb2tCpm2sNKLNGvX6yxp4f2fYXGVn46RxfE8c?=
 =?us-ascii?Q?0oSVl/j4IuA2p1/0m7j6fR9BHcvJruuIXx++bgnrwpCDka5vL16PZumkv7fI?=
 =?us-ascii?Q?vfE2nqrU090lUiGLFu1r1j3hmZqRNA9F+GrPy8cDBU08KzY59nSNV2RhSym5?=
 =?us-ascii?Q?KLM26VAl4LV+b9UqsspDH3w7v3cuR8RSwWEaBFO9j+rC1EhikBFUMjN3x131?=
 =?us-ascii?Q?1FhqNy4de+BdkkduGuGKWkrdrj95sVqzPKpiss3c8vDtq1L9Y0RKWtuMiWdV?=
 =?us-ascii?Q?fDGo7Vsn/caqKg9O0MHOgfONdJoX0k9tn+2NNdQ1amV43UC7Qj8O3WHnEisr?=
 =?us-ascii?Q?9eGgxo6gFzbSDrRKZMxEgyvoXrmuLkPkLTyOWDkLVdpqfcEPE+YO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e160f99e-2372-4133-1633-08dee6c88a34
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:36:52.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOQLPhw2drt2N818J/uXZpEeb4JO4dRHQEfvah3IbAvgGapdeq28Hjwm5bFod6sqokA/Ve3rDLem8GcAI8V4eyYFgSEQhjs1Lsqn5uAr7lz1p6+sfIWGKu55CJ+wCqJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_183658_226545_CBB337CE 
X-CRM114-Status: GOOD (  11.04  )
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

We already have meson_card_parse_of_optional(). Let's use it for
snd_soc_of_parse_aux_devs() too.

It is using snd_soc_of_parse_card_name(), but let's keep as-is
for it for now. Beuase it will be not able to share code when
Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/meson-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 8617a4661a339..d144ab79b645b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -300,7 +300,8 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = snd_soc_of_parse_aux_devs(&priv->card, "audio-aux-devs");
+	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
+					   snd_soc_of_parse_aux_devs);
 	if (ret)
 		goto out_err;
 
-- 
2.53.0


