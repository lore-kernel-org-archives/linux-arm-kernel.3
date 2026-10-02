Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB61CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=; b=PEgRENxDpV7CL75G18T1wejxOC
	WGelrLomDoxNUwYnYNgz6+lvqAnJUvjz6zavAi8v7mvdNUyx+e5YXna8MrWU38CP/VEjc+r4II/g+
	SlJl5sX2W4lsU+phUiRpkQnXC89Y0hovUB4+zaH5pVqgQXFeU27wkdff5+ZvPc4/3b/TxyibcimvC
	WAXHSW3owd/2fUoTCY+iipZ4eQjOpKOdEYB3onDPxGV27w+swt6JmZ2rxMcSFzlwge2Mf8wYVXxQJ
	+g4jD5nFlXZUHq4K4LBJsCZmXU5z0o5563MKoonhtLFZ8KpHhhhVANRu4leDVzA0XPkwHFiTi4fu6
	7zj4tzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb40-0000000BQQW-2rkm;
	Fri, 02 Oct 2026 11:04:28 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3v-0000000BQMN-3Ub1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:04:25 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e66390995so44229315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939062; x=1791543862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=jJtSHyw2UgcucqfRLy2PSPwVk9xmPbzzIxHZhZXCLhcz13YFvsHwe+Xz591Mb6ndEi
         +nBg6/BvS/p+qPGGsUOZZpdn33XpEknHuWKylcsWMxzsvHEMNPXosRuMCusHDcTRNIlO
         /zmFNkrY0iDJN0Lzpkmk9F4u4iUFWseaJ4Yc9npgoeNnBb7SCio5vzfo795FbcDb7E45
         1gwA7jUPS5rEya3gtMBx+QHq+SERk0dbGHTc+a84Su3H/1Y4Vq9pZR0QiGvwdoN+NX83
         sR//AH1Q7DRPyVrt/h2tXynJhpuSsxKR7M9ztYrCaUYUWF+iyHYP8ZuFrj925otJ97XX
         VlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939062; x=1791543862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgLP/cRXSHew82DCMceg3gOpR06huHwNT68VSs/pBPY=;
        b=Yf15Wqvx6HZfC/9l4uUWYVhAzntO93TIMH54RdeV+h8GVVQjNciQeLG714UzhspPAK
         AzR0XDp4xoCN3QpHx5n1LJEeicwT0CyiBiXtFoQ2qauE1hkE3g4CGAZbuVp8+ViiWbJE
         CwywugexuIPnuRA1wyVYZyn6ypT1eM5uS7M/3KJWs0DA4ifnWLELf76m1Bv4GmsippA9
         ZBSGva8bqewj2/DiKprMzZ+Qrs0tCx+RUTUXC3vhZXeh40DykigI4UHmnXhTut9J/m2h
         v3m4c6tc7G+oX2i3vgOuBuH3LYNP9VVcg9ZKM0y/kVdBfquIje1tElGKmEefy+WUf1RU
         gAKg==
X-Forwarded-Encrypted: i=1; AKwUvBy6i0qNIAchXbsxh42+/AKkIoqAk6rlp9kYxsIRtqxmWVHW8r1ppQt+MDB8ZtHeZVtxs2BCyYk4ydMydtQ5lMIp@lists.infradead.org
X-Gm-Message-State: AFuF++nR1M8zpVoEbz1l4ChVXH4sy2sEjZH9ubkP5xSvTrYNDmI1nVbZ
	YHqKI0Smv9uhgsEXh8e9Y3aR+BevBrljJ9/FRBAg6eC7rcr37Wg5UkTcaT0x7zUeLxo=
X-Gm-Gg: AYBFou3rqVDjmyOTC67PQ2pc5G8w7C5BkDGeVAg3T1kwZAtmQCZ+eulcQZWv3BTz2LF
	0ZVOZVDpCkpQQ6B8GzVcpUYwyehQ/d/n9VIQ1Wm6/LgF3kVf1dGgYzgc4b/8Tbwtc59Lg05/Tgc
	oCbwpbtjSBd7+54zB9TxRL4RwHowWfqxgDe5AlqjohxvxHeiPsVtIZ2xirx+OpzPX797R1A5bea
	cfrolLkFFIhigSNDxsx7enNaTLgGdx6PGxgHfYMPp2Ezf31znzhpyl/9V8IrCggEBjrUA1FOurl
	eyAKYrOogP8T3CIETl6526XElxIGtU2nx0HFpnluX0dDXN69KNbVAcddF9hfsj0FaU4kWK4wGOa
	69qw5aXeT8qLWoAPWXjkLhT3bHTQqKO6n0EbeCDCXa17GAm5h62IzC2dulIJ2VU8/F+tUK3sXCA
	kx1GvyqES3Kzq5+bvseKx8jIZKu+ZVIoAZIuwW9YpadecXhK7THHD062klk+E+KK+L6WaNdqUip
	Q==
