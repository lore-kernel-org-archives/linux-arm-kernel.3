Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449B4CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApU/K57t3O5MI8pSYn2nS7zINbg4YW/6w5BoGxO/xm0=; b=LQ6bnlfdNI9c4+ySA5Tm58IjVM
	O38jSPvetxw2tqMZOleI1JglcBJmC842NznTqTku/HQ/dlQWchzMVSr2oiA+lQmIiSywXX3e6TsEl
	Nej7wYW0zuhrzFTQe5Lla7jzjiOPBiUB2yrcQzqAM5tnP/7+LDdOiwein0z6ISaQ7FUpAS2vGAnW4
	tSNMTmPGinz35QKHAUz4wLo1Xa4VEXMQMRy47+0zXmKvwEH3FHWUXEV0uCO4AW8j46W8kIXJPeLoF
	kDgoGMgTsd4l8ZOodjYQWEE0Y12CsaQ4z37H4mKOOH6r7gLPTzEsn7N4GpCWfpfxgfAszecyTtK92
	Lpse0xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsCZ-0000000FnsN-1GeV;
	Wed, 03 Jun 2026 20:28:35 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsCX-0000000Fns2-2S6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 20:28:34 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51765531803so174631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 13:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780518511; cv=none;
        d=google.com; s=arc-20240605;
        b=Eh6oTEZvr5QScmAZpHDloKJMNe0p8n8wPaK9Sz5asGJHlXNZaR3xYsmFlXLnGG/pAW
         rf5tfeCsRrfh2s1zj1+CaV3xobKEzS9Nqs8h6edvQhvOlginnyqCBnrYaFRQzoNnnmiv
         LwVWL5U1AuefWZfwm7whWwZNvnRyRgKqPE1GNtQGEV2c7aPTS/X2ZLiFGq1BjIcrG/jB
         Kk4OCTx0in0ZJWkbzUnVAmnDQq9wbGe0P3nHWl6zl9hLonaRoDEE5DI8TLQsDMg2cu4/
         Vd5NoDgkJScy029VIKozUpCdz6BjOzTfsu7/16SDjmwh+CXF1s9s6uT/8+JLbXI4fJwl
         xcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ApU/K57t3O5MI8pSYn2nS7zINbg4YW/6w5BoGxO/xm0=;
        fh=Z/xEGmLB+U9ESyoYCzjenx+ycHVLj1dXTfFxVsJPnBE=;
        b=dXYV0iRXJkKbPmd+2KJUacSRVjRV4W4277wjWTOyWljrsFw75OgEewA3wMcFcibWKq
         OwAGXyuNzom34rwWNjHB7a5JDhyj5xphyopVcHaZlTcpm2JNXmd4DZ1UfT0tgsR4OCEv
         v5VeeSi3HGwwV+cWQ0/L82V51Qz1HjI2VX0troOdl7cfZN/ufiAxJu885j5SQM7tJPdC
         QYvOz9UkuBzHScUYeneGpq6YSseA0rP4fZ4S6HI8Z30aKCvVTA65lJwy4lb7z+/3xapB
         bTR6S+Ady5x4WrCr4P2YnFC/lrONGvCqskzAHdePpiCU1od1Ac1CT5aK863x0gVDxIbT
         j5dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780518511; x=1781123311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApU/K57t3O5MI8pSYn2nS7zINbg4YW/6w5BoGxO/xm0=;
        b=BPBbUQ/AOFKCRkxkKStr1/0weZM6BL3PYJ6827bxIorPYekICDvI4u8uMrCl/1n0E2
         P+TfHE01gv5xvOTO0VVec2d6v73DYJsaihRn8rmj+cbKmRRCQ1DCvnR2x1V3lbq0rVs1
         FiOUH1LXgaztROVcHWfBzgUGVXmLaELK3oUVI/mXnTZWvnEM8d8T3Z5YUSc34eYi5Jas
         209DMXXu7H/Xn+syNFIDXhXT1DoYxxDLogpzhhJ/J9JnHAjS2WJxPsSoV28CaWdmJU+s
         TekSFkvQqXOy5+e1GgWoxMCoZ0Nm9kuAMYo9c64B+3V0j6dhyNkLrqx7rfW2Q/JTd9Od
         bh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780518511; x=1781123311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApU/K57t3O5MI8pSYn2nS7zINbg4YW/6w5BoGxO/xm0=;
        b=L5zxXuL6oMdysI/vNOCIygIMEXZw9x6BUXaCjNSFw1n7MEEppHc5FMjcCWesRRYGTf
         pEFqGdSVsXv7FNlJyK5nsNGZjwh61NiQOBgKWjz8Q/mmadrM+f80CW21jeBadgF6tw+E
         9XUFJkp4MkmSivxry3mmYvqlSsmghrRdlO9p7EEZlC7KZPT5+F44syO8h4D3PUUSwQ0P
         wJA3txWTT3r92LLXoqnJC65JSukODwqp1gvf1UqgIULCJoNIe8cIaRQVJ3iIfgxIQBQ8
         8XEbZeHHgS1gBqobwQzKRVbos0wU10IDDSXfcNDPX0eQ8HuSQBQEYXNDgm8MwDTCDF/O
         z5Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9gcVOW+8kN0YZohSLvPyD/ua9Z2NeSX7GDEmGM3rfWHpvVkZTHAsrt7mutuy7yJvZmIL5J2skvBGgl/ZYTy62D@lists.infradead.org
