Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B41C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=; b=gOw1Jbj1Nzy8bLzqJiFqwZsz2p
	X+0/f1a+sBy4oecrA3FvNrO+y1KwDeNWJ+U3RmVp8D9iEGxG51QoGSOUTdoNSQQvcc5TLAuKlBEhh
	PFbgFjVSUb+V6/yrN0gqRSuT2Qpag8v5d9mjhEKCDzEZ496dag8oLhlCm69Hd3zkRLwNGZuuu7Hph
	munr1by6EPxkRS6E0gfNqgdQ36r8RlUG1Eozb9KOyLSqKC/htXxita+LxO+KbTRQEVRcMApo0jDW/
	1baoPO4nh2CyVKekWApo603oT9gAGMCM6soDtk/dJq4h76DgKmXGjQbEkfYXvl22XDBKROayMkhqT
	99RogLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUrx-00000001ux8-0cYk;
	Sun, 23 Mar 2025 23:36:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyr-00000001pFH-14L2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac2963dc379so636679266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769584; x=1743374384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=Fu2H6qY7qnw4LL8S2E3dz3HqP/shrFtCXITA4RsixTWDv36GhCEJp4QayJlx3UGSh3
         ejYCnGYVsGYpG2+UzmnZNGZwUpnvkUXhxeY5PNXNkLCp4szz2bbZMotvpQDkxKyC/5ER
         IODkuc3XT6iHX61criIdOAed67R2A8SY7zerrHq0+pgEH/myfrJV5HQ5rjw2IYtks/54
         tzg7pqKGBZdNvVgZqlHi9fRRyozyCQW8dvCcWJ0cLp37r3mVS8vNDz90Dg8fe4bLaZgn
         NA4QYvU72oyzYCR2vkiRR6BhFr5OLb5ws1c9MOxHfzzl0FC9j2XOrvVtO+4STEcmMwdu
         AUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769584; x=1743374384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhTacnWIaHzojbgZVRhkXLoj0m8Qn0dJu2GgWCUO9Oo=;
        b=Uy7XCesuePtcYsgDnz0CcNqPft25vq1R9OW8cJKQpUYmemO8xUBafC74A47dHn1EHb
         2E9XE1YZOP4dLSwEHutDV6Ngtp4zMICACUZkWSGLvQ1ccs+dKqc2Iik7QSGqsmjAx5GW
         rui2TUyLq5Eq1A825zE3KcZftHqDs71RRAjOZe54zUHJTtlIvSD+PJiPOND9Krdd4qrL
         8p7SyRFCG1RJPpcB0yxtMGOXOPUh/nQ5rS33IzjqWLVXpiltUXXlLshh8ZuyHDwFbBBx
         93klOFhVwmeaW1sKpIl6iTJ1fQ2KdfOPN5D8MJUvs9I8rjfdkxy6LB9wp0ZmvEgTISRS
         lL4w==
X-Forwarded-Encrypted: i=1; AJvYcCV0soJy6r58grbFnyrjYXP2Brdnh3gYgKtb1xA0jXfvT4uzCulTyzX2AUxmcL9Jze1OdpxsaiDG/IItQcsx5LV8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw375FAoVXh3Ko6So2Um8KtJ6dxzeYRO4nLbKz8peN7ZrzZn4uT
	NMiBhzuy5SVyHXvHmSmtoxUGlH2+hYjkhtIWJCT40a6B9021P3V6j+OySCrq95E=
X-Gm-Gg: ASbGnctqQiJK3v+ztUAXhltomWARQKJp586erhOw62M9eC6FnWJxeWe1WypUKSdzke2
	qdkVv1up8LlOMhKTZRJJ4FVkkQsBt0Kzuhfa+kdJUAF2e7JB/dimTm8/xDTygJmAUqk+ql+3nV+
	nfPUOCGbi08GzbQUfQo6DwNmNCtM9SWAgsBnoZH1JA1xWwbBpLXXyTpOtlNHNvjxiItaR3lIdOb
	SuCqeStuppTyCgpP/qokO2Mt+oo7rnTy7OKHlKTioO8oVNM3y1bBJ5p9Vvgh1QRyufPKkxg8oG8
	xaxdybrFTYUGq4OQNPtKiuXIjxYiKxhMbU+clMEmeYR6RXV5q7S/wqiEoXFdOtz939BlP1Q/0iK
	9TOW//cvKsRZbdG0GXx4V8cwHTigw
X-Google-Smtp-Source: AGHT+IGBmk43Q/5KSqStfiKdhkMzhnRppuC/FFtUW+Zjtoma50FlDv2NtShPafcq2wFC3LRoUhXzZg==
X-Received: by 2002:a17:907:d2dc:b0:ac3:a7bb:1c2f with SMTP id a640c23a62f3a-ac3f241b95emr1147181566b.7.1742769583868;
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:50 +0000
Subject: [PATCH 34/34] MAINTAINERS: add myself as reviewer for Samsung S2M
 MFD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-34-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153945_290036_7358D93C 
X-CRM114-Status: GOOD (  10.31  )
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d686e02dc7ccd61e35173df997d2f894ee5ab515..10945909f5b317a894b6afbeb6bbccd1a691de9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21341,6 +21341,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.395.g12beb8f557-goog


