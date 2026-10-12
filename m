Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB05CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 01:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=; b=M2N6PPO9ZjWgBWxmT3oIkzN5Su
	gG71Vw26qTFLRvF9q92vKpQGPYdKsZmm6IKM9//N3VoeeEEpBJicRMWlHl44IknI9oeMiv5xiJXvE
	b827biISAnjR2tsl4HMi0KpATdAllOlsvpfUGNAkXlsFZ83A3Tse1GxE/oAZZBoOBZ5JISQ2eFpqe
	/iqok9mN5SVnYqzfRRYFcU4IADZG6oy0FI+GGiMobNheitEcqFoRx/akPQWY6tkka92TmSbdzdvo1
	bTnyDMDDG4h0LRxrrO2d029xnycxdZY2GkFhyISW6PfI2LPSJLgdqto23jWsvrgc6vEWBm7LZaiJc
	LpJa8n1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4y2-00000009YmW-3y31;
	Mon, 12 Oct 2026 01:36:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4y0-00000009Ylk-00uH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 01:36:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so1906516a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 18:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768998; cv=none;
        d=google.com; s=arc-20260327;
        b=GirYCfURLkEQD2EyPNufcm5mH4FiHOfxOillUSJ6blbt34ahpJ04NVI1z9hIJ30b+F
         1ZlzykgXI5IlYoDJSmX1xJb19kUpIjfnZzXHr664PccgyVviNCR/oDxu9PxABwuR6xA6
         yf7oe0bm8QMwnrbIHhwksvDFbJ5AVKTU2CAo386O07PK4HF5H22UdPcB8zYwZocq+B0b
         47JEHgjh1tFPROv/h4yBPcOy44+b1nqE6ZWW/fY3yaWZbB/jwS3nfcOf5QwMA05f5iYm
         /SlX/VtjuIzY3NeNHZ4XqHb+5ygROBMuOeWOfSjD1dHAICO+YXUm2wEk7U+pmZY72w6z
         MEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        fh=DgFH1Bqdqy/ejOoECrwUi36TnzHUBjNm0urt5U5KdHc=;
        b=QBdtIn8GH+AEGSHPOeD1U6XTbU8gYUdsU9qqznkscEUdXgFyVaMs4ldT/dHIAktdCO
         E3L2rI0pU2bLzI/o8ki56hk9qWeXlCLCs/YK09b3TfC/wEcUy8cSnvBUwc4iXQAL1Y1w
         OXO3GxPjl57zujuwRGKLV6jQXZAPcne/waeNQFmSZs+dp9d4/tHxYcoRQ/uqJ9CMwrVC
         tQ5usihiD/RN3oeK2uDHNK31DTlJi6uuGrzWyDRJSxD7wKEn8HejlP1kLCbbytVlSUs+
         WWekB2nUgziI/W0nV7nbuqVK7Olc9w1WnBZjIj6NJp4Q9V73Dg/Y0zVTXicpUjswW1xQ
         89bQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768998; x=1792373798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=pJsq8GtWeYu2NEziHIUA1HwV5tzfbqJWay+77ZJux2SN1dyEw0Z8VvrsqTVVwyCj/Z
         //OMAzgNGruj++ryspncdb6CIWj1ZJJk9I097uCOXqfGBhsamKNqX5DliMn7Wz9dkMUq
         pgY8AsUXJsv/gSyzg2ltFhJPE39qg4HR7QNwvAhCHShGhDKr/sBbMRviz75/UiCbZS3o
         PBCoSpvfyS0R35vSDp4Hsczi+hI58zNl1z1XCflHosPDBdkOMViRbDXqfd/oBE60/l62
         gXQzMb4JEQpRInI2i45wN2+6JgvWZIxl+0qTXM9hAzEq+4qMP6kSc6FRFhTxYzhhEbTq
         dNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768998; x=1792373798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SdnfbVL9pFpAWd31O9CWnKNvkrdORI7jh1LOwMsM0M=;
        b=B+sdN+0TqhwOlbrNLbYyNt/aLm6zBnP4TgF6+9WjtZ/t45IUCaJ691N2eEDdJ5bC8T
         2i2b6cs/K5KljvXjClEp0L1iSEJj3nRfZ8K14U7NQI1F0d8ge3of8agnTfXjRWSvS1/E
         og3cGia3f+4L+IhsGFq5DFnqJ61Myp1Nv09h+FhuRG2ZUPgU68Sqzd5/x5TPPnsLIiEo
         iBc0ptBoyp5lcw5cqXbxOk8MklqgPE8/C3CF1vA8YAbyVfe/UJ030SoyThi6Bgho39/Q
         KxvDDkG5b50BJuzrY3quVuh9OKRiaAeeG1zGKDEpNeYCPC70KJVr0ZBwRxydSfuHAlVp
         aPng==
