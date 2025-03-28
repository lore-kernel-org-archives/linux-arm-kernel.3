Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E66C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=; b=0KJeq0R7o1NYtLbt1j0z3pKeN8
	U2A55/lNH51KOig8AKZPo2J+I28sn6O3mSE5k3Rm+fS9PUIZR+r1fJhtDQsiVm/ZlQeOWAgl/X6u/
	c/z1qtnyMz7blKe9sD4QFJBlxfIYqKTJ0sqOBljwOtmOALccx/Nn+VMl1QrJesclX46tkk1Ir0mJn
	3YBYLqQhEOUm2zQUSY6eQu7+Cs2jpVLGReimhBVIqFwsw/D9sXjcuFTzrnA23qYmDhIsM9I8Xo6WO
	CHnM6JsAJW8ap/hT7KLUPIOfmf4ROli5yhLDoVIuaMG66GRR4HetBE+plASiUbEVuDYNcoOsHxLiu
	DTuVpVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAi4-0000000DbNC-2yZP;
	Fri, 28 Mar 2025 14:29:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nk-0000000DQoa-38fO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4139195a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=ybZ46NYA9xNAX0CkIAe/cs70XO76uk625sBrN3b1Ix/thjbp9zdBiK3585gwweCDcq
         ECfRQpBYasRFPvO7/fwZQ9N3MzH+2ddNCW4dJs/ffljZ6NHFBvVuA0f5Om/Urbvs3JKa
         8qqJSwiiDmsJ8Qk6rtvDVz5PcdRIK/JdgFSsBzKzslOj8znGsJfFUBuQKnrrylZ0HVFQ
         Qk0qnKd0wWJ+HFQss9558HPIpQql4slwy8w8F62JICBN37/EGaroLljHJKo9fMiBHNQj
         Tmtcn6twQMmzAhWcABwmX63Gk2KhLTUE3gNRXmM46e6bxSTXSoVHgxS0E3MpFBCvJLpE
         lU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=l0tKS6R9WeIJJH6oWBDjuPteoMl3Fs9hw7CKAGvJnJV4qXx+5C7IJAR7bRgW2m8LnZ
         /pIrnPTK3+lPYKdP7igzFNCilqdwvqclEWHw+bp04FTMbZLFHLTql2I0dN80zmwuz366
         TXrcGOGpEi9Ey1GqpL80dTG1nUFTkXGNa48PeMxX//fdBSWwyFuzmGHRwbqoCn5kWnPB
         1mavqlTSnqlKIHAGY3PGFaOv2Ik77hTy/U2zlKqpHOc7zgf8n1nBI3h6SnIHsaioaZO+
         cqKKL9NPkNz629AP9IvwMCSxYOOhOaQ0o/H/FWtHM29ZLv2+VprdNMRMqcfKSYLPW2YE
         GSjA==
X-Forwarded-Encrypted: i=1; AJvYcCUdKdBzixxLEw5ssTvHUd96ISp8uu+9YzOGPx+GawkiVnM5uPgW9QmoiYI02KjsBBuCRQCekwhAYLolp9W0GgY3@lists.infradead.org
X-Gm-Message-State: AOJu0YyMUutCrMEDHMV7mpZOjfK3NlnAsE/qUUEUFxAYaoq/lMXOFZcP
	rlR6/CLWjFYQA9uEUJ67DQTNLhsTM3A4nT1swXevULa6wr0slqNEze9S0rhXhJg=
X-Gm-Gg: ASbGncuQvuXD2kVCH2p2jyqBKtaK2+jJm11jXX2f2pK6O1F0zCkR4DRLFMw+UBqku2e
	5En5bU7G1pWvWlrTSivFtK66E6N/1WsTCzcKbOHmCwyDiRREHja2laVpmqtLnMjXiIZtVBzcplK
	uQlHRzZYGFEGU8rLeQCAG9I4zLkmjniRTRDmDBCJLcBBE8HlImuMxjl48pc2fs11DYSPwMO0QGq
	PGRTb600JfFQ4avNo1V3Fp9zoiQXkM+4ckEHOmwBbnELtLibyzGqGlk3Fg9I6lLvTygmK5P4ifN
	DQkgMbTzWl+gryOiiQE7uYbBSDt6ipvsn9y2VC9CDjMaYqYvc8GMxAmKjWlgIZuVrkxV0aB86CQ
	ZWgS2Xp7nqDK5cBAYDXRVYoYY/Lft
X-Google-Smtp-Source: AGHT+IFcXivfke8CF3Ua6fUT95VkCgqgOsG78wJbvWFT6tJJvWhz2bwcboGbcdFVisEshC8NwxZTJA==
X-Received: by 2002:a05:6402:2547:b0:5ed:3228:cfee with SMTP id 4fb4d7f45d1cf-5ed8be108a2mr7864450a12.0.1743168671175;
        Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:18 +0000
Subject: [PATCH v2 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-32-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063112_784800_E124C40F 
X-CRM114-Status: GOOD (  10.61  )
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
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog


