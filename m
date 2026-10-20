Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJP1HbQu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RwgbU4BJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=; b=CJP1HbQuwZ/2rB298RGaYq5lVb
	8Z9S1o2LHlsNsWbkLiUowmA8xaN1BFh65drZXoYl8Fx0YSyjdifUWRfz6F8we7zy18YoydXDnrJ4+
	lOqy1Bqyfy0hKqh8CY6Kty2tpCcoL9wbAIN4eU6ewBXx+6tVS/tWsSgS8ByRFmLHQ7C8BJCTOyuT+
	zbzwpeTMkrAbKj7jvjXSBROYKokZTS0Ho+vBKhx3ctg4s4tnGq/KKz65aVLA1yupwCG1bIiEf/DpF
	W/hH530nzWM+mHc7FKf8AomjK1UheAOV3Qd5JpcLQAqbvWMN619S8pZGkCuTs/ysXv7DdBc0ymCIu
	1TGqVP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8KI-00000009aFT-0t2I;
	Tue, 20 Oct 2026 11:48:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8KF-00000009aEv-0pG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:48:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-885cd98d226so259193b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792496894; x=1793101694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=;
        b=RwgbU4BJYz9a/RcEAI47OzpdcFz28emxR1SuiDMR1G5mr6a+5r8TP3Sjd1t4K/MSgC
         CCDW7CY60PfzvUrs75NOh790GOgMtWfHhv29R11+uuB0m8S8G3erCQqXZxiz//NVjZRZ
         nbERVHv7hUp3xiV6hE56NkAfENpbg1JVaMP770k5iGN7c+JKjDAqe3pL9zc91+IkaZy4
         FxhZm1uSuID6QEbA+Wi4/ohjFRXdcwQyI4ZT34voznhh9hr38iA4FeKxMbzV8AW4aaSu
         VFKc1i8SFt0fFxOi2a+tO9skaEqtiyrrly6CDJ+K5H94V6E0W9dKsHcMmjAxCX4+bBrN
         qPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496894; x=1793101694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhO5tZaSEOK7ztK6m5HAnmqct10WDg0rx6VsTraTme4=;
        b=lQfP1zkyroaDZPiK6/MqkFZJKALrGUwP4cAExUskqDCrzg+HLHGmgR7b7IKlxHzwo2
         lPcoOFGgF8wiiU73Z0yYUBTs+x4e+aC9e6k0FrOJyW2SnpsCwy3QvafgPatFBr9tjh04
         blN1SkSESMGcjPLKzda9l7yWDtZ6L7XjlgRjxxhl+RhfGPcGbNh9crEZXbhKxNxGliXo
         171Li1y0DQ/gcopHbDk0YVCmfb4cxOaC5d+XJmEG3X8cqh9LNvnBayXnnBmNlQEG5bWT
         FJLrTBzDo1+QgnrxmpbKO4xQI0VnNEJvx/lPmfOcBBHoiGgqVv8/CZpFbABtg2UElgN4
         qXuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF6hpw61CkfyLtfjRK7cDIK/qeIwuzedv1k/96mHBosFf6grpiCtz7x7VqYIImXJtFvuxp1f0GRHWRRcKLjm24@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5MlWIsr+eUamsiwjp85yEQ3CPqzvzJS49+VcG8BEqt70Zd/S8
	4u4+VlpIOlQkW3EH++RWiuQ8cLbjOndGuZAy/uvmdLxAcrjbE7xqvHcH
X-Gm-Gg: AYBFou0+i/5TueWdyYBGQkJHEJPEnRQJAZg9E3KriXmaw6VLyeE9VxpG8g51PqFISWi
	3Zbox8kfyU2q6EVx71vQYKG+xUX8peqau+1znE1NZEtdaf+iZFyAUvVK7ad9aoz7YFoFiTXNVty
	aM9SFz19WiecLe0IM/3gMfic+h1jC2H0gLbPR54SBJp76NJMLPNDEjuZ6D7ivMDM6pMZtAe7M9W
	rlSgKTKjoQY88YFRjwQprnuxbRvgOPij7vD5sNsSiTNtPxuLZzXpEfmH9ELUDnkYqr3b5S+3g4t
	AxlY7TPMVoekay4EOik+2ealMCLgYR1LYkCzkGtdUcPWdF3WTvzxF+ZHweE4Q85ufVH/fLZry1v
	rm0v0B1UbPRX6RuQsv/Mm3IxUup3VBl+pAvUczPDIgi5i80pTxZGMuPxpFUNINLKXxB/Wik1LXr
	2VvDwrncUBr3xIS++1qwUJOD8DuOfB6DH/X9/gjMkXRbHYnXycvW/ZxqPMWBoJ4h88Z/sVi6hl8
	gg=
X-Received: by 2002:a05:6a00:2d8b:b0:8a0:582c:5c09 with SMTP id d2e1a72fcca58-8a07bffd972mr1187619b3a.25.1792496894150;
        Tue, 20 Oct 2026 04:48:14 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm4761701b3a.48.2026.10.20.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:48:13 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
Date: Tue, 20 Oct 2026 19:48:07 +0800
Message-Id: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_044815_237388_C2BC9501 
X-CRM114-Status: GOOD (  13.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
iteration, but the four error paths that return after failed
MPAMF_MON_SEL register accesses do so without releasing it.

Take the lock with the conditional mon_sel_lock guard class instead,
so all exit paths release it.

Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..c067b6d57d71 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
 	struct mpam_class *class = ris->vmsc->comp->class;
 
 	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
-		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
-			return -EIO;
+		ACQUIRE(mon_sel_lock, guard)(msc);
+		ret = ACQUIRE_ERR(mon_sel_lock, &guard);
+		if (ret)
+			return ret;
 
 		mbwu_state = &ris->mbwu_state[i];
 		cfg = &mbwu_state->cfg;
@@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
 		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
 		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
 
-		if (!mbwu_state->enabled) {
-			mpam_mon_sel_unlock(msc);
+		if (!mbwu_state->enabled)
 			continue;
-		}
 
 		val = 0;
 		mbwu_arg = (struct mon_read) {
@@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
 		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 		if (ret)
 			return ret;
-
-		mpam_mon_sel_unlock(msc);
 	}
 
 	return 0;

base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
-- 
2.34.1


