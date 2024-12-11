Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98008E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=; b=M7BY4NpaSfvKYX6js7q18zOQQJ
	urN9AiJsoYvkrkvbHskIEPWfw2UkOehBT/7JVtAARKB9FfT3t9HMhKdvSXjdHLzaopueXrCasjIBf
	U1CmiWq6UGDVNxElQ8wzPA8j3xFQgv2gTTjXzbwYE0GKbnePFfuPal1Dwz2NENfDTC1JubvoMVmDj
	1yRNDMfFfT05Jh8QYueJ676D8dWZa5f14xGt7dA2XImi2lwF59cprqMZLP+Y/lZo+KAxzCupLrBXo
	l/hUGXHiEkQV0mdU2iL5AhJlSazM2n3hWClNJ1yY77rLZsZYz4njJPAr4pM1n7+tIA2i/KcMAWG3c
	TzSVHuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKrD-0000000Eh2M-2eQe;
	Wed, 11 Dec 2024 11:26:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoA-0000000EgFG-3Nvj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163b0c09afso35131165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916190; x=1734520990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=jyWyc1eIjhrW5/0+AQk7cnoJxHee5hOg+vhjcKNBCsli6epH4B/vYyO5WrJUrqq50K
         +OPFFMQKg4dkXJFMoNCJoiJ25XI+0Xg/Vjj1wJ62Kp8VBTuYFQuFwV5VGL8CUoQGWRV4
         1OkYJnacH+pqQQwdjiZkJRz7PeZvtr+vCbh031f2KGebnjw2tntMT5XXL0932FNvb5z2
         AL9G8P+T6sjV4PzVdo29X9CixqacpUPvm5SnxSGv1WMUoY6sDNbemQOjfwOzEFBc1NxI
         TW5D17Xp4WQ/k3BlMRqux4hV0iaTNLdgI7lRDTxW6d3q6lbMKCYIH0iO140UCTRvri8N
         b1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916190; x=1734520990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=JTfrrB5+krVQqW9OOTtr1ohkbrE1rs0zV31ajVfR2hh7yozmPWObuWwcq0nYtpJPdn
         9pNfKoZCNEpZGvZnCYR+8XrhCFqFK4mrf2b6fjBUiRAG8+zFB/ElFcLxvUp5PSJ01HhO
         QO8+zH/JWWz+x/BwF6dbFcFmv4lxOtEycHg+Cc0goyBG6OMClpVesWl3VPDXVEHXom5w
         49+DpD4BROtPNVEJ3DMYwrup8ZzCB9CbYSY6g9+OTFCUS2tHVbrz47rrgzfUg7vuIJfM
         XAv4SS5+dEK9yX6KrETBUG4LSqJkbCMOoTgOIcfrSShFqTEXg++BKJTbTSR1dp3pcG7F
         ueUw==
X-Forwarded-Encrypted: i=1; AJvYcCUjUariHdI0WDob4WOmVYQ2tUvewqRei5cM0VGX9hPk7RvtEUa1ASV6gU1FF9hRfwvQQo3mv1XryGfv/niO1Mj0@lists.infradead.org
X-Gm-Message-State: AOJu0YzRwk6UwP3NyEeXtk39Q+yKONKhOPyMsPqv0DHhQxnsHs4O+RwM
	ul+wJBcQ8S6jQhD2+BPgH2CFoFk2n2Pe5Y6sDvKnLU3pZfY1EcKD
X-Gm-Gg: ASbGncvPQ/+dCp8bn51SyeXphn9v7OFpEQFGDrHtgdDwRJ0FxQiZRCd3pY+dbHNhhum
	WIES9T4orlKpVbZOrfItQ12Ya6y7pxbOO2S585YsmwqZVkesA1aNExpRBXQvK5fp1aEW3afIg8b
	CqdjV6v+0D61702rZa4m8ehP9WxRjqMSAOGspfbTkyVvzJCRIRA9nTK8PK1bWmEuz3PKOPN/awh
	OpZC1Jl85wxX2Z2rq7L8z0xmXZJLqx+WhBqLSgJI4cTxDw8opC7mtbnaHCaZmyYqQJ0Cw==
X-Google-Smtp-Source: AGHT+IGg44vKKbajgZGuP1n8MacnuXqDCWExV+Yd5IMtS3xY4Kb7j1HNlaUyN1+xFgSOQQMzckgSjA==
X-Received: by 2002:a17:902:ea07:b0:216:70b6:8723 with SMTP id d9443c01a7336-21778581e83mr41968685ad.44.1733916189869;
        Wed, 11 Dec 2024 03:23:09 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Wed, 11 Dec 2024 19:19:29 +0800
Message-ID: <20241211112244.18393-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032310_842485_5147CE58 
X-CRM114-Status: GOOD (  14.93  )
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

From: Hector Martin <marcan@marcan.st>

Newer device do not use this. It is not known what this field does,
but change the behavior to be same as macOS to be safe.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4dcacab9b4bf..ad6c7b8f290c 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -25,7 +25,7 @@
 #define APPLE_DVFS_CMD			0x20
 #define APPLE_DVFS_CMD_BUSY		BIT(31)
 #define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(16, 12)
+#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
 #define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
 
 /* Same timebase as CPU counter (24MHz) */
@@ -55,6 +55,7 @@
 #define APPLE_DVFS_TRANSITION_TIMEOUT 100
 
 struct apple_soc_cpufreq_info {
+	bool has_ps2;
 	u64 max_pstate;
 	u64 cur_pstate_mask;
 	u64 cur_pstate_shift;
@@ -69,18 +70,21 @@ struct apple_cpu_priv {
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
+	.has_ps2 = true,
 	.max_pstate = 15,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8103,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103,
 };
 
 static const struct apple_soc_cpufreq_info soc_t8112_info = {
+	.has_ps2 = false,
 	.max_pstate = 31,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8112,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8112,
 };
 
 static const struct apple_soc_cpufreq_info soc_default_info = {
+	.has_ps2 = false,
 	.max_pstate = 15,
 	.cur_pstate_mask = 0, /* fallback */
 };
@@ -148,9 +152,12 @@ static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
 		return -EIO;
 	}
 
-	reg &= ~(APPLE_DVFS_CMD_PS1 | APPLE_DVFS_CMD_PS2);
+	reg &= ~APPLE_DVFS_CMD_PS1;
 	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
-	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	if (priv->info->has_ps2) {
+		reg &= ~APPLE_DVFS_CMD_PS2;
+		reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	}
 	reg |= APPLE_DVFS_CMD_SET;
 
 	writeq_relaxed(reg, priv->reg_base + APPLE_DVFS_CMD);
-- 
2.47.1


