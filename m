Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5611CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z1upg+k8spX2bUmtfIe5RHFhSTkILh8SV8rlR73FFnE=; b=IeJU43QX90rlNkeHFWD5cqkpEv
	DWLLjDJ28PbjkxhYzVW163eJF74WIwlynrGbBoP+Yvld8dceZqf1zD+UEexOSQvtAhifcSw42EVXM
	eZke3E/qGw3t7Xxr6HktX7YRtTrKlP7b/nqzHpAZCE9LobqA7xzwTwyhbQU13W7CpYZIeG0l+C7IP
	GFi7EfkiwZAO1f4sFYG9vmkWLg9OLmxGtGUbTSKl6KglPLoNQJpTYa3vS4jU73IG6AkRT5Kp11h0x
	U1z8fw1KSl4hKuWZU1eaYvUHoR1N6uVMK67NHarEmHXb39n407TdOdlECWg8/exMA0xjVXXhRcrrQ
	T+n48HFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJe8-00000009hwu-0UAc;
	Thu, 01 Oct 2026 16:28:36 +0000
Received: from mail-oo2-x2a.google.com ([2607:f8b0:4864:31::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJdn-00000009htU-25Tf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:28:24 +0000
Received: by mail-oo2-x2a.google.com with SMTP id 46e09a7af769-81f55c19dedso1840686a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872091; x=1791476891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1upg+k8spX2bUmtfIe5RHFhSTkILh8SV8rlR73FFnE=;
        b=Kx4s1NRcO8g6jJtg58dmTAv9iM/WkcWp1CFunHjlaybfGRVWD0WOjJCNpz/pBfVL3F
         JzUAqpd8gfpDfX2Nr9j6ZtrDjgUf3NlzvvbMOqFG6sF/C77VaImB8YhE/QlEoolS26fc
         QgMcFh+JmLxncY6lS99ZZb+EbopCnuDUpwk1OgMi6mQ0+bsrFvmXZMzglOJK3gKj6h8C
         pzJu31kJfOjKnvbs8BSnJOmoC2dCGWKVD1xGZzvJ5B79afcpNZwUdle1dUNVxA1xss/L
         G0oJrpwOoJMkQ1J6pMSvZu7gyW/DiUoNe+90mAy8Rj5Yrq/Qwj81++OUDIfFLPhdqdJT
         xoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872091; x=1791476891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1upg+k8spX2bUmtfIe5RHFhSTkILh8SV8rlR73FFnE=;
        b=LQQESbLvk8N7ARgD4oJ5wIEcHrJYvKxQjGIaM8SuxsO6Dls5yLAft0T3rmXSYWPb8N
         RC0KFL/83k/X5cIKiQr4fbkUXNYseH6UtQAbqgeCOoujzBemBxTVCVpuiMLldDmmBm79
         /eKjWkvL8vWwW3pZirheZsdGe/hHVMrjTnH4GPQWVq3jl35SvTH3R10uaew1pxZTGTP8
         9BX9qbhV49SPv9zRP49HUQ+P4Sa/zOwRw5VihrNHDd3aZTxqUIox+Mr4EkHZwVQyghLv
         tDbpsv/rwU9aW7P6cVCmjrfY6AWXW2LXb0w/h228ionQK1HJ9QfDtkT7es7VcWz4najA
         jLQA==
X-Forwarded-Encrypted: i=1; AKwUvBzbnbBudp+zWzIa+ccSI+r1Qdsc7WTFP8GK4ss3AcxAs0sy8JXMsg0kg1M+QCKwJYtoLkB1utJLQWfkknbybRaw@lists.infradead.org
X-Gm-Message-State: AFuF++ln085WfA1XfHxBhVebFi5Au1oi1Ch8DGpOzLyC5bsjnwBvCVf6
	L1lGBj9sehWCQWqG81dcHDl1zw2k3NZ3wbujeFjoyn2IDjFl2XcU5kDb
X-Gm-Gg: AYBFou2cOHtn6+CTCdMPIDHxWkfrvZI4DTUhhXUFN630yWu7taDQGJF+pjfrJHFfb2U
	tD/eQ9U38pNm1o6F7NXU505H9obP8GGPdTq8AcK4pJYNqK5rD+07NEfhlgqJTNc859tGrJQcq2u
	BXLspqLIIYopHvEoBeT55JemK5IhPmTr0fzXw+jh3c8NGGHTKq4OkBrg8xPeAXx6i42OZsbsmbE
	ZCdcHdegVMD85IOD1luttYyJ4oaQsSCkXdYkiko+jyR1z5FQN2DBZ0dnrtKaAPIov4LxrOlBUKS
	i9Ni12hjC+5M14WrTmbQvM8oE7NXB5ry58ESpH6sTEYqRYpvw+HujGcdeND9DHMFf7VtJ3yYPNR
	C88FKkoH/bj/mnyHiE5JZlizW1VfGbT5yknCNFgMlNH5ClGw8RObkENHhYT3d9NsWqhh35CeO3V
	EGWHmYzCGL0vG2JNJ4L+s4/Sq/XpveDIyBqE/slg0pVjRoj+WMBEkmdM0W3MNt4DioxqV+Xxifa
	h25PW9Sx9/yT7uyF68oqu2XH0lWTQXFFbnEdHP9TOfZCIWn5IhX6XTIiePwqKEpstt5SQvdhQ==
X-Received: by 2002:a05:6830:270e:b0:80c:6371:21fb with SMTP id 46e09a7af769-82282a72582mr154136a34.16.1790872091352;
        Thu, 01 Oct 2026 09:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227a66c6dfsm219239a34.23.2026.10.01.09.28.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 09:28:10 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pmdomain: ti: fix device node leak in probe
Date: Thu,  1 Oct 2026 21:57:40 +0530
Message-ID: <20261001162755.50666-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092815_551256_E390A6E7 
X-CRM114-Status: GOOD (  13.29  )
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

for_each_node_with_property() takes a reference on np each iteration
and drops it on the next one. The two allocation failure paths return
from inside the loop, so np is leaked.

Put np before returning fixes it.

Fixes: efa5c01cd7ee ("soc: ti: ti_sci_pm_domains: switch to use multiple genpds instead of one")
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index 949e4115f..9cb6133fd 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -262,14 +262,18 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				}
 
 				pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-				if (!pd)
+				if (!pd) {
+					of_node_put(np);
 					return -ENOMEM;
+				}
 
 				pd->pd.name = devm_kasprintf(dev, GFP_KERNEL,
 							     "pd:%d",
 							     args.args[0]);
-				if (!pd->pd.name)
+				if (!pd->pd.name) {
+					of_node_put(np);
 					return -ENOMEM;
+				}
 
 				pd->pd.power_off = ti_sci_pd_power_off;
 				pd->pd.power_on = ti_sci_pd_power_on;
-- 
2.46.0


