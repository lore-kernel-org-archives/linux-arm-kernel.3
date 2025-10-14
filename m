Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34744CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+eMZnhJN+Ex6nbNv+Ge2dIVTsp8Www1dtA2giX14Kk=; b=hla42XnumteaPc7/Pqca1bSZfZ
	dbp/kmcJjDRpRxtvMtg2M6XPnc2FrdoKB27ds4ZWWcExgJeLLGhZ3aIU99HYzm8qn9ZDfrsAxpTfM
	D+gXhzIyWAfWL/7WJLY/LRdrZwUTQNb5XhFK0TQYzo8KJkRBy1Qkdu3x3QtjDYJY6COSm9NJWW8ga
	8hgUld1JFAP/Q+WISRcP1hK3uQhY9mDxVuwiQFH3BL9Q4NNFNqevyzqRM1qIt0+3VY4XeuSJ8baYD
	g7BiEUGLZfHkGU6hwP4VGSnb5jgYmbSI8UvhBi7wPEaeRqHGs+4rLAMmK5Vep7LCG2T1KaYAdN6Rt
	2fgw77CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kQF-0000000HEeJ-0qTY;
	Tue, 14 Oct 2025 19:10:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kQC-0000000HEdu-0y5N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:10:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5797c8612b4so6982822e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760469054; x=1761073854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+eMZnhJN+Ex6nbNv+Ge2dIVTsp8Www1dtA2giX14Kk=;
        b=szAODi22Qg5F/meU08CCDGvasWmdqqAMz52l4zR5GH2D6b3l89oWTddDu7kvSstB2n
         CytRfyvkL/g9MPlxOfGrrEZGIjK+bsq9gWBwYMlWFIzpRgTbPvlERxvI/JdkDjZXaPzP
         tofgwKEJuSVp8bBWwgOqq+eJ2AFGr5tvUpqp8bZUgQs4VeKULto2o6vYfCNGdACpqDj6
         CXlQqAfMRojGqT4no93lsH9HYzD18KogUn3oAeQaoGRYwLFC3ew8Q+AILK3PzVQS45ox
         8zJlkaKul51Om3uAbHtZWcwL8YzGGyslEzjhBwRaxtzcoUg09Kt+lawv3xgGORVl2h3/
         Jipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469054; x=1761073854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+eMZnhJN+Ex6nbNv+Ge2dIVTsp8Www1dtA2giX14Kk=;
        b=RZstPS2QqcnngH/Z8/a5ulCgUPWfQJd/2ETMMGHMNCd2U6BI/mDxSRUn5XXn15p66Q
         EMR3So7FOVtZDiMltSDZlgat8CD5Eph8HM1H38eIn79nZkWdTWqWEFPRq3kD3VAV2C84
         fR1+xF2LIjVYfMRBHuTVvR9swEeu8lh6Ja2F/I/BLWKc7/knGXsy/OQBruKFokDytzx9
         XMKxj4cu5TThM+Gxl55GbC2MrLY9ww2FswJbEpF3j/t5t3fkdydbIQ6h21qneuVImabW
         XqEdJsJOlVf++JuBV2Lbqr/cvDEVg0twD2YVL6RTm4ArK/cKuFqI5hnvzLExgDGqvPk8
         MkIw==
X-Gm-Message-State: AOJu0YyQaFXnWPV5yD4G1UR2lc8xlDyBQ1TMd9fPfyx3S9lEL+K7kpyx
	mQ+vGmPUhsAP8rWmZ9n8yVPFGpVOH/8uDiuY5Ch+suno6ZRuQSkvW2j9DETE8nfpuM1h/lsQWqA
	3ExU68JJOMvfYQbkiZdfLCHye3ZOMOQKRJBtxRcdIfhhNyvuvBdb/
X-Gm-Gg: ASbGncsG4/5lhZuTLvZZ/rP9tYS2mJZIh+GbKQqBuBFKXVGvnj7ffdqHVDO07Xuatt3
	PddQefmYF8daH9KxNQuQpX8sDiCrBmuiG4a0wwLwSNCfpXIT5rhC5KfkVW6gU3Uyx9hk38nWVrd
	nEQN/5/aTRwkkz7rlZcdqy7hO0A4VslnHhZOjQVNJzZsI1PFsMDfytGyT0DaLpM77zQ3O1CirI1
	bHUj3zCB83oWZ+vlmWbNbNxr+3fSA==
X-Google-Smtp-Source: AGHT+IFNrcJyZAyKMfntx4NWK7U5znyR+L2pKEnuiMl8PyL7KyHgtW4fyyGHB6hk8japijZMZtZ/Y2txABl94dEz4wQ=
X-Received: by 2002:a05:6512:3e11:b0:57c:6376:b42d with SMTP id
 2adb3069b0e04-5906dae6b86mr6462647e87.29.1760469054127; Tue, 14 Oct 2025
 12:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org>
In-Reply-To: <20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:10:42 +0200
X-Gm-Features: AS18NWB2-oMOdq9MbIm0bqDi93x-Qashsn61W5sglNvyTu1nP7lBycn3GuVWAog
Message-ID: <CACRpkdbt=m4E-=A_0n4TWUdu0XsKiF75Sm+Q5f4KqGpHnFvEWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: entry: Clean out some indirection
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_121056_280106_9379887F 
X-CRM114-Status: GOOD (  11.62  )
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

On Tue, Oct 14, 2025 at 9:08=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> The conversion to generic IRQ entry left some functions
> in the EL1 (kernel) IRQ entry path very shallow, so drop
> the __inner_functions() where appropriate, saving some
> time and stack.
>
> This is not a fix but an optimization.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

For some reason b4 didn't pick up Jinjie on the To: line,
sorry Jinjie!

(Excellent work with the generic entry by the way.)

Yours,
Linus Walleij

