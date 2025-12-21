Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E98AE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=; b=J3IEjpYc/iecjU0oEkkFok0iR8
	ZLyYd1Xm1hlgoyg9U4/8Zb5WN+3HFL4x9JdmQTGH0HIWeozIZzSqFSSfNfy5Gm8EXeCzpDZ/28JsZ
	5T7UviTbWpNfcpAVv1kQtwSOXK/PL2vfnjs+2/JtKSL3YnS+Q8HbVeb/dRE9S8BXM9c6Eovp6jnqR
	Q8t9Tdy/HJHKSZapPQ58nB8lOv2401WQ4J4RXs7QxwzMj+TaIqYfV83Tbf07S1xUsFLaEQSTwe9c9
	ik9dPO1j7VFGFhBUo7OyGUGeIrBe6TKUnsxhdgisKA6x7N3qg75Vs+BQrzbkL+96mRqkiNPDikoXm
	SuDwhBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFs4-0000000CHzx-0mIZ;
	Sun, 21 Dec 2025 09:37:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFs2-0000000CHys-2TNn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:36:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a1388cdac3so29368005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309818; x=1766914618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=HTn1kV4Ww6Ye1lklF3kVOdQ9ru4dxBLQS1h/trNwM7rsO5MXsDCApQg2TPtPJUGmWc
         KnIPru+6Pl+PFIVqmldqEJE3O7D+IhOpWu2DDpXQdYFP1vzjerMYeF8wO2eE4w7ZCF6W
         c3tBmH9bNAZ2B6JTj4dj+UshEQU02j5kV2CaSR0gr1xFQU5t30FKXVHR6eFMTxTUTCQH
         TBh3RFjJTroro/Klgbwj5wgjYEEiqVtZrvMj3Mq4pZLSpGkXOrnhiSivL0ebNsqdHryC
         AafwzBBeIrxN47bZUxGBY5XYzZwqq8itF4UCtGat2RPZO9DPnw60ziHeoqH34ESUVxNl
         7lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309818; x=1766914618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXu17unAaFSnbyi+Zk+8K05FQ3JomK2ILh566085Hbg=;
        b=LGz8UIXp9m7mD0FzW2+9dS209cK1piTii41QlQIyml3zQ0/NViD81tV82XWM7ifsEc
         5p1EYUmDC4kw3xSftg7lL3DkUu3U0nR/E109Ue76+cLocK9+5OP2tHoeuENUv1hp38Od
         AEinp2hMSa5TiDE0CPTvG6ugqMTvoNhKt8RthEpsB+QIIitHMvwwzY0hANKSMITNUtYl
         qv8u1teyu2owWOQOYV10ijV0oxyrsN8rx4Ms+/rMbRwptUgdoPgdnXmICbgzPVkoTtuT
         Td7ysA8qGjukxiwUoGeLHPambPfvxlBaCHUBdnDgxCxfG6lEH9mHUK1gVyOC+du97NP7
         CEhg==
X-Forwarded-Encrypted: i=1; AJvYcCXEXATE09uNV11lSZaMJIz+2p//umQMov/NKnDCrTQgfL2Yv9PRKkDryPu5IhLFkqC11WYwbEP90+eKVrbXPK5P@lists.infradead.org
X-Gm-Message-State: AOJu0YxbOp3jA9BMGrph2Vhmqo19Y8XMEQ5yL7cWognjUkpHIpFMh+wC
	pvO0HD3jk7AtgC7JfubGEOB/QKcmkGQgYn9tebRvHhML80Qnc4tKC8Ah
X-Gm-Gg: AY/fxX5Y6sl4vc3K3bb1gBdC5uISV3/qpr6kQINebLUFSzG3yWeoRnc64s8WAJryTZ0
	MlwI9Mt2i/yyTGXRGWPXPoQ3sFrYUeQBd9LDFmoKLL/F7dl9z+9xLfzoDtZzS7ZA6PnjDo15+yB
	IwUTzATqky0sFsosFm6s8Kwcztt3orzBxlSOQ3Ud+dXSE+a0wxAhYQFYjP3IAqI3rj01DbzQaTf
	mjexW/apD+gU3wYU9DA+GdoUX+rnnPBkvSyLVSqBp7Zl8v7lrN0yv7BpbaWAwYTRMMysUU99IRJ
	W0vmyu9nGjcq9cDFNcHudji8/x18BVkV6ScYYdfKePRYjGrUkSM+XhAbCO5+LW7dvwR6FovYBZN
	y3dNXH8yBDi1OTdBOSSCPiI9o0eY5LTKfjXJlkymKkQDNWLO4n/EndPuLUNfANQHJgvHEB8O/2x
	s16Ndkf6MdJmXSjf3870Qf8NSEXKC/PwgMX2ip3uOk8pc4Q9n1U++wIBcJ2E44vQcadxvnEkoYv
	Oox6wc8pesEL1UoQT7tMwZV+5ltbIcX6Qx8MWUYipE7vl/TgAnYDR6bZZaU6l44/J1Wdkz8D6E/
	BKpIg+qtpaq9xn0Xpr+xRVnubegRnNCNKEXzbJ08idcOJPUouMc=
X-Google-Smtp-Source: AGHT+IE9k5fjbxVuGHt35PQ2dBtJxutYciuw15r6xi7up9QtKT9LAT9dU495uEoMz6Mf8cwTHCKz/A==
X-Received: by 2002:a17:902:ce89:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a2f222add8mr78300875ad.1.1766309817611;
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:57 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:00 +1000
Subject: [PATCH v2 4/7] ASoC: soc-dai: define possible idle TDM slot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-4-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mjOv/Tov/J+hpGHcb49MekTvZZfF0eTnGqqMKw/v44k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yc/yutKemkwZXlY9yK/5pRenn0/JK9vi3E23PHj9
 rFvd3P6OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFPdF8bw3z/6pznLMVbdZTsX729YcvnxuSJLKz6mWU9vrzHWEMiYUMrwP0GFtep
 N5r9rKW8nhSZYHJ+mwbvD2srqxs45k654uU/+ywIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013658_638904_FAA717F6 
X-CRM114-Status: GOOD (  12.53  )
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
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
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
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0


