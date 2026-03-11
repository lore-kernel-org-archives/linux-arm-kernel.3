Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4721125851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=avEg50b7lIE4cReK2Q5lP00wp15UEOQn11C/oczabmk=; b=dPu/smK11D946YDtzo2HWgFu9Z
	EQ12gMW2t0Zkp4fBsAMWzN1dX3NNnVch1Xaw7pjOKwb+gsbdLL80KtzqR8xglD85C9zv+8uFD+f42
	B6K6xH77In1932dZBfo5gQ0vz0XhjXkFE0aGkGM8yFm06rp5AVSRMfubI+Vb9zCe6O+T3Bhl8N5QZ
	rF9YNoVUL4V/dHDlHqk1kmsI13tPnwq/cqqWlWn082Rj8QoT7fyN6LL7uC1Hn4u6dqLsMAI0Cj56o
	nfdL6SOVPXcB3uMhCC5oqUpDXToEg+w/jR1JzBrtLOKWneh0frF3tbvwgRDBEAI/mnUN8wGDdNcpE
	iW/TKt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MMx-0000000BvV6-2K0A;
	Wed, 11 Mar 2026 16:25:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MMu-0000000BvTx-1UfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:25:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439bcec8613so43574f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246306; x=1773851106; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avEg50b7lIE4cReK2Q5lP00wp15UEOQn11C/oczabmk=;
        b=LrdXXaY27gw4pkamSCDgPouze0sfApBwk86tjLWl6jzw1dCdFa5wqtbbEwqG+5T2Og
         8K9XO6+WkKxD9ghmYnWKi7dN/gxfelw7Nv3Rpg3XvIlWGc8hnN4V87GY9bkPhoobF1ek
         fc7qsRtLMubRqbWPn9eRFakZiQrJmdENvRzKJRaw5X8fyWqu6o2ygpXHZi9HY04OakH/
         qg17q5y3biqs2PNoIydM/9+DhAvFGZyd9sKc+qPLXj3yBZnZeJ8hm9EQDXYMsDetbBwx
         9x7y05fOhYP0YbUGOtBlRASXWfqezZqsYAdwQqYFxOt0h+NBGhTB9ma+SdyynP8poZmK
         KIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246306; x=1773851106;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avEg50b7lIE4cReK2Q5lP00wp15UEOQn11C/oczabmk=;
        b=h9Mjv6/LjnYjNenXgJfEKDbzzr2lofZplsnc32W6AD4T/PkG5lAMtUyUC57Dc79ROi
         7avJEMWVEj4s5/+UrE/iPFQw89M1lfbufrn6HwNlJtUw8TK8fHJigjeac/JzF+CxhJHP
         CG3T++d1VxEG2ics0nH9Qdm6Tphhx08s6gVChPDGZgZYpqlr3Swce9/Htf6X6N0mrHGu
         5teeX9aDoKTlucgTBoOQY0T7PhtoLYCAXZd7jymb99QxEVNoZleBN8rCOAP4c3ueIJ/2
         RnXxHkvcfJm1YQ+rmrNOeQuQxHgbxyhV9nXddVUEkPZhfjByJzre+YIOUg+yKhIQzC1f
         OhTw==
X-Forwarded-Encrypted: i=1; AJvYcCXF0eHcI9YHyYX79GuBpAxJkNyPGZAHnFT2NNUmHJ952pS8Nbw2MLPsR7JqB5VieENmjNrW4b6ieSsQIE+rH/hA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvm9rVNcLMCxNMqyeD/6PlmAuSuzgAbLCFzTEFzzvCd0Z42EBF
	bSy25kydAxhQN1RW3nqPKPyJAtMp9nBvTFDs3pBilwXX1XXDk6mHXktaXk3JWG7px2M=
X-Gm-Gg: ATEYQzxlTQ1XnvW7ZReSIcEk1tDJN1OB73B0LGBnOrg78znKTxtODudO3OUqGH7f03L
	sq3luHMhciPeAC4wK+1rcL55abDTpfDaarq4kXUxdQh5m+rNcXsYYp4ch9xi6yM/UUzWCu13Ze7
	bRAhBSjC5JbPJMB37Lh/i3VkCit3CLilcFtXB7YydMI8QA75ytuquEnO2XAwYjKFs+0pqi5XRi0
	cAIvt94L0rAldv01JJ+BslXesrql038C1rKIgkdFxU/XHNrZfeynCfEold3SW1oRBjN2AACAOkD
	3yzk4gUUAjfU6AefoKLLWFtOIG/eEim23EpuWM6+eW78CQnjYv1KDQx+mP4rexqq0zudxXy49UI
	abE3OTfXCbrIPU0mTLuT8V9M7NKdmbfYfT5RoSnMOK3JDsXvrVBlVn1Fnpyz4WQ4YrsYT5MAWGP
	Zg/DwGuV03A1fEHda3lyg895M45e031orWyiWBtkClzsMQLMqY9PHLzP4Ap4VgWb6HxHq90A+xz
	WuSoavLr+my/iKl
X-Received: by 2002:a05:6000:200f:b0:439:b1d8:6084 with SMTP id ffacd0b85a97d-439f822334emr6514903f8f.44.1773246306286;
        Wed, 11 Mar 2026 09:25:06 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm295946f8f.12.2026.03.11.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:25:05 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:25:02 +0400
Subject: [PATCH] arm64: dts: rockchip: Add analog audio switches to RK3576
 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-evb1-audio-switches-v1-1-0e0199e56c80@flipper.net>
X-B4-Tracking: v=1; b=H4sIAF2XsWkC/x3MPQqAMAxA4atIZgOmagWvIg62RptFpfEPxLtbH
 L/hvQeUo7BCmz0Q+RSVdUmgPAMfhmVmlDEZTGFsURIhn45wOEZZUS/ZfWDFuildVXljHFlI5RZ
 5kvu/dv37fqkBMDplAAAA
X-Change-ID: 20260311-evb1-audio-switches-573b44c22b16
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SrETXia2AeuYWSUIAN84IRhX87WCsAlPD9OXpI+Iy1o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJ5QYZZe9/vcC+Z4I4+nEXcWqG569EBsSvXas39eb
 cx4tFpftGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICplt/CyLDDZX9yyLZjW7p0/yVWPDXce271/yYzt2XGv59qrp5q/PwjI8OpMvs
 Z298ebLCcyr3JUJqr8bOJ8J7KiTM8N0pbxogu6WYFAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092508_437367_968594A9 
X-CRM114-Status: UNSURE (   9.85  )
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

These allow selective muting/unmuting of inputs and outputs, as well as
setting mutually-exclusive rules in ALSA UCM.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f5746bc2970b..fb0dd1bc5148 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -270,6 +270,7 @@ sound {
 		simple-audio-card,frame-master = <&masterdai>;
 		simple-audio-card,hp-det-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,pin-switches = "Headphones", "Speaker", "Main Mic", "Headset Mic";
 		simple-audio-card,routing =
 			"Headphone Power INL", "LOUT1",
 			"Headphone Power INR", "ROUT1",

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-evb1-audio-switches-573b44c22b16

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


