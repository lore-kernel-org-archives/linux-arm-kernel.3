Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D80CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uELcMz95SDx5Naos81L9lhwHxN3ut3w9N0e/c+w86TE=; b=RnWBq+OruJTupZ
	LiMtUVmBeZIEu/gBe95LVeMTabPt5jQItPDyIp4/uvY4eOMYkL6sDnt9El//FUAicNU1w5VfgaxdA
	XsixNKQjdBkXKJVoBCDdyRDwtY9UX3hUO+rx2jg5rpm0gc6wNqxXYbwmKCJWv6kmkJhAPH/u4cFwn
	y89M4hJ/Qm9F2GfGLar7oKdi/B954nsMKsuILwjj2IjDVgKve98944BfFUhdSFCsrW9EjrtpY6FGi
	4iRSWaK5ryyDqVgb626EN+rcZhYKKCiiHxG6xJ3Jl5coKwCuglozKzd2PcLYMHzJZbcx/OAHhHFxD
	KOwVDaK63M1TFC95q/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdw-0000000GqsM-1Xnt;
	Fri, 07 Nov 2025 08:16:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdt-0000000Gqr0-1KiH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4271234b49cso54094f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503379; x=1763108179; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uELcMz95SDx5Naos81L9lhwHxN3ut3w9N0e/c+w86TE=;
        b=otVdaxUnxqNBb8aNQmDwRFdIKn6npUnCQ+8Jbv65jUH2Vk9Gbd0LPTlzK8ghbCq+rF
         TZ0grAGeFvV4BnGrnucWw2prLcSm7Ig4yViydi1yaXY9KQuXCDcgcG+4hV7/FX6VKUSh
         TW8/FLrE/oe9/bFvY+zF4HffgizQqKGVeV4KunYg7rMnL2jYGMzI1XTA73r4njIaMQUs
         k7kBpp5GmMPMn3ci+SMugjuJEOvSKCzqXRi6PyqBGmgwxgzy8nHOu+6hmC0QmyfGCG7A
         BlBEyJv1KedpFIVSQfeqUYNnNpA6VLiGke5RQECYtUM/CW/d0CCPC7WDDzzKisb3+rjU
         Lr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503379; x=1763108179;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uELcMz95SDx5Naos81L9lhwHxN3ut3w9N0e/c+w86TE=;
        b=RPeRpNbKP0yj2izt1funF5vMxjEAaZn8te4a+4GzJlg+rbAe5LF90t2SItBNk/Z8Fb
         6ulnYTj0nzJ3+CZ8bKusMUzA82BaFb+bQ29CErb/5+iHQhSyL5TG3Dxl6rbumoPeg5cv
         tCA5+bL48/kP+f7TpdyagRqwpi0jaG3aD6deQPhh08TwsMoRdZLC+ivXr5rQ5ta7Xr/k
         Ffz0lVLm5IBzOpYFNtUKKgOQ/a7evl8PKt2vjTwogK7JcLBW/iCg7zaXs1baP/pf/8m4
         1TOkepraYuJJXrkMV6MQ/Dy1etyiiULB2894RP3SjR3m9rw2QgTUbnbYT0riShljabp4
         regg==
X-Forwarded-Encrypted: i=1; AJvYcCUw1wFG7ErqqN75mPhE5G/yidzEbAChvk4BGkIHdBCUpIY6GoWx13Lb2Dc8B9EZQ8QzkAV3BzYCqqL/n/xn7J1I@lists.infradead.org
X-Gm-Message-State: AOJu0YyyzwXfzHX6ZNVbkBooI59dTXDmc+gJ+AlxqT1xV5zk2lWwem6/
	y8F3VgD7W1Txnrm78LEbn9eFmSHaBrqy4MP+21wpcECbNG+kSzdG7D1i87but4xfwDM=
X-Gm-Gg: ASbGncvmKqmrTxqZdkrcON3GxJITinyl4XnYpICXr7oBJL8gdzfrX4hfIKEVK2kik2O
	A+Uu56jDHCRkLvUeak2in25JMr0mfj0QjRlz0Jl3otfgR2awxXknmJUvTibn2tC8ywfikfcpRPy
	mXZJXSUYTLm4R6b+l0hpmmNLeXcdc/FAtwXc0S/9gDOyXVagkDVCfrhu/GOIec3IA5m8Au5eO98
	SqprDYrqm1SecHGNbEVIe3CwLWv3euSpMV5jUjZOvxfhRDbcxzmfn6waERzlacNd9or2Ik+x/Tn
	c2wIN0GzAs/pw2G0WDLxEAWPKuS0z8Y/tYUnIVvI7hkSC8SZRq39ebcKRWEnS78uC3vVG8wte+5
	hvgptVUrQZr2wLYIFZulAIiIWsl4PupyL+TBj7ROpTXSlRJfjqDvV4yjf3e3ZpwZnfPeGS0ExSb
	aSU0Z9m39iFC9x6q3B
