Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAC8E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CbrdSND3vKdyA3f5oN4X3+B3XcZTSDcg4IBBVmOErE=; b=0xLPkvUZVJghNm
	820XcyF6JJx76yB9vA+7wJnN9T5ku/xGjd1ifNMB2uH+wZMOiTEoD3TnFf4kENyrxPDf8IywBv0d4
	RPr3S9aK0gfiyJXRuTy6WpPYU+G9q2PbIB0RKWjYVaBtqHVKHn3Y261uly1N04gGLpyRpT/MTkAyO
	9c/jnjLUpEOfq/fyUMLQUudY7mJblXT6mMXuk8xJY4OqJXykmMqgQKIGTWkzX5xILW60Pd0JuL56O
	G8vReZY9xucImXG/K7vjI3ERXa684M0ZiyYIfochbxalprHnvMVQn2Gq1bTFOAp0NzSEziGXzbmjP
	YHAUp2FScqoEOs3fD5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgTA-00000001GAN-2x7T;
	Sat, 11 Jan 2025 18:44:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgRv-00000001Fbf-3pbs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434f398a171so2877585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620985; x=1737225785; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CbrdSND3vKdyA3f5oN4X3+B3XcZTSDcg4IBBVmOErE=;
        b=YNuUgK0W4BmFw0sKpn7lSa532xob9ulfa9mrZu0gFCL0nsg3sjP/ywKPfT9itiJdOb
         0YvM7AwvJTAbMNY5LgqgSwvxWL2Gw6jSjSsYV+jz30dBOIRqTI3k4z20tAKRJeWbZ+oq
         S1qH+DGZgiVLYCBiVxefuiZx4JI3OtPFCwgC0hwBGd24Qmk0ZSGyRd4xTcDWuK4maJEU
         Mv/HHZ3s96yw1L7toOE5mZaaZTktn1AnkLgrxQwix9Olg6q7QNPuJzkIp1Ow4+f9qkZq
         ihQNdDBFxTZngBn6eGqPlvIIXxAjfsly3Vy0KvLWlfGROPjV5V//6ZLqgOF7k+WU4AiP
         c0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620985; x=1737225785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CbrdSND3vKdyA3f5oN4X3+B3XcZTSDcg4IBBVmOErE=;
        b=r9jKk9fajCLNh9tPrVHvCuDMzP+oqDtwXipt+MSiOBrKi0AfHgBztiwJGeP67yN9c7
         0ga5Py0FswyAQhjnrnGMnYzXjT9zhTGmo0kvR1Cc1eQp6FcxapKng5bXor1B0IBuBS+E
         /O8M+tDErNIIcWpm7WqSiJ0DwBJx1aaf6oqeBxrv91D9I+K6KYkjPpLktKgDRmTI99zL
         QAfxxAuS7olSOy/DmvSu3jVmJwGDR5RIRyYTvLEclTn6qgtL9WLAywet26WBprAg1Imq
         itTUPeFRn3ez7nnW1oaYKCf59XksU8QRG4UYUJFsIzF86HUXqMsUymtK24411RLw8+u2
         5hRA==
X-Forwarded-Encrypted: i=1; AJvYcCUIzBgtw39u9TjqDUTzX+jR5Ymvqmnwr+knMDfm2UjLy067JJCDNtFujaLkIBnv6F1wpJ5zQBgVw+B/GV6D7NiM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/rwkmIFKbWG1xjbcCCvwlnQxz9dSuUT2T+aYIkSY57xgkNbqG
	ERngj4EVTjjToh1c+CZ1f0VojZVjKGcntA62HFz2uzJCIt+WOYzBoj3+11fKwcI=
X-Gm-Gg: ASbGncuZtEgWzZOvDwsv8cwP+CRqKHRyDilBWhaXwnRVXvDgeuCEzhVYu239QQgmrGv
	9U0As2Y6OiVN8WBJsdphxhZwKszrQ+IHU1a6QqH7sAqxq99fP5yoeQLI/pEp79+25oRbG6UPBM+
	cBZJJpNagMWjcVsraSX/qC7zv1KaPzKe6D0Sy5JDf1JWu3GtFB6xaWR4mV8O+Ad2M4EwOptB4hl
	UtI2jR0nIzSosPxvUT+8QKdjty3PgbyJARePURqOnowaMj+MTElpJtI3ZZ53CoVdvWmnFQ5
