Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDEAD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=; b=MRyNxW5pqWd/+5xBPRrPrQBgbv
	PRgeJ7+/QdqF7y9drF9T8Krij/ULUoGyL0xx608DKMEgoncl8UfoVxeHfu2pxVFNfdC6yGjQWaFkj
	ydUf7bpcLqysLzX6ZrQsQ53vQgCCJoSq0Jsi3KhT5euNJ4zpCmsWWEOhdlIWiXdbv7mvGRhnh0JM4
	rm81ocV0M10JWX70ODHCmhmTCgLjH3KD0utTcJS4QrVp7wsHgNP7N4Pa7PiCp6FuerDRo2xV5p9Os
	EaAOY8r8XVDNpq3cmrLzD0JXJrcD5/zKnpoO2T7IweKdjPnvGa1/kBC/8woHDAzdITpgkfCOtqu7F
	/QcWG7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4j-0000000E34L-0jEq;
	Tue, 09 Dec 2025 09:32:05 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4g-0000000E32c-2aRW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:32:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so5492193a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272722; x=1765877522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=ijhYiLiHuq1ntFoc0nza3JGaNYO8NQHzfsH3B4ClQexn02F9x7ntiZowRZtGlllgtT
         wNuqaxoBpBSTZZps7RRKdbRSG/kpevgP9R0mOVRyw/oeTfoyGeHURnaqXkTk8T2lRDuT
         1HZRTORMl88WKPk0zUsyDIMR55MZ40JyO3zfU4VicWWelQ8y+Xgu9AB+nFC4AmxuEDIR
         1QLUWC+CrDMz3Ei640xd9jD4IGGcwkRZNZCAOWPMjgSzkSweA8eSIvXf4a6l5AcqWrEH
         /Y5OReTydiYQiGN5NnqVogQqaAOG7J+aMAYanmnapvKdHRaFmnxccSG5YFTMhuelfIgy
         O3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272722; x=1765877522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=qsl6VEVr9mnsib7hetPxuMkfaEd2yChP592GJbV4Sass/AD6QgTCPek8D/Mpey5qgE
         LYzgx45I1FbRRno3MT36NNpg4F8mR700E8b38epTwOgZDXUbLxm+MUSjyofOuzDN4gEu
         P7StyOaa8Jf7CmuQmMj3MgfLsMkqg5j0YTyUVECyqRlHmjZklqQvyl6i7eN/3TkVPIts
         pTaU9+Joi4pbKQpO0ak2mIUhh+IGyVGz621XtgqbCKAOp3KZgUotGUS195ixMX1SW/al
         DOTQ0W482FrOkMtXn8fBJ/BnURhCx+4yCbQdrdIyenOZrVf4tTT7wSK5fJG+JavjA999
         6sLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEEGMAhSOFVBShljjpnBMhCLbqbMgaAg3VXUfyCKtsWH/EjvVBGZAieq2uMdt6faUq2A/vMjEIxGYeaSII5xnc@lists.infradead.org
X-Gm-Message-State: AOJu0YyhCC3HlLKRfYcWWbJ663ID+zYwbv5xRfcRR0pSmipHYllSaPqq
	h7zTzzca6FyqAwF6fImpIog8PELMawV62YOdmt9JLzNV05tN4Vb1Zo+u
X-Gm-Gg: ASbGncuV3PxE3ENr+yKBoa+PTab/ngysg9M4TwvWdp611BYrTbb8jENJpnWQ3MFGkxJ
	vqfEBhrC1I64MR60KEp1DlThAQUnug/WlS24TMGDvbt64GpqooNUDDRXqTkV1/vESzz5hJmeUfe
	a+h50o9mp/dT5s4SYkYdb+OhYE54JLessLvisB7fRrw5CcXHbB09i4uxB57yjYoaxJMuMl4UTCE
	6ktyq8tAjiaXXh/ktquiklXO5a9Qs31+ZXZvkmLLhFFmd9gqQKu+12rG34s+hSMAiBUhN2903NU
	1AJXjZ2bYMQJtVhEOIu00RwQGM4Tp8FZPKYsaphSksy8QidOtdWuRGXxG5RwVXucGQ8GydGJest
	BRJhhEqpbuIAC2llLR3faHtJu6wVNPypjj2wrHEqXbJq2iV7HkYggxpm7ZsLq8THTdSD5BpLahA
	VRMods14crQVC18hYpO5HLjcWINfAWqvrgaczg/S/K4xtOIXncO1a0fEg8HbmXXRTAwy+vQy2+w
	QRIVEzSHK4LPlmEXAFuTLXkeXkPSAeVU2njcDovFRzFyog0PxhBa8fVRbiy9DL0sWZaFbvN4tV6
	Zm/xUryT9zYev6F9ejmwkEpx7ZkoUCq8QAIJ81XxUohzgee8UeQ=
X-Google-Smtp-Source: AGHT+IEwaeD0b9uHojQWY3Zj92Hr/X5acaNl0q97VcOUGKTdKrWTewUu7dv7EFYi+rSt77tp7bmfqQ==
X-Received: by 2002:a17:90b:3e4c:b0:349:3fe6:ab97 with SMTP id 98e67ed59e1d1-349a25c00dfmr7898399a91.22.1765272721737;
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:17 +1000
Subject: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Llv+1kaVUxfcu0Lyr9iOuUFcssFQvk35ZxHPLV9
 3RbufdWx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKon2zD8L7p27p9KpcGMFdc2Tp/u92VGWJiRQcaf/Nf1cy5fVDnAEMHw32uK5pn
 yTx4z157KdWEontG08r7oaZNUBtm2Xccmfp7+gwcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013202_666097_9E9D298A 
X-CRM114-Status: GOOD (  11.78  )
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

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers.

Imagine for example two codecs sharing a bus. When one codec is
transmitting, the other must ensure that it is holding its side
to 0, or data from the transmitting codec will be corrupted. We
can trust the "idle" codec to simply do this itself, however
this is undefined behaviour. Some devices may leave the line
floating, others still may pull the line high. We need a way to
control this behaviour.

Thus, we define five possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, and HIZ (floating).

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..a5784ef8e3f7 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,19 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0


