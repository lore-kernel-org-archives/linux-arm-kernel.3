Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA86CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQBlUaV8mHeTuGtQUKejSKsUaDFp0QHBYZs9jo/l+EU=; b=W3639lClAXZi6b
	P5UG1nmT8aL7QvJzeUfd20uV6OxC5IrstVI0Os4IDrEuEv6vWXbvGDQQpkast7tv1M+m9V/IAuiLo
	rjtppMMP7HivgBCjYkoGDMkyopdF7VKO03V6hyZjnWNV5OKLb9qIMnRikqguFa9PYa/Cd/LnIWQpO
	BBpDPEg2xvzXwWC098cb2+SIH+CFwJjZeUSVqivaFgaZv1gNmHh9qUHuikdqZAZ9dnunGnEejSgtw
	Qa+xeJTl+Qv+vpx2RnRCoVSsH2wO1UM78ByRqb6h3fayocNzwv1hm+JmPcxAyDQ8hA6uyIvyY4F6h
	PCS3lQkSzKnuJ6aa7lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2u8-0000000FvqL-27Rs;
	Thu, 06 Nov 2025 16:32:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2u4-0000000Fvnv-3rKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7128683174so17196966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446723; x=1763051523; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQBlUaV8mHeTuGtQUKejSKsUaDFp0QHBYZs9jo/l+EU=;
        b=DrmJGQoP2X5iskeDA6itbDuLmW4aR3kLkJqRlasvPT3uKaQNEv8JdxulwYWBMwNVhI
         8/JJPj4kE+8Q3KpAn9pcy9OVTrJm9vKPNf7ebEMvf1beomSLCEcBfPtS3ymZaKmnwr56
         X6khfdLy6AJZcy2xTsa0+1OfTpQnxyZmajcxVF0wVtoFEjXeVzgTyHfvekFszSNK7opE
         r6ssadzRFDze+RdiIIiJrZZke5CM3S//ArBrd4qNffQGvVbvnzUZ9IWWZB4XN2t5DlSD
         sf/4+rBxV8d8+bwLJ4xFfoUpbM3bviKa1Do2UBA8o7C2isOZi3ZUE1oWzoNMwB5kyp+Y
         uxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446723; x=1763051523;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQBlUaV8mHeTuGtQUKejSKsUaDFp0QHBYZs9jo/l+EU=;
        b=IKP7bH8PT4XhnLK8sSYJJfb3mBzZRJGRhlAYAgWzUz4IKL0AzXCLEcf1KYZvSSsLlP
         owoY6tijHmH+az2YfF+pHKwfwhwsnIJyCU4TmYAphJX31gOg4m2X03jy7ZWWz8Mg0dHY
         b4tCuEqo2Do0zcIGHEUpRdrtUdiI9ds8dRiK8XQa+NcOItwGQoygxhFjLHKD3ZSWuXxT
         1ekww20oZ+rXzd2zRmUyMQBaKt1OUyDqcFkObJBwZANXMmrhS9QWxWVRA1Q4ax+PM0dZ
         Or2PveasnOppzK1gLKiBfsTr5I31p/+mHE7PHLAOGkrQk5L+jtOZ/lErXEI2q51ev7YD
         N5vg==
X-Forwarded-Encrypted: i=1; AJvYcCX4PC9Ae/FzRTZ+3io1GFsjD3TJ39SlBQVutaFvI5WjyMIOHLwH2QqQKlH2q6UQ/9lR3p+X56YfXFr6ABkcN6rF@lists.infradead.org
X-Gm-Message-State: AOJu0YwXc718+KghzmUsH2tV9JUz6r0/PkIbqgOIk0g/Cy+fCV/mFjVr
	Vb5KWNac532xMWhyVSq05rXNMN671qZJ4l2bFx1QLffGB0xyZoXdrl7NY1XQ0XVshec=
