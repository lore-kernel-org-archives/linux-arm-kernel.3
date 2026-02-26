Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25BAFCE078
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RPnwn7qk3luW4iML714eLyIf29N08tbW9a1oS6Qc5EU=; b=V06m8hcuPE3IqU
	qvfvbr4ZCS8K7Z9r8HaNLI4WbPHcMMixV8gM0nikqGTsMORh6Okr3WeWuuYWePynvYN+uET5Ook1u
	xYjRRrrmZT18HJTmFEPPkxlViQJfbqEAEtIFQX2r1kvHQioIf+3fJRpYkWM8oWod/3fsIrg/wL1M6
	MVY1ZvGpMPhlNxhvTvxL1pdelSA9jcLD2X0QsvXRK2CGdFBHWlP1LyWQrjChUglZbebcjcxpmv21v
	sG6z8AWwqISLRrisbpTf7cKaV+2aIffpIey1GoJocR15x5zXFdxhLjp1LXzV8OyR6jdE+Bkpa4ki9
	LWP+gFGuTk+VepGAu7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb9Y-00000006BHO-3UnO;
	Thu, 26 Feb 2026 13:11:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb9V-00000006BGN-3YEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:11:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so10069645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772111495; x=1772716295; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPnwn7qk3luW4iML714eLyIf29N08tbW9a1oS6Qc5EU=;
        b=VARkLqv79SmzHCOe3Vpv13sO/QMGLND55+J/+GhnueeXfTsY2NS/xpal/rF21qP+4R
         96k3Dvod5Izot3swU3RniXquaktEiCTAE56yrB2aZadpNFdHwA2Ecr3qoUI2FIIoDZwa
         0luP1tJOL8KjW93y9047oW7Y0HnLmPjLwrXTgs+co5OWiZRZMNtyRmIvhUrfUnL3LcwB
         U7gBIZ6yMO6HHNoxfxhwEQoiwguiQpZcJPIeTzIPADru+5aue5/QA/IKqwVj/oQKVNQV
         AhSJh8GCoVQuhvNwqYkZAYpdZFtWiGC+FHIogz/DiA01a1o9uIUHijH41iSuZ+175R/k
         EMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111495; x=1772716295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPnwn7qk3luW4iML714eLyIf29N08tbW9a1oS6Qc5EU=;
        b=RT5xlkUxblqPYpPtmMVatGwaR2KR8xpiBUbKVQn8DC9b76zi+9ThBgHFItXtDjfhLG
         JdcdXHqTrPlk0Np4vvAuud1wRBcZA+TRNdYLveqiI+cRho6p5tUrWCeGHpTk4nIX4IGV
         d+TVJkB0RqPPuYUROCeC3ysuU52M0WGn9nsghJj4bQ8ut3jR7j6Cj2azbNMEZYWqGCuS
         pt9Z5QmQ+HSktmG1iPSXjZsLWuQHCmekVgKrIPle6UiaE/7VrHXnisIelE0OHo0LJw2b
         V9YiJs0jMwTLfeMxexpx19jTjosLk9GUQP4gTn7lx02cZ5kZ7Ll63FY5lgtpUl1gF4Qq
         mfYg==
X-Forwarded-Encrypted: i=1; AJvYcCX8oxGVWal9F0Mm/JBgPJEbiEb8n/dVEhvhdc8Pa/g7Wo0DoDvgPIJQCiJVRll4m459NKt9SZMZPZ+O/zT0QI59@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrgf7jNuqc4d4mmL2l/+2OjvX8I+WdGvgqdpy7UpCxKernstpq
	3eiOtJH+m9VZmyh764Y5Ck72QjnJZL3VYtrXH9Y2FRqYJgL5R75Zj7ot
X-Gm-Gg: ATEYQzxa7Gycctz+KWIbuLUl7UHPDAD75LLWL9ePqYh4SvFS+0qDu9r+jYDW2YQ0gWK
	9cBd+2ciYSeG8UwS/ITcYP0aajKxV3aqBiOJilEvH/XdYPhOaVUMjqiShVTxrQBj3pseYXd0oLs
	aMNR0uCqP3ac1G5KFzCTzB+mG92pgBcyhbBwUg3/kkmkzInCeXuLGk21+LLW5S/0y2kKAmkg9pt
	FlOk1alMV16vZaR+IX22JlAiNdcRLppz0iEvSJkqTOq39YRNiQz4NFfijTnNf2DNbWKP3hW47i4
	0bEMrfpjYXQpW7a8KiTlW3TBKLRP7q/YRNnPrDWwapUewVkNRSpf3TSmkyn/GlZAFre+21A8CWt
	s/6lt8DHdLxpDgBuGCyRzNLCFs/KI2a3gGbMMFfUpO2WSJc6x8kXEN6XB/4EpXE6UsCnwawBpx/
	/36fynV4Dv/4+quiS8wLed2gmUTyYw15a9vi5XxbnFtF4CHGAIh5jE
X-Received: by 2002:a05:600c:5250:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483c3db3180mr31418995e9.6.1772111495342;
        Thu, 26 Feb 2026 05:11:35 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm64827145e9.2.2026.02.26.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:11:34 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v4 0/2] i2c: pxa: fix I2C communication on Armada 3700
Date: Thu, 26 Feb 2026 14:11:26 +0100
Message-Id: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5GoGkC/4XNywrCQAwF0F+RWTuSSZ/jyv8QF+NMbAP2QVuLI
 v1304JY3HSXG25O3qqnjqlXx91bdTRyz00tId7vlC9dXZDmIFkhYAKJAc3odft0+sbPZfZNVT1
 q9m6QSx1RGshQFMCnSoy2Iyku/vkiueR+aLrX8m408/Yrmw15NBo0WbBZAOvAJKeicnw/SEvN8
 og/Ld/WUDTvYiSXmzx4+69FKw2zLS0SDRL09mpsmjpca9M0fQCKjgAFZgEAAA==
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_051137_906009_5DF5D22F 
X-CRM114-Status: GOOD (  12.93  )
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

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. The first patch in the series
fixes that regression. The second patch improves recovery to make it
more robust which helps to avoid communication problems with certain
SFP modules.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v4:
  - rebase on tip of i2c/i2c-host-fixes
  - collect Tested-by tags
  - Link to v3: https://lore.kernel.org/r/20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com

Changes in v3:
  - rebase on tip of i2c/for-current
  - remove Imre's tag from the cover letter, and replace his SoB tag to
    Reviewed-by in the individual patches
  - rework the second patch so it does not need changes in the I2C core code,
    and drop the first one as it is not needed now
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com

Changes in v2:
  - collect offered tags
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com

---
Gabor Juhos (2):
      i2c: pxa: defer reset on Armada 3700 when recovery is used
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)
---
base-commit: b4b4d88ebfbfd3aadb4c9a0f2bfe1abdbaf5822c
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


