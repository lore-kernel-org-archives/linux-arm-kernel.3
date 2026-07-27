Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43121C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAXeyuUpUBJGi5ANL/++tSq9bwO41CdynEC3Uob6++w=; b=BIWcIrTA9vyeCZzJXS18Y5tvpr
	UYuBqqzETNxF/kE0HEx1selVBKUuLrXoZyY/wkqXEoInomQ0OX479ORNxrFRQhxqHtoj3zNQKIXlA
	trkOXBt+bbURsUOGu8kAS9vitAiEA+W5o8gld0gcKaPUCWTG6tFmTgnPQlzXyIGNz+ZT73I+MSFud
	aequNs4rGXk/tjhshy/kz/SIJi3ltK7x0D4XjLwJ53DjBH+v+y1R/7sj5fO5vaQETdKNirjR3oyB0
	IKUkwANbW0+8VdgUQ5JoqBTXlFoQ9aIjvM+ubym8l02YBA90ftQ4N05zfjALs+tGyvA4C+O9NthCf
	xjp96JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUIk-000000043L8-34W8;
	Mon, 27 Jul 2026 23:00:02 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUIi-000000043KR-0DE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:00:01 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-92e5c9211d2so271334485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785193198; x=1785797998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAXeyuUpUBJGi5ANL/++tSq9bwO41CdynEC3Uob6++w=;
        b=tF8lQ1BQcyJuWLrExG5unAjPcmDwKhwS/w8L+mVR6dkC/j8eGpZCpw5J/L75x75uJR
         xsYsnduI4dt0RLIn68WVgrMfIh/IiCK/IQODCq2/D8s3IqLMKXhDLcSIrzydq0gsa3Pc
         GAHqYE890PX0raRr/bYcD897h73Fvf085evmiq6XtyH58OarQbRV3vD5AKeI2MUASqnM
         dQ3t+OYCVLsM8/dpa/n/9AcfRF7uMMcsqBmHeQ5Zxg/aVwWwGv26uVV0NWP6ZhymE4RU
         M1bK5De07ulFdWnvxYsIE1b9SVPG4RsKJH5/84TiPl8O9clQU0CpX7/9VpOQ4R0HIacf
         GzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193198; x=1785797998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAXeyuUpUBJGi5ANL/++tSq9bwO41CdynEC3Uob6++w=;
        b=sliLGoQQ+SB+UJZ9zYeS5dHPZcR2uw93PrXj3r9N4UAUvKyo9XxDwU/2vmZr7qgB1n
         qCVgaqX/5NaphOkU8tXr+lZO1sT+j+LhWskYw8sBPYPmzUAEjBiz1YU3KCyMgG8DwSgl
         uDhDAAdMLQAsyJ4hK3XoSArF1tB+HRH+tIt4alHMjUi/umVDzc8yBNzKSEpWlrKGMX5W
         X14hNFhPFJTyfRGy2E5bHDEHsLo1irGJh6rPxhlxxHATZhIgtnBIi653m0oAFilsh83O
         FNKcBxTPHg9zC/7BG/WKusCzyWLqxpwQmIwXiVf1ECItcrcJWdu+Kqrv1EyNiESpleBs
         0a/A==
X-Forwarded-Encrypted: i=1; AHgh+RplVyIlKgM4HxGOQUfEjKsC2kLPdU8o79cMRKxu/+zkMjUNDsVzHFivM6vgJFBTioHS3nEsbFXmEXBWtthL2Gn/@lists.infradead.org
X-Gm-Message-State: AOJu0YzstCRDCdRlVigKyIYtv+JKOj+vV7aGA7WjPztpQqVUTZoD1hjt
	JkV76to1QeO1OAYK30lHlN0+ebBBA1wB1r2jY56JVGMVISlRmFWbzGGg
X-Gm-Gg: AR+sD12WaL6Nf36ncpSeM0kOOClCyeSBj1Qf1BIXV5oGFB/3y2GB68K3CHvONQV3ldT
	A6Re2J3SPpjWq5ya+c73VyTAp1/9nrGAYQXrUxl8Z2CNd4j5FxlJqN7mhbK+X1J/UYJpNfximNd
	n9wtNOiIag6uke7LVxgOB040tSFTqTFI0qhtLP5tiwfXMYsPECvn/flYOo6/6nGICv9wnDu8sdX
	3+k3xH5qEjrJ34XQg5YRSlPUhuHZHWAwOOqbm9kZ7yb5I2XNlrJeVICa23s5agL974igV4elhlL
	GhMx51FfY8A1yP5tkiwsGi1NFVbOlEPnqPqFXOdkHXTwf6AQMY7JN7XZYUkulucvI+Z0hDaT0Rp
	Rq558kKnsnI3jkoRQOdqRwnPfC3sI1R3l/5Uc6fK5Eiyc1iiRQlmdmoNaL9Kg5qeuC74ObPGE+Q
	pUJDvGMhHj6wJp6cJsVqTDHB7f+UK/BV+jR3ZzOsD3qcTjLO6OxnqX10tFTJUtUtbaipdmZx0GL
	86JTI05MllmE5PtYVDLZbGgAHw+qdKPJRRIos549teQ0M6RxGafJkh2nJnrrGYR8A==
X-Received: by 2002:a05:620a:4109:b0:922:d336:1990 with SMTP id af79cd13be357-93301f45ab0mr2372685a.18.1785193198479;
        Mon, 27 Jul 2026 15:59:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de54b3f6sm711220885a.18.2026.07.27.15.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:59:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Mon, 27 Jul 2026 15:59:54 -0700
Message-ID: <20260727225954.268155-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_160000_093622_03F628CA 
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

phy-mode is needed for CPU ports based on the documentation.

Fixes dtbs_checks warning:

switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index e02a7a902f72..372601f0d56d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -183,6 +183,7 @@ port@4 {
 					sw1_p8: port@8 {
 						reg = <8>;
 						ethernet = <&sw0_p0>;
+						phy-mode = "internal";
 						label = "cpu";
 
 						fixed-link {
-- 
2.55.0


