Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89638C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=; b=Ufj9lAMsaSlqZ2asKb7Wr7Il0+
	paqBJWMFVg7hg+S1hnZfofzo13MrofTdvGgVt67F6DaCh9kUACEba5IhcIfk856P/3+KN2NUB810P
	E5vGh5mkeMwpcEegKsXsSOks1HzyCPVX1r/yEoGzJJMgdcXIRo5IfzcGNemxtbA2Ax8USZGuogfvZ
	yw/D8asskcRge7ocZCj1VwFcAUWpvs9JJnv1XPoTfKj+cF5kEAtIU1K882Oqa99li/a3mVD1tsw0i
	eC5HJckA6KlYsgxMrmkamIVZe0ga4P6NbbHG2J1old+X8asnjD/Q8I6ZYBObKazqUfrJ7JFWnAO+Q
	9JSF2fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwoP-000000069hF-0PPC;
	Mon, 17 Aug 2026 12:51:33 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwoH-000000069eh-22Uo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:51:26 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-836c8cd38beso2032687b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786971084; cv=none;
        d=google.com; s=arc-20260327;
        b=ZL5DKtisQFv+c0dRPXrFo99NcafLTt5caPZsSqDCcCF7geg4judl5hGUf2mZ7+HAYK
         ua1mSOa8CIdVTMHvTeYpqayTIdwL4DEmv1tQ+aHvHfH/DE063NiMGbKyaQZFal3fTQ7T
         NC+Kc0VfZz2EOoSgnZ445l3MCVt87ez9BkUpIoThOBlZJeL7my5rBWNplkPavb6aDXGK
         EQBF+ubjsi1SuRNvYcz4i0MFoDvhroq/+OVr06g0r5ughFhY4JMSYJhMXWVpuEUgZObR
         WjuzNeThqYNgoiuzJcC17OIYnUYTInFc1I1hQrtiGP+KRspmA9nRe9JniQtd8lw8lV1c
         Bi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        fh=9sl03+vnlvM3mhQHfTdcR8fE8T06EUpq8OmWSVv6j6I=;
        b=PJ95JJfGCUdcDpZehr2Rb4vrJgTvQVeZtSnobQzcnVGRRQ1i4w9uEpZpyg4dx1dws+
         aG2hWj0yCg9gEEvrl5AfgoXiQlAQIUJSgf6m6dv41bxT5S/ArpeT/ENmbip2I+unnVA+
         LeC68Hb7OhZvS5Yxn16NHgg6GMOvlGpkQn1z83eMmB36kQCTSdphSKfbe5fsIZ9Q75LD
         DMAFO41SyCBn7djUoV3dMmlMkbWUFIuyYhl5Ip5izWRrBonGNLpVoURverg76ADe3WlF
         CUUwuEjCCdTtr7QwMmi8fSww1fCj5m06rMPXEmJ2J1arhJNob1PhqhIzX8Nkkx4qg0PR
         f7NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971084; x=1787575884; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        b=rTLw1JVluE6NKfQPz7emMceMgatcXLqsIAtk5rBrOsqcyOvXeuU9+ZCZfHo13+/mkb
         pxX1aamlLTN0PFmSRwzUiyIWEV8F4DAOgp3soYYECRERLsIDbXB/DpT0cF6oK3GsHS6/
         D7wNQ8TqB761NkJqlr5EYA6nH4TFfUVHI+SLktadwd/6kyKsq1FGl+yeL3K+YgSuAz0A
         aUrfrw27gPff9vvxgZ1mVsE540GnKhNBvRvkXFryhJdb0rhzV8xOZcIbcNiBHClokD54
         TEi6hK6mBbqQCQuGp8H7lnCBtxouKeNvrk85/lbGQOq585fsYI6LnrNhvPPi+FUCqpIo
         vyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971084; x=1787575884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        b=j/R5usAFKTzCCVdMuzKADBFXfLyR+ugMnO64yvk98vBLf+/X5IYAPM3diovA1J7HGD
         U2xO7bfLDqXSOEkvIPxmN4NSEvew1B7p/pfTtwm94yW82iueo7MSQ9HZQKgQETl5TvVO
         w42vm6H9MdrZRurwhYiyxj/mV76wQvAwB7Ps86X8eNT3NCBCrmSelyRRcFz02pkARVeD
         bQoip/M9Upleu8Hn6AUjdL/9rDMAfvcz/KhUT8et1doqwNp6Lg+jQTde5XgmgGt9FN7x
         cP4PHd3TbUhDuSviNhLlZ+nfpUDK+uq3AmdP3n0p8zV1yQwn+co00eUnFpZ5H+UUx17O
         cm+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpeujiPspseCy/a1PTDw6H9m+vOt4uIEym2ArxUMmhsB4uitqCXtSt3B/j9WJeJTT5d93IYfOgQjFP8mYiEjRUN@lists.infradead.org
X-Gm-Message-State: AOJu0YyehTP4TasNL7zYWFHpI9eBUYOF/QeXz3Pbyw8uwuWbie20XYPp
	0oAjqdCJzdiG/4Ulgh8/AV6Vb2QQXuM8PmEPZAq5cUMuWrwVr5sbb6e/gGhxVq/T2Zgi9hnWUId
	X40Vu/ufzLGnPzJmT7XtnbgnqGwA1ojw=
