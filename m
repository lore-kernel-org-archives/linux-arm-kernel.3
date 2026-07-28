Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062E0C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=; b=QLaxpsD5jNVss4u1rbEPEOtouZ
	WHJRAck7Euw03EEQy51dadhn5tc66qLf3lI70PM+7bHsC556tPLMIJtCL2szIGTvr/ITmirP6BJfm
	Z119nUa9GsvzyUx+Rs+qK+YNaifTYJcsgcuSdrYN62TyQzDmV7PIrCKdkDReH6QIO5xBHPFPuC5VN
	V5OBWOjSwYnssJExh/4q7nMJCeAvJfmV806jLA9QxBueXCDnd1ViHCQ0ZOkoRgwAjMo0sNLGFwEbN
	tFleSAwfLHERrdHUqDaEutU1tVi0pCnWcSFjlz53ssVeO+RnJlA6R6KxjpuD8gUmBy7eKXEoeJJ9r
	IsE2hAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojY0-00000005c87-3fPD;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXx-00000005c4n-2Qax
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so42766425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251803; x=1785856603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=LOuJTKWgyJl7MH87a518I+rA8z1otp1SH5u5+6L0ZhWTncylyo42ys7wEneyK1GzZR
         wTcs3G+rb0pIVmYjNstbmQZMYf9guQdtTtX7w9kY2fsG+mdHyxbGhqBvJ2AptrcU6U/5
         NKJYDObEiFA5BZCmyYvCXeMdOG0pvwCxQA/hEHK1sWtbzZEe1+sYkidyWrO4GHTIWFnM
         digvxWmfwuGunamA9Vl5/1ypqYsqnZwxqZJTiAQ2VDW6JbXynbEV9eXCtQaaW1GsZ2Ap
         0rCYTrPSl9Oh9I7hnB2Lk1GDX6AcAu/xlE86dlIXMDc3h/ss0K4H3YX7Bf5oOeKnNC9K
         bqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251803; x=1785856603;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=X/JKJ1ZNcej1wP7PmXklm+e4AAzyiAzElkmSJgKmkR+btYP3oharnUMiZqdtz3iYlc
         J0SrA9ULB7oQnfgKzZjPfnOewaCTmpjifRaeXJYFjKkoAL4rw3wm+U1drVp8YU7tWmb9
         CL66i5ssG4pyzOFrOHHU2uQv4fSiCP3gvbnYNHTTzN4PcotFZE0HUaxWObFnyGuaal2C
         94Cz6ve9WHRUPTYeUfLnhVW1AdDtZy98b3/fDtAmQR1Vm5rbF9fkOorLoM7Pwf5T4/WZ
         pKfnLfP9oQ2C5DTliE0TjFS6G1kCaNJypyE3dY/QWWb+sXxG3AiCbiNG/tiJojuNJ1cH
         5TIA==
X-Forwarded-Encrypted: i=1; AHgh+RqAYDUYfcMuNxREr2JZKPVksshK1ZJKtMwcBMsgH7jG0QLL45NNsg3eCbooC9IzRhlcdcY7hrZ6Eh4FHkrb8I5v@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy6Dm90VzbENt/u/5y+4jZ9caH26M9Orr0B8bKzg6RDrzYQryH
	GyNGzA2IxobrsukpjOuqTRX76QN0P1GtmnY43rJUExU3I1i6vlosf4IX
X-Gm-Gg: AR+sD13bVPlTk2/1lK2DQcfWEM72tUewxmnfNnXLcyuGg4Ci2rjxBYCJ/UEy00GAALw
	t+RjY/++qaHKs6wMbk0PuPrflnPekFofSra73cNfwVhc0APzm03WNTvXxQUoEVMb+nQOa0/oKy2
	m/NT2m/bSFVRFwsH6KNVHgo10r95Jwe7t8PpQu/tDqbN10JH2NbVth1TljaIxoSQ/2tZm7unRBg
	RRaS2TBbxI7qDW4Vwnab9z5woCUxYi/oy6U0Kass9ShLQHBYNzt2rxa3PgD1sIILSUHuQbOH77E
	IjCp8K6AGm463JjXnLi62lmPVfDQ/iWZRal4O7Z2qTnKaLKh1ndJfE4rjh4KDyENS2gnqbe3B4p
	ZYzYXZMF+5yTJPfSS4+9bdnxn5ShE5Lv9tI9VaR8Qrgr//6mr+hwnfWaAYxaYIN4cQS+XUy2T5U
	bMgR5VvTRhxg4JaFH7WKAknuXj/zcYqfr5m3uyp0mwNwtMig==
X-Received: by 2002:a05:600c:4e14:b0:496:bba5:33a8 with SMTP id 5b1f17b1804b1-496c658ef36mr29194675e9.33.1785251803412;
        Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Tue, 28 Jul 2026 17:16:35 +0200
Message-ID: <20260728151636.236393-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081645_645427_6F89206E 
X-CRM114-Status: GOOD (  10.70  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


