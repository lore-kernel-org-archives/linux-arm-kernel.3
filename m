Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CAEC44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=; b=AdjcJiGEACrnFadIE1+0LUTeZR
	Iiu2psYKiWqYDOoVAv64P0NnthGd/udHTPyPhGtAbeMVhefcF8/l+XdzpJdcwLDLqSRix3gpAfPyL
	ZiNU57GcQ4ZTOocSq+Re4vE7YMp1hIPDXCykEt9bOeQf6CcRAXbeMJBtga2+qkv4WkjpQQ7TFwUZ9
	nxC/CHqiUfYxl9hS39HXuB4hj5kyACIF5WWdiJ2ywsFsFqgoXGruOpxWDdy3KPE6cHnXj2cz+ty3C
	e+vnjMlyGuwGmDxyO6Q8fGVS6lChUcndHKemy/F6JiLeqQtP+BTj5aTVJUEfgktmMQjt3vcTF8kyN
	S2VOjlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLe-000000063sS-07l8;
	Mon, 20 Jul 2026 07:23:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKT-000000063Fq-1g98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:26 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso7410265a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532141; x=1785136941; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=fhyxD343C08mn7EgSf/DUyYvI89fITuDooZmRWu/j0GHJU1pfCmzBKRuav9VhveOyc
         sBW3Q2BFFcfZ7hAhDBgRszBuaaG8YzkwKZ8YbtX4UaDplF/nXZ1XqRcKCI37BOZHa0PL
         rTZ5mRhEl8K2FyIrPTnmltrNZ8MYfDEnv2cct0w4vSOL3mhCVf4Lb4J2DCzpJgwZ3al6
         gFXe9LNLK27xEKTDzWF0ZnmNt5WfPIyiR1mv4+b2xjVX76RBlOsHWZ4sF+p35LwoGusx
         9Qbviy660BYmcZ6EvZSA1QJGGm+sTgdiowlJACEV4joSnmSBu1rwVjPgcU9qTlY+RolZ
         lipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532141; x=1785136941;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFLZdi7jBgOetxqkL5F8Xn6PniUl5aE+NCedsWROBE0=;
        b=TfM242nIUdLlB8sUlzf8d6kTWEqYfG9vTDrrBGSVgD8zsZS8HKtudHKwqr7f5WkLMp
         oFKz7j0EiXBT/4BVY+xxgupkSiWxtPZKQ5B1iGxQBP6HlE+xfwlv0pDeqCgeimdDozUQ
         rA5folmrP3xI1e5dvTh/qO06Ja7ON3W6OXUuUkAs1oZRGb6pln0bOn/NbIrElAoO6Qi3
         axq8Ke+eigBoO3WH1P9iwQGpstERkz3EXrI7vOVbTRrHbrHvZLjT2ysO8+wIJLAqpPjU
         dUOCJgud5TRoyrLvZAl5mDeL4eaTh4sDJvS/vlVphTR/bC7zDNe6JK0nB/Be87fOE1Yh
         7vsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Q6uN84575KPhnLcncjBqhkDsGjiE/xuNUVCnlIF3LBx0ftFJw2yG8BuJqNvQTqio70OrOO/GY6VhO+S4Fr59@lists.infradead.org
X-Gm-Message-State: AOJu0YwfFOkUQWidF+txHcayuzEjra5WgFo4jvjRfSy8FRwMCKTS9RKc
	e3ius1bHsiwH2xeQLsfUolXZ0EJTaW8S7m91Q17v9rjCtMCjaxSVsGsu
X-Gm-Gg: AR+sD12NS1i/NvuC1CD8ppeFNy1RlcZZlRujwCuTzqT3Gy1dMJdIqHLsNUqBjnE1lsg
	HNAB0GTGLDID/j09nnPX7mm7CIb4Q1XGmJd3RnQUv/4KoRCPRE+M0GyFNQeTZ8uxm+d10/IEBld
	cgyz1Nbexk1++BOzPOc4hhvOmbMeHRW1mAD8/k3yoL1QJ9N437vx7bIIAUeof6I/ZJ7exnI4wa0
	HeXj88VmsrFwuEQa1di+WGFWU++4Iz4evSD1Pl3P0DxX6sQBafN3ocGFuW89RyuGoGDaPvagfRz
	82xhibtAQh8EpUlG0AVACTPkdD57UWZH1kosrgkLB8YOS5+R9CtopvQKgJclFMuWbza5l9KTDUx
	p8GZZq2v6sdUIFqDuZ32Cet4LA002DS+t2RuaNfmYz6wmPzrd83KzMLUJk2xpRoVF3KV2mDvUt8
	Da905BohQAfkWK4f8eCtgraIAl40M3
X-Received: by 2002:a17:90b:224e:b0:38e:7f52:c8c1 with SMTP id 98e67ed59e1d1-38e7f52c9e2mr3426881a91.28.1784532140841;
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:20 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211938.543975.7016109597042850635.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=1181;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=SBkUBV3inMBinSlE2EXReUKlgUw2jSOCC8j8xgqt8Ys=;
 b=kTziE623vXoAa+JDEunw6f10OBNK2smh4OC+4caPgYt5rsl1d/L9P/MzNiS/0bUGjTtCy0tKZ
 nYPopmmArSXADJnnKy4KEiAAwcwHjgpz6bWgMPJYTo3ZdyCSTOe1n8J
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002221_601060_704105A2 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 74d934238821..c20f1e33c65d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> [ ... skip 15 lines ... ]
> +	 * in S-mode via Supervisor Counter delegation.
> +	 */
> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> +	    riscv_isa_extension_available(NULL, SSCSRIND))
> +		static_branch_enable(&riscv_pmu_cdeleg_available);

This needs to not only check that smcdeleg is supported in linux, but
also that it is supported in the SBI implementation correct? Trying to
boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
smcdeleg") will fail on an illegal instruction in
rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
the patch "RISC-V: perf: Implement supervisor counter delegation
support". The proper mstateen bits need to be set for this to work
without crashing.

-- 
- Charlie


