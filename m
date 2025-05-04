Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15155C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QSqS9H6qxHyvW/F/GXgRpqY+URlEU2x+Hmop2GCt6ds=; b=Lt8xIWuu8FejFAewTPhF3k4huY
	H38CfBBsEjq/vWojMNeu6mlfxyw2MdaCnEk4OJ2afMCaDBAjWsi3kHgYOIeoWvzlV3064nf2BKVt3
	/iHdA3Oc43lpZPfIHeonTtt+oM/gM1qItSFY/NeTNV001XEyn8bLtpNZAZe5Z5j9cd88T/RoTFirq
	mQMPmlLi2yY9NhBkxtV2yvn89LTJqYZOM2ncZt9XhyZGsuBV/qNYOURsZmMLaKJDpw98jjloJBgAZ
	T077xfF0ghdd6zqrDuiU+Ng1ZFn/ArwJSfBUhVxq0xLIUyGn/KsvIgvHcBz/GMkENF9btqpfW+Md+
	n4OjZVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdFl-00000005kRB-0Gtj;
	Sun, 04 May 2025 17:35:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdBc-00000005jav-0Ebs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:31:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so203856f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379890; x=1746984690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSqS9H6qxHyvW/F/GXgRpqY+URlEU2x+Hmop2GCt6ds=;
        b=vHH75q8Qt+7CcbJDiY2uelBkkskQqKdV2nalUOU5SX701RewHuegsXuVskvVBfBAKB
         ydwA9XvrwAIr6KkUrXWPIObA7vghQYDVJbTBE4FOxHgg8WxFb4Z2c8OOVcnqCPcuQCXn
         yUwSKnYyWVOc6UsEjsN7RD53RC4nQbfOxU6fU4TmXoZ5xUWsOJ5j/WmOm20tyCJhy8KV
         VlsS2VmYfaPNFbthg85vxWGRHAWH8EU2Xk+AK49DJA3yT++/ZPUw2jtUI2z8fEgwfedM
         gKH+KrbrParZJ5LO6xOW6sbR6dh8E9wn2hj2IuseM+q+DwCUo2nivib7+3w6BZI089OM
         A4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379890; x=1746984690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSqS9H6qxHyvW/F/GXgRpqY+URlEU2x+Hmop2GCt6ds=;
        b=kLJHkNBJ7FpGx35l5P1RPe+nJpwpYzKQ2sHHlBpmvMQ7qN1WJQeeYkZY56JZmLaaf3
         FGH/RC4X49xqH9E2hZR59ZXuJkJjeam1syAT99RyNd8TjkbU9XW43VYyjF+4Dibb+VEc
         PMF1ej4ni4pM8MCwVZ7b/wIGr1Vma231vFB78cLXyVvDKB4CazwvXRakCk1m6vFkzcwj
         DtWkPZS13nNrgru2cvI3DZFIV+D5stwX7XtMzfNdyoBbt1kz/pVSWDx4dhVaAFcjIjAd
         8tD9Yc2/wSCjMA0Wrpgz2V83gXAtmICReJOD9IqVzxnYvvsySr6fEAT9DfLng1DGUxX7
         90CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtUQZCxvEAQ92dGWWSRQjEb74CtT8jIlpP431Bq9upXbha3VTMbv87u53JyMG8kCTX8WleAzlD/RqY0UfWes6H@lists.infradead.org
X-Gm-Message-State: AOJu0YwpF/hnmU27QfQ5OZlQ+qBPfCJFs65xb/o/wQVyzBb04VmB5fMZ
	N1cv46fVwedvdM90LtSlaL7tHwe0ubxZr7kNgz4+i+vei7otzVh4owXKUinIcHk=
