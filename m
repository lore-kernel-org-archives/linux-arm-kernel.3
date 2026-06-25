Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27839CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uBKJbZacR7qpAxgkxKTYuFWT8lf0EijVUm+JTDcFsE=; b=plvCJm3k0tLEc6R3uyiru1GjiN
	pEb898puEeYuwIYDPPuW8u2D2eF9npF0CeLjdQw9ZdgJaTQZFbviJU4lmzx6rNUJIxlfsV1gjKrqP
	V91WonBRGk3lZyuWdNlRG87n30tzX2Ia921sMt0y27Dg1ebXN9+aqeFLLVKUBy7Q6AaCcxRngadhA
	iMYhQSTOE4pUTeutWg7E6EOHdaB7/hFQopHGGnOHXPsECUpZMWHdefZfNfnCBY1sbktN71G+Z98tR
	n+k4zMl+IeBmZkXSxwM/WfSQ5Cf5LTS8OCm0XHJRkIsD/JNWMiyGtrdQJtQo57td7YAyV079fs++1
	9pHU2q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXE-00000009RWD-2TmO;
	Thu, 25 Jun 2026 16:02:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmXC-00000009RVj-0Aos
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 16:02:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c7f1db3ad2so354585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403353; x=1783008153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uBKJbZacR7qpAxgkxKTYuFWT8lf0EijVUm+JTDcFsE=;
        b=WF68zw02c4EiLzJvUCJumilhy5EMLFMaMIJEm6kP+0g+JCwfO8Z9dzO1Nz0VOmdci4
         wzbfN+t8XjSPylvo0MqyyqYOAqCKXVYY4PVZzyKYBpKhbpiNpho4zO6bX5b10hNjCCon
         bud/WCOj0xEWqyWUrx0wqLAoMRMl0P8hgYvHciut8iPFqXmCQEPTEZtgGdRvW88WZbDV
         c22Fzl9jg/ULm0jjUAP5lGThJ94BGIrYJRZOWOA6ETmyIv7Mm3Oc7qdxLdqqmplpxSle
         5/B5hnFYWTIVroXE5YmwmQzUEuePPMbCD6z9kQT9s/Tab4wom90SztZjj+v735MSIetc
         /n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403353; x=1783008153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uBKJbZacR7qpAxgkxKTYuFWT8lf0EijVUm+JTDcFsE=;
        b=EIywWibrdDDUdraYrATvNaVWI4I7JoGRYz/DKfBy1MBw6aEtyf89HJx/nUk7h4walg
         CgvfprFQAsV4oFvA7EOJJFl68qQWZhnA8Os3D015ajU/1ZI7wr5mYqsvhJ8CE/9SC567
         f86Edud4aAkMfjHXyLCzLMx21c6bPX++V0OfxoVEU4GrQMqGdsx2kh6LSXbPSXY1B57q
         gXcwlKJGpTI9fJrtZCWEN5HeYtjtotohLnCqpJqI9Pa+FUBO3np4HNrnuTbW8stESfUW
         1XLN34QLT7glKfvnpmzIUuhenwkQBrzqpIxMMhJX0PXbspnqEwM6iI6vZsVCOM6JthHL
         HPdA==
X-Forwarded-Encrypted: i=1; AHgh+RpyX0zfFow0tYg/fDbcB7N1Pv8Wb2obPJgkacdkmQBOhW5wSPWz1uR9ZMWfgm9K8VtS0ucuD1Sskqb7LlapmsLO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5FouKItV3Cq4Dd49MHbmq5nx/BdlwwlwNwzBHLzJjPYMNH5s2
	32271GKmvgkNaMLb93zb8ZIoGctSl1OjhVnW1/3jDvE02mI1+pem7v6y
X-Gm-Gg: AfdE7ckGBOVQBY+LaIwaHXFFWob5jz2qHB6sV06lBf2cKU5AYLB6AtMir+ZrArshLpo
	A5HNdKlmtZ+NfH4jDCzZZKFDFyprG4ygqlWK/+HbnIAwnW/uXIBggNhE5sZfOZdKYgpPfGMT5eB
	xuLP2nagjIQyclNsQ3ZyAzl4gbyp7Ro/4FiIzr8P/kp/bVMz7rCoKJ6PKnAqA9/D6KjTlLMcasZ
	aoiN4kcpb4dkaVBmxwrDSzkRYg7WalKLiW5tH0qvTsBQtk6+3J2qGmk6lEgYCoCK2yEJxDfCUOM
	8t6zkrO6xOzPXuKdouKML4QhyhCozD5vk1fNl8e501yBYmuj2Vss4coWjd6lcMY4FhbrH/MhmOh
	je8I+DcMbR2Mv4tt6CksWAV1uETYCqQ+h4V+QAsShmEX+CCmNXJ4X+kXPKdOjZTYmp3yvXA0jbf
	OwHiF+1H6D8FrvkeySwyTDsOklgOnTudPfAmrg
X-Received: by 2002:a17:902:d483:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c7fc708aa6mr35566035ad.8.1782403352803;
        Thu, 25 Jun 2026 09:02:32 -0700 (PDT)
Received: from liem-TUF-Gaming-FX505GM-FX86FM ([240e:39b:ee0:1b70:943:8348:4ae1:4072])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac88cfsm24127925ad.2.2026.06.25.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:02:32 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Biwen Li <biwen.li@nxp.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH v2] i2c: imx: Fix slave registration error path and missing timer cleanup
Date: Fri, 26 Jun 2026 00:02:19 +0800
Message-ID: <20260625160219.55116-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625071130.93544-1-liem16213@gmail.com>
References: <20260625071130.93544-1-liem16213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_090234_082925_18007A30 
X-CRM114-Status: GOOD (  16.02  )
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

There are two issues that affect the i2c-imx slave handling:

1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
   and the function returns -EBUSY if it is non-NULL.  If
   pm_runtime_resume_and_get() fails later, the error path returns
   without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
   attempts to register a slave will then immediately fail with
   -EBUSY, making it impossible to register the slave again.  Fix
   by setting i2c_imx->slave = NULL on the error path.

2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
   disabling interrupts.  However, a pending interrupt might already
   have started the hrtimer (i2c_imx_slave_timeout) before the pointer
   was cleared.  If the hrtimer fires after i2c_imx->slave is set to
   NULL, the timer callback i2c_imx_slave_finish_op() will call
   i2c_imx_slave_event() with a NULL slave pointer, and the
   last_slave_event check loop in i2c_imx_slave_finish_op() may cause
   a system hang because last_slave_event is no longer updated.  Fix
   by canceling the hrtimer and waiting for it to complete after
   disabling interrupts, before clearing the slave pointer.

Both issues can trigger a kernel oops, system hang, or permanent
slave registration failure under certain race conditions.  Add the
missing NULL assignment and the missing hrtimer cleanup to harden
the slave path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
v1 -> v2:
  - Instead of adding a NULL check in i2c_imx_slave_event(), cancel
    the hrtimer and wait for it to finish in i2c_imx_unreg_slave()
    after disabling interrupts, as suggested by <Carlos Song>.
    This avoids a potential hang in the last_slave_event loop in
    i2c_imx_slave_finish_op().
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..04ffb927aba9 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
@@ -957,7 +958,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
 
 	i2c_imx_reset_regs(i2c_imx);
-
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.53.0


