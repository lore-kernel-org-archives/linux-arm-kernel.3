Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075CC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb+ihaPPmQVbulXLOR62KX//ccgvrqS85TAFiwCoIuQ=; b=3/u2kaSgQpLu/M2ptwXCZaVm1Z
	sDc6m0ZUrpVl6sk/lKu0bZ9SZnC9qSF4l2GWJbX049e1oF/yi+dSzPQrql4aVfqnZx6OuU+zpFssa
	OxwIU9PWpvOJDxVLCvwRL8zipmz/pGZ/08JbpJZMlhhpVyp0Qc3157fVKGmyH21cwFRWNzR8VjJ4N
	g/zmLmsZWJLzsN3ESFJHaq7OUszMKPH+YYqIfVxgNYKb8/P2Mam8UkQ0Ty9cOm5MLLWs22OKJEYuA
	+m7vCSUzAzDSuRsQVDl8a1KrxtBowBPupiY2oGBUJOJXsRrt6U4Zl+QhhcgDMFCQb6zz9pcm6Qtri
	qHunYPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdL-0000000DeqV-2wrw;
	Wed, 28 May 2025 16:28:03 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIlK-0000000DYja-0aG6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:32:15 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-605fda00c30so1959162eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748446332; x=1749051132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb+ihaPPmQVbulXLOR62KX//ccgvrqS85TAFiwCoIuQ=;
        b=hz9IQzB3BO6Vdk+cmohLIr/gttN0vYVfX2wAvl3mtMEUPQifp2eMOc9Hp/ZoXsjzZz
         1y+3kJz06r+bHEK01vuE32fF3vfwoQRT4Mp9PORE9kyp2kcqlLpDog4QaovTwZ1KJkOk
         228w9l8ZXcAEsOACwYZQVJvj2FBPdzCJX8Eij70A6kxGYpKu4s2r3jRpdCgkDy0KdBCz
         9p3+2acvTMe44GftKYSgFdfu7Li/QWGJJNKQs6pIa5ankhY0N4kmnwCnwCv1rUGVWO2y
         OtMGRTSLJFuwNSygss0bIT97+ioy6KqWHUHTmr/QUANE8uq9iCpgtnpGOrPPSA8NR/94
         c3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446332; x=1749051132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb+ihaPPmQVbulXLOR62KX//ccgvrqS85TAFiwCoIuQ=;
        b=izh29H4mqqkmsb45vJM0RJqYjlxJbw4xloYLXXsx5kR4PfKq1yKlKdEtYCmUYOz/HO
         FC+Diim4rYOZA7titqMihkJ57RS4GSfYcIQfZth86+w5IuqV8P8jtp9s4CDg7yPpghqY
         ltoAusx5N2f9oYmvzUBRi86U1o4FgWkx+6sUK46plIviNeCnC5DNvO4reJqGTMNlQPOR
         tq28lrzb9mQkG1dB28Q9b04R0fQh74N6DEOSDdEdOVE6AphfpoXRgQLI0ke1cMqPB9WO
         /HE2XOAsNI94tchymIQus3/ddDLwOCc4QAXrcZjw/yYbKphJST6c0cxXmYOYyGgN5x3N
         6Tbw==
X-Gm-Message-State: AOJu0Yxvm6B+VrAvqRSiV6OyffBSRDoxYLpg4W+ntG2YZotwXC4Dc73e
	rUhgSfsTYH/2GowXl5EpvNN6qLALVTZ7sw7J64j2Wg30YqOxc8kIQhIcIdR15yNZ1y3ySgq+I8s
	5X4xmrSyJxUdk/Lqrbn/UJtlOESgvAFDzuP5/e0awNA==
X-Gm-Gg: ASbGncsOh4PS3raLVjPTLMNKGQuwiad0NujKJ0L964uaPeYV97GI60473R2JGKW/N3W
	13cAf6xDDSR51+eCZEIRWxa0tVnE2XVr6Xm7tTI3J6JKPUAQj/JrallgIrzE0XSy1xdmmiUMENy
	EVS1VOuEB2N6fD/WqvemQtXZ78zlLpPfXsamUGHI3FJvDm
X-Google-Smtp-Source: AGHT+IHos1eUXPNGq8QWNr3OlSfg08FeZc8yyAKgwIPQGRrtKDPbJcRtS5J+HBCvWMuhSahRXfI9s7LR2jgTHuEkGDU=
X-Received: by 2002:a4a:e90d:0:b0:60b:ca08:a73c with SMTP id
 006d021491bc7-60bca08a9f6mr4885192eaf.6.1748446331714; Wed, 28 May 2025
 08:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com> <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 May 2025 17:31:59 +0200
X-Gm-Features: AX0GCFthIY9ATOhYlJJJYtmB5ln8kzCZVSAbqSOsSj3WleMn715mhuNyhb1d304
Message-ID: <CAHUa44HPpS0QVwtSGhOJDK-t+0v26V6kdXwERcNM1fbkBxK--w@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: arm_ffa: Fix memory leak by freeing
 notifier callback node
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_083214_190443_2DE19FDB 
X-CRM114-Status: GOOD (  17.49  )
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

On Wed, May 28, 2025 at 10:50=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> Commit e0573444edbf ("firmware: arm_ffa: Add interfaces to request
> notification callbacks") adds support for notifier callbacks by allocatin=
g
> and inserting a callback node into a hashtable during registration of
> notifiers. However, during unregistration, the code only removes the
> node from the hashtable without freeing the associated memory, resulting
> in a memory leak.
>
> Resolve the memory leak issue by ensuring the allocated notifier callback
> node is properly freed after it is removed from the hashtable entry.
>
> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notifi=
cation callbacks")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
> index fe55613a8ea993378474671d3c5756309da34fbc..6f75cdf29720993b1cd95eb7d=
3a36d01b0fdd1de 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1284,6 +1284,7 @@ update_notifier_cb(struct ffa_device *dev, int noti=
fy_id, void *cb,
>                 hash_add(drv_info->notifier_hash, &cb_info->hnode, notify=
_id);
>         } else {
>                 hash_del(&cb_info->hnode);
> +               kfree(cb_info);
>         }
>
>         return 0;
>
> --
> 2.34.1
>

