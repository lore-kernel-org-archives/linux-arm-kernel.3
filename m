Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8ED0C84A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lXYPhxT4VFsm4+vuJl0AaBhCYe20t+H2B88DUgUIoBc=; b=xA0+c3bSEi0zIu
	HAb1hEQb+CJ0eaAg1kL/SoNS/W/0r+0koa0iQBDolb0OW9D7444MOdpLqj0DD9eWYX66hIfVY3vUB
	dkvzvAx+8tzRRbdg8KgT9WNb/hg5tYNaIVHf7gkOmPXenAx++5K7Y0ZCCelWucRnrZLa0QlVkx5l9
	VrcKkLQxhrRbLrO0qyfTHV2tXm1v2kvzGw0vxaTr9rflMlkxmhMgL1jXQovQgUOawf3jNX7YOoTCQ
	Mz03zcoT8yG8v0begkaJvH5wGZ4RoOlGajinfjbMDT2pv4ZVlk+VKuvXR+ImHJVVK+H1279h0ZuTh
	wufL50uDT3nlVSKPUzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbow-00000006v9l-3ihj;
	Tue, 13 Jan 2026 10:40:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbot-00000006v8R-2dyJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:40:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5957941f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768300814; x=1768905614; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXYPhxT4VFsm4+vuJl0AaBhCYe20t+H2B88DUgUIoBc=;
        b=Fe0lkXYSISk1ZJB7zdRIsyRth7bL7j/Kx64HxpoBE/QaqaO8r+AqwRZP9me/szmWwQ
         FmGhbMkgno/A927hXS9DiQpZ9NO72fZwU2FdkeW0fV0DruloFOyprNORLg/hqxTFHj+j
         Y6xmKTdsGQCMhtF01OfjQeua4ubuoqJ42EsN15W6MPWelC9H4FgOEolW4P0EoGqCwuEC
         n1WMFoilhJjYOnLohz8ZdXujJdLXVxCMTGFrpiz0UuvWSwvzQXZMSWRcCuQcWkhVPi9Y
         6aFZSVc/iygT/8o4BOCmHGkM39JdCnVS1YudAfDHRJ1tNfiHKjYllYHFP+01m+iig+mr
         FXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300814; x=1768905614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXYPhxT4VFsm4+vuJl0AaBhCYe20t+H2B88DUgUIoBc=;
        b=JZXo8migwbrfHWipkLapZhm8d0i4S4fmvlDVzKgfVu4FUOFn8cKP3IGhFPpS5L/lSP
         ZVjI3BiqL+YI/jucP5EsVj5Uk3nWG797kopugKVuotwNv4JutlQW1Sa+FlkIYAHwq/bO
         RCVmFg0jZN5chNm2T6iz5qloF3t6j/dGm0i8ZnNRTvWPfrgyO8xt+7ZABvynETbwMf8g
         OOeuNJ47XsBz0EaV3yTfHx4FSEu9YTowRl3y/zatL3UTLhoRFBtzH6DAvVaVwffAHBsu
         czBwjQdtpmZ74wgtw453SOmxDB6bzXv/dAhQrQCsNT5BwveYr/bwUpwihRFqQCe0VsJ4
         +9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW1H8WH6zjKFbBqr7S6ReViEkq3/7tFVki2my/3Uas77EeRrhWeA17dj5OuMQpNBiv3haDzViHJQG0mrgTUvBvj@lists.infradead.org
X-Gm-Message-State: AOJu0YwEr2vSM83ssAc7+f7WbAYXlhxcaOQezLP2hX+y9W8nesX35XlO
	7Etz8364S5nHlHWxs3FMP4/HNO44WrGKso2ahIux/0D8zkPS2KjahgTxH4qo2xmdhJE=
