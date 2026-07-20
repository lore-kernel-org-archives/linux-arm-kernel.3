Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D49C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=; b=G1L3Uqz2IEsayEhBiXjmB3Wqww
	5UMMV5h8y/Q5xrXxQLNQnjLLj0HmAGyYZUhYBVfRmeyhIQbAYYB28WVaVjbljo/eAswVIhk+jGqf1
	0pUeUezjdgn+kS6bDjv/cralp/DCQixKq2e4G8IotbxtvKkIE6BeyHaPXI/EwV8QqzkjNxkruDXBy
	6+A5c8Bz+J/s03XYuaNmkbBTwwrY4QTUJ6/3gtCA+RSF0HXSXrV78SCkpED+Hdy/yfMh+5Wr6LWIu
	aIIBQBscQngAth/GuoxyoEXo1tixgLVMu0SF+xothQh33hJY2+HZjjP3ASkKMFrlC6jUNP5AhND7M
	5c5Y7UwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLH-000000063cf-0zxs;
	Mon, 20 Jul 2026 07:23:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKH-000000063Ax-1UJR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381216921aaso9508912a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532128; x=1785136928; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=b0bOIroB81Hial9riGHEXlwMr3Q4SuSjhaQMfNv3cu2DprAv803uQ700W3k1Oip53E
         wBpW3GFU5ocoEL56x4PA3em43ruJmz/UFnw6lNDc3bMmQi/7HLyBwmUT+nv8owqt4n5j
         aopTmVxo8PnMtS1wajtYqdGc71xpdoWSbhikidu/3AS7k5IcMp9YvqOCBUveeAGRjEA4
         pf6NSazjoR3kjGGM0JFu1vFulYihku4RrY8YNVIsZX8wM4LcZhm1KqqrI4KFkMTxqhvV
         7HRIiglxurPpuU5Y/Zp+XIvSyIn/dnUayjB0MeBO7yHC9taFmYlAwCfJhjsAMHRYDMsi
         NA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532128; x=1785136928;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoe1W98CSBa+YkLX38wWaTngexSk74Jy9AAITrPfnPk=;
        b=BUE+edLu2t32IZIgZG5mS/d32q3WFy2mh/nBjZzYIK0GEejdk3VmrRnGX1f3sfRUEc
         f8n33H+0+v07l4dXS9l2BsuME3rlyUioia9o2mJx80iNZRIH0k3dDtdod675kSU59JzL
         SQ2CDfD33jhCeuki34R7WRDrgzZwKLuADFfON7k8CI3W+pszQEuP/35zLuRsBQ2cJDi4
         CXAEo9o4YlKTBAoqBwNtbKMz0+1sSqeXoJ2oHDoQYpd9K7YiHcnp4OMm7MlA7fDFWatz
         yetz0/zOrP4gdoZgVzh/id52na3MR2kWXEDew5vIncnDTdMTAOgtiEm14H8uvTrbchcO
         eFzg==
X-Forwarded-Encrypted: i=1; AHgh+RqHsZUCpB1iXMvhS/TiFYrJbQs8W066fyChi47j+f4oBQaHyMk9rF6kOi2ODaENga92Hg1BjKChUl2PPcD1VYVW@lists.infradead.org
X-Gm-Message-State: AOJu0YwyuP115nnelAkTooMdrI6gK9PFSx5zJ2ajCHLH8jQxDp8WH5l4
	uFXGtry6DFWLS86qa+wKEtP6uxdH8m1Y8tHdGWAdWEpKEahoWfVa+Kal
X-Gm-Gg: AfdE7cmFPM7RM42QDuY73P0bPVrldgsDbFpwwsuo7tZv7eLTFjljslmCFIvPAfMB8LY
	KIKrOOLo4xvZxPRvnpsPQhQkgTsLaTf3ssmJruskOy2CqYDpcKHL4x8m5VGNjg3/ToOnKClGuPF
	kkhHUUeIhWQui0UnhFiiwe3pTohtracuEjGS7N91fCmAJVkXjBuN5l4En26z8ZVAN0OLHAkhqcl
	8uAxnDsz/uRQSJnEBcdpiM7rf1tUV4FY6XhCWb07ZSxLw7dbknZcBnnGMeW1DmXivQL5Hys/mV9
	mY0x7S7KK/J8VHNKlGr6qeJ0eg2q8LXM0KNes7aYdq+nWyAYnVpe6jyV2KYi6Ths8l2rvR76fE2
	OxmVM/XJlPvUb6NoUiI2XEDiHIBwnhuHIov4dQX3ZGihwj1YNMMOs8wzgM8eGYNodNuhMP7uNKp
	d3fbbH9CqGxiNCxtuwn/PLmd9hnPhb
X-Received: by 2002:a17:90b:2dc1:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-38e4b3e11a5mr12667239a91.7.1784532128413;
        Mon, 20 Jul 2026 00:22:08 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
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
In-Reply-To: <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-2-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211933.543975.15394351403928013443.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=499;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=xUnX5r+Ia5wVgu4C1yKp3zoGNGvehdD6dHdKzah5/1w=;
 b=gaVMb42HHyFvagjdkvfaJQqBc2LDpVy6wSQthTX+5Ypqsv04XzByg2JJZ4XU6Awm8QUW1AkTp
 0CtWpu9FKJiCRPIERoLZ072mXxUjc9vgES0WvUzRignXw4Q2xPqF4Px
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002209_399933_CF1D7B74 
X-CRM114-Status: UNSURE (   8.79  )
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

On Wed, 01 Jul 2026 01:46:50 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> This adds definitions of new CSRs and bits defined in Sxcsrind ISA
> extension. These CSR enables indirect accesses mechanism to access
> any CSRs in M-, S-, and VS-mode. The range of the select values
> and ireg will be define by the ISA extension using Sxcsrind extension.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


