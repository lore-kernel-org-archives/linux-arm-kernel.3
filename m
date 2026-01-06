Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D60CEFCFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=; b=B6XDY/X095V7tzgQKpQWFqQWTA
	vkTQHIfyhquJ0c175NwFhMyrD6fPO0MrLnU1yJJtnDfEMjSgFFEJtrv4UsMoHXvOHU0iqIagx0B8Y
	TGgWj6ZgTRDD903Ds8+QbzTBfxsQ6l7Mi2UdlOqHE5XsIoAD+Wvt0Q5GqBqePYm9EXrcjuSF09KWM
	naF7cO6iOwG3RAJd6I/TjqB9e4Z+8fdW9h3t8bePC8F3pm8If7VyLp3F2mP+cUX11TMDLvh8FeZag
	JPITOCKddzfAxxmVLPReEEMJQCsYNEmKwycu/SGonuOjx4AR1QUNYlFhn788sfOpBj+DJ6rALBZK7
	JQ3st0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDHF-0000000DndR-1w4Y;
	Tue, 06 Jan 2026 20:03:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDHC-0000000Dnd2-0yL1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:03:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b832c65124cso219059166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 12:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767729812; x=1768334612; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=;
        b=XOx5LzBAwZ0IrgX+IBixJVl/BQmBsa7U5hWtl4Qr9oda3GlAqiiU+aS2WXAa1xdZG6
         SNys8gyPmHFiuFyvg5yEeRU91qj9nhg0mN02wruIGeZRHX/XXe4onfy1B+Vsl/bEM/c3
         zIOCifSpJvVnB0lhy8H8QOw/Ieu6UyugTX2MdFFHBDTvzC/z5hXEYQpo+rIVRa8RGGI2
         IWphxE2B+Vt5rva5DLykFj4U+GYQ7cSeLsC2wEvOAVpV7Wg9oqQSVBqSjzA2xRtDJjFO
         RIOwbXiZwSMjEKXKZAgwLdpsomC69K5oIB7Klps+HdoE/OHNvZEfSc+esz2OM/ubqUAz
         ln9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767729812; x=1768334612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDKC/3noErk1Q8ZsV7ssZTkXWKMDpO84KVg5itJCTxs=;
        b=e8m8xKQpmZG9TzcM7ptWK/WkYZB5rc78iCZ5V3NYxu/AzXy0L9GMHewnDqrHmT4Tsp
         SAkFvUyuoEvsBaek3Zu5IBnT6W8jjzUncLO93QG1Mq3CeVzRJSLr7UodZsSbMdaEpEIA
         IAue1pyEFfLKtRp1p16HYKk/EHI5kRzfxFuWkzP5VUuOgwVhME0njSIwYwBvLjoZkSmj
         xqUlLtlIeg0B6/LKEGV8VmhSLOQPyTY3xIDXZjGNx4xtRv4w8BuSQep2PSL5TtL/7pXZ
         TjxvWDtA/w3uD2J9hyiUvRKd9fnYgIAIDAijOc0TGHGbkXsx/S9plxrMvvMOBWhBEhka
         +iqg==
X-Forwarded-Encrypted: i=1; AJvYcCVaGyHo7U57hjRBP7Z+5JXHSJGywGcA5wp6bew1j/NrMRY8+cesUZ4yaKtH479GfhgcoA7pT+QiccmaI7nrvrmJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxautkbA5xng/2wpznozrrEmkA+3A/ayPuwrgG2NbpqwqZWHgIy
	FGs/d6ssHkvhOaG8FsZERB1oqNocPyJJOdfnaopLcdm1ZzsQy5Qer1UzYVsAMqIyPc8+7M+I2M7
	OeOwt5kOryzFrl8uQdO8GJPkHQyNZrVZPmhRNfrvZug==
X-Gm-Gg: AY/fxX7Q40C4X0MgIs1DxUEiAhw7/JJb94K158/7tvVzPbv1VN8HQUKYd7vJBA+xZo6
	NMQT9sT6JA7HrcaDvcxob8rABZEoAM15PqY5O9oZBD6JpSgYoFf4FBLJPL8/DhJlQWcXjbAECqW
	3x9gxeKt+3extQ2+epFQ6yYJg4qj5a9pdB7/kfb8Cs/P7Fu3VX2QcJ08TC0RSeoBkwUcjdZLJj7
	O9WZvzwcIZ3L9YXkdysC7r/eyNEUAiRhsUOlyrxD8eozRimkeoSym057eooZw+wS5ul+JuV
X-Google-Smtp-Source: AGHT+IEmmXc6X3lklLmC0mCRNpoBur3TPS2BGNaDYr/bqjA6QRWH7eFRQJKdL8KVJ+yPvHwZtBcG2RvEv+KputuzJWc=
X-Received: by 2002:a17:907:96a1:b0:b6d:9576:3890 with SMTP id
 a640c23a62f3a-b8444f9664fmr26102366b.45.1767729811848; Tue, 06 Jan 2026
 12:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org> <c0eeae31-6951-47ca-8651-868db18d349e@kernel.org>
In-Reply-To: <c0eeae31-6951-47ca-8651-868db18d349e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Jan 2026 20:03:20 +0000
X-Gm-Features: AQt7F2oLfa1exLAxy6kjOxPF0LQxcKRjhYroQ-B3HvTQJnB9vgg9Cr5KITN-rwA
Message-ID: <CADrjBPocyZFz--xCaZahyUA9wwuS7P0E9Gt4Z=53rbT-nEQ7ng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Implement hardware automatic clock gating (HWACG)
 for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_120334_316156_D036DCBA 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Krzysztof,

On Mon, 22 Dec 2025 at 11:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 22/12/2025 11:22, Peter Griffin wrote:
> > Hi folks,
> >
> > This series addresses an issue with Samsung Exynos based upstream clock driver
> > whereby the upstream clock driver sets all the clock gates into "manual mode"
> > (which uses a bit that is documented as reserved in the gate registers).
> >
>
> Applied.

Thanks.

 There were several checkpatch notices/less important warnings
> of which most were result of existing code but few were introduced.
> Please be sure you do not introduce new warnings NEXT TIME.

Will do.

>
> Also, DTS cannot be in the middle of the patchset. It's almost always
> wrong, like in this case as well. This was raised, also by me, multiple
> times on the lists and it is explicitly documented in submitting
> patches. Putting it in the middle suggests you try to fix up broken
> unbisectable things by reordering patches, but you cannot.

Noted. Thanks for pointing this out. I suppose the last time I read
submitting-patches.rst must have been before Feb 25th 2025 when you
documented this rule in b31cc6af1bb1 ("docs: dt: submitting-patches:
Document sending DTS patches")

regards,

Peter

