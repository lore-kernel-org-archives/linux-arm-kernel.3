Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B7FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/quxB6BHlHDqC0i5JxTff+VNeJbi29B/IjgyVMrnZrc=; b=NirBeWzQLAh48afHNNchZH0Zk9
	TtlaJm0XnGG1kMO3e3NOENCAdPew7PFF5m7+ejWXZ7I7wVR8ItaX0AlaEwUCYyrC1A8SDqTKQcJRF
	wfPp3DpOXd+abmQ8XdXFyY9hk5etYplpqarO2ftDyZ8hlu1r1FVRvis1Uq8T7r4f7L5caLGpMlXYp
	xX6XqTTJrjHMliAAwe4QGdLluiz30L5QDaH37ZLSKf5C5mtymRWsvw/4NERHX1AarTbhmDbpSnG64
	cl4RLZI0LDnB5oqFk86JkkGPV1MpqtTQiXlY1Qg0aOghRVaK+OLa9kLEtp+sjlbGachTJr+Xy+ATo
	JkQBZxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGYl-0000000HZcl-3URY;
	Sat, 15 Feb 2025 11:42:11 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGQ1-0000000HYa2-31rH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:33:10 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43964e79314so23958215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619188; x=1740223988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/quxB6BHlHDqC0i5JxTff+VNeJbi29B/IjgyVMrnZrc=;
        b=hmExEM8C8RdAl6H/HiWfngeCiav+1mluFafmclrAltkcjr1Ndj3R2eXZH090u9mo3O
         dtCcqF2aC3WhOYqmSdrSiYsaEQ+jdEv58gQQWfz7HAugAHymMeE00/AsAi8lV4pbVLA4
         k6Dua12K82JaPexcQW05hlCF1zq1ecEy+QWWXm2Y140vsjQ9BaurglE6gKDFX74J0ZLT
         6toil3g/Hj39eoQeQG51/824aoOwJL4Kj91w3oGHXyBwZiz5xXOGBrP2X/D2sRm6wIgT
         Gptok6WtuQzDSjVH+sxiuRopw1xmV/oL15GjgNPWdQtXwpGoFHSBJk198+DUuWzIAGDP
         YRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619188; x=1740223988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/quxB6BHlHDqC0i5JxTff+VNeJbi29B/IjgyVMrnZrc=;
        b=Ev68pgEzVTLmUMISEUd/rdMjlJ6uEE6ECwBAjst8B3qh6zm614CbJZQ7QdsxMmJocZ
         IOG9EzJOKDaW01XoPIalj8c4bqRf25EVS20PRDpzK9aEj3/DovP9eWIJYM4NFR7w62oY
         fmxHHdRtFGnQzAX6/UlM15Oel1GSy8LwoAmHs5cbzfUkjhRgc/2BUhQmXjXG54eqImmV
         be/okFwpW9Yjssqt7vxqSSWhNCz4iYYYYS0Cvs4MwkBcaZRAnkuC5/Fl9kr6MPD9MHIk
         gfIcpuH8reNtDsfMbJKc5ROFbbLHZJRGe/RakmQ/e6iraeSE1vhTvNCskkuoO/RRPXTf
         LbAA==
X-Gm-Message-State: AOJu0Yx1VYg352Z6wnF/naxD06/r4ex9oPtJUbAFJv5oVPAjdWGcp2ys
	pjoE/WrhJFMaDzlElQFMWFISH86STVt/VvWvztPo3Ta6HLJqTHgy
X-Gm-Gg: ASbGnctBKmei9OIhkYKHcctveSzRH+jRngYXmD5R/h8Drb1QrlAEMNnv792g203Q+Vy
	Kj3hzGEW1iTn2MFjmIjoX9ZIvMEVlY8GKdZhslM2gNPfLvDQa3Ot6gjeo6x6WXuXaV4GB9WXIEc
	VwkCX3GuQBqhMngOTY0n4XsTS33k88m/DkFOlHnPxoyRR+jLf2B84o1mVKx6YgoXAkdOEK/hFcn
	D50RU02xJzx47OFoFeI7GlOUsmmXrr4jrQFyaJ8bkVtSqASvECGkre9es21WF1DkA6Ddzc3Jjzo
	MRgO2e8oN59BtJMOal9yxUS4kQ0JxljbAh12ReblAaA86MMNWQcppPw1n6HlrP23VJM=
X-Google-Smtp-Source: AGHT+IEP6aAh/Io2wIRKUzFE7varPmPkl8lIkBPxvX5iyzJD9r30P0SFXfObAZ7acHHQQFS0zDOKVA==
X-Received: by 2002:a05:600c:3583:b0:439:5b82:b9d7 with SMTP id 5b1f17b1804b1-4396e727076mr33086015e9.18.1739619187438;
        Sat, 15 Feb 2025 03:33:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: pinctrl: samsung: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:32:47 +0200
Message-ID: <20250215113248.159386-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_033309_757794_753D668C 
X-CRM114-Status: UNSURE (   9.14  )
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

Document the compatible for Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 5296a9e4f..c3b82da0c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -42,6 +42,7 @@ properties:
       - samsung,s3c2450-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
+      - samsung,exynos2200-pinctrl
       - samsung,exynos3250-pinctrl
       - samsung,exynos4210-pinctrl
       - samsung,exynos4x12-pinctrl
-- 
2.43.0


