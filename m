Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3FFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fv69bovuvm+Pb08hvzVs40FNmn1nR1es7GqKP5snc4=; b=rh+5+c72qo893D/YWQ/fBK9PKz
	4TARIgrFVKJ2bJba+x8EUwORUqREpI5KM3bnZEnk/gLlU4bqz25pJ7dyufibhT+s8bCzXtYl1LtC2
	EY4RWWfJ5pX2XGYL7yJai5RD+KWW5VSgFzJgqswac6+X6gb+dyeCXV+E2g0zIh53v4kuvoHa1c4nO
	6NYXBb3ih5DhYIkIOKffHBoynjegCxCELIUa0mHne2s31hvuZxC5soV9F8nXq259BMsYPlP+dQ6wH
	y5AQL486icxlQ0hQGhYv/q1q7QecFnTlU21wxHPz1Rr8PtkJ7nLD2uMdGog6MIrfVZH2lF21RZt5b
	jHYcWg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyyw-0000000Fcdc-1Nd6;
	Fri, 13 Jun 2025 07:37:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyef-0000000Fa04-3qM9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:16:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so118676f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749799008; x=1750403808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fv69bovuvm+Pb08hvzVs40FNmn1nR1es7GqKP5snc4=;
        b=Rd51oS2/B7Yig7zoB+bgRke+smXE9ym33GRQTVVi1MF8gUHtL1VdQ1/VHy6ONOGd1w
         DmU9tzFhf59TxdoLltCW9G5nR0IDBPaHqPn5c70zIM01DWA+qq231NAQoRt84rpmj8Dl
         Z0xuD/qcko1enCikAthg5jm2RRZHV3FmRgyWrpLdq0PrA26Lg5F5fsLXeS3l4a//c6l1
         Nrvws0CkWN6MJ9Og0a5XDSBeKoEVwZOUFU4P2iL6NGOOHz7xL4eYaVUivvVIxF7EpMtD
         g+z199IasAVhOJSctJ3SzL23jafRrZg2OYgaqBU5O+SD5wko0uyV8ARPUBk2zLAEa6VV
         yisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749799008; x=1750403808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fv69bovuvm+Pb08hvzVs40FNmn1nR1es7GqKP5snc4=;
        b=jwu03IWGz8dDKy8P8Q0k5w+sicvY+Jv3AibXJgm8EFR9TtyXIEw6d4LPNQWMEV8D9N
         BOuZW2YAxBHgQ9eB1K4Lc248zdaPv4SFS5m2i254HVk1BGQDAJgTjU3Pr6uP/WVX9rSJ
         taeCjI2ru8mpx05P5a4CpeJ4KFOGpBfDfr5VOkwaLQ6SwdC317KsbjjGm1i9wHZyB8Il
         7gDX6Cqlc4Mp7wvB8OVe/HD9SlpM+TBEFqeSGsnNzzX5ZXDxSrEduGI9ob1tH8Lyauyn
         I8YabHqt7h6tiwx3f8fVF07COCbHT77C3LljQH7EevHwc5N7N8KjbGR5arlVfeRZ7hCy
         hmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXVFOiKJcnM8bIWH0gIcUnqugFxbLNs+HLEpCcbKXayS5Op6mxOeSaAq24p7VdBiLCKu1U5u2UbsN8sHj92oU1@lists.infradead.org
X-Gm-Message-State: AOJu0YzZUN3Sfl4B887mMAFUTTNT49f3yNroktl5xFARkFHiGJTFy2nP
	K0+UGe6d4l5CpeNcFL6fm7YpcSxeCuR2PANBwJddHnnpUoF5NrAyFHYs0NOutUs2MTo=
X-Gm-Gg: ASbGncvxb9JLevdeQffscl+i6UmO5uAIVvhyXntbcWEBce1blSiMS4y/OrSX6yfXrlo
	2Q7jkFSKdgJPrekjdueXwAuKEgf8lNE/H7d9SCN6XrWnJ+CN2plT46keR0mE4pNRkih51naoDqE
	N0iuTQYkTNoeJkBu/LH90n/RmxzbovtgJiWDxnmnTPTcWKdPw5ev86DZS7Q1wlRXHohGT2isTX2
	t+DpJ5kAZ+FVbNPBlOou6youfSLxZRY9xsJU5mn7B0l4neUsRbqg2Syldk1npTu0g7MLX1LVmHE
	ajkGg9PsWleEqhwYxgkh+VSDnBeqfTJp+IGa8DhXha4AuHK+N2/TUvmaat1Ev0Qla7wbgyCYcw=
	=
X-Google-Smtp-Source: AGHT+IEouw2NsfDahsieU/ds8sAFUKZF8nkQYwWmiRsIPTzuT+5LOlyePYyXZlerd2b78gEPXxyFXA==
X-Received: by 2002:a05:6000:310e:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a5686b97f1mr502671f8f.8.1749799008387;
        Fri, 13 Jun 2025 00:16:48 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25e89fsm41966305e9.33.2025.06.13.00.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] cpufreq: brcmstb-avs: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:44 +0200
Message-ID: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ikGB3PaPKDJ3MFxbiuFsbOiaKxZREXTcoX44pbpvZpM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BbtykD5yvYSc3IHLEdjE6QZ5fdc7hdJcQrQ
 XkjcMUBVBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQWwAKCRDBN2bmhouD
 1wyTD/4tuGyG5NOtPnE74wIMfUoYOtAeELKZqjvXWwUylioml49Ac0Qh6ZwPIaOu6U7ixm1CaLX
 cvHcPSpQYap42DayHLhB2urDzc+vx/ZVB5gOf9anqtvnNYoozDRjA8bCA2tXM345DT6pjpMNMpn
 yUtCamRrvJftoe0NPeSghpF/Md58mdCQohDIjUwLwMPdFqMFk33KBSrExBgRauwS+RHh/ftdx7o
 jJBk160pZbXfVhozDuUe4Lf6ldoDXrbIBKIYkHm6v5T2y5hrRn0QyerlUf7tQVPfTcjYpe5wV1w
 PAj+YEWvQ2lA/8hSqsYkjddLpbv/AEVYCK7JhEn6rrbYpKKBs0eB+fyrTq2BSH1N0pjReG7zjEi
 S8jap4jOZ07USJi1POvO9icL5K4I4VKfCaG5Ej4g4nl40AkOkdoZy7B/vP3YDv5wJd9HwB1V0cY
 hajKRVpx4s6zPVO6wUHcbuuXXh9ZrkExPtQ7BrdQGCAeIemdgWO3jM6VQ0DD0Fhl0yYpjnY9I9E
 2wNuPMjx7pzqVMRaMD4KyaOFu9L1tjzgaJThhaFI2KdshNVZs06kT0ImV/2RTSi7KK3mZSvJJoI
 jByr8SOdPhXJOwQKfCO23j8GkJ2o0cVlP6WPS+c3ji0LqqPcPTwUkgpEmk0OXDPLLLizpwUHRsy IcqefU8bvrtJjYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_001649_953325_9F363F25 
X-CRM114-Status: GOOD (  13.68  )
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

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 7b841a086acc..5940d262374f 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -765,7 +765,7 @@ static void brcm_avs_cpufreq_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id brcm_avs_cpufreq_match[] = {
-	{ .compatible = BRCM_AVS_CPU_DATA },
+	{ .compatible = "brcm,avs-cpu-data-mem" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, brcm_avs_cpufreq_match);
-- 
2.45.2


