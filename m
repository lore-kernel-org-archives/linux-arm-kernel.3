Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=; b=iPS/LEglQpnWk6D5BNVdd4OhIw
	K6TqcCJdL3um17MiRwBLvhuyT6gISgWXdR9E3qCJs+IB05rjMR6syMc4YWP70jomK/OgH4cQf9+Nz
	Ghs1cacTMBeoSo37DTVcVWUZHUQzQcySw+8Eao1JwXHNSDMOBmmwj9Zqyz9rX/whM64ROVc8i3Kic
	LcwaN6DrvE/OFOnScl4wTgN2w+kFrWz9RcHw/b6+56fEnynWHQUOVzKH3YzrVA3GAPbjkPh4hUvou
	SmkDHUjMjeNSXAOBEBY47PaYeaz7f1PtxpbZtZJxePqWvRxFliGmZFpiIl+qYj1O8k1DGcV4FdxdL
	J/mRmiyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAZV-0000000DZmw-08hT;
	Fri, 28 Mar 2025 14:20:33 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9ni-0000000DQn6-2qZS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so312212a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168669; x=1743773469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=T3nKhZpi5gymUdBzSJDwOMnYO4B/PjGAEpZvL25WXDathmjWTj/UnFS0eefKzxP64q
         5hIuB9xhtqQzYv84c/q2IM2Xrpvaj2VIR4GVhsgBoLB1TmOab6uT+Fi4pG7L3lU23rdE
         bbEzKKs1LGxMdmlLQNvuKcIp9SwOC3nJ0hus+VkXDcF6YoiL+6tsNPFYY1ExQROMapwG
         WJoRK6O8KUyV6f/ZL4PZdZv3wTLt44DhmBWjmX1xD1lUl081JNkQGupQzEYpQ1w93991
         pK0QCRXFmdmmIDyh6R7vWdQItAImipiY2I1+8i7LQ1AomANj2Pv41ZJwQus+jZC21Fse
         hC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168669; x=1743773469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=EEavJuz+ePCN9Vv9OI1jaLbIggTCUTOWclr84Ln+UQzlh5fYZ1bcYecrBMuPdZSFwe
         z56CHf/AxZCeRT/pmldtAjV7NR7lIYjzYe4GbZ0ItmngO3RsYoLPKZ1MB/f+Ug42dXiM
         BOk39TcDlOdsBfPwcNaw4YTOilCSzoYCOTVNHCjHP64QxqbaylMfT+HjavSebzQejbFj
         tcZlsNcrU+T76znul/SM8acI/psM3Vmy3gdiAyrwBT/QhbcUGk84wb8tJ3YBfyiFQ+FK
         MaTlIaeFB+viy7oAX4cgmGU2v+HRZKzku/c1g/ndXgD1mRyNZgqr6nlOAvKBU1V+yDDW
         aeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZJOn4bJBI2O4RoKV2ikzF1JBVybTYgvAOZclGhQvs89NWwU8ppLpcJvVdBsXktVX17KeHZyTLPLr78pqKvhtn@lists.infradead.org
X-Gm-Message-State: AOJu0Yygb477sGgFuxVJhEOthqA16+nrA/zZF0JldScyA3hxpd87q9eB
	Pfc6LkZmxYXDPjHX6hNM2VKaKGimu1bUDpg4CE7zAAnvH7dbRLp9L6vwSVELVwI=
X-Gm-Gg: ASbGncsfUAEGI8+UgXeAmp2JUOZcsAaV3nVCBvhIFp6USVFfvE7sq9vaQvvbhVYpUTF
	6Wo5LehM4wurzbvw7BeQayRpKSChkP67ag/Qg3Hi+Ylcl2YzlY9mCFnKRF1BnMXruOuY+9M8dVi
	IkG3ZrsHpU6Weav9+uv/z2eG9SiCnYfPLqCwBNME/7xgJHTlVUaD7LvAe9TzH+cGL9OmV4vxvuc
	olSBflJpm3JAdRO9IGjGjvE866StSL0tvjrMb4498uHgTtcHiK2vYhi8z9sW7INRfvR0m2iw2Db
	ThGcOowTGySQT9rXziKuFnWVn296b/nc17kaJWRsduSZWJUZ0RkUhKgX1+Mi7psICs5AmQftuKe
	M3L/vxwm2ZRcibMqs5OGnMiONn+38
X-Google-Smtp-Source: AGHT+IGPOuJOhetnhPLDwYjmYCFkw94wWYnGaOGbWSLs66EXrE/s58NfpYkGGvWXaz4pE2WTKd2LXg==
X-Received: by 2002:a05:6402:40cc:b0:5ec:c7e4:b6ee with SMTP id 4fb4d7f45d1cf-5ed8ed2ff84mr7735639a12.27.1743168669063;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:14 +0000
Subject: [PATCH v2 28/32] rtc: s5m: fix a typo: peding -> pending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-28-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063110_716237_8E859BAE 
X-CRM114-Status: GOOD (  11.34  )
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

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.472.ge94155a9ec-goog


