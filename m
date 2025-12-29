Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D66E9271B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGgTBGcNFuHuI4o3/AyC860PdSUNdaDSZI2EXc9oNpY=; b=e+t4W3F0abCnFm2V19T4/tuuap
	LLwNqcdA//e9x547ltjgwiNNA477LZVx4oLsF90pAQq2bI4+X+QQ8AdktNg6DsvrG/+Zejr2g8Wkb
	yS6GFJ1gwEa54CistlIE9/ldE4GGkxaluFisEsiSTo7spVd0hHWEIllQGk/ihRFCQ36qleEBGBaKX
	CFT8o2p/gxrKTOfZofNyLwMS3wxA8DjkRE//5Q4eXWz6Zy0sKW/E10kvykCC8jEm8DiibzHiga8rC
	T6pplXzdBLurNNcIfKHJ6jovQO4zEfDcseCpExRK2pNnHi+2f99VsSnuv7MYnuF7/ktUTcv9866P2
	O3EvYr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAF9-00000003YD5-1ces;
	Mon, 29 Dec 2025 10:12:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEu-00000003XwS-3mKt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so51748435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003155; x=1767607955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGgTBGcNFuHuI4o3/AyC860PdSUNdaDSZI2EXc9oNpY=;
        b=Rab5QDNHOyY4ID0O0RVeOohaUi6Oby8weFCTf9DwUHtKzO/udkpfP1SLygasValVVk
         +fdFfCB3ulQVUHydRtq17U//khgC+xE9WZdWtTWqNUsiGdKSVtp/54Q8D1rE2W/CcSm7
         USarVGXfwJxE+WrlRQj02ZuVstKI8f1uPAgHHUlFoDcpbK3gPDKlXMU9n9FDAX+bQNJM
         dynQWOOnIkceU/pDGyyqFi+RWJZUtSF+/t5ZgOGFMhXXTYLFi42Gd/PntePt6Xu/Xiu7
         M/PyZjYu1g1eteW2YPYiHa8Ha0gOAv9fL6JETQ21JnpURDSfbGnMgB6+fpsM7WMaU/pl
         t4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003155; x=1767607955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGgTBGcNFuHuI4o3/AyC860PdSUNdaDSZI2EXc9oNpY=;
        b=RevgS8OHrBfhZLhqa6NaZ07k5XxjbgZXFj9hk/LMD5BPeLg4Ail3IvgjjcQUDjHO17
         cmajW9mLnr9Zt6w91Pbo5ZdIdL6ik5cgiWPbXGeOnL/GYiA58JG1o+MbiraBbh2foHud
         ehxDGgsZ+r8cZ05LcMp0ECOkk/kSCHaaGv/TMVTUeBHSavEohP4KlQQlDOkvWMtoqVPV
         jGfazGigbF4S8tSdfOZ4hjb4ihQr3VINdwzgCyyYhNt5Hec++jXwA82+81wtbosFM5QI
         8P2mqrqNQhwM1B1OeGOkANRdq+wx7AD3GC+ZroqXok2pIhd43Lzu7xEWhiUL4o0vRo2f
         wZVg==
X-Forwarded-Encrypted: i=1; AJvYcCUMuhd8qdwZMSfsn77gP6ERHIGdOABTa32gyAfjkxBwevMnDIEzyCEGm6E4/KfzXmbZxC6YHTlBeqQFyWblLzP4@lists.infradead.org
X-Gm-Message-State: AOJu0YzxRQcHKiKH8OwTZq4qwF+B5KimqOPKHBnVauuNtAZNdrHWlUHE
	zZznXmFh5zZ1wWV9t7iU1trFkQ/wuvrPGqou/WY8bEQ8jaPXjJyV24kU
X-Gm-Gg: AY/fxX6rn1ZkiQxqNCQCcrz7vNnHzyE2skL7/TQxpYG2vSuz/8aYV+2QDFg5Ee06jp2
	ixgVirNvKVSuHQ1hARD8jSEtRGFdqpKXoJyD7N9ELRSM4t525m5DQiPdV5zHvcqYrUpAPbRutDE
	RFKRiSYV6o8xg5XMvfiRrXf0uMdWk6hpi/dv5p+k9KyV468tZWW7dwOUU3JihPlR6DjraIWaTQ+
	dsd+EH3Wtd9p9oj4NDJKDWMEx9Or2MSlvS9Wy8BhtaFL9x8Y64f/RK6L/wJS4gJW1hzifbBBF0r
	Lz6i7de9XlNXjg1ZuX2l1aW+nU9TJhYMUhpSRAjynNuq1zKCFFStAII14S6OJ1pS7+45FrlYliu
	IdyFiCBrXvQEbM7oecXs3wtrjRLluYx/K5ct0FLSjlZH1f00K6pTfg67wEQUW2LnrvxfnDIkmip
	FbbU8TRANHmb+pwCiEikJeNa67063RRiSv0yhR012FOI+JlT4mzsJZmepSaQhE
X-Google-Smtp-Source: AGHT+IGfXKnZy0mQEglh0zPN1XxzIExkG6slZr7PVYIaEqHddSi3MvL+67igL+BHOkrNg5yaUhVkDw==
X-Received: by 2002:a05:600c:4686:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47d1954ea05mr393600985e9.15.1767003154809;
        Mon, 29 Dec 2025 02:12:34 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:34 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:12:03 +0400
Subject: [PATCH 6/7] arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-6-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=alchark@gmail.com;
 h=from:subject:message-id; bh=OooD6fRyFOjS0mO1YMzNXxir06GTfmMqij3dBS4dPBM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTA9t50ZuV3zREXc1zM7/v5NP3N7QpDLYznOfSfuv
 Lq1RnezasdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTbbmb4b/bpw3JUv//Fu41Peu++PTDIxYVaYsLHHXiPI0l5/2v35vByLBjOd/
 mtX3xxT8NFnz/U8RuZNA7T/vFvYZjeWfexFwwq+IFAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021236_968072_B4EB0031 
X-CRM114-Status: GOOD (  10.34  )
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

All RK3576 boards get their HDMI sound from SAI6, which is internally
connected to the HDMI codec. Enable this for Rockchip RK3576 EVB1

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index db8fef7a4f1b..deab20ff4d97 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -315,6 +315,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -835,6 +839,10 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;

-- 
2.51.2


