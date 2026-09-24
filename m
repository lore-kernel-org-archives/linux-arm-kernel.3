Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52775C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=; b=EKhXx7JJrwD0rYNYmqpieQ+DHY
	6mzcLipv3lU2YFbEZPFJp3bxPJoINbxe8/D8aoG9GRZUbgMLCyyBjTL+XsgE6uF5Qs2I0F35B0oj6
	QJlLpdN/t7wkVz/FTUIy3Va5/1i+fmpJyXIcOusD2w61/AEwrPxyXoINeQ13OYwt/4yplDl7WZdDo
	fkNGpz67hfDxiJeuusKPoPuK7LU3LGRA46r1Q0+wBYi+dFA7clwr9oOVyWrLAZEESTaU5IGWr9Fwi
	RErdMJ9ayd5HbR/mttWu2KHnEeCHAcq53VBlQyH5Ff96106ayZ9yldFzrxBzxaOfzYKneVFu5Xn1b
	K5lEHIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9me4-0000000Be4h-1EGL;
	Thu, 24 Sep 2026 16:50:04 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9me1-0000000Be3j-3FkI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:50:02 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso8119f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268600; x=1790873400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=sQ/r/kDK6RNQ/2HmPLhH7o/9Abb8+t1N6wHid7YsGnkVAd8JjOKLPAm6F2AjsXNGqT
         +am7c7RqixFwt0n7CVREGvJ6M3Dc6X7gwwbvnUUlCvQNIsqRiBT9IGdG4ifntX4rKNko
         tunDULF9OEHLnox04tHEIYb4fkEDsNFT5o6ksBNjwtWtqshIyOgFMO+E8yVmPFtWZcxS
         qEl4cyucRpACpkSqjbv3XCsaZyTqbSYROPl4rPfHMmmRgFbXiE6pwErzOwsa1QdjsvrI
         bjdhPiVr6sV+DqeylIVt828uvLdSmah3HGPvV6IHR4OD0C5TuaGaiOqR93oH4OeUNc99
         a4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268600; x=1790873400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ha/HEypz3MxwAQmWEzTLCA1xaL4MlxM5e9rrz6J6Qz8=;
        b=q+vJc73rUcCNDMImO/z8YhC3xAJ09n9yhC92H8QC/zzRNG9WN4PuhKFEL9wk2KxFk7
         tnUw/Mbp9+G3Titj94BAmbYDxL02tKhSmAbw1SFAT/HaXTJ02opyk3K+hkEXqv+Xk5uL
         9+bnWzU+22x/bUyESUGPQHLsT1ONJIMaR8J/bcVZfqQbLRG3J3076coc/VrOvHpwHIYw
         hu40QABWfOrOpvvBoVLF24TkbRfdT1RVn3TDf681d3/j72eqiKWl/7iQOfylrxvyDoLp
         huLW4daSWpMbA+GGYFQW7LD/cwrrnkcPQsoHVFXCeez51iutulvBj1UoJ75NHtDc8H3t
         ddlQ==
X-Gm-Message-State: AFuF++lvYU55kyR9Hzm+KlkHaBV/Lk7pNpzjGG8Qqjlcx5efMF1T8SiL
	fd8n7ZXzWZwoI56sna4bGDkF/W5ok9yiduo/ToqhBv21dcnqkP4DH5glxu+fVTATFWP3SfpJ2Et
	uonH1n+o=
X-Gm-Gg: AYBFou0yBil/xyxJfcvnVhY7XgtFrvF8mFM5aWOiTMy0Tr7C4IPujyIxpBkPsG01bFS
	iDhl8j8jlpIhcGUwSmKnd2M57HoiexjU/xixOs4uks4Ofi+F2harMCC1faJYM3QhpgdXW15vOXP
	bjcJrSQEeHWSHmmkBIO0GkWRa6qv3/eBW4+R9OQ5lc6b7nFr1TVzdRr2+kze0suwXSZAuLqya9d
	yR6lTe0vzazU0bGnj8BCPgQekgC829EDXpMNncsTH3Eu6GIUtbIvTkiL1YAH89iowj2tzvqZaUi
	XBSXPjGT1Ucc85W7N056nkvRzUSLMp65Y+l0PiQb8kssrzs25490e/9pdt3gGbO0hxqh9/WWiYW
	VCZdWLJ+ZvkhTej7GfCDenDdAW755jnAo/4m4Td+rjWHln9VlNoN989gyFYcteSspJ+ztpCcCXt
	BN37Qo48k35FdnHc6RdEPzAgpYuGzuIBRDZdkjkpA6JE6HphjBo7o6GSEoOUYGOz0BZgNC/Ico9
	WVscPSAdTcrisAN4Qlwonj/Xbva2sD32NaL
X-Received: by 2002:a5d:5f03:0:b0:487:d7e:52c7 with SMTP id ffacd0b85a97d-48872a717b0mr5399359f8f.19.1790268599850;
        Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:58 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 24 Sep 2026 18:49:17 +0200
Message-ID: <20260924164922.117236-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095001_830244_06DA2E85 
X-CRM114-Status: UNSURE (   9.10  )
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

Add the vendor prefix for Tibbo Technology, the LTPP3G2 board manufacturer.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..8a984fea11c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1728,6 +1728,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.53.0