X-Gm-Message-State: AOJu0YyDwS/ZOf4ASCQPB1Pjhxb1QakiITG7EaT1PEuMJdewHYfHKvI/
	wQgdOP25dX7niZ7E4OwkD6tZwvqHese9T6hzQHYz2bXDULd0x6kW+/VeC0CClUms/eAVR/2ubou
	WqCgXvlT6fxdAUtqVPidQusGMgQ+mluqaGm+RNbVW
X-Gm-Gg: Acq92OGl2fKKlzNRc8GC8TTnOxjgdGTLUL7NH7UfqcEaOJvCNW/7r/gSDBlp1Y/fMtc
	8m+5K3ZLmFx4rOMRp19zWPtJjo57sLAXsngx86B8bEDmGyNGEsoYHBjGqF9Goscrf/23nMG7hA3
	ch6dMGG8cekfzp/4xUSYnHlYy5V65iXqM/sp5mN08tU384SOZqpPBV4jAJgpw3Z5MBcA8uZnbgF
	FijFhWhHTJtyqUUARDVcrCtdoTwMoACPyDW/ZPS3SAq4XQ/dn6mFC2fbnUuPSNGdRkME0AEOrGq
	8KSt6WA44+ac/jyD9PtGKC8THjXGxYodlBQLZnWYPUEuAHrv
X-Received: by 2002:ac8:4708:0:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-51788f12a9emr405971cf.3.1780518510547; Wed, 03 Jun 2026
 13:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-12-praan@google.com>
In-Reply-To: <20260601215909.3958732-12-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 3 Jun 2026 13:28:19 -0700
X-Gm-Features: AVHnY4JymbHnMeIV5mK3buHx1gPe6ADy62gAl9-kPO-OTjETxZm8VIOEr1XtIsM
Message-ID: <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_132833_639344_B91809F8 
X-CRM114-Status: GOOD (  20.39  )
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

On Mon, Jun 1, 2026 at 2:59=E2=80=AFPM Pranjal Shrivastava <praan@google.co=
m> wrote:
> @@ -2361,8 +2394,33 @@ static irqreturn_t arm_smmu_handle_gerror(struct a=
rm_smmu_device *smmu)
>  static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  {
>         struct arm_smmu_device *smmu =3D dev;
> +       irqreturn_t ret;
> +
> +       /*
> +        * Global Errors are only processed if the SMMU is active.
> +        *
> +        * If the STOP_FLAG is set (can_elide =3D=3D true), the hardware =
is
> +        * either already disabled or in the process of being disabled.
> +        * Any errors captured during the quiesce/drain phase will be
> +        * handled by the explicit arm_smmu_handle_gerror() call at the
> +        * end of arm_smmu_runtime_suspend() callback. On resume, the
> +        * STOP_FLAG is cleared before interrupts are re-enabled, ensurin=
g
> +        * no valid errors are missed.
> +        *
> +        * A lockless check is favoured here over a dynamic PM core check
> +        * since the runtime_pm_get_if_active would return false during
> +        * transient states like RPM_RESUMING & ignore level-triggered
> +        * interrupts.
> +        */
> +       if (arm_smmu_cmdq_can_elide(smmu)) {
> +               dev_err(smmu->dev,
> +                       "Ignoring gerror interrupt because the SMMU is su=
spended\n");
> +               return IRQ_NONE;
> +       }

Have you considered using arm_smmu_rpm_get() here instead?
I can see two issues with the currenlty proposal:
 * Returning IRQ_NONE when an interrupt is indeed active and needs to
be handled. This might be interpreted as a spurious interrupt
 * Nothing is preventing the suspend handler from running while
arm_smmu_gerror_handler is in the middle of handling an interrupt

I understand that using arm_smmu_rpm_get() also has downsides,
including an unnecessary resume operation when the SMMU is already in
RPM_SUSPENDING state. However, using arm_smmu_rpm_get() would make it
easier to ensure correctness.

> +
> +       ret =3D arm_smmu_handle_gerror(smmu);
>
> -       return arm_smmu_handle_gerror(smmu);
> +       return ret;
>  }

