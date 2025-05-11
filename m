Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33FAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qfxwlIQ0tbuPkSHji0HK07mcJx2VL7b27pvCA+Qhuds=; b=uLeIrVGSSrCZ9U
	wUi7FgxjflKED3W4PYMYVeZbAfDDoldSiBZvLaFyt2QfXNN9sag7R5oFB7cKYqnDPgezw46U0lXLn
	B7YoLDNvwctBJwGE5blnXrM+h3VW1DB7RN2PgSzCacQ73lB6iIZXJK0jxHD/5H9x5GdcEdRwynPvU
	o4xaZKemXNaIwlg68Cv6/6EgRndiws73NgQgJrgJpPYJ9vtqJwQ56S//kFpR3/Oh8G/Gq4GHILE1E
	QYU0Bgy5eLTC33HWrFOnvbZ89FW2gVw6vDICCGDeRltxAJCt3+AeggYhBdsOx5dF4c+/YtI6zl68U
	YGcOX2O/AiuujYPAgH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6oD-00000007GdD-3Lu1;
	Sun, 11 May 2025 13:33:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6mD-00000007GP3-2ylo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 13:31:34 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso6083940a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746970290; x=1747575090; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfxwlIQ0tbuPkSHji0HK07mcJx2VL7b27pvCA+Qhuds=;
        b=g522hmy1aNk50I4/RStsYT3ZWPLRlFCst6RhVX+KS+PP3KGl7ztde5B2i+oWynCrte
         H5g7hBABb6TnXNVCc4xNHMNpZNw11jtJzQNyWmRyLj6a4X3G5x+BZVH4HOYwFJGP0JFF
         CIeh6x36XB5VNwpN6effydZLK/0c79gacAgKCELxGgL4CL9b3EZcYGVHWWxl2DU6DmeQ
         /UM/nFXl+U34CH3MZvB0WX9Cfax9DL35CjrkgmifStj+LTj819CTp+CULXWGDSKAMMAx
         njtthIFNhgmF4ky/mWuuPg2q1zhWhFs3Kg2Av1wsd1y/9SyLTmfjzxDkcQDjS9RHhjjF
         KHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970290; x=1747575090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfxwlIQ0tbuPkSHji0HK07mcJx2VL7b27pvCA+Qhuds=;
        b=CS+NbWz1ZJSoMXYHsqK08VEO5gMOJthgf78siZduDC+C7FY+9maeM2yL7jnLvFEvf/
         KN19GsMvnGwpoFjbJQGw/9WDm02jgYHWeLq8CxVMjFtT+tC/rgzTdW93FMZTK3PW4i7G
         QYQXuhYU3u1qIhfaZffY+Axn+dvA7D0mxbd5JCTDc37DaFuMTwiR8iKDVNxFD5v/JlvF
         Ec+ardzgv41GdVtXGxSVPJIzG8nZlQvM5p/2/NO4YNqv4i0D8hKM+GOgj/kDpwREaFIc
         CUj090F0wCjdEzD2HaF6ouiZznR6VRkC4S3wBolUyEg76jh0aJTsIre4IRx4SNCHGida
         OsNA==
X-Forwarded-Encrypted: i=1; AJvYcCVogMNvtGJXmwOJcJ8fnxrxgp6KhZyqVnWIbGpklhVEo/liZM2YamCKEEIMtKKZFiuK9i8seR+NzhPsEnqh9k2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9H53Rsm0/YQASQiiLKleTUL7rLiN9BO+DIZzThPAJ/bm3LsL/
	3tilYpOE6hedr6dyJVHlgtWV9jcKdr23HhIhDjUqzYi+TiikIC/S
X-Gm-Gg: ASbGncstz7AEeSpwzRuqaGzTfhT+OXrfHHVamLtBx2drTdXlptvrsfa1G+RNrYrElk6
	AuJZQOZjB1cid5fMOfjLExX+iRG7OIPXTpKwBSrOebXrC9ddKmmuZXXrV1uVQ+3AW5KQ+A4OsHg
	tmZ/bntmofo1pckz5bDZISKvxsRy6/9H02LZ8gmhsLxkejMzA0H+iiq+kNRXH1Eb0iIh2dAqVjX
	04Hx0GX/j2XKKm+iPfz3gRie/wdZJHWPzq2Q7TNSpiQrtFcl1/97NS7oIC0W9JA1wY7xIp2rFiq
	DUPgWd0y7xfmgFF8F8juRXFTAj/dON5ryz63XZyzb+B8UXB8t7/G+nf1IRk2UaKsT1s2QuKM9rp
	6K4pV
X-Google-Smtp-Source: AGHT+IH7yl7XmxNilX/kpFITQRuEskSKWUC3Vt7HAESuFqH2J9O8p35Yu7FQrAMijfsU9DPiUrNnMQ==
X-Received: by 2002:a17:907:1b1c:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-ad2192d4a49mr949942566b.59.1746970290354;
        Sun, 11 May 2025 06:31:30 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197bd398sm466765366b.152.2025.05.11.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:31:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/3] i2c: pxa: fix I2C communication on Armada 3700
Date: Sun, 11 May 2025 15:31:04 +0200
Message-Id: <20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJimIGgC/x2MQQqAMAwEvyI5G2gr9uBXxENJo+ZglVZFKP7d4
 G0HdqZC4SxcYGgqZL6lyJ4UbNsArSEtjBKVwRnXm94aFEd4PAFnef5N+7ZdSSicamLHPrLlLhr
 yoI0jsx7//ji97wdJTByAbwAAAA==
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_063133_771719_84A32A7B 
X-CRM114-Status: UNSURE (   8.36  )
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

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
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
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


