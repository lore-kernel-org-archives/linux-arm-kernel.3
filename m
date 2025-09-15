Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2505FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=; b=4E25R3PT1K1CQMRV5IAalgaZsz
	P1d/DsXcKIBUFoIf60YEtNbnOYKwWLIqioSOI9h/a4hua/oIRRd7DpotjFSEnKo1nQJ7vDot34JLv
	rG03B0mEI1m/4ALMqZyio1f5E/Trbb+ltu01RIFQ7f0v5v9l+Imcof0fhWSc+HVOsPSOJL4ibbLF8
	aTBRtI1zmAyw1zf71RN1+liM+LW9aBtOIhuW+izWtTmgclh2n/g/t5oY0eeaLR5CMoSA6vouZjoio
	5OdLijjnHNkN1jK7Nkee/Usb9rzyZfxC/6FqPy/yXp6wcVth5gM3fghANhAGbAsHESGuPXVoPrmp+
	TC/AIvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGt-00000005Xzr-0BLL;
	Mon, 15 Sep 2025 19:53:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFGq-00000005Xz6-3mBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 19:53:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so32085785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966031; x=1758570831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=hsnEof1yy9rWni8KhviJAmrfVLVLWj+qdS3hq12ejR0pz5SABBM1LPq8+h1NUm2Hnn
         uku75A7TMMWF+A3CSLaywhwUdSVXZx836EdXjHpzG+ajKshCHOhbQAqdMZ5WXWXwHRdI
         yZ/TvGwsY5eKqVdg78Ez+7z+dnQsUQGU33K3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966031; x=1758570831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=r1JNjlRCeXYir8NfCJsDF06dEv2NuKpHs83QQM7jIo9jNl1a8jed9r/BAscI7a6LMx
         luM4hRV69h+C695Ed+YfamRq+DIUDEalEDei+xyqfu9DOg4fFcLbZ66AU0sW3kDysnFA
         vtAjRejU0YkdgIMOqLtCtLwm5LSwrIDFdNg0+LzCRC/La0IRzAF+5iChEapdeU43lXhg
         DUYr7AzjiY2Fy6Of5RFvMpZLIbr5lQiAaR4thVKrJqBzP7kAI42bzcbxsiqwguivGaA4
         wFn7Y+xT35Zs/NNh033GLl0AzGKtkzqG41F4OOSk+Yzn3A0OgSYsBpgzLXF7/1bkUmCu
         Us1A==
X-Forwarded-Encrypted: i=1; AJvYcCUhWj4+WGkTbGEYH10pt2Gde45zfgmNGNfoMxreGxob6u6bxR/++T8FXnByXyFNs2mqQhPU5vYoKn85ptX3FKcF@lists.infradead.org
X-Gm-Message-State: AOJu0YxfINYYdc2AUTFFEfXRBS/Ga/wpZyB43dBnsrHcM2f9FTDNvFXr
	C9ZIrhaEgw2J4kpGuSdkTCop2qCmxeFCLHw82hYt4hPJKHbIVGsThtYFIgQDthFThHk=
X-Gm-Gg: ASbGnctCYwcHXqnt2sNHQ3FgYBiaadOR4U2X9dSyCZbrty60ypYgOFIhxTBVQ4VuEaL
	a8haNTQvdEgOysPXBjpHnTMUGBtF2fJ28wG+GwHwjVJBG/9o2/H6OWNsJ6LGCg+ZhSP949f71VI
	K0dpU6t5Oc8MaTZ4+d9MgvaIFFbrmhoC8qu/eYquc86yDKkQ0cjU1mjljtVH39nWte2Qi4fYd3b
	4rvJ0yl6thnpo1RufK9FkkuFn6j2X44FQ9Jrc03yYlGhEO4Mr/xtY5yBmsBXzmxQM5v9Q46oMVp
	7xqoYT9f02pUo1l1RRq1JAKEjUHADcCXiYYsjzvX/+iAXrkrmjiOSATHoAS16kiFKTihVcA/oRU
	5A9zQfYnLygnVkcLxHCOuMa6ip7vN5rvdMkWLCORxfVU7bEZL0KQ4krefPDiXwz4=
X-Google-Smtp-Source: AGHT+IG7qHwPsEqR9IHaKIK+gqJMIa/E+Jy05PFsgkH/KUwCOfGsFJPue2mRPxnFFVk+CO6qHeKm9w==
X-Received: by 2002:a7b:c44b:0:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45f21202a1amr79796525e9.35.1757966030718;
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
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
Subject: [PATCH v3 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Mon, 15 Sep 2025 21:53:02 +0200
Message-ID: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125352_966296_EB91A84A 
X-CRM114-Status: GOOD (  11.89  )
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

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  12 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 95 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
branch: tsc_de_glitch

