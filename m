Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6484DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=; b=YnRyh+15Lk6tfkhBoOQghLzroy
	KOCyglc9cD1qliGjp4eb/vKwwo91NpZtC3eRtPmtPKPa5OumNSODlAVZlLEUz9RLoK9HtayrxYBup
	QhKgMVKi/jKDGJ0L2MU4NQrXFUMTHHTa9Te0kxkeBADtLQb4Ttqwwue0LhEc2FMjabj8xMrf4TuAl
	pd/OmVEfhQSriq5M762QEveXCvxlrqUiblIhikAEwGnGF09LMwMdWzrLDpMqC0k1fvE9RIVrRWj2O
	fqYxXYAqSyCRxS5mt4OcUR3RfFu6POpzwJLK7vivCr8sGTrN4dv0r2w7sEdAcQDxYUCMU5rwzJuPh
	5jIEqt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWgD-00000008bNf-3HPI;
	Mon, 11 Aug 2025 17:51:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHm-00000008APf-3bOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:08 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso7093528a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925485; x=1755530285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=P4fX8NuLWfvbAjCvSCVkjeHG+faKgfDQJAtFfJabo8nDDXHlfKU1IagttTp9eNybSS
         kqHF0RQqHr4WIjv8pa/jZyZQpL7c/7g7x36ssMvKuJFp6lyR6G9rQAnba2Gj0+8gXg7s
         /pjVpJswda+Si1wszfmz4xfvn1YSx9j4kgmqGLgHCh0mQOOVIODPqprIucgiTu5G5kSz
         LAFd2nENuXNcYJRD5r7mlQKU4cW/WebIzOgjvY81+bI21rEAVkh2k5jUg5lpPpYhEr1l
         1mc1/IW+z2Fl+fAPnFFEfYF8Sd+fkmtus/9sCQ/U1pUO8q9+Xq8ar8s3mPjCDygxra4e
         q37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925485; x=1755530285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gr8F9oLlUMXE4zHvyjlznjcTWEkXwUVRTFmLoor2DC4=;
        b=RJMEm89XKbCczkear8htdlym911LOGA1aIMspyaFXC8w/9HZ7sODUonjMLwyXoLE1m
         EOqCL451QeFUgxpxjQ+YDGDizeXAxOzCONl9jtUgRGFMD7BzsBZ+zVsRQvlihSZY6JuS
         F0HDx1wR4egv6c0a3Qf6sSoIyJupdJOJ6Lurl5+XW7Y7Q4gjs6Zp9Z+/EwFnfgwI6Ju2
         TSDLyNFoHhEHCxLCZaPa43quJAIuu3SGw+/b5IMSewB0q8lNh8KbFVTAvu9+xWv6kRvY
         ZqEFgiFNoIjrrPFq29xMguZ1NXqK1UdNcR1Jymqlzu4AHzauQAKbgNTUm0G0QxE+JYFg
         iTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0vJ2ypkBV9G/TaOL3YaAW/a72MI8eB5+Om7T4dG0G3IkWTChufm19KfUZsC1T+EZ0nEOcDZCO7uMDML92emO4@lists.infradead.org
X-Gm-Message-State: AOJu0YwYfgGH8urp1mySOxSPXe1qPs+5bgJTSOzaNlxWi89iof25ywAb
	8xjOLOBFiVEEA3srl3ngN2CLwKsNn3VuFUkjKn1ps6NIBWE4QEps+pXYRrRCFl399ZA=
X-Gm-Gg: ASbGncvj6mGWOEr1hB0L5FjC9aSAARbzp9ddCK3B8XCf3wrzn5uKPtS0OoiG/rlytcU
	yRPPqHwuto9NyztB9vwZk2uY3CHit090F5pqXGo8o6BiORD3hiRtcMfplvTroYdpK0CCwTyojqX
	kqDP6q23mp4VCc7Sdk4qyDlgIBHmVenhBV9zyRVWn+pvrDlg9/wz8yAYsmA5k6Ga/Fp95k/M3qH
	7urt+UGOq8AztE9Y5+Z1Z0HKYy36TOk3FInbdJMSV6ttAJRZoxyLU0XhJidwCWsecJAnLtYJsXK
	faagjgGyjOBLtd7pzUMGUSy4mU36wLGDokC5vYI4WrDNynMQXcCuLuUOnC0YS/oVJdAvBqRLwIL
	DPhXhnW9531+51j95wkYfK6oycQcgd2CacdJvtgHQN4sXEans77UuRpId0V5BPBnNIOm0dTxemr
	L2
X-Google-Smtp-Source: AGHT+IHY6hHjl0ohw0BhRb2M7W6IV/iJBLaLg4s2DYOzsYCD7hIoPswY0Mvw0fvinMbPKLlE+Q0fyQ==
X-Received: by 2002:a05:6402:2810:b0:615:a62a:feca with SMTP id 4fb4d7f45d1cf-617e2e9deb2mr11476569a12.31.1754925485240;
        Mon, 11 Aug 2025 08:18:05 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm18638282a12.57.2025.08.11.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/6] dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
Date: Mon, 11 Aug 2025 17:19:45 +0200
Message-ID: <57dd103c430f1a064b6c55809e4d2be54fad0e11.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754924348.git.andrea.porta@suse.com>
References: <cover.1754924348.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081806_896474_C13C5E31 
X-CRM114-Status: GOOD (  12.30  )
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

The Broadcom BRCMSTB SDHCI Controller device supports Common
properties in terms of Capabilities.

Reference sdhci-common schema instead of mmc-controller in order
for capabilities to be specified in DT nodes avoiding warnings
from the DT compiler.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..493655a38b37 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -61,7 +61,7 @@ properties:
     description: Specifies that controller should use auto CMD12
 
 allOf:
-  - $ref: mmc-controller.yaml#
+  - $ref: sdhci-common.yaml#
   - if:
       properties:
         clock-names:
-- 
2.35.3


