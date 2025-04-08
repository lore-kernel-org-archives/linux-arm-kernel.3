Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE995C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=; b=Gxi39py2/9fb+Kq5ZiRh4U3f4l
	CWozQ60kGkSum0/CsjoIYyzenhbihDhhSSlcJD8dnMYKzL07X31VgJswp0MJxE3GhDscpO50g7IgB
	nofWHBqVj46bug2k3g5/wTEokFhGjcQvcHg0DcgHRz6EdjvEBjm3EGTYeacPe0jZ4MnhoCR8Eh6Qe
	w38/6FHVwdQUWZofsz98dyuG3KobnN6drqqcl9IqSliTKBhXKQ2QuYMqr533nDfVyO2AGiUFQvOn1
	/PUQuQfLPwrXZPjUi7chj0cTIeayot1Jzj3buejP5a2GPyer7rZkXAVgTKywPUHXa/LaX8pu8hmib
	gb+u8VsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Aab-00000004WHs-0Xfg;
	Tue, 08 Apr 2025 15:10:13 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AUx-00000004VJD-3Es6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:04:24 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7399838db7fso5134959b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744124663; x=1744729463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=k6KFgvKQYRYg2y62YzjMAvCTbBi9sBg1Js0feqyWFbr1wvKCh2FFJBa7A32wkQ8/hg
         bEWcNUyTpjFh1oMXEG/l5IoojBPXo6dar+f1d+2jhVpY/dIj8FJ1Djoqk6fcTbZBrB83
         FGQmG+1vhltfq3INq6fTRY1QyX44wQqjFjU4vZMRnN+LXhKBNpCnOCJS4WmVKB2LSf9P
         FXvmQZVzoA9Zp82UywFpCJ5PyR+/6u128ENZ9FW4t1ephzJb63ZRj0yaApQpCYhq+mTM
         2REU7hyC69n2jSAqgyijfknQPM7cGo2hw8UmHp5Wd5zzw7QFb/Tihc/nrXsUevEHetVq
         Ck2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124663; x=1744729463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=RP2up+ipb0SAtofqMyneLSCRt0zNP4CZpVSlKCbYu8j7nxoforTEScj9FjEkjwuFyD
         eIpYB6xe9/WUcMWT1sTczxeRSIrs15T6s2Jjlh1zRFRoHfqsi9bKWfn6+3RA3LhfbCo0
         QbSiEv0oeGk/ou5sG0RBw5xR/IijRxaMw4FJGnXil80QwW7PU5HviqPYWZH3z3/IWe5w
         1dQ3IaA2tL7AgMrvRc3RCFxHptBWdAtz8R33KWs878wiQdx4xpfHfVn8kyugZp9SSME6
         ykbNBJ0X1xunp6ifpkNu4ZW7PynccmMh70//wT/ZoACiWuGFCyPcF2TUrEqiFq+R1VlH
         RvOw==
X-Forwarded-Encrypted: i=1; AJvYcCWJPa4qjkJjflunCtK9zmNsSY8i4qvpENNWkalzL6mDgfLe5RcYSb5zjhe6OAD1Oxx2at7erka/sVt87j1/jF6s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6zFJJsR03pdk9EXetbmLKqk+UWcRUAG2srpVE5fRfajMmjUhE
	EhE0OWjrpXuUTTTZpmj5kv+XDvwahCJMZj0UzTqZ4veRGdOHw9lLbCcs9t+URaw=
X-Gm-Gg: ASbGncuxHwK6g19cyPbSoKV2EbERNn2tDijgItg3bW21cJIZw0nwV4WVrqPjyYIHZ9M
	Ua+WsT6+7M8PqRob3+RqltZgFEVP2ECulbJWfY2SpC3ylbD+lSWujqi3iVtV9GzWM7YXtwIpvNs
	xuduNU/mRZP3920PzxDfN+tPtO+DNgBSU5bsRRYhANRQ0YSWuh5bLCd4bbBV2KSL+he2TAWaqt9
	EfRpHxr52AnSktDbA4XQW7QKgnobUbBIpG7r9VVCTEzlwRv9eAUk/jfbPEYs7eS2HIY9xcPMEgx
	BPDcwbFBhBNsHpIclLGCUJ1mowr99eum3xGdwY4IKFeY3Rxl8f2OnbBZk48leHxW0p5YjH2VgKP
	jJMuMQA==
X-Google-Smtp-Source: AGHT+IFcrw32IadEZbTZ2yTefdbGLJ4deVn8ImGq3fcHBOxM9j/Ojp5mMqxmgwQ1EbK8z0e1SyOJQw==
X-Received: by 2002:aa7:875a:0:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-73b9d4019ddmr4916731b3a.11.1744124663010;
        Tue, 08 Apr 2025 08:04:23 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea097asm11068474b3a.90.2025.04.08.08.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:04:22 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2 2/2] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
Date: Tue,  8 Apr 2025 23:03:54 +0800
Message-Id: <20250408150354.104532-3-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_080423_805727_09150544 
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

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index 17cda84f00df..dcbb0ae7dd47 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
 
 static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scpi_data *priv = policy->driver_data;
-	unsigned long rate = clk_get_rate(priv->clk);
+	struct cpufreq_policy *policy;
+	struct scpi_data *priv;
+	unsigned long rate;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+	rate = clk_get_rate(priv->clk);
 
 	return rate / 1000;
 }
-- 
2.34.1


