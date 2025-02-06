Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A010C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMJzjmm9Ssn/2tshx5tAZDCI9Z1engNm3Cw+RIUnYAs=; b=C0uH6ZUjroiJe7T/Nybtz0Lk75
	aZqHg9ZiM/VOoqNLRZN1Uu5Rh3ON4IWqorP9Hz7SG3+0Ua6hr4fRfQZqsc8V/bN+aNYxRazRCN0HQ
	BThnIXfCBKYIju7PVOdqt20h8o05Vwtnn+XrEYpJx8ErzIxL1PR4cr/S/Hc7Tl0I88+QG+PNjiOB8
	b1bfMjt+i54zz2FxoxI6+kFXlhzbBspJfrIt7o7o5KgbDn3qvDqEJT/RlsATdVs4/r9DgDv41uN97
	bAO/HgmLa59sp214+EsKGMyfF5jfmVulC/BM/moRcNOhe5aeMcrpIMybsYWvLdJlJ3SDlF3E5ggIj
	QTMXsrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg037-000000068Sj-0tPr;
	Thu, 06 Feb 2025 11:28:01 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXJ-000000061hb-3Uh3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-43634b570c1so5006735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839308; x=1739444108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMJzjmm9Ssn/2tshx5tAZDCI9Z1engNm3Cw+RIUnYAs=;
        b=ZwNjuuJMl06l8/XC6HCt8Jtx+BykIFCZ0Ceqxa2uszlayHt0ovwpVjr18Us7TnBRSD
         FAA/pjyBPxJXY8RssVLaM/ofk34nwpNMAA9OJ1G3pMWEXuSUXumJQJsSMZr19SfZPfrw
         yrT+zwBOduJv5k/k818mSLOeGAav53/nP5vKrZdpgMTNjh6q2gXdy+YHZ1bx3pL0TKmD
         tkAuY0lWeLYzahoitdL+Hj4dnUzKU5dPhF17SAt3cuLjWFaPMXX0rtwmoIRazJyFRN6Q
         AA6f8aSv2BpPK1/PPGGrSw8KH4yd2jg2amfTZkNkkptCsKds+jMA5OdtgH4r6f8oN+KJ
         zVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839308; x=1739444108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMJzjmm9Ssn/2tshx5tAZDCI9Z1engNm3Cw+RIUnYAs=;
        b=sk9+ewjOqepOFBgDuBK3h9v1aH1ENCkShfuhJIddL/3pefzmu5ojLajfBHYfFiod39
         KZNyXJIdcP7t4leOIH/5LNSHFVqNjQKC89I+cskFmAWefrfEcxPuiyUV/SZ+Qe+Arwe0
         vh64oDbEs86ii2AIVWDA3fyRz+LLeplPDNIapdE0iBaY4Fnase3cYCpPSN238G681Ghz
         aZl6EFn5OLadFBsTT1kYgTaKqiXo36eO/9vrJ87J0CdTlBZypO3sM+2muP5y711Yk+Ys
         Myi6qHqexDVgs+aqbJqUTCvkNkf2fuDzD2NKv5+3di/P86aOYvWx7Z1m7oc8g7GQvMBm
         NkVw==
X-Forwarded-Encrypted: i=1; AJvYcCWKuuQs4JkfcS4lxYFiqGGyY1DpaamBzOleqCZX6U7BRe7MaoXwNdVBlGJkgJ3W1Y0miymf0BDVRsWHnIuMZaqQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh7SxwwTPOYGETu+WhSy4fbKAhmA24IXN2G0Ymr2BKsaYjeTyb
	ChxNhB7+ba/nZ7kMMS/A2qO2gNBrQqAyT7tV3yFr28TLU5QuprjU
