Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1177C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=; b=ItdprBWSJMh6sJERYORm3WTqOL
	MQBppYECBuerOabF2nFPuGmEgsP5DnBhyk4bTipfgLtVRUXp1FX6nxl+Bz+DcNcCwsZ+bx3LHuH9g
	uMGw0rhVufFZKUKJ85v21FFvhlUoxdT6L3CJtbY06vgDVAsUjrW+IqzkCf2AetWDjUldsFT3wmxB5
	NJ1Bv9sIOsKlCzqNBtyi0gzWGH/v6PsA3KYqeRk0Otx+0KPMVydCikIOgcFeEqIinP4moOGElf3lX
	wQzHZD4moUleHkG0OpndkehgFdOdweqLMiZ3T0IZPeNpmcXXS/ErClfGuvSLdwx7GNa6n/nSaN9eM
	y3nCBqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TzM-0000000E30f-1qje;
	Thu, 17 Apr 2025 18:29:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tvu-0000000E1O3-2x7f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 18:25:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso1102706f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744914353; x=1745519153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=N3SB78LmdTUydcB1r+Vda+vGiOG1dBelZBhAnTF5u1Tsarh20dTznklLgxI98a4PgA
         3WY5Pmd7bV26aJo68anv5FaXdxKVWvy3ecoNRNCtAKafo0FH0XxPVAlCIu6+dfONrew1
         U8hCbPBwm3uLz6AY2yJuywOnGHjddIVocBvHCgowWlheAkPJBhMc5OvLoRygFkjlvTQr
         oZie+GP/2pdnLkkkK/2ZHN5aQjHx8X3kFt+xrL1cAbyEZKNeJ9Aagpv0Sfi8ZBpONTTT
         ejqFLhU679MJpk9rUmgBisEn4jCP7+QJ4x4YP6EUWdt/uesYTvbhfWNg37ahtqJof6xs
         SVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744914353; x=1745519153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=H3gnozOHukwdJ5Tkk+m4wPIrOj03FefllgABHUdPB696nk88hgs+vVBTM7se8ZJ3BC
         suB1Qj8UnhW4Sv1vvSGdx1u+BHrW+9AuiZWbeFqtJScqvdRdB3h3LVzyVM83LtePn5tk
         FEHhQ326XhbK8iBw3a67k1vqlYYnUtDDWzWpDkUiDGfjePnJnC+PlGaAIjO3SEnnYEhK
         rP9/aJzsV2eml74wl0HYwsUuOX+Fu2/OYvgdnw9tJlg+VmvL00OJUIMuenDoDj9tk7qK
         wdtVxV689T8CJCGd19ncJ6baj7z4Eyoi6E6ByU4E7K4kMT5PaZebSRMzdMDF1Sn0O9dI
         Z+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9VGW9vJGgIlh9d/tEMZScGOaax+IDmDsA4YH/HsxnJ/SJOZhEpbZN13ICGx4GHqEokyBkcPQQkc9tKlODRJW9@lists.infradead.org
X-Gm-Message-State: AOJu0YxFa6NBmxvOxrzn8F2q9q9z3rbLBpHlLziQyeLD2oyh9ZZVOc8N
	skYTJ5t7gm30s1UnOIsW0cR+ysE+f7imn3A9BbM4MrjL/0TGzMUu
X-Gm-Gg: ASbGncsUQLcqBYS10DvqqvM81yQKz2UTWO8N/xArs+maRj46SisTrpvdyGRhvgpjtWD
	+9sshRQvN1+hS7SEwBIyGp6e9ouPP3Zwsl45bLQNwj8qx2uthR0UY/Z6IbDwY0n8Lm+OIg1vmr4
	z35G3x+FJckZtp2t003cLh1FVpGQDIJ3SWlHbaAnxTmiR4IEdL5+kkeForgwfJYbw7aC7jfBHgQ
	/N68woSc+rb9oD3KJ7Tz5PSaY8D8cKJRnCNR2wjiHAs/h5AU5bqCTsgPhvHC+h3AoXqjQJKwvn9
	WNJfpsb4OiizGVh6vIoEIMTARKcskYC91hAyGG+2
X-Google-Smtp-Source: AGHT+IHWFOtrF+N20ECOnSfV+42jDn6aqmV44/diJP2+K061uVC6Elbk2/PzNB0QPE9GirlcymnYfA==
X-Received: by 2002:a05:6000:2203:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39efba3ce78mr4300f8f.18.1744914352430;
        Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:1efa:2230:869a:758])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58cc0csm64908185e9.32.2025.04.17.11.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 11:25:52 -0700 (PDT)
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
Date: Thu, 17 Apr 2025 19:25:49 +0100
Message-Id: <20250417182549.36268-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112554_740886_FFC25FD7 
X-CRM114-Status: UNSURE (   9.73  )
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


