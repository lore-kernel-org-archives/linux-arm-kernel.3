Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AEC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUrgUkOHTyOnDe6ndwQPZ7IvM7nkBad/sckqQo8qgw8=; b=Qe0A9IGftvBOzwBtVTb+LpYHS+
	Nt4eRqArQ8d8klv8kSU4jVVkWRYHPGay0LMKn7jvxBBgC6xZG31WDqf7M597wfdvGaw7rENicbWUm
	IFzdYjccsX8riHSUlg5taJOV7ce4nKfzlkjPRqoFqk/o6qE59/qMGX1P3gAL+HBYPyMt35izAEroA
	ncKvUMdpW65tZ4lBvoz6t1LxFBVHCPVFMbzVTc+8NHC+/P/cwmXEwqVHyEnLm0kS6jOG6OcY6Avba
	p2v1mjmMcGcK6D0rp0EN1L5nWlZCswhbb7puINZPaaO1eYmLQrTSfIupMVzeA4zJOtNEpQb7Ts94I
	Gukx/Kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPB2-00000007o2b-3lpp;
	Wed, 09 Jul 2025 07:25:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVk-00000007hCn-3hHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4673861f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043351; x=1752648151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUrgUkOHTyOnDe6ndwQPZ7IvM7nkBad/sckqQo8qgw8=;
        b=nSb2c4A4laBHjXRHERISjAg+ZxKqvdMh01PfTC/8CiuyQ/A+npTK0Na42oP2beKpV9
         SdWqr9Qm27pSnNbtlYjeRGaZsu/cYWGdoUYDjsFDNOojnJcu6EMkhObPWKWzHZZ4Ex0M
         pnkWFs2Uw1X9+kZhJfHk8bxFcfCD/wV/FTTqQJ3wanjEofCpfCTWJtvjf/aFLErPKy95
         K63lzYzQJuaAH7XjzeEo4A0gytcLpXh5fd6llAzTGiLYWAlYKL1lHUhmInSIJGx2gJEj
         +zMnSKEDCG3uOXPPl180zc82gICKrcNO0yajUBfMfMHZ9gtwyAxxxUTM3glcVK8wgL0H
         zN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043351; x=1752648151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUrgUkOHTyOnDe6ndwQPZ7IvM7nkBad/sckqQo8qgw8=;
        b=WKRuWG03CToe2HUzGkxns8MAGIVy7yx/NXlEYgUCfgEHMRGXgDF2RRjOKx3Ywe3N6+
         /R1EL6OBtbxPeHdTCZD3kgRn/s37qzRnuW29rhTF2tO2bTxuT/K2IBu4uEXCaAzFgz/J
         c/kdKkMhsV7QPZMBmKZrRYZsZ3ar8t9uGV/kEJolulxJ2fkbQEgJR1wYxHHV942H7syq
         OW/cN83povWoHCg3K6VPpirk4SdIGulMsMPQzyc06fRkS3vdVyq0/4nRdNVodWVTeCZ6
         VCLDHDYIqMIqqoUIrmOiNeCCOW6oTkzqMPYabwWykzjJIDl/nyPK8cPaTsqdEPNFDSDo
         /5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXsD7I5jz9yAHSL0/CEVdx9UH7ttF5KAhhShLoTcjbp5F5Mu9INxuL9MIE/hR4Vb7oMOjEtB4W8wldfZAsojVKb@lists.infradead.org
X-Gm-Message-State: AOJu0YzDJIjo3Vrmz1NAEiy9EWXC5mAhxyGbQmYbE3UhMgBc5Lad63jG
	4JXrVbl9AfUTA57+pkzRyplH4d7EmpfeNSkgwsMy+aFCJBbhiEN4Ozy3SfyFGSU5HrQ=
