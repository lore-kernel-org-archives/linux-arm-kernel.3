Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5614D65C76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YpBSOtueICApbmp1KfKlEaeRkXCsULfiG4miYoF8lTM=; b=iJtHlz7R3Po8O4MR+itvOi1YH1
	COCYE/YQ21DRpH8ZHzXgQHQQtOt0LoStV76pcBa5fMzXcVOPK2QhzZGJWToX3a7Lb8sSTgbBKbQOa
	VlZVSNGkwzZUXokk7B2mWYZO/Kw91iG68R7Tf66lgJHZKl0evj3ip9PIT+/pzX0kN0ndF56nOwdWb
	ooVuWv/k5//N86pK27KVNOvdV2uCg3Ge+H1jPGO59LEKqt6ycdnsKzs/Q7vTymaequTl10uMz2XAk
	iv6u8QMGdNwoxG7hhL5tTSMAZL56Y1w3WTvR0DUAVRrtvObbG2Yiiyh4bhLhxL5hhTcokFkV5S+y3
	ML9hPFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXsX-00000009hdK-3cqk;
	Thu, 14 Nov 2024 11:19:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWxY-00000009Vam-2Ijk;
	Thu, 14 Nov 2024 10:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YpBSOtueICApbmp1KfKlEaeRkXCsULfiG4miYoF8lTM=; b=f5ckScWqdRkCRcHWQ3zWC151Yw
	ycfHA01rieSEjfC/5XqeP1zBxNWq4DfV7kigtbjsY5jJM7oYXIOrK4xftsqAktPRSbx4mUhYeFEAy
	NJndTuOupgtnuIJd3EVjJDLk/WL5hh+CE2PY9A5qEs8UBeCnglRKLQ+utShMJmdgnfcbw5X50U5Kd
	a8T4p6FJ6J5vvvLcq2wYyqVR3EZk7q1tanjV07Yp1PNHAyXw1J0ol10we+anESk3l0b4W+1EcTqQE
	4a8+CH0e5lyzjvK0SuPuu7sXf0DKKnp45pAmzsa+TGBbSqqf3L/XqbOA91IQOVrjlDuDufCo1XBz6
	+y6bHXFQ==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWxV-0000000Dbm4-3CUN;
	Thu, 14 Nov 2024 10:20:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c767a9c50so4092255ad.1;
        Thu, 14 Nov 2024 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731579615; x=1732184415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpBSOtueICApbmp1KfKlEaeRkXCsULfiG4miYoF8lTM=;
        b=nVNf8iB8OWZN9uTmgA7yuOW5asvMm/WEOn7H3OqHFMlkjc9KUtfAbnmesfPCeo5v52
         lXKlKm9drbSajKbtokHL7XjJmwgDTjzD+8D7eOuosZiZL/xHNXKJplYMAvr/ASgouj1D
         zxPir4y5spwYob22F8gt+OH/P5dIsv3lw1GwigzHuUFRyVrYn2G/ZZ/TRwC0+4ROX61j
         utme9ER7hS3Z6KdXPQAGmQyepQF2RjedTkAQzx5vK06Nk7qj06kRLPwbaQjaIWxpNd3r
         ezp7WxqK2lS7zBhlHObaFwC/yZt9QHkrvzARCujilXxZhKtOZ5WTGIl/PSfs4a5MYh35
         pJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731579615; x=1732184415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpBSOtueICApbmp1KfKlEaeRkXCsULfiG4miYoF8lTM=;
        b=BBd1D50OuA+b7Q5GISP20AOVEdPDILHk50OJvpHMXYbf9S+6/WTEeX/QvP4uawNROK
         Z2sJI/FHLDDGmqe0uofq3nCVJJV+8/hJM3SwfuqAPNoZFCCi6BxZSZoraUbXGvCNKM8S
         w+DG/l7Jmlm7de9AGkBfG6pRBrf6VyMNZ5KOuQJJLuI8pBi56MyNEPbKEo2HkOlAw2Wr
         qk5P1R+Qu9nqGlZUgOqt80m6kizbxkFv1ol65P4coO7dHG4F4787L/HE3VrOoaNgwufH
         dYaAdWOicVPvFhO6tT3ftBQ6JdqT5e5CKugZeSfOGDuvEnECGoT5/fTsNNMT/GHkpPoY
         WINg==
X-Forwarded-Encrypted: i=1; AJvYcCULgWv86rYLAKKo98G8E/ik8edcVWv6HY2jFirGgLE6w28brhCkOQfwfrcxJs7HhoWKIgOn+6KowrbdW8dtQZln@lists.infradead.org, AJvYcCXHXP2UXxNUld+L6ZhorqJVXceDruidKFhYL5ZmEBTp6/fs4pPR3AhEROHcQ1vM4WeCSpv/agg+ZhnpWpV3xq0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc70gmEvytW/4GD8xWbZYYqVm2ZsF7kkJ4XxAaweMNLhO83HOl
	hGeGxdGR9Sq81j7Us2mRwBCWFyk6XZhf+Qk21gVTLHAvyFtx+bMy
X-Google-Smtp-Source: AGHT+IGmgU+mBxzLc6QNDijGpeoZEQ3ldaKJ/xxCJolxNrmQLA624fTfj+KnuVFiMsFaBXvHB17Omg==
X-Received: by 2002:a17:902:c950:b0:20c:93c2:9175 with SMTP id d9443c01a7336-211c502b5f7mr20482795ad.30.1731579614613;
        Thu, 14 Nov 2024 02:20:14 -0800 (PST)
Received: from localhost ([2402:7500:56b:5617:bc95:bb12:95c0:c1f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c4a55dsm7553545ad.69.2024.11.14.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 02:20:14 -0800 (PST)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	Jack Wu <wojackbb@gmail.com>
Subject: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
Date: Thu, 14 Nov 2024 18:20:02 +0800
Message-Id: <20241114102002.481081-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_102017_911355_4F1C3524 
X-CRM114-Status: GOOD (  10.77  )
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of t7XX,
change auto suspend time to 5000.

The Tests uses a script to loop through the power_state
of t7XX.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 0~5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50%~80% of the time was in D3 state
  when host don't have data packet transmission.

We tested Fibocom FM350 and our products using the t7xx and they all
benefited from this.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
V2:
 * supplementary commit information
---
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..dcadd615a025 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -48,7 +48,7 @@
 #define T7XX_INIT_TIMEOUT		20
 #define PM_SLEEP_DIS_TIMEOUT_MS		20
 #define PM_ACK_TIMEOUT_MS		1500
-#define PM_AUTOSUSPEND_MS		20000
+#define PM_AUTOSUSPEND_MS		5000
 #define PM_RESOURCE_POLL_TIMEOUT_US	10000
 #define PM_RESOURCE_POLL_STEP_US	100
 
-- 
2.34.1


