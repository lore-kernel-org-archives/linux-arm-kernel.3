Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FECDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=; b=ETT4V8mJOQFVOgovSzuKA6rSge
	kGsX19R4xLcjLzcLfI6/1i+C2cUgR2qJnCnH9Jyo9Gjppx4LhQDLMUo3qCsWxmAx///tEn3SjoyP3
	3EpDY6xZs4de21KLjPjoSpajA8KkwnIV6Z8pX/fdPFyQXjX1Q9JCCuh8N30XFF1b874eo0dyJU8m3
	QouzxXlJklUVwNsqAAjncuPuXYskxAwmznofYhFzrUQT3ZuzXPI2IPDoMrfCTttRa5Rs6zskHrnTH
	86ba+i5F0TDz4hF9OPzmetu/lVUgUxE9sUicMFi6976l+8VMY/Nv4rCVgGLx8tvASj4zTO1DZXZ8d
	7TFP2qLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9sq-00000006y6W-0PWg;
	Wed, 12 Feb 2025 10:22:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9aB-00000006uNp-0tIJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739354581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
	b=LpAxixsoQFAouULB0tEMh8JojJ9lnyz1yM59+8qoZt/HaQWuQmetdRyKsCCLIvvfbLAWzR
	75inhzPB3OY7ywDgjC7MzS6gGFdNJ3lO2QEP0frA5Nka3VpN7YgFqii86vvx04peoe90x/
	M0F6GYe5P/MmhUGfaH7gcyCQxSDAnKQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-tNzYVNsoOZ-71hWu7hsWnw-1; Wed, 12 Feb 2025 05:01:14 -0500
X-MC-Unique: tNzYVNsoOZ-71hWu7hsWnw-1
X-Mimecast-MFC-AGG-ID: tNzYVNsoOZ-71hWu7hsWnw
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa3b466245so9082264a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 02:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354473; x=1739959273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
        b=GXrvS1qD/usMKFLXSq86v5XagdcAPPq+5MhSG+AB+oG5HasOloEZtIHYZeRw4kyetv
         TzImYFCEmsrLeOpHRwRMKQ43JjlVsBnROf7XJPpAMMg95GucRown88MkYecSA9VBpKk7
         fn74U7A6XsipnEAp9FuMI94vL8Uf5yMXbLQ2o26AW653bf0kAEreBneQRptwAA0L4N2o
         xx8vlC1AwzHdNxCaE5tnRJettBjZqLw+VtQLJbhfteuMRRAjpNvDo1dy4VR9jHTwDlyM
         os5dNX6JGYVYLcw7c8vTP2z0mQDHKrYipcxwfljpEnjWD8WXjK0tl0gfwhr5ZlAKe8gz
         EBhw==
X-Forwarded-Encrypted: i=1; AJvYcCU/axxG/fhb9Vt1CYjweyCh8uPKg0e00ra/KEuTA8m3WooYPCStoc8cCGVQ6I8J5IGBJWiPTym/Gcdr0h9ab9Ei@lists.infradead.org
X-Gm-Message-State: AOJu0YxBMN4cG9Qv8WL/iXe+1VLP7EriQkcB+quDFDdnx6ON74dUYyuG
	9rF9w1Wz6+iE0n4pcu79tdyFJRqDhCTaVQOxHqd6CSExaipaICocfJGhUbZNxW6Shs6myXq5LXG
	dpJVD08BAyXJsUe7g+VkFyLWUadeoWesUanEtMZR1tSQlM8WPiITVhutjb9DHvlLO2cgKTpiiRp
	U0snJkH0ZBvil+P4GyRWvt1B7YwbgMD+HBGt+VEXELVC2IhgA=
X-Gm-Gg: ASbGnct8CQsNsToKFMEMs4E30fCIXJ8/CQcIL3Q3+xGN5rE9Vr5MVtAIah4wf2xxoBf
	ZDqnUfUlUXrVItB2Uu035ZjvMxO10ugRTB76m0041lno6amvOPSM7cYCrAyDSB29B94mtMx9l+1
	Cp22OSREutPc+kcVov9oQ=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2fbf5c6a05amr3885258a91.30.1739354473032;
        Wed, 12 Feb 2025 02:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHapn9jYWGyKoK8rERdyukBRLyP6apd4I5Sp/cSU8BhLWDuyyGc2UAEQe4Lq75zmYbK/CB6jhRtH7HcRUIhM4Q=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id
 98e67ed59e1d1-2fbf5c6a05amr3885222a91.30.1739354472720; Wed, 12 Feb 2025
 02:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 12 Feb 2025 10:00:36 +0000
X-Gm-Features: AWEUYZn-hP_kxTTtLow8M16VioOce2ZF8-IggRFFQ_uJOeNCeNsgfNjbEVocXew
Message-ID: <CAOgh=FzNk089VSrLbuAS=UA45dpY3mVFoebE2xg5ZGvTrtmVWg@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>, Jens Axboe <axboe@kernel.dk>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-janitors@vger.kernel.org, error27@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 35pVZf0wHQVxjnYVOERbU_2WWGp5THOEJDRcF5pIxhc_1739354473
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020303_359648_87EB7F9F 
X-CRM114-Status: GOOD (  22.63  )
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

On Wed, 12 Feb 2025 at 09:08, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
> which is a use after free.  The ->crashed function pointer is implemented
> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
> this doesn't cause a problem.  But it still looks sketchy as can be.
>
> Fix this by moving kfree() after the last usage of bfr.
>
> Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the crashed() callback")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

I wish we used the attribute cleanup stuff by default more in the
kernel, it would prevent a lot of things like this, it does what we
want it to do, most of the time.

Although I'm not sure it was introduced yet when the code was written.

Is mise le meas/Regards,

Eric Curtin

> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>  drivers/soc/apple/rtkit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 4b0783091a92..1ccec7ba640c 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -360,7 +360,6 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>                 apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
>                                    rtk->crashlog_buffer.size);
>                 apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
> -               kfree(bfr);
>         } else {
>                 dev_err(rtk->dev,
>                         "RTKit: Couldn't allocate crashlog shadow buffer\n");
> @@ -369,6 +368,8 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>         rtk->crashed = true;
>         if (rtk->ops->crashed)
>                 rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
> +
> +       kfree(bfr);
>  }
>
>  static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
> --
> 2.39.3
>
>


