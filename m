Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1542C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=; b=wtTbiQ7VWc6gJ5yqW7TU3zcTh4
	xH+mQC7AwV21DQLdG29AgWd3wOxD+2uZRcGRF9XOfbuZSGCMTYnmBkN8SLyGkpuQeIBPShIfsJdvH
	w4DKEx0TISrhUxMDNxp61ttMHpAEyM+LzG5IezeypJ2ph80iSEp1O70xqsNDdgPgzwOH+N6KfJYWk
	gxmXfn2Ox3trNAAZC2tj2eadNo8ofIAmYzblTYOPsBE4pTiJ+oLrX58YV0tVuxvFZLivRij9b0qS/
	dl/tkSnhK4+ADpX2ErYmNf1+g0DOolnml5GiJll//FPwdIB12KL/kYOavVO6I/YShvjbH7X/fR/XA
	1Ft6xFNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLnL-00000003HYU-3erk;
	Tue, 04 Mar 2025 06:30:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe9-00000003Euq-1ut4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e50d491f69so3728993a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069252; x=1741674052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=;
        b=XEScohW/ktt1cHobt+QOwDI/KRL9HmXZAN8RgVbyP/iCdjoLFAr8vH4hDhNFcmx+Aq
         EjFPKmNMOhvgpB1ImYvv31ig73lcIz73z634Ebj9wr27NK+mjll1DxMisocTnIFC6oW3
         lWddPjmogsS9R1hp7Mx5owy6k5ByqrQmcJQh1lyV0m9iE+pAYUTGW55d4LXAWr6zlYbe
         1TmRMX+qNrnvM1YNS/nQCy70XmisuGZRvfQRxxiY06D+Jcrb/JicFR8K9Fq+cSfwnMSv
         A/4S+bj7L50GQrVFb1SD8uI9EzbfRAWVwwbloaV76KDBLPnXPb2Q+Pv/0PdlpbpcvtVz
         jRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069252; x=1741674052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xva56AKX2brNKS42OhnyZtYq2t1leFGV1oKmYOkZd/E=;
        b=fx/SIunRey77sIBHk3Mujdwg1o1RihIaQ8fPHocrZAYKI3e6I8aj+TkRjumQMdKufM
         lsDc8VgQ61ePYHiJ9mllysBhEiqR8Sjcx0bwZQ7R8++XMmBS0w2HSus0G8KGbzO8rSJv
         2D+fm2FjopsQDtgqN7ODNgZcgHaTtCu2ABIJ6QECQYharzR4RVQKw2JnGJgGyqL8MA+j
         Wak0O2aPy3iBvKRuloUfjRtuCsmhmwaSD6rWmvdGdVvBAoac3Q8OOrXhjV+ywNDjZuja
         R80fIO2qsQi4n8gyBEKndumfcwnyg940ZfOdKXlazcXjFjJJfkcXqS2tn/BQljULKJBM
         RkVw==
X-Forwarded-Encrypted: i=1; AJvYcCWnocXmbIYrLKTuYsoLxzidO7tClTw2D/ze4LQwDgj9sgXjSw22z22X+6HZYEkIKqO9E+8rqy+wEJMZnR2hF2ac@lists.infradead.org
X-Gm-Message-State: AOJu0YzF6eWfgzd0mx0sbIqGeNRCmbXHuQdSfptIwBa3sN93BKgZKeDD
	KS0IpbAIVghh5yg5tSOZxdqopAB0Ge46yOU7nuNgh13Vwmy+CMU+G08FfQ==
X-Gm-Gg: ASbGnculX+lyQFaPceLh9sn1dASs7XrfjRIKojt0eGod+EcUGBahyjbcH0gi735OKkZ
	o4PPL8cKptNGg9P9wcbqIZWYp4dkm9l/OWKPyBWEQBoE9dOn509N13je96C7VWE3kUCfYq4eWoD
	BhW4LEx9tW69kJoM5/qtiIPADYhEef2YO1CXgzMREab4UwccvcXNxYNkUcfNoEnliG047Q5fvIa
	NfBf53SWVOKz1P53uNkmSJP3WNCRcElLjC9oFBqt1HVIVoaFB8zLCOGgrJF4IxaeeqFfcU8JTJq
	Yvl7ssO0DeFkUbv/A0CsWEk+bjtTcTYL+oGtSwkGN+wZtTm+Lrh8SD/akx8JuuKIyXvBsZmpXmu
	+t+kwQazRgcvWn0U=
X-Google-Smtp-Source: AGHT+IGqxGbHhw8vAWP2kBYNSJUUX3w7Bp7K4lE281b5Teg6k5sdnOV9KvAZu8RwZYv6Q2M+AHVuhA==
X-Received: by 2002:a05:6402:3511:b0:5d0:8197:7ab3 with SMTP id 4fb4d7f45d1cf-5e4d6acd50bmr17383364a12.3.1741069251986;
        Mon, 03 Mar 2025 22:20:51 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:35 +0100
Subject: [PATCH v6 04/10] mfd: bcm590xx: Drop unused "id" member of
 bcm590xx MFD struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-4-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069240; l=805;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=shsY8picWdauNM7HAi5QIbN1+/obURFOkQY2q4XNRbc=;
 b=OVhUKUbl5xyAk7zk6jqImezy1Yc4vGpEyWmiVYIC6OqY5Te8APboSXtlIjB3/WJXSZo75TO6s
 DYaWzcPvgBoAXjtRtdrYvmlbffH7EHq/VyPjjZ+YAsOTX/yBX4WS97y
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222053_501506_FFA3E5DD 
X-CRM114-Status: GOOD (  12.97  )
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


