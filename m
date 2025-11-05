Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wy12/dAo+31ps9A4XEhL3jHyntcIvsl/uY/5+eeyUCA=; b=GoTOVyDlaWiLp5bAKW/m+rytO4
	yxnP4J3Ka8FO0JtemSPU4Z0ZuWme4ecFI3+Zk+Wt/5AR2P/mEngDVF3Is9zkF1+I2fNA02W7dtm7F
	EBiJQkd/vO4K2rdUyB3PddaHHIF88gb9fZlW16+N0LTj62A1cgKMshn3n7fF5bkjsVBr3ZBaYURog
	wHWaJGfLKUzr4/F8Iouxli1P0ZjADk4giTMgTdjhjLSGg0HmyXpBsR5DInWSVLtY2gHT1OKMgEcQ5
	ky/9KF/8RW+KhO+tc5Nv3nBSEb3ZFbwjiEO9uLry7Nk9W8+ndGJE7Z52QQAbHgd5yZflDauIIry+C
	xyVxbjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfcH-0000000DxfJ-1ANR;
	Wed, 05 Nov 2025 15:40:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfcE-0000000DxeJ-37SA;
	Wed, 05 Nov 2025 15:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762357202;
	bh=0AdgQPQBQ5614CjYT/8ghpUX8jPll4myC0xvjOQOOok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZD++iarPdfmEmGSj1omdR9WANjbaw5AzqcYKP1gVT99Qw7B/ERi9BaJj9ivLOCLiH
	 JLTrxj8wlLOijYKCLwMjkHb95chWXF+dLFvkZZTYGYpvu3aa74O/Bo5565hwwGRWQ0
	 XcqgU4TmipCfL3kpWPfl8Mn6E/JsyF3DGw4FDxH4HHDieKNHu+lGPnpmnDph1ZeAr2
	 WQr+SXIqgEctCtfbbbV47mGMpk3kY5dkB0j02h4PCFRiLg2uy64+WkrZ9vfOuIWLv5
	 QR8EnGKyugu1G2rGlbak9+E/zwb+p9MCOs1/9DqKvuOfzUvygp+qGhue6VCwu3vjQE
	 DwofNsOWqt4Pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B1FA17E1091;
	Wed,  5 Nov 2025 16:40:02 +0100 (CET)
Message-ID: <9fbec168-295a-4278-93f4-e27a419c892f@collabora.com>
Date: Wed, 5 Nov 2025 16:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mtk-sd: replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20251105145824.239054-1-marco.crivellari@suse.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251105145824.239054-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_074006_975853_E178C2B5 
X-CRM114-Status: GOOD (  11.63  )
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

Il 05/11/25 15:58, Marco Crivellari ha scritto:
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


