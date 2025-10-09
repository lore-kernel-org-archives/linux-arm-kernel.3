Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A0BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=515o7326gcQ3D6uHqGhrkvo5xmocInFa3UoZMccGVHE=; b=yIvLwslb6BYlbbk8iRS3/33WDH
	WRl0IncnomrrKQbtYsbFYSw28gYma/3MVvK11rm9E+Qc56oY6Q25ZkOl6o8TuGVD118RbMGhh63A5
	aStcNAfdS3dIqbvgr8zYAcC7McwE7223DtjhLhm0N5bw1A+WL2FU1hnjqObgvQzuqc/ItJ5B6hvhO
	GjFKGwNGdeutH6IRQyEr2Q+T8Esse/kJJjE3XhuonT71ncHicOB0Nc2m4caqcGtAyF99FE+hLQ7dd
	nNujFR1A6R9r7KW7hTt+0pQjzcdTlKczV2Qigdl44WqcOmmcTZgsw1mdbEdEwn5lJw9Por1Iickf4
	cMjHeOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rCB-00000006HKs-1Ltr;
	Thu, 09 Oct 2025 14:00:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6rC8-00000006HJg-3i5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 14:00:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b54f55a290cso86206566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760018435; x=1760623235; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=515o7326gcQ3D6uHqGhrkvo5xmocInFa3UoZMccGVHE=;
        b=N+Hu6poq4UnszfclAY5SpJk82CmbusWzUNJ2KdaKGYOagkwrhcFMMzXjHlkone4Gxp
         UC48xnRalJKK+BZhR6pz3dfszdh5e/X+WDhiGS2YkHUvR+5PJt2giddN+qk3LDXKmh+J
         9inRJcJa58cBTcyfBoFjoCunt0Xv6MrbKer7WnzUOH5dHdtcre9269xYUIEb6XgRYlBe
         C7Hl5hPDgdCOf9joHcat3GH+5ZZTtiFOKWjskbf9Es43bRVYc1mVq/NPvl7nZ79fplaK
         1xNuQQyh9vgulN4s4CRSBOQw/zGKDeC+93CdCWDGopQWRM59G7ZpiZxMVkuA/gZm+ibu
         NThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760018435; x=1760623235;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=515o7326gcQ3D6uHqGhrkvo5xmocInFa3UoZMccGVHE=;
        b=Rs1qi7WXVZ5GehtIsVyoY4YconeyxgG0MlXOVwcXyx8vB3A242lqnwbsDeWUESbF2V
         y14ihazEMpdWzd06SQzGdl5nM59tUzDXHl6VPXOoi/FuzwTl5mtnk2MatYhHmOBHbihM
         YUwX04NE4WzW6/znMljrChKG8StWf6WthiA7Q8Op2WylExSOFgicv2qch+NvxQLGT3dj
         Sm1PXUANUchTEW/KqAOasMqHM0R2qN8D9Z8hRHYq1vKxIs0sMehqmBfBN9KwBzMZpHro
         iBZ6YaeNrwRCANFRbaCGF0yTblfWoiUpR8mJ3W6JS8BAgWw+eFNzc3foBWAGE21mcRgE
         WEQA==
X-Forwarded-Encrypted: i=1; AJvYcCX6/TOUBeOLd8wxgYT0cJ+lyOl0agw7U3b7J22M/KMsJkjzvYLDtfrON0zI3z0TJrBue20gAvYKVAn2HYBt/RnJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4IQu0Hi4e2Dnx/qqLo0K6mbRTx76GtjMyeSM0SP6lsySCvpe
	aYbbKoGkeX0CaN4/kIogSLCu+y88+7Nea20S6Lj/9bcDcbIlY8mlmFifZsdBKklgx7w=
X-Gm-Gg: ASbGncu/3z8BAm9eFXVJCWFz8B6Vcmn3hCIPBENOlrBBaJp41HTR7c42ZyNwZ8IieXv
	m6zYTNWNxhueweAHVB7hIyh1v1SKfl91YybbRPpgiVm0JWs8I++m8s5SvottA72KFMY0vPOLL58
	4l8ljtSoWpeRx7OBXBJvGq5nKqoJqwKzaUUaxGC3OJhj+L+pB3bIYJTRcuiuVPDJWHlTDSTup/5
	FrxIZpwDKUwh2Cptxls9qlp2wn4pyF4n3QAO56li3V/2oVrbJm3Sf6IvIzCZUElGN1DV37Jy9IS
	H6b+/FAY8A/om8s1MvxtJmyVUwTxAmRK35lykF+mQ24P+2D4fMqZhyL7QKfM9lPijn8uX9E/gV2
	mJQZokYtElGdbNliPvFdC5EsQiKe50+qYlUhpGPfK5LacM+VO6eya+A==
X-Google-Smtp-Source: AGHT+IEgmsVd+NJKivv9Nf15rZIeHvCLH7dQTFIvwmRIDeiyvpI4bVIdaRiBfWbq7EmQkO2KbsnQcQ==
X-Received: by 2002:a17:907:c27:b0:b3e:256:8332 with SMTP id a640c23a62f3a-b50ac6d378amr903062366b.54.1760018435004;
        Thu, 09 Oct 2025 07:00:35 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa62csm1860412666b.19.2025.10.09.07.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:00:34 -0700 (PDT)
Message-ID: <63fb3ccc10267add00b579d4a05497cbeeadc65e.camel@linaro.org>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Date: Thu, 09 Oct 2025 15:00:33 +0100
In-Reply-To: <9d4ccadf76ccfff1a8b5f572b8aa190e2dc40c29.camel@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
		 <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
		 <5df18f42-b567-4d27-9e12-29723af40d6e@kernel.org>
	 <9d4ccadf76ccfff1a8b5f572b8aa190e2dc40c29.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_070036_940373_DE6BF711 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu, 2025-10-09 at 14:31 +0100, Andr=C3=A9 Draszik wrote:
> On Thu, 2025-10-09 at 09:13 +0900, Krzysztof Kozlowski wrote:
> > On 07/10/2025 01:43, Andr=C3=A9 Draszik wrote:
> > > Convert to using devm_kstrdup_const() so as to simplify cleanup durin=
g
> > > error handling.
> >=20
> >=20
> > This is either a fix (then describe the fixed issue and add Fixed tag)
> > or you change the logic, not only simplify.
> >=20
> > Previously on of_genpd_add_provider_simple() the memory was not
> > kfree_const. Now it will be.
>=20
> Indeed it's a fix after all - While the driver doesn't allow unbind,

Thinking more about it - at this stage, this patch is not a fix. The driver
can not unbind, hence there is no leak to be plugged, hence no fix.

> I added this patch due to the followup patches that add potential error
> returns during probe,

since it makes the error paths in those follow-up patches simpler

>  but somehow missed an already-existing error
> return after this call.

Ignore this last part. I forgot that I simplified this error path in this
patch myself :-)

So, I'm not sure how to rephrase, tbh.


Cheers,
A

