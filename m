Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E633F3D610
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=; b=Cs8Qr7GS/rs2yOiCtvv0ZEvSt6
	3t3bPCTODM5gueXn6O9v5BIV6qE3PoZBUaDJ6lfigt+C13agBlnGaxUyAzChUZuvAM4rqo6mSOTov
	V+5/UVsIwu7xg5oArrMBgjXB4HtliDnf43ukeGX9q2Z7Mmr3xHStvT3xMaCX4pxAmkpt4naWwPuim
	bIcOW1p+MXU4KMIAEDsox1xP0mFFWsLi4/Qebayv192uJBuJOMTDpsUhi3To7o5dKEHqMwFQBBd3i
	EDbaxEJjmKA0m2nm9yRy8fj+gqJIpBZ8gFA5YKZuZBds+3Y+Ruui8LGQy0Jd45XC3v0B5W8dC6wv1
	B2g/76hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sr0-0000000A6Xu-3Qeg;
	Sun, 29 Mar 2026 16:19:10 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sqy-0000000A6We-1pIP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:19:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d9d929e27aso3131621a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801147; cv=none;
        d=google.com; s=arc-20240605;
        b=aW34nwt7JI7u3SmV+WGN2I4uQoBoOQwtgvPtM0VSZoTmM5z1pEJclNI7/1gm0nnysZ
         IZSjy7J/8DuLwKdtdmRAajpkG2DRkSyTT3TK9UjuQh0fgd9Nz4s4ThC/CVH/N94WDGOh
         8o7kP7ir1uMUBZLXPVdN8qQdIft4Ufg3AhzgTV+NYfM5au69B64Iu4u76yeFhbCp23Pf
         pnidu/2Ht98gwDJVqs3TCE2pRDH2jatXuT604GoHOruqINdAAu5OC9MK3PzNvo6+uIiB
         ZdYU3GwXTwrD2vqnxAj6ADYCFrl2DFfMNlLipuXHj0kzR5w3UzuQnAkeV5TvtafdTAF1
         IC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        fh=nvSE4mX5rPDIebhsZsOCBgcZFOu4dWleXQNA0xEvoLU=;
        b=Mk4sqRkSn7uxNYCZMXf2taaaE5Swogb+9S3xJkhPEfu8FAhFm4VaywEeyta499sRXT
         z5I44THiImOpbXQx20QsI87mY4UKTX2zQUMmEdln+mTEe+ZViodHez7YwrcpLv3IjeQh
         uz1+acxH2SrJc82IH1BfwkZ7IRpMV6Y/IvmjCvpjE3JtwA58AmqX5I4FZMgTdVvJmSVU
         chT1mChV3xpti9B0B+QB1Ls3N3kgyPQJBK6T0sFlztdf7GKmUAXPwqN9qsMYVnqgrxw9
         xGwkoXqa9TelU6vDudO27nxSUww5v5Uv0VSYnefRljQHzdWfmt0bAt65N0p5h8tCSP/M
         rLhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801147; x=1775405947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        b=JMRlTmwJdfw+ZpSKbKOLx1vfv4HEhmKXoIkrNsTOXcvXt1zrkSTtJoBKYx4TVTtbPH
         M7l4ovoRsYkhB1Woe8ynFJ4q8Hn927nery/tv+qFl9pS1a5XcoWZUJa4q93pxf6zHxw3
         UI7l9rrJO5JcqU46Myhywr5hfW+olwTZPHLtML1g/1929oHOkPg4Q3tpfp7/8ntW+3OX
         oviLL9RYunlx2GYVzEIQZugwvnFVRbparOsappOM8qdANjwDVOGp4m0fq3GINY70IYm0
         3bUKYtszKA0wGYUJfmTI2BOAVvHFDbH19ddu090b2EeLV6WITnbz9sfT/f5jgZ2JdbnW
         KJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801147; x=1775405947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEm9m7dxQ5iQP9UmmPg53kE3LH2ArVB/tcgnz/gczt4=;
        b=tUosy3ze6MNkWmLiOh7G92YkPFsxKThgGX4Mm/4olenHcrVZ/vKJlaY4CAarYQ68fW
         QJIWDuCvy7x+oTVROdDEWEDu4lOVnVs0p8v5jFhIhN9f32zPj8+qXkvXCT699iX2JtgH
         mN3pYoKoIEFxNDs4Gwuy+HrTodKy6BGWkSygZa/4tbW6IXrhGULqB70sCyA+TZT2isRb
         HXIM2sCA1stfwtv/+QfnH8Dx3bucfpQFNyirxP3wxk/ymHDssPTy6zLmc4JTk60EkkRK
         K3dZsvTQVOFP8MAU3/xfRPyN158aj98z8rZk75OHxJs3qwZfmiChgV4qQL5msZMwGcJc
         j9dw==
