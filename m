Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3ABCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FNKfzHYbB1ZIWLHm8XS7VDzFjrBi6oFDR5W7bTakxwI=; b=I0BmgcIpCC6sDJ
	kQig9ktf53meGrMYsFg/rwD8NPH8Yk7SRsp4MwAffHsOylNR00N2jyNctQiLsANQlnNjn4/f1Xn1/
	vOmSOwZBwl3j+3nQxT21nzwCvi9uySvQHYOY7/vw0dOHFKIlS6W0OvYEA1EIK0zijp5vOLiMtbQ2W
	t/kKqK+TV4nQR07Alh0hYyFvbVLpJdEjtDd3M4VcjWRItEflQpOc7vBDKFsugcZedOZ5Vo0Ji4B9f
	qpQk2IU8ER7ALa4Sq09iUjxlmmcL/RjVbglUFe3spbgu2R9APvHcY8cGIhcnGjPkM1Bon099neJAj
	/qOh2gJCKqbRWywN7ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladB-00000009DZB-2p6L;
	Mon, 11 Aug 2025 22:04:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYX1-00000008yOQ-2wff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 19:50:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b78315ff04so4054144f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 12:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941806; x=1755546606; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKfzHYbB1ZIWLHm8XS7VDzFjrBi6oFDR5W7bTakxwI=;
        b=cnKbl13GelOT80alAq1ZH4pZ1yjTqSCTYLizsYG8ldbEs4gnOyalcDiN/WjXGEpVvF
         YygYr3L6zAIbUYodHDWlaselPHjcMaPCVQ2yqJayjJIAOlLGgd1oSJM7rpXOyZH7Yqz+
         oZLKZB0b5Os6pjrfFzOtlxJo2VfFYkUBH6TmLlNJbaxNNIFf8ePJFh6RQFFZvL5n6oGC
         ZVOYTrXQirjPOD8iTqSymTz2MSR0lvwQqN0N/wOGONih1DlaI0HPDSvul7A6aVbtmdFE
         YooZygljbB3U8xisPFLw7byqNN1ZwKeV7ZHYBYJDKPBCZOP5Xsj5swlISCzh5Cwh5dZR
         3u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941806; x=1755546606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNKfzHYbB1ZIWLHm8XS7VDzFjrBi6oFDR5W7bTakxwI=;
        b=i2JMirpV7tQbuFZ5M3k+Bs0NnU9TpU6p2U/Gt7SroV38UH+TPQ/RbhD5WfW11ikUNV
         6YWgiSmKhV8UgJgUHT0klSeHSbROTpDmpH0CpeQrhsvsyWUsBurxHNZOh/7Mp0hJuIhc
         915om5Pr5xkvl0neg1OaPGJoY3S6tqofh6oyNm0LaQJwlUe2BeDMCcmHcT9YNRVG0JRn
         32rUQ6kIfVeum5dBxI95SDQqW64Bk+Y6CCP9Zzwax0RgfD8O9i3f/FhF4ZjrpNXz9QCu
         AKXCsTiVtLyyr+KajS4CtvtFNXc9yoXMeV2eyxeJHg8zUNP0t3yunYqAz8QWZ4EFm7yw
         FUog==
X-Forwarded-Encrypted: i=1; AJvYcCU6LJOFcA2T+s2y8Lyh3KbjXgeYaefYTfCd9XrF+3YOqK3dTVsyr4nWAttgsQY8gobcwsucfNknTbV9th26skCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yze05kiCPeZUHILjIztLvY4Rv9+v0OPqnuEae/FJ4Q3NAHqANYG
	AJCIRuNnkPpXDA+xhlTwsW8MUvRNff/pIPJtWW03cIjPsqJ6EYyPI9Xq
X-Gm-Gg: ASbGnctlJ07HtdX/jFcohhs1+Xw0VGbx2Yyk+6/B49N5bTHJe+fS8eR4WU8syfoGVdy
	oO1oy0NlnopzuF0mtXdFoN6i8uimfQd0Zt/FaYkEdmz/gKRPeNWMD4marn1280AYcr9mOsgEsWn
	bVFq0mGvHrlhvA/mqk3KN0yOGg2mSOZfZvjV2yLGOs6JmnVsexPHTT6r01JLyi9Nl9ZvxQZboxU
	IOlqwqLGRhUatvWiG38dnMGRk8JZg/lErwvfOeteUkV1nk4Uubk5iDKIXSOCAgHpM3YGvZ5w71Y
	t4ZiG1nJTy+1yKGsgqFiGGRzMugugGJlP5GfSxDOoD6+3eUdip3wErdRHwxOtAIfzF/hIG7gl92
	hNG39YwOyhiQlG75Fb+SJmGQ2j47rlV/oXBaQ82OoZop+lSYG+/5/MsHdduluUQ==
X-Google-Smtp-Source: AGHT+IFHbn4y9hfGTMN6NHymhuhRV3bgWXUmWSsnPpSR+XutWW+nNtL9qKWYLtipZOMJQNrXZXOc6A==
X-Received: by 2002:a05:6000:26c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b910fd1214mr707538f8f.17.1754941805587;
        Mon, 11 Aug 2025 12:50:05 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Date: Mon, 11 Aug 2025 21:49:54 +0200
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJJmmgC/4WNSwrDMAxErxK0rorskJR01XuULIytJoLmg52al
 JC7Vw103Z3eMPO0QeIonOBabBA5S5JpVLCnAnzvxo5RgjJYshVVhlCsx3l1+JD1uP00DK9RvFt
 0iSXXgQ2XgXwN6pgja/Hw31vlXtIyxffxLptv+jObP+ZskJAbai6BGkemunWDk+dZW9Du+/4B1
 5RsgsoAAAA=
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_125007_748187_F22A8FC4 
X-CRM114-Status: UNSURE (   9.72  )
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

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. This small series restores
that functionality.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - collect offered tags
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com

---
Gabor Juhos (3):
      i2c: add init_recovery() callback
      i2c: pxa: prevent calling of the generic recovery init code
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 25 +++++++++++++++++++------
 drivers/i2c/i2c-core-base.c  |  8 +++++++-
 include/linux/i2c.h          |  4 ++++
 3 files changed, 30 insertions(+), 7 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


