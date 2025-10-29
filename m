Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2965CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+Rd5gslE+ZFZnAsPLhh3hhVOGomUEHbHKD97n8UNP4=; b=BxMypwwjax/awIMFFuqzsqqEkI
	AYsIvpFCMxCjtFqQcV4yZiXWJnoQtO5/I8EHjCajocdWzhqm4LVNDUS1Ql0SHEyIanYUtGlusK6Xc
	9id16Zl2BCW00zBm2CYmb+hpO+/WgPoLlL8oYWaKtke8EZ5Lw/JTGsyyHA5+R/btOH9SI4HmakkdQ
	Ym9lwVSAyzLvVKIoZQzVp1ez/dR8L9VQbo08ujBwXxTb5RVfl8z07nFaouXgYL+7Tsyj23JUf+Wit
	Q1zQbi/kzm9XvHFDv3VDFJ8r7kpzL0cIOz/48AfOGf6qWTeUrloZDZYZ7JshNuxD/WeKh9xwX+M8o
	uSBBfspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2ep-00000000Ww2-21VK;
	Wed, 29 Oct 2025 09:39:55 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2em-00000000Wum-2koP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:39:53 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-89e93741814so545598185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761730791; x=1762335591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Rd5gslE+ZFZnAsPLhh3hhVOGomUEHbHKD97n8UNP4=;
        b=VGdPSvXRM7MDlLqaCaPXi1gsihbCYb1F/nZ7LJuYB5lYi0QQSsTHZw7RGc+88x43uy
         QYG31ydjusxFJ4FPUEP8wXesmHrI1Io+jlOSJ8NoUX1F2dZztf3ZXcmoln5yStll2Eqv
         JEdqr8s0XQ51Y8wuez3pfFl49/DVjG0+CkzyllJn2HtrXd94mPYOdJC4E6l6/GAcwQ1l
         We5Pan8KSJz3QudwWnmbW71TgbXNHz/YL4FlifYZqdt3hjujXJvkS1IBQTl/9q18piOw
         E56U2PRROewaCXfej9lDMAV+TbGulcMzew5Q/ncl30TsOfXF2ohrkiN4SyKo27uWYnBc
         sNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730791; x=1762335591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+Rd5gslE+ZFZnAsPLhh3hhVOGomUEHbHKD97n8UNP4=;
        b=J4O5eu5X/2SvgePUkKISRnrms7H5xDGTWWNqAZsZZk6Gb+S+vmif3h78qubY2lpqp4
         sz8wy/W4tRNLHsvJxqoJxzNS3/9ZqICipM4SIMQNr7qZATJcqOOiAx1Rkk2eY6HxYoo/
         jdHPBDkkQy2KepHznPLrVsZZy/gB5hCbyDoDfE+YHSnnKA/2oLmVMyTvAY7Fc1oV+a6Q
         jhOifjD0yz4W9ReftyX92wNMiQQgRex5m3RpVUqJGReOEnlsYCTAX0/KwU1Yh2MIg4Dg
         jmYpxvpmwcP4S1mTHAds1Yb2mCydeKem1dsfWIPnRhy1KceRmVBFRG44o6vGTzPeixhT
         PY6w==
X-Forwarded-Encrypted: i=1; AJvYcCXvNYrd6iIEYqXwskJGymDyZqcDr9MHF9gC+GEolGZ5LKBhwBHqsrdYzhcuouJIEAMCkcQhqX1pCH1pyUX8bR2H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/94bgpigI/lYLsu4qHMyY6eeD+3yeAoYV5MeZuZI1piR3fsL0
	PwouUsUQ2AOzk8ry3tAGjRe0xlKKMT66QbmPcbcI83iD1qAmJ+09l64Vz4U8zQFQ7nxU0fPXq9E
	abwt/aQ9JLqdr26kJHGFHr/PF8gw4KaQCE6LDc5ZhLg==
