Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3EACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4l+LLyxgHRhdEK5jMHn+Sq1qQUJE6RD5Pardc9PeObU=; b=N1b6yk9WpfS+mC9Tay8kEItkQX
	xYop0gW1sa0WjQLhQ1rvSt2eZ8wlmqwRg/WLR8NL3A5ktkdHNOLcM2K08zDoGdCdJmMOofZyOLekR
	QUN2Nfyf0qohewVM7jSSjjChkkiZZw4dScvi5vKiyKyFmbEp5Bgp6CmN5rsgUiqgsV6I7smp2y5Po
	Yg7Z80wJm/0lsWDhwBStT9Eon/4BTEAtPdM8GzxZZGgCwyB4y1Jk+zkmCkxoKmQoBM8QaGWWZZNa4
	leZ5rIv/kcYgnGQ4eSP6jKwGaT4IVnHeestJLfmhzjysmBFrY/u6avqQiAbnnBgUplZhA25wPhm69
	dZt9SW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKoB-00000004iBg-1wVp;
	Wed, 27 May 2026 20:24:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKo8-00000004iBB-3y3E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 20:24:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49068493267so26337915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779913490; x=1780518290; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4l+LLyxgHRhdEK5jMHn+Sq1qQUJE6RD5Pardc9PeObU=;
        b=nMUSL3DBNB9X+52iWCmag/0QMD7lR+KL1M2OOX/AI1bvj35IdPbrWwFpTDQTQFd+PE
         CN6fz56muHY0sikjTVFzAlc29QV9C9v8yxQUGheOJbAKHMF1YjMA9E/TjQCn0goTurZ5
         Gt9bQ0z/6pUWpK9b4mwaAbBGnf7RdfIUeTFyQzF5DZPT3Ig6516ZWCn6ykIQfkdwzF7E
         9URSJNI2KYaoiK5dyCIhcA9Fo5CUPvKnSQdxnJsUO27k9SQdWj9gmq2Rmy7hQk7sEtyG
         DncvKMPVJA4bZSKCzzZjaRPoVUOrNrqMxRIzgaGlgK26Q9X4oPC63beHwYxvX9HdFGQ5
         2aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913490; x=1780518290;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l+LLyxgHRhdEK5jMHn+Sq1qQUJE6RD5Pardc9PeObU=;
        b=eQyPAu/AMghefcRkvsKQqN9k/+lJbFhDn3122sMyFhQKS2dNOaSTp4kjS4mkMhP4Zi
         vwzZ8RdRX1W0MnoqrW7N8BXQWzyT0imeUpbkgag4E+pimtgEtRfQ+5YzLGT0tyZij+QN
         Sjtv61DKiB/CkxVgkPSHa/fbS5ZGFxX249jLAb1lR+60ms09c5lD1OkF/USyogl/tTha
         y29I2tVhWn1WTMGJrvqA07WmUEkw3mGgU6nZ5sGIOya8xXXYnkerIRjl4SWvvIi8HBiZ
         7OsffgfNhk/Ni6y6tOMZHMojGCpM5PyAnnAXczkXL4MUO3QlrEVj+j7oFzc1/ri45Ma3
         F4OA==
X-Forwarded-Encrypted: i=1; AFNElJ/GGtmjhCZ3w5N07N5tbT75thWmb0oIIZjtv0LRdh28xCYRAY30u5IHPZbAZQ+fZ2sMpasCBHgJA1t0ExKvGyvy@lists.infradead.org
X-Gm-Message-State: AOJu0Yye9HdUj/GOOsdo8noW+uVMQtIuZ8OPuoXSmGYxgSG+oubAsmcl
	UQgwAtgOXOYdjMqxxevGZ/f/Z8NP4uGWBnrF5+5awq9wcMkE7UtQurtDtErG64x4VXk=