X-Received: by 2002:a05:600c:19d0:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a02756f0c3mr40380705e9.5.1790939062211;
        Fri, 02 Oct 2026 04:04:22 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:03:54 +0100
Subject: [PATCH v2 2/4] perf cs-etm: Free partially created queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-2-7a194aa61173@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040423_910922_3D1A9228 
X-CRM114-Status: GOOD (  16.21  )
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

cs_etm__create_decoders() can fail half way through and the
err_free_queues label won't free them. Call the full queue free function
here instead. If no decoders were created it's a nop.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 12 ++++++------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 +-
 tools/perf/util/cs-etm.c                        | 25 ++++++++++++++++---------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 26940f1f1b0b..b56cf57a68c8 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -741,7 +741,7 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	return decoder;
 
 err_free_decoder:
-	cs_etm_decoder__free(decoder);
+	cs_etm_decoder__zfree(&decoder);
 	return NULL;
 }
 
@@ -793,14 +793,14 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder)
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder)
 {
-	if (!decoder)
+	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree(decoder->dcd_tree);
-	decoder->dcd_tree = NULL;
-	free(decoder);
+	ocsd_destroy_dcd_tree((*decoder)->dcd_tree);
+	(*decoder)->dcd_tree = NULL;
+	zfree(decoder);
 }
 
 const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 12c782fa6db2..2a8214f17958 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -96,7 +96,7 @@ cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[]);
 
-void cs_etm_decoder__free(struct cs_etm_decoder *decoder);
+void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder);
 
 int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 				      u64 start, u64 end,
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index fda6b6c02e26..78ae8443ac96 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1002,7 +1002,7 @@ static void cs_etm__free_queue(void *priv)
 	if (!etmq)
 		return;
 
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 	cs_etm__free_traceid_queues(etmq);
 
 	if (etmq->own_traceid_list) {
@@ -1017,13 +1017,10 @@ static void cs_etm__free_queue(void *priv)
 	free(etmq);
 }
 
-static void cs_etm__free_events(struct perf_session *session)
+static void cs_etm__free_queues(struct cs_etm_auxtrace *etm)
 {
 	unsigned int i;
-	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
-						   struct cs_etm_auxtrace,
-						   auxtrace);
-	struct auxtrace_queues *queues = &aux->queues;
+	struct auxtrace_queues *queues = &etm->queues;
 
 	for (i = 0; i < queues->nr_queues; i++) {
 		cs_etm__free_queue(queues->queue_array[i].priv);
@@ -1033,13 +1030,23 @@ static void cs_etm__free_events(struct perf_session *session)
 	auxtrace_queues__free(queues);
 }
 
+static void cs_etm__free_events(struct perf_session *session)
+{
+	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
+
+	cs_etm__free_queues(aux);
+}
+
 static void cs_etm__free(struct perf_session *session)
 {
 	int i;
 	struct cs_etm_auxtrace *aux = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	cs_etm__free_events(session);
+
+	cs_etm__free_queues(aux);
 	session->auxtrace = NULL;
 
 	for (i = 0; i < aux->num_cpu; i++)
@@ -3476,7 +3483,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
 	return 0;
 
 out_free_decoder:
-	cs_etm_decoder__free(etmq->decoder);
+	cs_etm_decoder__zfree(&etmq->decoder);
 out_free:
 	zfree(&t_params);
 	return -EINVAL;
@@ -3758,7 +3765,7 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	return 0;
 
 err_free_queues:
-	auxtrace_queues__free(&etm->queues);
+	cs_etm__free_queues(etm);
 	session->auxtrace = NULL;
 err_free_etm:
 	zfree(&etm);

-- 
2.43.0


