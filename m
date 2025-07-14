Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B45C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=; b=nPULprkhlnhbrQFI5KTEFJvA+S
	wK7mf0GFp0vOWoN2njMAmB11pYUj8cmcUCMC/KPWH98Wc5AysGc+ssKLZR7+xzQVzrlfs2msOLaJF
	b8dytreL1BeSZVOM2tMglMyYrpvO9dcSrL262Y+w3oxq9Y9o8dmbvzd1bK6RdKkag3CI3QHUXQOpi
	vPQrLqbfqEjOXvD+TIPn2omqb5MOAFFGur63BTwXY2AuEhtgKGTrCn8O2DOCHh0gegf5tubmD3OCw
	tgeeA9ETTvpS4/ZHR5aUqoyT3MsAnOojfrgvS9Bh2ldo6u3ciFsexhXkv7ymvJhZjGrSel9/aQ7bd
	vCUJ7Tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP42-000000039kl-1ohG;
	Mon, 14 Jul 2025 19:42:14 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP1b-000000039YS-3Wan
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 19:39:45 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6120049f09fso2262420eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521983; x=1753126783; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=L4seW4h9KCb8Tbk50L0qOyu62U+ioQvrkio23dZmp6Hb7IUaBU8II3mD4tjEOXRKsv
         l+ZjJ3/TWubISNiuirTtpkAhXPEEFo86yps4MoJeTR/jAh1tZ9Ylu8RJlt+igDsRHpsJ
         Qy81IzMppcc6j+kKtgiO+xYere+uIIUP8JEXain45MSlG59fZ6KRvKq6tJ5eyAeRyzES
         tEo1Y518A9rrW2i8qt6R8vpt6RDj1ghE6aBViQu8B84ulOhEETdF4hgecId8uIBow9tt
         1UEuuxu2UWYWm5aWsGi6fvK/Sh0Pq2rWEGEOqU1tM8F1jJuUhMcJ5ad7oPkLzkuJTfDv
         fI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521983; x=1753126783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=uCAj8y8iU3FHEtMm9uqvhRNNg8VlEKDLU4dqDTtLQ6L6hgykdLZB8YaKXNThOJDom/
         ju0Pb5q/QizrEXcchQEdVW868IsxjkHiatGZ3T0S2/qGQRzTJiS9ujgkg1ahaL5vfwSv
         stApdyu2KhDB6CXq1w7pntNdhJu0F+yN3+/B5Zj9LcdneqtnR1NzRyVy/wUjTPBchr8h
         fWUDHpt307T2FM+VzlF4tX5AEcGoKqy0a7PWxwAp5IbqjE05pcc+ZP+dxKLALC2YBuHj
         3n1Ndl/7g+nkkAhjfJ+T9Ju76Py9UJ33IclxuxUWZpEXEa06u1dfXxE1VfYxRCGr5Zt6
         zOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLycz0wXRoRtV/wwg2s8vSYgB5cuPQ/FivyvOIp64SCNwHS+aaO3N7dAGLJwyOvSCSkRqhw0UlKyZ2yLSIhBX2@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEgGA0pvV/66WTlE6D1Oz4iMDai+k6wrRk+zMFI0svvmEt3W4
	jkXRiXEZ1DtO/eeR+4lcGsWZbtdsBVn2wVn9zkJl2XIjSE84Y01SMlUWRB/BNb8/33s=
X-Gm-Gg: ASbGncuXVXX5FIlsa6nnLMAOFOoEoAu8mm4FAt4+jfL0JFAavsal15g0pN8wTi0EBo8
	ZzE5VCCNbwpzxi0gkjyVnECc3qN5l6rFocPMBgmLDL8KAU7dwLYQHaoNt/bOFPTTc/hkFU9Q4As
	mTsLqpAppGJS5abysM7r/kCerpXB2WtYPE3pX9B8IzAMBqPRAj9E3N5QOPFcx+q/K4rnVtH/3Nz
	zJHcnSEbaT/IfxUwfZkXd/b23ZJuflAIiY2iNWmbsi8PyiOfWg0GviIrrxzI+VTy3LLkMWLYbRn
	nPpCLB4TfxVEUKZJ3BK/hmEDC2on1/upsctbYfi55Z1EhrXYbgNdjJ3+WuhDat8PPpNfKVyq6pO
	w09d0wezjGClV+HG/azufXjIrixw8gA==
X-Google-Smtp-Source: AGHT+IG9YCfy/a8BjNGBo1GzQjJuR8GmP8UR9cv+uwP5yDJexmfxPdWGAOu8EtDFH9IyIV9EN6mZeg==
X-Received: by 2002:a05:6870:c03:b0:296:bbc8:4a82 with SMTP id 586e51a60fabf-2ff2706c894mr10579426fac.27.1752521982792;
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm1674368a34.60.2025.07.14.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Le Goffic <legoffic.clement@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
Message-ID: <1fd92742-0958-4f64-8e50-4d0595fe74eb@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_123943_884366_06CE7E08 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Hi Clément,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-9-cdece720348f%40foss.st.com
patch subject: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
config: sh-randconfig-r071-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122125.eve8lg60-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507122125.eve8lg60-lkp@intel.com/

smatch warnings:
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'pmu' (see line 376)
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'event' (see line 377)

vim +/pmu +380 drivers/perf/stm32_ddr_pmu.c

73af3c4ba702d7 Clément Le Goffic 2025-07-11  374  static int stm32_ddr_pmu_get_counter(struct stm32_ddr_pmu *pmu, struct perf_event *event)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  375  {
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @376  	u32 time_cnt_idx = pmu->cfg->time_cnt_idx;
                                                                           ^^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11 @377  	u32 config = event->attr.config;
                                                                     ^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11  378  	struct stm32_ddr_cnt *cnt;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  379  
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @380  	if (!pmu || !event)
                                                            ^^^^^^^^^^^^^^
Checks are too late.  The variables have already been dereferenced.

73af3c4ba702d7 Clément Le Goffic 2025-07-11  381  		return -EINVAL;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  382  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  383  	pmu->selected_set = GROUP_VALUE(config);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  384  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  385  	if (config == TIME_CNT) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


