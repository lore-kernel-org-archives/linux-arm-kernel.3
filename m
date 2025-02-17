Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB8C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldGwrx2cT3RoWK8xQPpncYSf7C74wmzaVDctYgnNzT8=; b=XUMKptWfAZq6mLzYNw+6Gbu4CN
	aiFYsp9L8sntHYBci1vJPfkOJy6zeQ8DINkTo3e9KupUSc64LltLKXTn3knzypIhw6l2RuaOiQlzP
	RFm9FJSWgf5rkWZMd/iyBWqp0yohQL30oFAqIU/8PQ8K6b9Zbw4i7RH5WJlUAXkruYMoSADoU/w5t
	CgvPyH2sjQPmv1BxjvVWC7xLbVxCsStx3EklxKXaznMVsMYbzMEp3iCzPk2yEgfAiGUWbkvcwguE8
	Eg0fIwwHRW/VHKhvLAYgiORigYDZPfeTC7VXlnSKsIqMgIkSNY7NrrU2F18Ry8hmKl52RIqvcxIl8
	w93V/Qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykw-00000004BFy-1EFg;
	Mon, 17 Feb 2025 10:53:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCM-000000045MY-0oVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e04c044224so1910909a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787477; x=1740392277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldGwrx2cT3RoWK8xQPpncYSf7C74wmzaVDctYgnNzT8=;
        b=Tq90Pi05kKtT+KFFH/C7M0edervs84aupubM7/lScoLYf2PPaU9fZscL+rYUx6gr2W
         VVYKBQ0WbBkMDzJlPSdsTVcto13jKgt5FewZJfPHc6nmavrX4uhmiDp8fMWhR+yeU0xu
         r38f97uwaPTMrwtHI6dUlmy1T8eLFRUXrPEqPJqgw0AZXuxDzx45i4TkOHKie8B0Xsmc
         PjIWPe43dihUKqKeK93rjOt85udwPkfgWa0cvwG0afqA7ULglZ6VpWjhnNwk9SExY9tA
         5mrw6yJWyK1cAkD3yydLclMFOdA6JJ6KSPnx3GtY7u820L5UqNZOy3EFE/5vjALivN/F
         4aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787477; x=1740392277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGwrx2cT3RoWK8xQPpncYSf7C74wmzaVDctYgnNzT8=;
        b=TMIMP3vv2LBty2ep9Oc7Q9i4wVAi8ke6JPjIypEY2jV8AmkibxFGaDPIef2Zf7YCRM
         oE/8F+z7UAe40Ytq+zDHWeUGnKA6BajRTOAUteLl338KKVF7ZdKj7Je2ZHwIVr337Ig1
         /UV2gAUQCalhgav5spZMgXdsHnAzJmBMiiVDcqdh8oTvZemLH7zwzR9NfoojwvTlJ6Ju
         bbMGFbKy03tLzGAbpHesei28OUFKlBFhNDQ1I+svGkU0flA44zbXiafpmB1xXil2FKBe
         D2Fjz/3OVyZxk+dB3viIgoxmnXQkL1LA9s3cskrWu+xndNDPxijfVcoM9ViWMsy31rxd
         g9og==
X-Forwarded-Encrypted: i=1; AJvYcCWpRJ0ktUUCrA+9/1iDAbiGRRwzpSWMOPve7MrBp++bbmSCYtHtY7bwL8hgJjN7/AnpZ3K0cBSw3AvmCj6V0sen@lists.infradead.org
X-Gm-Message-State: AOJu0YxBLIPhHFBLrwROKTOk+O9pmAFEeBgUXQBQmqgy5FkQ3EDC1v7F
	LLqukM43p0BTePsGTIvDASm3diZW4HXJndc04SQY7UhtVZvJnLTaaV/J6GSryDE=
X-Gm-Gg: ASbGncvaSClwLEN+kkM5kcukVtrwP5yt9bUE153JXLL+dz7DYNWw0WqkgoOQ7RJ12t8
	GiyK7BGTqhH3zWWQUBH859McvjIGFdB7r6DeCfOWUL0qtlPQXUExoIXM8DntNbhasetXMyrcS9z
	p2OscV5BJX0I3rWYiu+cv/CG1WN5Rg1kjGtqdBFTWKbgzNiBRwJyNTQw3xHeVEud7808jpFHZ0j
	VrOOhdT//XE64Qh6pTO+o1VU73+IFQ9ig6eO8OIYMMRGF/DhFwQjD9Ftu20snolYBrBe5pCVW95
	JbTiDQhfIQRwMmc/WdrYptur
X-Google-Smtp-Source: AGHT+IGLJ6wBq1Q2Otx2cXUsLqwI686ZT/K4uXqflhPHhYRM3ByDKMZpdTFQUXVBYhqRHLkwN7a7fQ==
X-Received: by 2002:a17:907:78b:b0:ab7:c115:68fd with SMTP id a640c23a62f3a-abb70e61a23mr916824766b.53.1739787476706;
        Mon, 17 Feb 2025 02:17:56 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:56 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 07/10] printk: export symbols for buffer address and length functions
Date: Mon, 17 Feb 2025 12:17:03 +0200
Message-ID: <20250217101706.2104498-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021758_228813_8036D2E7 
X-CRM114-Status: UNSURE (   9.58  )
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

log_buf_addr_get() and log_buf_len_get() can be reused in another module,
export the symbols.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 07668433644b..022947f9b61d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -588,12 +588,14 @@ char *log_buf_addr_get(void)
 {
 	return log_buf;
 }
+EXPORT_SYMBOL_GPL(log_buf_addr_get);
 
 /* Return log buffer size */
 u32 log_buf_len_get(void)
 {
 	return log_buf_len;
 }
+EXPORT_SYMBOL_GPL(log_buf_len_get);
 
 /*
  * Define how much of the log buffer we could take at maximum. The value
-- 
2.43.0


