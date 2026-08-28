Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC979C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=; b=eeA6C2j4ubUXfEg2v0oSfDG4rH
	WxhTMHEFPC+7SgFx6wx3BLLRbTOidR0whqzCim7EsixjurvMXpZbbb39Ma/152biXVS2d45teCaky
	uo3i8b5AbRgjsYJp75udahNPTEQHSiAcPAXemfKeR1E7f9dWxbPzRkGdYLcGXzXXdyZchWHIuL5me
	s3LpeqUWJmMgQ63yJpJwLGdVlYr+isnhTp4wx/g0HoORf+m3ca3OYvnJMKu5t3MWAXa2JzidRxA+b
	47bIdW9xw7WbOQxup6dCUZa/pedXsQqgpgRSeJCt4vTgdz4N7Iupc0jija0sceMydgCE2EQGXUDNH
	/H+lkL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpGq-000000059kO-3Iq2;
	Fri, 28 Aug 2026 05:36:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpGo-000000059jg-2oF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:36:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47fe89fb333so323629f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895413; x=1788500213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=db96GG7zcTrClfHhHzBtdEIwFRQhwCTl9omi+FJF32fnSMYP6FGlFXVjc3oIZFu/h1
         J/zE1HVV3pkyXt2mBqMHrBk3/kLAkxy3LON3NliydBi1Drj05TwlK2rj+KOZDyvOm4DC
         Fhn1CImh2yuuTPEVEbZ63A/q/TGLboN0OsZvR/DWV9Uzzx+hD4/1sdjg+qjXpC0rM8zu
         RTwOgrFa/6Dn2Cr4qMdOLMJfbERn2NqhfYkocGuBVegVv1ng+KMH7ZeToIHJF+zzBNKH
         NKdnd14X9QrbEaCJ5Y0B7E80EIyZh4L5QIrH9zOdhK289+QbR5/UXpR2h1lRSABs8lBQ
         x0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895413; x=1788500213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=OP9AKOIkbtbC1DalBdURW9YFNp6x9okBHCiyF0hvpLB34rzovgBJjpBM44ydEJLlaj
         rSSZkJ68s+I0tpflYjvF8nes0eT+opBrN2eJA1HBOrjcCVsi4qkieKgroKT0edTvJEcE
         wZG0PxnSYYRExFi0xc9s8feZ/lijwLdAH0/hIYOaDytvIWda9Fhtxi+teFynK7PyuxGC
         WsrL/xWPYDRzXAEcOtPF5VrV3B/j0HaoABbDtWPLZJy2EsCdrXRRFnbqAAzpVZ/56F7i
         FnBDe/NyR2bZnlF22gBdTNhnRH57bLb/v1fBXuWOzF79MmsfJOHpHM1spGEok6vrBSFm
         BVFA==
X-Forwarded-Encrypted: i=1; AHgh+RqI/sgnVJ6PtysOTPWBJza2cTEzRrfCR+qOCdfhgsniU07inoRgc2BqYXkITi7YKBHu72GESlUGOtohIOGGLTT8@lists.infradead.org
X-Gm-Message-State: AFuF++mYnmUNXPejVz0sdkO0i8sxNEFzRRR3+fe3R35uJiTn25Cng5fs
	1JY7IwgpReyTrEnifCPKs7qJzg/BqySYI/Oa4KGyptrTA8FjTAQBJQNHoxWDppv08vJC4AxTNUR
	MuVp3
X-Gm-Gg: AR+sD13bYb0lJ5SoWwFVB1xxT2HHdNsFOaoazXoRvqtN8YM9TQIIJa1TtbbKkaZ0buB
	KwM9hZW+uNMdLnvqhs+IaL8nXufSk8Md2MHxeA7CcjNPvVjCHzparJ/v4AsEHkNL9hHKl5cFYje
	mTzqyODjolOinMDO5Zdx4MNXDXjgRXtYnDXrNCyADvgO0//TH7fjGwfFUE1nTT8q0Utx0YRRIe1
	RE+TjYicR7UuZFikWXLPJUqyrDr1Oq+dco9QA+sTXOpFbdLSBDu0NHXi/UwqynsijX0lPjzodSV
	bcA95MFe0nELsGUAuZQF20ML8Mb5qsXYEogT2Z+9HxXrHPKGfw41xuI73misvK3SCEPL314YoeB
	uqKsdXo5jZK5tbtYEsuy1OvEEH86W6mMnqkePN5IMunay82Q/aMKSah2+06wfTmfNvidwbD7Ovz
	RsQLBmrEyjUwLM19y0YFSo1qyQa3Ot5k2sTtLKHfLeJ6JJodXXtKHP+j1KEWnlcwrz2rzf0/gFX
	kUBYfxu8/5aqbKWBzp7S4G4ERIYpmvMPxlQSuP6BScBzXp3hl91
X-Received: by 2002:a05:6000:40cb:b0:482:f0dc:e647 with SMTP id ffacd0b85a97d-482f79f3328mr4351967f8f.21.1787895412837;
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 28 Aug 2026 06:36:46 +0100
Subject: [PATCH v2 1/2] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-1-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_223654_728561_47427D55 
X-CRM114-Status: GOOD (  13.43  )
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

The setup_cpuhp_and_cpuidle() parses the device tree node for the
interrupt generation block via of_parse_phandle() and decrements its
reference count using of_node_put() immediately after fetching the resource
address. However, later the intr_gen_node pointer is passed into
of_syscon_register_regmap().

Fix this by declaring intr_gen_node with __free() and removing
of_node_put().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index f5fcdde9750e..efccdd63e40e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -409,13 +409,12 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
-	struct device_node *intr_gen_node;
+	struct device_node *intr_gen_node __free(device_node) =
+		of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
 	struct resource intrgen_res;
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -431,8 +430,6 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	 * syscon provided regmap.
 	 */
 	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
-	of_node_put(intr_gen_node);
-
 	virt_addr = devm_ioremap(dev, intrgen_res.start,
 				 resource_size(&intrgen_res));
 	if (!virt_addr)

-- 
2.51.0


