Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=; b=VEcXbpeWfSD4gTl9Hdt6vVr2Tt
	tvH0YuSUdWFP4HnGz2ntygrk6rHF6D5eGY/Dx7KQ1Zu1OQwrOGEa4EDKayFxfEITnkeWXo30sbA7H
	xZKafCgwg8TzC9mlBLpRb/4bKJ+iF3iRrBLyKKCjUsfGRZZZxIGoJsXDv/TXEAquHcKgcpTpwSSNw
	QfDYpaRsLIKXSfm/Z2GSZpSVPzzrUnBRmUs2Zef6TLBXquiT0DOdCaEgd2TiQSFc8QYvERzxVioVA
	LQDmmhCoXU9lJTaC0ku/4ktvWzx19EQpKgnpXIH6NWhpa9vyyVNVWKz/kRt1VOCWfeWLPRQnLFXub
	Nu4alWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qI1-00000007aUX-2P7N;
	Wed, 16 Apr 2025 00:06:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qEI-00000007Zc4-0pqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22435603572so58976695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761733; x=1745366533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=G0V2j5mN10t9dMHB/H6TOqUw7JMLd3wi8vC0Z75wYFnlLwWFC3wI7nyRKI4PR2QMOR
         RnkXfJ6Y+772UPHttphRRBnX84hctJPozAXsUZcvPwYEtrhBFAxoNrcKNSIJD5JmLQBg
         Pls0ssRsSgqyOT3dnkk2yV5PIIyfKCODF1Rsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761733; x=1745366533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=QEodA3kNS70wP0HGyplW0jwRrOBJtJLUX6ULPGV4gLKupb9cvXhQbQZszZn9qAK3xW
         QA+rcULDmaLXJM98G+7gwiJmu5QHbaR1VTojS/FRLAc9hQkzaxRZzlw/odGL/TqWVYHo
         gMxYf1VHsfWH7BpmbWRml5GiJaEN1HHoCyZEJgNb6J1hVF+RkGJ54iUgkhnbJ30BEHsi
         kHfsnILfVORJ8T35W3Fu+Okl+/1kwDTfCMyatJ8VCXQhq4pExalLvvmSlBkuEApCfK9T
         j6BDqTISl+hpi2kmV3sawiBcejcxAG3gG4pjizSr9xSLIySh+73uoHk5a+PZM1ersU3I
         2DDA==
X-Forwarded-Encrypted: i=1; AJvYcCX0l2CgwmafBQ77OasPC3X4zguH4zNXDy39U5k0/oWGmmSl1L8loTcAhrtzg8dKQEVhxzJWnuh76kZsL4XksCyc@lists.infradead.org
X-Gm-Message-State: AOJu0YzLg+edA0biE7qNqJzVluenMAatGpj22gxNT7k+HhbN/YOlvxr+
	JyURreN7g9pqOA02G4I4O0x71sSBj9S7STCycuo3hEPh253NErpzDQ7qWCRKlA==
X-Gm-Gg: ASbGncuwFDFbHRtKtiSZe+AaUvModYHg/CBYN65VmLMPsAdFx9H9Sn480xeZtRXnKES
	+Aj1gZ9urIoDFnmRLZUgIWAYeoWGljDJ81U+rgmp4atkLuPyQ/ERk3FbwNkKpN/uP5z62NW/WHp
	FN1oYjVyb6gJdq/RVQm7X/ys0+2SAa958U/5Ebc0N9p5619mwKQfohGyVFTb0U0K6ZorE1Uyp7P
	CZ2u6hyeBftzwvDdBQ+bpS06gkQoUOyTjy75kyaHVyatHYPNYss4H61mYO6pmUz1O+/UC3g5FVy
	nGhnelR7BJwuAuIWKI3In6bCK65vsslNW1Tnvu9dem864DW/nwGnbT4dmxINo2QBmxBjgfaQuRU
	BZA==
X-Google-Smtp-Source: AGHT+IGTNhPFIcDKlL3bF0SzfSJ7SIXjnXhh0YeuCFsofT603F8bPtE9D2lDaA650EUHL4OU3b5nnQ==
X-Received: by 2002:a17:903:2a85:b0:220:e63c:5aff with SMTP id d9443c01a7336-22c31ae8e3emr14464865ad.47.1744761733360;
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33fc47e0sm1235925ad.167.2025.04.15.17.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status means attention
Date: Tue, 15 Apr 2025 17:02:01 -0700
Message-ID: <20250416000208.3568635-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170214_235649_D6D7ADA7 
X-CRM114-Status: GOOD (  12.45  )
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

If we aren't expecting a status update when
cros_typec_displayport_status_update() is called then we're handling an
attention message, like HPD high/low or IRQ. Call
typec_altmode_attention() in this case so that HPD signaling works in
the DP altmode driver.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_altmode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..c2d9c548b5e8 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -280,11 +280,8 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 		typec_altmode_get_drvdata(altmode);
 	struct cros_typec_altmode_data *adata = &dp_data->adata;
 
-	if (!dp_data->pending_status_update) {
-		dev_dbg(&altmode->dev,
-			"Got DPStatus without a pending request\n");
-		return 0;
-	}
+	if (!dp_data->pending_status_update)
+		return typec_altmode_attention(altmode, data->status);
 
 	if (dp_data->configured && dp_data->data.conf != data->conf)
 		dev_dbg(&altmode->dev,
-- 
https://chromeos.dev


