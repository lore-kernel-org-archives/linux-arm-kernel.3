Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=; b=ambCzPlU3jXLyPO2a8OO6Jnjvx
	BSBq5gg5/7SdBtbovHtyvuP/0vNsaAigYifdbsL0yy2NkCJAn/0hR5n4Ndm/hMjFkRUrp6peUIItn
	w/A9j33+L/QHruFcwoXJGaxBypyDPJWtIVAMv4d53QDmP8v++TqxwWnHk+1DSEW8TCc7PQEny5vJM
	Fx+6vrEUgUKpgsFNCFXmzrUutJlmghKaq29OAqFgbZTUTs/MYeSd9JMb22cFfcuz2xAOGRwVNdjr3
	q7JaSdo3p/G1wUyULePJTSRPDiez+knIrEtAuKKWrfw2S67dD4xnMT02Hj72/X266DgN/PDGmBg4b
	MTC+EOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsCg-00000000319-1u6C;
	Mon, 21 Jul 2025 15:13:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq29-0000000HIgm-3bdH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so18384725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102460; x=1753707260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=K4Rdl/Jkzs5kdM9r3TXkIt6nDk3qaAKSPWKEC59qIm3J698ZLHslv5qJlu4FNMxY0W
         vFLqBKJ8CubsDSLeINg15YZMeGqovTwbwhtVfARqdbOYwUrzdhVZCEbyMIQUWxicvKNs
         nVuD/AMewyAjDVidAMgFoLQRsVmBcDMR53gkTfbodFNYstdtghCygoGPe+ds+ci7lZzK
         ulbe6QwdeUP+Sbq539IF12f3IQIoutDfHROOE2W0oGlZfIJeL7dxSTN1DWueQtB/J7nD
         HjtF7+EDCSfudPK7WV6l5NYgYSuYEObCfIVXgEroFCHp87nQ1W9GaVNmlGX9qMjBeX1o
         ipIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102460; x=1753707260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=UCJU14tb9Hi4RS6dRDVH6EKXlnm8VqM3mR5DBJSs8QNWDUBRbEWX8xvTEit4BW/3v7
         /QIv8POlVMj9VI97JfIEkHFYVzfLc8KS8XlcQwuhRSmfIINg3aRdZhcIcMBaU+4be9we
         VPM3iXS0WUA5vHTEORg6igm9xDPSZDHbetTmqHSyuOayi/EsLaESoAKJ429SAb2QiLtY
         ExepBhgy2OXg7ZVGiDhyDdAm6Lx1z3g7naUrF0IryhZ2cFS2zQY0DO3HMIT+K8PmCD3j
         ZUOq2shqF75zVK1wvDzFoGH1t+D2VmTUsz1I7UdT/jHTJLL7U/RvfkHaBYuGf+b+8vJR
         oPLw==
X-Gm-Message-State: AOJu0Yy8b2AfoyXaRiYBE6ioE90e+J5SoFzNVh6SfOdpBkaQEFyqK96D
	HLwgWXblRvhY5w1EFqc6hAjCUodG5PScOwttbsxOGMgNiTPDrpaQJ5y5F2vMCkBsE8g=
X-Gm-Gg: ASbGnctHFVrHWLmGgjWCkhbFYLWDWv3jta4Q/z07Jjm9x/isSyfAOjQIGQFBMLqtT4C
	P039cXPvjS0gMMKZNcv3jr9yuQD2qQ14JpP2mzsKEIM2QLWOlYh9W3dCfMCkFPc+zRixd+Qlog/
	a2ZIbdxueMHKpWGtPv3kOsqpBOpb1GJPsWGm0KLw6h1v2lgqRXy73iht4PtxgrtUWfcNYPug28Q
	7BxfgLtGnjKdWxU3JQzrYLa0EaXu4UkZXoCxFTFEc7XVf2fasN2le/yF7UephsftcyMSSi4G9e9
	EwGt4x28KCPsSB5sFzUDfBtSAFw8D/4vSKv4sFwpuL2D2koz7ydpepGP8ICfe1E+2FVUeef08Zf
	nXAyVUq9dURU9Js9Wc8eNiMzirhkp2QnZkamGXAep5A==
X-Google-Smtp-Source: AGHT+IGxBZUjqF1XoJ+We5sWi+shDrL0KCK0BKEfbRSuVRqaPLjbWwQUIAjCsxGeF4Kf4L6TaJ/XuA==
X-Received: by 2002:a05:600c:45d0:b0:456:21f4:a0a3 with SMTP id 5b1f17b1804b1-4563561a6c1mr160172795e9.5.1753102460225;
        Mon, 21 Jul 2025 05:54:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:39 +0100
Subject: [PATCH v4 08/12] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-8-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055421_900548_8961C2D9 
X-CRM114-Status: GOOD (  13.30  )
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


