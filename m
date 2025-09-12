Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FFCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=; b=nlPZDnWwxJM1SD0Ut3M2vsbJ99
	A2UaXBjjiDpWLoyTrLtlWpy8XzGthPH3D060QIOayzhH/OK+5sFA2lsnp+aH+DJjqA0/hYyLuRqcV
	ryJepXYrqr6O0hYTavNT83eJZ+u4B2CcPBQUS3xdbkBsHnbrY2A/6oyUkz+hV03ACp5lla3k5a/wd
	s2M5TyV2F68rJbnfppOopzkXzG04nDgUNIfjtKP9UznRiqJq0jED6Ot6mMObA0VFE3Lcod2MsCJ3J
	MMnrm4SgCJNZWqTtVZvfA2sv7Ybeyv9Gi0nslj5KnU4J6T+3KWq1X/zsTP78qSbpMYSSoi0GOEDKe
	gdrIiPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QJ-0000000A8Zw-0IyT;
	Fri, 12 Sep 2025 15:10:51 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5QG-0000000A8XC-1nBN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:50 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-723960ded6bso13973327b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689847; x=1758294647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=GKG0z5b2h0xsccDj6K0dh62z4WsOnkoEemoP/iRHxCHPfJvp1wAKr+bt4vaQjd8Rm6
         j0xC5b267OrJ0i6zejvZu0J1ZmcqtrnkbP21ybNIPnSZvTlFYgHUezkyoTySBGGEgR3g
         StI414EAcU4Ry+PTxZIAeCr1n1sZUEtO8IDOy+mxWBp6H6p5Clg2y4jct8rAeRFOo5vB
         5Mr9NwWZrLqzemcAIIoNyjwviFzQfCNguFh9yPXwjXHgbnM4Xfoq90zAgvckFgMprLgK
         Dyr8Id1uFv5En/HbJsF0mxqBrxozH4b0XLKqV4qmgFivBeAqfR/FLkgbgEt1HMklJrMZ
         GYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689847; x=1758294647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=bfC1IN7HnNhBEDEcHgWtiLlC4Lzg8v2WhUoXrnAvgCLv5m6H2/mQEYMpb3zhtn73Dd
         96NxphbVQwus2AS8iI+joZu64Spn+CI2m8TTXSDtHC/NyPRv3mrgr4W6fgwatPjb6nr2
         0Gn5q49wysDz825na2iMrIp3cB0xUToku55m1m7J6qe9PKYpZc2Tpbx5ihre9QFiPReb
         2E/xp+sUWaojULDiBG5qYPI4GMU9BS1dhwsD8dPBav1jAV4Db92Okdrb/wWU/apv9Inb
         V7nXaBOvz3GiDYDqaMLJXUxSKFG+Yo6/TkvXA7BTsU839Jq190ES8gkvVm3OfSrXtNfn
         Dibw==
X-Forwarded-Encrypted: i=1; AJvYcCXCRWaV1BGwETE/vYZVVnTDQdiEIO3ZlLrnHhExQnkKr/LMYLXkyGfB90cghXXM/OB12Sncp9i4Vdayze3Lutdb@lists.infradead.org
X-Gm-Message-State: AOJu0YwzyniZ69ot9gnIcpw+L+uncKOLOcrg7QtIoX3NOSlsO3DUQpyQ
	pIUvWsgLg5N1uacaULO/u2C676kqUyaV010m3n9LDEitwxB1VeOX+VMnLUz0cihZ9Hc=
X-Gm-Gg: ASbGnctwHPLjd0265kaTT0Wc0CM3857FhSBS1dPsg8uBfWKOAv00Y63G0kWCnCGqrWm
	A7Ko96mJUrls+Puobmh+JHqioNtUR5KlAS0zmfbzMguYM8rpX/KnoysdRj0abj81sbt771yXuHN
	PEgx5LxsqzXjCf8MUE8+Z5TNZ+zS2W0cmsO9wtl18ciprv/5hxxe+0kNckrrkOTz4OedmQgoPPa
	WzfbbykajnW8ifNZUhwOzKzVldaKN+PYdPfzFIiqueNHFFBfeZei9hdJAJssRxQqQA4l/rk+NB1
	jaXMKaY3PyfuWcQ5067nKEz+SFAFEMtyPoMzWXr6Jkts1Um6UaGRzje7aV/zmXPQqmDbadHm8gc
	IrCh1GvX3RFDCW475QnJSUSdpQ7wNCTT9fQ==
X-Google-Smtp-Source: AGHT+IG0Y2LxTvBY/AtHJvp89fVFaBOgxCKmySrObEvM5zSsJDKwSvyDpIHnZ+Ay7rKBasM7LP2xug==
X-Received: by 2002:a05:690c:768a:b0:731:1bc7:7830 with SMTP id 00721157ae682-7311bc77c1fmr16987957b3.23.1757689847322;
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
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
Subject: [RFC][PATCH v3 11/16] mm/swapfile: Have nr_swapfiles as non-static
Date: Fri, 12 Sep 2025 18:08:50 +0300
Message-ID: <20250912150855.2901211-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081048_475592_F57BB1DE 
X-CRM114-Status: GOOD (  11.65  )
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

nr_swapfiles is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a7ffabbe65ef..2ef51da2c642 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -63,7 +63,7 @@ static struct swap_cluster_info *lock_cluster(struct swap_info_struct *si,
 static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
-static unsigned int nr_swapfiles;
+unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


