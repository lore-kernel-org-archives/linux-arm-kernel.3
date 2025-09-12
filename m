Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F33DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGwNZTJUDbb42i0I/DCBOpee9BSl0Ek2gmsDPeJY6Qk=; b=Itvg4GwTTrw2aNIL7Dh9UYNFoU
	ryLUPOQeI8i2rvW5uajvZ2Q6vM/tO5Gj3kzJkAenoza8tkb8gnGTPyaIRu5ioGt9v9ir8Qq/q67Z1
	vcpmNB0ODiQEzb5JKPBZHIrBJE8iasQpkXfbr3zy+4wS/2tz3eXEeoBaY0KI3u7N3AHNbvFLxsEaM
	qynRlvnnfweBLjx9VmGPlHurVrsz//1XrjfsUFEu4WB1I088QWt3hqYz7if/HR84U9n86tGn3Oz1D
	HI+IXra18tC/lg8Ec2wgzL89kJEFvpwnhl0PIYcbuebc2mhxpT5CwlIw4O5LB+opnbU+/AuWbeR65
	n9XIO3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QD-0000000A8Tx-12qX;
	Fri, 12 Sep 2025 15:10:45 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QA-0000000A8RX-3kdS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:44 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71d603b60cbso18644957b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689842; x=1758294642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGwNZTJUDbb42i0I/DCBOpee9BSl0Ek2gmsDPeJY6Qk=;
        b=E0t2EVHWNA+OADKwQg12bIHkKqTVfo4Rp/z2tFXC3S7/mTmpI4dn78RlahshEFtUU1
         99xD6mdmg3Y3GxHVSJ8VqyooJjxgA/69CjeI+DMClQ1cI2xIw8Ivi1upvJiOef1d4MNA
         Dl4pYVVAuItW/SQ3pvFXNT/2xTf04d3Wz0yGxsHGNNvDE5d935cyzBXjCq8TWCBNlJcb
         oamMbXjU/uEGhM4GsqaVmCL9EYco37Yl/XsG9OohLRoosB+1Db9SDrX2hsiqH/zXvlVT
         Am87tbuGm5KK94INkSCa4AonHyvyI5mfMZtEn8hW+MIY5hqmHDMx/cNEnje9A9AaTLPn
         nJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689842; x=1758294642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGwNZTJUDbb42i0I/DCBOpee9BSl0Ek2gmsDPeJY6Qk=;
        b=UgL/PV6iWVCM39z0/OB4ASVCwg3cI8BfA3EgW3XjdHoCXyW9bR/24d7jXW2/ce1EgC
         Z2w7mHIdUMz28iMNFQYPJ8j7rAEmRErCMRrd113u96PXz9/bNxf1kN7flQ9ctfbyTi2u
         JEc8ZynWOSHrv74MihXEjxa3Aao8t4YCYFXQ+DR8q981bKJ2H/1zd0GfFyXmSmLF0Hgz
         jBTciDFp+2pnHW//zn41F6bQVyEOybUC8xBxsy/JMDxr9L1koZbwY5KyJOnJVuz2WzrA
         BN4juxKKoO4axO0OI7FosLCydQ2RrdX/vylsJjdeXzGeT0EXgIdwffCs9qdmJj9QkX+n
         zI4A==
X-Forwarded-Encrypted: i=1; AJvYcCVDsj+LN2SN7JpYJ6s8srVZ8kTEgkvoo0X7s82JIoK6eC0cof5nlrlhjD0HavbF5nLeNtxym68btd8oPludcauC@lists.infradead.org
X-Gm-Message-State: AOJu0Yximwlda600ku0cYBISVYaf7EBSokIcEBqS1Fi/Q0ir7ni9LDY0
	9pRQp1bB/MONXfB3isVScWQ1W8M+gbai+iQ+U0Thu9AtQMP2/vSfxzazyUGuM0J9uvM=
X-Gm-Gg: ASbGncunX600v6RXlc7Efm9dzTtXSvSSUeQBygBngEnWAxqE/JAdAylXNfSMAo5CTR0
	dhTaP67wBenhHBLMNh/3odEIhT5JtQAT1H3pAxxC9iIsb4q8Qq72zUMS82/NqpusVYBjKvsQ5Tm
	jVpWMBE0EUjtDRxvn57KPbRctfbDF/gFiuauyc5HZFPGImF902OMHQeg+5eHwYuoMn6wltqcVK7
	kjNOV5cia9VNycboJafq69xfisaxlXIL0MzAhOxLhLwYuSPxxf7Yzq2SFnECt8sE70KsrbVjMSZ
	boxqCIyJK/VcQ9cr8kTsI5Es5LZjym4WPosISFhp7gtswAmrgIjvkyAus9zMFWZLu2gTN8Bx1CL
	R/eLIp2r/W1wJLchpxwTD26yg8vOB3FpsuVbpG20cBH9b
X-Google-Smtp-Source: AGHT+IGd4PoJfw4tH37hzUk6PYKHbfiAkto5gdK9xgc2f3TOFApwMRiD1EpUFg4A8D8xg0pKJaYxEg==
X-Received: by 2002:a05:690c:f93:b0:71f:efa8:5881 with SMTP id 00721157ae682-730652db42amr34340137b3.30.1757689841832;
        Fri, 12 Sep 2025 08:10:41 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:41 -0700 (PDT)
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
Subject: [RFC][PATCH v3 10/16] panic: Have tainted_mask as non-static
Date: Fri, 12 Sep 2025 18:08:49 +0300
Message-ID: <20250912150855.2901211-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081042_935289_37055561 
X-CRM114-Status: GOOD (  11.45  )
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

tainted_mask is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index d9c7cd09aeb9..048c33dab98a 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -54,7 +54,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 #endif /* CONFIG_SMP */
 
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
-static unsigned long tainted_mask =
+unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
 static int pause_on_oops;
 static int pause_on_oops_flag;
-- 
2.43.0


