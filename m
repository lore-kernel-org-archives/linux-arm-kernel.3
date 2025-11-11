Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC76CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=; b=vq6JuO6dgd2/sXp1EqGPmHQ6oi
	1lNt6uqAxGbq7+/4fnXlfpQ78xpsOm4jYxva7Z/FCIZ1vB18NmZTwlSsQkvcXLAqHU+eFU79AmsWh
	lACuA13ggutchrLRH2/sm+PLRAmxsBMdlf6OekuyFxOxA4r/2EYl+kDGOG0fnfRChVN8qNd++GWBz
	FQbPQmQZSqz+55/rpygF+Xogw8WLyLb2VVtJPlwTHYofunNgTMemL+DLL9WKjpGVUF3E2GRvwhNI7
	OxZHaoitiVWDJluZUPVrWfLjCSFhQ7K2AsPdIZoY6ZNdluQADxGPkERXZb3Y9ZA7rVsseUgMJiNrC
	NiyezQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIl-00000007Xml-30be;
	Tue, 11 Nov 2025 17:37:07 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsIk-00000007XlY-014p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:37:06 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-787c9f90eccso45223287b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882625; x=1763487425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=;
        b=FOTeDWtUoX4QbnJgZnNB9ab9Kuf3BdPisGQCf1Y1MzyhODEdIPguKa07qbIO+AEfAx
         IrfXBRI2LF9o4ZU1yisHkMgoHsKHtoWtuO6O0HkT8IS3WmFlSIDpHpyVS+zxsYUMqxvz
         +dI3zAG3Gsk/JRzx3UHr8YlYOfAGa3wYSE3tZidKbpSOBE/WJGPgTf0/0p0SPf6GD83E
         2H5oMI26PLRM99sX2gHaKG7+rrld4mGzpU2+Q4hE9o/XJrgM777nSZRbLRgiPkl6d/Dx
         nsmPjRo6Yztj8wAITdixrMnFIipkQZxZlF8Jc6iedZE+jgLW0BgLzZg5+E8EJEjb2eGE
         VLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882625; x=1763487425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVkOL9QZX3SGwC8VnESzgQr/GWl5l8+eTHtDxUY9Odg=;
        b=AE4KTSTfz6BrboYWqIogqlOQvEYtSYn/qA6VOT3r99j8yIbmWjOK72iRpWGa5J4/3M
         Kt2mwpMfGKT1kHpF7IvdLLs1fk+uXRWU2cLjUx/KUWtU8S1Qc16HWJU/YOhQoTJ4A5il
         54bwkqJwgLa2RSjwd+MCwD+uIhD9PaQgSjT22ltY0p2gPWfkVWmwtggpoyniojvfRVjA
         T8L8BKaPKGk1rF+JIlrbcRckEJ38PBu8tEF5o1J5s8YECUAAuZYbkgTvP2Fy4wh51BGn
         nXOLHKWFlJqxPnpXsMwzXTyNlxY/2UwU7PQlOCQUiehxQao6e2QkcBY9alnKyZQg8xeG
         ToDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtwL1rS8SFBpQSUwENlH5EeEJFnoVRsxdeqTZ7+gCY2GZEwVZa2+Hh1mfjH58LtH0zbvMRcFweyN3qwAuZTBhD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwA2pZW4SMWI1g1nqtDuujQtwJavbTcAuk2A+UvKHI/1/AElmS
	V15uIbredN60LuV7eHiZpbtQS+ay/rdu2vAdQJzWFTFNfcuxqg2nRWCGC93IIhGP1YelVElrboQ
	7sYAFI1Nb0LUmfx3fI44Xha01p4VFsJPYzg+Bp3QLUg==
X-Gm-Gg: ASbGncuALqIs/Yq3WyIcjqbdSGU7Oz34j9qtENv/+MK9XAbbSvx94ktOcGSpBEetQe9
	d5J19P5UvjPEtFunrp9s4KHxPXiEj3+eJn2izgTbKT7iNc++wNffXzj0H0T6GbSP9oY6Y3kRoCV
	WN9SnVXFR2IoYHWFS0o3dVcMH50e8R/dg1j71J4jxuye/98s437lcrAGHtI5CNylC8fZl+C0xlK
	F7m/U384c1EvAJ1FykijwDBZ+2dQAk5zj0vhvRK40SQ++ov2BBAE34O1h5+LcSQmc+3+VnkMsTO
	JPu5KvM=
X-Google-Smtp-Source: AGHT+IE9bOE8QuaDxevERnXGMwxyKuXPLVIGn9fuMsvYZZWVI5o61gMBE7ecmjC3IlvCAc62kGl0QOYlCbs99m4/5oE=
X-Received: by 2002:a05:690c:2021:b0:774:cc25:7f51 with SMTP id
 00721157ae682-787d5400960mr102720837b3.36.1762882625058; Tue, 11 Nov 2025
 09:37:05 -0800 (PST)
MIME-Version: 1.0
References: <20251105145824.239054-1-marco.crivellari@suse.com>
In-Reply-To: <20251105145824.239054-1-marco.crivellari@suse.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:36:26 +0100
X-Gm-Features: AWmQ_bnwqubEIg9CpgOv8nmNo9i2Cpu9HPEm5MczRr9wHyBCajECUb_uyu5SNtk
Message-ID: <CAPDyKFpVS9Z86D_QLhjvOYFAbXaa4_Z=ZQnV+x1ZTuXG4x8oXw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: replace use of system_wq with system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_093706_061502_21FF6961 
X-CRM114-Status: GOOD (  21.23  )
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

On Wed, 5 Nov 2025 at 15:58, Marco Crivellari <marco.crivellari@suse.com> wrote:
>
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>
> This lack of consistency cannot be addressed without refactoring the API.
>
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag:
>
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>
> Replace system_wq with system_percpu_wq, keeping the same old behavior.
> The old wq (system_wq) will be kept for a few release cycles.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 79074291e9d2..daed659f63f6 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1214,7 +1214,7 @@ static void msdc_start_data(struct msdc_host *host, struct mmc_command *cmd,
>         host->data = data;
>         read = data->flags & MMC_DATA_READ;
>
> -       mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
> +       mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
>         msdc_dma_setup(host, &host->dma, data);
>         sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
>         sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
> @@ -1444,7 +1444,7 @@ static void msdc_start_command(struct msdc_host *host,
>         WARN_ON(host->cmd);
>         host->cmd = cmd;
>
> -       mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
> +       mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
>         if (!msdc_cmd_is_ready(host, mrq, cmd))
>                 return;
>
> --
> 2.51.1
>

