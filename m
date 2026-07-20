Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B8C44524
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=; b=TETGvYeIIFoa/kxHnvIgEweqrk
	Mgvk1kQ7IRwdZ/gYlMmO4KH4Ofzb2sDBNksgx9AWwvNFIvVBitbzjCXdlwnIfX1CY8vy13mSVh7DW
	lYxwjvF5L/qJQ7lpRNLvZeRv7wz8Nln/bTnWxf5jyTQkfNTbuXUYMXy1UOApfQCM3ShklWV/B8TM5
	O7CHB73uBT+ksOC2Os/JGeWqe+xP3uszaDUAOTfTnM7/I+/8+imjJfIY8R9jPKA2B7amHRRlq/9oz
	bRAyNrRHqRHJrf86XadqmOfDpSsw285uizbQQ17vBVXxcvPSjNfdB757/WHAy0LGGaPQ5YrppdIqL
	4q4fOBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLH-000000063dY-3SQU;
	Mon, 20 Jul 2026 07:23:11 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKL-000000063Ct-1znr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:14 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso7410152a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532132; x=1785136932; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=PN17x0GsTbFeQoGAZRpqA8qGLKQGXds7APMTvvd9KsQ1Q/SFhx+X2vz0EKDVsHstfi
         KBr+2SmZaKcMzu4Zn3byc977+29gq0+EwSKj4bplkTp4YaKU9nAozSfNkRnWNnoxsJ5i
         qp8uJ2uiYTHDbA28NHv3N4DcMCZy5lSySfYylLpn3vneZx2QyvXYktmcN75nvqtcBDiy
         xsdcYeZ+HOd/aerAH2aTGRUGK4cGwxQ9JAqsuMq/ykuuvtUCEbreZf9UXIhxs5gHhKrQ
         DYjJ3x2l26TFFyUi0mTL/2SoFwkvL+le7Qo9XpElOkU8sZnkz91pA68smE+Ue5ebn4lx
         LpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532132; x=1785136932;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOacMlllEAiItNG+TLG1ZIDGtvtY1fzk11Q/F1WHU44=;
        b=QGoFX6XLUDesOcevkeqBQ/1pnhD2ywcCOYgSv1V9PPJBnGRRfXhJVIsYO/ZaBJA0eZ
         759qYzLzlrkgUg4NMiSeMrV3hhVCEiPvheV2vvPwVR5Bs9NwYkkAJY4YrgouYBCIPiFU
         AWHXz+I/E+tt9oD1TWeqx12YP3nE9/zCaXRtsOl6P0YgTw8ZKv4796kN3qDmGS33BuI7
         QN+b60dVfMCZ1G+GS+nk2LXYDmWErIiUKOi0hpyvLWnaTSOT9IoYv8cHGW1kWiITrXIw
         +yGcJEMN5OdUNj2tG9ZNSm9PECzmDH36yTAyspFVknl/j++D2TOxfaxoacE+TaUm0O0T
         jJZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxX/yteDKb+pg1EVlFetQX59r5SwdkazvuqMIbUPg7gxfr6UBrJ7CQws3ppfF2run1uAiK4OD1j4EOaPG7LcqW@lists.infradead.org
X-Gm-Message-State: AOJu0YyZzinVc1v8eDCeQFoDJ1PzNfVg4E1Z1ZcgvTb980tydf/GQSjf
	TbS75y2eltOFkSoSuGrAal0yWfHxr89B+9ZT+PRqP1QuW1W708CTxT4v
X-Gm-Gg: AfdE7ck+dMhaet2V8OKfWFSPou9Q/fi4exyMWbAhyd4Gslx/kilxz8SRDgOTRRx2DAG
	8E/fpFNaCErinw9yJOLYt18FCm+awmsrZc6Nho7qZNTZQ+ozCABHurg8O+m/5hvaZ+XtPugo2kh
	MOCFWpqG3JJQteOKQ7xl9ZBtuGyuvqxCMTvXTqEFIjvjqkq/Fj/DQS61vBjFIio2/Fdo/EaVYpS
	3QBXesuNyTpjqW1zxW5sBNmKNhHttWwFe0kqDNJYWB1PUBdaWFpzFTnv2WC5h0smYak5mgW6UqT
	6z3V+bLDseuadRVFmi7fGfUU1s1Ifv7I3YIAAcPmDnQ6z6Zto6W2EetuqrcQumTDuBYma5TV6Lp
	0JmtT+xnGYaQZ5LbLRXSByIx4wvDMhvCr1Prt55+1zwOPTOrB4aH6k7El9+C61H77GWzrLNxrZr
	Wr6bTq3pKZzBp4s+n5Ggp0PUIR1CFC
X-Received: by 2002:a17:90b:2f0c:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-38e4b431074mr14088269a91.8.1784532132492;
        Mon, 20 Jul 2026 00:22:12 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 05/22] RISC-V: Define indirect CSR access helpers
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
In-Reply-To: <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-5-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.13003104709969920617.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=337;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=WLNuylhDoT/T1nhVqbXxx0oK9SVpgxKx6NkmkPvsdCI=;
 b=2xcWmRRAqDjGQXqwGbJnB+31tbqeAGCjzKohhI1vIvF8YponJ3EW8uJz4jNw+WI3VgGyavSGl
 gtdiuG9MO6vCHj8LYZ52PlJfVOl0LaepzbRROI9Qgxlnq4ieSx45ld+
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002213_577542_3D08BAD0 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, 01 Jul 2026 01:46:53 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The indirect CSR requires multiple instructions to read/write CSR.
> Add a few helper functions for ease of usage.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


