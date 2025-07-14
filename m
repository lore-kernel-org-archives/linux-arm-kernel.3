Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9752C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EY/NG2nHnV92BHijz9klsk+toPjE4xsvjwjRWHy7y+0=; b=K0EqRKJzkZG+ica+nVSRxLbw03
	4+4pc5wq+bMhNwP7gpLoXfDq9ddXZVPEylt4DBJIQ9M6T+1OGANKhyImHwFUG1JKnto+OIEavltxl
	5ukboLoVZVA9LK8VG/5NjtNEaW5CTwT+gT9Z13HcKLVTOt1Vm7y6Tcs0cf8BKzQ9DzY3Ijuq7B48q
	FucHaE+pQUVPEalNQxNhP3b1CzffBzuSTjR5Ix/eDGzgUDLrnpRN4ervJFpFsIxKnQFyUD4JULG0W
	XcxFOtbBUCF4Kt2qlQ+G4/DxUMgmIDChFYfq7wxV0Xq05cH0Dg97YzlKnaWtGS2xzDgXYgO8fGuek
	gOwlH+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJ48-00000002Fxd-1HoF;
	Mon, 14 Jul 2025 13:17:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIRh-00000002Bhm-227A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:38:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so7105122a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752496691; x=1753101491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EY/NG2nHnV92BHijz9klsk+toPjE4xsvjwjRWHy7y+0=;
        b=jsp5lCe1h3LpVR61078WRX6iNZwLrb7hbiDN5IG+wQnh8yuy0JA119DUFk+N3jjxIm
         6D4ll1gIfBHV/Mf2EjIVuKG7XsMDyHnCUdZMEtUpFIQXpL8YPui1xhOAoIUxVCibSZxW
         1BH6BFk35QOmLj7C9j0ed2Cf6UmgIaYN+eBbfLZ8HkruKCuh30yIuVfmmfdrNbdggtqp
         HQLEOpLsrfmvx209DdMVRSD/0gvN/WmiF8Np1F/etNou4jYTNdlgdHfxp7gryKoTh4qW
         EG2sk4Dg+dZ3m3KQKt+Xy/Wk0nthjgBgaavj8qjopZyjR27Zh/pWXzY/J03mTLf1UNZw
         RJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496691; x=1753101491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EY/NG2nHnV92BHijz9klsk+toPjE4xsvjwjRWHy7y+0=;
        b=hk7CUwnMpRjDTORkz52T8Q2KuAcOETdY4At+/g7cdylse3hoJbkJez7FERXcq4XOUx
         hTmtdaR6ttpF1nbXACu9W6ipPwdddrK/83CrPqfF87oUiO6/02SQsjyVc++37BveiOV9
         jPEfqVwhYea40FgoDkwx6pOULQREUti9cWNKshNhzP7KMidlXeOXfa9bNQZMD3G6mxmq
         iVy6aeXKD/53Qip+Z2gIkCYrfS+9716bxG9tDfER8lwvgEsWfAV4000Mtkr+ovKUnjwc
         5VUUp2MVjjVgNlQzwI7p78ubjDBboTJsfScXOjWcH44DkOrDpHMvzUzxuGjfYokxK+ZM
         PGTw==
X-Forwarded-Encrypted: i=1; AJvYcCWPT5GvVnlzeePnDr+zeq7Y+BPPtpq0tBUa9f9N755e4fbWzR7OPVnFvT2+ERFHCtf//Czmbi71G0oOpd8JrtHz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8POg0snmK+Oto/vENe4WiuzzK+AA79yWtCl5CRrz2dcD49xy8
	NYDQwQdEZFaRQEYlQ9A3tcO2zOUdi0IfW04tmDEedf3S75046mz844F+hqWswg==
X-Gm-Gg: ASbGncvDqE5rDPjNshg3/3KqZRr8fCZ89KiAb2PfHvH3R1AGqo9Kn6mINv/H7Ew3lV6
	sqIDJUELEN2NiMgqSFQFAtXwhMO8vni9WqyeoxWlch7uDFUThbao6cBqPRgH2CuQsgXUM52D4N9
	HnOGTtqtXNHSstZ74TWnVlH69az8L7sWWZVYCQEiPLqizpXdg8XmgFz+9owDvq6q9jdrAHQFaE5
	Ig5AyFl5RSXCAnM2rnh67Cdd8Uw9gzmsUMWAKb5hFfHzOxsC7Zitol5tdaagogIZObXu18e2Z69
	iPGATO3b/ln5Je2DgZyQYoMlRLokzZ5SmQwRDYD+lQuUlIFG2bpwwqS/St63rNzVZhos64TWycu
	KBvr1ePXE4OhRqo0cRaFur+l3/lIPiFzWujhHEKExRJF2BSgVeVTiDI6Q
X-Google-Smtp-Source: AGHT+IFJP4cB80pxWE0x40njp9Ls1ssVpAFwjW00zYJz8lfNZnZohc3hO+AUezRssWB3NbpYRZaVBQ==
X-Received: by 2002:a17:907:930c:b0:ae6:a8c1:c633 with SMTP id a640c23a62f3a-ae6fc1fae79mr1276473766b.34.1752496691220;
        Mon, 14 Jul 2025 05:38:11 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e829402asm805005266b.121.2025.07.14.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:38:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pwm: imx-tpm: reset counter if CMOD is 0
Date: Mon, 14 Jul 2025 08:36:34 -0400
Message-Id: <20250714123634.6442-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_053813_528474_A8FE832B 
X-CRM114-Status: GOOD (  14.47  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
of the TPM counter does NOT get updated when writing MOD.MOD unless
SC.CMOD != 0. Therefore, with the current code, assuming the following
sequence:

	1) pwm_disable()
	2) pwm_apply_might_sleep() /* period is changed here */
	3) pwm_enable()

and assuming only one channel is active, if CNT.COUNT is higher than the
MOD.MOD value written during the pwm_apply_might_sleep() call then, when
re-enabling the PWM during pwm_enable(), the counter will end up resetting
after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
normally expected.

Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
written.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v2:
  - dropped the "VERY IMPORTANT" bit as per Uwe's suggestion.
  - Link to v1: https://lore.kernel.org/lkml/20250701220147.1007786-1-laurentiumihalcea111@gmail.com/

 drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..b15c22796ba9 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * if CMOD is set to 0 then writing MOD will NOT reset the
+		 * value of the TPM counter.
+		 *
+		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
+		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
+		 * incorrect.
+		 *
+		 * To avoid this, we need to force a reset of the
+		 * counter before writing the new MOD value.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1


