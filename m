Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSDIdMS2R6liY+Rg+fw/qUWZGerrvhAudF6jdSavCD4=; b=xPbmrK2uGifEb1O8AAhyBXTD8M
	EsGJGSBtB7IRJ/tSEIaOD9ZaopPVskuZKD4Gvcs9BMWC8lSK8uE2U5/1UhouQuKd47SmW++PNXul0
	yEsC6eG/tEALR0uaVARVHPJtujHKfmiu+kUNu1rk753krH83WdCLXyQ4SdU0mt5ryD4VY8mDMjrml
	EgT3sfnojK64X1zNoXkaeOoz9nvBJIMq0YlPGq0g0qV0qTQAhsDXozHrzNn8OB6Ld/LbsmiIPf7FJ
	wmCAlqKmxD/LmhDdS/hgMAAEDpqR8Osec/dwBceBD8n0lSG4c53WUgwGx3qfvI7xGlLDS4Ii350gW
	LEmeQv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Xtx-00000002nQq-29mq;
	Sun, 20 Apr 2025 16:52:17 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XqC-00000002n1e-3q55;
	Sun, 20 Apr 2025 16:48:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so384495666b.1;
        Sun, 20 Apr 2025 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167703; x=1745772503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSDIdMS2R6liY+Rg+fw/qUWZGerrvhAudF6jdSavCD4=;
        b=X5vzDsZo4KhgvgpnRAR/DCO/eRRfrdW0pNCaQ5UTqE+J522l7DdiufLesELQEMlBu3
         0w0AK3+A8l5Uks/IwRqh/0V5VR6THhO4U3ov7Qd76F3GNOKcUinfZUU/vO9LLYIikq7N
         DjyfS2NXP5/LeWJE0Zz2n2av+ZJD7G0cT0CL3Eu0vfKcPgOv9BIfJY+D6pgyhpWQgX9j
         g0ncttShS+5tupVNSNioxiIuJZg+iXwwJti3YwV9PjhbMVI3kvz4q3/w+LZ9phaWmdgN
         7RCxn75COitlPIlTM+ujInaAbt4dmP2Jw39VfzyU5McY6e8XZ7L8PabGQJ3wAimOOocq
         yUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167703; x=1745772503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSDIdMS2R6liY+Rg+fw/qUWZGerrvhAudF6jdSavCD4=;
        b=DPAKl0KH9Y4CTDitNOW8YZ/OH5kNagStjYVXiuoUNH6hWwn2Hob9ebzBNkwwiUj5Ag
         PsaUtDsF/WR63Xiv51nVSPiNongfiph3pR9kXfLvkQAzFm5xTwJ96nNIQiziRHnAqfLh
         /FHMbZz5o7IpLxGua/1oNtflQzLwQqPlcVvf85k5vS6QVyWIQYz8A/bsY2E/wMwMEZRy
         mNR/dDgbHgqErkWEVCjemMulHg2q64J9I6yKjDUdAJ+2ErMJHy3hRpGTPw/Hh+BQRMtT
         8pmTsO8nRwigHhP0asUVVbKddvQPM+Enmn0Bwr5tFS1K0DKhKMQ9CfgCtzA1cUsWyrbA
         BhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXBVk9yL+/bpJs3xEck6cmsm4ouZH1Db+24MSyUjucNflNjcwuIg6ItWmBOEeYU5kcf0jtzyp+MbtFic5+/0G@lists.infradead.org
X-Gm-Message-State: AOJu0YzW6nCWZ219XKe/wGhKjKhUyMbqepSD9gMSrnUlUOblJfOOzl/H
	E9+QJLV9W7EZ09P1SHlZgmkY/LIxDH9N85baB6JtK4e+sKDamQjLc+Um5w==
X-Gm-Gg: ASbGnctfO0Qal07AxTeCVO/1QWnwbNKcG6tpNFfghlGi1QqkSfh5oVk7oqD3QLBfMqw
	SiGcKii6J8OdGn/3rjDz6sK89OMPsZDt2JOXIv6LGpaT/HUZSIVvn4coXNYJ3/0ljTWy6RrzgC0
	jn6kuJnMhf7y+URyJO9LIQwivrArzrmuUG+BzafZAT+yVlncxpayYJC1ifrbvzwbuFGaeQQjQzO
	tilJraSNXlvfVq2CKxNHXZo0C0Sch8TSwXvGaYaBcGc6LtkGASk108tq8L8XMkWtREhkoymD1iS
	xlUUFPDtsBhPLykDeyjnika/ZEYhbg/NtMa+lm3rhUkHyZJjtKqQ8vCVSh+IOEFobl5nxDJsQfo
	4ehgAetjUNCFFvDNnWkfzsPv3yWMVLHl7MzbQjvIsK/+70IJu/MnySOKl9opr4XHINw==
X-Google-Smtp-Source: AGHT+IHDqZGR/C4pyAoG+Pzf6q71gs+2fbe1eacbY+0bbZd64TmYxRfYf9le5qi7eevSgXvzJtxo2A==
X-Received: by 2002:a17:907:7288:b0:ab7:cfe7:116f with SMTP id a640c23a62f3a-acb74db6d92mr846438866b.46.1745167702517;
        Sun, 20 Apr 2025 09:48:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/4] ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
Date: Sun, 20 Apr 2025 18:47:58 +0200
Message-ID: <20250420164801.330505-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
References: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_094824_953679_1DD70087 
X-CRM114-Status: GOOD (  12.83  )
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

Device-tree expects absent clocks to be specified as <0> (instead of
using <>). This fixes using the FCLK4/FCLK3 clocks as they are now
seen at their correct index (while before they were recognized, but at
the correct index - resulting in the hardware using a different clock
than what the kernel sees).

Fixes: 802cff460aab ("ARM: dts: amlogic: meson8: switch to the new PWM controller binding")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 7fe0c7d3ee6e..8702941ec2b1 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -451,7 +451,7 @@ analog_top: analog-top@81a8 {
 	pwm_ef: pwm@86c0 {
 		compatible = "amlogic,meson8-pwm-v2";
 		clocks = <&xtal>,
-			 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+			 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 			 <&clkc CLKID_FCLK_DIV4>,
 			 <&clkc CLKID_FCLK_DIV3>;
 		reg = <0x86c0 0x10>;
@@ -705,7 +705,7 @@ timer@600 {
 &pwm_ab {
 	compatible = "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
@@ -713,7 +713,7 @@ &pwm_ab {
 &pwm_cd {
 	compatible = "amlogic,meson8-pwm-v2";
 	clocks = <&xtal>,
-		 <>, /* unknown/untested, the datasheet calls it "Video PLL" */
+		 <0>, /* unknown/untested, the datasheet calls it "Video PLL" */
 		 <&clkc CLKID_FCLK_DIV4>,
 		 <&clkc CLKID_FCLK_DIV3>;
 };
-- 
2.49.0


