Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3186CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=; b=VRiMo0L5OKjXHl96D8C45pl0Ts
	484LL9hKHG6pd4ejTi0VIH/RoASFzpMT6jLZq+9wyaohzdh3uETK70E1gc5yAvofuZ9I21P9wprpU
	+4qpForj7eGFzAkQmsCRkosoBQq3hDxDNOI/Zuwv2CPS1dSSaaGRxmQc7jL2ddFGVeHt4X+xU0Zcl
	FmqYBlkLlvVp8BetYkkoV/XfK+I3JHaynVAOSnbr4K6LmBCV0taiMwDBlyZwBdrlF8tLH0S90PmSj
	GBd/DfR5pa4Sx2Bhg/0yc7Y8ylsitgLVb1ZxJ2mlRLTex9oa3IUyjEuahdJ+ebuepKpYXytrKb0co
	ldE2Me9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMzJ-000000038Aq-2Fyt;
	Mon, 27 Jul 2026 15:11:29 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMzH-000000038A0-0JQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 15:11:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2369134a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 08:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165086; cv=none;
        d=google.com; s=arc-20260327;
        b=R7QMBeLLoVndbyBhZBAY6MS+imizgbtQ9SraYCyhYfBcnRJ+omBrhLlbUobXYG8x9k
         FXrNxJ2xhHZ8kStZVuTStlE7BS5euCOQzcWMSmm2O6ep1UKWcMMSORfod4FBdR3ykMxo
         WY6dLi0ft9QpjMAztPw2PysijfXa4je2FqIhzqIM8ZGLILEj6gCvoPUqQa6HDoxepHYx
         yJlqYzlg3RcziwOTVdiwKOq7tKyttwntL51PqT4f025RgmUKKSjXKZ4tI3tSCibbBAXr
         teHM7bvImWOmn27dQDz0kil39kLBli3fygB/BgN/VWujhjuY83KUe5eTUC5RpDDXdJg9
         r96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        fh=BtD57YcfC0VBS6M6Hrx6pY29FEcBSxXO0hHTmsWOcwI=;
        b=pqMGwOzWzGwqvhbwrmoTgUlsywPIqavcZ96KdBT7JJ7kbqJ/IkIug+Xw2sDt4PBqCX
         0hieeNuapPNTtXnuGbQVrKZGQwoH7EDV6xPp0X81r1NnLEBNjU7zlQFRknTO0E5CSZwJ
         rVQ0mpeBfgTy6/sr3kv68rDf1bmWteeGGrznSygk+rcv2VX0uC52raypALh/h8ekPR0r
         fVN3kBFfkWOs2wv0xXwvUhBCxEiNXcmbKpS7E7C82PRoHBHvfiwS0zfRpyI70gYIoKoB
         ydSy+FPpollZKFHzMFP+MGp+nqZGYXQKnu2t4qiCKWjfmf0WKgu7PFn7AqnLwV5zOPMG
         jT4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165086; x=1785769886; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        b=ZNmBlwWfpgkUpPI0ThaT00NqsaeNT53ZO1rtWFXM6yPZ1Hx5c36tGTe8wk7aEGVj55
         zcT9Uza2SS0WkW9kZxZE6xq1HbAjdabJXHxBv6FBLY9XUM2IRO8VJznTQK4FjiKa+GO5
         mHo7X3yBpj8OVO1phoqR1wqrawTR62nbxXrPg0Beq04KQ+S12Ih5POOOjPxy89UMLb2u
         mAWsf/bc0DpJJqYe55QwKzr5TdAxL6wiTNcsUJkCZQGtCUfiYva4zeoDYAIe1aIy9dl4
         XA3sRywo426zufX9oeTTY0dm4cyo1lnLfokyEuzN5Z43HdpuP8sCYVUMrU62GJ4XdxGa
         iWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165086; x=1785769886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        b=QuR489E2JC3faLr2uHDnjsqfJLRUDg/xlafA0UIpvtaWP+99fR1rjcDcFkDYwYf6Za
         fLqsaCFmgq8BcZoTdH9udqvgskOlVIh9br9sfrQ4I2HL+SUCMflv9BDc4zk+ac3BEMw5
         Z8egmNTHTBekvjk9wTKC+PSw8baX2YOv+H/r3y5vnPHXmQ7+INxWnDG+wqUizp6tfewZ
         insy6/DBN09RafH1u8mkfcaVcg+Mo6sqJIMCWOWhaBkIOfCUWI/pfyKCCBz9VK4bpL3i
         1QoBBURP/QZLxRmGH+1zBxiHhzQhwaptJcmg1hhPXfJ3yQO7oX7CyR/CqfH3cWVfLlPl
         VxBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9wFhyawkbkMllWEhFe7Nk3PWryXQNTMPuJfqupcf+nQP2cPne8X4DOmfGVwDK1FnlEKHlMbQl8rDsVz16AmgF@lists.infradead.org
