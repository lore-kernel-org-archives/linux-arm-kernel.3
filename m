Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C21C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=; b=XTgjKTx4mBTA7VF9+8ewltzCyn
	s12Qe3HjANJSXSCEuQHEmHMZDnwses03r3gKA9d/zfk7Bxnbd0DWBOk8h7BwWKPkol3zVigCQzdT5
	wvcNuUgGiFK9q0omAnK2kfqDogVINq6tb9cU4ZAil/peJjKhReR2jHMAkUTelGwy3a6F2NUqS0s3f
	FWNyKBFg82xRac3a0rlqAbbtU7ZSpTS6hWAVcUsvtRoSKfwzAXzB0TcngK9x5i7SOaLhgS1D74f9y
	TcNbAtzatKDbUnHFDyIYS20DEa3OXH82DnhcJ29A41kk7o8Dtc/toQMpK1c89afqST6btuSXuB/TQ
	j28Givpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXsa-00000009L17-1LWE;
	Wed, 09 Jul 2025 16:42:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVwz-000000090bz-3bDf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so412f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071948; x=1752676748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=gYShVAd2rLWra/25G/hO3Ej0fvExsvDZdQTbkuw1uoKmwku+YvbY2KvtrvKKkVgbq4
         f7DmBZ9SRKd6B795z52saBPVMsXfz0NeJ4Tg019Mt2GV3MIQlEUgoZlvoxgytCPilYa9
         XmDhevAaWEl82YhUoYj4Hec84WgHAq9nBda4sol8/NUH7OnqgWx8ZzBX5ylNxCUw1pG7
         CGTVd9HaWZbayrTcQJJo45+s8jNLnad91HL+VkqDcjw2MqBtFzGcrXEPJFnGuxC7l0jK
         +wJXc+HhbBmMeyAbAVGrhXSWWePuDX1JYmIkZmWfbSZvVVn7Jr+ICDKLta4k3AbczgXH
         yt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071948; x=1752676748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=t/bySUhNKmSkAjI5ik1CNU4/GvLxJ99cvmCBCOH6v2iR9u2ZP8cBUM9arn7g7iTgnp
         ryPEOVjEkqFViP8ihl/Xpbt2vWa7F4fa5jnVUSpvjk9UHDl18S4ruLJc+/nj275kH0rX
         UAcmhMplDX1KImJhQLTC0aN34bfEi8UXF2wBj5KpkezkdIAs5e46GBzyXRVKJeXMwOor
         hX0t2MjRgQtmXAi4DvH2m5FMB8/cFLCLy+EWBM0pzW9pHxru4POoA9DqecjaA9ik0c/j
         pIDD1rmnGWlN4v8VXZyryITIp0jgFdfY3xRtKw7mXkdVVEhQpIIdZJRQUKIIJ8Xtpkcl
         98Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVKCMv4BweInijHtnbsMaCjYpf874fnwyL4v8gYktlp8Q0j6tNha59bz8jr16tY9LdE31cnTDVxXJTEjzhuIGni@lists.infradead.org
X-Gm-Message-State: AOJu0YyjPx3ihVdWGlgVGTum4YYSFmfBmh9tOXnH9WZUud8Y4B9OU68o
	gAFmIaqAcCSIvSdkaBNue7eSyrZOOoyqPQ9WJdNYQU+rTEYh4fUSrYbBtdoHZO3INnM=
X-Gm-Gg: ASbGncugLAoexd1ALr0GwljwQHJ3BBRO0A7263xblcBDS5nvP6ARok4ka9dPyQCJUz0
	/p0W6gGXiV35rDXKcfw94uTDCEWZHQHcSTjMmTGmdhgxMln1gczjhckQEy6rrZ5umVSbnvmsP8p
	ioj1cDX2wtyTXMK7+mgBe2EBNT1hmLcxhWZjn80TBLSKDUq5O3DOtTiTqnM4olDKUSgcXOirrPF
	+P8/2cX/MFxb7aY4FuUn4n/iLuJ+vdsZdof4eJfI7F7H10mFcyLRH8vx0e97hST8SfTufljEzzQ
	lnU0N2Ww63TLF+KdRMwNruKWegiGTOAhRSczKP5n7C6w1fqlCIjCv4kblLfJ9FK4uA==
X-Google-Smtp-Source: AGHT+IFEibdkioVzNOuoSWG/K6hY+8pugjo2P4TOU047si8DoKyy092CWV0oJfwFHRe0nnQ03dyytA==
X-Received: by 2002:a05:6000:1e4c:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b5e78ffb54mr139106f8f.54.1752071948244;
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:59 +0200
Subject: [PATCH v2 03/12] pinctrl: equilibrium: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-3-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MVQFwNoIRV/Ud/LLyOAZ+93HlIl7udseweMC7bu/h8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fa4XZ2ghW/kayIDfPhlXAL3YlqwU6Ngi2v
 IjwAbZzzbKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ciikEACCh0LQNciBTYPnmuwa2YZbkQokhjIrOxRr1owGq03CeZiPYL7+ysx6BmRb3t3mKykP7Bl
 WfzTGgSSZeDscfRF9rqRRxKymVUakctYhZNhqABFOeSqnK0w8mrnv7+1cRHSt6Dwg22rPuBknF4
 XaVVUG8i9wnEqaVUEXD09i6hE2kGV+ssquoodS0BvjBJar9+ul1V6vALqdLckIArGjCowy80OQq
 SpXXbbDfMJX1K33wbDYk5z/uyvbn/GVYEGF48CNNV2lV9U0F2BiD6hArqBSnBseWrd2ms61sPkt
 +Nk9r4zgJgQ6KT8pfN617hro/Wx3Lii1FIAYx6C41Foj6mKN8bYikDM4nDUSsUSFX2b4i7U8Vx0
 mRGG6OkZ+5NKLe0K7eQpMqk196ijN+RgyYDmDW29P+NAHTGVPaEzxMQQURYvhJ5Qh3wnBk8V2p6
 DRH2sqA5yI+y7VXTY7nJu9FayLkT4zpGkHj0YeN/uQ+w+CC+lBFPC6ouebiniuiHiTRc+vM9oLq
 eNED6Gu3+VQKpwaeJbAw7ZFJDnn9m++413EQZxdxfmy28IAgFw+6qxZbYVMvU7jXxBp2G53lwg6
 PYD57psiOtuhbkv5gqv3X5suK9nDqLGTmuUIuhiODlJVV+IEW/7cLD6poLY7OQAU+bxmLmd8HC7
 hb1bpmiIszOUvng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073909_905970_C95F87B4 
X-CRM114-Status: GOOD (  11.62  )
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

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 128b7efb110a55066a21afa7bd0744a5fc6332ed..fce804d42e7d7f9233b2da0fb26e482170629424 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -687,11 +687,8 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		if (funcs[i].name == NULL)
 			continue;
 
-		ret = pinmux_generic_add_function(drvdata->pctl_dev,
-						  funcs[i].name,
-						  funcs[i].groups,
-						  funcs[i].ngroups,
-						  drvdata);
+		ret = pinmux_generic_add_pinfunction(drvdata->pctl_dev,
+						     &funcs[i], drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				funcs[i].name);

-- 
2.48.1


