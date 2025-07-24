Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768C7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t+kxQ7dPGtocO2eml/1QU47n2YVx1Ic6Vfv+oiY3pc=; b=vot2D5KvJlxFtLpI6SsC/BtWR9
	56ys1rwGkS/t6ioXshvW/raezDqQfFbdGN0ofAL0AXU6lOWWDT0wb//OnBO6yRMunYrVGIqAnTKKG
	QHAHoE3sFmYc10N1LiTFlGRpkG1TK0UeE4TBsKmq+NLnL7Ei3rd4+nt3czHN1x+IH2BUoTN/At+vc
	4jnAjdiI3tDDpTVZQ+gLpgNdUfTEdfNVT4iVtiKeue+NDJcZscn4gBXBeCDmptfmPQa/ZI1PGrUwb
	pohzM3xPwFtvwhk22HrsfOqfULF4HqAmCDzIESJyp67Cdv46p5pOxmEp8E7AKHo1RDpTBrRqgp/zl
	67wcLJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrQ-00000007r8H-0zKZ;
	Thu, 24 Jul 2025 15:27:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR0-00000007enr-189A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso10930465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365393; x=1753970193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t+kxQ7dPGtocO2eml/1QU47n2YVx1Ic6Vfv+oiY3pc=;
        b=c/K5nRFqL4OA3iJiiMjZHp4LJCpJioS/6g8FZoKzO9u3xYxEVyq/EKaVVTh+mo+Fp1
         JC/EYa4hqZmIGlK9aY7urwz5TWZUWOziOsqBBc72H0WCHyV1jzvBRl1xa36xAKKUeAY5
         fOXocx+X4i0JoUUjy1PTAPJzYFHA9fondiW2Etc5LH2ohRgXuTjOouf3eBqr4+qVngV5
         DLDLW/GFoLLCjjnuvdVzeM/i79aYsyoOJjfwrocTUOt3pSZQqhxkpWvzGEhMmlDRUN1o
         Kk25BQ3eutiVIg1+SPqIGantcLkD7hZasDpsz1ypxVVgzIMKjHhmEN+WniSOsbJA7dGp
         INtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365393; x=1753970193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t+kxQ7dPGtocO2eml/1QU47n2YVx1Ic6Vfv+oiY3pc=;
        b=t3Z4LQCZybscvj1h3pUdHSxlffO67CzCQszmJkcAR85ci2bOxOq0jneUfVcZv4Y+Ef
         ALu+dcDdqdyQFp5fzFbZqgxsYP6/O74HaACjf+nCQD+e4NrcUqbJrYrOF2caYrVtsFF8
         SvLXMMVSHeqbCmckY9Wf+yn0V8GcXvZUmEo6yrSRriZGftIF0sMjM8Z8mkwAScOMhnNT
         7HGlnnj/bLIAzXPyivIHaHZfNgHTZc+9lNkgE7vKPcMYoItOr4Pya0NLJdJPtFPI3DsP
         06ewTiWd6FPHa1bpArrkw/sVIeTkJUiqQNnFeYZyU5J+/CUOxoPy+mB8yTRJP1aON/i5
         /heg==
X-Gm-Message-State: AOJu0YwU0ub/onoVy06tmdZzS/AQtVo0Mspg5i1r4ROK4RFaa1QkWN+L
	02u1MK/Hes/MfG3+xlSNMus+LVjkRGt3ELLlO2zo+2EWHv4b9u1YhggCAR/Y1254qG0=
X-Gm-Gg: ASbGncvZ5qI1CDyBOGCaXdiLqAigx9EXMDmW7vidL1GVGA0kh8Tb7mr9BGJEOYLPW+w
	Gf/2is3sNc5irJmuAmeP6DSZRe+Gioox5IjyaAqGobvANuq4ichRas5964YJ7qLCWY/ToDLm0XM
	bABI8+XvtUbulVas1SlphMfBpfsUBM4/q8n07nEl0kOb+6hD+OJh/DtKOXcJww0cNQZZeJtngLD
	e9cSyMOUhReNhi9e6Q+Y3ocQTVFINsW/KpgzKIM8oyygS/Bxf5266P7oZEnZZEnPJNG9FJJYI6y
	1sNvDv4D6V3BncQN7h6aWIO7+01aK3NIdKHfAnGBz0vYUS8+VtIWPOVpD/2BKS76KuEd2JX0tUv
	VpOmV3U5S5dFaYJUu0scJlpuF8LweFi/fXGAQ0EUfBQyO6ZXWJukXpGavdO1arM6lZKzyZTwXuo
	5Cboh2iJywG/V+Qlsu0f6G9ZA=
X-Google-Smtp-Source: AGHT+IFgnp7J9pcZF45aCSKJ4GVrrhV0572AUoK1dVlyY1LCSR/mU9Z7mKYUQBRdiPhCDw14ZigOTA==
X-Received: by 2002:a05:600c:a0c:b0:456:19be:5cc with SMTP id 5b1f17b1804b1-45868ca72d1mr74457525e9.14.1753365392991;
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 12/29] timers: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:55 +0300
Message-ID: <20250724135512.518487-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065634_303128_ED3163AB 
X-CRM114-Status: UNSURE (   9.55  )
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

Annotate vital static information into kmemdump:
 - jiffies_64

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/time/timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..a5698e3ace2d 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,7 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
-
+KMEMDUMP_VAR_CORE(jiffies_64, sizeof(jiffies_64));
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
  * LVL_SIZE buckets. Each level is driven by its own clock and therefore each
-- 
2.43.0


