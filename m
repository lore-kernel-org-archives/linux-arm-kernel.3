Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BCACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 21:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s6pHR7F03/pIPTipT8rH7/Q5PrxczVrwgluDM2gAtnY=; b=xoEEFCW24McM8Q6tjajSQACJoL
	asb3inp+Xm6JuEEG2hUpdtXN97rbSeUAgVT2kKJaX6+qbeA7uQefqhEASJeKarlsqSrf4l6l7BdVj
	hPDg2t+hbfHue6WEiRPxHFQ54RFnLoGjrgs1gwIF9fKwIApVjI0+oxVd1AMAwachad5NNLLFhG9ik
	VZ6NAzpZn8v2L//oKLYBhTgbMVGt+hz2t+zy2U4DdVw0tZiLk0srh+aPNPkzxww3t2vhy/gWajBml
	fA4L3HWlrBvhmWC/JXsiSuthYE87UkCU9RtHisdAfO7NvSSHh+pd1A9tS3+b4G8rcmh2AQfPFk5wQ
	w891AXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIZAE-000000069DT-1AmH;
	Mon, 10 Nov 2025 21:11:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIZAC-000000069D5-0k2O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 21:11:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-471191ac79dso36797105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762809058; x=1763413858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6pHR7F03/pIPTipT8rH7/Q5PrxczVrwgluDM2gAtnY=;
        b=gjJJ7W3y7J+RDHdQ0IA3YtO1QeGWiDAnQ+j+xfeYE+w1jqFNbOtxrKg9SEx9vmq1aG
         WlftQrowDaLt8LYC5Zjz5KVA+k9zF8HnMLiU8Dl6r8pOufMZWYn+0Uk4LYWN68tyH/nV
         OMUGJhNDaquQOLBwHN09FSqokok5lb3R63Xw8jrjlMCk7icvdgo716EsWRlhyf0fo7wy
         +dmvUYrPtcJk894UtHCnpH1M+Az4KtkBlaw6o2OSJn9BepbsfX2CkdnxbADQux+f7tfs
         YSk4kQP+hOnE5O1S+4ZihpWxUzeAfNNMcnBkz+30IixlUfjsS7N6fAU/ljqAtoBezq7s
         3hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762809058; x=1763413858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6pHR7F03/pIPTipT8rH7/Q5PrxczVrwgluDM2gAtnY=;
        b=kQDayVb7zRB0361uqCNVpT30fkl97K3TWH7RcHBwoYoRMC4MRKlUbGDhlBwm8GeB9m
         CTiGj78La9D1EAsQ9UYcA1iTj2hLdonnQTi3sNAuK+poTMU9Kxy78qr7Vi1rbRrQb2S3
         cyntJaZKOcLE1VCboDSMJzK5+iKYCSDdLahMA39VeLRRkn+halFvYmBX2iGzQINPthMo
         LVuzuVruLGxhTOvELC7mG+skp6mS/iFt/TNqtlMNWiO8BVxTaXKxEtU/HaXpSJRDO+hk
         zByQzLawWiPk3u7ecacH80tIWJXiyNjz6OI/fUiiZm17eDm9xHvV5wo+36p/hGr+jZ9h
         WoSg==
X-Gm-Message-State: AOJu0YxByG0SghsDJnNvh0kvoCxtqaLE50rNqmXUk/qFFNG5AnHhpj35
	4N3eCkKRGx/tB+6FJHzmQyy6p7hbEScy/Bh2LD2Lvm3slMKScTyjwqVY
X-Gm-Gg: ASbGnct5a9bPePzi3ORuqMQbDuWg5OqZrdj5jAcIn/l3nYkMNhBn2M7bAeMDaGFDibe
	KasfzqBlyuMpR3PY/SCUxB4WmbfNl+gXY5gZqvZFdC3+L4z426jv0PRldPSzHrPSU9vQstESaTv
	BpP2tQjpFza2aL+Ctotz7ICwXO3I+OnxWirFICKb0k0FQIToavq07e9+nffF0sGlvaUVMwhdU+B
	AXbfPA3D6xpjNOIdgGkyK8FAcwNxuPl2dPc298kS6Uc4jXshpzGgTYyst5vLuKQuzUxt2ColGHz
	yAPrMWzVLKSgn6nYWY/zKETcHjJMf+3gP1mK6c1iEm5gSnVQzFByfD+/qC8gZBB4rBW/mRjZojd
	N6ADprfx1JphcpQmysX0W9MyyUhJ1VUEcMA7X0GcVeZ/Psw56dDnrBdgcNtO39a7EArpgGiuP4a
	OeOcRz
X-Google-Smtp-Source: AGHT+IGoIT5w+QUViZBORjTwCO0tphc5Rsw+ZwM/XoSTGH0I5syp92nB5jyHfqFFdSWjwPM/eSjHXw==
X-Received: by 2002:a05:600c:4c98:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477755b5694mr45928235e9.8.1762809057974;
        Mon, 10 Nov 2025 13:10:57 -0800 (PST)
Received: from osama.. ([156.223.120.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47781d68e3bsm1181165e9.7.2025.11.10.13.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 13:10:57 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] KVM: arm64: add missing newline to sysreg init log
Date: Mon, 10 Nov 2025 23:10:51 +0200
Message-ID: <20251110211051.814728-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_131100_261444_3F0E4FDB 
X-CRM114-Status: GOOD (  11.28  )
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

missing newline so the  message is merged with follow-on logs
the change only affects console output formatting, no behavioral impact.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a7..156cd1a6106e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2845,7 +2845,7 @@ static __init int kvm_arm_init(void)
 
 	err = kvm_sys_reg_table_init();
 	if (err) {
-		kvm_info("Error initializing system register tables");
+		kvm_info("Error initializing system register tables\n");
 		return err;
 	}
 
-- 
2.43.0


