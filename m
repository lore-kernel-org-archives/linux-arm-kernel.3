Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF95C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81wMdawUXuj3EXOCHXXMqn3Ymvgxt/Q4XO2qMQYsZSs=; b=YwIQydFKiIIRt3d0QODkc5nBmD
	yLh5dIWzy2Q0S/SnssQn/BzXehFqDetFUtgnUMQQasd7NjJXV0/MvTZpw3gHHVnovnzWiYPbQxVzh
	9kGShqUBxJvl3qEdGsF+l8OtwDY8emOLKBEjsvCAM+aZ9lbVVVoiKNiOZvIDS44TMQkbJaYjJ60s5
	0Sh9BwOcNTKjFbfm2/Hx3lqCGdcBLok69YrS4pKgUZTOc+RRk4KiVu9OdbNWaeU7K4m0v874nrlmW
	DDwWKE7WUvzSxIylJZcRGDNlmAc5G12RKH5TGBVIbHY9r3GQqsxjp2eZxPEFPYM2AaL+AOW0lifMo
	lFQa8+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOc-0000000658J-338t;
	Mon, 20 Jul 2026 07:26:38 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKZ-000000063JR-3j0T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso7620693a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532147; x=1785136947; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81wMdawUXuj3EXOCHXXMqn3Ymvgxt/Q4XO2qMQYsZSs=;
        b=OobhIzcx7OqBOU86DcelPbqonkDh1nFF3td1+zEBdxPyHDE9yVFLOWEtxTNScud1fy
         LkmBBnhroEaD09lFPWCyQYCOhfNBcHvxEgUxzVxGj32XrkJAvhvNpn1GGjhleLRLbw4l
         EuDlZSIoygibI6OcFxXUjeTlPQ4N3027UGmnAE57/B1Eu3zDp+8tr7hG0t5bJyLBibjL
         OvX1yRJq/mc0hR/zMANxAeE1FAPFZ2T7/meiZn9xcwf+CNy6WhhF1MENbkx2Ipbu6feF
         VkCsV+OiFekUVx/fWOkgCZMaP7zFwEkEO7c7hOaOSQayrnUjmlpfdAHq/sv13Oux3FdY
         ktTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532147; x=1785136947;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81wMdawUXuj3EXOCHXXMqn3Ymvgxt/Q4XO2qMQYsZSs=;
        b=FEZ9h6HCibfzlnNjk/qS5Mxf1FwFx9aUYrRs7pj/lQ03SvBoupPMbiV6rVZ0iWxBYo
         BqfXN3aYLfgQZ12j3W30iWy5+99K14+6mlfKC/8B9MAMIn7MySLRdfbixv0fE7yVU3rO
         xowdZl4XFNidtFab9iLtcvHEUjWsd7/zWciXGfYIZCCpMEuofGmGq0VPHXT8Ycn766Z1
         jxn4tz052k0s9r6rkNR2LmqZHS1eaKrdSQZmPV7nJ+uZb5lyveUZIqaAQmv/l/CQuzyy
         eAHs460ZQvjVUEIJ9wYnMgHyuj+jSScChL3v4D9ZuioPOrKQApuK5YfZU30GvXIFnNAD
         RUjw==
X-Forwarded-Encrypted: i=1; AHgh+RpGvQnp7u971gJKaU/hL/MGOBcaPbjnifHe7IuK+zW/tUD+LAXcrLuKzHtYDNEnwY5dnC6GmX7rXd1gthGcyTHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzpI6+pmCdIInXlfk2Blu2KfULhc5p55II7BU9Wx53eNjafA4Pp
	NhkZHHpxzcAIXqRDYvfMdFLMtUJy5KIZfqf6MWL3S2aNwrJAredunNqG
X-Gm-Gg: AfdE7cmQP1danibLcm+WsaqSCO2isKQEB1+a2vbnll/J+VmgUXgzW5hoaAwWARuWghW
	G/ciwYZtX0+XFLrvcdjm4iL/+Jltr/oCGL7QvoE8e4vzkWBCUZAKQuOh+cbb5t02uwqd+LV04/w
	PKZkEVhBPwM7TnGFdHYETH9Ls2QB8KgOE06B6n5SxJ882MSoVYRRzD0eS0qhff9JMEWTLMQ+4mS
	/oSg1sAaf+ri93CdjPjjQbc6Tz3E10Yvc4tc73Bqr5x0eEe2j+QGgD042vsPeD3V+JUqKWkfUl/
	VIfNGflPljc2JYOFPZ0yNBQZl42PPhkuLl64uHfSShaXBnvO5UFu/e+kw6btDW9ji+EIqDT0CgE
	Psagf8WI3l2FZ6LVETZA+KFzoNmDRlmI6Tb9IIt4cLlKVJAJ8HLlV4ZQ7quxzSQQZsGsPhrQFu6
	zgm8tCaQ+0yycrp1CvJCceJOCdUR8s
X-Received: by 2002:a17:90b:4e8f:b0:38e:2524:7272 with SMTP id 98e67ed59e1d1-38e4b57d481mr13255018a91.39.1784532147198;
        Mon, 20 Jul 2026 00:22:27 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:26 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 16/22] RISC-V: perf: Use config2/vendor table for
 event to counter mapping
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
In-Reply-To: <20260701-counter_delegation-v8-16-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-16-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211939.543975.4098345314278669087.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=949;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xKIYy9gLfjK0ErQeo2wTtFZ4ZjVBR6dJaUHPV79mAoQ=;
 b=Ly3CRkq9fX7mfbzsfqw+WnDr1CsLgIAkSJ/QQHpnAJqY8KMG3MPlUEx/DORUyeO8ps+EOVR5Y
 5Eq4Nbwj+loAsV8sFj39MhmKvuNa4s0QIzqT0Bx0tILO0RH6WWklGo1
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002227_943991_26FF93E3 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, 01 Jul 2026 01:47:04 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The counter restriction specified in the json file is passed to
> the drivers via config2 paarameter in perf attributes. This allows
> any platform vendor to define their custom mapping between event and
> hpmcounters without any rules defined in the ISA.
> 
> For legacy events, the platform vendor may define the mapping in
> the driver in the vendor event table.
> The fixed cycle and instruction counters are fixed (0 and 2
> respectively) by the ISA and maps to the legacy events. The platform
> vendor must specify this in the driver if intended to be used while
> profiling. Otherwise, they can just specify the alternate hpmcounters
> that may monitor and/or sample the cycle/instruction counts.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


