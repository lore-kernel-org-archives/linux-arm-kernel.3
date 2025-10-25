Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90430CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsJVQgpn61zq+Ge6F8BtEeBoOu3oJNRDvnauUG9sJYA=; b=l7iRtzzW1PjsaYlY7e20NWJt6h
	4031Q4s+B0SwE3LbbZ4D90cjiPgsd21TyZtK48FE7ZrZbfgSWDu/CeoScByYejpZ4nUEkUkpamd2N
	ti8wfx8ZtzJNkm4gXw7ag83Mfgb3Bzzpc0//d5QDxUeLdT3K8txys5MF29EdQgjdk0Hnx8w80sVd8
	JWxXcMwztGgjd1oMKKZ++SDOeX9NnMrF9eXxkNo/mVd423/Ic52149FfCUQ/XOmW4nPFRLPo5MIVM
	BI2+krOmKHxI+2YsZmEwEIMF0xtudcioyD6hrYbRxR1tReDg0KWAlT8fAyIcIP6/7mi/O1ibF7rPq
	PimjsrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCz-0000000BX2e-3koR;
	Sat, 25 Oct 2025 16:33:37 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCq-0000000BWsU-1ZbY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:29 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8909f01bd00so334304385a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410007; x=1762014807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsJVQgpn61zq+Ge6F8BtEeBoOu3oJNRDvnauUG9sJYA=;
        b=Vfu2pOe2MMnR/rzD402y4z0tSVdw2sg5tZsmbjeFOMWKEO4QC42aJLcv+K/XIRcmBf
         5KHWSV4VuTC49uZrRUXcUULYbmrg4yUnhJnq7ndJmMI3G4vBqxRV4maZSMLHPq/Prpqc
         w+Z6kFQiV2Go7yt8b04bL6W0YxdUcfwwyNL47WmPgRNg6Gzbe9OgFWk5aNe8WpCmdZxY
         EMLPCsT/Lh4FjG4J5oK7BKD7xnHzZ9pZIWyaPQ8cJYUbus9N+tYGJiUvlqLbXv9nGqMY
         OrlRYO5o/tEf4/fcoB/Eb+xFSlrqDcHWV4W7hc7BKAt2TSPu2tUdlEivDWcNze5Sxq/1
         0tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410007; x=1762014807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsJVQgpn61zq+Ge6F8BtEeBoOu3oJNRDvnauUG9sJYA=;
        b=hvWPIxgIX512Xvs1Td5yn4oqo7OOVqcAtG7z9L5OdpsyYKTq9ZuvlDBXKFY0QMmfir
         qsXHKb4EKfwtCPrIm+XZDkggPIq68WHvQg0pxOZduV/tq16qEltTpbNKPxxJgGva3L7V
         SDpUDz6371S/f8aFqNKFHwFeBgyuwH0visjFG3kckbZFpzvRgqR98xKBsSC3BpBKDuC4
         AWsJk23BiF/v7eYH8XoEWxTn8w6xxjAWOW/s9A9GDL69Av2ijkfNDJ6Ox2H+9LK5NMtn
         CG7GkC6jjiNmnT0x204L5w0EH+PVOKZf0flbKhxrmqMfUjqQbTV5oBUvVQb4+hnCEiWY
         MbQg==
X-Forwarded-Encrypted: i=1; AJvYcCVfBg55JMfh0KiDvBM90wvj46VqLSgUko96lcgTRuc4sKMPR1Zl0Yq+/rDgipaPNSAyAT3JJW8KbHz+fsRs/AXw@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/RpioL6jBXUmATv3ER3clCCQPQMFrfI9OItQzZBkIoa4ZCeb
	w2OzDfioHy/jqj7e2qC4m0qO8uaJkQptyI/GnrRiSihEDRzOT7nH/dv+
X-Gm-Gg: ASbGnctO7cNpIQDIz56prjZmGef6JhWqMKYwRUah2V4D849xKrwnW5ZHm9l7f54/SL9
	VeWImtXYmELYLjqFwNchpF7kRSClJrs0nU8+HluecFGukfst8Kcye/SwDJjXe2xS1if8bP4Q1mp
	hM2olYR6R5QiNIs8quoi4vL09Z2McdUnuuc4fW5DtzHOYxGn/uqk/0jkvmBrciLOIsWU/7EKFZ3
	7CkfLaHHklqvm3anjiHQbC/VISNfoFJLs44AbsPv5FGwqdbA7ho0+95ObbvyrmQ2xyzir0p+GV5
	hNxv4aAOAaLloPWBiyeC6tlPOfa62oB7iebtlFz4NGc1iI4QJHoewkiIPUap8+iokGGb6vnv9EZ
	GmPdJdMN5CSCfMztL3Wb+IhUK6vS67YB7yRgtirhuFnwxFNhcxRGxv7pQn5855N1Qp7AGBhfNzM
	pX5r9m9YA=
X-Google-Smtp-Source: AGHT+IEi0gU3nsclmOfIhkatsK1ylhMxi3V/RcKHP2qNLsK4jpBPuV25o1zZOF+JE24zBQDJY9wwQA==
X-Received: by 2002:ac8:5d13:0:b0:4e8:a2dd:34a8 with SMTP id d75a77b69052e-4eb94912a08mr76566831cf.64.1761410007043;
        Sat, 25 Oct 2025 09:33:27 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f25896d52sm172754385a.38.2025.10.25.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:25 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 15/21] bpf: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:57 -0400
Message-ID: <20251025163305.306787-8-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093328_427981_6C992BA0 
X-CRM114-Status: GOOD (  12.80  )
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

GENMASK(high, low) notation is confusing. BITS(low, high) is more
appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/bpf/verifier.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ff40e5e65c43..a9d690d3a507 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -17676,7 +17676,7 @@ static void mark_fastcall_pattern_for_call(struct bpf_verifier_env *env,
 	 * - includes R1-R5 if corresponding parameter has is described
 	 *   in the function prototype.
 	 */
-	clobbered_regs_mask = GENMASK(cs.num_params, cs.is_void ? 1 : 0);
+	clobbered_regs_mask = BITS(cs.is_void ? 1 : 0, cs.num_params);
 	/* e.g. if helper call clobbers r{0,1}, expect r{2,3,4,5} in the pattern */
 	expected_regs_mask = ~clobbered_regs_mask & ALL_CALLER_SAVED_REGS;
 
@@ -24210,7 +24210,7 @@ static void compute_insn_live_regs(struct bpf_verifier_env *env,
 			def = ALL_CALLER_SAVED_REGS;
 			use = def & ~BIT(BPF_REG_0);
 			if (get_call_summary(env, insn, &cs))
-				use = GENMASK(cs.num_params, 1);
+				use = BITS(1, cs.num_params);
 			break;
 		default:
 			def = 0;
-- 
2.43.0


