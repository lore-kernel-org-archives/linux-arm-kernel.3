Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C94C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=; b=fSqZhDFaDWSbjT90R300rImdVO
	33rVdxwmV3t3NnfaZTi3FoOzMcCkgQ5k1/edQpKmtrbwN7HTey8rOcjaoBpWaYnSiL0qCE1EpJ4H3
	v8ASOLqOJjkSrD+UKKdvrCgrLG/8nQFXQDaL642TM7gxI1G0EjCwml1BdhcapkM7r64GLRRcd5kwY
	NF0IJOtmb1JhbIV1wc8bxxoRzWeCaVHstMiBy4EHcyxHiu27W8AdkrKSDhof3JWuZU6LdeJspg7RG
	YT26wMxWlGOm4QR38z0p17SBPOICFtvLzl3tou4JQ4DV29OEiwIOklZklKezWNt+aRwCvP+SyvzMl
	IkCw2tBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBXUX-00000005Egl-2WeQ;
	Sun, 04 May 2025 11:26:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBXSd-00000005Eaf-0HJE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 11:24:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0782d787so21259325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746357881; x=1746962681; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=Tab33NRoVSJjFllAsR1v3Y0djF4sJGaHketD3lZVSddHheC22Ncvq7Kg0x0Dnc0P0K
         oKf/hBZBijkrBr2c94t4Gv0QRkUN4KNCGOqKi6qQPXaXXCrcihGieGgW7TfO+3TxZqZf
         38sQztylt/rF4wL7H+ZHk2q4RjqtaTWv69OSj5WzfLAp7djsKYtEIyajhBsFfPZy5TRp
         izHAUB8zaO5OCWrR871hgC0qQDI8QIy/7WlFG12Fm6XVpPlxKHpf5nsOuiCTma+lFRap
         I1zx68bcoWZ4iOnB+rKM9H+tcSCILDY1NSxEw+goyFB6gvHB7vBGVSYr2eTr7ZXer8Oz
         XI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746357881; x=1746962681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=ApBEHqvAgPT+dSLLZtm/dJRCeZAHpQF3jbnIlb1NyTD9793b203fB1Xa2RF/p7Wjuv
         a4/n5cihHWxGEahmKEv3WMYaSHSsBjTQX22aGhWJEohT7rqDQrRzfajSBIWxwt0tiF51
         xhN2C3ZXMgPp1KXYy7H1YVLxmtfRgEn0iiN7pO00TwGrwFBiGKMgDHAocrpGUOOOEN4h
         3X90BH4bMLj+CWsgsXBGS/0vYs+53Vcc4FNorIdV0b1F30Tr+44Bd06P1kbJgPtKIcYm
         4WA3VkS8TZRE0djWSjZM4p3HQUUyaA9Y0oDD/Y7S5uYSzi3GBn7cExs0DPfu73cjsaBm
         W3eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKMeY4uiir+Ehovckos4WNzm0LwzF4q1uz48+VwXF5nmFI//Bn7MMQNxxefoVDz4w3L7aOpPfVdOpvAl6fgTY5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8v4IO9oaTgZpozuyd0YvzVGAIgxL6k1V+bqeCvkAE83LZchvZ
	Oy7t1rFkgQnzcwvlHlvuEvkX4bD5BRAOHZ+zs/nPDVE53tbH6jlAtzJUJomYblk=
X-Gm-Gg: ASbGncsGBrRen38aTNq2EP6OClEBWdSKOUh9CTBI3bVV+TbceGI7V5BggWx/i52RKw9
	GIBqKl9L+m+KMcd1abp/oLg/XADeAYN9jYQh7sMJ6lC6u6VlOjoPXN/TBQbfhwqPyk5UT3bgtr8
	k/I45X52vEmedQBxUcrd8oGdk0w1buLopOR81xaFCG5WaTsn7xyKLhXTy0r7w08JuFFen5K1fL2
	Mn5pbF7aHZs6UUKWaUSm2zZtTodafp+x2gU0qQZq6h4A7IhBjiVzm4dQ2rf2VzxIwMsnI7QoX61
	j3OPzLDvUuFntO4etCqaVX4T5VjlSNFVibisdeezVH7j
X-Google-Smtp-Source: AGHT+IF/nTjowgFTpX4DBmNA53Y4LVnmPuQntazuU/vu02j6XLWVnIjjuNgsMm6A3VC25/HRU1jVEA==
X-Received: by 2002:a05:600c:4e88:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-441c48bdfe5mr30770245e9.10.1746357880705;
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9356:7b97:9d4d:d944])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm144447685e9.7.2025.05.04.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Sun, 04 May 2025 13:24:39 +0200
Subject: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHZOF2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwMT3ezk/Ly0zHRdM4s0Q2PLtKQ0Y2NzJaDqgqLUtMwKsEnRsbW1AH7
 Au9tZAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_042443_381312_76EB8D1F 
X-CRM114-Status: UNSURE (   8.87  )
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

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..5b63a42c4dff 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -138,8 +138,6 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


