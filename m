Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16716075F0B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XhxotQCi;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G2MOUOu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=; b=XhxotQCisQK7o1
	hc0SHu3Zbb6aVOk1Tztj9aA9YVcpw8oYzvrgzDjXfnJaCOW8IP17wv0g58yOx5yM2TbMHKbn0CExS
	cDodDTDunDEDbvVIbJU0vGFXqq7sDLyqNKOcEIob3IHEabqz8u+PYodktfLnPkneb8nXR/gvEjuTq
	S7uwoOKoIK+sexVo/DbAGJS59MUgnkByGfQsa/gbVuWQcb8tUXvlzMPIPLfCoHpxvI/hFlj2Blxwh
	tS1z5nnvVWf7b8huT3UTGgI2HkT0RPsyfcuWle2Cp+rV0Ggxz1u/Ttzkhls2ahOjRDk6r8fSGCSoL
	BDyUo8fxszypkiBZiKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuX-00000008j59-38vl;
	Thu, 05 Nov 2026 11:45:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuS-00000008iuR-3VfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso15631365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879135; x=1794483935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=G2MOUOu8IR5a8nlY84OXGvCWZbMqjqqArmHSmOxs88eICRW7G8wiZVWfpYuzI/6fGA
         q8GnzweuajazCf334lc+YBX9YmGXhZ/DxtVThkXbpo1nbZNU2mnD05T8+5iWHAHxSSsm
         VyDe123ybBtD6Tu0dt1hAM5BbeSSq9aSsNauyzmVZ36CtkgMP2ZxlAOtDxCjjXTd63rR
         xpe1julW0qg72wYDZKOWExhjMbsf9lbMCLKauNYhLMxgR4hav5FUgPO+lSAwi+gvBsEK
         9YTkCw+5J7lHSWeqoYXqvKvgSGp7uFzNJkAg0a7gq5+72/2NA4o0WI0eAMmKnEnqLsAy
         MXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879135; x=1794483935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=Cmc3DKbZW49tOmpTLuBUDN7AiXczyjoXKalicXz3Iq1bRmkfqCH8ictWpN5QWhPxvr
         cSbLre6noQB7s+DStE+EqzzQJR402WQ6G1DEXsCNeM4zb+QQSGSKpjUVInZ/uVJ9jWC/
         w89IYEWUjHtrNE2YvTB72gFsQNwe731xe9UDE6LMjucMQjbYUa8akPVIInqlVgyog925
         vbMr5v3wHjFYc3KzDKHC5fngbeRW2mgFQQ5CUM3FxLkBasOC6egMVCvMX+//q6oiQHlF
         yd+5tbHLkM5lFUvfJL7T5vnvU9al/eZB/dSpXw7dPKSIywr87FETXVzGX+Fpsw+75E+l
         Rl+Q==
X-Forwarded-Encrypted: i=1; AKwUvByJ4if9Goo7tfkrth8G14UjM3B1qkzYXaytzWI+kB6rEadicyZfY4abrXp2BF7eaDoZ6Ersrffu3ScfDtYSUIV0@lists.infradead.org
X-Gm-Message-State: APuU4Z/8ySowZfJQ0absIJiNrk2eNCjKTYhKKxAwIVOPZUJCa50HeQOo
	vwwkITCTdRq3qK7HB7YGIFD9JJ4f94oKpvDme3VcHcKQF++EPDOXNcpQAE+7DQM/eOo=
X-Gm-Gg: AYBFou3vsWVNVrhmkkeL8q7KEuB/NDafLXDtdi0gt9qCaAlZ75Tun2oDNirg5FC4gT5
	jrnpvq5DHqR4Ny4awwjjW33xcz8F1DfHyT0i6oaR6Zz56T6fk3ddlsLbdDPpFf+1UT+FCr62YCf
	HYIWDE/Y/m+dq4tHkpatJleUhSBN+re+nPn0I5dVj75CGLY3rbvGlJ8ovaukR4+QMr8gNy6r++X
	gaRI6+fikHMoztFng7l22uG1UfUGU2CEakSFbFQBn8tLLZGvDPnQxJOws8oa1mJRUvkZND860E5
	8f5tahFqPJopRNoLn0DM6RsqGAug3R4g7yWgP6EYsMY0KFvJOiT0K0FD3VEM0mwv/nPma9cAF/V
	IHRIQrGE9EyhS8CQye+FGkb3hdVL1h9JlTwMLvTkRR/i1Fnh3MoMEDk6CXnzGyb1kI5dU4HUpra
	FUxTL21KTSDDzFjm1XR8jman7qbduHzDkAAiQ2TUA8QFBvqlzu4NDc/iU6fWvmJf6H/LahCXCGm
	qcBVxL2N0m069mOjFtclXdGJtJ2st7lFZMt4Lyt/bjvWao2GiVXCpYS7b7Mqe9rFf3UuPNa+OaK
	3XQVnXFJou5iEZU2UXa2V95sqEDRUt+g
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr410942325e9.9.1793879135180;
        Thu, 05 Nov 2026 03:45:35 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:00 +0000
Subject: [PATCH v4 12/19] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-12-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034536_906096_8125C206 
X-CRM114-Status: GOOD (  13.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Intel PT has its own wrap search but the same pointer fixup logic as the
generic auxtrace_record__default_find_snapshot(). Replace the duplicate
code with auxtrace_record__snapshot_fixup().

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..ce854209213d 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1150,26 +1150,7 @@ static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
 
 	return 0;
 

-- 
2.43.0