X-Gm-Gg: AR+sD108y0prO1OKo98XNbvcsBfOD3QtfDN0jKmCgFJq4BsXqFNDkKP4gwRCuvXEyGO
	TiiWlSZrPm8oe17KAE6QjTEhalWuk+NgsGNacN29eE8suhh/OXvzZGkPhdxOOnr6bEpe2TtUlFe
	v2bEq6PNGU9eDjMjZgNVfCd8ONB99qP8QuhLj1aWT1kVOuImKccgqSugkNnsowHXnYHKWFp9zQM
	WvEHtKyHgv1lq9HN2OSxcJ6YzFYBI634wZY/oD7+FXSbc4kuVuuebr25P+LxNaT3ypgkj8mMpKn
	SI1qtXcqKr+iTPujaB+uqHhTVZrIgGgMRYvSwI5H7pxKZ9xblPv2d1WTc96ldhfhBRq7cGwm4yX
	S4Ms=
X-Received: by 2002:a05:690c:b0f:b0:80d:5c71:d08c with SMTP id
 00721157ae682-8371308c88amr90606897b3.3.1786971083604; Mon, 17 Aug 2026
 05:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260817113603.1436067-1-gahing@gahingwoo.com> <20260817113603.1436067-4-gahing@gahingwoo.com>
In-Reply-To: <20260817113603.1436067-4-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 17 Aug 2026 14:51:12 +0200
X-Gm-Features: AcwNN1W5X2wGC2Q1I1TaTBqzvN2kUY3psEQZvOBiX0NX6cHaLHwnhi2fG-mcjGs
Message-ID: <CAEWPSH4VAR5VTJUW4PdJczrtueQzPzzo6og8PzWaupwd-t=BFQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] accel/rocket: factor the completion tail out of
 the IRQ handler
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_055125_565414_7E3FC5CE 
X-CRM114-Status: GOOD (  30.92  )
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

Hi Jiaxing,

You asked for a look at this one, so I checked it as a no functional
change refactor rather than only reading it. It holds.

I reconstructed the three source states from the posted diffs and built
the before and after with the driver's own kernel flags for arm64.
rocket_job_handle_irq() is static and inlines into
rocket_job_irq_handler_thread(); at -O2 both states emit the same calls
and the same stack frame, and differ only in which side of the branch
the rocket_job_hw_submit() call is laid out on.

The load bearing sentence in your message is the early return, and that
checks out too. At -O1 the pre-3/12 code emits mutex_unlock twice, once
on the path straight after rocket_job_hw_submit() and once at the guard
exit. That is the scoped_guard cleanup firing on the early return. After
3/12 there is one, because the return leaves the helper and all three
paths converge on the guard exit. Both versions unlock exactly once on
every path.

"Nothing follows it" also holds through the rest of the series, not only
here. 10/12 is the only later patch that touches rocket_job.c, and its
two hunks are the defines at the top and the PC_TASK_CON write inside
rocket_job_hw_submit(). Nothing is added after the scoped_guard in the
handler anywhere in v8.

While reconstructing the base I checked where the series sits.
drivers/accel/rocket/rocket_job.c in next-20260814 hashes to 3141f210f,
which is exactly 1/12's pre-image, and applying 1, 2 and 3 in order
reproduces 5f0f9682e, d484a3a6f and 0bb11c718 byte for byte. So these
three apply to an unmodified linux-next rocket_job.c and need neither
the RK3576 patches nor my clocks-by-name patch. Tomeu, that is meant as
information in case you want to pick them up independently, not as a
request for a re-cut.

Reviewed-by: Igor Paunovic <royalnet026@gmail.com>

Regards,
Igor


On Mon, Aug 17, 2026 at 1:36=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> rocket_job_handle_irq() stops the block and then either starts the job's
> next task or retires the job. The second half is a step of its own and
> reads better with a name, now that taking the register writes under
> job_lock has moved it a level deeper inside the scoped guard.
>
> Move it to rocket_job_next_locked(). The early return that used to leave
> the handler now leaves the helper, which is the same thing here: the
> scoped guard drops job_lock either way and nothing follows it.
>
> Doing it as its own patch keeps the locking fix at the head of the
> series minimal, so a bisect that stops before this one gets that fix and
> nothing else. There is one caller, and no functional change.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index d484a3a6f..0bb11c718 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -341,6 +341,25 @@ static struct dma_fence *rocket_job_run(struct drm_s=
ched_job *sched_job)
>         return ERR_PTR(ret);
>  }
>
> +/* Start the job's next task, or retire it. Caller holds job_lock. */
> +static void rocket_job_next_locked(struct rocket_core *core)
> +{
> +       lockdep_assert_held(&core->job_lock);
> +
> +       if (!core->in_flight_job)
> +               return;
> +
> +       if (core->in_flight_job->next_task_idx < core->in_flight_job->tas=
k_count) {
> +               rocket_job_hw_submit(core, core->in_flight_job);
> +               return;
> +       }
> +
> +       iommu_detach_group(NULL, iommu_group_get(core->dev));
> +       dma_fence_signal(core->in_flight_job->done_fence);
> +       pm_runtime_put_autosuspend(core->dev);
> +       core->in_flight_job =3D NULL;
> +}
> +
>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {
>         pm_runtime_mark_last_busy(core->dev);
> @@ -354,17 +373,7 @@ static void rocket_job_handle_irq(struct rocket_core=
 *core)
>                 rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
>                 rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
>
> -               if (core->in_flight_job) {
> -                       if (core->in_flight_job->next_task_idx < core->in=
_flight_job->task_count) {
> -                               rocket_job_hw_submit(core, core->in_fligh=
t_job);
> -                               return;
> -                       }
> -
> -                       iommu_detach_group(NULL, iommu_group_get(core->de=
v));
> -                       dma_fence_signal(core->in_flight_job->done_fence)=
;
> -                       pm_runtime_put_autosuspend(core->dev);
> -                       core->in_flight_job =3D NULL;
> -               }
> +               rocket_job_next_locked(core);
>         }
>  }
>
> --
> 2.43.0
>

