Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34BCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kom0ZAk0sd+EvCK6HQibq96i7GIy+t3E/vTkY+JP0bw=; b=vnGssf10UTWmL60l2y68NYekwx
	ToqEOHv7k1peE/cubsgnro9k19WKpz+ImDLYwMhml24Lbyp/802W2lRv0TSkmE9gQcE6fGhs3dEKy
	MXZluE9m76gUW3NJHAxwcktbv1uyrOb3EGeUg5zqjukTbMxvZeN1kb6EHsgNteJ49QIgP604M3KxU
	A79WhI499HrOqrqS6S5kveY3Xuo3mu4VVot2Y2jLT7T/fcFMwiiQzNjUuiDA6guv2jSR/1+wZBbNy
	AECYB7ySauKTC0FCibcmana2IYDyMZBk3KWq8Hfx1HzWN1dMYeOhldoL9m15vdaZx7yShJPQvPTJ+
	h+36DzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7kT-0000000E2xR-0Frt;
	Mon, 29 Jun 2026 08:53:49 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7kQ-0000000E2wQ-2NM5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:53:47 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-447bb8bb754so2226342fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 01:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782723225; cv=none;
        d=google.com; s=arc-20260327;
        b=DUtLkYuQXr1QA4sXBa4xJ5yPyseKzXOc2O/Dw5a6IaOXJWHcwoUwEyh2oc2SSthr1b
         ZeoVEIx0wW1iipGix2/EDjeSSR8Rwo1TtvaMG05iB+FAbh9LBsvy9z6V74pzqccFJskN
         3SAHaULXZTsScxIijtZIACJNciXTsQCneAIeaGnpJ/dgeZMG3nBUyKuOdDJmHRoopMlz
         J5T8ZPolKUuw4m5wJJUy2sY8yymXeXbLr5wspkR+eE95ISlCIUkF0jZXxkxhxaOuK3ri
         X+Kxu9m3qerckifJZom2nOBWwmD8iVbcKyjCkJjYbFAKfXoPG4YBdb/CfXu+Se/cDHCg
         5WCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kom0ZAk0sd+EvCK6HQibq96i7GIy+t3E/vTkY+JP0bw=;
        fh=6G2yQF9EIB//IJ6xSyyGMy6R+yMY/FGQhBhROcuNuGo=;
        b=Vd4bFxMyrngVFtrkOKyyR8j5c3wqlumiQifhMNyrVvBT8QtSG4/Ag/8x5nCNEeHoRW
         H8sc6UwP9oYNdXX1huY+W4B+2ty/19eQnrhr3bAdYiPrJ9XJcYsSlQ2Qke4/RYgkhsXG
         yFtbB1iDY3Wzf11E7U2cfCcrhURnX3lvZajwInjGgyrNCtzYYxfzMVQzQsTLL4NpYjsj
         cv6ZoZ+NBhHxAEEICTDEp0gb2MUYdxSENwKI4swY5zPn4Djlsm0pL5qv2WRoj9GSDqC/
         nnWgRwyX/z1DQCaN0wf64uCQX9FvoMPg/7fDU8museZEBsxOnFElzlN3HAJ3HLz7RXOq
         T7fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782723225; x=1783328025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kom0ZAk0sd+EvCK6HQibq96i7GIy+t3E/vTkY+JP0bw=;
        b=bkdLv/HagDhXak83IyCwqCtXRrUWccBL3b/t5L/ieWg3LTpMuie2bduh0weVTm94vv
         xqErKit4tm95jnMVW6t1O9sIXEbnpORfC4t7hMf3+rsFHYA+Dk9nctqhJRVgt2dVuQMY
         RYfT0aKXuK3vYHJXfUlXaMTIHMtYZcLBPxeYvGPFX3Sb55TeRzYWfVyIQwmTKTW9+Fx3
         eeYxECitjayxly0+aXH8JHqrK73I/I8TB9+foZ5QRhmPo9VvkYgAEy0ERXav+C0nxuoX
         c7e5VbGltpNGEw5634cqLxPFAqeIbeUMpIjrODpW4Y06fGSgA5mMNWmS+0vNi68CkXr3
         b+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723225; x=1783328025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kom0ZAk0sd+EvCK6HQibq96i7GIy+t3E/vTkY+JP0bw=;
        b=btVx6BeBSWhDtrzfvJ5G6zlkT1STJYghJL725VY6ClnQfXVbnfUSD7MBq/QJjK6tGz
         RfjjtPt4tFiQHWvyerNjLxbAzX9uijzV9bOFF2M6OarXL6JF7/jIk/GAR4opYvlGy/dl
         2D6vXPg+q42Nuxmgyz5TTsSrQO+XOYlAuEoDRKoN4Cvf5hBvow6+6qc/HLFAXUTMNYUU
         SCUWobvBr490I7YD46jZb7X0bOJKym9Dp4i72W8aDp74IPRUR8zdw4pecI/Wz6CkZl7D
         1FMab3EIOEXLmp2ytSpoltavERRAik//yka0cOz1e2srKXVAb3Dil5XAJY20EY3t4kpk
         gsHg==
