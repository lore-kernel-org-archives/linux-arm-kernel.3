Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA8C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=; b=l6i4vpO4fdCF8vaAzM/JlXmztK
	Xq7YujKcHLqWPvN6eKWdwHHovf/p00/6VO5RFTM12+b1ZO6anEo7jJBh9wrSDSxUhTuX526BxYKvA
	YjbXNmY3zV9/neiWjn6PwrNPQIcNtXtGpE8+GFej1WvFu/8TvjCFkFOYVjCLefa19ETfGZgnz74Tj
	bP4Cfh+0ah2FRC1b/eLHGRSAqporK+E2az26dgMKcYOyumCGzH8ByWm5U4vAmNaFavjKdfUfuk1s6
	9elJTAWc3/Jyc9c6Z63OsbXf+nzMWBgdm4FcUpY+/u9w5FFcy0eal/D48zdcjDD30W+t7f2i663by
	lRA7cHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojB8-00000005YhT-3Krx;
	Tue, 28 Jul 2026 14:53:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojB6-00000005Ygm-18vO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785250387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
	b=I2SYn0x4hwVHZwaGWSpoJTDoHNLiedPbyZymFNqgfR1f/cAQptkmZjcYXqOg7qL8QY+ioU
	G2t09YZmwu2AYK5KjoDYxLFjmTW3o+U37Npj2SpghA0ZT0Q7ewwVITeJbAUg4jf5OhIBkg
	RFaXf7aM570ZCRDUR2DQk2tDK9mQWM4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-_Bwq81y4PyGM_RzN-eMRzg-1; Tue, 28 Jul 2026 10:53:04 -0400
X-MC-Unique: _Bwq81y4PyGM_RzN-eMRzg-1
X-Mimecast-MFC-AGG-ID: _Bwq81y4PyGM_RzN-eMRzg_1785250384
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a098ea19so438582985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250384; x=1785855184;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vS5FrZdtVD7dlOeCODijrDZc+E5kS2K1TH7nZasBrgE=;
        b=W/rGmzevvsOO/P0kfQO7nCnvOlGQ99z/98apXkKftLYJ7r1I3RMb2nhFAAJvX0wS0p
         IjjssnOiqHuNURmhUDQP0FZKaQg6VUs6zbvJgNnMTnGH/OkUL7jr7mXJ53jfeONzzZpL
         RtcV5VCfBuXGLJRxEnFTC3P4M7dlP8tLIL/FUQnFVk30Rzl/Fsf+Y93rCkcc0TI9syz1
         lIY0owujErJpm53svQ7FKL9qRKVShftCI1p6H9dA7hDljYXPJaofIUW+LjQY5ue+W+Z3
         OesoMUCQhFJKaw6xHkRKa/Wh+lju0X98Br61PUqCn9dL5NWi9F5sCi7fJV4eTbjEfKla
         Lpcw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5ZBRJmxdquHFDbokzPW8xL8X+YDJa6JLQWr08p5LBboMbQ+E7ptqbjbCSNXLpVRVqG0BBfm/lsNHhqM3MIaBz@lists.infradead.org
X-Gm-Message-State: AOJu0YxpsFLUdwRJWCTzDS+RAI0kvLcp306YXsn7uUULYLPAcK4cwzTb
	mIDGx5oB8Nr1d6NJmGf+HpuU9qVPOCxTDq+H3yzJraHxPhiKYeYbjkeJRi4+j2oCAwCcTUL572c
	RhyimIHwfmK9YrxCwmgRldpU8PbMfCmA//q0Q1qIQuZ+J0hfSRD7rxYxf13q8f99Py0vaWe1kxP
	4A
X-Gm-Gg: AR+sD113ip5VSUjKuXXcGKnKVUsSrSFcnptr/ohi4jHYh1/eBSbuVD7OoOpd7J014cv
	TzHnDndBNVyvftsPpEfV3KVoZlFaPiSEJOe4wqzRKWy/QwdcTFnwLkjaslMpczUjP/qCVwWkhOw
	oAXkP6wwYeUaJIUXCmI0x4TVCxtwIZinIDWJIRizUK3+B9tz5YqdyFSvp3gZKjreQaxz3d0+HHI
	v8i6q6EoGmfHapt0k738KqBf9vJXAmLf4y7kEAnVJt2wbG4IHFpBJ6jjQSWyu8i8qP8DOTie/PH
	OpqTh2AHd96J2epgFXeERs8M1xwHm2p5uR81/SLzPK47mc/C2h1SMshZyoUjDfwr9xeJeNxn+VE
	Fk9Xz3Gv+cn52V4QrDHoX/YF3iAQabhKHZ2A=
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253741485a.8.1785250383788;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2781:b0:92e:8ad6:210f with SMTP id af79cd13be357-93302640d97mr253735385a.8.1785250383149;
        Tue, 28 Jul 2026 07:53:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de541ac8sm864956085a.16.2026.07.28.07.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:53:02 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:53:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amjCTJguiANLY0vj@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8pBaL2FxNG2tdTCfRtrycAPTFImKBRtnJR3G-MJBgs_1785250384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_075308_375854_FBD6CCC9 
X-CRM114-Status: GOOD (  20.85  )
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

Hi Akari,

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..65dc4489a09c 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..8b69009e1965 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
> +

This patch doesn't compile.

    drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
    drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?

Brian


