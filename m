Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=; b=d4CJTio/IYbSQR6Kj9mD7Gz+bP
	23ezcQppB33JQImvRxMYOxBMofqa4/NUSt1XPTG1CzEUnnbDJJg5z1EfSmd0RgCLd64LSzauhaARH
	/WATa21HA9oqTIXUjnLQHJMDCAHi5wa8c2SRxnzG0tCzVRlr2WiTpU50yJdoVSr6VlFTozgBo856a
	vhRG7TujnbHHxS2lXbLat5048/dDkryeIOdmQkC1Vpu40NQWucHC/GSkrmgQKAXKy+dBeWWMmmDEG
	bYSxQdeH7NDtiqNequBEpJGpNHrhFi56MR2Po6utXzCG8vaqn4+Echt4eIdr8FTHKQW7Ni0GBQ+Ad
	i1QclGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Zv-00000000dvV-48xn;
	Thu, 08 May 2025 12:42:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Tx-00000000d4r-27c6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 12:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=; b=WA3C2bLDuciioSO2zyLvkb76BE
	lfBRAZI7TcaImdfUxVWjNxbJfjJPlb7Y2bXICV/vQlK0jPuq8byNJIx6mSE9RyFlscE2RccjafW5f
	kUm+WF9AVrACMWFCbypn0FWF5rjuUbylCnJIVb6DvcIe6dcw/qoQoUC8AXiJCl8MkGRhmu3y0WOIj
	6cG0dglvIJbuZC4X8DR9m3QL+f2lwwMwL5GMlB+MzYG3LABWF1GfSzX9jAd1UJWgsLn69HrTmjOeK
	q7Ghqfl/9CHuD2BycAQ5aUpIPedBb40Gv1eghbemXdS87e78OZYNy6LHT2h1jZRJ9bVrUFnlUSF0c
	yLlInxtg==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCzfB-0000000G1lc-480k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:43:43 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so6382815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704621; x=1747309421; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=;
        b=na1IUUrT6SEox4vegdw7bA0q2sESdS4Yy6YXAQQwd325qArdz8hZeJg7U4CDJmEecL
         pCyW80tMnjfPOQqApNqCOBBQseui7MOhF7y30403B3ygNQdUfRcM6NutBankJQUB6HCw
         ehRWqAonryTmQnuw848VCgwHaRUx7XLCwzubqFy+3akivsMcXO9gUzJ4hR/1NhyOSFGf
         oaD4VoPnqXF0S4ZcO6m4OxWNqEBsbKXrWIF2bA4ceMmshn6D1Sowh1w5U7M8R++hKiYj
         FfaxMhuFODk38gAeymFScj8iZWjHfRj4gnqaADcbQgphPasJhryQ6v53As8OgyuC2yjV
         VkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704621; x=1747309421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpwm6pDMroooW2YqC/KslLIOgf8WNN2/GA1ulGmQzEk=;
        b=mx3uGgtulR4kdJHdWwPdH3i9hyqsgMZdG3s6MrvJ0103EM8V7Ip41Y6IIUeZn/qPbf
         XSUq+dEsCjJWuxKitju/K44WX0MqdxWz9GYINIpIgWL/bnKqyFAR7fft1LnVb+/1bOeS
         rSL/ZeRrAjI7ReKvMfwzoERGaui+TQMMf37K74YRtgWUkTZ9gUaFEcEAGLW+Ly8IpNPd
         TbV72ngLHcDwcrfi9oYbtuvd2KSAH1fkmR323Q3xBydrSKsrl8HDGAtsAAi6yP5icHyy
         gXJY5ueu0Rzj5AUDWZfwAs51Ka8xuFEVlSPzql8+xZrw/Aq5nl3Iamz+KZBX1THkRLIP
         Vriw==
X-Gm-Message-State: AOJu0YzOKlVVqVo+AJQVW0XWTx6dpruSZ2Bkr1+97tCOziFRXw/xWE79
	TsOQ704cpgxW5m9IYPKT2Yg9Li+2bvpZ+eB1HgeV3nr5ZxIwHlCQDpM853vuJ90TU3u9XApo6LH
	Vj7H5xOQB8je7o6ALh0sRSCgURj7M2HjDCfk1rJep6sNkC2VTLlEiNooZgk8GKHzumtXf4sH+rj
	71LmZnLdceyMvtj43DM2x+POlDHgRCpgM8bpzZfIhP
X-Google-Smtp-Source: AGHT+IFG/ZuCQ/+26pPq9ukelXiqSOvAL5bCK15tfzAkfYjQ6XoSb9As+yOPtVe7L+pFX8orsfcASQ1E
X-Received: from wmbdo21.prod.google.com ([2002:a05:600c:6815:b0:43c:f6b3:fa10])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8714:b0:43d:1b95:6d0e
 with SMTP id 5b1f17b1804b1-442d033a3d9mr26273835e9.23.1746704621043; Thu, 08
 May 2025 04:43:41 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:31 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150; i=ardb@kernel.org;
 h=from:subject; bh=CKHvAG0z7Zm+FmDzWOKAeYGz1T+VYqK4Y0hoS74iP5w=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxpNSuUXf5nPfSf8WKnSK9eTdh2w755dfWXug0Wfut
 IMfw1eGdZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJBDcx/JVdc6HXd8cCV0GR
 ophczU0npNZFH95/kp9/0vn9gRyOu6wY/im8lZhWNCfu+uVpgi81Zrc0r/x+YdYh8VuWEtJ7Ln6 W3sUGAA==
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-7-ardb+git@google.com>
Subject: [PATCH v2 2/3] arm64/boot: Move global CPU override variables out of BSS
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_124342_270105_A6D5BFDB 
X-CRM114-Status: GOOD (  12.60  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Accessing BSS will no longer be permitted from the startup code in
arch/arm64/kernel/pi, as some of it executes before BSS is cleared.
Clearing BSS earlier would involve managing cache coherency explicitly
in software, which is a hassle we prefer to avoid.

So move some variables that are assigned by the startup code out of BSS
and into .data.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 4c46d80aa64b..2cac5e5ca94d 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -765,17 +765,17 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 #define ARM64_FTR_REG(id, table)		\
 	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
 
-struct arm64_ftr_override id_aa64mmfr0_override;
-struct arm64_ftr_override id_aa64mmfr1_override;
-struct arm64_ftr_override id_aa64mmfr2_override;
-struct arm64_ftr_override id_aa64pfr0_override;
-struct arm64_ftr_override id_aa64pfr1_override;
-struct arm64_ftr_override id_aa64zfr0_override;
-struct arm64_ftr_override id_aa64smfr0_override;
-struct arm64_ftr_override id_aa64isar1_override;
-struct arm64_ftr_override id_aa64isar2_override;
-
-struct arm64_ftr_override arm64_sw_feature_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr1_override;
+struct arm64_ftr_override __read_mostly id_aa64mmfr2_override;
+struct arm64_ftr_override __read_mostly id_aa64pfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64pfr1_override;
+struct arm64_ftr_override __read_mostly id_aa64zfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64smfr0_override;
+struct arm64_ftr_override __read_mostly id_aa64isar1_override;
+struct arm64_ftr_override __read_mostly id_aa64isar2_override;
+
+struct arm64_ftr_override __read_mostly arm64_sw_feature_override;
 
 static const struct __ftr_reg_entry {
 	u32			sys_id;
-- 
2.49.0.987.g0cc8ee98dc-goog


