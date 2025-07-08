Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA3C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJMlSlom/KiMTwkQbIEAzuRLUW9VwcuZovWJtgWynck=; b=JKkxqdQ/Hp4Ov85rwaKiFDxME5
	FoczLgNKmarYHkttqMfdZlmgYDpq9Al/GNmj6JzJqc31LRBE9ahew3A5pxW63T7fZmc4v/8OxDpI3
	TdxWjg/Vm2xugBHQAk5y31wWqrSZspTkSaRFGqUYiINb29VKC3HTrsNpbIOgWlkUR3SjOZgqp6zml
	wZCwDXHX0fJLmTD1/OrSIjKLzeXdp0oYpR5U4m2F7CcV14ZpL0ECQ8cmwcGs701xAzq6gJG+kE129
	qTC0DvIAFivUKa633hGf/KI2pEjlX2fSvPsXeFyP16XqCnym3yleKNcLuKBvhvd+Nk0jYUu8ma5Ln
	CQPwE++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3nz-00000004lYP-0HBH;
	Tue, 08 Jul 2025 08:35:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3ge-00000004kOF-2S1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:28:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso31323555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963303; x=1752568103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJMlSlom/KiMTwkQbIEAzuRLUW9VwcuZovWJtgWynck=;
        b=c3kf94J/8/2KQ6g3F8Ftz6/jsZNMQx2ZijB4rz6P4D73BlKyATu/DOMIsW1pNmVLwy
         80fTnevXAIo8HF2gjguWGAMxjWYK8sOG6AlUEB/YHtbOORUi8s5GFteFR+wiScU4XdoF
         Z1HHogJAsqiQKdUmM0bU+cbk4zeGgkpF0MbN94HZ7c3XOSUZuq0HtH3tYzqQq2vOL1A4
         yHJVg87muxMOqRsqVxF8WJKXm8IzCM4E8lNliKyfua9eZkKqgzNq72ipBT787iWYY1ad
         0+W5BOMG0nrGjnXLx5io96OsKuqswPtHy3cHm/lV1y3s/OZbMhF3eG6Z7sVg4GohWAq+
         nGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963303; x=1752568103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJMlSlom/KiMTwkQbIEAzuRLUW9VwcuZovWJtgWynck=;
        b=An5z77eSOjfh0qXagraOVDrFbzQJmcpnm1OTtZbM6fi+qqA+o1gPQ/tsmKu8ilaeSb
         1L1ZIV2ka9M7wQowAkY1eAwvQLVPUPX3/Ryl5YIeaiXXrLIucUVSatdzYfe9AXeIgYj0
         lswrqz69cV95O9TdJfJZJ+gtSRyW7YpNS4x8XK+kfmbMSVGXYuDTOV3QmJ+uG8Ko9cpv
         UYYMOuhvpb0oHTlxjHFW8kdTjKAfT2oh3VdBPkCFBDY13Cnedb6m1ZVlg1uqf69KxO7g
         QEyPOhVd/mi37diUjwwlfllKU6CvMgpW5RiqD244dEclyU43nVUBKXx1Ql0Mk5nYCsHY
         ku2w==
X-Forwarded-Encrypted: i=1; AJvYcCVdeqvWXFVcDtlgqm1ksu8xmn/oaQ06LjcO+7O9LMYsyq45ortDU1ia697l/GiwMBER+pkHnXzQbC69zGftYvzg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8O5CwIof5STHcxqUqfjznJ95Z0/ToD7ljmlJF0rD10Mfbp5tU
	whXwIzyY8L/eFhwSdNFCdUswUDZOp/FP5R1BGLhgATTFruFrUI5gN4G9
X-Gm-Gg: ASbGncvLG3dX/NP6xt85rfSUxlt5bmnBTyy5xfPcOzXLuMLSuG/RARk5zYLAJSmiCpx
	U5MgmA6MoW5jbJNFxZ9sxyHjvDvcOHM+pEvlhE+K9g1UfYnT/GtHN8d1vhTumotay+LpwhuTx5R
	s01lGfP5k96nV4k2XDR/9d0S+uCMLkXJW7kvjsFsesgqQZ17eFB9d0OW/AhK4OHXVqknwN5MGCW
	pQZB+L115mY7M5+00RykMgpVYiwCVU67lDCCdFMSHuSXH+sZUbTQDH9Iyjgqtgmg1u7kwWZTFDe
	V1Zf/WOVvBZ0uGsAo9mWgdkmEdRVDdksQwmtctS+nT/QEFvNokVmpFWXV2VQr3tKXpEG/+ir6n6
	SLbK9ypUdz0sydFCWrKP2gTEgwQk+IREAV+9WlDPv8YnuA3tcrMmWZw==
X-Google-Smtp-Source: AGHT+IHK/SvlgTww0dZF/jMCnrR4g7wCb7VA7kOnihLMUb1SjCpYvZ1MmfGNFml+RJq4jAKd1ZEkQA==
X-Received: by 2002:a05:600c:34c8:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-454cccd644bmr21048225e9.23.1751963302733;
        Tue, 08 Jul 2025 01:28:22 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0aa0sm12596532f8f.34.2025.07.08.01.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: firmware: Document Tegra264 BPMP
Date: Tue,  8 Jul 2025 10:28:10 +0200
Message-ID: <20250708082814.1491230-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012824_621316_359057A2 
X-CRM114-Status: GOOD (  12.59  )
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

From: Thierry Reding <treding@nvidia.com>

While the BPMP found on Tegra264 is similar to the versions found on
previous chips and should be backwards-compatible, some changes could
eventually be needed. Anticipate such changes and introduce a chip-
specific compatible string.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index c43d17f6e96b..3c44fe607e12 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - nvidia,tegra194-bpmp
               - nvidia,tegra234-bpmp
+              - nvidia,tegra264-bpmp
           - const: nvidia,tegra186-bpmp
       - const: nvidia,tegra186-bpmp
 
-- 
2.50.0


