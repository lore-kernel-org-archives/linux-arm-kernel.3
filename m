Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=; b=BIYEWP4gC67na0IfRcDIFf0ui4
	7lKXzb15l47ZA4IJ/rPSg91QlzyRog7A6pRfyarXhJx0qoLur5EgCfDupu4IPtI+bBz23dcmRfF2v
	xhdsxXLvuJVL+yTjVw6tfCLoGBy1pmeFkGodmZxIRUByyrwEOKkbsks8fE7PAxcFt2AhzuHgl0Ua7
	oiN9AEPmPmP9SUumMpXUYeU5EkNVu3erTernJITqwEI56QBK+ymOOZcGeIFyHOx2zz08gG+WA1sO8
	px/+68aIRxdwokGJCPxblmqlgxkF7Lo1LDRz2eIYKjeePvGIFal3/WAZW6YTCKDtqNT00rhjqVP4w
	3AkyYNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HC7-00000008S60-0p0e;
	Thu, 03 Apr 2025 09:49:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPu-00000008Jpk-44aU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so1271128a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670757; x=1744275557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=GNnhq0rNtIpT3ZkyzUJ6l6rUSSJ1I9Wr6HdfRC3cMEYlRdxVjRBuUfFBVqXpU/17hT
         DbuJ3C58W5IOqr7rYd1OkvN80kjT1Py3CV4qNoXkD/5dlVE1c1lubEaFHnGMbgYVchYL
         3jjrufRdz0ikuzE0VidIkFrW7QbFR+KHCqBF0tcrNgUfBlLOQrgjHGfbFydNg7q1Ay7n
         bOl3fd1Z1LHa4lM13kgG5xraLOSUsiTqqnJ4WvqAAAALbLB/aKoGYaFY5EcrAEOwJpiT
         8AI/gnNsin12ZVHXKsQz2n8am/SWnvqF9UxoLZ95QkdPNjwrK7PfzdFuXHIZdH0ItNXk
         e/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670757; x=1744275557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=eTRF4DXn4TTfRPevuAyXqTjzWK89NUX4IdyIznJatxDhXaUWVXw732Q+z8+aaQg9TL
         X44J+fpzPdVggRXGYQH6v2tqSIHh6El2k+JJohjDj7muHcZMXJKUdl+JxlMusk2GG0e+
         18pZVgvLLIKAnIjix5nR57grl6spBuV5kiB20mRkHQZ3jkDN2zIIJ9a58Obnu3U18Oc1
         erza4bRf1y6UixDTjl4G2GYejvem0QfnI36j2jGeUWqOTZHv/3A6GQtXobIQY9hVH4gY
         Gv7D98xmhxctpJgiuKURr0S3IV4Ew6jCEcpam9g0c4IkM+3GxlN6m8QaphQSh2meM5k3
         kcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV8ifb/eOMWE0qdE4xaJ0x1/dh9WfVw6a7EoooeSBxxUjnXl4/nU6RWLgFLkMKXtfOp2p47CPyto87pOU8rrj0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwf2VppCn9RROebJ6HmHWySWr28ZW125MSTsby3EU6XJmXQ1d0
	6Y7aQE/Sn/NOVWLjh0qcOwA2py+Rmzzr62Iw/NGEkUzlC09nQmRQ2YCy9QF93rM=
X-Gm-Gg: ASbGnctVL8KQSDWWUullZW5s4XRQzLderluI0zI8odhuPSpaMcwdHAEiaiOEw5XqjxB
	zEvfc/V7G6qmUb4Lx3SgeJeQMwS8XbqBRXGgLrnmBokNHkFrmyl5HskxOVgEpbpK2Fm6TOMSYnM
	H2qcH5eg0CL1/u+wySwiWDtVTJfhXxyrTIKAVYW4j6+99S1Ux0sM4NWa7fLy6q4+e9t30Jj6ZEk
	J/AT5C7DAwicNpnh/XUjFsJqIIW/bc+Q7GeOkcXpOz/2zq8/wqT8yKyvetQMixJqR90MV/QfS/F
	m+9pNrcDm3Fz91OXJtJ7X532XogAbIG/oIt+0VPduJOjX9vZrmw5MhXh4q1bF/9XayWopxhNrfu
	ZvHywWtEJIz1DDFOpCdhqyjqGbwF3
X-Google-Smtp-Source: AGHT+IHsXg/hWI5W6L2JAbs5tQ+hU9M5VZLzhEtJEwJ8sjShCEtp9J7Km89nFH/JtsSi3gQsvsWdtA==
X-Received: by 2002:a05:6402:5114:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5f09300645cmr1255191a12.10.1743670757293;
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:20 +0100
Subject: [PATCH v3 28/32] rtc: s5m: fix a typo: peding -> pending
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-28-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015919_025756_E4193EC7 
X-CRM114-Status: GOOD (  11.44  )
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


