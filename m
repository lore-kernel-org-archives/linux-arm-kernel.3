Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8647D3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y72LtBzeTiCDL7pxTrVmCRaxH7TV4xGm7+Xd0f9GBRg=; b=35L2e/2nNAxsAhJFyWaENIKbAz
	JihrSaHsr8XPpugDqfjwwHpzGRaPP30+tIfUbYRD0E3oo4DBnXdmhMf1vlsmvKf4mcbM1TDd3qjbF
	1fe7UNEjXbKgaqAmhl0scXY5R9lQbJ0E7Q+VWpG2rsShFpSPUnokVa6xoDK0s3sqRjNJdgQdeQ1K9
	jxNjJxbhxidsrM1daXbEyp2ET4oD3O9IHZb6AvXldgf5lg8DdBWDkfEI/TAFEBACLrZ6RPOvwXagD
	DggqslPLIwGL0v6PuVfK3ETWSt/gmdutb1d8y3A7eQYFTdpA1CUIRGISpIudc82th6T2ap7deyONl
	ikFG3pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixLT-00000007OuL-2mXg;
	Thu, 22 Jan 2026 16:15:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixLP-00000007OtB-46B2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:15:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7b23dd036so6501535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098538; x=1769703338; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y72LtBzeTiCDL7pxTrVmCRaxH7TV4xGm7+Xd0f9GBRg=;
        b=BwYmt+DbBk5twvKbo7sDBx8DihD6DsLXg7LfWAjxPT/RcrClniwe8vNYkt6/uNPgGw
         Xsb8E9RF9drfDPD70UPjcP0jMogwsbq+8SUimnQLjusOH+hDv/IUe2P45M4FHXeCaILF
         koH2LQXsYL02imDsYL7R1pV2WKqZ1Z4F8uAXeNhyAktYjUSf0NFbCzz3vzced+TuIY9n
         lcDlAkyCXZAW5hF8PMOj1C+H5i4sAQe4gE+nb0Q5RIlX9F56p6C+r3NalA3h+Spw2T17
         jNuUDPj2rAmhHTMtpmskSmaPGMqKcwYyzMT/bbj0ZfQ6VMsJM/ru0VXviVLIoBDqxBsg
         A5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098538; x=1769703338;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y72LtBzeTiCDL7pxTrVmCRaxH7TV4xGm7+Xd0f9GBRg=;
        b=exK6lKDOqHLquT86vAzxRR0OFb4JKFbO5IcAU+8JphtgnH82nOOIOjPwmHlfz5yW/Y
         0djKLxPaDIkHK8XhnkIvD2wZfjrhPcevsDKTa5qApumtKE+H/fhygVF38OrCbDuWU3bf
         7/2WTjqAFcg6v+c+vkdLc8pmRkCrDOopiFRJs8q7aGEtN6R2TSUYtvK3y9az1UTPggnL
         Wopqbqs8cQmKU2FktE25/2uPbhnqVz1Zi+/cS9d0PNVzP8W93KHFjVqPc82cR1z32dvV
         zgbALzGAV0L4vNfS6UZ1BYMT/MZjbxQFed4p8bjUhyZ9bEw7SSmn1p3C+7PPnqdYmxjR
         BTew==
X-Gm-Message-State: AOJu0YzkxvLNp8Ynyn6y6aQHoQ90KoWTCuIaW1/ynaFyMmn4aCXhutrp
	Q3yaZ4x6ECyha8uxh6fOWI+fQ+iGaFLvNdGcBIFi3Y7QQt0YaKTNeB0m
X-Gm-Gg: AZuq6aIUY5uzjdGk50d+iQAD8SGgG8q7rfF+Z7k57u5kRCRSL+l0C/E8L/l4kV8qO4e
	/SZhq5bz6Fd/TnfodX0gwYNFMHbN10VPce0GR9F3iLhmGph/+5R1W9gIbgX1AluPt7wbGb//UCk
	krCXYkCTTmeAHrApdg0c/GF23rtSTRroJneYIN7F8hpoIgSaFzSXlV9togoWSkmbzMPFpfDdnvS
	IZvG6ehELewsN+kKZOQ/qpSv6y+PQAWGJn92QG/P9StFP8XLqW9W1ifIvkZVMteIVROtjwiaC4s
	Y2nv1rjLgOvp/zmVlopOo7xBPbKZxw9l+isFbDrIdb4pBEmdqjMOeiYi1bX2v+QxLK7SdqLETwI
	1vndBqFuUdX5KiVaA84QKNE/jzV9B7oIb6sKh/vYfSp8o7NR97QCawaITBO4TQXjUlI72kV+3yM
	eb2oTwKZGKRTaMA9CRsX/3Io0i
X-Received: by 2002:a17:902:ce02:b0:2a7:5ad3:79eb with SMTP id d9443c01a7336-2a75ad381d9mr96532845ad.35.1769098538381;
        Thu, 22 Jan 2026 08:15:38 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm184907145ad.27.2026.01.22.08.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:15:38 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 23 Jan 2026 00:15:29 +0800
Subject: [PATCH v2] bus: vexpress-config: Fix device node reference leak in
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-b4-vexpress-config-v2-1-8f848ee63e88@gmail.com>
X-B4-Tracking: v=1; b=H4sIACBNcmkC/32NQQ6CMBBFr0Jm7ZhOC4iuvIdhAaUtkwg1rWkwp
 He3cgCX7//893eIJrCJcKt2CCZxZL8WkKcK9DysziBPhUEK2QqSEscak9lewcSI2q+WHdIkRUN
 dS9NVQRmW0vJ2SB994Znj24fP8ZHol/7VJUJCZYXumlHXFyXubhn4edZ+gT7n/AUPv6/JtAAAA
 A==
X-Change-ID: 20260122-b4-vexpress-config-1d2051861d93
To: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769098532; l=1527;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=+ogL8Y9JfFVT4PZeH3nW6j0mjv5x8NLeWmHACGGNjkI=;
 b=K2I6FuXiRG+/mq50IPEZTztt0Vgtg/jo4mw0PlgUtz8f6zJMPNN/T9iigzUwnmKTDsOqWNXfr
 s1cESgjSG4JAFnY3/PrL2S6ikGp3gN4Of8yZPdjgIqQxoscMfujpmgd
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081540_025604_F1E98ABE 
X-CRM114-Status: GOOD (  12.51  )
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

In vexpress_syscfg_probe(), of_parse_phandle() is called inside a loop
but the returned device_node reference is never released.
Fix this by using the __free(device_node) cleanup handler to automatically
release the reference when the variable goes out of scope.

Fixes: a5a38765ac79b ("bus: vexpress-config: simplify config bus probing")
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Remove redundant header file.
- Add Acked-by from Liviu.
- Link to v1: https://lore.kernel.org/r/20260122-b4-vexpress-config-v1-1-3f0c85bc4730@gmail.com
---
 drivers/bus/vexpress-config.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 64ee920721ee..c1a7aa63f288 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -390,9 +390,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
-		struct device_node *bridge_np;
-
-		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
+		struct device_node *bridge_np __free(device_node) =
+			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260122-b4-vexpress-config-1d2051861d93

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