X-Gm-Message-State: AOJu0YxuaMl95ZkGsYKyFpZhia4ir/1LNYfj51Th3j98K0L5KLZPDlS/
	heXaPW104QKPW03DxOKN7D6zy4xfR88CxYYfoE78/hMXBpFvy+PtSf6IlNtkQ75KWMji8URRAEp
	/uo6MqIx8wZ+RmRcr1iaGLkXn1D44Kw==
X-Gm-Gg: AR+sD10Ixc0OrLrRxT/sX2SNFF8UbdyswTdQVxeSCKvxELZrAZmjqPPMvdGKCTBPDVq
	h3meA6KANjg5nid6pmG7sC2q9pZIu6wnF1zDvo99eMKYI4a7M02OxhW0lvKRB5kkQIok/+afqcI
	90AWcbuDpQqnCsknkuKELkx8iM6w8KNaM2YK4Ajh+GTSBwdEaUjtpTmgBSos1YJJ+uPGRMifobk
	y4NutTaYBihi+8/944q/7pvIN1Dk9KkSqJOqiEQ9D5vHt8hOLg4cITJrn2pm0ysHUSQEwDrSGnJ
	gFvUm+0uVA1b7+rw7rWqnRE9ontA
X-Received: by 2002:a05:6a21:117:b0:3b5:6b5a:4f31 with SMTP id
 adf61e73a8af0-3c67267fd31mr10484309637.27.1785165085845; Mon, 27 Jul 2026
 08:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260717154505.83935-1-pavone.lawyer@gmail.com>
In-Reply-To: <20260717154505.83935-1-pavone.lawyer@gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 17:11:13 +0200
X-Gm-Features: AUfX_mxQeAYfmsp5ndscJp3cVl_h1riLkJOcLZ-AQknL2ZhHaJnGBD90JFOpFcw
Message-ID: <CAMhzubpF5UQZ6b3F9EUM7U_HJUJ6gB9Px-9v=dCW6v-4CVBLKw@mail.gmail.com>
Subject: Re: [PATCH v4] media: rkvdec: fix clk reference leak on unbind
To: jonas@kwiboo.se, detlev.casanova@collabora.com, 
	nicolas.dufresne@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_081127_130007_7E0C9CAB 
X-CRM114-Status: GOOD (  46.48  )
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

Self-review after running this on a Rock 5B+. The reorder closes the
clk leak, but it opens a window I missed when I sent it.
Moving the PM teardown ahead of rkvdec_v4l2_cleanup() is necessary,
for the drvdata reason in the commit message. The side effect is that
video_unregister_device() is now the last thing remove() does, so
/dev/videoN stays open-able while the empty IOMMU domain is already
freed.
A job queued in that window reaches rkvdec_iommu_restore() and touches
the freed domain. Before the reorder, cleanup ran first and the window
did not exist.
Splitting the helper keeps both properties: unregister the media and
video devices first, which stops new jobs, then tear down PM, then
release the m2m and V4L2 device. Only that last step clears drvdata,
so rkvdec_runtime_suspend() still finds its state.

   cancel_delayed_work_sync(&rkvdec->watchdog_work);

   rkvdec_v4l2_unregister(rkvdec); /* media + video unregister */

   pm_runtime_dont_use_autosuspend(&pdev->dev);

   if (rkvdec->empty_domain)
     iommu_domain_free(rkvdec->empty_domain);

   pm_runtime_disable(&pdev->dev);
   rkvdec_v4l2_release(rkvdec); /* media cleanup, m2m, v4l2 */

Running here on 7.2-rc5: unbind then rebind returns the rkvdec clock
enable counts to their pre-unbind values and /dev/video0 comes back.
I can send this as a v5 carrying both changes, or as a follow-up patch
on top of v4, whichever you prefer.
Thanks,
Francesco

