Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21855C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=; b=pFtDlLDHc/jmPIdzRhBKVbCtQZ
	b/SIGN5T+bFDLTBL43TqVywMJlqFvUEV0eDECnnJXhOaRGyKplgLkJx/jKK/SFInBck/r8bxId8Tq
	NBRXHaRARaNAlCV1q3YCht1rkbOiPBAuyjvOtw9xc7NclRGNR09CJvuPaKQYvnyTxyiZMDvS8MqdK
	zCWJDY8r+b3j2BDJ5PNRpfTkdmgBt2J5JZpcT+xyiQUR1BvyuO6WUjZ447gwLFJyhq1zvOQqsv769
	JEwkT3Y/3Ru/bI+KHa2FD2xHyvoJKVipBzSe/lWIlAQpOAHv6ONPFNe1Nu8lMKYDekF2atVnkfVyt
	gYVc16ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdG-0000000B2Hq-2EZv;
	Tue, 14 Jul 2026 06:28:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdD-0000000B2G6-2pTg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caced6038eso8167765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010519; x=1784615319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=YfNYiRNi3znJxACjmZiGY2ITFTMTkICzaQu3JQz5S1flnIAIjl8jCBdQAGdltoeiXT
         PDbZpx0fVpYNL80+lYiHIPJeQMCSGBwFeVzgQlxDqT25502cfJfhPLgHyGPYKEyet50l
         sf8jwm0R08MnSPiWZ65WVMkNz9rVorDKJYx5/bMA6gjZIFgbOkGzXiP+Hm16vnxdZJLC
         sYq29yS7hlfToa8kUG43x4VVoMDJuTgGVzg0PDbCigeO03dyY5N6MbKcw5j7szSrk1WL
         GYMZDjR7wb0JAO4MJyFkCYRuzb5ea4YvgpfCd9+sSWlb+0svx9XKo6Xo6OEQfGPSgH2/
         6MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010519; x=1784615319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=IHcmPFg6l7Ckgbm1+jt7ch0p450PVvdlavp2sodT3tylpp5QC79cab6Yyw0GQRiH7g
         Cs1bm7edFSzsESgV8O07bohGk7o8gua+7RuizElVR02I5J3WtM3zduRdDuU3qaT36ypJ
         p341zYDSqtslFvDF0IyNG2uNLxueZVpl8T3jmFXdv2nEgygANlVqhRxYiQbZslJGDXlq
         wYbQnhsp8AOvPQq2xw6KiKa/GAGLizLrjLOwAYgiMOl+X+hjTp89wpx48Ayl9HVR1k5D
         2ARy9T9TIMlzn/ZIj9XmyuQSB1sbEZfKlKchz79gvFP1wFLdmQqEjNOWv+oISt9qPHIh
         ohLg==
X-Forwarded-Encrypted: i=1; AHgh+RpZlvAW65yCj8XvVN16Gdb9g+SZY322Lk343WidzznBnkC1O7nqdrzZS4HJJ8R2kMcD7IgP/K/CvCFFAOJpnBnK@lists.infradead.org
X-Gm-Message-State: AOJu0YyiNCGdYizaCUs255oUDQlpqrBf/+q/hh0Pm7jSVnAN6G5sV63m
	/qRkYZ+61+dbDyhP9fDpnx7/P1ybs2klYea49r5ZoVJhHDciY2Vvy7SM
X-Gm-Gg: AfdE7cn/VqjaM/3VgG4F8Vq19ACG8QXEnkOb1/Bey38kh33HBZa34Qbu+pmSCvqp2nN
	03Bb8n7yKNqiokkR3xkRmajsSUTfzBOb6egp+XRGU/55tu0xZxy+aNrRABBDgyvJjeroMOM72an
	q/AQodcrxuPmnPNMaQaiX1CJFgKHgxIa8sAnBE4Sb/sqC1Y31oxzbjKkfivffkipIvNkZXF0A0c
	ZBGyCblWS5fJoOUxP8VBr7kz1t6EfJ0Z6LEocwa264+TkLtkNtQlSs7Z+ab/Eke5VLhqHpNffpT
	rt22zuIM0uzgZNrRnHQir9oykUzYjP6v6pjezvaOEqTJ/vZpfnP17z2aZqRSOV1ccih+gX58ki6
	VrJS/KJ0Fo8AtuVe4rqH7S/3xk3OW6RkFogJkinq3h1StQTymMgxQ+VNHnH8zsNDpYsNX8upeUz
	SkWcixpaz1lvHar6LP0IjUl7g3jhz8PNvv5DngQa+O1UsML5pBPMoXEJWMhrsavp3DbGbMxofX7
	cW+j6+xt5tCgn5Tfb7CedwqBkwtc8D14biBB5ZJSkD2BzYEG/bLjodzzKNVOqCU
X-Received: by 2002:a17:903:1b08:b0:2c9:ed2e:b8c1 with SMTP id d9443c01a7336-2cea17f82a7mr116774045ad.12.1784010519128;
        Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:11 +1000
Subject: [PATCH v2 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-4-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnWivv/W/4/x3RrdIzlzWU9vRK7mipW71t6cSbT+
 hMPL1/62jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq5hiG/8GNy25EbpV/PVXZ3fRO947qQNbgU4tFsrZyLBbt3NVn6sDIsEZmxYw
 ljJN2/DrpbLKm3v2p04OaCZdWXxaP83gd3hJwkR8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232839_725075_75A67216 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..301df2f006a0 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -122,6 +122,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0


