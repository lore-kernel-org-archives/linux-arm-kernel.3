Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF94ACD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=; b=tU+aytruOdE6d4F20inBimIrzo
	Cv28hr8vp3dabsIh13asWBb6N5gsJ6DCKNV2V+duJ7uNC8q4aMO19Iqy0d01/zIuXHtvIOA1fqbXP
	aFj/YB5SM21/e5vNQ8+oA4Ob9/zQlt/UADz0sOXpwxOW5ZV4EZC+zN0xYxw3qpHgsRgkAeVbUykxv
	fmlrrjdOb2liJJZo0QwdYSQRf4UhyUZxCE/nCEkP/rmUJFfXYWe4bJZe0cJEjWobJPXD1PjUApqhb
	X36TslUTR2aM8wA5rABlLgA++zRl8TqnTqI0JwDAw0QaZCs43XbbbkJ3xzux0iFKyvXDAvz9SHcmt
	fXTKyyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaK-0000000ANTe-00GV;
	Fri, 22 May 2026 09:54:28 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaG-0000000ANRi-1sP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:54:25 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7c04749d739so48074147b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779443662; cv=none;
        d=google.com; s=arc-20240605;
        b=OPY6uwSlXCA502kJdnDoPrUP/HFVNGra0b4yZXytIMuUMfz+wj3jRbMUnCVaisCbne
         Eb8rvoLjpzUYjg9FOA1SUyKN83HVD0/BJYcVk3EtgSrMzUMwfbLaLDfpz1iCo97Q64U2
         o74iK5mpU8sWuu33G4+45NAKdTY1iP2fZwBjvlqmnSlGTW0gXPF3EJLZjd96tO6vhVji
         U1T+cv4PHSAeKgDU7doB9d9FusLqrVM23wiadxGEJrW+a0qv4h1A87QLhEzmWamfqfBQ
         JlOZZPfNNLQIUhORLDVHQk5Ql6LG3OFhUkI4W2DOIqd7TjNZUexnSjz/PdPu1y9WsiD9
         eXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        fh=TIHCTakUjKJecTKvmlt2kQTE+U5RA+KMFxhX/S7wQ2U=;
        b=kInVl3lXd8oHcLYUvm+UkcmbNV+tIWm51xucnnbZ7bOcEZ+BQNoolaz3yBCPvlaL0O
         a9kqSV+TD4s6C3BAFLd/ShDJ4Fc8xl43sSPWsFWTa6ubh8KvYZFwtEcaga2P6o0dv63o
         CYu7jq1s44QYHfJB6KxU2qDXd3QNFikRCUPZHhpA4OPKLWzuXi9BEOcBWH1CPDQgSth2
         y7V96dbjPDgfIRBPkv6z+tGjZLCZ07v5HHsBMfE0w2aqo1G4lvpo9+mm9O2HPCa25eWm
         NQy6lIIMuQ9ujo8aE1GvbRxyHmA2uMz1QaV26V3mFEXMue98QHwGG4rcUAePsj06ssmt
         Hq6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779443662; x=1780048462; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        b=pOoJxmCcaL3T4GBuQbctvgF+JqXIgq06kxwcqag9nsavG+WvKIQcS+NL12256GSnOK
         HTSq+b408t5mcDHX4le5R9U4TohTBWCTLM/Jt74U3LqVF65WIoSQUQBEUyhbR96ak+/D
         8DTVOcH9R2Dh0YrIlwthQvxEZlR1xrMnfpK6a8wmrhIlJwC3YC+JO9O5Ndb80bXuNTV8
         izbk6Rl2BJRuOEfuYRzrLnLIpCdWXUEAxKt7O8xO5I3lE8WcUfJaJGwci7QsknchaviO
         29hXinocJsnd0ZmNEUt/R8xDShL5bXlJhdDi67yXsahyp9Co2jMTFBEPpKH399r2bueB
         Nlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443662; x=1780048462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi6kVw9TNgWnpRQSSJ+L7fzHt7ZuNcqqXqhrYRZWQ1k=;
        b=LnVSdDkwijTRcHProbc9zsw0DvmHlI8bZrRnu5DnesyVCdGaV/U8Mfg3NtdB9hOhA0
         nnypIMfFig57IDxAH+EA//s4cmUW2Ox90FVOc2+xgDELglGDAvOY52tRZuj2UgFOZG7c
         SqkTKvsra21ObSB3SvxmRBCAVYYiKWZ6vG51Y1tDI9v9mK/T7RxP82RW1Zt6PR9IA+g6
         AC79S6pAd69GROQvgz+3qkxBDcGQan51/HWTzxJShcWV3+ixka/T1CyzZJ5NgJQShJLs
         FA8vnH10/SGHT7UR2UqPZk35tRuAhfrRReXKGxVBraToxeZ1VevzSAsF2aVooE/Psw8B
         eOkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UGRctkiflAViQ+xsiEH3ne8DYUWgqgDTJQ0uwbEsam41HdC6Ol0ZL70PlSTBTbcmnLprexd+gcOCvdkCZaSFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe18/ZEr0FHim8n8LfglN1mQuTZ5PdFpf1BQO51YJH0roYm48U
	+8uPe+vLpP8K3FQ8hw67Js/bAwyZtOXXbLuYIYfc+2uBq+of+gBuJNc8JQ37oBGBtkQkmG0aBvb
	n1sPHg8YkSRU1iedigNNhdTHqGv0GGAxs3pqLi4CimQ==