X-Gm-Gg: ASbGncumZn75B2YePVktWoxzoOEvLKvhdKjXhcdkhW/wyWuQ1Zeo5kGirw3yjR2dH6/
	f/MConR3aJCLJRouUdpik95P2YhMQ4Iyyk3a9Za+ucK/cpipX7qjmLMSygZn/GFNDwTcPJOoZJl
	H7aQ5cRsHjrFoURBXLxJQyHlbjxEbgR2d5ZJ0kFpvT9iVw5M3hFn2UxJvznaqqpcG9OOf5jC7NQ
	u8x3+FA5N+DkkrsFZqHYtnbHxwUoXgAH9Vz/U+Q0rF6pq6LC/lEv8TsjACrn1Nc1HbWDItwai2E
	f//hVaNgzz3VxMWnf3SNbtOgYX2FLFodH5O4jEvr+rHCFMHFVieJn4Gl
X-Google-Smtp-Source: AGHT+IEzSFe7nz0LVy96l6aCeTa6SGcfCDu8HOJfAJ1g24SiaRH5ftoCc2kEuJ1ZSbFiHDMmZGd5bQ==
X-Received: by 2002:a5d:5d09:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b5e4539694mr711424f8f.51.1752043351497;
        Tue, 08 Jul 2025 23:42:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:51 +0200
Subject: [PATCH 14/19] gpio: xtensa: remove unneeded .set() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-14-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Qek07sXB/VWHFFd/Pd2GDtyCQUKPAvQ65Za1xgZnGxc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9DZWbVhAOoLSv6rDoZUPM3EtQkiANX6u7uB
 E89Yrm3x7SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQwAKCRARpy6gFHHX
 coEsEACfHdA2HRf+Kt4GEMSKy9oDBI2nKh8kVKwaZg53fNd8Qqr/n83SqIapZgxvWklRUxhPUhA
 PsUUZOmkRw5hAohTpOPhu8iCsAqtqGqnHiuREjgPGhfKwbor7ZkWDIrQliXRSsSx1PX+jDXX7UK
 GNU7Dehfsbi4FY+W7jjbENfrVfqKhGsSDoJe9Rd4UosUeZuK3+yrn9JVpkT5Cwr1fwmFfHOJBGO
 t11yRbMK5Z+3NWrDKToGYbOZRkGpU4pTudLriEtz/1V5vk8R+iMq+nx1GXqNvXsLXuW1FW+Yt9s
 tv/NiL4WnkugYxLNqm9GkopYqDA4QgCgmR6VSSN05xqJsob98NB3Uwyx8cLn39nZL+F75NtL3lH
 jItmvr3KVRRDaNOLF71MDBPICPmZ61dgWmiAjjEd3QwnoVhC0VvzGLSHzCgP9w7qRF7nmuBjFgx
 Tf0oeKHbLgtswWlSyB61XEw1EP2RHxxLRq6ovNQOBvtoNF4fUVMEdpUBQG/vO6TGaswky7IqRbH
 5m+yooGgr87lI+fQNel7WqiyAuy888mRUG92GI6J5+afggISI3jbIXFwiSuKcqFXERR7SF7IPDB
 BT4cCxvFYMTn82AO/ii/MLkZ4fho/ZFKPmPQ+uwd4B4CKYZ6Tx8fj+huaVpwmFB1QHA7gMS8V0U
 nRwWTbTTBThYHFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234232_927991_D1CA1917 
X-CRM114-Status: GOOD (  10.30  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core deals just fine with input-only controllers not implementing
the .set() callback. Remove the unneeded dummy implementation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xtensa.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index c8af34a6368f4f69f9960fff7f8c27a2c8ddea8b..341b691ac2345b93320a6e8b933444d26dcf50e6 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -86,12 +86,6 @@ static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(impwire & BIT(offset));
 }
 
-static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
-				    int value)
-{
-	BUG(); /* output only; should never be called */
-}
-
 static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	return GPIO_LINE_DIRECTION_OUT; /* output only */
@@ -128,7 +122,6 @@ static struct gpio_chip impwire_chip = {
 	.ngpio		= 32,
 	.get_direction	= xtensa_impwire_get_direction,
 	.get		= xtensa_impwire_get_value,
-	.set		= xtensa_impwire_set_value,
 };
 
 static struct gpio_chip expstate_chip = {

-- 
2.48.1


