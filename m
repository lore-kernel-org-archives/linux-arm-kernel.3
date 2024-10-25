Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F5ED11718
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=; b=uD269b6As8Cljb1CLUhfq2joiP
	0ynAq41cj+BR1UZcVEM3WRFvcOe/OBxI4+9oMhrTPO+BF5Lu37ElJgW7Pwtrz87ojdMm7uK88mx6S
	LI+1AeITybEVQycvzPwnddSmRNUfEtQwnLhrkH+V4e8buL32kkr+dXpo4PdX77KJ18KM0TGAkZG1L
	2le/4MSELP1LedVa35HSsMAVaWc3wyI9ex3bxBtyEcUnDkAHjBzRFJxN16zxasauXnXMqJbNHdHVc
	DHxlduHGx9MnKVZ4L2HtiyuVGE4yu60/HapyTxjz57HIC2wjnwhgdKrxJpVEvpArDYs3a4cnUouGg
	mg+CkMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FNJ-00000002vka-1eRd;
	Fri, 25 Oct 2024 08:08:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIe-00000002u8N-1z7l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:04:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso1198616a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843439; x=1730448239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=;
        b=ZeNMGb2myzf0VAqprM80MB+4ZwF+pAYhqWcYhuLiw3M3VZlF9ixgiN2B6nDlvIYlXa
         v124oJ7yyATu89E7r+RctzJfZNo9jGWQ43a7b0l3YtkQh7OBoaQ/JD+NmisbfJlnKjUr
         AU9WKpRnFO73qOVSOALRZkQeyGD7iy1fdL2YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843439; x=1730448239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9978JY14w59ULMKg5mN8BKD9mGH4Z1Heuort4L6nsHM=;
        b=reBP6D2wJ5Acjv/paPxhP3Lv6Coq8zDYRBApy3iUFvonVIxAMnvtVpZ8e7VHkle8qQ
         F4OIaS/w2NzK0BGtBwbxWjRoMYH9V6P9ZLmB1iBpElHLuc1jBsuXnn0POLvDGY5PIBcs
         inPOVyA1fQzsKfQYKZW59OGy5KObnUgO6K+YOTpdRIbW8vO2dCt5jplXQ050rgyk43TC
         RQ+gVpWa1bPwK9o5G8PeTe7zwiOJh8VDLeGyMMWqvZdwxw7p5tB9my53gq8z+F4aammy
         8nJbpKKv5yXLf4wMsSSOHUvedIX/Eb41BMyFxKBbpNCalJGVEr93lBhfImL7QIf9M3xr
         hfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbzhr/wS9neJQJk0e+jMqJqiQxYhrSvjNmxZs1GxxueLEuGijMdqpZH+OHV+bD6mCOWA+DpJPWPQqRijpvC1kM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1FQuwAp0sCYmNbs+/9ptlyx+O9m5KMMteOXkBn9mQH5VsSu1r
	x6kqoEpHOatwWzy59480Zid9bU8obQPCbj78pvGgrtRQiwqugI6IO8YE6w15tA==
X-Google-Smtp-Source: AGHT+IHGaBCdJPNmo+1SghxDLBaoYb7vIPUnB9rgksuYDIRKf/Aa/Z1cETZCG6RSrD08cs2t09cZpA==
X-Received: by 2002:a05:6a20:9f45:b0:1d9:4837:ad7c with SMTP id adf61e73a8af0-1d978b1ddcemr10997249637.12.1729843439606;
        Fri, 25 Oct 2024 01:03:59 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:03:59 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 16:03:49 +0800
Subject: [PATCH v2 2/4] arm64: dts: mt8183: burnet: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-i2c-delay-v2-2-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010400_618588_37F0966C 
X-CRM114-Status: GOOD (  10.26  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: dd6e3b06214f ("arm64: dts: mt8183: Add kukui-jacuzzi-burnet board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
index 19c1e2bee494c98c0db87308494713a26e304cd2..20b71f2e7159ade7e7d2135aabe6587c8f8d64de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -30,3 +30,6 @@ touchscreen@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <4100>;
+};

-- 
2.47.0.163.g1226f6d8fa-goog


