Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A023CC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnRgW07hzLRCxIKekWyNR2ruwTjgHHkQMx96GO7mN0k=; b=oYGOm5DJMMV9VOfJOhUGowdo1U
	Uq4SLpigFaYss0sgWUdE3GQy5XyghL1HI1el8EpDVbAtQJFmQ2fLBsPl1Sgit69Y5DZiOGE2nIMBd
	ERxC+e3RcBGI+ngvw5SwsihIFm4tch+iCk3ce8Odlv8R80w/qt5FXELSco6FNHPUEw2Q7QtQCCn0N
	IkBr8QVWADgr2dWSfdcCTpbh540NEmYulSO+XsTDqy3EC7fnuMywR8wUEkqdwiwznJRNHOndNfrIF
	XOBRM7UP84lf4JtJgSV4Se6dCN0M1/2zCEwbjU/m8pHc01XJJKHHw/W/XpaQN/LF1b45lrAgpEo23
	/i5jSllA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltvd-00000007nCa-09Y2;
	Mon, 20 Jul 2026 19:45:29 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltvZ-00000007nBm-1xMD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:45:27 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoZqTI0aBvbf6vbpT8L3LKnhGidqWwqEL1n/iDE6Hm+XJokAYOo2dbDLw28hfWNSbtcGIAQd0hIvSzikMXuJYz9@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784576723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnRgW07hzLRCxIKekWyNR2ruwTjgHHkQMx96GO7mN0k=;
	b=GE1IXM2FFsUbMgD3tbSp12QPGPa+ZTt52q4TPHh4H3KkMFPV5L8TA9KFdHv+Lkc1cbnpcx
	r0lAeqcAhQnUBN3sgTM9IxL+1FDHMQWYqtrATBG7UFXh6nRIv5AabWgX8WIsNBcsHxZE7q
	ieGbRLCODet233WM9APisoWijzoC4YA=
X-Gm-Message-State: AOJu0Yy3xwsQr+5hJ59tysPAUgC7w2Rm9caim1GnSzTys+2tqzR1Isqq
	2Rb+OhiGSa6ARf73zI6NKQfTQ9avUs7BdKTVNB8NafHbK/ckCDQ8u8qf76PzMV9XIWGzsyfeism
	ocIZGMczkGKGYLZglRP2tgQZYiEzgXOLKFjHc3hBx
X-Received: by 2002:a05:622a:d0e:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-52601f03537mr5544981cf.12.1784576711189; Mon, 20 Jul 2026
 12:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260715105100.3178255-1-vdonnefort@google.com>
In-Reply-To: <20260715105100.3178255-1-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 20 Jul 2026 20:45:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyVRn8BR7bLBo5m_k9m1VNv95y4h+WTJvz86FTf+=XeFg@mail.gmail.com>
X-Gm-Features: AUfX_myO2U0cPSk1RjmpSUdu0_huarr-ty_DjO0s1lnxhyEnNkUc3-HgW4xg-JY
Message-ID: <CA+EHjTyVRn8BR7bLBo5m_k9m1VNv95y4h+WTJvz86FTf+=XeFg@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Fix hyp_trace clock disabling
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_124525_712537_446B1BC9 
X-CRM114-Status: GOOD (  21.13  )
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

Hi Vincent,

On Wed, 15 Jul 2026 at 11:51, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Fix the disable path in hyp_trace_clock_enable(), which fell through to
> re-initialize and reschedule the clock after cancelling the work. Return
> early instead.
>
> While at it, cleanup hyp_trace_clock::lock which is unused and
> hyp_trace_clock::running which is redundant: the trace_remote framework
> already serializes calls to the callback enable_tracing.

Although the cleanup and the fix are to the same commit, could this be
split into the fix and the lock/running cleanup as a separate patch?
Since b22888917fa41 is already in a released kernel, the fix will
likely go to stable, and it'd be nice to keep that backport to just
the behavioural change.

Cheers,
/fuad

>
> Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> ---
>
> v1 -> v2:
>   * Rollback hyp_trace_clock_enable() on __tracing_enable error (Sashiko)
>
> v1: https://lore.kernel.org/all/alczBmnItMwq8xj4@google.com/
>
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index 2411b4c32932..9bfa368dd841 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -37,8 +37,6 @@ static struct hyp_trace_clock {
>         u32                     shift;
>         struct delayed_work     work;
>         struct completion       ready;
> -       struct mutex            lock;
> -       bool                    running;
>  } hyp_clock;
>
>  static void __hyp_clock_work(struct work_struct *work)
> @@ -110,12 +108,9 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
>  {
>         struct system_time_snapshot snap;
>
> -       if (hyp_clock->running == enable)
> -               return;
> -
>         if (!enable) {
>                 cancel_delayed_work_sync(&hyp_clock->work);
> -               hyp_clock->running = false;
> +               return;
>         }
>
>         ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);
> @@ -128,7 +123,6 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
>         INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
>         schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
>         wait_for_completion(&hyp_clock->ready);
> -       hyp_clock->running = true;
>  }
>
>  /* Access to this struct within the trace_remote_callbacks are protected by the trace_remote lock */
> @@ -304,9 +298,15 @@ static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
>
>  static int hyp_trace_enable_tracing(bool enable, void *priv)
>  {
> +       int ret;
> +
>         hyp_trace_clock_enable(&hyp_clock, enable);
>
> -       return kvm_call_hyp_nvhe(__tracing_enable, enable);
> +       ret = kvm_call_hyp_nvhe(__tracing_enable, enable);
> +       if (ret)
> +               hyp_trace_clock_enable(&hyp_clock, !enable);
> +
> +       return ret;
>  }
>
>  static int hyp_trace_swap_reader_page(unsigned int cpu, void *priv)
>
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> --
> 2.55.0.141.g00534a21ce-goog
>