X-Gm-Gg: AY/fxX6doWYBdjnKggD5VOr8nfLsw1whL5Gx4EDks2zCB/E9eI5vLXCuIuc6Z/4UdRn
	7qAUgfIt9oFHBTEJClZFlxN10r7ReCE/5Yn/n0He3ebTSFkxf1Z/tyS22Iv2CKzCguqqnXAsx56
	BZ/s1RyZbkFtVZelAXLmlPOc66XgZUFsGpQ+BjttJjaxzeWEOgjIlLqfBS5QBfFZC2B1tvx13KI
	Y2MURgeBtFJ3n/NQocoYX6iQgWPrkkZ5oXM2GUVPkAZCNzLR+OISV5bc4Gx2XlG20e1D2f390RT
	v/wPOm0dKVjguKWsVn8lBNtMtGyNvSWvy6GCBOzjR79uA6221sU8K/9HVqfzvOqVsj7qkGHbEhp
	zhcCPhrnWNGHPmHkAoCm0pj/bNuWXUdmtKSg4TdlvL3npEdqi2/8C7pNg/Huz4bERQkbyEzNs/7
	QDJRPCmjIP
X-Google-Smtp-Source: AGHT+IHFzNYoWJwOUEYhgDUL2jzgr59pL14dNINqiejD4tK6O1TDnQY0+fHQGFbBHWVT74A5TNYbVg==
X-Received: by 2002:a05:6000:1366:b0:430:fd84:315a with SMTP id ffacd0b85a97d-432c3798332mr20221772f8f.39.1768300813665;
        Tue, 13 Jan 2026 02:40:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e16d2sm44942027f8f.13.2026.01.13.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:40:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Tue, 13 Jan 2026 11:39:51 +0100
Message-Id: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcgZmkC/x2MQQqAIBAAvxJ7bkEtKvtKdFDbbCErlCKI/p50H
 IaZBxJFpgR98UCkixPvWwZZFuAWs3lCnjKDEqoRUlZowrp7dphqDMHhzPd5oFZm6qwWtrUEOT0
 iZfFvh/F9PzWi7KdmAAAA
X-Change-ID: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=teOBXSGPl+wXTHvtP2Og0GZe2H53L4WVvkddC0eSMu8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZiEJ+z5RHj+9WnWssofwZJOg33B60V2w+bpBd
 qY0coeQCL+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWYhCQAKCRDm/A8cN/La
 hfaZEACF5pgbd/q1o0s2UUMpaNbWIzuF7TlR4wFpW2nULLpPJ23Kr2F/i7q4Ajygd1+LhPVt/PJ
 uSefmwSXECTBZF43x64tJCn6oWhXMYUDVDgTuCr4l9t0iY8LBgAEP2MnmhPg4LyjtaoT0i0A1n6
 XtffOMurVTWkGKbJt5bci+A9el8wET1gos/S0CN0Cg1tPq+Y380BjUxvM4dSh0dpb/nWFhcm4OF
 M6yRYjj/+3jlmNgrRp+bVOq1QkDTYubZowzsnqUF2JZ/LyempgIeptjs1JrcSO5x3xwUf+1aYnR
 qItk2ttafdTSCAT5B+/J/kkzAgQdPqbkcXUK2QXajdLgqsRLgmHkiSRHC803SzcAAXou5krZwoO
 MLVkjDRKtYq/KvX+sbfkeuMm9A6qDHhk5ocmd8T3iggOVH5z/TYSgStkgWR6t70iEfXKCpqAU0x
 ZwNp+xeIJVabXyF/Ks4hwNbFZKvY3LcttP5QAgnTq85yIBC9HuSEoptApQUcDocEgFGrZLz7nbV
 m+VhY4CHq8sHSFoPkRZ18DNbsN0d6KZDTrg/6drh7AaeuwTxWzUO+jdcwDGs4Hl7FO+ounKmhD9
 YG1mY52rteCT4GkwtKKQmWaJ9exSyTfPaIId/Uw9gZEoie/GkeOf5p7BbXvssbdCoXegMGyufa+
 EtrJMazGI0Eiy3A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_024015_693365_3B6179BC 
X-CRM114-Status: UNSURE (   9.88  )
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

The patchset aims to address the issue raised here [1] for MMC B.

While checking this, I've found that MMC A and C also appear to be
improperly described in this platform's DT. The 2nd change fixes that.

I do not have an s4 platform available with me, so these changes have only
been compile tested but assigning the clock was actually tested on sm1.

To be on the safe side, the MMC clock should also be assigned on the other
SoCs. More changes will follow once things are sorted out for s4.

[1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


