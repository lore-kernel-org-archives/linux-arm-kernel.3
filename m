Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0918CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=; b=SBXee09uoukUtgRvwkybPgkL4n
	UEGwv+NKFBDnkoH1Eugk0cxvAUFMvWk9GSiYwVfauEjSkcZVgRcAwFNDCCxYFFMQ7WDNs1IFQmU0C
	D5/3Bc5aClih094cQbmvipupbG4b7Mo1QWgr6w1IrX3nU0NYpcAlLZ/ftr6vLzEJzwfoPzdi7pz5v
	k+Nx/WnAiBiCDjoEH1QYau1a4rmDi+hYaUelREDbnprQrkxaAlwapgPANlEAlR5rE/hDomiVOuZDm
	vxim8pKj1Prm2J+H1K600nAm2tJKCq6IMqfa+Kzpqti0j0fUC04Xx0nxShCpzfMHGjPRy6jOcJ+us
	21rrd4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNZ-00000003Wax-3Jp3;
	Wed, 19 Nov 2025 15:45:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNL-00000003WIr-2Zo0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so46425275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567141; x=1764171941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=jBiv4kHgXNzmouVmPT5Wt184sJTUl1D5FHS24ah8MycOScSDj6TTpulCu3PDvh6SBf
         5crhyheEEVm49g48tepeflksORAlBYY/QMdOU8KCWVPNyn7bjfUpIYTUeR9ZNhnyKz2s
         E7+an52qqWVju4AJY10prSdth1RXVgOJYJ/fB8F81ke2oKPxJJ/dwJ9EYY359uo/qtwp
         jMmR9Hz+BWmcJlviYKnQLBru7wy6L+5WOpM1y3u/77/WGFvfh4dNc60QeTWGkD8hCMoO
         ElSuh12S0GZwwt0t7gqXColslWu/vc/atKpABapy2OFFRRPZ+aJHV/5cZnH98TrFdHgt
         tyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567141; x=1764171941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=L1LDmAFlfAwURJUE0eZLuqUdoigsVa7PtVDOKdEhsb1Zkfj+lowKcq2IvE3Mtix4BV
         Cdjnsr4K8i6HXTO8oD2yMAauzSpkT8HlhP+RnaQ38fhl38Eb/R5H0cGMMQThI13K1ALM
         SVqpcsl07AdpJFLnSNsn3zRaPB2Iyxr+aOtX+GoPkjFhQ+8yWYfdr08b5HGKSmTPD8Gf
         ICnLjXJeUTC+eo/OTJGfQqeCmo7ZOZ0BUHb7QndK/YkuAvleGZ4D3jlDRHwgEFEk6aTx
         Ryz0+4CjEMeuLop+WEFJYk9CzsyGb9kM4hKx36ajtgpX50z7LIcM8qe3F6zZPyl9hvr2
         Qzkg==
X-Forwarded-Encrypted: i=1; AJvYcCUunzQdveMJWoHU2wdavSx2oKY15B9XR8R/baGTkeyI8X2qr/p+0v+E3MZ513RrI9J5yIvoj9s+pFEOhiw2Lk6e@lists.infradead.org
X-Gm-Message-State: AOJu0Yymu4TYVQSotOkykNe2Dx0mthf8hv9u+n9EeGrr2H9L4Gykx+fl
	Um7LaOk652jh0KPWwCPXVsFJ0lKsLdS39DGC7Aj3hW4y7b48o3cAQUzd2J0zLoryM3w=
X-Gm-Gg: ASbGncuHvUqW4Eq88FuoVgac5o2vNMR2/4x4bTKSS35VWTd0Xz3EqDT5EnrkBK1Zve+
	9ALQyAZnXsbOJx9FrQuHceP54B8LrcMukkcp9VjWeIj+3JjBpkAi5T8J59on3+XHQ8fXfZd47R5
	8464kYkZEXSyteCrkeyfaSbkq9q1qwlpg9AqhvLcKCGdfi2f6Gcu3ELRnTWdEtXNQk6gf0t6nBe
	lSNFhdf5NRYoTgDOuVHHjloksksoAESy33G8pnxQobHaVvdgXUtEDf9p/0M2WXIsMinfSKoYBMv
	JIQeVOjV2k2XgMN8v/+gqRsg26IWMnTwTRsiB9sGE18rM6gWwXr4NNpRN0/K6yvNAZe6XPWbCcR
	mg2CZ8zKtCNL34utvVOT20iUeuRH49GJLLNONudUvvxLLGvokaQSfoAJoxanl49qFKeezwOF7Ir
	HBG6wsXYM0QIEka38mlXlyTBXHkFsXjw==
X-Google-Smtp-Source: AGHT+IGbRbXBdWPtS8s2pezZSC/ny/HyWuyG8gk1o+dQWRtSU7DtMYRlEtgHBlikDrn4myL+c90Kfw==
X-Received: by 2002:a05:6000:2410:b0:42b:3978:158e with SMTP id ffacd0b85a97d-42cb1f9e99amr2655929f8f.30.1763567141134;
        Wed, 19 Nov 2025 07:45:41 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:40 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 14/26] panic: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:15 +0200
Message-ID: <20251119154427.1033475-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074543_680344_392018ED 
X-CRM114-Status: GOOD (  10.82  )
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

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 24cc3eec1805..e99539e18054 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -56,6 +57,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -662,6 +664,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)
-- 
2.43.0


