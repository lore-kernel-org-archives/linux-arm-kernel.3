Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jNzh4wPsc/2+sERlQmcDT54HRK5zRLKBArFjwQQ8DQ=; b=Ai/0pCl8nS6uraB0o4+NIqjl3O
	cVgSx/rOP2MP7XrArilwa8lstMBGUmhaOAyVPQpNexODvn6VAM7i/TbmiIRm0lWTPimitC9hyaia/
	jmQKkDC3+91WmEHlxUBiAdM4tTBygrFlfDoBx1iGuoQ8iqCs+0b8Jhd8TDEvaBhZDqYxW2wpFhYh/
	rO6vW1AQRiNtrvcUQlmZ2QYQq7RrL5hwxdYsFfaefew7KvZ2xTPlGds2Tc4tVaUFzw1wCigVyxtfg
	6kg1f5dtO4BFGZfXV0FFVhFWTzaolr1ztu3wMZdVNyYtj0SeMesK+4MPbGAinBRu7z5VgSrOcY/62
	lr+SOAow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuC5W-000000035oD-1XPK;
	Mon, 17 Mar 2025 15:09:10 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBsG-000000032rP-19yU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 14:55:29 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f682a2c3c8so2585726b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742223327; x=1742828127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jNzh4wPsc/2+sERlQmcDT54HRK5zRLKBArFjwQQ8DQ=;
        b=nAbXOpFV3e082lnwoDxcnPNCcc6J0VeFA5KAYyYnormzS7BDqn5GCn9jR9P95O0tYE
         H4rijua/VUix13jQprhNZak7VYlQCfT2YPVEyc0cQ4ZIa0/1aL5SbfPYCtOGO0AFjZS0
         4j1LI6d/cfbJTS/8fl6blQ/32LrRHnCxxtYDQO1+G4Qye6Ms5x7SeDNVODLRcgXu/z0C
         yR9QEQdnVwBW4Oue9x94YW1jdDvQOhLrIGTuqgSsV8YgynxZT14XCq+3TtpbZ6SYv4UJ
         4FVE4ppHYQBgjK8SMNd1AdLveIWDRENnYpYyynvOI6IjbYQg6VGV7T/c2y6Umeg5qbI+
         qutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223327; x=1742828127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jNzh4wPsc/2+sERlQmcDT54HRK5zRLKBArFjwQQ8DQ=;
        b=TkD0aPC9K+YSPT97JGPEomQ0e40rwfucNZ8Nd8uRp8/bPdcw6Iu9CFt9yeP+Qj9uMR
         ZP1mt3clSmFlkNgL1gSw3OEjtZMdfMd8NZAAN7Sj54EG1YqQQo0sdAdqgT3Y0iPw/tD9
         rJe/qhKEli4Z/S387zlGPlMkByPBj+R9nxtGEM9o51oUhB5O82bp2eOJbEtDqECTN6u/
         DpOlNCmVUSZ6DA2jXU66gP6cbgZMaNMfox+XSU9DUZSQEKj4HFzsafAiKRAXlaoKmwo5
         WebDDrla4rSJa7SbWL7q6cf4n2IY7sN7j1lb+OzMevGvkGGXSU414WF8bWdUk4eKxrov
         vVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr9qbSpmMe1ZFgYpEz/7La3IS9WdO1QtbqSe/OrB2nJqGLDl2QGxVTLDysigsbnwZV/fsyOjD1D2lRyZ8J3UJA@lists.infradead.org
X-Gm-Message-State: AOJu0YzkEJbtYWtK6wYBZKBTXuiabAIRPpVbdPdf62zgxKUEM8+Ud+iC
	1AKtxUPRM8sYJCOCqFz4W0jV+SZ0gg9hNC4aTLFBKWf6aQUeESRnpWvk9H24ROgK3Elp9079YMl
	c347aQwFmMPhRosGAox/vQI15GRkNL+Adw0AwhQ==
X-Gm-Gg: ASbGncu+D2pTeRwYRFEZCjV7LH3tNLWbzj93aqFhLwb4I5nzOXwuc3VLJigR5u0asoE
	aInOJBe80xR7yqs42th0IrTEk5R/GU0Ppo73QeSW3EJ8HaLbP75s25bLDUrV+qsjAxPS6DsR6ue
	nQAnhhij33qd8KhC2OwDUP4v08CeNNp5cZ74G/o+0=
X-Google-Smtp-Source: AGHT+IG7IjY16t5eI+Uq4mhx6crav2fOJBQfWeSG630jb10M49QIM1vSar09EM0x1tUf2BaE+e0vaoly2VXwdW756V0=
X-Received: by 2002:a05:6808:999:b0:3fa:c549:cfee with SMTP id
 5614622812f47-3fdee27903emr4770583b6e.6.1742223327241; Mon, 17 Mar 2025
 07:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org> <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
In-Reply-To: <931e5e0b07d598912712b091d99a636b796fe19f.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 17 Mar 2025 14:55:15 +0000
X-Gm-Features: AQ5f1Jq4uxqhD4QuKFFVh-mTPnz4ZIKWFOQ5G2m93FuUYrfiK5B9xukpdzF4pCI
Message-ID: <CADrjBPoESd7D4H80prCtFXTGaWOg-HV_ovNdwZ4G7Y8n-hFdsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075528_319044_0926BC15 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Andr=C3=A9

On Fri, 14 Mar 2025 at 15:59, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Pete,
>
> On Fri, 2025-03-14 at 15:38 +0000, Peter Griffin wrote:
> > dma-coherent property is required for gs101 as ufs-exynos enables
> > sharability.
> >
> > Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compati=
ble")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.y=
aml b/Documentation/devicetree/bindings/ufs/samsung,exynos-
> > ufs.yaml
> > index 720879820f6616a30cae2db3d4d2d22e847666c4..5dbb7f6a8c354b82685c521=
e70655e106f702a8d 100644
> > --- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> > @@ -96,6 +96,8 @@ allOf:
> >          clock-names:
> >            minItems: 6
> >
> > +        dma-coherent: true
> > +
>
> This is allowed globally already in this file. Did you meant to make it '=
required'?

I hadn't noticed it was already handled further up in the yaml. In
which case this patch can be dropped entirely.

Thanks,

Peter

