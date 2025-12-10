Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A3D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/r5pmiJN3v1AskOwuE+i/A+81DVzpGB+VpOdZFvUf8=; b=GrjKHE7dJz2tJhUT+Zbg0hO0jZ
	MUJrwPJqjtAHy3+Qr0PzF28q/6Xz8EXChSJOQHb0Fhu3jofxFeRjhjlAw+qZLrpWmSR9K35G5ug15
	Z6Jma7uX0QAdopkU7lJVsIYhGHRF+KtqI83OacCu9qGA/cI0TKYcCNpI4DLY/NcuS/91XWw3og6oI
	R9FOnah0cz7XNucLzNb1rVtJh/N/BfPVf9U+gwnu0qC0XxURB1jXQ3iotHjMs2rWuNA1EjlwzaVBX
	+8V5FMsa4LFRG0exhKcsVviZFIfDJVoWqawivE+EYKnHvjZuJlUWvtVe05/63uvm0Z3tJs4FSEKCT
	CUZyRQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFHI-0000000FESu-3fBQ;
	Wed, 10 Dec 2025 08:10:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFHG-0000000FERr-0m8p;
	Wed, 10 Dec 2025 08:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765354222;
	bh=hAQnAi/fXsMW1KyzUEUN13mP8zTSDNw3Zz+EQGCHeQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g7io0WfbYA7eXtAQztLl/y1SkRerM9o+T15i4KdR9PMoPoxwUH+vKqTVTWhWN96so
	 P6Wwb9Doam0XT6o3ft8aFw4syl0vsQrFF5QXUg0PEoizysDsYHawC/B7J3qy39J+kC
	 3gi/B3gifC/+cF1zZz6Ouzgv1+c1jEupzMtDazFt87sZTQ7+aOxSl768943G6SJmWP
	 n9gKrT18/rpqa4r5TtEtmU5elBpQr/wGqjmPfVTIqd4FwaFzlfPBUmHAjH2YYlE1De
	 RaN9RSXCQt6Xa339IroW/u91wnoQLqYUvjtKRWuyLbzcFpgqQATieAujFlfc+2DRU5
	 iJKVJctxVPyPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 823E917E1122;
	Wed, 10 Dec 2025 09:10:21 +0100 (CET)
Message-ID: <17d99a64-8648-4fbc-9b7c-581f882d02a1@collabora.com>
Date: Wed, 10 Dec 2025 09:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251107141303.223254-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_001027_466271_231422B3 
X-CRM114-Status: GOOD (  22.98  )
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

Il 07/11/25 15:13, Marco Crivellari ha scritto:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 6559d72d5d42..9083367ae2e4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -255,14 +255,16 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_free_mutex;
>   	}
>   
> -	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME,
> +				      WQ_FREEZABLE | WQ_PERCPU, 0);
>   	if (!mdp->job_wq) {
>   		dev_err(dev, "Unable to create job workqueue\n");
>   		ret = -ENOMEM;
>   		goto err_deinit_comp;
>   	}
>   
> -	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
> +	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock",
> +					WQ_FREEZABLE | WQ_PERCPU,
>   					0);
>   	if (!mdp->clock_wq) {
>   		dev_err(dev, "Unable to create clock workqueue\n");



