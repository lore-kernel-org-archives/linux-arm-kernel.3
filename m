Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D64E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=; b=zN95DjQSWSerwQavCH8aVJlmA7
	WVZ9gh+zshB+NFpCgE6zpJgHH9uF+o1N1EwRrsu13U6CnuUfckeFnr4UGsYi3h4IfmuLe+/VlLsqO
	jngX3QxxvZUDMHdW0pgcDf6HF0m9jF+wzVszIttRkyFFgPM0tV7bROMY1OFuaqT9zXnhArCjea2mt
	L8kDkpnDKV1l5+mdGg0E3uP3DFAkDpjLo6NcaS4LWMdxpPZ8eUV1jcc11WdQm3zBaFlZNUtf1lK/r
	04FXw9P7aW/B+e1wN3+iRhAGQVLlKnqirC9OzEMb6XN0OM3Au80dk0NNTxrW5R6+zIAcg8PQpP+Lf
	w9hdDkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtcE-0000000ELf0-1Xyb;
	Sat, 04 Jan 2025 02:10:14 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtYT-0000000ELDR-0Zij;
	Sat, 04 Jan 2025 02:06:22 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-71e3167b90dso6540144a34.0;
        Fri, 03 Jan 2025 18:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735956380; x=1736561180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=YVKAT7fsDHB/1glmJTXkcBF8n9yWOfIUL418EsyO+0YwGk/WNUduQ2H0W41vgxGMXn
         McKpbnnrZcUHb+T2mOoEb4zFxe7788yYDsms9is8gdCTBrGxtsNqtBkJHSgBvLVVnGV6
         8ERcPk1hfzxBAAed3UM4dBJzQIjUNoAZ6o1Ec02ZUxnfEdIAugE1ildjp69qxJWhUxoW
         qjOeHeu0+shq6AGQPmgt1pBNgXwPCpYm4Bne73Z++9CoE5vdZ0Y+GIbmavRbtq4hkccM
         ZovTvNzZvEGUCVt68XfjfbtZxpesd66vrWyCfIYOJjWuSxmlEk8dE0bk00gnLa07+ewG
         ZBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735956380; x=1736561180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=rMFyMaxgustfgzWM3df/PQlKYZOcb+RDRDjceNR6k34BWS0deFnoHuNKnQ/EOGQI9F
         cO/5ghyJME+fcWzv4tF4w+FQouV8Q8pruhuFMyCfWeqZFcfB3Ds7IaUiMSgZskWy5SLk
         qVBMBFPfcrU3n2WeW+V8p4lyE6VX1X3UJyk7l9bcyr/jVasetizf3ddue22vgpF2+YfB
         507E3Z+6l1o89KHY08cDl5HTYpWLL3gmM1QhxT8xpsYUzBabz2puaqPNqLCJzGT109kD
         JxDaUr1PQ5skiCWfb1YEBuuLV9PxaaxmeQeQxtCF4hQ2jXzUN0IUMr31AKrh4i2iafCc
         fGQg==
X-Forwarded-Encrypted: i=1; AJvYcCULpaMA8GY7qahdvx/WvsEipLbvWlJsr+mRzcVaE3e0F62KMDXEa/Nlma+q21UyUMiKG2ZGEeXLHgQlU8qfja0=@lists.infradead.org, AJvYcCUU/OaqMh2qVq4knEwIoXbSCvA6ohGbsA8G6a0qlC5ihtl/cTOtTXN197tybOyJk3A8LNi3hMqLuJEM1tk8Ng5/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjm2n+e580RfVCaNidqweOAWR7Hf4Mz2/HJhdjBHo9GoOkX9/z
	GjYtIvfkRHIOEJB7Hr6Ys+pTThBjWBSaESR0+5SkQTRDt4cOSLBsf7RM/5dX
X-Gm-Gg: ASbGncuMu3NnG2yuxjBsD1sxNYbmKrYD8OPwokAvzMBJU9Wt1dWKvYjqmlgMUqqjacq
	ha22ohXa/lx9A+7ENb+FjIWVjxWEZbBdxxpwla6YMSoEfY6H2xOOwsGEyezk8soCWzMGaAcvwNv
	z5maTHGcdzbNfV/Bpk2kUfa6n7ZSWntMg0U3jsvnYJMakv2w0/cuaJukM1qaH3v71rVxDN4Gczk
	amCm2E8qOnDkq0skiGUKp2u/+xw4neByag5lZk6xoDiiNtrQh4LYvf6ppBQXeARog==
X-Google-Smtp-Source: AGHT+IE/2+jMijdOYVEVvO8+46QwEZ7Z/87bamhEOT51H2VHUPwjZ1xZR8+yStAmG0wGQFcV1mweRQ==
X-Received: by 2002:a05:6830:3c88:b0:71d:dda1:210a with SMTP id 46e09a7af769-720ff9137admr22752526a34.30.1735956380075;
        Fri, 03 Jan 2025 18:06:20 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:7057:8598:1940:24f4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc998ef6asm8406568a34.50.2025.01.03.18.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 18:06:19 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Fri,  3 Jan 2025 20:05:38 -0600
Message-ID: <20250104020544.6777-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104020544.6777-1-honyuenkwun@gmail.com>
References: <20250104020544.6777-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_180621_178594_0859AB04 
X-CRM114-Status: UNSURE (   9.23  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Max board.

The Orange Pi 5 Max is a single board computer powered by the Rockchip
RK3588 similar to the Orange Pi 5 Plus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..2a141d99c533 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1075,9 +1075,11 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Plus
+      - description: Xunlong Orange Pi 5 Max/Plus
         items:
-          - const: xunlong,orangepi-5-plus
+          - enum:
+              - xunlong,orangepi-5-max
+              - xunlong,orangepi-5-plus
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.47.1