X-Gm-Gg: ASbGncsZbS14myyEQTMaC9L12VlM/+NnkIQ8aR5+5G0kLThY5N+6uIsPQcHPzeF00JA
	PcXCww6Kxb6mWzN1iAXmxerUfC8suQ2BzdGvTiXQ6iOk36KC+f1IKNVw6MrK4NziybKD6nNf4fO
	TNfh+NYKvu/FBTWO3o53ODhZX6CQrXrN3lepVJpUisNsJ1Pvn9+eBSvOwtskOnK9EU/equWabAJ
	po+iMisg0rUlSZgX0/VoOR0iDZ+dtL20iEDc52bBU3sevj19zR/Ie3IFpxEdalzu+jJZ3SutoZl
	MtMMQNRxUSije6ZW8BVNxcLkm97+hQWTVIa1Yvi/Ovo0P3Zd4Q==
X-Google-Smtp-Source: AGHT+IHOn1C33h4VlZhSA2hrwB3EdDRROasCqArnPLUTsrl91Bd7lHnaXGin+vNNH31/XX5XoxYg+Q==
X-Received: by 2002:a05:6000:186d:b0:3a0:831c:ce4e with SMTP id ffacd0b85a97d-3a099af240emr2533824f8f.12.1746379890061;
        Sun, 04 May 2025 10:31:30 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28718sm153870855e9.36.2025.05.04.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:31:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: vt8500: Include vt8500 soc driver in maintainers entry
Date: Sun,  4 May 2025 19:31:26 +0200
Message-ID: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zjop6nIWB4uVL6yKJrKgjDPqPPcu0nJJdJhElT/je1A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoF6RtXfvbBMMBqxm4uZhWpKOyCm+cGjoZG3ZRh
 XlO4JNIOKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBekbQAKCRDBN2bmhouD
 1ydsD/4tdkzXab+tr2GAns5UEV0ccAjPwWS0Kr/dnkfsbciAjc8gqm0XVlRKeOiBff6gSuyhedr
 p0eedNgTGNu5uNzQa5Ti0sReD38FodcdelMAWQT7+35JEQwE7T+fIw7IN7Gct2oSnqcYnOPjLtq
 Asqwz/qRgKYSDJjjHkJPjKtflrYUIXizL5kreTeeBW48CG6Lbx5z2S3FdaQHReuQg93InB8g1Dp
 KgB7pFaqh/q8MByCEjNvz/7TZYSwl6ZGRM3DdGRQsebHJbD3JX6aP0Z3ZftBfP/N1KkEsOT/A5m
 yjaIXuAQG1AtYUMV5hv6mDwpSLRE5DpdLtAAEHXZirwsgDD1DBSfHUe2ObryMCSWo+tW7b8YKW0
 qRxw1E5NDCX7mFY9Af6xRDBHvjSqTSQfIZKuNcGnPCfXGxFwBW9Mz54Pfimi3skFJfuXg2ZSOvZ
 ePVUekg+PAfw7bxKfELbDX11+2px4g2uCgxxG43GHmtfnRonhLmXHJk8CqotRA2m6tnKp2vJ+Cu
 EMb84NvfcgTa3UV5aztetLlp91boxEtFPH79HV9Z605YxEWWw9b9ZrHcLIF67xlZw0OH5ESD1ko
 Evos1oCl1oc+YuyH36NTHSNZiNTi53Tn7ofIZX6Cx3zfMg0+IuDOJDxOHNMSaYBr1UnDtslnAie BKsiOuzpdW4HZdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_103132_096037_C1BBDE89 
X-CRM114-Status: UNSURE (   9.34  )
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

Include the SoC hwinfo/soc information driver in VT8500 maintainers
entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6768aa56a311..6f6278f44c88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3454,6 +3454,7 @@ M:	Alexey Charkov <alchark@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
@@ -3464,6 +3465,7 @@ F:	drivers/i2c/busses/i2c-viai2c-wmt.c
 F:	drivers/mmc/host/wmt-sdmmc.c
 F:	drivers/pwm/pwm-vt8500.c
 F:	drivers/rtc/rtc-vt8500.c
+F:	drivers/soc/vt8500/
 F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
-- 
2.45.2


