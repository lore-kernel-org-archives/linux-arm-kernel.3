Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB76C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=; b=P+FiljU3olwqXlhjPlJLfBZeUr
	9uDynDrN3Kdh2wzWWHDXljQGbnyQxpwRHupBBAJyWmPwOx4yMJCSs5RgT3bGVrwSwtaw1PNDOQG8L
	wWt2+coOCP+JD1NyMohaz3McAEE5FLJ8xJCvsHrfftIw64gjCHik7xVWr8IShndOmxOjq6Q+l3hVf
	CNJqaHbWA1lICLVR9XuB0UrEfDv08NVrMcrbCG2xILvlxTgUEP6BSfb9bPG4hQbTk2yxzLveVpyHp
	DI1ucudHUBxDtue9Upa5MlNiVR2p7osZc1clmNIXd6iex62okL6eztfh+12GiWkCY29/21gllluKl
	ohw04Drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVZ-00000003oCi-3cGT;
	Thu, 02 Jul 2026 08:10:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVV-00000003oAT-31yU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so853811f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979848; x=1783584648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=XMhUM4sW8EkSYbvNs2P3Frl8BWa92SYeMx0sxpnHUinx/qc9mah953nbWiD0fGvbmC
         K2PUPJTG5IdNVN0OFGul9+DVDHuZvGFaQ9c6hGxjzsbMzsOSzOJ4lxD2OvP5Zx6lAAo+
         jn164YaaoJ/qLWJoZWXRXYS0Wih/lrmXsRynKlqRdLV2N+W45CXM9ZYw8vz96kDpJRNL
         I+KcXsyrS2UzB+ER+AJxnznWLoCpmEUj/XPKjyCQJNpitpOM/z2f7gIpheGibYX6XCRM
         luE0xmm05IiaXKJPCBcMw89dPXP3vkdX97LT9uNx3Eb4wN016bf4UZm8fe2r30COKNvL
         /wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979848; x=1783584648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOiiEpGpIC5lxOzEa7sAsZH1/Y83nzXYTBPvtikqmXw=;
        b=SzUjL8Fo6j0rUL9QuH7xxjUVQATzuQ+VXNTJ+kxRvGHlk9N7OM/rUQBz3iaE3wM/wH
         PBRdMplJqQs27IhYfXvL/KpmVkVm4KQXigIWHmAv/fIZegi8l7S70MBB2fBKXmO3YfkF
         jjs4DMK1FG0weS2yZ8q60bhrqmtTLJ0fgzKP99U3vcx3avxx31l7tahDaLE+HRNUa0ZT
         g+rKcwniKxEikvkqC/6ylkFc4VyyAEOrBTxa6XXp7qiPIpbUAUryhtQ9Jnw5Et3eBLgF
         XxKDJzXIJDgjUuvLA+3Yj/fjiAFuDnqfuARQ2psne7Q7JvPnQQ/vzQYIROQWsk4Klhrn
         AqQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom4UAT1GfT0Ba5DXiCe1gzo3SBhcZy+Vp8hvGmD1U4qqvaoyVTwIeOjuKa5+4x3LxTfZ0O+H3h3cQghDsQwC1b@lists.infradead.org
X-Gm-Message-State: AOJu0YyAanrX9jnL45Ud2I2H1nNASC2sHhzJC6HhdBS8nZwy0SCZjj3O
	892meppw2apJynmNO5flweqINV7rHvr4SJMj5WZHZ2gmFUYQu49jRUrYJ9omknRDvm0=
X-Gm-Gg: AfdE7cmrnGHW6qFMi36hZ9O8sEiBcKJd2sjXfZkOg1LIZQeScR/bBomLzC3yDRB7HEk
	brDECvjYVmef7Bmp3bTZIFvLUPBkYu7B0KJW9sme+gwI+jS13snykKTtYlSVx85ktuY/3/ZOT62
	tTqykZj9HZYCz921LcDUKzuUM+Xa4IwOoU7d9emZ9hLxb++Qa4Jue0pgEk5Kw+ESawQpO1Hxo6f
	pGuZ8SYeaMq3AO9Cj6KhWRPUi9T6A5K9dSht5hYG9d8ejphZYv/ilWmEZ5p5LidOMWLbDgMvkB4
	hYrEwoE5c4Lm1LWpSQT6pXplsKCqpAFZYbROhypwP5Wm+CdQpNhSj+AbNi1ZTMlR4OQzCafbK3M
	Dn/v6APWTsmBK6x+TBmfGuakUwcg1lB3iM8dO5AXxPjaczG4DAHQPXZjIlUxI0xPHhUhjDo8IWx
	Mix4LgnsCX8xs=
X-Received: by 2002:a05:6000:18a4:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-477588e7d03mr7472094f8f.23.1782979847883;
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477dd94c829sm6374826f8f.24.2026.07.02.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:01 +0200
Subject: [PATCH v3 2/8] dt-bindings: rtc: sun6i: add sun60i-a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-2-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=CzBUXV7sOVhx3D4ZGCj9tufXm0ii5Jrd89A5CtNYTv4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz3c3Z+CDWtJbpQmgihyGCywyiqoUE3JkQyt
 6xSTIHXDA6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc9wAKCRDm/A8cN/La
 hev+D/9qqaYp4+SX4EN+QRwhZL9SKx/Rjuxo5TLCmPxSfNWP/r82A0hPjW8lkiXBaHr0JFpStVl
 jzHLZcQ93NroFjk9JyixfEnW2GKdPE/DADdhVBQBRnB8rwQxJHJWFuWFL6JrbU1MW9Wj48laRaa
 6cmou7Koc4vN+e9OClHXcB+Nw8NQ1okWbDUzwmbsZfMypkIyQnIPsvc/HX4u5tsUDCfVbU3x8+n
 iyPB2URXAHkgLi2muc2ZWr2FTnuSYE7rFOjsax5ymg7+CQzHWLED0nz8JFxqd2BaraF+Qeg95T/
 +fCm1g8Rjb4/vkW63foqIcmbd4PdtFdq5SPpcG5jWN8PXRcU+PrZ3gng3z2/Yl9+lSZtxJHplnG
 rM7K78UOnSYxqV0XZb75pVHjQSkgFC1JNOk+XtV3dTi1Oc7o21Twp4ct6qLAeJ5vV+WWYivLCPR
 t9TGq2qozq7pQPVtqppeCAXrgwi3U4O2bWOu3CYOv3ZJrVvXScRmFujVs8Gr5p1N5y4w2Rf9p/a
 3PKVMaOyiM1tf8rUsiCGqyl8HffUlRS/Ih34/QYfrutYr/EJfx7lTzxu6Guntcq93hoEVXn7vsy
 I69t0vQV7mb0t2d+pLhEXvDPk+OaCQ2lD2nOrPz0aMGgCg8r/ez2P+dYIfEpxKh5fqfbk1zpoqw
 3YvXKzSzMXDUKZQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011049_781824_81D21CFB 
X-CRM114-Status: GOOD (  11.68  )
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

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3