X-Forwarded-Encrypted: i=1; AHgh+RoDmJPLopo+T4325go2KQ32lYNBuXxXJRvHEsuhC8Z9uKoj1+5GtDD3HgwnpJPfboaSny5mSvmV/2b9FsGp1mj5@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGZ5SSrbuR8EHpKp+JgXO6gT6xulHwW5vTyN7kBdpUFjWz8qK
	NRqTp4/oO4puG/XE96vHTQPh8Iv/KHS8JytLFvoDy14e/4PK/s8bYbaKHa3Oc96OerkBbiRly1M
	BlpdhBnQqBv6XYwAXplBaLXuwHcs6Vwc5LBzc1s/A7w==
X-Gm-Gg: AfdE7ck4tFM4t+RaYo2Vu4Id5E6cdQvK+GgwabiHK+eMr9K7zlSDJdyEhQgC0aB08gp
	XmNbkjomR9IdO0V3hPdc6RWvSpfjcvNh6BHlVH7vdk9NYjd6P1DozwSirAkmZzbB9NYbIdgMHTE
	Ptkan0vmCfgaa0bnraY9vjGrQCPhwPA47ZFOEMvolpHRdCzi7dhFxlJid8+R2pu+ZwoOFaPIgFc
	JMQh3fFxiK++sMfNKIFUSV7VD4QKllMXiwsVYfcAG3YiebGQbkbx/vV7jz+o1CAgbworP8A7p22
	HqXEA+ovEbo6GRhRCtCCn2NjHvCpy41lrwDF9Q==
X-Received: by 2002:a05:6870:b3f3:b0:439:b99e:4414 with SMTP id
 586e51a60fabf-447aa7368f0mr16814855fac.6.1782723224733; Mon, 29 Jun 2026
 01:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260617145130.3729015-1-sebastianene@google.com> <20260617145130.3729015-2-sebastianene@google.com>
In-Reply-To: <20260617145130.3729015-2-sebastianene@google.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 29 Jun 2026 10:53:33 +0200
X-Gm-Features: AVVi8CdwEgzZOnIaRh41XK3ftF9jm9u6SUDMnMyJOJvWlzRi07xhGUj8Wp9l8xs
Message-ID: <CAHUa44GST=efeDepEHWs_=ehr7JVnkg+y0ZLebcLAGZXxpNegA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] optee: ffa: Add NULL check in optee_ffa_lend_protmem
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org, 
	will@kernel.org, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com, 
	op-tee@lists.trustedfirmware.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, sumit.garg@kernel.org, suzuki.poulose@arm.com, 
	vdonnefort@google.com, yuzenghui@huawei.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015346_607138_7509FA07 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, Jun 17, 2026 at 4:51=E2=80=AFPM Sebastian Ene <sebastianene@google.=
com> wrote:
>
> From: Mostafa Saleh <smostafa@google.com>
>
> From: Mostafa Saleh <smostafa@google.com>
>
> Sashiko (locally) reports a possible null dereference under memory
> pressure due to the lack of validation of the allocated pointer.
>
> Fix that by adding the missing check.
>
> Fixes: 2b78d79cdf96 ("optee: FF-A: dynamic protected memory allocation")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 3 +++
>  1 file changed, 3 insertions(+)

I'm picking up this isolated patch from the patchset.

Cheers,
Jens

