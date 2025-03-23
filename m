Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B16FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=; b=YHy0thud8Pq3sE9LIoH1hgD0c3
	Z1owIn4WOiemC9cq8nomItg8U+xCIJQQ1+W6EzXBjumkrgxNL+ryhzWK52OtOmv1zY6BsETdGeoqV
	094SFOz9vrGx3KakhSlm5zDdqM3U7NvCjW1+Z9N8EJ2q6ipSz0T/Q+Kuminm3sgRCD9/uCTH/m+o0
	pjIsZUpCGLLVtKaRcs3M9gOeFvXLTM4XflHbs5sokdkX7qycESQ63KQUamypjT6w/dUunW/dnFlWw
	PXXxXvOHlRoCvOojTYbLxbu1e6MVw2eR1q+c797oF3y3eu7HHnJcOyjjRLtk6jclE+W17ppiIPwb+
	EVCHhMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUlI-00000001uQ7-0i7T;
	Sun, 23 Mar 2025 23:29:48 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyo-00000001pDU-2bOl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac34257295dso794869066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769581; x=1743374381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=AYuATIIU28ZqlqcneUgCltqpWXLBTL86ifbq/2f1pPaAIQwt0nqaO4lMktqsByN6M/
         gn4N843ByVP5/lxNukwf166um7xNl8+COMuXjtx5APBbRKi8TDwInrkYFGqVA/kj0tPx
         q59hKY7HwF26xjGSS74hop+TyvVUeg4Ueahj3qe4E3XQeGOWRpIUNms+IhhtwnjZlmVO
         N+gNs8kR1i2FSGEMsBa5FuZqr7QfZfpJjxvRwCkQcgVMazfOIOsD1kT2XAcG6/gnNfe9
         nuzA5MTk9b2Dl4mgs5MYutO/tHA7UfjQbogq5uVhe3imyrZ/QDb2FOLeifcgXVTVckRV
         GGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769581; x=1743374381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=TaWAVSWIQwd1XDudLH+PGGOX8ogM0se/ftW0zg/wN+aDt20IhE9KLvI9mLQopTUO2O
         q3w2jEggZPPH5RxPsBbUW8J+kK/TQG04SQmiZ2I2KOaubMlXCWdTkZSkrUPaO00rpSy2
         X0v1wpfWSBiDlUi4LuA7M7DjQPMByQ8hqZpOOZxvmKmvgiFjFHMN/9XmLMEEHp9wCT8F
         zDT+lBHB8ox2e6UJEMlS3n1F/Cfsg/PSDK5WMTXErAnB6k9EeVOcQh4WywjKLtKYdLsB
         gdd2OkeWxuo7GpWNKLU5E287eelq4NJYpdbiDHyii04AIT2LpeFuc3wXczCd5DBJMEV/
         FzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVIRRt2PbdsYsWS290uDqCeuRD/cUNjAMPFT61bfVry2gyyA/QcaThfeqHxxqksz/RT4EngT4KRgxTS+yljWGB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9JQPtb2a0eeIngQS5VzlaeNhfnqvLAO1J0SBDTdHcYMZ/hHtO
	TiSHDAKkAuBWJ2BCeuQO62CM0QtN9hgXg2shmnXzu0PZDiynobcSVlv6OfJrU2E=
X-Gm-Gg: ASbGncsSdThahxDv8dF4/rM1OWY9aspupxPfK7YEjYi5zcYuoMaYcCHEwxfUVOtJGeI
	76DBZTS1GwlmmM0ZHZVUJtS0Gq6F2nNXc2/NMzNSIzuWP2N4uoYq89LBa5Dz20mGTpC09ka9jYM
	yJLDtQiVi4yDkHe684pFQ5zymudE3qutX22o0rP+rzQSPhUJwBct83vs2JFSzA/lWpnPKbhuL5f
	hPUdXSbJst5GTndyh7sFnwmGmMqQMRRhwpDKjy72gmxsn9VX4HktvWvxhrmeOALOVipZGcYoAqL
	qA86sF90+P4jWZpp/BCzBe8WLSjyJJqWfAWtgI1X8oNmVgOkbkzcS+CkhOYV49lY3X62XdCY5P3
	hCRpIHMnfEguypW/rTqLC+j5apkXo
X-Google-Smtp-Source: AGHT+IHUwVqfRBATiENga8y2WvKZVKOrHZpSBd488/sJ0QhrasF7WRCnvzn1JwM0TwTxkLrFTUS5Nw==
X-Received: by 2002:a17:907:1c21:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac3f226757amr805060366b.15.1742769581299;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:46 +0000
Subject: [PATCH 30/34] rtc: s5m: fix a typo: peding -> pending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-30-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153942_665205_0B208F2A 
X-CRM114-Status: GOOD (  11.01  )
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
2.49.0.395.g12beb8f557-goog