X-Gm-Gg: ASbGncs/UbzkeKIS2WKq1D5CUK9c+4YOLLqZ75pmoFi7jtN1bLN9utReC5iyJ0NkQrF
	gHFqsRupB9Xz076LEU//LTp9etf1I53Pw1hvpQb2dUlrMMJKcq0G61P/7PW9eOX4b74BglPUAD0
	UtkW+zdPaMPSrignrSrWE//X4HR/qZ00rWBl+v17lCoMJReB7L1HyDBhHorAOzFjx7p0FIotKGt
	fQz1NQB7nPTE+cVXS3h6dDDvU9+J+qqf7pZ5zMXPa+IYPgph7YmayWAENwrFc0u6FUFb3JMDwn0
	CQ==
X-Google-Smtp-Source: AGHT+IEmR2/TmkoFR9idBNEPfQquu8zyJPeOqwMAgJpW3/scT3Z5dWwlgX9AEyJpUkJHqzG2L9+0eQ==
X-Received: by 2002:a05:600c:1e1c:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-43912e54246mr23938815e9.15.1738839308376;
        Thu, 06 Feb 2025 02:55:08 -0800 (PST)
Received: from localhost ([2a03:2880:31ff::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dc1dsm1375270f8f.87.2025.02.06.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:07 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 23/26] bpf: Handle allocation failure in acquire_lock_state
Date: Thu,  6 Feb 2025 02:54:31 -0800
Message-ID: <20250206105435.2159977-24-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=776; h=from:subject; bh=a6nXDtyfaaaN5/sxSs0OZmYxp3ViUzHxtEF2nqEtxP4=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRndCMDTSB5KQHWglo8M0qqlVd8f6toksUk+2oC Ok/Xw+iJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZwAKCRBM4MiGSL8RypokD/ 9GP0/dyt61QvEQ+p/5NGWAGtLJXjdj00R6BxemQXfhh7MvCRx41BKujZPuPCBt02Xog2UeoMlXt04D RrFCxgOD/1K7vHK54wFCXnJU1den0sUUyDwfsc7Gj/Z0ifdqhrqr90k3WL27q6L5Ur7ohUWpuvAnjx gB0+Y/CJisy/oVjoFzaGqCN1CzvRRmkSSNLrV8Uz5Tf6Op2AvJ0nuER2FdlG/+j0t9YBcFkR3pothS zfXRfrBvws9/BRL/R8Z15OeRzU1lgVUPjSL6C9RU+hwgIhYDCQ00BoTuMlZh511ojo4sTo3/Zvtf16 9+lkVBS8sPO5bap8JYLBHDl0nLnFTfxJMfDyUryqKVYV3GSM7Y86ST04cPqZ8EhWprpNw+iKmOmCKd gjHx0Q4VcPzA5uy+jmFPpNNMXyT9dmIjrev7NGi5DbvK/DNdjUYWQxJjzN02iC7/EvRTjngcxoWyPe rUBoOvzWn7iv0hRVbYWfJBakloSkfB7eIVP2e7rSgqjtytPi/PjYxdl90c9TqChCBlyDqVB8XPQ1gq y0eDqUv8LC+trmtM6Wr6odaXyc9aKb9guEkmSooa05h3a0/ZFg3aOhTfFbDmyB8nOJC/rMKNjw4sQ7 8dmYH22uTb9/O8oVVtMMomG3b8H8m0yE9UTVXLKxcqjDa8wUn5Y2vIIHFqcQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025509_861828_EA40EFAA 
X-CRM114-Status: GOOD (  10.95  )
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

The acquire_lock_state function needs to handle possible NULL values
returned by acquire_reference_state, and return -ENOMEM.

Fixes: 769b0f1c8214 ("bpf: Refactor {acquire,release}_reference_state")
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 kernel/bpf/verifier.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9971c03adfd5..d6999d085c7d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1501,6 +1501,8 @@ static int acquire_lock_state(struct bpf_verifier_env *env, int insn_idx, enum r
 	struct bpf_reference_state *s;
 
 	s = acquire_reference_state(env, insn_idx);
+	if (!s)
+		return -ENOMEM;
 	s->type = type;
 	s->id = id;
 	s->ptr = ptr;
-- 
2.43.5


