Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A41CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 05:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=; b=i83L631NkrqOc7knNspBUprAlI
	kDRKQyeIqv0kPh4fIt+dQEMmoKIsUTbNPSijbxFSU1LdIzGVfbUhvMKmRCRqmy5axufNqbROCzv14
	xUhidVqCbi0hZerpUtZEsgyJppzQm9kWIuexy1VPNk0S/1kTC6A2NBssuXGf9rH8x9TQhOFh6BmAD
	/a2+T6d9xBOx+PkERwzXrCxMZOXq/4UJmneTXn4A0SFmSt9cYyVuXJhvdkkt+o2hitVEifKK1UbJx
	WIHfcKqpl6mpBwikJ4G4b64sAp+8LYRQnYqqUjaFrKGmUS1znYrhWaiMRRy6TyS7lEW+bPM+LsEpj
	OWWUerbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGnN-0000000BxoN-3NIz;
	Sat, 13 Jun 2026 05:20:37 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGnK-0000000BxnL-1dQx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 05:20:35 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so1019601e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 22:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328033; x=1781932833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=tFIL3x9DuClhMpVoV1LGlJvCgFqKK6yWBPJXwKbW9lTg3qRDjL5b7kp/kpPbvnmqXK
         A6b6ze50KCriKUv/wbaXK/xf72cYSTCN5xs9h5JG4LRVR7Ll9RM5WTZCiT0xeDqTh55t
         z0ayF/+vBzyt592yAqd8glg4pepJxz5rU0Dd8IdWrqlSEg8v7ELz6g1pZp7tughRZPMK
         WWBqUO1obzrZNJRknhd8Amto0y58HLSi8maoCLAkTIEjqWrTSHwTlg5YpfdYA9AHacTZ
         UnC5lA5zXCm41meGnu+HVeMH1uWOlskmV+6GoeEKpX+9Yh+ffL+II5t497wCH3paE9KG
         WiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328033; x=1781932833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=UNh5ZkjVxjUQfvLd1EPLCJdkf6DQL+GgIX+ynZRSj0Aie7Hp07wQ2FiDG8PpDA1+VN
         p6he/QEvDeJdPEf+qbmMZ2K5+sk2eUk9vEJpHe0I0GjBW4aV2H3lshV2UdU3pgioFKJd
         qxk+k7cV3fyR/fP9Zb84yw2j+wZ8Ry8GfR8slxZl0IyXCHrN7GycpPSGj9glmIoTFBL3
         eFwrZh5BGYnz94L1uPbTx3Cp4NvxvzIEATzmUe6zyfp6YPove7WbJuzSigyNeAB8qtEz
         ORxVj0Xo+qLHbLh26Ibpme9XCE4J5NHM+GgUXNWxuzf6EPSNY8opIvHDC/WcXQetfbKZ
         ag6g==
X-Forwarded-Encrypted: i=1; AFNElJ/aqCHn+n8b/hCArGh21DzraAOYvODFQpIXDyaNCJFCyrH25FD+nv2CBCnWehCYrLHiSIXYyOXE/fQrN+slL4XD@lists.infradead.org
X-Gm-Message-State: AOJu0YydKNTN4V4koiU8k9FXur/APqVK6Q/ofwt1aaOYkCyrmq0jTA0V
	119LWP3iay805Vtj80pH7xKOjRK40kP28PfITXAtvd5ZFfsoxwUKOvkE
X-Gm-Gg: Acq92OFCmNt5dtoFXCn6lSYYFKeq652ZXPUcCMvkUkLHva3SF8LRIQxfBZobH+vXqTj
	KO1zvpYR3ONDhmWOLTitm4rq1DhH3eVEk6UHoEJf+wZmIJoV7AtQbBq9SH0cLw7Noh4JH49hM6X
	vgt8Y6rPvEc5dFSwS0OSSFMsT3nwe5jPJuCtfL5Njzfc4IKZvI+cvWDV1WMye5ajzvfomQxv6L7
	pwqHz2jk3oxnZXcBKe8cIQOh1pYd/hmM2pGYdUx7ws13M1sUSQnxZC0k/F3fb5LLNl3qzF4Kqrq
	1Ec+SWarWuvdkEipHGf3XermICv6SZ4cqCEbxXQzfndE+OK6btoMbt8NfwvJiWGG4ndIj5I4MBo
	xmWhgrj7EY0bb+LBBAqSxxn6fkfck6EieQGmgZOoBOtp25bfcNdfOhmehW5+6/ppYFFaW9Aq1+z
	NNVRxvuBdxlpK+WMDTVS9Z7yrAUD9reDj6ddoWu/M=
X-Received: by 2002:a05:6122:c90:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-5bb6c077aa7mr3940480e0c.5.1781328033130;
        Fri, 12 Jun 2026 22:20:33 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:32 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 00:19:51 -0500
Subject: [PATCH v2 1/2] dt-bindings: clock: exynos990: Add
 CLK_GOUT_PERIS_TMU_SUB_PCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v2-v2-1-3dff7ade75b3@gmail.com>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=704;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
 b=X/BI2YKdcMP3CkhiT3eTACS7wdsMXf/M0WGqng7um4bnMC6SnlomqHBfhN9Xl3HP24McjUzZ0
 YwRxI48IP6LCJz590QZQdK+bnFu9pnakOSW8Ptixa5+TeMbengQLGZ4
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_222034_441219_7B6F38C1 
X-CRM114-Status: UNSURE (   9.13  )
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

Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307cb52..c06f591d9d90 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

-- 
2.54.0


