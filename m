Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46268C9EC96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=; b=1Qm9Q8E5U0LZ33icE5qPAnSw8X
	ZsgJ59saPZD+SxI2VcL9I8urlFBcQSDpC82icnAyYmmpJIJETM8hZaFfVwbFiguDQwtySm1vub1j7
	EUmRuoISZsMcgWEqP4gmHplZhObgPB7IRXNFB0GBo4B7rYjq4VN4iQqIVzXqQJPlw0xHSbQPC6xTC
	ey1PMbfVMEO6Fl3E5m7m7PkouY7qn6y3hD5YHmNejzYafe4SO6mQsIPxhkGG3LMYwvvezkR5N5ATr
	5wh1Dioyt9NOrO5+ytzwWmB0eE2VC/tbDHdCY0t0YLDbRLGDybI5Go/WG+FJg7Pkc8nS4MAFUEVz5
	OO6A4uBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjG-00000005VLD-2cuM;
	Mon, 12 Jan 2026 14:17:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjB-00000005VI0-3mTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:17:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fbc305914so4583054f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227424; x=1768832224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=ig3j7BS+GX0YeOx9Vu1ffZxIOBSQKedSz25nshe5PZIwAIWMnmBURbXe1yzDImDILS
         8AmkPIZcGdvou1qgNRVF5nWN/T2caATBks0UgMNs79tu+uY2o8ePgnFHXhyZR3YwWQ61
         KSgTo/4R+OSqjfKMq//PP1nBibQReGcN2YQSH8BymaKkUXGc2b2ZOovd43uPZhU+shbv
         CoiewC794CSfz7lwa0CVRgd+U7JhOOcPwZdiKR/Pf0pPY/B7hyZeHJNiMGvJ4oQ6jTGg
         ttOF1OFAuhtAJ8mvbb9RmH8qlhTfFmUG+BWql4x2oPWUoT7aE2iEUaRTbbluTkRVbbVt
         zWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227424; x=1768832224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=qMETZ1d7Papo1qsdz+GIJMbUTNMRcfVPzo+3VWWzzLbU2gw+Ry/ZaevOfmzZZMIWwr
         c+hdP3T8zd2Jd5Wihg+rpJhCO2hXWrspJaaVCUI0Evp7eY/I1U2C3Pjwk7zdd2QwreJV
         +NXeV3/nPgoNYhl42d3mrb4z9B49GXGFgFK8w5pwoD2HdGrPf6HeiZRBPPNnOqninCXR
         2AMCzgaeVYAFrrzBrfXUIXYaffB6L/gfuPVjuqw6Y4y6pn+9YwKM/NZbWFA1O/UGnLIO
         MiWxUUuybc2HcwsNtSobdDd1ohrnaRRSvCoNcgbhelYj3weB7YzhFYsagB1McVABVJ9g
         vb5A==
X-Gm-Message-State: AOJu0Yz9p+/O1giAbO9bC8aRPi3PAAkXFHsdyPiBmypHvme+l3vn901G
	41YzxtWxWounTdiDbhEhOWJdYx8ToIGywqyzeCODM26MxnoJVmRdkoHuIMN/2awfMAk=
X-Gm-Gg: AY/fxX5BuZ2zaj2ZGYCktCmwWti5+D6vG0dJkKsVryog8L/Mm4o+mQ4ncIYavXC0tSM
	0GZF4umfTiYcUznY3yFXBBCPrUc/Z/7WFJ6Pknl2fcmT6qrLEcP56F5eM2dFPndkABFpRxoSfVD
	PamQjYxTKZr+DgepN/mCM8Z7j54hVbxwe+eIl2etdG2rF9HrVeBvNE6ys7rBNkCh9VzojkWvj9x
	PAHiFJGOJFvIWn0oSCENTLYxs1PeoGsFWnUgmWC8r0i5EtdOTaOwu1WkwS/Q64KaaAwJ1mxXypy
	XMPFykP8rt9MuK3J86rNdeR6+1xN6Ywb342gdANjqZrdbjv4zrE97TWY7GWRz9y1RHmY077Xw9j
	NHrfGktlxYSxNosjTdGlJku187B2b6BtncR+niYghA4UEX8Lqgk93lUWl6napZYRtq26O3cSy2Z
	ZdbBawniz20K+jt2MHDeSajzFdZ9VWTM6croJDKrjsew5Ah8aEbMRNudo=
X-Google-Smtp-Source: AGHT+IFVR/vjNEYv/FQXYCJiVRI4X2CDCCWrmtGHGFSC/ecZuL4EN6E/j1yU9pK/fy3xfqoqCbgqag==
X-Received: by 2002:a5d:64c8:0:b0:431:32f:3140 with SMTP id ffacd0b85a97d-432c376107dmr21526633f8f.12.1768227423668;
        Mon, 12 Jan 2026 06:17:03 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:50 +0000
Subject: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7b3/8jSg0hsC1cvup2K50pItaQVXTR6L3Z1yqQMb+TM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJYZl0VlRqcl5YypTCIBUnftAv7BAYLAp+2v
 WvmYN1nP96JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWAAKCRDO6LjWAjRy
 uoVKD/9pWR+8ACeFXCJ77W/dlDcR3KY7CwDcsHk0tEOat5gl2BHNChqYlwaNGUIKJhp0vH6IJU7
 H0vPWfPXA7Pr1vLC2NEjfgr87dc+Mdk9lCD9inf0YI25x3F3JEvO52I5cUrnKFuGxeEebzdZGKE
 IPv0+1EgyCG1Z7RQKvGmuEuezyN5u4EKRA3HYgyqFfqWB3RWmJJFGqCIY1Do8Mlsj7Tz8TRmJHA
 Ib9/CBb3zMfJwAGZWPvigrdmIwMcvfNgvaxog+sALJ12cRzPBLhQGkue1ujkOus6jE97sB4pCld
 8IjAPVCl+zmLq5wh+7AwiiWG16QBqhCiNO/KN95F2FPzCmMXI8X9qVjNfiSxKsWLLfh7BG/nbd6
 brrgVG5p+21KcYmIkfZx9WEHMRzKnRLdLrVBHQ8TTUgM1O8XWhXMBwzbjSKdHxysi8YWq1IGavD
 PvWnD920tNRVr4jx0y4pObKTz470tv/OFM/kzQvZjCxIHqB+oydxJiY/8O0+KM+eye8ZGhdX1+F
 f9WT2tP8wDRfsyIupxkfka+MFy3TUk1FAO8kuxv6uofZsswo88mCXarIE+4TORhRZ9k7QBngiJ+
 vIU8Mcu2BBsBE9iREBDssfMnQQZP619lhREWf3d1e5Udnn76sm2mduGGEhXlcNUP90f+Ayp9j7C
 jYVqs9eWQyaJaJQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061705_961439_C8AB317C 
X-CRM114-Status: UNSURE (   9.75  )
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

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.457.g6b5491de43-goog


