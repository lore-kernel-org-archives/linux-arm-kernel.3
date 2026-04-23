Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E869FC0340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=; b=m6Y54zVlhtE6YmReQl74+2yjFV
	LU2044gqvn7z6675Cj55xsUxb1xaTPu/iXmhVYMY3svfyVg4Q409cr8KP0mGRB+hlYzZBLgShaCuJ
	s1wHopmkQUuIAcdlDg9soNixG11sDIKniy5q9EB3CUGQuC3fo+o9NTgdSy4ER5S+cyLz5T0tNOmMl
	3hjOlPVqSA38/73gH2UfNj+PUV0rHXfC2P/fU7/StXbbXLbUXC+rYDDOsZMr3mqPSktO+pWaLkCrO
	rwXQyARW96eWRr4UVLgPE3toL/4CXO0qCTWyScodF9ersjFoDo/9M6WRAGumt4p8X+eOlvEzBpsBO
	j5UM5qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtm-0000000BslU-2Nca;
	Thu, 23 Apr 2026 15:23:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtT-0000000BsWo-0IsY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso92380945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957785; x=1777562585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=eCap6uiVJDmgphl6+IXWZ/JbJFFEoQFToDm43R8A3FkmG0A+rCLjjhxxEKRUw98q/6
         88I6yjQe36IokEVISR2HiWXyzgyC4AFSWDXXHRFxMl3T1KLe1Z2M2MDDi7aPRW6cMeWV
         SvTyYhNqiqeM42Z2cRzRn0fRRejFl0qatnZMHnVIV91beP51OtARAzp+Pzxv1bzPgLAp
         Lq4YHCAYjQF+1lwaWeaEukpX6X9bZu1R1MGuMMGP0MSEal7L1k613Ff0ijnjScVFD8rn
         3EtNekH/6QDwDqjP8e5bUhveb2o69qf21CCSHdNvjPiyfmagH2ygb12xsQr0i/5uRmS1
         GehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957785; x=1777562585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2rw/F+vOuT6UFAdYwCBkXsXOmQ9+TggXzaKDVp2DDM=;
        b=KhK5PKmaRZ7F33F/dy3okjjwO40yflnndl8nh1GBSWmmzlA+UNJpLrZflm958nbHT5
         FP5QXfixiwDBItQGyv3gMcFbfooM5dCV5/3MjHa+43Kg8yzlOYGIXhSYvZDi21Lulo1q
         fDsfpTtbqo6DoY9QA+Z4dWctiHudDtsY3W4wD6jXP+xsfZ1cLEktGpDPYB1S4ivN60U3
         lqMscKxSo6qeT3DhBejkjqpuRM/4Ia2ducKB3VYTYq60qjGUnmX+CNhxRFQHWHHJAuvw
         PKVooklfoLoUWMhgUMJBYHBOoh4KHAodgHsOQ2mEaFFrGTyBm0BOXuqQ1u7hkI4Ud1Rw
         ihhA==
X-Forwarded-Encrypted: i=1; AFNElJ/YZ+QpdgiUrr5JXOBxUTE5smDTfHo4GXs8ctMBQ+z2r7zGb+ZwbjEXJQtsLzoSI80lgC48kz637NOC16ILizEE@lists.infradead.org
X-Gm-Message-State: AOJu0YwYAbFpuy9HUmsfibsf83CbSAmQHfmaG4fcDrq1/yrOTr/dXw5P
	zSCoq5/UKUCFvc59yvH2nNQXV0+gXsly7CMi+ThMjWozNyv5flu7Y4McTnuaqkXduYU=
X-Gm-Gg: AeBDiet0ppKLjM0zLYL7d9+DSQM5MxuYylNv339Y2L/j1M1yu0dld4jnIsy64jKwm/w
	UZzPGsJrvMuBYxJNIfgNKqZLhcKpmGQILuT0XSXkBUg03L/bUh3J0txe+mJivXUG67NkYu7PaaS
	wfazVbFO/2F4RwA78ZWu4p5uR1ZpgtPASW5Y8SAnCX5RhiAl3j02GdVTCDshnLJcClXAaVdMCxt
	PMIgwYu81CkuLQRE+QZfjD0JR4pEAPhENc+uhMimY8XAjyUNAxcEXpySzBaffKzO6KXnq3hUk52
	eZGbeTccpVhU+iU0lBFD6FGB1dt1Vur+AEXhe6wAIiDtoFjZmC5QDQEYYddPbY/lisydlIcHblw
	skn3I11/4sYOyushMPJay0E5+sI9C8/sL4fycYhBn+KmEdU8MteJgujP8JNCmM3h7vxQEsgjXjU
	5J7DHvPIpBtqDB/yPmLvbBM5ASE5vvppUKO5oje4hBKYPp6lUDCjbYyPX2nqKXFIO1IdlGI0l+N
	DbG38nHtOYGUq8ynw==
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488fb78ede0mr397227715e9.29.1776957785364;
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:57 +0000
Subject: [PATCH v4 09/11] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-9-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FWU5VNsYMZRRVGYIioWPuaaPLaZNzDvKQUDpPiPlMQk=;
 b=oGan3n0YDDTqNrNPvT5e5tY9UzUuAumcLznabKnHsbyyIVFfufKds/6MUWf1Xq0V0ycSAXT3/
 KZjDYxlqCdNAPXdbDR3RyrFMLbqE0LrVkmWv13ndxJQsDwP/6anSJj2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082307_181385_B580317D 
X-CRM114-Status: UNSURE (   9.69  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9b7b6f9828e..759c05bd0004 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23693,6 +23693,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.545.g6539524ca2-goog