X-Forwarded-Encrypted: i=1; AJvYcCVMTrnN4RR1Vqc5+RCky9eGf8CobAMoxEwkQ3pBXavlhf5sYjha6ot3mlTgmrXbdPXEd0EcWku4fyhplB5tPPET@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8EFaAolSCwN9DenPJvU5NiGrXVbF/hkCQ16wY6vJu5DoZuI44
	Idy33ijusSoZqKTvxDny2GN4Za1qvm8ydBFny2jq0oERBPSQGnJskD3gwHS2J4o9XDmDyzfI4mJ
	GvyX6Nc0+Umjwl5aeTVg8Qjp71B6Var0=
X-Gm-Gg: ATEYQzyIwssTjU2+dvxfENCFXuihG9ITfX2Mw0R4panDhYHFQhxE1efdtLEYbPWDBQ5
	EZZX1zESm9dmPTgKwmTevFEwRa+6+4DID4Upzt/jardE0VupTaHsDnIpj93K4pwVxkBF0cJZIrr
	Vd4pPZjAeZMVTA4v54xFLa8O2siKGYz3yLJWA7N8i6msYPgcz1le6kFHuKiZwBC1xggaJ1Jaxab
	tS63PV12h3Mh8Dam6G+PbxgKDicODQBlThH1u36UER9j0OV60LWmueqw3PHDRUPqmhLD1aICIzo
	B+wfw9PF
X-Received: by 2002:a05:6830:8292:b0:7d9:d2b6:155c with SMTP id
 46e09a7af769-7d9fad972acmr5592504a34.2.1774801147392; Sun, 29 Mar 2026
 09:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260323090742.1522607-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260323090742.1522607-1-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:56 -0500
X-Gm-Features: AQROBzA7xXjIQ4tkZaMphxv2Ps8tgRrWBc1wi2mt1Aa8d2cIxfJw63Lhb39TBHU
Message-ID: <CABb+yY2J5CoWcBZvf-o9jgpjYFC5PyXSpnH9UEBdNYj0rAGjEQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix CURR and END addr for task insert case
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_091908_476571_C1438139 
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

On Mon, Mar 23, 2026 at 4:07=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Fix CURR and END address calculation for inserting a cmdq task into the
> task list by using cmdq_reg_shift_addr() for proper address converting.
> This ensures both CURR and END addresses are set correctly when
> enabling the thread.
>
> Fixes: a195c7ccfb7a ("mailbox: mtk-cmdq: Refine DMA address handling for =
the command buffer")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index d7c6b38888a3..547a10a8fad3 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -493,14 +493,14 @@ static int cmdq_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>                 if (curr_pa =3D=3D end_pa - CMDQ_INST_SIZE ||
>                     curr_pa =3D=3D end_pa) {
>                         /* set to this task directly */
> -                       writel(task->pa_base >> cmdq->pdata->shift,
> -                              thread->base + CMDQ_THR_CURR_ADDR);
> +                       gce_addr =3D cmdq_convert_gce_addr(task->pa_base,=
 cmdq->pdata);
> +                       writel(gce_addr, thread->base + CMDQ_THR_CURR_ADD=
R);
>                 } else {
>                         cmdq_task_insert_into_thread(task);
>                         smp_mb(); /* modify jump before enable thread */
>                 }
> -               writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata=
->shift,
> -                      thread->base + CMDQ_THR_END_ADDR);
> +               gce_addr =3D cmdq_convert_gce_addr(task->pa_base + pkt->c=
md_buf_size, cmdq->pdata);
> +               writel(gce_addr, thread->base + CMDQ_THR_END_ADDR);
>                 cmdq_thread_resume(thread);
>         }
>         list_move_tail(&task->list_entry, &thread->task_busy_list);
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi

