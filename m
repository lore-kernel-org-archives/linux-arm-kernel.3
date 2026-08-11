Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856CAC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3NfUAs/yg6NvfYWRoM6IMaD7EPZVmGmM1y1VGAZJAo=; b=NEJ3l3luqgcrYI0zw9Zr5M4WAy
	zPIEY8fxr5dpdakzPo9pLWbCmsUGxIBDZeMl+RxLMYWYg+7GYV+hJEH1uWSnxTuKoFmK/eij1QgFo
	ngkI1XrwLgS9CfZuEc/IbrH6TGS0Go41VQHioplCvKUaCowhJa/VAgMVBNpqsStOOwyurKBGRMq8E
	IBcUyVl5ncx1FEYlrJFfmMkt+hZCS7rw250d6GAXlgt5tWb0+ckgryOxQbJj66OW94yrLnt1jVXc0
	toLxzfQSVx6Io6gCrV4Hzg7yuI9qwpAqrE0BBEnx6b6kBbQCB7de7rgVKaYWK8E/VhdGKCPA3qQ9y
	rGZhVKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmey-0000000E75e-2Dcd;
	Tue, 11 Aug 2026 13:36:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmew-0000000E757-2ksh;
	Tue, 11 Aug 2026 13:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786455402; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D0TPzENdxefpJxJwik7lnoq0yeCwSdF5CRbkNLU/9kVO68M/xJBBnR+p9MDSAhUYaZWUQt0eKf4Pc+NarqIUkZbp0Lx2RxXMKrRs2svSQ1cCfd2W/jldeItbf8k3CM6w7JaHHAqHlPHVD/FAHdrEmtaViu/LZiKOz563kAL+fCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786455402; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G3NfUAs/yg6NvfYWRoM6IMaD7EPZVmGmM1y1VGAZJAo=; 
	b=Y81tdimYn9i5F6FdEo2COlkhmAxtcoFxv5ph5u3fAAmru9nyH4qCibBd6NBxHNru9Cb8Xhxnth9IxrkfhhXSgKtD4ZJ9UGUVx/mfVoUu2KH39G0Ttl01nS2NKaFNzN1DSaSe4+K6t9SRSu7Wf3RRqkc/FAMuJcnNDZ0trgfS+z4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786455402;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=G3NfUAs/yg6NvfYWRoM6IMaD7EPZVmGmM1y1VGAZJAo=;
	b=Cr9DQ8GppoI5XwYAXVTpgUoz6jD6ca3J5VOYTAd0ayPr7RAxxXWeOAn/lfVrLE9G
	ODgINZl1k1ipZrf/cC+C8OGNAhS/Jq5BeaWr3gRLOjcrDGbhXIPic+8Z2c9fznjen1H
	XdMB+4uzMhbBjsbw26IO5N+QHc10FjN3uMjVgT6o=
Received: by mx.zohomail.com with SMTPS id 1786455400413839.8405244833747;
	Tue, 11 Aug 2026 06:36:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Brian Masney <bmasney@redhat.com>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: mediatek: mfg: initialize prev_o in
 mtk_mfg_attach_dev()
Date: Tue, 11 Aug 2026 15:36:35 +0200
Message-ID: <uqYyyOonSY-BbJQAbP_FjQ@collabora.com>
In-Reply-To: <20260808150506.78534-1-kmehltretter@gmail.com>
References: <20260808150506.78534-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_063650_767709_FC1AAFF3 
X-CRM114-Status: GOOD (  17.93  )
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

On Saturday, 8 August 2026 17:05:06 Central European Summer Time Karl Mehltretter wrote:
> mtk_mfg_attach_dev() reads prev_o on the first iteration of its loop,
> in "if (prev_o && prev_o->freq == o->freq)", before prev_o is assigned
> at the end of the loop body. On that first iteration, evaluating prev_o
> reads an indeterminate value. If it is non-NULL, the condition
> dereferences a stale or invalid pointer, potentially faulting or
> incorrectly skipping the first OPP.
> 
> Initialize prev_o to NULL. This matches the intent as well: there is no
> previous OPP to compare against on the first iteration.
> 
> Found with Clang's -Wconditional-uninitialized.
> 
> Fixes: f08e7a4e8d6ac ("pmdomain: mediatek: Add support for MFlexGraphics")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> index 53bdab66cf157..9a8a38d98cce7 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -657,7 +657,7 @@ static int mtk_mfg_attach_dev(struct generic_pm_domain *pd, struct device *dev)
>  	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
>  	struct dev_pm_opp_data *so = mfg->stack_opps;
>  	struct dev_pm_opp_data *go = mfg->gpu_opps;
> -	struct dev_pm_opp_data *prev_o;
> +	struct dev_pm_opp_data *prev_o = NULL;
>  	struct dev_pm_opp_data *o;
>  	int i, ret;
>  
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>




