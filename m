Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F53CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=; b=eAbEytWcMvozoka3qX6C0feGIH
	Uikf5ucB8DhlN8X0awmYmZuuzUoWoeqNIM2Ln38e0A+ra+SGE1lSo0CCfI9bLMHORE0UsvMUtuF1X
	Du+bP18CMOAn5QyCApk02iaFh+RDEIIRl7oReT6+2IENx0bvKMMgsvU/JfFX+t2gpATgBrNv3Zrfr
	Yxfotl8v8CZQh884rBikrtBrridWPlLC178AmP9nNs+yqNQMh2+eyzvcQsZqnmDHaTEVBoXKpNpMj
	JITfm0KIHXHwtvlNu9K1iswHKGz7pdiup+WnKkS6/C6AgWqbvWy4vuo0Anl8icQolWOhHFnEpJwh1
	Byw9B1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Dl-00000006Ss9-1ma5;
	Tue, 23 Jun 2026 14:35:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Di-00000006SrI-3vP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782225322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
	b=BohkeG+7LvLemxzBDhuSN8755b4KPdef6cDPcnycBUmHFQI1CxJc0aDAkvycWcAkeTt9w8
	1EBHQciV/O9TXm9lVK9RPzhSyRqUgVoZRnr3B61fJr2luGvjP+6BEdqtZPmKiH81g3pFoc
	b+HWnmyoKPGBIHiaWNNpM9nRaKVJOdM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-9M36ZeWhNYKe0pPhrKVQBg-1; Tue, 23 Jun 2026 10:35:17 -0400
X-MC-Unique: 9M36ZeWhNYKe0pPhrKVQBg-1
X-Mimecast-MFC-AGG-ID: 9M36ZeWhNYKe0pPhrKVQBg_1782225316
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso64806631cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225316; x=1782830116;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSWVR0//HeUMGIesSUzOzzGnHMJ2w79THlL/muBHE0Q=;
        b=h7AYc5mSoM3EgBWkJbzS3cUseepzey4vCPEexyaogQMMthnHEpYC5GLdOd4NirFvBJ
         xaaqaU7fAMEYdSKVBSZZrOmBJepiUnVSXJ6OuPuboUiPTjzdnwj4Mao6FlIORh0IE//k
         8evZQjdBX+rmMKULux9Oem8cBoFRgf1pF0rwTLaV5OAL90/LesDVxZ8OuzlYldkiE9L9
         oDYlCNqSNvcWn/uDoVaSI6H3qJf+oeRFUf5M1mAmJRnC3pt4deiW/ukSO36B6A+klYgj
         vTliC3Xm2vV/qOoubDXsDEHZPP82GdcpC6BuMITsftHE72y1gGzRnrV4S6pPWTlGiQUL
         ElXg==
X-Forwarded-Encrypted: i=1; AFNElJ+sMF0wq4hvbtytEyGDL8MjBJjXMu9RH+ZDuZRiHO58KD8RO89rtzyGmULb3NjZzrdcVGg09WI6gWYsFoteEAcz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlb59Qp4eFWyJgYB0pXkCzQxvMomjb5C3p10PzGMtome0LUEFT
	BiZj8MqAefrL3O7hlcIWzbVuW+L7FFgNTWuGNACzBPHPCoh+esZbNoA1SVWMIzqKQK7PoFMEI3v
	RWNkkhRU7HOQxNE6S99TbwdlMtpBqtueLh5PVZ99Ohc6nTvjOoOsxFplJwJ9m4TzsgoOtPYNLdU
	tk
X-Gm-Gg: AfdE7cntmzdXPHOy3E6gZ+VsRtRuMFtn1RkHF3VxyUOT1+Wylvm3hmTJlDTyK2oTLa2
	PFKZN3y789XKjUJ/oFgEMKkqYexoJlmapy+68FkTa1oScqyb86Ty7L12CkQSqd3HjAvetZ17/7q
	C3NZtpdc+OEU6MMulC97Nqh/qtsSUktEDrsUJ+x6CWjGh2x7jv/k3M9IwYfAdIz5sOD6pESBIeW
	TF5a6A/kTAXyIaNqSV7k9uHfNPDRAG+SCtjfnutu6VF4DAJMx4dn20H71I0wYzLtzwsF510G0fC
	qh2Ot8xLu7u8QCjlWyR/MkTuIAEDDhovAyrFMFer7rhAnIrPQHoCKZSdr7I4cj6T7nIZa7wU447
	YuVzAVG3TtM/VEaHbxiFuUERZMBjYHlzRH88rY+hl1xj4RQ==
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281782351cf.6.1782225316327;
        Tue, 23 Jun 2026 07:35:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:517:5e32:af20 with SMTP id d75a77b69052e-519e490624dmr281781791cf.6.1782225315666;
        Tue, 23 Jun 2026 07:35:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51afc29csm24695621cf.27.2026.06.23.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:35:14 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:35:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Message-ID: <ajqZoOv-TvmOMLCh@redhat.com>
References: <20260623094125.95791-1-mhun512@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260623094125.95791-1-mhun512@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u4pDvVAVhnQtwIO3RQzct8jgC1pqR9dQygZ7p1_zjZY_1782225316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073523_038255_25EFE83B 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Myeonghun,

On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
> clk_mt6735_apmixed_remove() unregisters them on driver removal.
> 
> If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
> probe returns the error directly and the remove callback is not run. This
> leaves the registered PLL clocks behind on the probe failure path.
> 
> Add an unregister_plls error path so provider registration failures unwind the
> PLLs before returning the error.

Please run your patches through checkpatch.pl before sending.

> 
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---
>  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> index 9e30c089a2..04cf9665ec 100644
> --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
>  
>  	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
>  					  clk_data);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev,
>  			"Failed to register clock provider: %d\n", ret);
> +		goto unregister_plls;
> +	}
> +
> +	return 0;
>  
> +unregister_plls:
> +	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
> +				clk_data);
>  	return ret;
>  }

This fix is correct. Since only one path will encounter this, personally
I would just put the call to mtk_clk_unregister_plls() inside the if
statement above to simplify this further.

Brian


