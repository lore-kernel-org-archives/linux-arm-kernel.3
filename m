Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997DF43691
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bH6jMbcTJb5ej+R0a9MCxG7qrcx/3nMs2OEMFRxEA/Y=; b=vmuaBEmj6jfgcMwURDJEDakA5r
	Ram9o46fgWwFxSGaaezwhNvmA/I7+UACwrzqhS0+n5abfKj95MX6mkmOR0oqy7CSxpdzhrQOk/gue
	9v9NFPuZKr+W8MIf0Crh/fFmbzvEyGI5J42Q0hwYsfOn7l4mYtH6T2yNtL8RYgpAuzwKnPk5w0r2M
	lVDb7eLCGtVymptHUUzWKGUS6kJ+v5HsIJRu3QLPxOpE2Rb1qZSs4keA3sfMcFkO2f7pdNoAr4kPf
	+UCiT/dw9YIQ/Wt2ZB3FzwSHKd1zbD2ZAQZ8quEOeAShHJCKLEB5E6taXwdgCMpZyfyf3eFOnKFS/
	F1xWa24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDh94-00000003xsB-0ifm;
	Fri, 17 Apr 2026 11:13:58 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDh91-00000003xro-0fnp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:13:56 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38cc8708d76so4405951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776424432; x=1777029232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bH6jMbcTJb5ej+R0a9MCxG7qrcx/3nMs2OEMFRxEA/Y=;
        b=SIEOUplN8Gs2n1G/v+e7tQfvqhL9UWZVE1awDBEecWgn1CXcGtz+IScQEtuExU//ZS
         d20xa/YovXd4xnPf2o8w0Aw7bD0ukv7yKmmin3kdcsiSHdDuLNLaqlqYnj+xZnvOrI3G
         NyPhs9iEsosimcVo82AOlGm57FDIGTrRJyT0h2lARq8PRKVt2sK1lzCFVKGEbZgRBPj6
         LqO+Lc71q/iCm59pvwM73gITDdSEqiI9Mu01v/p5ql0JZruc2+WMyUiba3Nj2rep3kkL
         HXOaDITtnqN8THDBEh9gYoTCiGmq5phYFKBrKdRhhMK5LM0RK9vIVcPpM7/P7AfKievW
         28/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776424432; x=1777029232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH6jMbcTJb5ej+R0a9MCxG7qrcx/3nMs2OEMFRxEA/Y=;
        b=Fhg3XnZLAfe0S6QWRC1b2bam8GqPoPb2880GUvrPHuhqveltvM2nytsuBU9cVi7EUc
         DVOU5h0j/H1C8fM1km+X21Lzad4mGztjRJD6TZY4uhT4dT2EFvFk7zB1AAL10kCa1GAv
         qe0HxnFE9O9PjeVQT85vijhQF2UDBdcryeLbX8vixTwojx+jnpxpstg1M3ORmSIOIZBZ
         H+34rIO89zs0N4AitZebfQKp0yKX/cwyGuU/8lckO7D52svTInu2vTbwoXXWdewve/Th
         0N581/ciefEZUVls8Y3wxYW+dZs6JJuhf7X29uxCqyVjLPCKLsmStxweoX94zbkhwarO
         jWpA==
X-Forwarded-Encrypted: i=1; AFNElJ+n3ZWnsVcTN0ufF6HEl5sl83n2MU0eblALfh4NEYWf1phB10YMrvh5hd1OruXLTncffMMalujtA6N9CTNfudUD@lists.infradead.org
X-Gm-Message-State: AOJu0YyXvXtfdEGy7dujxWvCY9BTFl19K9rqeV4+emr6YnJLaKxpfN4T
	iU1QPEJ9Ixtv34qmYJoT2KpBovC/x6ylTmTKCOFVG3mb6vv0kXTtCFL31DNtC7TfnwWrv5/MLlr
	Ru0hm