X-Gm-Gg: Acq92OHN7phhDqCQuAbzwYSPLBsze7QALNoDA5WGQ1k0ioiRnQep2ZGdq8l+mXvl4LH
	ueNBPyKNnYcMuWoZ0Y/YtxSBCI1p8rKmrjkPEjHEGwnHmnTAz9t8OtXdgSgLy2tQv6eUh15ZveM
	0G4gTqvjATKuJ+mOEHrCOfUiu5GIroYgqjAlRf+jWU1IMQ2V/mAlTvPo+Vtrl9ek4w9oz5aM88d
	gWcqaaSBNPocirYbWnnH2nAqrQXJLbPea/gCUBGA9neoy88WN739ofFvGASf0JL6jbep5YXzcsX
	cpjcfrm24vD1NKmenzKjGVn+qMM1DtJw6TO7njLqddqcZZPPPccLBK57qPlNUudqzBZjC/6psaz
	31N8sQddajxZpesSa/zOlIRVHEjoymvrUqXHwuUCzhXfNtgaZ82GBpSEfKfutg7BsbwEkVcDW/9
	pkZu65MQnwfF8T3x1Sn9fyZ4nm2Vmi3HY1o57VfejC4h75Q7PXkVn8aT4RsAqUcHVfvdM=
X-Received: by 2002:a05:600c:2a8b:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-490426cf045mr286111045e9.19.1779913490478;
        Wed, 27 May 2026 13:24:50 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm412208435e9.4.2026.05.27.13.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:24:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 21:24:29 +0100
Subject: [PATCH] MAINTAINERS: Add myself as a co-maintainer of Samsung
 Exynos SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-soc-maintainer-v1-1-40829c3fb133@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP1SF2oC/x2MQQ5AMBAAvyJ7tkk1Ua2viEOxag9KuohE/F3jM
 Ic5zDwglJgE2uKBRBcLbzFLVRYwLj4GQp6yg1baqFo3KH6VMwaUbcTVczwylNAM1jkalLGughz
 viWa+/3HXv+8HC4fpfmgAAAA=
X-Change-ID: 20260527-samsung-soc-maintainer-6b899eb06891
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hEG04w0NuIiDOJGDNAiKSS/GMggED2A1lv9FYfRa75A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF1MPMU8Ic8JlboSiI5k7igA1U83zw0RCTt1B4
 R05mOiL1h+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahdTDwAKCRDO6LjWAjRy
 uhmTEACJSxwoy6PsUtWND072OkpQv3ISdQJEft3gHAsz34eVOArwTXYah4QdDAjVn/ki3bCpiKb
 7fBDnEaAlsxBAmR5CjRXgwAz9nfD3FHql458tCnzxxhCieQ6tSpbaR3tgiYHoLPNwoUVTQi0tNM
 vosB740yqMfwEvmOfVnFeekKd8M6Ig31JjUmZze0uU8md4Fusb624wiCt4UhFYMEq03+sosjFBy
 17tWuQT8woobzFAYP3+rZf791BDbAF+WRQYwJNyWEYbtBVTd5nNQ3xQc//h/2teRWBVhn94si+z
 C+od8VVEsm/W9rfopXseAprSnyKc2O5sn5K7pt4DB0RoolI9CPTnAu1AC09EGL6FCsMCDerRUYb
 5ruwhW5g7htEBTpUd1d9AUQROiXvpqSgYOCPmdp6nBPRLOLst4RyCWj+ihexbRFmrd0R9la77I8
 ENPMNPm+RraOAYlbvbyCJ5H6a6k6djTKPoHJ+0CWK+ovSgeXWA2lytYLmVjmZr7Nx9yXp5SEUaj
 ZjdGwB12KLWhhk1Pz72gY/EJ+GiNuU3dZDs8jwK2zaaE6DnlJ4r0fX0fan9E05/XbA7roo1LTjt
 UOr9wEvOPpcPyfCAiAEREwa8wfUyDT51exrurjt9KUOLwxZw7nr9/dhnFoxOFsJKWOqTjyRlxv8
 qVCuMTesEp5yJig==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_132453_025167_C5600F71 
X-CRM114-Status: GOOD (  10.67  )
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

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on many of these drivers and have an interest in helping maintain
this code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..6f0246f2336c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3504,6 +3504,7 @@ K:	(?:\b|_)ROCKCHIP(?:\b|_)
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-soc-maintainer-6b899eb06891

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