X-Forwarded-Encrypted: i=1; AKwUvBz21krfVUeDmZ2GsWiEqz8dGQHUfgL53zD5dQt18tLMLB+e9QfiMJaOf1vz3uHKZ4XKcm0xFrx+dwKN5on5x65K@lists.infradead.org
X-Gm-Message-State: AFq9FYLg/e0oHwZGGNlIEZ1rE3979gDSI0/eW7/ojzLu/oI90Kd6dEw3
	+tVrWvPejpFhkEhSP8pQ46ShFBIWaYfTPAjWVwKsNiIjT42jjXPmbb9CzUj5xJFHeFo0UOK+XNP
	5S80JJjwwIwa8fEfRjnl+klDa8POXpQO85z8vE8c=
X-Gm-Gg: AYBFou1UBzXPRSle8n7YiGLqdDbOYfK6cXOHWiuKcYTRxmnSCiLSrTlM6P2h99eHohJ
	8KuActmXWPFHKlHf2hrqVDXFsBphyLNmyo00mCc/yoIrWtIDbDoq/AxTldwA8C3S8WEN4/05gFN
	AXucLpL3Fb3MGikt+1cA9YafRHsnVSC6/WQt7FrHZ6mHt28POEeF51Z4qOddbdtp70kpC0h36zD
	5np4KxF6HMybEFhj7CIzMDysXo6tLm4MVA7u8mrjPFKo6VHQBoaibXC/WwvAGlpSVU3+mhfYg0j
	rI0P/tK/xILMpashN6jN5xrAXMfXvQwj/V+AFdHfZLyBaZO0hNlrmog1
X-Received: by 2002:a05:6402:4512:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b17c26e26cmr7148152a12.30.1791768997999; Sun, 11 Oct 2026
 18:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260917093923.2145007-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917093923.2145007-1-vulab@iscas.ac.cn>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:36:24 -0500
X-Gm-Features: AclHuK8Xsk6vNaWsbsfsc6m-jN-PLUBFBJUyFrXzBO7nFbW8E4MZEEKbb4KwlQY
Message-ID: <CABb+yY2ZnisPFR1mXU-E-KEa6SWz2pKicYMeo13PCeHwpW6oAg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix runtime PM leak in cmdq_mbox_flush()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, bibby.hsieh@mediatek.com, 
	ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_183640_059968_E9DD740E 
X-CRM114-Status: GOOD (  19.14  )
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

On Thu, Sep 17, 2026 at 4:39=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> pm_runtime_get_sync() leaves the runtime PM usage counter incremented
> even when it fails, but cmdq_mbox_flush() returns the error without
> dropping it.  The same happens when the GCE thread does not drain in
> time and the function bails out with -EFAULT.
>
> Undo the reference on both error paths.
>
> Fixes: b0524f7c9635 ("mailbox: mediatek: implement flush function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index eadd340f8fee..07a8c2382c93 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -565,8 +565,10 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, u=
nsigned long timeout)
>         int ret;
>
>         ret =3D pm_runtime_get_sync(cmdq->mbox.dev);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(cmdq->mbox.dev);
>                 return ret;
> +       }
>
>         spin_lock_irqsave(&thread->chan->lock, flags);
>         if (list_empty(&thread->task_busy_list))
> @@ -603,6 +605,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, un=
signed long timeout)
>                 dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x don=
e\n",
>                         (u32)(thread->base - cmdq->base));
>
> +               pm_runtime_mark_last_busy(cmdq->mbox.dev);
> +               pm_runtime_put_autosuspend(cmdq->mbox.dev);
> +
>                 return -EFAULT;
>         }
>         pm_runtime_mark_last_busy(cmdq->mbox.dev);
> --
> 2.34.1
>
Applied to mailbox/for-next

Thanks
Jassi

