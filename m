Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE86CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j80svTpQNDT2HO9SwazgBXuB8uzAZlJDHoPKa+K5IjE=; b=Anr1cbKk75zWr3NHqRdJGKfOe5
	eVIey1FpzxIBdvX7VTAxtYngBh+zCScFAH7mwc7LlPNmfiQHzylp2SJ1FKZKb48/1K9bf8xYBbUgf
	TLNxKB/f2qi7xo9poKncQJnUmIHNG2jTpCcC3aoLhpind4wDn1gnaWocOk+vX8jBKObtYxE0Xkt2R
	36uGjfPZ8zIxaVMwY1+AuJSxz/1XPqOJU1JsdpAhkFtH1RHBQRtZYrO3kAHMmqh9JkfXHlxwU9FOU
	+h2LK9IivqyS+eiYMkyHJSzGu1za0i3/t4Tc0KDfX1cNKrMtOnvZCw0yvIlDUNrg94DtttyJRwotJ
	v2YVyZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVh5-00000002O4i-1FJx;
	Wed, 22 Oct 2025 10:03:49 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVh0-00000002O2J-0O9e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:03:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so12056847a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761127420; x=1761732220; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j80svTpQNDT2HO9SwazgBXuB8uzAZlJDHoPKa+K5IjE=;
        b=Do8eoa+xMF6MlvWe3bMYK8Op2Joh2Ot16IbTumORXEkhFG+nxD9IWo9+IwPkZoqWHc
         ExemFi0MgjwFkMdoAewWOKhTqsvgueLaxH6Zf9luqJhm8S4c6bdIs/NulnNkcPLrbEvG
         ova9Z5gxpPWOIyjxU70No2L0DW6ilu9bwDLGccMRW5cQre4jqwaFvMsQk/1fo4Lgmkau
         rjvSPg0P3zvSJOBY5nhqaMYaHSHtde/NpiT+ZgqMzI9uTKP71kz5UtJUNQzNhlJWf56G
         SSqrNgIdv3SopJhG4KchH+qHjDXRWFxsGQxd4ujV3yjkRLQDbCHmxx0nUruGUKHXNBlf
         KB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127420; x=1761732220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j80svTpQNDT2HO9SwazgBXuB8uzAZlJDHoPKa+K5IjE=;
        b=S8vF6abqMClCUVShUBqDaAuGeTPEVhMvE0c8oHH4WUG3Giovw8EJDt+/YXIaz35CpS
         w0GElSZ2kuDnlBpNO0Womk4azJQb75iknfDZjl5PRgFgHk0QfyfoKGp9UO2aFjw9YNgd
         cwt98eQpzV3htfAgk+nHQcZyFGjWHc5jgCU4scI1ZrzOLaYKQOF1cMIURkCTzkTsKB4E
         9WG8FnsZ+aDREewmqOrFx0io+IGse+ez3+hey2jmXszjaAwZkZOw3AuD4fAJ4IxOWb+U
         zZ6uDcXGJ1vpnc5YSwa2SDxOm6HrIv1KP1m0FUGtZV7WYGwkYmOqLDsv0ZbGZEQN9oOM
         CpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3c3y+/EvRMtIfMRUl6bF2mUoWN6aU/tC8mVt19U4wivafwDbf7uY6myhvt8VNpKQGY2cEbmCqLMao2llH/M3@lists.infradead.org
X-Gm-Message-State: AOJu0YwqH0818RHCKQUoMdSYAkawsXJsR2MGtPBTurShE2EturkvlA1E
	6/5E5c16UcAGpIRayytMOPTkQPf+siGxHHRPXxXJzMbNtCUn0aLoeGsGy8JB/Q25MmcjIRK7Uq7
	bcP7nQZ6nlpb7Q4mcDRcnfo/ib6kj8V9IQ3u9fLVIew==
X-Gm-Gg: ASbGncvz5aBXVAanfGDObGFOPYK+oOQrsEZ71OsXYY4BxxfGIivKrF7MLyyj4N6An1A
	1ZB1cSI7tGPBQvdyRyXjd5rLY4wTlTELesbk/mzrprZsmEm7BTxSxn+8O4lPWxWCdrrnQ2969Br
	ryWk7dqhPtooeFXFUPTS7aPja23OPR55ObfuqOL1sRl48yNEa9X6nu30dAev4Wm7ATyCaxaIDDo
	tLvIHHYGcThvsEPgoXOLMhtFEOIKjssLRsy8bwN3Zde/gggl57ArntBw1b70oBBkIjQj/JFVg5r
	FTCxci0=
X-Google-Smtp-Source: AGHT+IFRHS9fCtNlfozcKqfiZ/HU21GMsDA3YriXsWw67Ybr2fSHm2R56fU3GCdtVA2wLt6A2hgJEfeDgzt+vSey8O0=
X-Received: by 2002:a05:6402:40ca:b0:63e:17ef:a62d with SMTP id
 4fb4d7f45d1cf-63e17efa78dmr3015030a12.15.1761127420175; Wed, 22 Oct 2025
 03:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
 <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org> <CAPDyKFqNEN_yfmGWZr=sC-W8-Drv7zn82WYa-y=v+Suk-JHvtQ@mail.gmail.com>
 <838a2a9f-9d4f-4c04-bab3-c6a7d52b60b3@kernel.org>
In-Reply-To: <838a2a9f-9d4f-4c04-bab3-c6a7d52b60b3@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 12:03:02 +0200
X-Gm-Features: AS18NWDgqWuAfrcT_6PqRDb-GaFHTXtI7dspjwKLQKVO9xQrFqh11FPqeF5ceCc
Message-ID: <CAPDyKFr4G5m_tnC20w-K7Nh2m-ut77rbeHvWgDTgHLA0hkALNQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: soc: samsung: gs101-pmu: allow
 power domains as children
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030344_568303_22DAE55F 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, 21 Oct 2025 at 18:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 21/10/2025 14:59, Ulf Hansson wrote:
> >> +  "^power-domain@[0-9a-f]+$":
> >> +    type: object
> >> +    description: Child node describing one power domain within the PMU
> >> +
> >
> > I think we should specify the power-domain-cells too, along the lines
> > of the below.
> >
> > '#power-domain-cells'
> >  const: 0
>
> That's not needed. The child (this child device node) schema will
> enforce it. Parent (so the PMU) is supposed only to list compatible.

Ah, I see. Thanks for clarifying!

Kind regards
Uffe

