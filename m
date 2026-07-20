Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D73C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h8UJegFSpbzqcCoxFyjFcJzeX3Wy4pDkK5e8kjwbRc=; b=wyMzkIiLdKqVtEf+cHWPKwOzhT
	Z++vuf6DMVU7Uv05tfz9ElJcWP7YYC2IoF/PpU0CS0AF8votyNLKX4zPX1XskBKM+XzEebi02Z1He
	Quz2L1VoQL+gGqqweV9krf9dYSvwAh2eWY0gGvxaQqwzSEWjPl+//0ulKq/xzmODcvDJzxMberdNJ
	YVFgd5rbVvmKA+bPphNVshzJoUhOAInYL7TT41CCSEE/jGcnV7kIQhphKAlZmntUJ6Vm/u3uS8Jlw
	dYqEthiUHCiSoopsHmgHWNM+aCHdgpQLNf8VUC7NnxpnfNHNguwHgHmzoHa64/JD+bnh5bJPRwIre
	LACAEtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLS-000000063iA-0kd1;
	Mon, 20 Jul 2026 07:23:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKP-000000063En-31vn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so4518876a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532137; x=1785136937; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6h8UJegFSpbzqcCoxFyjFcJzeX3Wy4pDkK5e8kjwbRc=;
        b=QlSJ0ReABa6DcyEbwVQjXaTSq8yAHvTsSAVz3cOR5We+SUl4pCMcz0Ia9Bh3Ek/ylW
         sjwPCg9+doywbfbB3JPRxGvx7SHPkoF+TwmIpJUrloP+Eijr8Ar/eXb8ya0xqHscicSK
         C41FUNifV2WzthsVu4TXx9iPlXXBI3ieOukoXHM+8z04pl9dnszj/LVGY0OkNB+QgCg3
         VRUGkpah2VIApZa8ihi8PUMNsg2dA5MCD0c0MxLW0Hc0tOhZleBk/7j8fub0ha/lYEU0
         VzMX4VAs1V9UMaIn46TYxvEV6CBPIoNNl4sfs/85PDpa15Jm9Q1UwSF+sDroSB8Fd67J
         WWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532137; x=1785136937;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6h8UJegFSpbzqcCoxFyjFcJzeX3Wy4pDkK5e8kjwbRc=;
        b=X9xvxtZxRAUuYt0R2audpVp03TDCqTkiB/y/8BXPFVlfGJoLPrX4WLBcFxcQLly9Bz
         RpA20q/27D6+JuD1NaoFyi4LbN3LGX4LOGrlcFgOqeCCyi0CKddyOYiAqbQN2UIo8EqR
         If9o3NNGpYuutyztXeFjKPpsiZ3JofUamu0es+NwFKq1as5TWKxBkzS7Galt91ZxZ5dW
         ec0uAAFvObZQ+ArM4EH3lzZQOSJjP9HlEXh4I+w+xM3OumMbnFbkJFzVbUHcIEGAEV58
         gkFDJNcnHhbMiMmX/i63IMmjQuAPA81/pdH7gFkyzuPagO1BZGiRtNWlOf8C35MaELz4
         RwAg==
X-Forwarded-Encrypted: i=1; AHgh+RrW9iYpsc8sLRtIWuk4mVIK0ne6z5se0Dm1Vm9oAFV4t0Q59DTPBM7dncI6xibpNZxpdIqcXkd37Wh0vVIBRwy0@lists.infradead.org
X-Gm-Message-State: AOJu0YwZe2g0Sfp2/03eCf2Dil2rggpMsTW6c46RR22UME4x3R1Xe19L
	pW/f/n0GQWxN56PmbkTTTWEOFoBCrn3gQTmNUCgkXGDiz3a8TdAYju9+
X-Gm-Gg: AfdE7cmX07MS8MbsOYQMLBvuxOBiOK7ekSsibdKzTrh5OGiYySUCqVIL1DdVGSxPiq9
	CDtc41Kaa0OP40/mWaUT+NDx4BQd6KLUuNP8ZqYuK3YDZC6rx0MSPEoBKckKLG6sCBgcPsymd6F
	3lepKoIIaPY80DEcLXng5Yu7E4uHG2Pid/fjK/qw2tDoqybRhtJxF3o6rs+1engLYtfgml0DRax
	fomPQg/FggjfG/18fjkr7tz+o0bZx+OLSHXj9oIw0+f5iEsXvZndBTLzTX032LZ0b0nHWflACl+
	3osXlnxIi0SnC2Yi8q3y9JdVVnTRa2LO3qyU67U9M81jzKGPy9wPChAdL0U89sVVOAhN0xLr8z5
	2Gus612aPtW7CD1qNR47J0Tj6+tv3qNJGDZAmjJQ/sKIuCwLo4QTxactVtk90jACARHKSMRuW72
	07fVkINxVidnVcz5s+UXurJmW+nlSV
X-Received: by 2002:a17:90b:5605:b0:385:d033:d9f1 with SMTP id 98e67ed59e1d1-38e4b5058c3mr14013135a91.28.1784532136729;
        Mon, 20 Jul 2026 00:22:16 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:16 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 08/22] RISC-V: Add Sscfg extension CSR definition
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
In-Reply-To: <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-8-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211936.543975.6345698898378707454.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=635;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=SzuQlKgKf+dbOdbZYvKV9a605QJD2/wh9qiTBlKZleE=;
 b=ugqoqQ9cmaF8JmbcwtjHFRt8KirwYYADAEAYU1QR3dSM8OO/c3BahtvSrl6cdO7FCzsfCm3Vf
 9NMihisQ3erB93I8FusSXEt1xutLF2NmPmGrBqXQG+Qpo45AYM3E74H
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002218_265048_B4E67BF6 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, 01 Jul 2026 01:46:56 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>

Does this need to be signed off by you?

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


