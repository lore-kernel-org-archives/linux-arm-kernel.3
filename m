Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DA8CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DnDUtD4Qj8iqvDFoINyvhmeadku9ykxvDw0dyGhUEU=; b=aBE0mO78tSg9lIZdiXsfwZvdvl
	cNDmfsPknaS0dmWCZ17ojuyu5cw4ElEoTeNyS/ec0t4eP/QteB6F2KFYSMIaRePpQDp9huPj9q8vZ
	+Y+8NjJTrW92+u3bwuuMB73sXpybHT45L5wQroZnrHBika2vt3dDftDYjTDhiKU/i0WWtJXz2C1QB
	4eQKZJDIVgFC3xTC4MC4CVrnZVRBoICfILf2yX/VGJ8GhgbtMPVWumpGJh5Zne/CtYUUGSznrCzr2
	dRs6s2TF6lb80eeOvxCN5YTFbwLrwd8OHdXwLszFOwN4+ibvKGbiZBsK+XV7CTvU7kCJIpHrblWvO
	hZIdPQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQEj-000000070HB-24VK;
	Mon, 25 Aug 2025 05:59:21 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ6y-00000006zOM-24ey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 05:51:21 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-70ba7aa136fso39637716d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101079; x=1756705879; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DnDUtD4Qj8iqvDFoINyvhmeadku9ykxvDw0dyGhUEU=;
        b=WhoDs5zCYVpOaUi/hJX7KOhm53MDlJdvXeGf5FVeqZmL105xQw1CN0bZuE8/npgMxy
         qixJ18MpCy2PArUISqu6Yyu5P9f8xifonqLPRxmeU7AUrqeLV34O9eQSdjc5Od22yFAD
         2iuRKj910sYngcEp+7BuV/01IGdEfgtN338cIxkGbTrnvXq8OXC/UmVLLPBddkH9SdO4
         1Qyz8n//foUIeovkkNRz10wl+5HBd5iVTE2OmIIms+KvGzKezq3JFwvqMRknXI10kdBl
         KNm2428vI+kwMbbDzN6QQ/xUMbDChohV3MkoHxu+6nYy6csnxmy01/1MbeKQ2UN4fyd4
         e+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101079; x=1756705879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DnDUtD4Qj8iqvDFoINyvhmeadku9ykxvDw0dyGhUEU=;
        b=JqCDlQFIFPFoQRWVWyzwQRyH2GsIYlCBRktt/YhUkANDa/Gz5TQrVydG2qWxIFbuqj
         l7pDLfRKp/p8r0SEmnOFuE98LJLXiT2B/cj96/oTAM2va4cXteACSap1hcHH0p05/s9a
         ZxFphdEexKNPYtCWFjyu+T8mebs5M5vBonEw2IH4MME7pNAkvJyg3KnxIw+2NCbzN7yd
         0ZuCBPVv/0lYkXyHimuYp/fWaKOxRkrEk0gKgyPy9bfxIp2Y1K4xxazwf/6/pB8jTvGO
         5I31qIFKIhLccgYyu70awRTaW4qhF/EC7KXbrENPUrfuiHsnbNqOQdHCewrlZcba5Buh
         GHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVXka6maqnGcwETgXYo3bq9XUf3dIN9VOJoIYTe6kDvPry+WQ/9c7HSCum77sDd+hSnEpl7xBvgd7/1RHxo6R@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTdNgr/XqyyRP1jKRV5uP4h9RV6c11QRbKUaECfl5NlMtSmpP
	8eL0DIy7HLZt+WdOaMBmMNtcQINJacUxoUNwRJMZiY7mkV82S1GyGoVz/A1yiECh
X-Gm-Gg: ASbGncu76Ryd9fLqZTekHFllGEL8UUTXoraqt/BkZBujZst2gFH8BvTHyD6ds0ZARQD
	Ls/ylWp5hnVqMrY44KX0Oa4K/t5bxJ6XlpTcRTeINVqNjXftBL2w/5UShPScXggLcrogftkBMei
	Endb8I4zV44PHC3A90b8etvbi8k1MfD2K5iSyXy2jrJUCZAXQdG0x0OJToHpMGD7qVJfot/n668
	tA92/8oDTBe9Qkv+tKvqoi73YB42X4BPzhZqRD9J2GU6XjugObcYB3vcQhs2QerHQvPwJiuKLNJ
	O3wAG0vtQxN0rVCKR8mTFQr9ezt9IEK9J6qKkm/77PvOIMYfOrTgVJOax0FH0jzsynjB9Np2lwL
	k8lElkEAMWEqkw2Yc94oc7PlDNFXvjA==
X-Google-Smtp-Source: AGHT+IFm+RMujGED47u1rJf/yAfC0k8em4ZiXhJUlGDICEJjixloJsVgiXb6kkwGGSGYn4pkBZneiQ==
X-Received: by 2002:a05:6214:29c2:b0:70d:6df4:1b23 with SMTP id 6a1803df08f44-70d97245950mr109479426d6.64.1756101079219;
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:16 +0000
Subject: [PATCH v4 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-2-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=810;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=AFWxNCwJDRPuUp625KmPRnIz16SzHb+8zKtDFa4qFN0=;
 b=86l9x9jH4KH7N9/7czWjjlqusOscAoMLCTWzrM9rQcezqMzVH5dh6OLzn+x6z5pWd0ZqngQAY
 IGmd+ZOsuP3D/Qa0TERWIGlb7opv9J3RSwXziV3+Fb3b9h1QMgteBki
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_225120_534793_83CC54D5 
X-CRM114-Status: GOOD (  10.10  )
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

Add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2..c5c79e078 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CLK_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1