X-Gm-Gg: AeBDiev3L9iNfAlFBptmYHeoUPYY1BtgQa9d20WrYtxqIKCP3Oy8LwKpn3+KZxun2AG
	V1kDAnU7Az7udeSV6a3rNxU8Ra4mYNwZ+76UGEEOjxpCIMUsIGu1jSOEjcwlNycNtKGxNbhySjb
	+xXf+WLrhiAPrWRZ3xJepfrdDnD65O2dP/wYAvSbNnYeVnX5heZMhVLsvgBg/VFaHUirAMPROa3
	g4zOB6w3/Lnx3usoDlNtMYIWh8Yy5u3pWcyDEdU4yszxgqyyJLEof66JZs97zr2NGyut0VzwV2Z
	nlyPKYWx6d0ArBYV1CE+fRWmFBN68A/6QzLvJaMZiEwUHs9P7ML3z/VwkBY512ZgVfz5FkHXFoj
	jHe43iKf/jpQBbZIUmpK7/veSK9oPHahagNQ6l2B2GjBh73y4Cv2D8tA3y9PyOj7dDmV340hLMH
	KLochVllciaMuLqhvgm06fAIl3/v4Dt49UpeIexLR5qJfbcUDVlJ8txq5c3uFZdMFgWW43dSnHH
	ZrgMMIRLMk=
X-Received: by 2002:a2e:bc26:0:b0:38e:58f1:99f7 with SMTP id 38308e7fff4ca-38ec7b61afcmr6554131fa.33.1776424432285;
        Fri, 17 Apr 2026 04:13:52 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb733847sm3086691fa.34.2026.04.17.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:13:51 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Marek Vasut <marek.vasut@mailbox.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] pmdomain: core: Fix detach procedure for virtual devices in genpd
Date: Fri, 17 Apr 2026 13:13:31 +0200
Message-ID: <20260417111331.158190-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_041355_365066_B3860722 
X-CRM114-Status: GOOD (  17.73  )
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

If a device is attached to a PM domain through genpd_dev_pm_attach_by_id(),
genpd calls pm_runtime_enable() for the corresponding virtual device that
it registers. While this avoids boilerplate code in drivers, there is no
corresponding call to pm_runtime_disable() in genpd_dev_pm_detach().

This means these virtual devices are typically detached from its genpd,
while runtime PM remains enabled for them, which is not how things are
designed to work. In worst cases it may lead to critical errors, like a
NULL pointer dereference bug in genpd_runtime_suspend(), which was recently
reported. For another case, we may end up keeping an unnecessary vote for a
performance state for the device.

To fix these problems, let's add this missing call to pm_runtime_disable()
in genpd_dev_pm_detach().

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 3c095f32a92b ("PM / Domains: Add support for multi PM domains per device to genpd")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4d32fc676aaf..71e930e80178 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3089,6 +3089,7 @@ static const struct bus_type genpd_bus_type = {
 static void genpd_dev_pm_detach(struct device *dev, bool power_off)
 {
 	struct generic_pm_domain *pd;
+	bool is_virt_dev;
 	unsigned int i;
 	int ret = 0;
 
@@ -3098,6 +3099,13 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
 
 	dev_dbg(dev, "removing from PM domain %s\n", pd->name);
 
+	/* Check if the device was created by genpd at attach. */
+	is_virt_dev = dev->bus == &genpd_bus_type;
+
+	/* Disable runtime PM if we enabled it at attach. */
+	if (is_virt_dev)
+		pm_runtime_disable(dev);
+
 	/* Drop the default performance state */
 	if (dev_gpd_data(dev)->default_pstate) {
 		dev_pm_genpd_set_performance_state(dev, 0);
@@ -3123,7 +3131,7 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
 	genpd_queue_power_off_work(pd);
 
 	/* Unregister the device if it was created by genpd. */
-	if (dev->bus == &genpd_bus_type)
+	if (is_virt_dev)
 		device_unregister(dev);
 }
 
-- 
2.43.0


