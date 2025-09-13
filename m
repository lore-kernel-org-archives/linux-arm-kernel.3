Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE94CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UO/7lH/N6ZDafNfSE6DEnroDEbW/MX1V/QAkUexnxuk=; b=nHcCxGJULekXP7pHryEppGnySX
	j2fy50Q+U7e3Geon0IRlVf+iFbtrUxlNq5gYzjCZDP5Iao2d5uCN/Sr4zuiNDGuqiw6MaQ1CBaVoe
	v9jLo/TkbUGH/uEyUR/mZx+5HQhP/EXHaDifabyjOz5AHbYWg20AcTLq7G1Wh4UW9V8npHWxO2xIo
	c65ULpUgK3Z/wjbjArjuvWai+FkfocR5Fe8T/JeUzbgK6n0bCoB3QcqghRmCrVeI0zbtrsi3wzdTV
	ZMELoJ/GHaGRJRn85UKDoDkRAIqRpcF3uFRbl5ALylz73MLFY/xA6//PiITWLhugnUHnDyB5q9WYm
	QrBniWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxDpJ-0000000CF95-0RlA;
	Sat, 13 Sep 2025 00:09:13 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxDpH-0000000CF8i-03e1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 00:09:12 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-71d60504bf8so23542517b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 17:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757722149; x=1758326949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO/7lH/N6ZDafNfSE6DEnroDEbW/MX1V/QAkUexnxuk=;
        b=ekXU1R+WCMsGG2kYfkbTihHJuAaEQYLHuJlGnKBvHVdFEiy4QDAroUxiVIb9i6H10/
         aTPvO8njxxlGVBq8waXD1zA6GMwOqJCBZFy9iF+puVLm+VW+u/BW7jvpuHwpUjQc5sbc
         CuFeNOv/RZz9jrsLSTX6zUN4dRyBgxrtOBCrpAsEqZ6f4ELeOzLwFV5eWg71pwC+GUTO
         0VHQZe1xaIK4M1jKpG/12rUihENIO8GG5/wUJcvyiyKtiBMSH5Q07wKKG4qyQr7fHen4
         +t0T9LO95+qWIjcHR+1yJ+eUJ4lcwjEvH/kQss1qlUporEPBXvcvpTUUR4Rka37qNSI0
         +MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757722149; x=1758326949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO/7lH/N6ZDafNfSE6DEnroDEbW/MX1V/QAkUexnxuk=;
        b=E+AH/H9MPY6ZdVNFTNtJRpGVFWB7aXaTlhTYTi849CRsX2iAX6jTM37g8sKxLmtsHZ
         Xm79Z3/HbGaJbPtUILgytvGUglzaon1KhOr0CLa/0zplbYcS+4raT8EIoEpw61Se8HYD
         ruPtt0c9a9yi4l1va/8zD2DysozMFKLxRemHeJVdUy/1zKQzHyJ82MrARt3so2gkWmSl
         5SLMcCPvbNa4zl13NffiXVq6bSLmShxOuTpcNZzYz+CJ4g8VOdT7DbBeAFOC62cf+jEY
         V/S1b1PLAM2Zq5mY26/foKm3z4rDwhac2XXBkEgpV43Y1xhReLxId6uCMHuev/Sz5rsl
         eSFA==
X-Forwarded-Encrypted: i=1; AJvYcCXUPMOrP3ChibuoCS43UBEgemjqrGW7gGQH8DYjfuts3qu7XTDzpN7VGjVVBbdQwa7IuNJgnWHDqATZsjO+10Ks@lists.infradead.org
X-Gm-Message-State: AOJu0YzhlrcfCSNlrEyv9RwwsVx5E7b133MSBHHdro2R2KDgdkOrHcxa
	yvHKATw6cXeUKmhvIt65n5F8QAWix3yBKC7RWPhFnskXr3Y0ZcYmm4eY
X-Gm-Gg: ASbGncvevVh9zWoxFTHXWfqw7xqGUk9Y1ZM8POdmdYSV67o+RAWNnfR+Q0s3cqvVCu0
	kQguUjdP/RuVAWGy55/cANmk2FUPYRPetXXT60J5eTRYWyIQ0/kYWFmIK52kMka6cAXFNrHGz35
	joNNpDI4lDdI4CeQkkx4FjHZLbcdhawRvCjji9WJQyZK7ey9g5lV33ZpPAoqDkR1KT3UExCNXau
	Iev0fRPIrhfWiMVMSGuUNgadggwZw2rpJmM+qlglIBcKZ6qY+OmB2bc9VFYOQQvo4V0In0IJeWa
	9yU46rIeguCNQYVhXTQfHGW+tuD8vzA5wcqx3Oo6d9akzGeUhyiazvmuGair1R790QncSKJPL9L
	sdFRl1Uw4/lj0WO7uODgLPO0UVC3dKCBHXidU677dCovMBE7uJJcyerTlabsDErgLIkoMtnt9o+
	h7mg8=
X-Google-Smtp-Source: AGHT+IHZWd4EJg2gnZfEA4Hk6YneuFz1ZkOf66cLLfb+s1nr3lhcJwgBnTnK2mMOety0VlhoHn2A3A==
X-Received: by 2002:a05:690c:dc4:b0:723:b37b:f75f with SMTP id 00721157ae682-730652db8fbmr50959917b3.26.1757722149288;
        Fri, 12 Sep 2025 17:09:09 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f791a3fbfsm14663937b3.48.2025.09.12.17.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:09:08 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH] arm64/fpsimd: simplify sme_setup()
Date: Fri, 12 Sep 2025 20:09:05 -0400
Message-ID: <20250913000906.67086-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_170911_058709_C696FBF5 
X-CRM114-Status: GOOD (  12.81  )
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

The function checks info->vq_map for emptiness right before calling
find_last_bit().

We can use the find_last_bit() output and save on bitmap_empty() call,
which is O(N).

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/arm64/kernel/fpsimd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c37f02d7194e..e3f8f51748bc 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1265,6 +1265,8 @@ void __init sme_setup(void)
 	if (!system_supports_sme())
 		return;
 
+	min_bit = find_last_bit(info->vq_map, SVE_VQ_MAX);
+
 	/*
 	 * SME doesn't require any particular vector length be
 	 * supported but it does require at least one.  We should have
@@ -1272,9 +1274,8 @@ void __init sme_setup(void)
 	 * let's double check here.  The bitmap is SVE_VQ_MAP sized for
 	 * sharing with SVE.
 	 */
-	WARN_ON(bitmap_empty(info->vq_map, SVE_VQ_MAX));
+	WARN_ON(min_bit >= SVE_VQ_MAX);
 
-	min_bit = find_last_bit(info->vq_map, SVE_VQ_MAX);
 	info->min_vl = sve_vl_from_vq(__bit_to_vq(min_bit));
 
 	max_bit = find_first_bit(info->vq_map, SVE_VQ_MAX);
-- 
2.43.0


