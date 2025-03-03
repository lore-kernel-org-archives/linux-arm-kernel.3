Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E45C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=; b=Fj6jnXor1tUq6d47oj0w17rR65
	KNYtOJDtqM4vuWr5T2UpIz58HGnFZhbS97uXbkVBuR3ZvOeIdCspwGG/0RcQ7uh+7KgyJuHwGU0xC
	3JVCipOAMikExCAxYPg0mJuEAN0DDcZ4PxRCFI33hAizyJBCO0MQQLd8L40ETQpnQ/P29XC9KmWp5
	7QgEKcx77LSGA0usn1ENrZhXX5vZZLIH/94zAOh5yVzt18wWP9HgXVHYmfZBh/5ENf7iEP79hxHpa
	vVRickQhkuh+VGf18yY5ULTkQD0hBV9PTadUVsJTZwfq4d/zzoJYv4qsjI5Khk5PyU8U27Kq3AXa0
	bx0rIA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7i8-00000001JWR-0fYz;
	Mon, 03 Mar 2025 15:28:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7dT-00000001I9r-1AJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:23:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-390fb1b987fso2419056f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741015394; x=1741620194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=;
        b=Y/NXm2TriO9ZpjwDfeIKlbgT9NVrHuYKEjHpLgDhMCyfIEcGHSnEBSQuwJUZ4tptnZ
         NPE2TgDP2Oz160Kp5QC775ePUiDsrPA2XGXIwfqVul8h/WEnM63jiTdrbKmzO4BdEEqP
         /eBHQJ4Yv6eBXfKledqlRtteFYhN/1ALDBW8J+QuBHwJZoqa4lTgNtMJJcrMsApVzKCQ
         dY76AbeETGucnYvOeNuH50WKc5Fr0Zg+OTOuCEcE/uNPJWj2hYHU1u9UHaFp9+gGsaZj
         E8BTwJz5A8CIwokEqpRbz7h/uGyYjtT9a7zbk8yliQkwn+r9xIsqx3VdLegLJ2tSx6vV
         r+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015394; x=1741620194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWs3GXRlx91qlbus5IlQPX+xUrucb3RvojJ3Jxtdv6A=;
        b=Y7o0CyAVTP1diYz7o5EtX8jaPHM/qisoufcVgnQYSFp88DSFKNAg/+iNgRv4S3FfXz
         GCV50KBk4JM7PMVecxfV+ovzybeVDSBlRuB6pPL2M5hXwG3oRcvaD3TNfwlm7w/oN/d3
         olVzppgipYmaA2Hl5nsEuI7iihuhCJnK7aK8kZ58l4dD++hUwC0cDtnYEycKbU6znGA0
         5bNM7KZ8uo4Aw8BVnDLMAL/ibYJnLRJEkgcpb6bB2t4mIOcZraIsthjUOi9ohxB2e4di
         xhcrjc9kF1PBGeNwmXsyVm2sXyBTwTvkQ/AZ7z/zudD5P0nbSY5N+FfHK7fjkUeuHwMa
         nAow==
X-Forwarded-Encrypted: i=1; AJvYcCUJLFpYz+1ugkVX1X9fHWaVkzuHdoYBtnlCy87tmBlQGICY7CMFdped3/5CzSBRnM59A1u0oxIfuLUaZuf9AxfX@lists.infradead.org
X-Gm-Message-State: AOJu0YyO7IO/SOztNXobhW+9U7uzgIH+TlkLrcItCFHXjQhLDhX6xmv2
	/hXZYkPkD68XLoSARvSxwvvKQ5qgbfMAuzgHBst/Wh8qUGvGVjhh
X-Gm-Gg: ASbGnctdNiJ/wvc5bTRtSoxemT89zHSEgDaiuO5djHybeXPwd/g1av3QbvI0UWrXy7c
	guw7zxD2KyJt7M+2ROU1bH5u4PY4IbQ03l65Mo+8DsNHMYPYgZOhSTqy49p8ewqk5F3g5HOvYXF
	pCp1EOk1PluVf1OJC/Qp1CBQa7L1HFF0JxHvQANQtehfuShuR1ExYhj/VbcrpUA8v8Wui6YulAU
	HqZ4oXp8KgzwF8TGfcfmlIai3eu33MweFhEmXptM/qWoFGZWh/9AGS5Tswl0PBMRI/ehsefshKt
	BHeCOpVOx+L7Og2daP1hXzRekJ40bPavfzw=
