Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C128CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=; b=2HaJRWdMumiiZLHe7T4XSEqaKj
	3FKdIyGN4FMlsdje877QAHpRC8iLOzff5GKtmUTXx3zizm+sIB78/wwaAzvwXkuaYdAKgOwPX6i84
	3GF2P+6rVKo/CwsTkSDMTowk6IKKL8wwMCtBgO8tJakksTr1XhZVavox5N0YIE1GPqGwzN3uInkmL
	dZBEDVXF4eVp3E7UWVaEBxfXTek0xv0P3HNJH3chugzk80wEG5MmA5YC3kpJhQR43DoNb6yqw+/lT
	S1phmD2N66YS6JOpY/LQsYfcVKRyp4uYDShKlT8LfIkPobfiIphUvowDuBLwPkjjrW5QCG7FP6KIm
	iWl8KdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM4-0000000EWrk-2S9P;
	Wed, 10 Sep 2025 13:59:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM1-0000000EWnC-1Je7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:59:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b046fc9f359so1196786466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512759; x=1758117559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=RKfADh34iqnEK/ltblM3UcZ34r1pnOZp+3lJXTrZRVQWx3deEw8fXY1QgKDLAv3R7Y
         gdlBUIs8wTq7GrqBAn1DaP9vjyDIgqHuRLVTCnbNL8WAFNGhf9l3pfkX9up/L7jx7Qe0
         9t/484l0x1hxGgefRPpMoI13YyGuI3CcIUiBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512759; x=1758117559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=Zn+oZe3LWnE+w/mGkbG5u1hQDB1ZoYueBkWUHBoXFOr5FZzIkiF0rFxMHVTAkTnJvW
         6/dFu9teRmqOGp4Vf1D7gORjpEfavvwZrJqBnghvEG9YqhZrjHHKYUjzDX9qRDHx6UBP
         dI9aYb5c7rYdwgQ4sI1BcL+q2P7GlUX7L7hdksMuUkrGj8MPfu5W04vaGGQy8/8II93v
         huamJnj45zcCp0Hj4oKCIyZDcdZc4GaH5iewU4QhB4DWUupB7G102N8Q4gL4rGUCIle9
         etja0bPXstgBB8o918+TD7heaIZffshuJufc2JxH2rnnTvvIY4pNuV9o+mSUyddSONs+
         c1tg==
X-Forwarded-Encrypted: i=1; AJvYcCVcojx+WlZbY0aB9Zu8cfssyIty41coCiRw0nCU+OmDF5RZUMejr9WYqwpvi+ylWs6uOCqVPtlQ8kKXAKk+zGnT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3BChJ+qheIuF8F1CBX6iLMQWGAH0G07gwRiDyxmx3tvYVJN4e
	jocRKF9oMq6rBow86t/8sQPJeNgEO+xJptvUj4cpiurhkiKP0pr7Ofr6EEDFdMK8Z0w=
X-Gm-Gg: ASbGncshCajk5vL/HbSHtzLNpBGYnID7iTC6XSiXe91Mxdr/ZFhMD8aqmvG1xys3PQW
	CwFqt5yX0jV2rLh6U1gGuG+G+0RezLaGgdMmKFDC4l9Bxmi3RrlpVMm+Qf+AIWpqC4VGC8PD66u
	ZvDRgAdb1aytjUYUK/3Lahtd3gDeTzzw/kscNnC4BxvPBoxnMODLLqaIETlTKk0mHfdFTKtAPvc
	WxbnJkKY/3g3fAB2H0/xfUfUAQyoJmwuAH7ANWSr8d/oBS+zUeixwap9FvBGjp58NZdbUHkKAoh
	ExVc6XWNpkWv7MuM7FiA40j/9oo/zikRYBjErKoT77/JxSDHsLFu5OB9Lbst/H4SwskVMqEpbVD
	UPmynKL25Tc60+exDgL/bxgq4bB0p4/g9MNxPvVBxlrmrnJB+oEJeVtSjZkGdW0eLPsgFanCrRh
	NVjm65ntFKlc8ttwkmYIwVhhA5Dc5QTrLBshNbB1Po6oA/u0MRRqNZB5nK8gj5rEL8A1AZxa3E/
	UU=
X-Google-Smtp-Source: AGHT+IEM5i1cMh4aLi1EphlUfiAbqmiYBmZm0lNR7FL1Faw8bxW5JsLRVOWS0WjIXeABAYnQD9GwCQ==
X-Received: by 2002:a17:907:3ea2:b0:b04:1b90:8d7a with SMTP id a640c23a62f3a-b04b1463381mr1739025766b.27.1757512759136;
        Wed, 10 Sep 2025 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 10 Sep 2025 15:58:34 +0200
Message-ID: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065921_395725_EC292A1D 
X-CRM114-Status: UNSURE (   8.91  )
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

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 9dd1835ecda5b96ac88c166f4a87386f3e727bd9
branch: tsc_de_glitch

