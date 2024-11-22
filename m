Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0E5D75E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hR6Bt9wGJi7TnVA8wmi9rRKI8kqmYyf5TPLbM4hQqZU=; b=dqKMSNmTyfJ1GimfWgTXlAKY1t
	aRMO5pLA1EIyAIEMEbi7ym/QQbV4u6lMYMPFiuFtwgy0GYQPcVGgIL/NRuzInEMSvAsnNr6M8zQg1
	+wmybgD1kdHVBub0mAy1MnLeEPca3J/BVQxnUfuWULH6B4tLLrzswWliBhgm2AK0ybRMVhc7bn4m9
	rqll7LM8uIOZcHRroBd6WPu+Reyzx8Z7QLvN+zROQWIxDHR3eQpF6NsL+B+ZDoZFtEzb208/RJ6BB
	43yycHiawJuB7xk/86ZnBSXKWGXj6TabggMOeYlSq8+RfTsEnQFAHSwkGBBmwc2XoHbFd82vEmq+D
	l0xKYpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tETxC-00000002YX8-0xq3;
	Fri, 22 Nov 2024 13:44:10 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tETvK-00000002YHO-3LlV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 13:42:15 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ff5d2b8f0eso19688131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732282933; x=1732887733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR6Bt9wGJi7TnVA8wmi9rRKI8kqmYyf5TPLbM4hQqZU=;
        b=rwLNUOEPP+sPoN/WvL0BJn1keceDzPAbWqWvOKiUTLV8KLTVN2bM4fXP1tu+wewKHN
         1uOzDax4x5hNkhCP5+1APTMWPnaJcSltxZ7ncSAnemW3J0CsiZzE5xD1PGrRL/FuTS7y
         FZ5/VXL0k2t9geEWUiSw0BsQ1dFS6P26rT6ZB9+bsQn/yWubFj/g9Wo4jtA5I13+TQt1
         Q1R9QEp2FUxzj5mj8aICfGqWHQalzBjQ0yhfqKnlc+LUs7tFyL/3V2xaZFcuXMl4hSjh
         UVb4fCwCD/jDOgIXXd0mas0MTEvFca8pHKeXod9FuRwLADzEhYbq+hZnH+QbzSJXrVeM
         +IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282933; x=1732887733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hR6Bt9wGJi7TnVA8wmi9rRKI8kqmYyf5TPLbM4hQqZU=;
        b=jI8uBLWBld+DO1BzI54RtVjLzKQ5hIVJoPkm8FlQPBxFTjk+m4gdPorqHItOKl9lQl
         Dlg+i/nDFMcmr7oKY6y+Obgkx6inmX9XktuRdBFN8uPkezpiJoBaaerGYT6W8/+emuzA
         79CwU9nP0xLZZ4vgOqPu2TsE0uVyKK758t+RchnXnzNhTpQ+q7HHc81YoKwzuyJPGhxw
         a0lv8mrDfWuCzJNkN1wJj0OgqQbzCpfoQnexXQhULb34qcPLYBH5c6dGa+R2qUm4fx1o
         29hCdib17aKPglngSllswA0syOxDOFQrOuI4mYOOZOECyCbnSmnhMvFPP4fLuGKD0q0r
         YRjA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ecSAAJsCQkXf7GuQTUD45rMZ7eaeFxqkNmFztGulWS5cN2+K3+DN4yUqCiYd+66ko5qVa3cASxhSFDDTC3M8@lists.infradead.org
X-Gm-Message-State: AOJu0YyYjaPZy2Nu7RNpMk2OVR/TnFGjhc4PBYa6nqZPlAO72Ghie2nC
	Y/IP5f3Hz/3XlMOAFVVUpAXK+EfZg1Rho61D+os2uAQ9Q3wb5H3gs4vE6CHurA0=
X-Gm-Gg: ASbGncualVxqBHQL9qsoke8UZ7chVlqxY5uB2iRnG2OwsQUvHnI5VeeOrt16E2gVC32
	EoVK7IuTNumdETOSUyXd1wpFofzQWQYzGqKGTPsGlzXH2nu6R00UvFNTLmzA3piXi0s1IsEiA7q
	7wcVw00wvKEGjiWppcKOi0YXvpPQk+OB3h+1Rey6cPccFbFYAzGSufBAibi8ZRA8hMOY/V1y5fB
	/BlDAStxOKIY7RPNX05CHGyl+4QbHFC2F5lkQXkX5TFyc9hDGKohS+QRzv6IKCufQuFPpKz1DbK
	CaanhS+F0LbjX/cAh3mbvIZh
X-Google-Smtp-Source: AGHT+IHyw3GH8RrHFNfGtL+1PQD/slLLct9YZQoWaph6bHJlpew+jBHD6XIcc07hIt3G/uvpFcVtsw==
X-Received: by 2002:ac2:4f11:0:b0:539:e1c6:9d7f with SMTP id 2adb3069b0e04-53dd389d698mr1582840e87.25.1732282932796;
        Fri, 22 Nov 2024 05:42:12 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2481e73sm376432e87.120.2024.11.22.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:42:12 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pmdomain: core: Add missing put_device()
Date: Fri, 22 Nov 2024 14:42:02 +0100
Message-ID: <20241122134207.157283-2-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122134207.157283-1-ulf.hansson@linaro.org>
References: <20241122134207.157283-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_054214_833946_DEDA9656 
X-CRM114-Status: GOOD (  10.46  )
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

When removing a genpd we don't clean up the genpd->dev correctly. Let's add
the missing put_device() in genpd_free_data() to fix this.

Fixes: 401ea1572de9 ("PM / Domain: Add struct device to genpd")
Cc: stable@vger.kernel.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index a6c8b85dd024..4d8b0d18bb4a 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2183,6 +2183,7 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 
 static void genpd_free_data(struct generic_pm_domain *genpd)
 {
+	put_device(&genpd->dev);
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
 	if (genpd->free_states)
-- 
2.43.0


