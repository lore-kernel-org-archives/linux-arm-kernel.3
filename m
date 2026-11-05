Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE5E6074709
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uo3PmFEI;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J5zWObuG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=; b=Uo3PmFEIRDEQcW
	YmLCXWAZPSJ/YKxkrxXz5FmJKekXhJptugAemjU9TYyTd5cSnjxh4FATA9BgwerNNRw0czXFE0TjP
	yixiPSNVqw0pwU34uO5oFDFyM8N/ub/nlBXXMrCXw0CA34f/aJ65SgubguC8rbitsmGBZfikXvy+q
	TW6x+fdVh3r2n0t8teOodQkKQp3O5nGfTbbXEzvao4EcijXT5EO5eF7QBY0Ykp7mbq2GoCCysXHBW
	n9cULMHyY9z39/egTRwlNUIYy5/1hG/8MDGVIi+9bMh8B0vDpSOrKV1XmbMmdlSThLUZEbMy0iZ5r
	yupmde58mfvKdnjymrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuW-00000008j2I-3ufu;
	Thu, 05 Nov 2026 11:45:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuN-00000008io6-1jQ4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so17952575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879130; x=1794483930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=J5zWObuGOGuPRRV8Hs1tABXsLHS2sP7vMqd5TMuGUwLTJJO23sZOLXsgEg8YBGsPhC
         56qT/jp/ZDeVTj6v8EBg6MLU00ekD+L/hWBR0U8hOXfiXNZjtEOkS682ct0ENrvHcApx
         gfbZsfPA6+BeDW1rBtO9PyCvmc1OdzvzZkKTOzW45dSO3KpIpDca+OmNTd4JL56yGRBU
         ytamcMsGoMoA8vdzRPXRIpzt1WV3cQdCDGKM0IFfAGe3oJe+ZpT9EB+QqsurwT5Gu0u9
         TIj9LIY+bh12ECv0pB/WKiwokB1HONDsAuKmnOr42CLj6hhLylLQ1OH7zxUcWsm/y60o
         gBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879130; x=1794483930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=aSk7zmjPVHIIZO1KGramdzLvNrv7uqqCQzM/xTDBtexUTpxig/aqcMJJjEPuPMbGKs
         L2azBODG3aQ5cNVIHS2nWN36ExaLqdXoI8hxttP1l8fz7ePsUT0gOfCwh/tbeIX7XtJV
         Mvbte9uXRzGo/SSMRceOb66eAquaNpGpwgWnBE6LNPmOJHVF577Nf8MvYVBMvtEzdIl4
         7tQzMmeMOX5dM8zBMJGonZISYBlfahH9Xz7nluZQxMqMLcoO3yu2Jj3dc7ReWETnzS9L
         wktkX12DE5QHu8lbsj8GPnusUoqlHsSLmPAQA3xPruu+if4Ey6tEdDndcb36dp4PdWHb
         usbw==
X-Forwarded-Encrypted: i=1; AKwUvByOeCvWV8oAz+DoKI269zUCZW+jlJnluhCvRJ9NmkiZbNaMx3+TTpWKp9kHWOXwpOt9LO0FIBruSzLfRWblN23P@lists.infradead.org
X-Gm-Message-State: APuU4Z9Vg7Ps372KEZg0dQJfOisIt+oYiHKoFKMWeYwoZA7Ma3IDJaVG
	Kd3bCkgMfoDxFmKiMAgKDqyFH2W95C6o8xutucmi7e2r5uo2jayp8VpUhvBFXAg+p18=
X-Gm-Gg: AYBFou2CuSwg8Mg9E3hDFgFv8wDCKML5y41qEsp+qSf90QcAV5mHJfyIUECA0xaipaa
	2qnxu3Cv6sLZJ1J8t8BoYZX18njsMhVMCsDMTHpXvAIwy+K+6sdRZCstlMU2Fb831G8unvpzo/+
	poF6pBRNYGl69JDu7RAW+L6HFyLjfDyqyZi3l69fHVOBfvmUtJ+aMAHVDqBS/4IZ1kd08aPFEt1
	swjYAeUXi/wsrfZdpKpD4doOxKFuMrpdyIxQWALDTUeamJTZPc8P+eZqr0KwFqqv9Ee1gbXiOhs
	I0ROANVEVMvBMPrPicbLGh7NJc4TvcYykqcEd+vefWFtv15V9TXwXVxvk4sfu8EOrzxTaUUop1R
	RoIhmLDvLESLbUI6OUasdGyOP39F6C/gCzprteRSiX99ridY+N/TYA4IQod2p7E7da/ZiaD9Vm1
	uioYeLfO2RX0VYV6z+3QM+DrD8Qn3SuIg/WlmwXTLOm3rpzWvkidzlbGNmyeV0vv4262sinlNBJ
	beXXKT1L0OQNwqrGqR6MIGQLOD3VOZhEVKoTIf+lmzjAK1l7N77KpGPEm2QMRMrHjrgAUDXxC6d
	2G0K3WX0dGOYGe5BfBSdnjCDz5+nN5UE
X-Received: by 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr357815775e9.33.1793879129751;
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:56 +0000
Subject: [PATCH v4 08/19] perf cs-etm: Use instruction length in
 disassembly script
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-8-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034531_482491_68431BAE 
X-CRM114-Status: GOOD (  14.30  )
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

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0


