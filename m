Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86A1CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=; b=QYi6kBoJZCzVwKk2QYQj/Cljny
	naeH1dPS/hGcka0PC8xe1iS2fWQH3b0C/JjHFU5C80DONhbfiY7+W6pfgjwbhxWVvISBrrPEzXfye
	Un43ff4pJXddyvpCbLomfCiYO2K7hCUvuN8s3GiFgc0BeEvgsgR94kzg1ZLFA7WY1vc49FnfiMQS3
	bczlFz52ThagKLrF4E/KLvFU6FaRek+6xFDrNidzwl5M1wodgEarHQej8qQ04ij9wJLMsqHUjxqFI
	jy19HlB50WvJg6ohuXnqgPtBS3R9c17kHwN384Q7rIsc90NR8WjlSBevDUn1KXmnY0PkkQ90GrbF2
	Wzvy6nSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Q3-0000000A8JI-1oLr;
	Fri, 12 Sep 2025 15:10:35 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Q0-0000000A8Fu-2lar
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:34 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d603acc23so13740677b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689831; x=1758294631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=sbThd0mmDaPAv/d1Tt0WpPLC81aE+T8pWcawYTM9NxD8gcqjiXQYcdAlepeV2eYG8l
         wkpSpT7AXcoYec8EFnbiD/2cOiN7R35Y2MpUZmo18CWW59GzzxGehgF2EULREWUHVe/j
         TDVTyizHqF84lmAaZIr6cx3Kk65IP+s9St/rPLnkTu2mOdc/DyMRAn0n4DLs//aEHs0C
         AdQTF1W+cELQWVTrw0tvJc4tyPsEcXxpghbL7FGmcjyLh6LdUHpA2m6Zkh7lHtJUlPij
         RqPpFk6fMVXMCwT06f3itrMK6hxLDVCfJ94KfLBS4mnN4HBQcth5+dMgNaBU6jCNB0Yw
         ivuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689831; x=1758294631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1ubFmujdan3yUawwr3ZvZLjd/mUy6/pR3VRzzGBTTA=;
        b=EN/2+t1nIMkRflVsdQu7LJcJCa3HrZwghVGJpGV1o1ypI9oZGsvWPvXKQkFoiHNnWn
         HgEx4Rm0mfOpLfgHRFbsp3auVdeuYTvj2LSItv4B3wiPlowxST72mXJYwPNzlNGsWE8m
         YwcTzBdr8Q8XF9x51oAonimjFimNGQgdVPXRaGthPRyZBAi8vr+ThjLY1YvXjpoYRnS2
         0nB3dwpoLM2yexJ48d6nfD/xf7hBFekJHvFDv6OAt8XDNcckGY1ERgfqlLLO15A3PXUI
         bY0De5vMWK0g7HCJ/vgAv7GnZ8eHTCzI/WZcoMX3Udxw9oCpXT9oRXHk0VD0qONqgIZz
         PAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd+WUvZxIhhE4YmiWGXo3ldvIvY94/1QGTcvGS+4Lajf2B/wkGO4Rjbeef2GX2n6XR3Yzy9/Jc6/EBPN6hkGfT@lists.infradead.org
X-Gm-Message-State: AOJu0YywL3zj7AAceL+RHZnBDIpOSw39J0rfqVgs9P4Uc+FGO42msZ6i
	YjbnxEo4WoK45mCupJMF2iCqQGs5sl36b+6kE8y2NZQfbH2cPEH2964AbtSyv3NSI2g=
X-Gm-Gg: ASbGncuP3g4Hktvk6FRaRUeN1cT4JgtcaxnXTfRObFVJ5lfmoo7zsVB2QnPEzzijUm/
	SSBir6iuF0hUExBF5tq0DnmHxcMk5hTk/j2s11YChPKgOruKg7L3zfd1CjPredvm5/VCgOzC7ga
	s15K1PSfIERivRkFqTpgJ7eZ/3Yih/wD2rCnkQnoizd4fUM0mUV/Z7tMCzcWOuqyXWC4ZzL5uts
	ryR67JlwHQeRKqD6bXuaX/DOy5nCAhyyNHUpBsdOlxULJxRunkCLZ4Uy5A2ap+eVgkbbQpxfKaB
	WSFNCnkEF+KB4CtwBQn+XN4H7sUFmbAvwDironBL6z3a5U8gSkwqY2LL/0Ii4qKEjCdbK16EsqG
	hDbcuy/+FtDIzX1+tCiKm2Q0x55SIRfibsFxjuqy2uqCF
X-Google-Smtp-Source: AGHT+IGQPX6y0JKi888sfyXxAah3q3fQIwu7cpMyf9JJWf5Y6/yYrim06D3kAGSOfpN7Gh01tRPdkA==
X-Received: by 2002:a05:690c:c08:b0:72a:2d15:a2a2 with SMTP id 00721157ae682-730627c9015mr33553397b3.11.1757689831515;
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 08/16] init/version: Add banner_len to save banner length
Date: Fri, 12 Sep 2025 18:08:47 +0300
Message-ID: <20250912150855.2901211-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081032_746231_C86D64D1 
X-CRM114-Status: GOOD (  10.64  )
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

Add banner_len to store banner length.
This is useful to save the banner into dumping mechanisms.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/printk.h   | 1 +
 init/version-timestamp.c | 1 +
 init/version.c           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 45c663124c9b..5bc617222948 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -12,6 +12,7 @@
 struct console;
 
 extern const char linux_banner[];
+extern const int banner_len;
 extern const char linux_proc_banner[];
 
 extern int oops_in_progress;	/* If set, an oops, panic(), BUG() or die() is in progress */
diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 043cbf80a766..1fdd795be747 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -28,3 +28,4 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+const int banner_len = sizeof(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..68d16748b081 100644
--- a/init/version.c
+++ b/init/version.c
@@ -48,6 +48,7 @@ BUILD_LTO_INFO;
 
 struct uts_namespace init_uts_ns __weak;
 const char linux_banner[] __weak;
+const int banner_len __weak;
 
 #include "version-timestamp.c"
 
-- 
2.43.0


