Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE72D5CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=; b=Dm+QAksbnrsKzdbRtffiFOarvL
	12S3XmRiPR2METtjQD2j+9LnDTs/0PwDHNinulKps89Qnm956V6Jn5ASHtqoraqgKbv/ujdAQWwjO
	HUfM7mHYPlCy5eL4COCI0BX8/0lDZk+oruE1Rqk7JtOIEuEuNDuRQNcTHDYcLqCu2NiA56rm7y7aE
	ApEswHGAefnHf6tE6ETsu32zEqGvyyl3lorNA8fZbjnVO45mFfIV6goEzWsDOdE+1rqvxTkS0lrqJ
	p1o57aChMUQ5BbabnTpJ/bJlDunkApAMgtSw3slXtyLJr1fsVuHk5P+6BdF7uasP15v6YS5AEsroC
	ueOn5+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67UA-00000000GUo-3YS7;
	Wed, 30 Oct 2024 12:07:38 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67SD-00000000GCt-2oJw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:05:39 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7181b86a749so3098177a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730289936; x=1730894736; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=;
        b=gQafIdckIn5pA808D3GUtbLZYU+vMNaE+dOm/JfmKE5Ay0XKBIibaTEgHxlLetDeMu
         I7CHwDuM1h28U5044KeHoDmfPXHozyjLanW22psNTUukxiQVbeO2d35vNoL9jwqTZAf0
         zA2COgNWRRZqolqqEaaALUTRlIHa5dAZOOefjDyLSQ+SgnFVd6PrKmRM7fXR1u/lG/wq
         Q3d3+06ouXYlSKNoijND9aztyFsGq7vhFrEWn0TFS72xS8bfyCsH+GxWOZjv1zTywbtL
         ifHcAwkW6ErVxPPOCsmh886V9QdOFmP07ulvJkV6NEGMiy5cV26TjvAEPBLtB/Ag2Aap
         AH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289936; x=1730894736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=;
        b=LxISdtkmmusLTqGjAVVtyXvwZCBf+c/DeH2dV/X0CJ7+mkjgUKoSn+FYCvQ/Xy4s52
         LoYXOUIXckPGpvI8nzT8Cyxr/1mU6gATWxhkC736X+YZ3XQp/0K2ZIAGB3uutb4lj8Vf
         BIa3GqCKynuBls+eRVii6HRngW4SM/8qvCHCEC2HCz28Wo3QnTzNrjtoRH+huWRx3/hr
         rkxPUHH2cVJlnIVbVcjqTt6eJOLvDIEDm9LKwh3GnoiCFPGn1msehvvZha15QGMCvdHk
         FW7YECamfPbjz+CNHXlSXIcTf2kfI1AkjY8+MxJj9OvxSPnotG+PcdzzuI9Dg0PzRvcr
         wqAw==
X-Forwarded-Encrypted: i=1; AJvYcCUHk1Cie7H3hM5kWnBYhVq5QpGKrdvk2NNRAFwkjjB2l8hdbAdYhHeJd4a7I750aF5wAWHVF7DWMuFLytUEWt70@lists.infradead.org
X-Gm-Message-State: AOJu0Yy16HXmrSDSJwvKg+FGPzxoa1s0sWRhBadZKqauuCUHKKk2RrmI
	SGKfLI7XG3mNBH1T/XPDBEssjjia3cS5VFC+ZVVcNBzBXPRH+KHFGtT1bsyXrWj34OS6pcNCVsr
	p7Y/CwjL8uaaulfCGno/0jqtgyaUCWn6FYiNS7g==
X-Google-Smtp-Source: AGHT+IFn+twCzCSyeeaogqHqxJtlAhMOH/0ALCX8dQKWNuWWzUxem8EDdoP/Zy/JRJuXvAkQG9PBSSTzZU3c7V6LoE4=
X-Received: by 2002:a05:6830:3146:b0:718:531:c190 with SMTP id
 46e09a7af769-7186827b1abmr13608345a34.24.1730289936015; Wed, 30 Oct 2024
 05:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-2-peter.griffin@linaro.org> <74458ba4-af0f-4c41-92f5-c6c0cb79e930@linaro.org>
In-Reply-To: <74458ba4-af0f-4c41-92f5-c6c0cb79e930@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 30 Oct 2024 12:05:25 +0000
Message-ID: <CADrjBPozRnsf5a0fNchbuokUK6y00SNSqEGDJ-sHojSvFzdd2w@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] scsi: ufs: exynos: Allow UFS Gear 4
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_050537_743294_75EF95EE 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Tudor,

On Wed, 30 Oct 2024 at 08:04, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > UFS Gear 4 offers faster speeds, and better power usage so lets
> > enable it.
> >
> > Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
> > so even if the device supports G4 we end up negotiating down to
> > G3.
> >
> > For SoCs like gs101 which have a UFS major controller version
> > of 3 or above advertise Gear 4. This then allows a Gear 4 link
> > on Pixel 6.
> >
> > For earlier controller versions keep the current default behaviour
> > of reporting G3.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> some nits/personal preferences below, no need to address them

As I'm re-spinning anyways I'll update it like you suggest.

Peter.

