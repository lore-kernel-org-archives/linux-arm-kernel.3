Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AA0F531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0m6CTk6wTQa2I/4VyueCvjJEv4p9jFA0baTHakVwpc=; b=x5l1LmvlWLk4vElI8tC2LS8ESU
	GlqvF4pvtxHhuaKN7pKBGbXgXXGlfukKpdVTu45AOsnsDLeKGRez81GyHK1eN1MhYB4S7PnZs2ArM
	/PRMTb2G3dMNy5U1NtOLs+iLE0bIgoXB9ORzuVZPlvu5sq6r3f1Y8hngmL4SERv8PdG774+8a3beH
	zZTVbgNcvewxHr+bv7TsmAtIlkPVrfVmVytbZfXexJy/l4w3te7Ax0hrMaucu/GoOpmrck4s/p3YN
	310sZOPihavkjXn7RpqlB1ZdISe7Ai/0kx6wD9CKOXmu5s/DHlAFiJdRA7n7RowSx/0J7WA36w/m/
	kdYY0bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbb9-0000000HCOl-1sla;
	Tue, 14 Apr 2026 11:06:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbb6-0000000HCN2-1Czv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso30051885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164782; x=1776769582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0m6CTk6wTQa2I/4VyueCvjJEv4p9jFA0baTHakVwpc=;
        b=Rc5JUvqMJz7bZujsgAePd+Ibm0wKdOeG4+JZdSa3B7IUZHueLOkqHWjaJLkWjUbHVl
         6+yE6cUc4xzUUxOi3kzdQx0+O4JAbZ+orOa6xjdbeRYhiu70LOqrKxyGz6U2u1svqyPO
         qLsWvuBqNEm35+KIuahk5PrSAsZ8orZvThNTsJnumGmCeDvLEoYO+e94b+fnRitrKcY4
         iYQNX2YuNDCBF6faHZvWkDkUSTMDcV0WRAWcRwySa9gpYXU4e8daGZxyfiZqpe4ZpAmF
         5wXRTJiFtSsbfGGWES43L50/eAKIERMqTQ1JsKaU2dIxG+glyKVOzXxMhROJvm1wSfPH
         0lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164782; x=1776769582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0m6CTk6wTQa2I/4VyueCvjJEv4p9jFA0baTHakVwpc=;
        b=WimQjK/GVxdyVptfqrkPK4y0OSQ3dTYZUuci3JPi3yV1eOrzlaPjAkxq3EqbS9JWKQ
         u1c5u9w6IFmFMbmkl6Ja5RSqiO9uYPSPTA9pACMaVX8gDu6+aX5uTPcMahbIbm5kb61L
         qozsqhBhz/TAU32CYn2G7dFYXAZHmmCuzEwxp8dh29X16meNBu6M7Vba+ZrY+pZBxeKd
         np6LBZyo3YuI4jSH1JFZpGH19UYPVbDNgnNbiBEAaxUPPa4j7DzawEpMord2YzCFtchG
         DF71AhbHQ93STrcJRyl5wy+E+TcVlnstayvAlWWcFF5HoC48595Dus+8MzIUksjHKUS6
         nheA==
X-Gm-Message-State: AOJu0Yz32hmnalY1WM4pYNQQUTPlQNijzErE4LtbN1PKOrqo4ch9w0iW
	H3rlTFlX8kxkRm/vaHcISeMS7noVjptjdFdJXRk10KmMJRUfNyCH2twxXSiVjFinA7w=
X-Gm-Gg: AeBDieut1ARM0DsjqKA7JaLx/zAdGlppECbLCWLewVPze/oQm5aSCb4yLBzLGQRKg8V
	zk69zcXE3kRJ//PiERNtIJ+EOZ+HVgQUCGQqVQLn/s9UKslZyDGUEvF1VLWc4sXL/sXNnqcTVo9
	W/9SigIoLD2ZtFhA4N1Gk3elnBcF/ZpoD6t4NkbAhpzQjiyRfevszwWyphThVblhkbavGfq45wa
	gacEfNBu3eiqndCwiEpxuVIL4A4J2nc+piTg4U1udgEMUycqOwhjvagOOUIzW63GMwfOng8wUWn
	pt/+R+4yXpkoimAV8EwqzDN2rdrgvHa1OFAvcd0s4a1V8L3Nf3bq/P6yMX+BFHmpZnHiLYXst/x
	In9Lzw+JoErEwOCMkDYE7CH6eeznZ6fnWgk3qHZxRVTap/8JcRUGIIpPp6s5HitWoPAJc6F24jB
	8uTVJDK8cyTVpx8dmK0MdlAKgW4n0fDQ2C2F5dzv5FAg==
X-Received: by 2002:a05:600c:8207:b0:488:a4d6:69ad with SMTP id 5b1f17b1804b1-488d688dd1bmr229092875e9.27.1776164782252;
        Tue, 14 Apr 2026 04:06:22 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 12:04:48 +0100
Subject: [PATCH v3 2/6] perf arm_spe: Handle missing CPU IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v3-2-63baf9c893b1@linaro.org>
References: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040624_353586_98B8D852 
X-CRM114-Status: GOOD (  15.29  )
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

Don't call strtol() with a null pointer to avoid undefined behavior.

I'm not sure of the exact scenario for missing CPU IDs but I don't think
it happens in practice. SPE decoding can continue without them with
reduced functionality, but print an error message anyway.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 39046033e1433cff82ef0668074867aba4a462a4..f9188fdb8e786fccff94cd8a92f367d90efc5cfe 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -982,16 +982,23 @@ static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
 
 		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
 		cpuid = perf_env__cpuid(perf_session__env(spe->session));
+		if (!cpuid)
+			goto err;
+
 		*midr = strtol(cpuid, NULL, 16);
 		return 0;
 	}
 
 	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
 	if (!metadata)
-		return -EINVAL;
+		goto err;
 
 	*midr = metadata[ARM_SPE_CPU_MIDR];
 	return 0;
+
+err:
+	pr_err("Failed to get MIDR for CPU %d\n", cpu);
+	return -EINVAL;
 }
 
 static void arm_spe__synth_ds(struct arm_spe_queue *speq,

-- 
2.34.1


