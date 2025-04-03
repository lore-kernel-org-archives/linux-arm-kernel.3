Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DBDC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1pDUEscKj1Os+peQBo0kQaDotNDCTOulI3xxjBqRM0=; b=RWrTteKFo3A78DC0V6eW3b8Wam
	jTVjZTzjFkOkOzvLsSirujbSbXyHvkv54WxT1T8iuYuJICJEjiYoAWDe/Ts7AZ0AmB+rcvBF5FV2y
	xemnbroKpE2GdcNl/Dw0N0niDfQvAdOv41UD6uhECXPYxZEf5HBr6ZvbjOoljkvBuSUJjmkO8cOIp
	EKnvzbauPy4CxzHU58LYYW6SIdpknc7Ffsule0BUiwRfk+cg3Rl9dhrGRkjyhXZddOoVhUCzV5YIE
	wcT46Nu5VSio/LRyFt1huW26lnOEBZslfHpdwaHEFpB509a/UX8Egt1BCyb9RECYbPhQTus35RLxf
	3I5nNLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Osw-00000009WLz-0qFE;
	Thu, 03 Apr 2025 18:01:50 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Oko-00000009VPC-252p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:53:27 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e91d323346so12405736d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 10:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743702804; x=1744307604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1pDUEscKj1Os+peQBo0kQaDotNDCTOulI3xxjBqRM0=;
        b=aZb8WDuRBeS/EP3xaakv8y+u1lr82wsjZua3hMOeJPfjuwLA6jCMgxwI6E1yxQnQSD
         I6LjtF9FWklg+4vTA1fcyPDO5jsQ4nFfrZzDAdNOw4LRuuE+7cFxQvedKoXRuTPaj3I2
         xY8J7j/YR9n427EilMWInE9P386zBjjhQQJqBz8dF49zCcl8tAW3G0HL582r4BWo+mAA
         lLtjVFajWeYFEdO1efE8ge9qfuId9jbqGgeans/LPc1KgEFHdVIGeVLmSx/ldLxiQrdB
         79UrBw+FLH039TLdudndGJNuVfznixVneG8FSIsxAKhe5UglSbZlBsIFA/bVhtn/ZO0d
         GbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743702804; x=1744307604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1pDUEscKj1Os+peQBo0kQaDotNDCTOulI3xxjBqRM0=;
        b=mwhL+9qyOHxPQM/dHyh0UGGNB2lpQuddzBqJW5T8i9l+mD77qXjHNVmGX4yq0P8bYZ
         oD81QljiZVW3g9xKAREMcTbIJjlqCUE4HCkRY7XCaJCfwjuox7aoaL6zDKGEBwyXM120
         2UBGAu54ZAfPU0ec9ckct4ISasqAbyGB7/24CjjQE9xhTdPZ2xAhlwJiGPIKq0qSwiNs
         e6oSehik4mrFfoiWGD6igo5MHpzSyklZLSqNuyq65FW43BElNV8FMn8uh2vtUbQPglJk
         yKTqp7WOg+1a8QxSvx/lOX1QQ7Fg09kuRplaa4APfjn+oGsS2HOPxC4a+HoG68+dhZRn
         +ACA==
X-Forwarded-Encrypted: i=1; AJvYcCXlojJyvwd6ozh+dvljX1INadERyvx0tW9qrvXarTohzG/4Nm9+mOT6mpltwHvNgazbheU3PdgNdENnAA98DI+M@lists.infradead.org
X-Gm-Message-State: AOJu0YyoFWffhDCjAB1YFMSpra6nb+LwWS3WgXE6/JKIyCoYonGXIbeK
	moXbLPNihlduphjPGgQoTjUftNIgDE8l+Up3gKWZ2AwI0P85SBa+VBIILpkidWwiKZ0vzMFqGFb
	9VjiFPBMptmSKHnCLRWIveZedW+qRJxrZUk+QaQONd6crQRvlupQ=
X-Gm-Gg: ASbGncsIf5gO5XZ9DerOKeNHbtqInHbpTYEhL9ioe5SRarFMEbTF0rK6KdzI76a7DZR
	KvX51b1dmLWoXfcUtkJ8XWjsgWm/HqTHbsF3e7yAwt8Q22SzBaB5z5vXtrxKbOYAICi/EFresoZ
	CJqQL43eYNi+ByyjR65QtkkxdMMQ==
X-Google-Smtp-Source: AGHT+IGsQAS/vDMHleY+gdz7l418Xx70O/fvD1la7fWn33WmGNlS51X68cp9ILIAIkhbuIL68l77+iA5YwPwG/oefRA=
X-Received: by 2002:a05:6214:2528:b0:6e4:4676:85c3 with SMTP id
 6a1803df08f44-6ef0bec78e0mr66578316d6.11.1743702804283; Thu, 03 Apr 2025
 10:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com> <20250402130145.GI115840@e132581.arm.com>
In-Reply-To: <20250402130145.GI115840@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 10:53:12 -0700
X-Gm-Features: ATxdqUHHcDcKVLeupaSiGhXiC7bOvmKwN3NcRZXw1qMIRHgc3mg76yRhMNK6d3w
Message-ID: <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_105326_534647_4AE08244 
X-CRM114-Status: GOOD (  18.96  )
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

On Wed, Apr 2, 2025 at 6:01=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Yabin,
>
> On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:
>
> [...]
>
> > > @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata =
*drvdata)
> > >
> > >  static int catu_disable(struct coresight_device *csdev, void *__unus=
ed)
> > >  {
> > > -       int rc;
> > > +       int rc =3D 0;
> > >         struct catu_drvdata *catu_drvdata =3D csdev_to_catu_drvdata(c=
sdev);
> > > +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
> > >
> > > -       CS_UNLOCK(catu_drvdata->base);
> > > -       rc =3D catu_disable_hw(catu_drvdata);
> > > -       CS_LOCK(catu_drvdata->base);
> > > +       if (--csdev->refcnt =3D=3D 0) {
> > > +               CS_UNLOCK(catu_drvdata->base);
> > > +               rc =3D catu_disable_hw(catu_drvdata);
> > > +               CS_LOCK(catu_drvdata->base);
> > > +       } else {
> > > +               rc =3D -EBUSY;
>
> This is not an error if the decremented reference counter is not zero.
> It should return 0.  Otherwise, the change looks good to me.

In coresight_disable_helpers(), the return value of catu_disable()
isn't checked.
The -EBUSY return was used for consistency with other refcounted
disable functions
like tmc_disable_etf_sink() and tmc_disable_etr_sink(). I'm happy to
change it back
to 0 if you believe that would be the more accurate return value here.

>
> Thanks,
> Leo