X-Google-Smtp-Source: AGHT+IErll0m3qO5vPfIOAEgdmC0C+DMiSxgMRXz0/y2x++hKd/Wp+79L1fagMz6mKX2oQCqD0CzfA==
X-Received: by 2002:a5d:59a4:0:b0:390:f822:3ca3 with SMTP id ffacd0b85a97d-390f8223d8amr8118617f8f.37.1741015393939;
        Mon, 03 Mar 2025 07:23:13 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:74::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7c4fsm14904499f8f.52.2025.03.03.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:23:13 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kkd@meta.com,
	kernel-team@meta.com
Subject: [PATCH bpf-next v3 03/25] locking: Allow obtaining result of arch_mcs_spin_lock_contended
Date: Mon,  3 Mar 2025 07:22:43 -0800
Message-ID: <20250303152305.3195648-4-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250303152305.3195648-1-memxor@gmail.com>
References: <20250303152305.3195648-1-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; h=from:subject; bh=WHhXMqIdalfkSexlY5e1BRqspbIYdrDmDQT3rX3AKP8=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnxcWVvzlsIk8Mh+hFnelZKKgCgtqU9iOBLKbPXk+b Hr7ixKqJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ8XFlQAKCRBM4MiGSL8Ryow+EA C1eFvCJZOUlVvCcUeprQTPLwv72Q6ykc0vZYM6C30cB2mh8RDYCi22FekqJDDuIBP3ggLIEkBn++iL HayE8E7tcJD+XUme2bPMlycWLuboqWEkhYbEUmsxEiHDMF0tIGq3CXtTX/EFmdPiqhrfYjK2/U0WMS NOVAt9VBBJ2Gkr/Ahg/bKs76BmL83Wf4QvULiFNYpGucOQLCWNYYcOf3+zvSDaQnE1PLiL4lwcEWgJ BWhLal7zLGBO37rSCp8pXZxAjZbOmlIMd7El/c3QBiJ/AUbfRk2SI2aoPiCG7z+vImKhFG9QUUxpHv FXE64wiHpCMTGwLOtsovyQ7+cDSbyd9myY4DYnoOFearxpOGJS6oDKVpKL+YUs0/lrw0EOGtKl8onS nwiFb0cJg40JCw+qXxsA3WdiI5uIK9cMKMra5mIr7h6U3ffX7Tt02zhl0EZujgfUYOKA9Jtck4Hd1x mkS1YmJ/dZEejK5aHgZ5LEBPw9S9BHwJj17/s5GOZti6Ra8ymdC+LLaxSZUDhaBNfI2G2cQJ70ISBx MVd2vcRakzCnM/Eax/CdmqnGby9zEaPOamB6GxfsXaYvqAw9KSqQjVShNIdzUnP/UWD4l5rcaZ50ZC /DEcBbUVqWlsEJY2xKVzRGMI5YAnPpqIb2pZParSp7t5oTMcgQWd2IuyPnAA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072315_332124_F558BA73 
X-CRM114-Status: GOOD (  10.91  )
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

To support upcoming changes that require inspecting the return value
once the conditional waiting loop in arch_mcs_spin_lock_contended
terminates, modify the macro to preserve the result of
smp_cond_load_acquire. This enables checking the return value as needed,
which will help disambiguate the MCS node’s locked state in future
patches.

Reviewed-by: Barret Rhoden <brho@google.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/locking/mcs_spinlock.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/locking/mcs_spinlock.h b/kernel/locking/mcs_spinlock.h
index 16160ca8907f..5c92ba199b90 100644
--- a/kernel/locking/mcs_spinlock.h
+++ b/kernel/locking/mcs_spinlock.h
@@ -24,9 +24,7 @@
  * spinning, and smp_cond_load_acquire() provides that behavior.
  */
 #define arch_mcs_spin_lock_contended(l)					\
-do {									\
-	smp_cond_load_acquire(l, VAL);					\
-} while (0)
+	smp_cond_load_acquire(l, VAL)
 #endif
 
 #ifndef arch_mcs_spin_unlock_contended
-- 
2.43.5