X-Gm-Gg: ASbGncuVnXthy39CHBdvPaq/0F9tW/HE+QAMOkhupuhNnQ54UBnJYbZJtdyiS5FLqgz
	yejIG6C1xM9doBmm08kOzQd6yjm7RToOZaMb/F/ZCu4WnSE597nTBIAdnH473rmwYM29e2ZrpB5
	uKXYVKlN/Vf2gfIK87sgG6mT+LVRQD/sxbUNTLWM+4Ec96o7ivs4MQkcTEl9TrKfzXlKyj95h7q
	ddVYS1HzduPLXOeczXH8Iw13RbARW4yamR7gxFJN7wGQeiA8BcQUxmJFJqQ/aOmC0S/p8O2h7WC
	MR95YSRb9CIuekzuYYnJkYwwsMeF
X-Google-Smtp-Source: AGHT+IHqXSf1MiiiqnfsW/ioS/jj/mhb/BAEdrr3nKBvzCE+jcWgD9EFD8HQohkXivlPjhP7YZ3CSvcZ9+eiOBWkEyk=
X-Received: by 2002:a05:620a:3704:b0:813:31ad:bf3d with SMTP id
 af79cd13be357-8a8e436119dmr303015885a.12.1761730790824; Wed, 29 Oct 2025
 02:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com> <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
In-Reply-To: <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 29 Oct 2025 09:39:39 +0000
X-Gm-Features: AWmQ_bkH9LQFvaEP4xZtRhiFYXppvNFKfWjaQQ7mkEY-rNttgjUoHB7gFuBi_fs
Message-ID: <CAJ9a7Vg1jR=UBWwQanvyW_-ucXQ1HWQha47oJCUL6vkfQwgpKQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_023952_723110_1C95B191 
X-CRM114-Status: GOOD (  24.55  )
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

Hi,

On Tue, 28 Oct 2025 at 09:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Oct 27, 2025 at 11:28:03PM -0700, Yuanfang Zhang wrote:
> > Add the following compatible strings to the bindings:
> > - arm,coresight-cpu-funnel
> > - arm,coresight-cpu-replicator
> > - arm,coresight-cpu-tmc
>

These are redundant - the actual hardware has not changed - what has
is how the device is powered up / down on the system

> We see that from the diff. Explain here the hardware instead.
>
> >
> > Each requires 'power-domains' when used.

So why is this not used to adjust the power handling in the driver? Or
another attribute.
Look at the CTI bindings - these can be associated with a CPU or be a
system CTI - we look at the cpu attribute to differentiate, not have
two separate compatibles.

Regards

Mike


> >
> > Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > ---
> >  .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
> >  .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
> >  .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
> >  3 files changed, 54 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > @@ -28,19 +28,32 @@ select:
> >    properties:
> >      compatible:
> >        contains:
> > -        const: arm,coresight-dynamic-funnel
> > +        enum:
> > +          - arm,coresight-dynamic-funnel
> > +          - arm,coresight-cpu-funnel
>
> Keep alphabetical sorting. We asked this multiple times already.
>
> >    required:
> >      - compatible
> >
> >  allOf:
> >    - $ref: /schemas/arm/primecell.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: arm,coresight-cpu-funnel
> > +    then:
> > +      required:
> > +        - power-domains
>
> Just move the allOf to the bottom like in example-schema.
>
> > +
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: arm,coresight-dynamic-funnel
> > -      - const: arm,primecell
> > -
>
> Why do you remove this?
>
> > +    oneOf:
> > +      - items:
> > +          - const: arm,coresight-dynamic-funnel
> > +          - const: arm,primecell
> > +      - items:
> > +          - const: arm,coresight-cpu-funnel
>
> Hm? Why do you need custom select if this is not primecell? And nothing
> in commit msg explains why this is not primecell anymore.
>
> You have entire commit msg to say something useful, WHY you are doing
> this, WHY you are doing it DIFFERENTLY. Don't say what you did - that's
> obvious, we are capable of reading diffs.
>
> Best regards,
> Krzysztof
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

