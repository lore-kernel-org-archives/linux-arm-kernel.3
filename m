Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693FFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKXnHxcGKyEItz8+qPNqFMSPcNy9STP0W4CtPGkebJI=; b=oEWPi8woTS4G8oj37x0uDVcQ8z
	e8d1asrVTuswEJhKMUQqqYm8uLBnU6MXpQJPW55OoHV9kc5sFiCll8O4/7CoQZHEKa/M7HBrGYytM
	kswFSS902x1Kmn3qEbwF8n7RSNpJGcs0czdr3is4s8TyPFIKT6+mmYyegGSwKmcf+rUKC0Xbdf0Q0
	qZK7Vu6Xq4W+DMMvS7vHoAE+o19Bqoyof+wZQd427DEc8cfQwyGZ42184+MrOnYqwdo5zmN4b6R9o
	LZjmPTgVaRZ02VfDTvTkfT7wjQ6/2Z2ElrEVOMWbtbzxnFPQpy0XHHYHH6fDTTaQKkFm1oc9WY01q
	80ZIcz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGe1-00000003m82-0zjc;
	Wed, 13 May 2026 20:57:29 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGdy-00000003m7A-113b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:57:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so67405596d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778705844; x=1779310644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKXnHxcGKyEItz8+qPNqFMSPcNy9STP0W4CtPGkebJI=;
        b=gJ9W72qVbtC/DGuasKKGoAiqIzXlKn28Vox3sjAcBAxO5Mip1M00JhAFWGaRnfHmal
         o43nHM13fa+oWy+q8h7vGrKdLZRRzFBcK8VlD3lx/hAFPVVx5zCx07faevcSbSV/Lx7t
         g/VE7hupcF/TupQJCm4rEYhjPOABoJuiSYCFEXr/yddnsYRkrAmAfCfK1N1dSruHCvYT
         RKO6GxvV0rqNg8uegd/Xv2dVXTp85tZEUJaMPVK0Kpevbpp5G2ZEb6bKjRUz6GTkvY2a
         gWUSycSlmwAWwvXRRr3KN5GMJtzDn4rjEU2cn0mjqu0FoUFVe4jCJw0SgOPpSt4+6+hx
         jlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705844; x=1779310644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKXnHxcGKyEItz8+qPNqFMSPcNy9STP0W4CtPGkebJI=;
        b=RhBS4MzVDtqdF8VKDnGGUB+7tRbNXD8hWaHP4m/mVOKm88YIo+v8Y0837Cv/uzK3gX
         oMGoMmtdxdAd7MaC6vCXHyzZ14Kz4v3BsVAzuMHIQXqF2YpwsWNq2o0TVS9Jpr2DAEC2
         VUta+4hJbevv0BB4NfSLdxUVjcJ8DhCPBfcW0nr8Ra0A8bH+H8G1eEUIVEwMjk3bYrWf
         MYeHz5HazXSfLAwSZSQcxXVn2pT+KkTMtIVP8aPX16lQ4AtybP3nZl7aZseuvspQEHSr
         waLatdCcswe/AbwDRyYPdlImNOpWUkMOjp4daKi2lsuFJPX/GCFjdr56eqNVczHW9oLK
         0+KQ==
X-Gm-Message-State: AOJu0Yw0N96rNEVrC3mDqkPg9j29Dw71gJhpQpVyTO9tL2Td/VJ9IQhA
	YpNYxg462KD7zdGEgI0XkY5woxsktkzf/obpewmFjyakVyfSuc10UIbs
X-Gm-Gg: Acq92OExgspsQM2qkucInlHrns+3DIJmg/3p1qZ2HRA9QrSSv2qT8A3m3WzUjV0O0vx
	gKHmRwudFh3TBY6jm9hA+qsWt2zTGL9sRuGRh2JcfVRb99Sw9AVEZyOOfPOKa83XBM1OvFdbk+t
	HfV5Rwkm8tOoxBiUjDPmwvFWS1f85eVJm2cbF/BQG0TzcUFudit88KY4xVEQVGfMZ/6iWI0vrrs
	kx/cJWIg9ID6Uwq0ns0rkeMECxbMYn7toAAgYSI+fx4u6e00hA+kgn0+xXiiTMYzzqCL41JSQQa
	9ILeRIxbD2VNJrWYBRuJ5QDmxpJSak33bwdmkU9pjBy0UiJsDKg1eMqA/NXZXLQEPbjIuNu1zuo
	ardgDMS04Mt8pDAc+X4mangCCc67GSutIo9MIu580jGaEqY7o9/OhY9/vrowD2eVqK8dY1GhVAG
	r4CTKY1jZnG1WqpVZDaDiqrINbPEVsnPpxxFdWfYKe
X-Received: by 2002:a05:622a:1209:b0:50b:29da:ec58 with SMTP id d75a77b69052e-51641651eadmr15939811cf.8.1778705844388;
        Wed, 13 May 2026 13:57:24 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e7e3d90sm152940931cf.20.2026.05.13.13.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:57:23 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: devtree: Fix /cpus node reference leak
Date: Wed, 13 May 2026 16:57:20 -0400
Message-ID: <20260513205720.638900-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_135726_284716_8B25C180 
X-CRM114-Status: GOOD (  12.50  )
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

of_find_node_by_path() returns a referenced device node.  In
arm_dt_init_cpu_maps(), the /cpus node is kept across CPU node parsing
but is never released on the success path or on post-acquire error
paths.

Route all exits after the /cpus lookup through a common cleanup label so
the node reference is dropped.

Fixes: a0ae02405076a ("ARM: kernel: add device tree init map function")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/kernel/devtree.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 3b78966e750a..88a072d3b8e1 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -93,7 +93,7 @@ void __init arm_dt_init_cpu_maps(void)
 		 */
 		if (hwid & ~MPIDR_HWID_BITMASK) {
 			of_node_put(cpu);
-			return;
+			goto out_put_cpus;
 		}
 
 		/*
@@ -107,7 +107,7 @@ void __init arm_dt_init_cpu_maps(void)
 			if (WARN(tmp_map[j] == hwid,
 				 "Duplicate /cpu reg properties in the DT\n")) {
 				of_node_put(cpu);
-				return;
+				goto out_put_cpus;
 			}
 
 		/*
@@ -149,7 +149,7 @@ void __init arm_dt_init_cpu_maps(void)
 
 	if (!bootcpu_valid) {
 		pr_warn("DT missing boot CPU MPIDR[23:0], fall back to default cpu_logical_map\n");
-		return;
+		goto out_put_cpus;
 	}
 
 	/*
@@ -162,6 +162,9 @@ void __init arm_dt_init_cpu_maps(void)
 		cpu_logical_map(i) = tmp_map[i];
 		pr_debug("cpu logical map 0x%x\n", cpu_logical_map(i));
 	}
+
+out_put_cpus:
+	of_node_put(cpus);
 }
 
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
-- 
2.43.0


