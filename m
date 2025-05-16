Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1239BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=; b=fNvEQIc0Jd5191TJSJFsmPQP+a
	dRS7kJIzLRuUbWdW7G2rfce9fIEvWxYd1ri3+iBKzqjIW4HVJ6vl+193JPWcSuotjmf3SbQV4gyWy
	bBn2bbhKwuP4G+7mlJJ485VqWYMgnmyrhSCrFK7OReNFEl2EEWn+EDps3iSEJvci+MgSHbpuEKeQ3
	l45nILK5H648OlVLpjCie727zFehqrl5SVt+dfMYUjrNe2ywWHW3mYrfUKiHgBqi3fNIUhLu7OJmu
	NWbiFD898r3hU2SHupUkJUHxrv02G2YUVYyEIdnnZ+VwGPY6oBBFZLGcxvCaVlD8N20YG+h0svS0c
	y9a+qBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqLG-00000002pH8-3p5X;
	Fri, 16 May 2025 08:22:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqJB-00000002oOD-1aT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 08:20:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso958355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383643; x=1747988443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=VxxNIQvzhegru9puDhk7DMHCde/97vnUwLdiWdglMw4gRvmBV0fMBxuXo9Xq7bfIW+
         EletKekekqDVc+9m3I7JA6wvWWDYpO9Nrmks8/Akgf/IxkupgwX2hjB086Bd+2ZsB9nq
         pdP14Hshiz4SG+VafGTc0/Co3lqag7Ci3b4AgXUHGtUh1mmDK5MSWL/Gkvc5hxheyihf
         pDYTaYG/NDTFviVwTNXy5YvQvoqE+pf+8uS5eI5YQgIYjNE8rQ7jRD7CgR4iB2fLwdXT
         dnRnRSW4XDtKkcBgvL+IUuPBy/KEHsrRhMN4D0Kytxw68l/HR/98/uhmcRbmazRg7Hz9
         TuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383643; x=1747988443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWiHCyffjsTF/4oBfvkCIkeTDad5rgPB/sxiLylVPuY=;
        b=UVAzYiYvQxmSPbserK505hdJV826dIjj3uw1GYxShb5EBVOoPLbLtIhFx7BPfWSeRJ
         Tb3S0fAOvcjpVRzyg/o35zIGgPAfSlVhT5MtxfwF8tokSwgR2lY9eJ+6sP9iPtAOMToe
         4OAYMlTKGipYWVner0aJaKEpXIaz+w+fG+DrUzCgtV/HzaTZ/LFP0eIZiklqjMrK8iP3
         5b72vv7xXrWcq9ZyMTlnvYtxUGruRpdsvGLtj424TZ+Y4RRSI/5TNKTbynLf/Y5j2wY+
         fwlU2ntqMOtpTVaMF5I1TU7X8Apo84dGc83bh5FObzEwVHfUs7nuouW7BYoZ4t5bZXso
         Pbew==
X-Forwarded-Encrypted: i=1; AJvYcCWKRfK6C/3XvKpAa/sjS14NleHT0zhGjUDznFfvQY/SoOhSLrvRgAE6lN44sHFtY3+SkRrleIMxZkuXqe5qeaff@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWFt50rKIYaAB9COB0n8fF/84MHFNmf+91hH8pSga0Tz6livu
	x3U+NVN7K5ybTg6mkgfCjWs1GOvMk4mheNdzYR0eqlhiT9mDYt+ZvAHL6wEjllCQ85Y=
