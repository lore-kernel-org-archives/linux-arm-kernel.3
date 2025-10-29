Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27FECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=xfZxxE+NoT+3kx9u7whhTpEcXS
	1me6gecrt2tI5qv7H48fGQptl8XZ0Sz5700BCHFUEeCPrXp5pgnPCEFm32xev4RMb/fUk+LI97TPm
	4e/kkztsYnIJ1VS1+h0FEqAGiTilLZ71OVbYjAZNRIFfbLQnxwfEiq1dCrY+G0maIkj4iJDy+BFE9
	CcK5m6ZDLv+mQSL+WxPtHTbilUTMHnlwnxumAxp5fLAvnQ5yDMU9Z2bqWLfJGk3+o3kB/GeTYTyPK
	nvmL9ZUn85aQlFgJyqlMn4te4dvxKCYj6pC9AXd7qR73cPRF5SRpflzBK6x5M113bDqNa9DMQ6B2A
	1MPQM2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nt-00000001r0K-1twx;
	Wed, 29 Oct 2025 15:46:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Np-00000001qwX-0OlQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:46:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4710665e7deso39696785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752803; x=1762357603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=pRVna5c2oYMuOqGsCdhflTvetke3W+AgRUE3GoRhT+vPS1j4YdmO3YbVW/FPBR10SA
         PGd76myN3+DvOrWB2opWC4cXbY7FFWgf/GMHIcAnkq8xT6prDSft1kS+SmrjFmiEuIYa
         Qu3qeFiXwkoFk6tFCL3GPinJUdXM8FdTw66VQmA3J0GuO0ztFXBs+vAIt1cjULNNFwx0
         mdthJnCCO2MfLSCpl+U1ZTJRPCTc8tsHcvkKv6sX42+ZSNxcqAWWzQkT21JSeQzVie4/
         3gDfOrR3moMT2SVCOJWyNwmXclt8l+9mnHomyl7Xzlngbtruc3+uy3VgerTsopjKeK/u
         mN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752803; x=1762357603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=QSmXY/yCGxDsKrFbqEi3OiaymIQz9PLKp7WPAq57w1By3zNv29hGv3/7elsoALYBad
         D9tRoL4uaYVSKH6PiVD2mrOyYSp+cvCC8SiE0AJPeoWDIfBWMtVyMWSPBB2LVlZdY8VE
         te9AfzJCuLRDDc+rAbnTZc8DpAFHlT8tpe7OxAILTkttM11Eof1jlFqwJmfkaxUuPgx7
         Q6dbrrM/FKiLYUGQ/laWh5A9YGHBosvDJM0qVozQaq7l1Hb73KXNBsYqZIieYJ5vFxn2
         1WViO2EZ6jKuxaQZCEPwacYs55sZ2jJyLQvendknUEupsYKZ6G/ekn+QHA68IkjKHknt
         010w==
X-Gm-Message-State: AOJu0YwkpzvMNcbLrvlQvfQotPTO5OZgcF1e6t9JXN9QxrplTolqkfbu
	9/XeMJ72Akrf+2gNI6JfzT5nvk2uCtGILxjXUZASUoEvfo5Ev1H6s1eAfSziGy/Fe+E=
X-Gm-Gg: ASbGncvOmWGz7PatS7fvZ1mrPsFdXfgBVXpbSpNukZ5QimSnqeIF6TCKkWoV7Vw0Ppl
	f3TTE8l3n8Wb61ViCpHSLdHv+4VMytCOy8ElCURDkKAL+IcsPUfNX4YzTMvUnLbY4O/Duqe4lOw
	l68fEwhDVMswN+0a9s6N9YZQB9v5w9wXyQRUWO/FIgfiJWKGAGBGQiEAtmrGyiUcYNnG9V/d623
	6h1Inhsrq0h/GPKANfwDyzwErkYUaDHftJkNpy7J+8sebzG5pH52t1uUJSW0XnG64HK0fu0eI65
	VZ0PyvyAdMKrmeK+HQbh8OKBlwJjnLxTlsU0URf4zkUdtb+sJN9Luuh0x6FnfTdIpXwdJxORTlr
	3C7PXUINvMkrYf4e18Xah7zTHuNYC3ZA7VEobaZq5l0GvUPROqzo3xh9hExSNSjeHUhkoFknJWV
	ufTvdWadJ+0Simkv4NW+Lx
X-Google-Smtp-Source: AGHT+IGgMpgZEFzxgXHO7KovTsc5aHb3zJSnvVbjxNijmQFt3YOgqBA/a+6DV3XDRna+PgQBEaHpRg==
X-Received: by 2002:a05:600c:3b29:b0:477:e09:f0f with SMTP id 5b1f17b1804b1-4771e165a0cmr33584695e9.8.1761752802900;
        Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:03 +0000
Subject: [PATCH v9 3/5] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-3-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_084645_153550_154D77E1 
X-CRM114-Status: GOOD (  12.29  )
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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


