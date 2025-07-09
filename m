Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C31C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+bfGFW4DtSQcr5Yecq9KqtEiX+ZRp1VJeXV6fP2IcE=; b=Y4Z5TxA6lj+smvVw1uZg8IzeKj
	JntWgYYACVm4vKRwTSgqi96w7t4nVV9gdkxQrGTP/Ko0YsZFyxGrNo+UTqTim8ohXFx+CQe5sTGhs
	5cG4Txe71y5STbmEKs+VN4nDmsLKbsblyM0qa483zO0noRKdzQAHFyFsaQdLdsd1OjMR6qqMqCYAJ
	oXepZvhBR69jOFNypiCwsNAUFyb9OWDkU4uEKh+vx5RFAPvqxQBVKAp7jl+ELirWz9LA03hTmvY5D
	uv94wzl5HJ3+OVcF5haj34Q+AmZCqmNCgCWqDC7zc1V2cfzQJogC0uzVytv9z6hT+QtSIQMOOhq49
	e8K0tv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTMo-00000008YGD-0wcl;
	Wed, 09 Jul 2025 11:53:38 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRfP-00000008Eh1-3BKr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:04:44 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2f78ef10832so3326677fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055483; x=1752660283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+bfGFW4DtSQcr5Yecq9KqtEiX+ZRp1VJeXV6fP2IcE=;
        b=sg1rINfc4dEfO4YfL+1elqmKVqbQtCUEtnPFVdpyZbnRJkPqYDiyBmNV1jo2xv8zso
         SgSw2shFxfl6VHcu4JW/CmatlRLV1Tz9LbKEAq8v4hmX32CWSn249c7vRH6yNEilbKop
         jI+8i2pppVqE+CzhhkwdxqKRMaMcWdSZVTxjQVqRdHRENBvU+nDBPxlFfSMel0weacoN
         nb+ZquzwJQtPWPhgfeiHhvfmuW5Gucp17bG2Pyfx5ywOPPqB/iWWOwnrAn9HT6jZxlvN
         dQHlAt/fvHuw/MvXzTY0ag2t9q4H+Oa0B03dZGOtnbBJoen6Gow+/0j1XHKDp9tQMYDc
         jYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055483; x=1752660283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+bfGFW4DtSQcr5Yecq9KqtEiX+ZRp1VJeXV6fP2IcE=;
        b=M01P+sJC+9P4MCyJf5bzB1Z8sdwbgf8RMbzyUjVjcDYAoW7WLpAOLYzIuuTF0u+LpS
         wjDumAdfSebQ3wVXT7dZVoTf9Mm5KkTbiqNalwIBTSPMkFDJMK796xXUOQGRlRbT+01t
         2hM647JXSIPApg3mxgAoDDfqEyHhIQiVzKtzFFSGNy9mRJdedcBRdBjOSZHitOn8INR4
         NN4jcx+c7TnmWasIhCT1lqJtoN5GKPz+LV8i0lzcE6ihgEWN9bgpxLCVApdE0rKFHMlq
         usISUHCSufsE5EGmTiMiu56prtCXdzqHeBtGRAfluKUEPk45EFB61lWcssd0mtMIO64m
         8NFg==
X-Forwarded-Encrypted: i=1; AJvYcCUqWnd+bFbbMAfBufclTcb7FwyNor2YzBRtQJx7ISxtQ0P/8THqbBe9tgmjeyWmi3om0K6HG/6+QtaigBc8XuVO@lists.infradead.org
X-Gm-Message-State: AOJu0YyyxBG0y4s3PnDQHy6YX4K1mnvr5qkux0KjrVx05Jt1Oi8X0Skt
	HSKcIBkWieNeGILopWhbS0HUxZZM5LFEqedZsbVUNTPaEixeSep2emMf+X0n4hDU5eTo2ZjXWaD
	Y5+9/EfcG09y4Dnf9ZnlcReHpb3snF/YKtEA0oQrlOw==
X-Gm-Gg: ASbGnct0vp3rcfAVPihouqy8mGpnadtMhAJLg8QypZwDO/cGU0+eb4Hm2gbymgv9dXM
	VbityMrjY6wTJvpu7I8AzcAs2MI1x5dLfEesDx17mFVA1OIN8SjzoFvpJbi30FBKe7847+SJ/NE
	Uy4M5utxBqle6Dg7onJymyLPnPJtOxwkEPnwCTNdwz1r0=
X-Google-Smtp-Source: AGHT+IGY95z19tqvWhEI5fgWA6R8T6/UqcM++P6QZAW4xt2CGrUQgdZq9RwXXFtbhIUTeJDCM/NWWKWEDhJ2ZJDsq3w=
X-Received: by 2002:a05:6870:46a4:b0:2b7:f58d:6dcf with SMTP id
 586e51a60fabf-2fef870ac82mr1083901fac.18.1752055482714; Wed, 09 Jul 2025
 03:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org> <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
In-Reply-To: <53a214b4039872ce7584a2ae6e688fcef0c86d7e.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 9 Jul 2025 11:04:29 +0100
X-Gm-Features: Ac12FXy1nHjPc0ZtUVknu5DhgpF7CNwmS2WMX0Qx_tI6AsiwGCLjhVVgixkJAf0
Message-ID: <CADrjBPrPcYZPFuRqwm0OkFU+CQtinFUtNXHzt+MQpEy=Q-Xnww@mail.gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_030443_799693_ADD23863 
X-CRM114-Status: GOOD (  18.59  )
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

Hi Andr=C3=A9,

Thanks for the review feedback!

On Thu, 3 Jul 2025 at 12:01, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> More small comments. Sorry for the drip feed, just trying to understand
> things...
>
> On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> > [...]
> >
> > +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> > +                                     unsigned long action, void *v)
> > +{
> > +     switch (action) {
> > +     case CPU_PM_ENTER:
> > +             /*
> > +              * Ignore CPU_PM_ENTER event in reboot or
> > +              * suspend sequence.
> > +              */
> > +
> > +             if (atomic_read(&pmu_context->sys_suspended) ||
> > +                 atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             return gs101_cpu_pmu_offline();
> > +
> > +             break;
>
> break is not needed after return, and generally there should be an empty
> line before the next case statement.

Will fix
>
> > +     case CPU_PM_EXIT:
>
> Should this also handle CPU_PM_ENTER_FAILED in the same way to bring
> the CPU back up in case of failures?

I choose not to do that, mainly because the downstream production
drivers don't handle CPU_PM_ENTER_FAILED, and without access to the
firmware code it is hard to reason about.

Logically it seems like we would want to do the same code as
CPU_PM_EXIT with a CPU_PM_ENTER_FAILED, but I've never seen
CPU_PM_FAILED so far in my debugging.

>
> > +
> > +             if (atomic_read(&pmu_context->sys_rebooting))
> > +                     return NOTIFY_OK;
> > +
> > +             return gs101_cpu_pmu_online();
> > +
> > +             break;
>
> No break needed.

Will fix

Thanks.

Peter

