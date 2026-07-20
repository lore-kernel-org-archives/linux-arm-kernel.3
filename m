Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9DBC44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=; b=3Tewho9jjqeTUCnmHrCHDOw1e8
	0dffZ/Iyx+fgs+Hbhn19gZClIt0I1VrKocKad/x2w5by/kzQf4WqCEuN2u/p5tAfYIg4oqvpmsHtD
	WoCYIFIPNPAl0Qn4i338XYiHDvj/vL/FgsoWerU7RHbJaxqTLlK4v6mu2j8+rhkPrlitHLgETOUK9
	PfMzBBN7l79GKD08II7Ce1CKW4kKl5BWIiVhWhqbVwGpKbGPLfXcKB1H6HqXMvL7DptNO2MJsI68D
	FInfTRi8/lLZJ87+pz6HcWOH930/lfUB2vCtQ8+pft4qukNCnYaAWNgY+NsOHDrO2n7sB5LECvqQ4
	W2Blhy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLp-0000000643i-2xe0;
	Mon, 20 Jul 2026 07:23:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKV-000000063HR-48tm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso9845934a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532143; x=1785136943; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=RkdY+xiJIEu94l3Ok5rmY/ELxmR8GPpzD5O+bibJAq8wnI8cHAgmeMUqQm6dR/Ni/7
         IUw9KXTSZDIN68+K8XdQndk+HLDJ3JBVg3UDzLmaguzLaeVjWHI5Jv5HEvr0truK/pC4
         Jz/f0k4IKqXvUMqCclnuMLqPXxt9B8tXpmFQBUO6lalK0+pns6GaBqvf+a3Vent39Byr
         iQmX5PbzcZejK48tWm2WFOgeKUvR/TCWnrnpxRzr3OQaAsGeLhNlrlFbN7oFNh4PIXv7
         6m5ohmHaspRu6ez+Y8Mh4VN9IZJBcuhzRvMazIsQPZVXKtVk18dW8O03ZZWLEk4bz/rB
         yIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532143; x=1785136943;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEpkUtKIjl+LLb7gWLja03h8AP/aK+y8njduXSgGt0Y=;
        b=hBGmowIDH4dzvFGjEJBAUmBDZYRW2c27bX0gHddb9zC9L3uRHJOr8Z4rSsTCirdkMX
         SHKhDoWpS8MXBp92M67ys9g4LXlk2Ay1qU2o9xgfPVe0FAPP3swXDLl8/BivTRUJLGC3
         FlnbZC0FP52WcpqU7PAf/zzEpVfzhcBDwQspsOeTYIMOvGeiMSmVWP7K76lpzKXW8BPC
         IzPzVWjjjpwSoP7R8nUAUNS2Zc2C5P7BxOEH5ku57lzuR7dLO50y3Szkm6gWI9XEgaJ0
         TdkoG2/TsSlkT/xiG28sKp1kmrNE8JoiZLfAWudH8615OJsWG1x2ND0pNgyuO0k9E/f4
         kjPA==
X-Forwarded-Encrypted: i=1; AHgh+Rqc2rtyq2hE5n6o2y0TvWLjZ9mtzwL18j2khNlV+4Iy4bVJyZ3GyagshMrXI+zQ8VhS1MgcdEgN+ZUEbne6AONL@lists.infradead.org
X-Gm-Message-State: AOJu0YwWaGByKmkG6lgUGdf15dd3kuuC/IxmYxK7ffrB///S85MrSb1X
	Az12/cRgM+MdXDkfJm/toDkDw7mUkc6Ekqhjw4ngGVh1/99TPFbi7bNN
X-Gm-Gg: AfdE7cma0yVBgPfQU2Y+FtGu3jTSG+hP48b+iH6aeFSogUQyxHx+KefiGg9GRrP6l8s
	3FSpXL99bdByQqBv6BAbfVuA0v0EFf1T6OWjaLAPxORwwwoUk4wBsA08H2Y2CNAggw1bQAhCe6J
	BWkwbsFv2tx8Rgw5OH0TFgNz/T5wDf+IB7xY3Xk6dp826jXSyt+Op7/BvMeFMpjr6NEY4uvsZsB
	oBbr8fhhSDD401D8rcbqIij3YYGG7EVLnqMLHZ/+a8WAc7xgnqil3SNjIcXn1ELJe5UqLm5q01q
	6RdHSG+UAc0OSuspdqV5RDdXWfuz0YBRPTAh41D5Xd8RorIsoTHhJmPFLGanze5shMwzB03o9yE
	xT8YYxBCeZgRxIFtbQe2wNqY4PYDZ6tiXMgVY6P2fHdSbb+8OY2ljVLZTuNU7/IIYrhmSQKJFlR
	Z30/y75QLxklR2o79UVW6o/+XrLmy+
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr13633934a91.23.1784532143064;
        Mon, 20 Jul 2026 00:22:23 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:22 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 13/22] RISC-V: perf: Add a mechanism to defined
 legacy event encoding
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
In-Reply-To: <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-13-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211939.543975.5882607179348590229.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1XyajoagXXF1cyqoxgWIfkPGgjkmx65YQW1n9q1RyH0=;
 b=/MLFbEGJ3IvpPk1FcJeLIXZiS0wo7JcDujhTqTtOlA+FU5IZmLeIwq10e5fvUIQgKvN3oOFa1
 ueKKBNO9KuQC2Cd5dsoxEo+onzv+Zm5J6b8itUxDO/M/Am3bOLROYHJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002225_434673_9D7475E5 
X-CRM114-Status: GOOD (  10.49  )
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

On Wed, 01 Jul 2026 01:47:01 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> RISC-V ISA doesn't define any standard event encodings or specify
> any event to counter mapping. Thus, event encoding information
> and corresponding counter mapping fot those events needs to be
> provided in the driver for each vendor.
> 
> Add a framework to support that. The individual platform events
> will be added later.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


