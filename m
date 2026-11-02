Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2E606D22F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yInxz6Mb;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHELBYAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=; b=yInxz6MbSXu+ZL
	k9u43Ww7mz3SS+i1bcVKvUBmQDPNkUmc/F9Qed890zVuizrB96ZxoUXw2+6+8mBOjigF2F5TlXa3z
	mNN/00bMafmUaoS81VDhNmIwsFz57hGQVIAvNaDBpkSSCF3EXYGT/V8ZfEe97uTOPqS8Lr+9Rm7Ra
	5Uc6aGcXYpF4CjrHAM1CVZYpGCJg1zaDScsBJ6eqZUhYUJdl2taNIZ3mVnBsRNAKfeXJS33Ow/lKp
	sWod1YIgZYJb890NO/Tq0rN3Atyp4xBfeGj5um2RxX+CaJpUE8PIoC9gOSVk0DFSDhy7CFJ3Xna79
	QUps280YngFvd1k+5aGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxN-0000000GQoX-008d;
	Mon, 02 Nov 2026 12:16:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxE-0000000GQXt-3KGa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so29917055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621759; x=1794226559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=PHELBYAiIBAv8jtlpQGMpYZBtLLd7p6c9PNUR7TvVwnLdfPpjraNOF/Boaaaar/+Pp
         uKoq3WTXYGHRS168h7OTfQq0FfPiztqYeZzD4gQk/oGb1trp71r6wBUX1tcIfdx+8wtJ
         CiKFdwH9Em4j5QWk3s80F8deqP0eLFVEp2ltEvVjf8XdozS4Z89ymQtv/1rgQcbRtz+w
         1jIiugzfCHsZr7f/k/OqgpJXkvqkkjgGwRTIZagGrWLZSoHtUIYUCa5XZ1TcMPpS5mcM
         AiV6o304NNMXIK3qEs1incvLxeURWPtU6NRLR7VimcIXDyOhwqJh/iD7CfA8lNMHG0qr
         j4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621759; x=1794226559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=M4lJQP4sg4A7nsOxdHqC5ojmtQSL/DdEozzXGoDKgOHzYhKa7xBqnj1XHSzAXL+f6X
         Mz5j3RdEn6wpr3Ag8UnAOGKuGUkTF1pfJpEa+eR/3DuJcspxrxBNn07423rl2rIi1IrI
         srl8o1Mqh9f0vTolZX7pTUBjwxx5u/g5UOXbJwYewWl4gSHc7CKL7ZJ053LeO0OW+8LD
         96h76jkWLl0bH2TnpAoKTSR2+v1DfTU0umySJBbHEGqxDhORzIKMQV94QGXYfBSJeyBG
         nSvNdMGsybL2xk08iqeLL4r+km4ShVlqt9gvk/Q5tnjOSMRcXQ7G5R5CfJ1MbHMTli/M
         Omaw==
X-Forwarded-Encrypted: i=1; AKwUvByxQBj1y/BJ5VVQrw1eS5QzalFgFw96OQK3eBIHT4zjl3tjD1zvJ9fR4iOBzCjuhgHfFy7+VSL2do4DAsqXuw/D@lists.infradead.org
X-Gm-Message-State: AFq9FYLLn7KcvgOaLcS/4NZdD20yctBbc5t0YN6x63mzmIXhi1wZyJ8z
	IMB6EypKdfHp59+yDg+yRcf3Q0Ry8uoE1gbQ01C21YqGd8MEI29m/wFRQnZ+o1VAsS4=
X-Gm-Gg: AYBFou3pkd4wh8Yr1Do50ngQ8mPC7ipwTvWWCkX68BUh6RuGwRKdrasmz45bKsLsNut
	uwuxwhGpay9aixY/5HpgW3jCnM2yDyQzaJClq1ePIR7GbVB1IjgyiAK1KzInfbJqJqEzA0EDzUc
	MbUi1+KMJu9jbLa3nC8B4dC2jNK3ivW7Lh6PbRD0t6574Xh/5YtH0Yw03GuiRofWZlyebsiXaLb
	JQ3s+F/QBd+UPkN2frOIDG49hhlRe5lL7b/vIc3QG+3EA75yV/Aw5n3SRufYYiWdLna+/XCjUyF
	ZVc+wVptakluCgzxvzyiIYwry1meEiPHJoCUslodLglpc9hvBlVfmwWAXUAxAOopTRvODF5yj2G
	g2XkOgyx7jy281sElCkN+4BDunYH2/fMiou1cIO/UIegymkTj28QvozIlz5LwZva8UU6O85JPaA
	19iF4eITqw+e4ZkdceK2Q9nyKYQXv2/wIBuNbtDjt1yMG8uL1Y5MBohEr+4SxjwrH34EMDilRbx
	umcS6+qKpaRFtYdCwPKmNAGoC5XRkfrG3OHGnPrD3rxzI2u6ErKnnnvAyb6iZyMYf8jPncJAAzR
	TpLP6fNVrLFkg5wS1tlHQkNHt6clfxYT
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr197102405e9.33.1793621759044;
        Mon, 02 Nov 2026 04:15:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:26 +0000
Subject: [PATCH v3 12/18] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-12-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041600_913805_6939BE90 
X-CRM114-Status: GOOD (  13.80  )
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


