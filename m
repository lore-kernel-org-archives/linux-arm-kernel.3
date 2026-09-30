Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B85CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=; b=WSO3Vps7iYKZGmmcpqrhTTQlDM
	/s+lZDf8lMxvapEnX/K+oqUWXlJBiw2eatL4q2xHQxZIl+SjfBplLibmiEQgboxIPIrI+DZ1PqWv1
	Lro1PKth+InoK0YPPi+VbGUnX6LpdTNNNfKesdYCwH4S/zW8juoi3UzZBSfJ2u9DjzMnwG0vqtrfg
	u7X1Nk6iJV6jskbCGt/2YHoTMwSgdCgnyar444ulHB2txofXQHVUH5HMNd9vD5ECKJUoNkNDEJYJw
	ZrdnVLvJjZ5aGerwwZj5lftg6DvjFmCQGvf39gQMk88bPta/pV1pgsMBnfunLpFoQUl3pI04u3lpb
	PiFMhilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwp-00000004nhe-2a6t;
	Wed, 30 Sep 2026 00:13:23 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBhwi-00000004neX-2bdS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:13:17 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so22841885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727195; x=1791331995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=hjPzZQzZk+iGSlBtoHOjoqWoUXBagK6/QOiyqaHSX0Avi6XhI6Hv+iMSeZ1fIBwEyE
         mI8pVS2STmS3DA3x1ABGWNu3XSujYMc8mDyAUfnMpOWEFwMg+DhQh5cWQj59iqdKeF9Z
         0uTvm7V+6z9ftjQujHEnaGVmcsKRgu9z2TiI9AbRRETsxRRICn7lHOl5XZlFDwfXMB8m
         NXH/LxIW91pGnVN6iD9DLdbvEM3xYzgmVIdFS0oNGsPjqyQi1+wujuOXT1nwmt87k1yE
         JxZ2Wll3RZebzs5NfvKF+4xypQMCZK6wvdt2BngFcbwIKSBQaaJPITZy5bVgui6khyD1
         5Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727195; x=1791331995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=EF/WaSaqSzyPBGaqXM5yV0nMd2Wl4e4nJLOzB3i/z7kQbiuI7Ww/cNXA6OSDC1/eCb
         qe0V8yhjrEptSE1LFdNQY5lq72tpfcln166Oi6bFF/tQglhMVJzJmSEytmMoiQnfUlSL
         XhSq+hpVKsh/6SC3+xk+5/JteEn+7PoOyTVs36Ja/zUZIhnqx4g8ch6fvOh0WtUq6EtZ
         SoLeOSmlpHEgTCc+vzIJUqzqfGxAsmFxGPUqCbBTuUDK9VatzSTsPSiLOands16ejFoT
         Lg6w7HlvZuZen+15VCdxpWh8mO3LZwWU8mB9mwemhtdJCehAA1Gdd6YKCD56w6ilppXq
         GSdw==
X-Forwarded-Encrypted: i=1; AKwUvBxSt91wAg0pRmHmtfdjfx3Z78+1vFIdpW2Gnqem6ozk9Bb7KSTe+wz3WFZCK8RdUvDfF2TpEfBJcJ0lKoW8En9n@lists.infradead.org
X-Gm-Message-State: AFuF++lq1syFImoR8EXZ1ygm5x+gnst9TjSWHocA0wM55U++Jc6SRXGN
	dY+//pWI6z7PsmsgtC+nkPSFSxLg1bNkKyj7CKx2KM1lGptBVh2l8nwdwfZBreehFZY=
X-Gm-Gg: AYBFou3yBEdwfgny4obF8kULZ9qMAwkxEYD1NEFwb7jrQwb3ADWq9vpBRuplrCmXuQF
	zPkDZsgoZp1gf2VRAXu+56at5uH5GWB1xbzAQfa/0o41EGuT5UVa8hrgOVa9pUjEJhL2/s5Qtt/
	pZ5xtI6XGaHiO3qtPEr3ww+7J5WolBL8uMjdjT2mhMI4xhMEN6oN1dfevF0rc340Rsh3yTz3y/4
	xkeKnJGFVE8tDtebjtFYfPeIaOEv1ZOwldDnt65ZZu8id5m/bywQx+1U3lqHD2n8oP62dEvD2y4
	ciL7mBpw+Ck1EsMGI0shJEzMInGQUlNIxqHaFfBk5RZe10pvUnKMY++VBgP/hBldCyB5pxuYw8Y
	Jh9Pp2JHI8IBGrMVv5OlT3w2YEGnH4lToa/piRJZg4fd+aRXZiJZEZX7ib8TIXi6VsJLTRJ04jh
	3q6UBWQ7AAGHPVflkRTGcF8J2hu54hPRr8k4weYSJOivh4nR9usxqlS5fdjJhus0UdjH2TA2Jwf
	pPUTDFHXt10r2hjJP8BeASbLJHDkCSSWgY/Ig1dTGZEGIi6CRgmVMwHfYLskg==
X-Received: by 2002:a05:600c:4fc5:b0:49f:f997:7ed7 with SMTP id 5b1f17b1804b1-4a01503ca46mr9945865e9.11.1790727195101;
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:00 +0100
Subject: [PATCH v7 5/6] MAINTAINERS: add Exynos850 PMU entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-5-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_171316_683988_53CB6C04 
X-CRM114-Status: UNSURE (   9.29  )
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

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 137297bf508b..810111c83478 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24622,6 +24622,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0