X-Gm-Gg: ASbGnctf5iYFnBHK/93aKsRdZjCvFK/NevX+ZSqhFsFcWrba3Ehk1aTpX5YOhLr1xb7
	Aq1LD18SmKYSoCsYrXbCMCtMpzo1epLy0bUe0kid0OslUUBV1ecjhWGoe92AbTt6xi7dyGf93cu
	WF5drJ96//jHT9SLqOB9A9EcPYfQ8bKmjHokthziaRpE/XRf7VP6QeeAA/am6gK5vK6RlWEgqQo
	0ojJShDlSlvySgMm2GHtbEUBnVkNaWpdP5AbWModX1KoP1LviyIMmmb5+Doy6m52+wqE3FHe8c/
	LGPXBrY37GJdnfPo45+oP3bEuKqFizNSTPnAesTvZGAddZBWrT/LnT/2PsH5LlIRFx210gWrH2q
	nJ4XjSQU26xZhyFKD5SRhes00hy+Pg7H8RKyD4a4=
X-Google-Smtp-Source: AGHT+IFaSqFDmfEc/eXrwtep+5lHfw+ciUUyEyM+rhboqdKMEMNhsbsCj3GNPcoF2ibeCQI1/GgRgA==
X-Received: by 2002:a05:600c:468f:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-442fd62fd3amr8485415e9.3.1747383643357;
        Fri, 16 May 2025 01:20:43 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm66344685e9.2.2025.05.16.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:20:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers part two for v6.16
Date: Fri, 16 May 2025 10:20:38 +0200
Message-ID: <20250516082037.7248-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=q7KcxdCf754Fm0Sh6Fg6Al5BAVBp19Dlxv08kjo2YD8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJvVWHlLDYQ1S3UC+mjKP1Ml+sn0gSReMD8ON6
 HvYzvkVZhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCb1VgAKCRDBN2bmhouD
 17CvD/40Jeg7IGxWsQFaoCXBN5u2/NbbOnFY2YILEL4HSDeuNA67zO/9cNH9hKKy6qVERpoxlyg
 lCOAneP3CP+W4sKSxAGsHWP/VLTZ5KmWW8r6/8Hy/4ua3kngRR5OPrJe4xJqgrOM+OqO8w893qp
 qMv3WhQObxIwP4j9aQ16VFe27x8b3b5jmcpv4DWkBMQmHxWPdfqhI6y05+jG2MK5tk9xoEddcqW
 XLyIWAt28tGblvzNuOv3nRfinV9TGiXkP2gycA8TNGqraweESwwzEW/kD+EKDkLdGCgXx/Hv77I
 LD7Rvj3P6cwnHzrtDi1d3XoTAjVhWPqs/7+1wR6fPLPAEMkx7E4n5zWNKnGEvogv6nipmxk+V7p
 rHvfde6HuqllUI8j4fHkPGq7l0t8zlMdQMye/t4bKPTw2gMP1fd6qDuL/I5BtyISWG6LZicNDKj
 Sf2tn0bhWROtuwZwqIkN1dInyn952pHbl9Y0rvZBRr1yEtTjGiyuel4GDyFzSEH9dHx5UgWXzFc
 17qbuQtA9TF0e222zzyNIY9Qn41PyyEEZOw3BTxF85BExbuTQ/pPISHqyZYj7pA2+3j29hziP0q
 fLTVEOp8AHGx+5aOJ2I7czWZCMbyNFe5mqHOM27wYxYQKG4IbvTgxHADgc+CH+7lB+D0DJddlRn 75pwPLFgK0OqP4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_012045_420791_F75C733A 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Hi,

On top of previous drivers pul request.

Best regards,
Krzysztof


The following changes since commit 2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e:

  firmware: exynos-acpm: Correct kerneldoc and use typical np argument name (2025-04-25 11:41:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16-2

for you to fetch changes up to 598995027b9181ada81789bf01fb8ef30d93c9dc:

  soc: samsung: exynos-pmu: enable CPU hotplug support for gs101 (2025-05-13 10:02:29 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.16, part two

Add CPU hotplug support on Google GS101 by toggling respective bits in
secondary PMU intr block (Power Management Unit (PMU) Interrupt
Generation) from the main PMU driver.

----------------------------------------------------------------
Peter Griffin (4):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 +++++
 MAINTAINERS                                        |  1 +
 drivers/soc/samsung/exynos-pmu.c                   | 78 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 6 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml

