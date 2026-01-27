Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A28D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxLJbyzq0obe4KNPLIQmlRLpVx7gXGsUdWL42nC0oZU=; b=SxW74iSNuDB6sZf79GfE5krZfL
	9cpbgNgu1MFxxo9WQl2HmS6p12qYxe8sNftfvig/AMPRLBLxkpr24pU8uepGOQHej5+Oq4Y68l836
	UwRW1COaO1CxrXDSIGjyjdBb4/blEKLZSM7w5FyHV4owWNz58b39cDPOJgAIhgafLD3s3Oe3+X1Bc
	DcXtY8SGjSD42ha8EPIQGzxzb5jJW+CucpnH2KgNKuEDPml/MjjNvJuJUI3vtElSutl2Gro/DfLYE
	Wr99mvN9iy7+Nv0V6tPWyjXE9xj0xWlgFr53s3TfKiz+2yrpSqmYUyVOb6DMdKVJRnFrAz075FR2n
	/v8uT0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk2m-0000000EOJO-1Tiu;
	Tue, 27 Jan 2026 14:27:48 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk2j-0000000EOIw-1Ubn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:27:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so4931180e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524063; cv=none;
        d=google.com; s=arc-20240605;
        b=BkfRIgcQl/NlQRDgclbabFo6bbH/PjFL9g1UgAHEteAmZByXjhx0UCSl4PXaz9OPXN
         XFL+V6OlD+SehWlpaeIuZA+3P+7kqOMvKalUsp+MTP7NZjHvWtU5ciLfjtO15yH1Lsak
         cbjqrJ88zjyGNIn305Sfjk5yS48c9i6waZBI6ifRsfNEDwS7u8jhmhQQAH7X39tklYfG
         RQtKXPjzMtsXCR8SK3NCjsflQ0fWmWyMgyCBwp/hsEpfcZWJEGYhDjJswuQQaZ0esg2x
         FP0a6lZz3n4aorB466vqD6hCEUiPmTiiVTfuB2czphPgYcJdgUa645QLuMmUPKs2R/I5
         Ywdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RxLJbyzq0obe4KNPLIQmlRLpVx7gXGsUdWL42nC0oZU=;
        fh=oky2ispCIfXBm0FzlVhTPyXzKdEui5F7Fs8hZzc5OfU=;
        b=Q2D2nBJV70N2KMjMxIOe/5vdQu2MnzIlY/KyD8QsEGVLxEkLo4u+JPj2VlL5XeUC+l
         W5JAYuyMAajifTUKVkZTaBK6V2yq9iaxalXoOtzFmhZ2AC+ykXPFYVyNLhvRK/3d/a2a
         FF08LoCvlTLs2hifnrBd1qo0wq2vJFNjUcsZVsiYsgWsqzyQU4f/WiAyI9bu++rf0/jB
         Vijel0ih9TpkjlnNAywyPJ83HGbEZzn3vdlZrOOjAPxJl2Vqh44KgMRCg+t16YCllkZA
         wIqxyodw0vi9mHq1ZA0aPxSXTpwM2UXM2XnvfUpCpCeLpJ9jybgB5iFKP0Z4nPZtG+Gu
         wvjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524063; x=1770128863; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxLJbyzq0obe4KNPLIQmlRLpVx7gXGsUdWL42nC0oZU=;
        b=JCkjDN+LbnlNHOfbJq1fkblw5QYT+ApT0ZkXuRbEB5fDg2MKpwRCvt05G9qSMfhp/g
         C6IZ9QALve6ACGrD4chWePga57tDh+QqpSnch9sMn7dyYoVhSEj4Gcfd6sAbJqSVvsCC
         O0UQLx7hdyYBhN1z4VVwlSnLg83kWX7uGO2lZimVJfUTsv5FF+70OcLYibQOABLULVi+
         c4SOk73BjBnhHBeUi38S5+OUtptgxZt0xgZh2cTgjk7AgGJTnzytzCyxGQ6t7K9y4lDu
         COl/Ev3Lx/WncLioWRckdCtVV1DiPaD67FrtCXZYuKMzj/7mHIrHFildOpd3sQyTzhuk
         oOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524063; x=1770128863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxLJbyzq0obe4KNPLIQmlRLpVx7gXGsUdWL42nC0oZU=;
        b=muG4yhJLFpsMu1oUkg1eXc3EcRCrH6GmgtHX4EqCAMAl20YAj6PqIoB4D5qirZYNjM
         tbi7gYyClTf3TOtHO7LOjjOACCIR5VHK1s3JshHg29gZFXHmp49diUDY2oZDFngPKTvW
         tfRV1GN9hS2KN9vV3eWsdFP0TRrwgQBR/CnY9iXLfBuGdov2bSEmJZPD8JEMHDUGd7jL
         yRrYXGCGy4TUjWRddK9b4YSs00JudfrnweJ1p8FD9XNHvUE/g4Jbh193eTkod1BmOXRn
         KlrsQeLfCFMCTAVCuXL52UU3UQ3moQqq3fSxTiFESQrpvkOzeWhuUusk4qYTysKgzYJg
         kMwA==
X-Forwarded-Encrypted: i=1; AJvYcCVBKXCAk7TBsffKbci3GZV1twFhtRpcpLsCTydRTX7OhPoVYLJlcHZ1dzxJYMQ3DMZQuVALesvRPZ881EGP92O3@lists.infradead.org
X-Gm-Message-State: AOJu0YyjKIbGZxlS43tum0+UqAtmP5tPjd368eIXSgXmzp0M/bd1cfj2
	YCdrKDBVAn7ZHM10oxEqfpFP0R37UtvBNJ6pJbCnCgrYA02GRn1wQwzwkq61qRPGjYaDNqPY+La
	Yqd3A3rhTaAKQSCDV06TSv3njlbdCRT43PdqAtxyYnA==
X-Gm-Gg: AZuq6aLHxo+KFcxb7bgvI7JwpjTp0GKbXyAKaZwf2wyhMHHduOOHVwjThdpPWAEA4qz
	1FJA4fa3jawln/KCtlocr81uuKwQB6yXvXpZproObpsmLCJFMc3GGCczEuKMapXsWyWAprGAPsu
	i5mpXbTdpT35j1GPwjZDAK+XvyW1yfmOnNqkQIkRVab5mgSnurv1itT3EkCw9vzzmR0yiltZxQK
	CIcsJO5j3OAhNOxgHVf5cTJMZMJjs5m8ScLLhY8lEM+zJrpb2sDnpJfxN0fVGg/PmFndwr3D8pA
	2SSIZm0=
X-Received: by 2002:a05:6512:3b9d:b0:59d:e774:db0e with SMTP id
 2adb3069b0e04-59e0401a133mr1025420e87.23.1769524063038; Tue, 27 Jan 2026
 06:27:43 -0800 (PST)
MIME-Version: 1.0
References: <tencent_E20B88FB4461F8F299301AE67009CF1E8708@qq.com>
In-Reply-To: <tencent_E20B88FB4461F8F299301AE67009CF1E8708@qq.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:07 +0100
X-Gm-Features: AZwV_Qhi8UzxlF5LVwmX4f7HQZtYZhiLDcb_EwLIgdqVDsG5Rq1NvMoa6p6uOA0
Message-ID: <CAPDyKFqCewZeQV6UVGXXuuxjPa_amThaHz0TmLpLksP1A=G9Eg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: ti: omap_prm: Fix a reference leak on device node
To: Felix Gu <gu_0233@qq.com>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062746_427407_FDD47B6A 
X-CRM114-Status: GOOD (  17.70  )
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

On Fri, 16 Jan 2026 at 13:27, Felix Gu <gu_0233@qq.com> wrote:
>
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In omap_prm_domain_attach_dev, it does not release the reference.
>
> Fixes: 58cbff023bfa ("soc: ti: omap-prm: Add basic power domain support")
> Signed-off-by: Felix Gu <gu_0233@qq.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/ti/omap_prm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index 5142f064bf5c..64a187f79a1a 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -655,6 +655,7 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
>         if (pd_args.args_count != 0)
>                 dev_warn(dev, "%s: unusupported #power-domain-cells: %i\n",
>                          prmd->pd.name, pd_args.args_count);
> +       of_node_put(pd_args.np);
>
>         genpd_data = dev_gpd_data(dev);
>         genpd_data->data = NULL;
>
> ---
> base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
> change-id: 20260116-omap_prm-c7bdd9726abc
>
> Best regards,
> --
> Felix Gu <gu_0233@qq.com>
>

