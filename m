Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=; b=ghd3MHGsXcZJmUUXNuu1MRiZNZ
	jUujKGGKeVtVJMqB7IB7qbNyZNDOko1oQENP+O5Z/di5w3VeoJSlgFY6F8wtUhOYqz6c7nQildv4k
	fWfNpxBYSK3YHCJtcTt/GsxFidmjNuRAydEZyOHO32/jQR9udVg6huudBDSpoIhJ695lkf3hiyqYo
	hptUd49UaV/ft+7ip3tacugzRqC5UEBiHsEZbRqKwQZ1lN6qTeL9odPsoLUYt3D41JENnsq6sOTEj
	Wl891O/7kFj9H1itadK1hl1if2sVas/YOMEYb6Jo/S/4m7Ns8+9jQvrWezbFo1agZcpPVQz7B5aLl
	rTwNQLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2d0m-00000008app-11jd;
	Wed, 09 Apr 2025 21:31:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB7-00000008SiZ-2nyX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so177074a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=QFfgihD6Ufy/zk6I5IHARzEpKwurvU341kBaEXyUXC9+nE+2qUuIYvi4WYUj9GvOK2
         8UalWkWLw15XQdY/qHiV4+yMoL5Aq2PsZDOKS0aKizAlHe1ZELNw9uk82x6IsukLcWy0
         OdYykwJB5IqHnxubYUlzzh6VmAkZ5xkp9mQLrQZ404PgjyFZ82RamvZMmkpAS4J/sl3L
         iLLoFVRz+0rdq7juCuAtXSAQEYonobH3T700iyhTuEdTw5EtkhBJOHAQ9uOCdHMOXQzG
         NwlkDPxpjspDOe6LkwJ7opTHwAktF65T8DbZLcB8jQRlztwAS2dwd8muiFEtWVhiFwO4
         KwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=hYfXJwRT8LNWHF4/YT+1QkRMxIx9U629HA1ZLzZnZjxf06q/YLkVk+sUtyxjGue6g8
         /uMSRejTm6oPj25C0tqDadDxZlslVGkNl4ctQpqsv9eYkk/r+GXDR3GgsphfXSrmlqEx
         G0965bHTOQU9DzypuEHF0+f/PAJyx23YNVhzu4HDyHjT2domInEwWsjfmwRROFflAGFu
         PK4Vu/QQTDbhD4HVU6Reizr1ojpTzP72aySAqgJj3KB4sOzLmmfQZg0vCRy/yMc1ywsL
         CX66KTEGdp2YDvGT0DhoEzLL08eqV4G2I17/6hCgTeSf8hyYk+jBYczHmPgcDq5Gwfzk
         VpEA==
X-Forwarded-Encrypted: i=1; AJvYcCUALjsTimkfhoDryM/fnmLzGs4i+3W9YjEvpWCfLy7cJw0oehcSaMh0NiU8NnAxIGuHvLpfCATKQcoZdI3GsLLW@lists.infradead.org
X-Gm-Message-State: AOJu0YwSb3TDGEFn1eGEHbPvGFbIebiMBzQYeKAdR9crrN4ekwwoYQjL
	AmIwo5fgcpq6s0dnAeJTsz4XPaURrgq1sVdkVeW/CrzHnrPKOGQKeiT/DM1GEtI=
X-Gm-Gg: ASbGncu4DlxiKWoEBgDV/wsi2XzV/o8hEzvvz2qZvKWBUcEOoLTaK7eFojruynigWdi
	DYe0LsTGK+eExlt0evp/f8EmOHKsYTyYQITZb/I6mWQ3VVakF2VZtDkJgGgQgkEfi4Q+EwSGfGr
	yCkuLEm1aklWXu97w0pE/nDbLp1z/Xzl4c1OvH4bbYWxUbhVhVV7pw1rXU3gAGjP+LblcOTlXZo
	2sXXQWOhb9PxON1P9NXaF/rdCwP9QCmbQbgJJ401qfzzz3GWZxrF4dHHMYHWwprxGhS3PHTsYce
	/GfFy+psU4OWeWAXUBw7hxDuFENPBdyqbpg2DCRYgEncyIjaeao8awdBnSDXP92RRKdUYLVSTv8
	0Wn0sznJRa7GcUok/dqgXGXQ5uSfUmbiW3qBD1Q==
X-Google-Smtp-Source: AGHT+IG1YTLblK2ZacnQ+muHHFTtW2fsPo4+YsM4khlJQ2EKJXJA7UZyAbkh8L9PKTjc8rDv/I4VCQ==
X-Received: by 2002:a17:907:7da3:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acabd126d26mr9987066b.4.1744231063960;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:49 +0100
Subject: [PATCH v4 28/32] rtc: s5m: fix a typo: peding -> pending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-28-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133745_709284_1BF921DB 
X-CRM114-Status: GOOD (  11.25  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c6394faaee860427e8b84e9c6df2d8229cf06d93..095b090ec3949e0e8074cc344105daa00b795245 100644
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
2.49.0.604.gff1f9ca942-goog


