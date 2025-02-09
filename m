Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33737C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8uXdpZb0QVP49WhVJeQTFaqN+VWPKe0SMsURklPfjs=; b=EKgr7HMTYcsFsGTU0Hb4XtGD99
	IKB16cjPRwDCQGpXb4ht1XQ32wBMOA+qyBpcU/B0PB/XTW0dkhbuYSXM6a5WGIo1vdcsjX49ZYz7/
	6Vm+rb3zqbAF8nnIjmLkKpMHDoiqzt4hmQLGnsJJzD7SaqeH+L/SbKEsWegb9xPCjsJdro0DO5zjX
	AL5Ag+ppsbzPPQ7XSaCOS+qegzFsUUjbzXKHfHCDt7AjvdiKRT1AFktlk6+5rCJ7YtvM8BMw7LFV2
	qixoAJ+UnO/kVRAiY8j34QdvTmHjj2RTefW0KttSIJCeQNU8/tGSrqud5QQhXTApvlvJri7+ifpvQ
	IAhqVsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFbp-0000000FgCa-2Lsx;
	Sun, 09 Feb 2025 22:17:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSJ-0000000Fegu-3mB7;
	Sun, 09 Feb 2025 22:07:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso36996475e9.0;
        Sun, 09 Feb 2025 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138830; x=1739743630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8uXdpZb0QVP49WhVJeQTFaqN+VWPKe0SMsURklPfjs=;
        b=j+yG4j3KNOdkK5HKBSaF0lUcuX3+rdMHEAxfLiuExWtQ6ubw+OtkL0Fh3s+eS/g77l
         LRFxKmBCqFXkRg8ieX4vFj5UgaF+0Q5pJtkp4UbZctRju4I1GY0jRYCeHUDxrO4Xiuvm
         A2xZaQE/EWTqlz7XHkaezoLRXpuSBNxI5j90HerKZ0g6UUR4yjzyUzeuBsVuf2gBHSs5
         ZzbILMp0bKlIldbjhJFY/kqlNdLwjHL1Lx8eXuNX8JBYBz1Rk267miLkD42lsRZK2DDN
         T7jfnjkPDONbjEEY0MLpnl2tszHUXtm0Y7et7WnLP6R9+v8qVwu/ZKo4qRC4FxN0K7x/
         0EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138830; x=1739743630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8uXdpZb0QVP49WhVJeQTFaqN+VWPKe0SMsURklPfjs=;
        b=ZUEs2/8WGkyNFcOyzDBkQYpB7OZzMQl0hTVE9FWq5viXKb+703yzzilgUbcSH5qhtT
         Xvvje/S+hoLxQRfjwAPHhkmObhG1hk2taRQRqTy+/yMSbXqXB6ELFLbVIxMNAWzKA/uN
         Qz6q3a/w0lwhKeQQI3IQbwKEtJbBOd++z24m9ETYH+53JOdLmW2HC5Adqv4VN+f5oaV7
         SUnYs5gyTB8DyNvv0N6flaKmrDHO9RQadx2I87ZRHOgnVPuACrwtp17vHJEPEgBlk6xf
         5SilsNJDTNIoXyhiWYlrDHW+5vIbtNdoi54ONCFKqRI6nwsvD6nPywwuM4+4+IJ0bTYD
         OxhA==
X-Forwarded-Encrypted: i=1; AJvYcCWxzFquciEOlmokWzzk6F6FWUJhC1ePxXvXq+lGMo9xpcSrWrhPjjdNQcJr+z8N+J6UheRhpgdwE+7a5MbpKkfC@lists.infradead.org, AJvYcCXWHHLstwJQFZ+4+KKCHBOmlhzs7zGcsO1YCabCU9eQ2tktffriPJ8h2XLgwX03XPjD6lUD9Tr2OCrkjXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsBVM1IgBcrJgWK7QscDkdK57TreCO5RlbPnvgnMD4JL45tWWe
	TVMg/+4CM0kvCTQiZQDdjuDHuS4qWjliBgIUcl4k5MYQHgblBkHd
X-Gm-Gg: ASbGncvcqP2GtRdbJizbYE//YQDBrrnaJNrB1EyuolHSe8apvUfIuQCdJYT+Z9TC3S2
	YmtrOAY/LIDw9UTpoSKuyi7PNgh8t/y3TChdXPy/0AdxZnQ8Y0cMCosXFzo16142yI4ocnjwRp+
	1UWSUNgXk65/6xjl3M324GXwTVYw65suCz62C6t4Rs5OfEPhwl5VhTQ1sA+zSmUOyZ89m/y9p0i
	X3SKJ8vZDX2AZHHc0kOVEty/ivKyXpBC6Hbhr61KWp+aWwrnxhQhN37gAo5hYljyFJVq3QDdsM+
	FEaTXbG0geASlQ5b1a5GFs5bWe0k
X-Google-Smtp-Source: AGHT+IFs/uD6uHSEXZaTM+eANebqsdHvVmdihPSPtESqNNdICu5h0lHig1CDm5zwmYfpbmncCv9HjQ==
X-Received: by 2002:a05:600c:1f96:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-43926158833mr74064805e9.24.1739138830140;
        Sun, 09 Feb 2025 14:07:10 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:09 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys core and ctrl compatible
Date: Sun,  9 Feb 2025 23:06:31 +0100
Message-ID: <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140711_938568_C96E991C 
X-CRM114-Status: UNSURE (   8.65  )
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

These syscon blocks will be used for CV18xx reset driver.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445..5a0b102d1bd9 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -108,6 +108,8 @@ select:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,cv1800-rtcsys-core
+          - sophgo,cv1800-rtcsys-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
@@ -207,6 +209,8 @@ properties:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,cv1800-rtcsys-core
+          - sophgo,cv1800-rtcsys-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
-- 
2.48.1