Il giorno ven 17 lug 2026 alle ore 17:45 Francesco Saverio Pavone
<pavone.lawyer@gmail.com> ha scritto:
>
> From: Jonas Karlman <jonas@kwiboo.se>
>
> remove() calls pm_runtime_disable() before
> pm_runtime_dont_use_autosuspend(), so the second call can never suspend
> the device: it reaches rpm_idle(), which returns -EACCES once PM runtime
> is disabled. The probe error path has had the two the other way round
> since the driver was merged.
>
> This shows up when the device is unbound while the 100ms autosuspend
> window is still open, which is what an rmmod right after a decode does.
> device_release_driver() calls pm_runtime_put_sync() before .remove(),
> and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
> autosuspend timer. pm_runtime_disable() then cancels the timer, and
> pm_runtime_reinit() relabels the device suspended without calling the
> driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
> never dropped, and a later probe does not reclaim it, so every such
> unbind leaks one enable count.
>
> Drop autosuspend first, so the callback still runs and releases the
> clocks.
>
> The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
> than just swap with each other. rkvdec_runtime_suspend() looks its state
> up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
> struct rkvdec_dev has v4l2_device as its first member, so
> &rkvdec->v4l2_dev and rkvdec are the same address and the check in
> v4l2_device_disconnect() matches. That is harmless today because
> pm_runtime_disable() suppresses the callback, but once the callback can
> run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
> the two PM calls oopses on every unbind.
>
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> [fsp: wrote the commit message; the diff is unchanged]
> Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> ---
> Changes in v4:
>  - No functional change. Resent as its own thread (no In-Reply-To on v2),
>    per Nicolas's note that a new version should be its own thread for
>    patchwork tracking. Same diff and same commit message as v3.
>
> Changes in v3:
>  - Rewrote the commit message, and dropped the VP9 claim from v1 and v2.
>    Those said this fixed a VP9 inter-prediction bug on RK3588, green chroma
>    from the second ALTREF frame onward. The bug is real, but this is not
>    what fixes it, and I should have established that before sending v1.
>
>    What happened: I took this patch out of chewitt's tree along with two
>    others and tested the three as a batch. The green is fixed by "media:
>    rkvdec: implement reset controls" from Alex Bee, which adds the
>    reset_control handling that recovers the VDPU381 after a transient error
>    (COLMV_REF_ERR_STA and friends) instead of leaving it dirty for the next
>    inter frame. Randy Li's PMU idle export goes with it. This patch was the
>    third one in that batch and got the credit.
>
>    Retested this week on the same Rock 5B+ with an unpatched driver: a VP9
>    Profile 0 1080p clip with alt-ref frames decodes byte-identical to the
>    libvpx reference, across five rmmod/insmod cycles and after an unbind
>    inside the autosuspend window. The green does not come back, because the
>    reset_control work is in the tree I test on. Sorry for the review and the
>    testing you spent on that basis.
>
>  - Worth flagging separately: mainline rkvdec has no reset_control support
>    at all, so the VDPU381 is never recovered after a transient error. That
>    is a real gap, it is just not this patch. I can write it up properly if
>    that is useful.
>
>  - The diff is unchanged from v1 and v2. It is Jonas's 2020 commit verbatim,
>    and his original one-line subject already described exactly what it does.
>    The wrong story was mine, not his.
>
>  - The subject changed with the message: "media: rkvdec: fix PM runtime
>    teardown ordering in remove" in v1 and v2, "media: rkvdec: fix clk
>    reference leak on unbind" here, since that is what it actually fixes.
>
>  - What is left is measured. With a dev_info() at the top of
>    rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to take the
>    timer out of the race, and unbind driven through sysfs:
>        unpatched: 0 suspend callbacks, aclk_rkvdec0 enable_count 1 -> 2
>        patched:   1 suspend callback,  enable_count 1 -> 1
>    The leak survives rmmod and accumulates one per unbind. With
>    autosuspend_delay=0 both orders suspend once, which is the control: the
>    difference only exists inside the window.
>
>  - Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtime calls
>    as context and only added iommu_domain_free(). cd33c830448b added remove()
>    with the reversed order, and the probe error path with the right one, so
>    the tag points there now.
>
>  - Dropped Cc: stable. A clk reference leaked on unbind is not backport
>    material, and the tag was only there for the VP9 claim.
>
>  - Dropped your Reviewed-by and Tested-by from v2: they were given for a fix
>    to something else.
>
>  - Not included, happy to send as follow-ups: clearing empty_domain after
>    iommu_domain_free(), and hoisting the unregisters to the top of remove()
>    as you suggested on v2.
>
> Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls in
> rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one this
> patch produces. VP9 decode stays byte-identical to libvpx, and five
> rmmod/insmod cycles leave dmesg clean.
>
> Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
> Link to v2: https://lore.kernel.org/all/20260518145414.64514-1-pavone.lawyer@gmail.com/
> Link to v3: https://lore.kernel.org/all/20260717150440.77079-1-pavone.lawyer@gmail.com/
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..0ec3fca9cccc 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_device *pdev)
>
>         cancel_delayed_work_sync(&rkvdec->watchdog_work);
>
> -       rkvdec_v4l2_cleanup(rkvdec);
> -       pm_runtime_disable(&pdev->dev);
>         pm_runtime_dont_use_autosuspend(&pdev->dev);
>
>         if (rkvdec->empty_domain)
>                 iommu_domain_free(rkvdec->empty_domain);
> +
> +       pm_runtime_disable(&pdev->dev);
> +       rkvdec_v4l2_cleanup(rkvdec);
>  }
>
>  #ifdef CONFIG_PM
> --
> 2.54.0
>