X-Gm-Gg: Acq92OFETIpT1bElL4EM+d1ufsd0qz31zEeajk7gBpWxHkiBmvyG+Woph+bos6lm3a5
	pM7zaA0NudKSqr6k8tOy1LJG3jtLkvpT1TwKfFt1HZerTRzu9r/keCnmM566DDofOA1A7AKNwfi
	mqPdhw2dhcxCnn2qsROSxy5Wo/4g4IvkXbBWjq/QcrlnYdLAua73U2O323NtKBqsYRPodQj50Sr
	6TOAPYRylYaeJ2MKstzrU8uhsm44HMJYwUmEsyVVOKCgDZ/xUu+CmNLvQnZWfKFEz7xaHdOxZXP
	xTlOw6FSsUzicwTIfjc7voM2imDCRM83vQhqKDAMHPq7Y8pllIYD3JsjZyIjxKXYM4ptiQ5tDIp
	5KuFxwrm1pUyHXUGNXJa1ZQ9b
X-Received: by 2002:a05:690c:9a03:b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7d33a256b12mr31850237b3.32.1779443662625; Fri, 22 May 2026
 02:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
In-Reply-To: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 May 2026 10:54:06 +0100
X-Gm-Features: AVHnY4KKPon9FWyuFvK3ZbijayCqq7lC9C5WtFxe_sZLfK6KsifxomhuLYVzDk0
Message-ID: <CAPY8ntArnXxJChoCPB2Nfi5tiBdwrzCctyCNckzVxPYTpBvn9g@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025424_572386_ACA6FD4D 
X-CRM114-Status: GOOD (  27.28  )
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

Hi Eugen

Thanks for the patch.

On Wed, 20 May 2026 at 16:37, 'Eugen Hristev' via kernel-list
<kernel-list@raspberrypi.com> wrote:
>
> The commit
> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> introduced a check to see whether the format requested is the same as the
> fourcc in the format list.
>
> However, this breaks the case when userspace requested an unpacked fourcc,
> e.g. RG10.
>
> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> on what userspace requests.
> In the unpacking case, a dedicated register is being set.
>
> If the userspace requests pRAA, this works, because the check validates the
> pipeline:
>
> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
>  --stream-mmap --stream-count=1 --stream-to=frame.raw
>
> but, with
> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> --stream-mmap --stream-count=1 --stream-to=frame.raw
>
> unicam complains at validation level:
>
> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
>
> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> RG10 or pRAA depending on the packing register.
>
> To fix this, modified the condition check to also allow in the case when
> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>
> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..cc7627e9a51a 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
>                  * In order to allow the applications using the old behaviour to
>                  * run, let's accept the old combination, but warn about it.
>                  */
> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260520-bcmpi-2c4850314e21
>
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
>

