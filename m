Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E643C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=; b=uuVYsNGs0X+ACYirTN3JzEN0am
	KU7I8c57zv4wUnzHwQZYO5msml6bsuF8yZh/+2hcCWa7ejz5jdoF5I5IuqgZYVJ+SXQg0nLo+f98p
	aENblP8wbP8Qdp6WgOUD4QkiJGhJvNF4uhjHUfRFZmHsOE0spMaCZRjdSaLPFmPRtxgQ0Pb31D8b8
	JzZLpxA/hJ3Ux3pV545yPPH1vXIRfwlXrX4EaIIPAy3u0WpjKGnySzDvQSA4iZau62AdVo+j2+B8X
	4V0ugWZ4213cEwolaWu4BkEoPoChOTISplemAhXTKm9UUxsKszJ7ZYB8KqtjevekTRT1GwLKdKc1b
	+T2nT+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsiD-00000000SwS-36FI;
	Sun, 16 Mar 2025 18:27:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa4-00000000S59-0iic
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac27cb35309so604357066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149163; x=1742753963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=;
        b=XQGZOt8KYvZpOAacQnc9z6Ko3QqhUd36NnRhoHRDln770wYUsJBCibjwQ8lODRJF8i
         4W3HiN6cmkMLSrTCzIbaGipPoHVJGc+mEZ5IJDAgSSau/7CFlomuRdmNsbzZ7Tcbausw
         x68mpcegUxE5LaXhsUV2LR67xJkLU3JArpAksk4y5i9t+Uu31trWzJzBi4NeHvVkTXZb
         uZcuQQPkbb1NvJfzI+98sxZUI4J3PYH8OJrgaZBNPyKM3oUc1kce/MFkXP5bHRrwJrTI
         b5vsAaMaoPot41JKEU2IsFlevdfETMRU5nJD3mhtuzGXNz9+jRBzOa3s1u0V+IviwKGI
         LF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149163; x=1742753963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=;
        b=Yk02DOms8bNOrrhogr3kX4SDOV2CYtz0CSEPaT4HHqur2B1hFPqAHs84nnqgZWqNnw
         GgcME4tUGhIrORswAV6FjTcfl30pt00a33yyJel55Q9Jdz3+LPgUxH7QCydvVG1NkvLk
         UgXwgdNnUYaR8EYsuvwIzmL/C//2L6DmJH1jpNJf+xqI1yNv4YAEpnJdfiMI0VkL7Fkd
         PldUgfnA++eOmWGIeLG/jDOGn/nfhLRu3lnEenSSpLIDTD/m2Htj8oXgfFCDH+CPIuml
         qQUIVefMfykUfVHiXNhbjYEjqB/D5eUgKl7GVnUhUPlVA/Kk9l5PAOYJsH6/1vkVnwAl
         q3ng==
X-Forwarded-Encrypted: i=1; AJvYcCWlDYKRitOx8j6Lbp1P8xYyPvOx5gzEV2QDAPAkkv+2zU5tLwkkwJBrahvqwRDR/CR5NH2jGXUEyv8XNdfpNlp4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKHcvOOCbXMXhJQQCKgrUbU5JtVmdygKA4dq/2W/sw91AbFDO7
	/iRCSf/qTwWT7D/lNrtHV2TKFqOP/mAb408KqOmwMZLyrlKqWE3dkRCi7A==
X-Gm-Gg: ASbGncsQO+fYVl4UduVCpTniR7FJwkchfceuXLaygyspWnkFmNFIoctPYhFbGQ+mdZ9
	g4fBoZU9z0trI3q50+V7Re90zwSBGHoiOaolAdN0cqNEebz/USYNir4CeQARKvcbvuwwbf9cWVp
	ib9eGrYrYzwej4SZIk9muvySP6MZxckXAtyxE53GxWGKNZhIevE9+gRxKORDenSeOSQOxp4cR6e
	GchA1V8ZVgk+vVcZastYISDjYdQlyI9xZ6pH8G+p+z4T8g90d7GK75WXiHEHHH/8EZMSeoTznQD
	H1/HYtqrpRKK9Vx6S9OQAq6rhIUra7fZHyE753j2Qu7CQWzDGDEejOIxJNMfpzMF/wYdJWKhXBP
	4pbNeyYrL3iW/YEew/mFUYXmjEvcd
X-Google-Smtp-Source: AGHT+IEW6mwbZ0mIlUOCzUaC2OsZ+OTum5RA4mVckjatFCdtgV+nmDBy9x3IRRsoTUB+6DxdKM96QA==
X-Received: by 2002:a17:906:5fc1:b0:ac3:3f11:b49c with SMTP id a640c23a62f3a-ac33f1203bcmr672618066b.7.1742149162583;
        Sun, 16 Mar 2025 11:19:22 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:22 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:52 +0100
Subject: [PATCH v7 04/10] mfd: bcm590xx: Drop unused "id" member of
 bcm590xx MFD struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-4-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
In-Reply-To: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=805;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=shsY8picWdauNM7HAi5QIbN1+/obURFOkQY2q4XNRbc=;
 b=rDbh+AGUMQmTqrTWquPXt0bGmiEn//jNa4ylElnxOs5ntrSzd4IpDqsafHt4svb6BYQbXBycJ
 S4LJMyByqXFC2UnuVmWhYPaos/F4ixaCnRYxz2qv11xVBAMggZd6toO
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111924_214328_B6A35D27 
X-CRM114-Status: GOOD (  12.33  )
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

The "id" member of the bcm590xx struct is unused and will be confusing
once we add an actual PMU ID storage value. Drop it; a replacement
will be introduced in a future commit.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 include/linux/mfd/bcm590xx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 6b8791da6119b22514447bf1572238b71c8b0e97..c614d1b1d8a217ac2f212908a4c19ae71fa56f63 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -23,7 +23,6 @@ struct bcm590xx {
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;
 	struct regmap *regmap_sec;
-	unsigned int id;
 };
 
 #endif /*  __LINUX_MFD_BCM590XX_H */

-- 
2.48.1


