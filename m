Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94981C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=; b=bkx+z3p9AlkhQaUzI6w9A19XHF
	Xt9XTqKrcGKwP+yUbieMRkOGuvzEukPrICkzVu6G2jmho608dLnoxximDrbg2b6Dol1kQBgZFTXbg
	6xN7G+fAkhEuJeimkQ5rtbqeg/wOMUPn+1wLctDatIGuONMqBnwkKxxoLMlS6gE90EOgLnxo3f8Gj
	v9GVb/b0Mj3MZE7WXJpWtx5RcDCbWvdBzJ7P5pTEGU00yZc3vVJ4/sXYVt5PZBS6DHf/Smai0c+ZJ
	IZZRFXZ+wCUAyXsocJfecVxU/FGswNZ2nCNzg+XkZfOwjfPMkVOyJ32Ea98rbqZ1QjS4rBjvN+Ns7
	u1mDOfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnLA-0000000ECXc-1XxO;
	Tue, 11 Aug 2026 14:20:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnL7-0000000ECWS-2FEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:20:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1f758014b8so280515766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 07:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786458023; cv=none;
        d=google.com; s=arc-20260327;
        b=GmNeb166365gmEfVVtv2XWqUs8KuXJ0npLd/0gWez7ZqhHmRC2HTpb/jKmGcQEGgZQ
         FJsm9hGfCtO6Ka9MyQ8zZYNbOd3e6gpFMbZFeCQPdmRaG7uEh/umPpTMJHv+5dCPa3aO
         +A7cF7z84j2P2rqsn1yH9QrTKnrkbCTfxNeuS/qHEUnSab/sk7/+s91YpY+iv2BtzWOu
         UEh/BoFY4gtjNq05NZSriQuj8Iysp3wMwGlnmzQG392MshkJDMz9DBHUYw+zUBT6OiKN
         USHLZfUBmU4QOdaBJRLsjwIdAg8TVGc582+kxp/BEUtSj15OkMHnZqCE6kUqq7hwG4JI
         izqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        fh=ir/BZIGa+DikupQspLg/sHWDkob88HtGVrNdrniWz8Q=;
        b=bAHekAL7D9cp+/VLVMnAU1xWh1n518tzB6gFowsyYVjXbIxP7979owJxwciReiLycM
         xLbt0H4l6WdRHp9OUKwah9mcmwJ5fV4nIAe5PXDtUq9ZrErocu2/c9PrKvixLLkLhFde
         3rxCm05BTSE7bCPDYPRo6pzNNH3U0rFAl2nORJME5NmyzPxQ/e05pbWI6vrvgnbDEHnd
         ojjCuRpthaWFIUiw4qG2hqfdbbWKAIlPaYgFY8RjRjGnLCtdqbCvvGGp00fYno0U0iV/
         sqAcDz23xULGnozcdvfKjD70kQaoUTD5FCJlmJ+H70gB/pDF4OlZam5pAByPXURtkmfk
         Ep7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458023; x=1787062823; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=g07IQO4Vl2jIIHAxVOlin2xvQDKnDd7w65SwH5BfGDXWNQUI2ZAwKlj3WL81MeecLO
         kmuIX7AmVkuGvYDEVOeXLJNXnPQgeba7Hn63gueeErcmKFFGqj9l+lKT7S/l9cwbfKIS
         3DA1YJPrsKm/351GC7LlTk0TaQOMq51qJxEbp9o2s5C+6XfacZxH2bFlv8FodGg+3HIl
         IJU4sb8YJVKHU5soKMkrAq6qw3fAmnV2lcWGyyUYvilP9XxYDefdyWQAmT8BAV6YapQQ
         gsk0Zrv6IxQcCoMv51/LTkkXlwZDkU2zj4bD29V3MlQ/cwO922694D8ykftvbgKh7Pzs
         v74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458023; x=1787062823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=IDZhhXYHO4Qc1agJ8YwVWkQ37F8vxh9uw7NwkCr5+HcbGye2FK3JeE9JDbkcjjY1Rr
         t+cNxAtYJxI8IWjYxMYDZ/XLV594MVX2+zZgKN0cqBF5s0MiOY/xd7c//0JLDhjLFpkA
         9TUCDr/RB5NDTqSZ9CXCFms0wb4kdCZPEaxQfG2P+tcKQx7hykq7gdXp2TuVSZdiR/TT
         52GJSL1jBylXH8B0ztI98c335eZKeqMBmUYZLYHO4OSKAE0W7Bxi9c27Epxfe1JTLkRO
         CQ4Y43w57vW8Lt21ov9BI7N4D1DpIgz0dY1+nqJj5X0rz/PBL7Q4MmFQWkvVAeMa12/E
         QBPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Vx4spzF3oeTkHgkm3skK3nLWIAeZyargGrvvcmA8BHVks3GH/iw9a1vVWvYzThpsNeWHm/Ff6Jn/jhwlTNY1@lists.infradead.org