X-Google-Smtp-Source: AGHT+IEmTubZGMZAqxPOzEDTzxTbWpyiPD1tGLIDI4W0EDrlhrNtXRyln+2uhSIlbuv3XI4ne4/N1A==
X-Received: by 2002:a05:6000:1ac9:b0:429:8b56:34ef with SMTP id ffacd0b85a97d-42adc6779e2mr960634f8f.1.1762503379288;
        Fri, 07 Nov 2025 00:16:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/6] crypto/hwrng: Simplify with
 of_device_get_match_data()
Date: Fri, 07 Nov 2025 09:15:47 +0100
Message-Id: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOqDWkC/3WNQQqDMBBFryKz7pRkrCl01XuIC42JGWiNTCRUx
 Ls3dd/le/Df3yE5YZfgUe0gLnPiOBegSwU29PPkkMfCQIoarZVBK9uyRowe3/1qAxLdyXg/khp
 uUFaLOM+fs9h2hQOnNcp2HmT9s/9bWaPC2gxk7Fg31vvni+de4jXKBN1xHF8uZyb+rwAAAA==
X-Change-ID: 20251106-crypto-of-match-22726ffd20b4
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6fu4Rw4bj7XVmwOpfJbywUk5eKU3qQ9m26JubATgidk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarIPqzE8gYmyIPgpBoYUentmTYujrqLdqMxg
 nfDq2usrU+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qyAAKCRDBN2bmhouD
 12KCEACUfEnZdBiPrZ7Cu0XbGMjd8WCKirw6LS0rhqjmqk4qgMZn0fMly/hwblto4whWYMhRsBZ
 ys3Tb/UbcQQMbinVZgziLOqbInfBHaFUecVyeF521+hCZItEPfWpDAsVFfWwhPHE5iKNWiGMmkt
 8oXBzKjseiW7GVG05X3aP1viMQSp0gFmVHh3S5bBCvzdq9z/KYnXRzB2LFWtHiLszD9vPiL7pqs
 0mdHHniffE7yFArO80ordACeBVz3NmtZf3gzpn47xISAsUWYbq5HySBwmDrNkwU7v1g8xPhT/mE
 gGqatN8oWz4hF3OsNKaJTn87WflOP6+9kZAL20E1/71jqCjqp0pKtUqFFSIQcCtfg+eu3hoZQfm
 ktxHq2mYJpPt8X541b1RpXnhH2rMm5DnCe8WECuzryGWwKLQTGUb6dlDGa3VxxzThrXvAzUBjLV
 RCVP4k1Qo8FRkMfC59x4mx1IZ49TtkVeaWPG4jY0ynHsoLhWgwQjLV8Ze09GotwIUFnAXynrzxS
 PDF7qzP3whKs36GWIqdKEjcBDC27swLKyQUk2J3dhqdsM6ur7hNd4h0sl3IryAsKuVjYxp+n+yS
 x8l9qUc/8+duaze+NQtnrdbnNQVfuQ6B5x6QcOhErB7qXAtgpLHlOz4pF8QwCdKYveStDDlpY9W
 ww6MQooeLXVn50g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001621_385273_A7BEF5F9 
X-CRM114-Status: UNSURE (   8.38  )
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

Changes in v2:
- crypto: artpec6: Add missing (enum artpec6_crypto_variant) cast (to
  fix 32-bit builds)
- Add Acks/Rb tags.
- Link to v1: https://patch.msgid.link/20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org

Few simple cleanups, not tested on the hardware.

Care has to be taken when converting of_match_data() into
of_device_get_match_data(), because first can check arbitrary
device_node and the latter checks device's node.  Cases here should be
safe because of_match_data() uses 'dev.of_node'.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      hwrng: bcm2835 - Move MODULE_DEVICE_TABLE() to table definition
      hwrng: bcm2835 - Simplify with of_device_get_match_data()
      crypto: artpec6 - Simplify with of_device_get_match_data()
      crypto: ccp - Constify 'dev_vdata' member
      crypto: ccp - Simplify with of_device_get_match_data()
      crypto: cesa - Simplify with of_device_get_match_data()

 drivers/char/hw_random/bcm2835-rng.c | 11 +++--------
 drivers/crypto/axis/artpec6_crypto.c |  9 +++------
 drivers/crypto/ccp/sp-dev.h          |  2 +-
 drivers/crypto/ccp/sp-platform.c     | 17 +++--------------
 drivers/crypto/marvell/cesa/cesa.c   |  7 ++-----
 5 files changed, 12 insertions(+), 34 deletions(-)
---
base-commit: cec65c58b74636b6410fc766be1ca89247fbc68e
change-id: 20251106-crypto-of-match-22726ffd20b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