X-Google-Smtp-Source: AGHT+IFLu0UIaf+5jx37DEy4lxZwwV3M05mSfMw9AoLLPK7hRjpKmgmCd2hrQcOQ7+pDX6O0Azjp6Q==
X-Received: by 2002:a05:600c:3c8f:b0:434:f7f0:189c with SMTP id 5b1f17b1804b1-436e27007e9mr60748855e9.7.1736620985183;
        Sat, 11 Jan 2025 10:43:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] remoteproc: Simplify few things: omap, keystone, st
Date: Sat, 11 Jan 2025 19:42:48 +0100
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKi7gmcC/x2NywrCQAwAf6XkbGBTHxV/RTysm7QN6O6SSKmU/
 ruLx2FgZgMXU3G4dRuYLOpacgM6dJDmmCdB5cbQh/4ciAifJ/Svp5KxNs8vwWiTo8m7fKRaSRg
 uPMbrcGRigtapJqOu/8f9se8/05wxbXMAAAA=
X-Change-ID: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JoDXg2TSUGEGvFT9+KqrusBFwUg9j2HcgkAj/LYtsMc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngruuI96JbnRYgzZ4zm1YXDK8H8sNWE4zKY46w
 pr8nJP02hmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7rgAKCRDBN2bmhouD
 1wpQD/9pofCs/15om5H48dOaM1MMSLszR4m09lUBklv+2amGCMoeSUx8DjYdloIkGQ/PlUy5obO
 7e5yqTcK1zE9JcBGXgWFERTIbGjL7PBgxcfCaGXYwbaN8LA1NsNBD8j3OdPsmW9zX/p/+D/w6gj
 N1iSKtj5TPsOEGNoqxwbvQ7Jtin/682tVXo/KNmNLYPNYgn425RhO1HX8g2kwZLBgUSTMqOE0vU
 NlKApfgl0QhJdCCFvxY1fo+vjZpcMzK3+Lroi9UBwQdFeOpftxrbnvG9BmgHId2IJxsJq9fp05D
 jqCkewJy1JweOAWbcm/H+PU61QpRnadbR0SVRl8e0jqpmq7VAkYVlXTUmVZE65mw+s+/MMZd1tH
 lx3y2KWO8qkea1F6kJfauPiepUu5eL6va/VMkPq54SAlJuCDv5ZfAmIAi10WX6ZNAN8lDZyyGMy
 WLgmiwKTmT6C+3WbCHXtUAAZacfrM5dBher5bvPUGFZ9aVadUo2vXIiA74HR9FgGtBH131dTBM1
 DyRogzzYn9kru1xyxlyeus5MpLT1UI7RgQXESkDlLoZcdWmHKtHVcNTaqFQ5Zl5/Mh1tbzIldmM
 sXQdxXrzYviwuk24roO8plGvjd6haijQxPsgNbqL+AdR23YuWLXrXfplpLpUdm1wE2qFk2iB9oz
 mLl6pP1GwKRWE1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104308_014932_00E45BA2 
X-CRM114-Status: UNSURE (   6.26  )
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

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: keystone: Simplify returning syscon PTR_ERR
      remoteproc: omap: Simplify returning syscon PTR_ERR
      remoteproc: st: Simplify with dev_err_probe
      remoteproc: keystone: Use syscon_regmap_lookup_by_phandle_args
      remoteproc: st: Use syscon_regmap_lookup_by_phandle_args

 drivers/remoteproc/keystone_remoteproc.c | 17 +++-------
 drivers/remoteproc/omap_remoteproc.c     |  7 ++---
 drivers/remoteproc/st_remoteproc.c       | 54 +++++++++++++-------------------
 3 files changed, 28 insertions(+), 50 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


