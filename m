Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D313C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=; b=JKNsIU4/rnqDwQif0iVaM+JcBa
	OJ9tEAWwPTR9FPZsxgcKup3Qu8mXQpQ1hFnQOtVSndRmSiX2FMMPlLl/5PzEi2y5gsrXI+xtpTWYA
	Nn1yx74qzjC1+cUb/TB1/56PIvW06U2pUk711NzqxBl3jxaiCNnZx9GopbQUYjSZQth/NdjKZ0JRU
	iWCL3q6ZRYz/0lB05V2SqeaXxKnrn2ubOo0dvBEkDPFgelcigbDLbha+wOJ19/B1yBLRgvw7NxZMQ
	XDdvEPA8LspV1D6IUupdObwowOzx4J93bP4NJ1vzwGe09Jd43DssSro+eKoEZV0VhHEf2AmtZ6TlS
	tn+2JDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1QCB-0000000FNLg-3ra9;
	Sun, 06 Apr 2025 13:37:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1QAR-0000000FNGh-2oKW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 13:36:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so15706505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743946565; x=1744551365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=AdLTCvP1N480sFyVofBRHzd/7iqsG7GnBFj+i4ins6k+mQx89B+aNIW+JHgxsM6Kkj
         nQY+M5/LeyWCNyq9qQ54MT5zJpB+XnvGaNRvy3cxmmrg6JjnVrX5AmqzpDklDztB363r
         uvZ/X1VxE5rn0ZwSoMGNtOxIj2sc+8StQGO2QcBzxveWGrNMWSRS4HaFoO1MybR0gsKP
         HxYxwdAZous0prc0LtL/QZp0ufEDaxgoOoVIB9zlWLdOKtuMtNEFFU89fCNXX3/HiYuJ
         vKwvl5HGjfXpbYHWbwi1sLpHw/oWWhSXGkO2wqctqTNEsTnTxEos0sdmpMBuIcEc5u/2
         9mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743946565; x=1744551365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=Ov4j9wB0GsJRDNWzBt9qfN1vHrk+C64mD8Os9TlxTvglQsI2J3lqBRfnyfHezVWQyH
         vU7eaReir8bG9tFmDZ251i9DeVo94rep383FgCSmIrqfGoJ0Pja8BWh7K/jQ1OfxtObz
         4LdZdEjQRdTxUtyGJuVeuPRxr3zRgEqgWk6CnnlhL46+XqcHvtk5qOmuQyrJ/PmLTT8x
         6KXE21lXfFpeYRbHf2hD0gL4110BPYc7pt7geMzh/ZDA0kDw9w8qGO0MkfycvwBHp7/I
         fNcYYvKh5leT+WvwFTxW15Rb2eOwQuFX9XykFMYiqMXh+NpZf6hVbGQa2lD1pwaG8XWI
         PYXA==
X-Forwarded-Encrypted: i=1; AJvYcCXyUgb8JZDqC6431+ofrE+5k/uePOpn1DAl7mWksG9smnzmwFiA9rxOGNkXgZhbyaCbw9U0v2mZv5lEbMN1mR+S@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ZOvd+ESWpUqbrrC31DZTuKnS9z6jjFjey7AybcOtk2Vq5uVE
	3KeWofaT/e5IU+wAKEpub/E3jKZEYlvbfWUcx+ZAZWwqFj5cUXZu
X-Gm-Gg: ASbGncsN+LiLqK3uy3nY6C7tLa03Aqr0UZcEy3aW5dipG/YInOMX6pKPcB13Fq25w1z
	pV0OxdKByjxUsMLgSiAtQ4SppkbwBEnJ7VAikKyadfZDrEE/phf9Xv4NiHwPik70L6FBAcDY4Cx
	/owmYMszGFERnX/F6J+tgpFQn/oLypf09gy7JEIjeue7ePP7ejgV8cg7m4beIccxqkLaa8wV2A0
	SJSDIKU2TMQRojN8Dbc1NbmQIbcZ3tL6dygjd+FFCel4Nh3FrB3+y4rqhfZZsb6fHQ+hxJGoURO
	gkiz27xFIKKo06EnE6Qd78EsuwT/pFHEFKoB5TwsO79Thg==
X-Google-Smtp-Source: AGHT+IGaLSX5abguqVbP+J6yIKq+sGqu7t/mSZeOJdHosj/2KCuKMRBbvEKTP1d8iNP8JedYaFysdA==
X-Received: by 2002:a05:600c:3d94:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43ed0bc8d58mr87064365e9.11.1743946565281;
        Sun, 06 Apr 2025 06:36:05 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:e805:af55:cd2d:e06f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm100652575e9.35.2025.04.06.06.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 06:36:04 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
Date: Sun,  6 Apr 2025 14:35:51 +0100
Message-Id: <20250406133551.4576-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_063607_708094_69517ABC 
X-CRM114-Status: GOOD (  10.17  )
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

In thrustmaster_interrupts(), the allocated send_buf is not 
freed if the usb_check_int_endpoints() check fails, leading 
to a memory leak. 

Fix this by ensuring send_buf is freed before returning in 
the error path.

Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 3b81468a1df2..0bf70664c35e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
-- 
2.39.5


