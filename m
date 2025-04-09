Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A1AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgzTuHYI4UmC3fqcBItcn74v49a1rM9SvhzQvrF6Hss=; b=E87CsAwsl/s/FlLhpjd7FN+OUa
	kYDOuBQaNigaU2xHYEtY2ILDhL5kAmyL1eTGyChh/UruRYAMYFDkeBaEozDdbbvcKesDmojFckwvv
	kSbKoIyvzeE39EfbmFcIp5AB1sDdw41aO1vq97ZUCAxjF2DKanUCCS5i5+8WBIVetSaVUwsHyVfSP
	isQjGrHY6ak/forwqCWp17g4zPkSH5HrOJBEC5AwXzSqIUrr2nlosrSVcPMVQCZWKQV8vIfrOHm8D
	HGnN+ywvMXx5fLj0NWPEkxXTjGNDQTOtIkqEA2W29PLDU3oZO4PDeuyIaeUeF57cmvUas06sSQwGC
	y2d/61DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UmB-00000007Bdo-3CY6;
	Wed, 09 Apr 2025 12:43:31 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UjG-00000007B7J-0pXJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:40:31 +0000
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-54954fa61c9so4956088e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202427; x=1744807227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgzTuHYI4UmC3fqcBItcn74v49a1rM9SvhzQvrF6Hss=;
        b=ceqJEbNVt7l50XXzVoJX75c54eXjrr0iqSthubUMoZXpIG7x1TeTOR6grhLexmLyCy
         zjLKR3BV5Ec+z3ud5vd7Cz1EtNW4IhrG/i4Blu/47fjyl4mh0eqxqVR5PZ+M0N8ff9Zq
         RHdkOtZzgjx5l7HasTGDibKiP5ircV0BIfM9YioFtEkeTsRC6SaT5CNleey7CcmMmRN/
         rtAiRR4pWKZDQ/Pe/CtvzDMpfdtRUayZZkjaACzOHOzUbvKzLGnWDjSyixDd387JhDy3
         6d8WLECrzBi+a7OdNoS4xXS/Ble8Gc9d0hYXI3uydl478OXhzKBjXUHkLhEMGr4v/0Zj
         B+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202427; x=1744807227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgzTuHYI4UmC3fqcBItcn74v49a1rM9SvhzQvrF6Hss=;
        b=VQi6neMDwymzn0QQ8SYR5tP6czDVXCHxx7gGr6b9S9nOO7JZdhpwXi4P/YCc+UWQRR
         oyU/hc6qMdkTO4+CsyGksVSlWepC9HhlMtEHSDOfjpJlUIFA9nxRmQgUGKBeIol38tQN
         9PiwFtfFX5aFaOKc443Q8eZBMFc1VqXxkG5FdpuaNBhqhx02qEvYRFTYbQb1igAVLMeS
         44ygiu/TPXCOzW/MiYXX4BD7OQHbXQS3DLdxGJngDKRO7okrecDM4ji6fdptS/8X3Vjy
         Gxb1xxvYcd66aWdhX/NrZrVojD6yhYsge52xwFY+hfL0bsY79h7wmxRmOhWZCYYEe0mo
         zn8w==
X-Forwarded-Encrypted: i=1; AJvYcCUzyjBJy6tfbCzHesSRYZPjPcHQFRPCUNQTeK4926E1ug4qDRpAw9A8scNd1MPkBY/YYznSLito66olMq3Ur4JO@lists.infradead.org
X-Gm-Message-State: AOJu0YyO7ZhEjpqrrzvhGChaTaZ9oQz+66FHhfXFox8mmzXAf2pqjRaH
	1terwmZCBQvypQQvo8ffSAmomFIMsyj73vgqpT+lnHDFNWwGXkcWuMFWftDrUcPOmN+XiJTzMLy
	3uZ2Ke/CdOVJDtCe/k02OvCs21+U=
X-Gm-Gg: ASbGnctIXXHUiwyIA9eVmERzjpEr3A1U88c/4VYzETh0tsm+/7PXk/s+2hO9oroDmzD
	GEc0RArEVbJZVFiHBtxBU/XCwIc+Yl8dSk6WTkyTcKfyTWz4Uxao2Xz4BBqSlWkMlIHlmh5cqkr
	jAjG7aa3x4lo0EqanEbX7+WA==
X-Google-Smtp-Source: AGHT+IEaNKg3tEK+ftLM1o2sum0aaJx+lvdbNATu/ADIsB6bKVblLteROIO/hxkPHNChjpDjGBoqBy7PxCbTeETlzVM=
X-Received: by 2002:a05:651c:2220:b0:30d:e104:a943 with SMTP id
 38308e7fff4ca-30f4507af4cmr7485621fa.39.1744202426703; Wed, 09 Apr 2025
 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com> <20250409-manipulative-tall-alligator-5e6c4a@sudeepholla>
In-Reply-To: <20250409-manipulative-tall-alligator-5e6c4a@sudeepholla>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 9 Apr 2025 20:40:15 +0800
X-Gm-Features: ATxdqUFPmZ6qtNKORMOownapcwDPbW_QqjjVvOf8Je_dGx5LIfMAlL8dMmVUm2A
Message-ID: <CAEnQdOpS8xETvQE-TuyffDXCcNDa7jNCefpjR2MNX18xAx-WOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, rafael@kernel.org, viresh.kumar@linaro.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_054030_235438_0AEA8D16 
X-CRM114-Status: GOOD (  12.90  )
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

> I think unlikely is needed even in this patch[1] and thats what Viresh
> meant when he mention all similar changes under one series and consistent
> change.
Thanks for reviewing. I'll send v2 of patch[1] soon.

Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=889=E6=97=
=A5=E5=91=A8=E4=B8=89 19:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Apr 08, 2025 at 11:03:52PM +0800, Henry Martin wrote:
> > This series fixes potential NULL pointer dereferences in scmi_cpufreq_g=
et_rate()
> > and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> >
>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>
> I think unlikely is needed even in this patch[1] and thats what Viresh
> meant when he mention all similar changes under one series and consistent
> change.
>
> Also I just happened to notice similar patches posted while ago[2][3].
> Not sure how to handle the situation though.
>
> --
> Regards,
> Sudeep
>
> [1] https://lore.kernel.org/all/20250405061927.75485-1-bsdhenrymartin@gma=
il.com/
> [2] https://lore.kernel.org/all/20241230093159.258813-1-hanchunchao@inspu=
r.com
> [3] https://lore.kernel.org/all/20241230090137.243825-1-hanchunchao@inspu=
r.com

