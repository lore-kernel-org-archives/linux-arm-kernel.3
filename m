Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA7C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=; b=mFSkEPdAa3OCxoBWdzObhASkao
	0vXpJXQ7Yz1KKjXg385rVGETXx1XCnsFKN618DHFnGWt26Rxnn1KQe+6U9QCpM9kG94amIXWcRK2z
	Zl7dmz+R1KCvus6JJT/Uuw22DipWGgjBhCQ5m7KeMJr69o2QCwoAaAJsIeLAePxvFIe8EcDZ1aI5H
	F9ftRV4Wj8a8FbNIVwc+c7duPvDtcXi9LszAhdpxvZn1q7GDl0PNFv9CCplucqXhZtFBMxsYG/6ep
	PL1qVmDcDy1Av3syxDQ35GX/L5VfoP2X5LdMa+47V/p6E/f5e7LIhn9PyPlUzcn5wv1VaE/NNborS
	uqn91+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLH-000000063d4-2KCn;
	Mon, 20 Jul 2026 07:23:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKJ-000000063Bu-1yDM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso9845781a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532130; x=1785136930; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=UrXozMEfNKb6ZjwNmSjgiI/ybxojEpM+aF9basO3HL1jG03ugfZWzXx5cKiBb4pHhy
         hgQ/Ga4whY0Wg5fFN95ttjABGz+67ifyBSYa9HQZgh4yW0nE0KTnqIv2ymZ1rzCM04Xa
         dbjdZipxvDZdgANkMAk/ytmxAVdLh+l5NYztqHJjmhjxc1Geg3YJqmFTAPIkqrm0YYBD
         iarkO9paUL4tArr68V6z5xnOrvQ8+FBYTI+fmdq35IiyE80E4yM4AO75IEqs49w2sTUc
         4l30c1AxByUNlhMg/NygeQ+2Mge3gMUf7JhYf8WdIRJWyspHz2ESPCEg5j7KVaGzxOLB
         XmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532130; x=1785136930;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=Z9etG6xyT9TF3Wb2/L5fwvASXa8mYqg9J8GwutSuYoRiWBt/4dFZ2JaUCUGyBkug2C
         K6HrTTE7iNp9XKfL+JYM1Qy0+0rmIqHk5u9QwlwbaG2svHioA6L40yGBHRpA55noBezm
         i65Clx4j/dCaWpVuywOSRcxtiGQAf3mQhULN5hWFBriy6d0TmvImE4wzvReS7Py4BYz0
         rp5CPE16MHIBGgp98rltKjuOZrZx8Jh3NPOp61PZuY2kJ1qqg0tnL7pedUrpE3n/4h5o
         X5yWgT7J0cqpLkRFkHwwKn/Hu541dhaBoToRpB3eE/wrlVIEDddP4ovrFflEuSWKXY8o
         gUbg==
X-Forwarded-Encrypted: i=1; AHgh+RoE095x/0kxOz1O4x/pASwl4KLsEjwbJukpVLHZDnuON8flpJPgypcwPeu4dyhyygdwK1VVZshE90VXFXGlXgOe@lists.infradead.org
X-Gm-Message-State: AOJu0YzND70tpW5cOjnG0x0Dpyt097BlmYDMImlx3fTVUR4z8GeSceoS
	K+vnBCHh/5+Sfc4AqJPiLlZkNIFkQFUkhZWue+0Nr5csvBTLFgCs/Fr6
X-Gm-Gg: AfdE7clXCuGYdgSlHD//m0Gz4pm/tmbuYCK+xzTtrfmIeWEpt18SVuqYtjM7YOy/JUE
	+ikTQaOGU3uQkfmragkVGSvdmq7sintFWNzVG7F3w8F/eDPX+QW4A2tywBa0TwT5oKkrhEiBMLQ
	bz5SO9SsAc5PYjwwNZnTqC+1/goMntGO0TdqpWiobpHpaWBBQBO9xIHPptX/lK7Z73r6WDlMHpx
	ivE3UvOTHtZIQ85jellew/uZ4L/mLNdjRqmip8cf8Gqaqcosg6SliMEGYlSdeFX5iucNvT/n8OG
	e8U0XWKrRX1uWn1zvwkijUJsYuh+oowTh5HV5A5Nsu2ymM9iQ+aO8FAjit3boJnIIW4Ucz5lqrX
	ImKNT0VdzSM7Y6XQEDHY4EMshe2Pf9dw3NasCQjq8RWfaAU6lvqE9w6ECybu/Eg1rvw02b4PD17
	Bo/wB1D/Jqylbm4k9+br2tEaeLOsODHj+hB8b3A3k=
X-Received: by 2002:a17:90b:2691:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38e4b5ad2a9mr14741701a91.41.1784532130478;
        Mon, 20 Jul 2026 00:22:10 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 03/22] RISC-V: Add Sxcsrind ISA extension definition
 and parsing
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
In-Reply-To: <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211934.543975.9634665501136926362.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=387;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DaF1WA85q36ajkUp2wWjzs8vEjfcfgQEKe7dAK+cruo=;
 b=RXEmXx3bUlqTR60e37EoLeCgujoBbcJb1A9/syNgqmenEp+jMQ5zhL3lYU2n1ecg3AztUmOp0
 223x7CuCQiDBG4mckQKZidh3U7VcQ7UofEjiHekyrNNXCwnACr4Cm4W
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002211_531949_FA2780D6 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, 01 Jul 2026 01:46:51 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The S[m|s]csrind extension extends the indirect CSR access mechanism
> defined in Smaia/Ssaia extensions.
> 
> This patch just enables the definition and parsing.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


