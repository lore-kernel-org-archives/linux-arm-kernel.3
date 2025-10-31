Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7424CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEEzVDPaPo+3opvcFtHcUqZXHRFcLJbK7RKFKgESsWk=; b=tK+sVwzoeHjxVztNr/K3Qe7tAM
	HBNyP+pyNWCClzV+X+jTLyNZXGM9H+MEWDh9bdu5wuO8hMrV/MjayBMfEcBp0wplPG2Lhx3mNlo3J
	1Wky5Qcp09L776eooxSUD8JTV2ou7wY7eGvNz1Repom1iQh/VGhbbxVazQJd29uMIsxPuvXYWM1j8
	jaePbYPxloWD2JUscMxcft3UJlGYnLJM0paG83ZvJ+8N2iXwW/v40wo/CcFyB2woZHv3bz95R4wJg
	ZuEziENwkyOiV87/ydbzZ0rTBL9+KOSAhNUkTueC5hzpwlqpAr7Q+x/uyEoum7mp7KH0hl9Nkf+oC
	UKIf4lBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVj-0000000660l-16Ti;
	Fri, 31 Oct 2025 12:45:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVQ-000000065qb-0mvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:45:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso29079395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914722; x=1762519522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEEzVDPaPo+3opvcFtHcUqZXHRFcLJbK7RKFKgESsWk=;
        b=HcD6+6jjTMlYI3NFKa9LmoWHVdLwEe/YQcrENqfbghiJfIHYk/snggGIYzUKHM4ydw
         3CkFCestyEJuqvFq/K3oet7e5lrezwVYk8LZ5zMN/RyMwIbFzfzeAfNXTHqc264sY5bS
         j2JhP7/GrS9Qxr1KbVIUTqgwajC/8ooWtdum1PmYkrztxHDCue57a49NRD6QPzu7yLi/
         wQ4SO7GugXds7R+ZXiih2obqvXfEKm0/m40QuyblI6a+Utei4zf7phEIJr83mqHFCH3E
         /LvMoMfKskWzjjW3hLp662azk8fJGfrtt70PUTQ7hr8kXeykqlilosI/EKnsCnp/k+PD
         gMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914722; x=1762519522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEEzVDPaPo+3opvcFtHcUqZXHRFcLJbK7RKFKgESsWk=;
        b=mA/cJHvJILee0V9cKOmem+NcY7kmC6gh2fdVlvEWuR2zk1ZRk6uGttG7njSAgGu90C
         nzDNVRmo3dt2s4R8VSD9AR0H4hhz4ZdH31mxZA3KteqmrOfgZAsGuXk9KwXdvp2EXPVO
         XNFg1DM359irni7GohLNYvQyEzBvykTOQfFGqEfLf7obuRPpxQMzRnc+vxFFgexZhs9D
         NS5PuQZdPXGaAmPrPgE3ZwZioMbDNGCucLo589et6+QE2G+HK3F9LjuDZMlmXhEmCTY2
         8tddaud15spWAKgtyV722fNWR/pXZK8A9/qvko81YvThsxxzXzDB97d7II5S8lHu7kM3
         ZXyw==
X-Forwarded-Encrypted: i=1; AJvYcCVXMRNfaW3mWYzaO9KozwLSus79PXxcygtBGNlTJuY8U/ljtn+6ha19OEEgBi5X5L9onDbxEr2p/xPFfcVBEwZX@lists.infradead.org
X-Gm-Message-State: AOJu0YxTgA9FTRqhtNMdsv8lT79gcXSGd1wnU9e8JKEsGKK03tKVMcF2
	Rmjvf0f7JWucuo24reLvqOdYmg34cl8f2dZTmmNUMCnfea3qIneNQyjmTccSFXAk1pQ=
X-Gm-Gg: ASbGnctkQXczHkliRJ2JJuAgx0eEIHnNroEboMox+FZAGBF5dUt+PpQ6AbCKapnGm49
	sbiwWf6/YxH8sd6oKew7g78zS52jwV9QKRiR6EhYoJL+c+uCa/EBZ1lzqua/zA2Xikbeky+aPJA
	06SDtfD9qQei84v+T1zKLkKXLSHGiI19a247Si7gZHy71Np7zvCc+NPaATo1YswrC//nM0wvRZg
	TD9QjNkBh22k9ejX4ZVtUBOQfloqtVjZ5q3uqsxw1P6JUdBVD7gzG2yhI8RF0UwK4QB+mRu6Ble
	XM4gqPkJ7U4Fgzo6mrDvacPm959Hjo6o/kn9kiyG3wiFaeG60gNEOnFpC05HeXNRKfoZoFR9dXq
	FoxPICCuw/EJN567zahqTgcfIoHipErVaplvviV4sSOpiLeqy6UsWaMqvr0q6kD1a2GucvYcCBg
	tCIc2U7N8buy+6x+lHp27b72g+ZVvXAN76TgeJ/fLABbUJwz9f/U1x
X-Google-Smtp-Source: AGHT+IGudjMOXqaJcnSNpcKIftQR6nLMDH8mkpNCYaYHTE5PBNCG7YLAiVUUFPpv+vByeUUIkYFsMA==
X-Received: by 2002:a05:600d:4393:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-477331db3ccmr15144245e9.3.1761914722313;
        Fri, 31 Oct 2025 05:45:22 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:13 +0000
Subject: [PATCH 5/5] MAINTAINERS: add entry for the Samsung Exynos OTP
 controller driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-5-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BRKY3GPe1+dBZ+eX+MLZ66l0mvit2jHge4hZNEeZzx0=;
 b=kaB+fFcB2Da40OLIuL4pYpifdRadcaa8Qg7wjSD6cQePf9r8H8vzcuSNE/jhnhWzXLFwTTsAf
 ljjUdOxSwlEA3FtVZA0GGk3QXkQ/RXgqhsL3tx8kww9VrOB6mnl68KR
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_054524_694584_A965840A 
X-CRM114-Status: UNSURE (   9.32  )
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

Add an entry for the Samsung Exynos OTP controller driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab00eca640e02d40dd80949986d6cd6216ee6194..813a098475ab7d5371c811020ea022f63d1acb35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22775,6 +22775,14 @@ F:	Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
 F:	drivers/mailbox/exynos-mailbox.c
 F:	include/linux/mailbox/exynos-message.h
 
+SAMSUNG EXYNOS OTP DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
+F:	drivers/nvmem/exynos-otp.c
+
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-crypto@vger.kernel.org

-- 
2.51.1.930.gacf6e81ea2-goog