X-Gm-Message-State: AOJu0YxmrQpGiAEMnByCHz8CPbUpopPpGRQpOJGmNr+BmASk7w5nK59v
	jncq9GyAEzOE/iMbA7RH82yEkFQM703iPMkw4WgDuJ9cWInMqDUCVGpbm61PjMUr7j5wGKQC2EI
	Rt6yJWvSgmqbI8LnujTTPt92ggb6ab+Q=
X-Gm-Gg: AR+sD12ayKoCEf698sGOQIkDEEz6LM6tB+1+enMM8uaHCMklAJYcU8+I+0cxlLa4k5I
	qRjld/kbqEDeRifNfFBpHJZemty4w05Q+d9+b7+Q9ZZ6TENy1p98SzcNUDN/lA4tHUJNCwhvZVp
	QqtGyqBKKL8XnAehN2jpttF0TxQvXTKHyHYZ/xLIlY8Xdu/WUzXEMNZtIN7eKfFfJx8OglQtm/6
	u+5YF7zBwhirrdcwmJvB6Nvc2iVJ1cXfB6+KejBTtGmxsjSl6MbUYDYjCaNXf6K669U+Faj42aP
	oi7wL9RJOaYrzC7hXfRX/L32LKKbbHqRz1N47CYKJbw=
X-Received: by 2002:a17:907:3d11:b0:c15:d4f8:dade with SMTP id
 a640c23a62f3a-c20ec8ee1e6mr50072366b.2.1786458022732; Tue, 11 Aug 2026
 07:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
In-Reply-To: <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 11 Aug 2026 16:20:11 +0200
X-Gm-Features: AUfX_mzTu9IARagHp5y3Lhufa5MQ0ahYW_Bpy7_ilNA0FNARMUxNWXd9eRk54e0
Message-ID: <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_072025_633861_34B572CF 
X-CRM114-Status: GOOD (  18.13  )
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

Hello Krzystof,
thank you for your patience, I really appreciate it.
I think that a lot of my confusion comes from the fact that I'm trying
to follow the structure that is already upstream, but the whole driver
and bindings could probably be refactored in a more straightforward
way.

> So binding already has reset-cells or not?

The watchdog binding at mediatek,mtk-wdt.yaml [1] already declares the
reset-cells property (optional).
Inside this document the various SoC compatibles are divided into two
lists - one that falls back onto "mediatek,mt6589-wdt" and another one
of explicitly declared devices.

If I am not grossly mistaken, looking at the mtk_wdt.c [2] driver that
handles all these compatibles there aren't really any different
behaviors between any of those watchdogs/reset generators.
In every one of them the .data object only provides the total number
of reset bits in each SoC toprgu, plus a single "has_swsysrst_en" flag
for mt7988 only.
For mt6589 the number of resets is missing, which means its reset
controller isn't enabled (and therefore it's not enabled in any of the
"compatible" devices). We know that this SoC supports watchdog resets,
so there really is no difference between all the SoCs. Both the total
number of resets and the "has_swsysrst_en" flag could become
properties in the binding document and be added to device trees.

This change would avoid lots of redundant compatibles, but it would
break existing dtbs and I don't see a way to keep compatibility. Maybe
an entire new binding+driver and deprecating the current one...?
Still I'd feel more comfortable hearing the voice of experts before
proceeding in this direction.

> We do not take bits, but identifiers of resets.

Currently the existing mtk_wdt.c driver does not use a reset table
that binds identifiers to bits for any of the existing devices. There
are a bunch of mediatek,mt*.h files under dt-bindings/reset [3] that
point directly to reset bits instead of being indexes.
I can introduce a reset table in the driver, but it would break
existing devices as those bits are referred in device trees and they
are often non-contiguous (e.g. [4]). As before, it could be done by
creating a new driver and deprecating the current one, but maybe I
completely misunderstood your point, in which case I apologize.

Thank you for your help,

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/watchdog/mediatek%2Cmtk-wdt.yaml
[2] https://github.com/torvalds/linux/blob/master/drivers/watchdog/mtk_wdt.c
[3] https://github.com/torvalds/linux/tree/master/include/dt-bindings/reset
[4] https://github.com/torvalds/linux/blob/master/include/dt-bindings/reset/mt8195-resets.h
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