X-Gm-Gg: ASbGncuFV9nPGufYrXuTu9qMRmlOpHg8CB+yZngXk1097jJ+RnTUhh4xB3YpatWBvKR
	E2ApXivc2S+CeYFTYFR9Z/PZJU/ENq6JuFDDpVDSc1VwQ7aIz8isZIZGpuvyjRo19cxfQwvYB0q
	X0iEIm3cXXTorQmnxr6Sjh4BYc1s+OHbBfOCyyvEErAvBy+I6EEcrOSPkI15Jfn9FDGFu9OLCzS
	NjMlVZwK1pLXQeCqTxMK/4SgL0IBkA62fLn5rzqM61RPNGO2Kh+fgOzubjG18nazWk4F4WmC3ze
	8J/QzbkrFKzej3V0aLAA/TestgW99qXiVgLBh+a7QZwkb4KhrgYw75Pl4zSX0TK5345YEVDsQ3f
	baZaCASLfTSb6Qd5zsxWmAHYClGh/6RQa9RQa1u4IXY1g38v4kKZGGOY+oMIaRuDxEwrPzHp/IZ
	LAe8qpLLnHpC3GA6AIEL01Pnp1QyM=
X-Google-Smtp-Source: AGHT+IFaJFGgKtpOfjyJyZjnu6imsT7N583yoy9FXtJIdPh3n6YTMEucNPOZE8ZpXrIC8xcqZHTMPA==
X-Received: by 2002:a17:906:f34e:b0:b72:6762:f76c with SMTP id a640c23a62f3a-b726762f87amr306427566b.5.1762446722811;
        Thu, 06 Nov 2025 08:32:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] crypto/hwrng: Simplify with of_device_get_match_data()
Date: Thu, 06 Nov 2025 17:31:52 +0100
Message-Id: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHjNDGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwMz3eSiyoKSfN38NN3cxJLkDF0jI3Mjs7S0FCODJBMloK6CotS0zAq
 widGxtbUA/Gvy/WEAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=baW5v4LiXQ29IowCK0UwIQQ6FO1aSTxQN7dB9lPn4Ww=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGkMzXqhz9TLDI3aAR+DBM6TzDg9T7YbMFtedDKOWlzXoGLMP
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpDM16AAoJEME3ZuaGi4PX/DsP/ikj
 8d5AdXEKvQqdeiixME5VLLoqQzb1CpAY1z5OBRhAsVBqHCJbeV6UZ5TtBUk4TeBMb1O3TLsCOk2
 hCeA95G51Irgo3wFG9H19uFb9K9SgUOXexFuv013deXvqjF9MXv+Lqjz+ahaRge0mWDhpqJVTnz
 yabl4NqWMTzzu3JeP0MvnDhN4/65fmtGaSv8nnYezNSb8GuscDH74rO5erp1DS7KdTXB8/Cbvyw
 /QQ86RtXYbiYkN6EwolAI7YqWHGXQg7eKhp0Wska/sYwh7qh39XHgASx3R8Zrf2qgyJUXTSUGsX
 QYaiOT3t0gjzStMjPMv6XVPN9IIIOW+mkTRDa6ICEuvyHrLrC9Hzsex815WCQQ1JiplUM6810Fu
 4b829gs6JhbUHqbQptqPPMSbffsyf8HyAC2SQGbXuF/yKpPh5fkzR+xnsIYypsJ6aNynObVOozg
 gUG0thCuhQju5aPPXDRU7IEuQOgWrYUoekn9Dx4HfoctPvtw/JMo/pYEvkPJ4zSXDZ9ZGKfkvz0
 dia4w8SHW5bBRpSbVlb6anR9NTfLvlcZrH6socpQ/TzZMby86F6IN8ECn8awltWzE3MGzsD3toq
 gb0+rlWSAR/Fv2lLwnnKNDbtbNPOW9A8+DQJ7RhK70U3dMQMYSsbG6yvyEu0Fpk57pSSqprfj5I
 nqnpy
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083205_066619_B4A53765 
X-CRM114-Status: UNSURE (   8.22  )
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
base-commit: 8297f2f148634bfa98b0faec66bab14942801d95
change-id: 20251106-crypto-of-match-22726ffd20b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


