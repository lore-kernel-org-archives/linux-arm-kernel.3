Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DD6C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EZphEP1aVBZVI+sCUTh5FGIjIPbG+M3yCoLuytV4vxw=; b=AbGUM+nOaWZsZoyBfwZ8Wy2nfI
	KwkykIGN7sW7DI2vlcr8Pn5HkvSuFXqwMPqc3idQuiJ4y5c7Q0y0MWo376iNvRQT3HpWKtPn61dc6
	OeMWzn4YSK6ASZsJME2Ko+p7d229jMR61efFKL9QAmMFrJO0gVxkUa/KI+wtjiNtXIkEfJbOmUAnC
	Fn5kP+mmEDVqdi/oJlal39E4diAiLpt3rbqsVq6ekdkijoXWOMLMXFD8HIm62cL6kU6kq+b7gcq6t
	uVV/y3cochR0ZaFEtM47nn9oRuyUSFvWdqqMpWjZ6/3Q3v6b6webKmg7bjqR/BBVCnU6Arbb7LzcL
	vkbZz+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12MU-00000009Wl3-0Fho;
	Mon, 31 Aug 2026 13:47:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12MR-00000009WjE-38W3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:47:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-ca80d708489so2437466a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184062; x=1788788862; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EZphEP1aVBZVI+sCUTh5FGIjIPbG+M3yCoLuytV4vxw=;
        b=JeYmFRGHBNUP+tOZhxuBlGdBV05FswOYLXCerINDbRDIKbRPpbSnTFmvIA7HBRaIKd
         EdQjwFnmGQ7gPDYvp3hKuDdp0AD2mH3xr1k79TG4iPMvrGQ3etbOL3EkLwpXzmZiemdI
         Ptu0KYe2ZUMQGGKntLtqTDchjezificRMYEFj4K5tBwS4TmOSalUWsUCjsonZCdJDy4n
         CvAJpXFO8I/9ekHy0MWm/fIMOzJKCgGlvkjPdN6d1K9klhvMYfCYH1P8kn0rnr9wFqWL
         US8EEaCDtlhrgLOB1/xXFEwBOsnWtO2McfpktmZwx8YFSZSAh6/5nAUKbST7WfpPNpnh
         YtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184062; x=1788788862;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EZphEP1aVBZVI+sCUTh5FGIjIPbG+M3yCoLuytV4vxw=;
        b=fBRf5E7CzdIfjTW9z9lTBXFG9WFgq2Z/e5dLbXHghRgjtlBzHWA6ESQclXQrHyZGjw
         dhV0xGneymvPsCzzgrsefzfaN1/zWwm5cyL32RSBNY73OpadxqIP0XoqwKb8F+QCvTgq
         m6ZGbXgANUCTwqLpuVNY0QOiBOBnlqQDVqBWEwIsVbWWnO51Zb3YIMGsULYi9KwBd2hh
         E32dCdvMQ9Uj+yhGJQaIcnYicelu7zYlYvWvojidmWHZnBh3xmpiZSUO866rhdjzP7aj
         Io6Kj52aZ8mSFMBf1MKzAjII4OzhbKwRXu57EZeyyV5dx6HtT0lsgxgPVgQ9odnBdvNF
         lfow==
X-Forwarded-Encrypted: i=1; AKwUvByVFKWcj93HD5RlYLNO8KYNpTvG7XtzY5TE9uBvYn4G0XNQQw4cJmUcKLFx1+1xZhIgIcOKZNoAJGGm4JKAVh8p@lists.infradead.org
X-Gm-Message-State: AFuF++nJPNP2g8TPTbhZt3M/l6Yez+wyGL6JZc3AtKMB44VbYa7Bzdq6
	GqsdIbRwynavHyx0M9BjexTQ9iH0BKPzbG7YNsutV9bJ7jeYd3B3Y+Su
X-Gm-Gg: AYBFou0vfLOZEbLGn27Nyyj/x2ETdKWlM1094lgJU233suIhqZrhWVO2+/3a6u4tCgw
	aglJIMTU1+UvtOZLz21LrfOEzxb43UzJAPGeMpq6Xfcy22yWLLgxfyrHvgVcAxRI5ExTNlNnvAL
	DWDLoXtaGHechlDIpeSxhGgF0CfJs4e32sT6tI1FQ6CrClxasjnjaKobvR2W04FZoxDHQkycMfo
	vQ8sqpDxteo1Mr5bDzXeyypoxJrIINBaq2l5IZ2NSxkRCdFjEJ5ai05xGKeiBmPga6sak7wVeB7
	NrZc4ZeJYsyj+ErLdW3f3vJQ8QnG68h43z/CV6oVzLBW93JhhaOMKuHKtHG+khdG0M1HQCxWqxV
	pJmAjc5wmbEuK2oJ5MsuLBUgjqTVYTHk8dDgXMVYf2YLshldcS5NGgjcEc63WuhKsb8HxnhA8ML
	BGVct2wuNGOcYFTEqlyIY6ucg8tGF16Hc5Ce5oXEHtwwzfY+kwxzJ9PCafrV0PWp7QFtKLnCLv1
	DOnsbru6oShvRWq4K7J8yDL3XqR
X-Received: by 2002:a17:90b:1d0d:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-398da6f3ec3mr6720331a91.11.1788184062144;
        Mon, 31 Aug 2026 06:47:42 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm22051985a91.8.2026.08.31.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:47:41 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
X-Google-Original-From: Mike Hsieh <mike_hsieh@quantatw.com>
Date: Mon, 31 Aug 2026 21:47:57 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Remove nct3018y rtc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-clemente-remove-rtc-v1-1-84fc5787a6bb@quantatw.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBQFrxJ/nWAKGV0lWtTvVR/KQiWC6O5Jq
 2EWMw9FBEGktngo4JIoh89SlQXxOvgFSqbsZLSpdWMrxRt2+AQVsB9XRmI1WTc7xw00j5TLM2C
 W+792/ft+WksGJmUAAAA=
X-Change-ID: 20260831-clemente-remove-rtc-d37f77c8e0cb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788184083; l=1130;
 i=mike_hsieh@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=wbzWufdH1+05XeIF2UprLNnPXLOsM98m2VskYJzVc3M=;
 b=2dMXHa9BYQMJWRIeFy9+pcKa28XMr7eWy8ya+OnqUgbtTebVuhdxMyXh+CIHfidxvK2Vo6CpH
 UpkwbQS4uMCB4BS0St4Z0vIHonO6AJfchblqTsk+pnKP61dsaihR+Be
X-Developer-Key: i=mike_hsieh@quantatw.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064743_797638_CD1FB5E5 
X-CRM114-Status: GOOD (  11.30  )
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

The Clemente platform has a second source RTC chip (PCF85053A) that
shares the same I2C address (0x6f) with the existing NCT3018Y.

Remove the statically defined nct3018y RTC node from the device tree.
The correct RTC driver will be dynamically detected and instantiated
from userspace/early-init script at runtime.

Signed-off-by: Mike Hsieh <mike_hsieh@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 820d39a92974..51e90a4fba0e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -958,11 +958,6 @@ io_expander3: gpio@21 {
 			"",
 			"";
 	};
-
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
-	};
 };
 
 &i2c7 {

---
base-commit: bd35c4d64a566319bb5a151384eb9dbdf4b44eb9
change-id: 20260831-clemente-remove-rtc-d37f77c8e0cb

Best regards,
-- 
Mike Hsieh <mike_hsieh@quantatw.com>


