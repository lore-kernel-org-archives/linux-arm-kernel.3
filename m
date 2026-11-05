Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF460A381E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Xw2wjQ1;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BaI7cNq1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=; b=0Xw2wjQ1q44fuT
	BwK1HCxgtU+6OcYziupTGCB5iHOiUOOGIu15g9ia+svgb9jvUggJQEwXiyVqpHOZPV6Emjw+hDSab
	GbJC2ED73j24Y2ZK8m3pAVxl+mliM8MPTTFe4pPmRI2Z5Ezo0U149M6bN77pFig0Pa1m0C/BGJN99
	UoM6ygercCFSC3J8uBngga+Q1vBNpBNZlCu6xfsf1qEfjE+SYPrHC/5wlBwVAtJUGT7iGJmKlgXqg
	1tMN4zmaqJjPnbkYHUga6IE7YfHpAJNF5aYas0at+ZtmoP/FlccJbl6nAmYg84ilkTf+dtqZhs5TB
	U4k+EIB+6g31vxm1YUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuH-00000008ihc-0eno;
	Thu, 05 Nov 2026 11:45:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuE-00000008ify-2KGp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12483815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879120; x=1794483920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=BaI7cNq1p5o95+E5VEhEXPWTsRSz5S7XI+lCvOcpX+rTdQb1vGy6f/QfpstHIsKwVD
         phGdjdIBguRWaqVE6MG6npQAg6rcNr9V4A+5HFLMKWRj/An0AkJrWx4PR+B5jB2SlSlv
         URKES5jxVugvCL3o5xct2kSkGYE66ApOGtZSYTik/qA3YyLzIZGyD/vpe9KOthlHAGBR
         VD6Ars/RDGwlYNgI4xqfT4eZ4/ZW0vZYrtsjuN1qdDVFSHUbhDNWcIHGryyItq5vGHhE
         Fmd6o8svE+hfkzrnu92asXRmegfMKuFs1lYkeDC6rrAe7+TerJz/eY80V6LziL/6NKlR
         WT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879120; x=1794483920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=wGouuVhZcCb61qBEuqk+XCCwPBqvvLvrsNgzBDKll0n5wZaeXBDcQYxd1/IR05XTvo
         2/032McpZMzQPC0jmbKEocufvfUDwP1GApTfbz6pECHHHmNgESgmxVQPHBzqZ5f/A9FL
         /vvc5K+OXambEFbbgubKic3L1gZT2vZMvQqoXnxTEu5pL7S0ZUMG6ZRV599KvKANIhCw
         fUMOkZIUWIzLZYfXQ1atx+w09FoAPoalar3lcKqh2p3zkBWCLpM1wCU/SC09qKSY+odN
         ndK6r8KdEtoFReldqGrek5nQCgO16Gz4JQWYppR6nWxoBjMO3XojOzFjLdmoOzianGtN
         bKCg==
X-Forwarded-Encrypted: i=1; AKwUvBzehsBjAvO56JBEd3NeGGmcKVD1I8/uR4i9og9VDIht42uatWvpgMYOXEwHKOlAvfZnjBF4EY5/PnteVN18y0ec@lists.infradead.org
X-Gm-Message-State: APuU4Z9PMM6w337ZA6CNJItmUb/XvgZuJP04kZ+MCuVy7xHBJU9AvvbG
	CDRuH3yarEE05Qh4jpoi+pyZMGN/3V6EV5W35pU6ZrDu+iLmBlnpthmdV4S0K/3UweNpPVtp3R7
	xtg/dhaE=
X-Gm-Gg: AYBFou1W4fzuc1FbCV6RH2KjMycbzxWnMrjKjRUSqWaQUdjF3s4VAkBCPF424yBW8+q
	hxT6V5mb7Hz47nrNUFU6bh7AaynrC878IYATDj2+99QoDvuTyD6B98clvbqBWBW0u4cBDige+Zs
	LVAY1nnZ8t66LtihA23SqxjY1Ahi+UJ3KZmjrl9lZOEAnTugml5BW8VHWAnzrh11SCEbqls1SCb
	UixI8zjSWML6ItC7eNq/zfd1J0g9FdTzJZ+EVWpRJ6E0xpOvzpQ4IQb0vyZsS9NaaNtp8p+oJH4
	DlQj6A2eP12in1Nl2RQHGPi4yQVkiLjDX+weCQiSAg5qvAZn1pSa6jKLD2eUZY8UqKJTGufXYOu
	0T/kOYTxL8GIqwDywuOxfINPKamvECRIl6hD6zt4JV3i2dkrO7s4olfNuJyGEopCbxLIlXuWfov
	p5EFlu18hNxdgZQn3gV9O5y8VVJLrOG+zs1AnwJxGcpfKynwLgrQ9YP71eRTilfhlgXU18T2d44
	fGywE+00xdMdWELU6fVfPLbjJ7S2r5twi1cMtRAzrz8P1FMJajhVjwHbRIIBzewgzLC2Vy2M+w6
	vfU9PCH8LWvcVusvc9CVy72k/9e1IC8E
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr412219575e9.17.1793879120601;
        Thu, 05 Nov 2026 03:45:20 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:49 +0000
Subject: [PATCH v4 01/19] perf cs-etm: Fix nVHE per-thread decoding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-1-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034522_634394_6601C161 
X-CRM114-Status: GOOD (  17.59  )
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

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf. The exception is when pid_fmt shows that the host is
running at EL2 (VHE). Then EL1 is always a guest, so keep using the guest
machine rather than decoding guest trace with the host kernel maps.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3e01b401ca6f..5abdd726c6d2 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1102,6 +1102,20 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host, unless the host is known to be running at EL2 (VHE).
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode). With VHE, EL1 is
+	 * always a guest so keep using the guest machine to avoid decoding guest
+	 * trace with the host kernel maps.
+	 */
+	if (!perf_guest && pid_fmt != CS_ETM_PIDFMT_CTXTID2)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0


