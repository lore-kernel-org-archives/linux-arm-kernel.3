Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10974C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bvgOKYK7T77g3oR+LPfWj5fFt53zZhcAY3csRaeP6rw=; b=gJtvHzDv9fsWLxK/HR3pNLsi2j
	Wb5d3d6EG71129bW002kfZf50gdbRiP1x6w3Gb/W90VGKVzQVQKDEi07FX2ReQrgrNjjoI6WoPurb
	8xehAqi35Jc4MDR7vcRClSqhqGBhtZwe8Ez7XxzB6CJPwhNtVQEqkpulHkyjtUUT6SRRySy15yLD5
	hQltIqm8e7jOAjbie7KO7og3w/nqi66+tohVHTm9/OkGkVuvwF/SRUm7nYbyuDdVPyI3LUUNiatE7
	QcMZVG/akGjgUS9BQz2MyIlT/Z+zThtiWByAGwD22vkVGTivZvxMDdV2Og62OX++fHNvdFSIHZmi/
	0ImA5C5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQVp-00000005inl-1d5E;
	Thu, 02 Jul 2026 23:08:05 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQVn-00000005inP-0Bto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:08:04 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8f18d92172aso31858926d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 16:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783033682; x=1783638482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvgOKYK7T77g3oR+LPfWj5fFt53zZhcAY3csRaeP6rw=;
        b=rYrtC3wl2iCmqlXbi8OVaf76FYEtVDiUKvrRN+pwE1x+4RvJfMdupnN1/O2LlKP2EY
         CSPM5/IBoGwEEWWk9UcJJoBNUDhALx5No39cFF4+Vp0Z+rZTZ3blJhzGxW/WPpXpgmwU
         t3FflSTJq02+IFZcUjdNSk0Judtf4XtUNH+0efWDzQ2ChCBrV34HKj35aCFxyggFsyJr
         uBJuEgwjYvFkCwyg4XYlXt6HYjknQC8HzgN4j3OBFNXU7DgjngU4YgRwS70ipX9MmtJb
         3PZTCBcLkKi2v4SPu3r02nL0U1+SQxBGYGA2xH6mUUNO2CaRLc+I/s6YQke6JwClCLj3
         uqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783033682; x=1783638482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvgOKYK7T77g3oR+LPfWj5fFt53zZhcAY3csRaeP6rw=;
        b=dn4hSc4KO2VPxfL5dL30gLao+IM5Zwr63rAPJRtSuOT5/hpd/D8c8TfUoIsO10g1zO
         4UBeqSw/ZvoguIko//D52EBybY4Dnu/RKdc2lb95EKnazqevYP8YpIAH8J6z6keAbMpQ
         WiE+NitZ5cLKN5x7Z2xkFNBbzOqzqECSJyjN7shuW6LlHLcIp5r5HwNytX0M/R8gQvb4
         EZUtfanmNU0bW+gaIluv3WQMsKPWyK8oSZ4xKy0tY96R6mi4XndojfOPqJyAwQALw6Zs
         FZZdl+w0MFHoor4NRY+SUe+S+74WbVAV+URd5lxTdr/oC0AIUYCGRpw1QF2uWS1RQnqA
         rr8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpFanmyKbKvBU2V5e+2DPHVJZLro/Xpz8twEJf+wc03lh+M6xmt1A36tlcBTDQyF8EiT/9UyR425K70MJc5TBlT@lists.infradead.org
X-Gm-Message-State: AOJu0YwvAYm/4dL+hJrazSS1sV0nWwotrIyeUKF1r3OCwgrQVxgge0qy
	7Jxz39j5TJysvr/iaYJ5+a3u72oewx3VQDoMF7sOaidEcBv1QTa8rCFF
X-Gm-Gg: AfdE7cmY4P4ZfKG8bNLHy684mLip7apDIhBDYZVqDH0scmKrn+MvuTPw9atIAigwWnu
	IqBG7AH4O/uWK63EerhgE34WpTUbJXwiL6LEDQjWqE0CTR8cKSQXd4x36M+JitrwKt7jXPRCLXp
	PxwpJqxQcg6ARt+bW/9UVUjvqeqHJlq76AvyCdp5Iim48Q5FReXjtvca6zrMMgjXcfkDTVyvhzg
	PI5zCZkVnVGKmnPJdSq+NuWQGXMlYQShLJCNbhHMqcw9mKmggHbDI9bN3oNvUvg0p8HoV3IiKDv
	wawmA03amMGFQ6cpxN8KzVBmCv/yzwYuYU0i5J58Yg+iRHDtnaTqmq6tqMtfNuIWUAc1gfksP0o
	MOOHlFNkdrpnrTikyg26KpArIC8BTr8D7Ne5ewFfYlaoTt2apYY+NHtUXGLi+ai/Gtv8E0BEBnZ
	zaojhf1ymyp3R3DofRvapx5G7RtLAv0GPBnitKquqF0Kyq0wLBxbVeUI5VAM48c3LrMBj/I8LAT
	0p0TIucw09W9E4=
X-Received: by 2002:a05:6214:33c3:b0:8f3:4ea2:427f with SMTP id 6a1803df08f44-8f4214a217dmr92582856d6.1.1783033681514;
        Thu, 02 Jul 2026 16:08:01 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f472a9d8c0sm38776506d6.49.2026.07.02.16.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:08:01 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oliver Upton <oupton@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] arm64: cpuinfo: Fix sysfs cleanup on failure
Date: Thu,  2 Jul 2026 19:07:44 -0400
Message-ID: <20260702230744.91169-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_160803_085378_8469E9CF 
X-CRM114-Status: GOOD (  13.67  )
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

cpuid_cpu_online() creates the CPU registers kobject and the base
identification attribute group before optionally merging the SME-specific
SMIDR attribute into that group.

If the base group creation fails, return after deleting the kobject. If
the SME merge fails, remove the base group before deleting the kobject.

Fixes: d69d56496487 ("arm64/sme: Expose SMIDR through sysfs")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm64/kernel/cpuinfo.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b..141bcfa4d611 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -380,9 +380,19 @@ static int cpuid_cpu_online(unsigned int cpu)
 		goto out;
 	rc = sysfs_create_group(&info->kobj, &cpuregs_attr_group);
 	if (rc)
-		kobject_del(&info->kobj);
-	if (system_supports_sme())
+		goto out_del_kobj;
+	if (system_supports_sme()) {
 		rc = sysfs_merge_group(&info->kobj, &sme_cpuregs_attr_group);
+		if (rc)
+			goto out_remove_group;
+	}
+
+	return 0;
+
+out_remove_group:
+	sysfs_remove_group(&info->kobj, &cpuregs_attr_group);
+out_del_kobj:
+	kobject_del(&info->kobj);
 out:
 	return rc;
 }
-- 
2.43.0


