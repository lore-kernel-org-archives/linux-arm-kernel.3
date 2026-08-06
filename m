Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3233DC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhZld27+M+uSfFp/4mUcI1U/RKA6sGB9YBQVMpH+L0A=; b=g3XuobeI65JBi7X4TXUShXHJ0o
	UVgOOMadbxwuTWD/eDWEoXbM7UvFKSmqFi5aFRJKAHoOE8ZNeshbaDVWBo9VZjVcwbKUA8n+0xG+o
	sXL979O2eHSnIDyE4jvOMFfmS6pl/6yfecWwVzOd09Y2v4VJCzr1y1Mokc2N7b+ed6kWSSINWRrI/
	6TAXUk9FFFaW2NZiu0yNG+9H6a8hHsdhEcflpmLNreQIjr+2ZBoQ/Jurt5xKDU3XKb2QSgDANei3V
	ywgSKeAT2B8O04NWMwv/ShOKEBy0SDY/t01snhal2NiTahKndCsHIpExSm7RFqgfWkjFY3bOHzgDy
	FLEpeROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv1J-00000005VqN-1kte;
	Thu, 06 Aug 2026 10:08:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv1H-00000005Vng-2I6Q
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 10:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KhZld27+M+uSfFp/4mUcI1U/RKA6sGB9YBQVMpH+L0A=; b=Qpdq1be7k/dNu9YHpxb+vB181H
	gd9gGNV1IQmwSa+BBoqSBSN1Kk09b9y8xFt1Qkgh26S8UKuUApL9u1VTNIRshwJWxP7c0ulSQidB3
	HhRVJC48cFVr5N15YZDl3lEZAm7UKMXoMKfFv8z9P7bTZI50iAP9RYD9FvE7yg3hjPGizZ8iDtDt2
	mTPvRealnm0XohAdPSDSYl1TPROm5KR/G7RIYdcIEpEO9P7gwHPoNXNX5d0Tj43J6hFoMn5GiJOlP
	1tNHIXVGHCZr3RIzCI793490PjdVc0BHloy67Pzz+i9XXrFrERJlgL8eK+DJntvhJ3NjY+Xnhrde0
	mVunBu+w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrv1D-0000000BP4w-3jQ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786010884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KhZld27+M+uSfFp/4mUcI1U/RKA6sGB9YBQVMpH+L0A=;
	b=aQqpuE65T6EJfhifQXSr6PtHR9oC0sTfW70Hl0I94sxHZBSLeczV+dmUp4HMFbWX4xJATQ
	HeMVB6zk93UVrZvJ7lgtJhZB5FFDYt7JKPV9NxiBHyfFoeqerg45Avy9bZPr/R6eXh4Kei
	1wJf8cS8QYhvD5XQeMBHwACcxvzcCvk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786010885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KhZld27+M+uSfFp/4mUcI1U/RKA6sGB9YBQVMpH+L0A=;
	b=Tavp5/TjSBIqxX1GtmXvVWYoxnO90AuVb2kW+uL0ESrf2eMAnTjB+d1NYkpgE9DVUiscRK
	bUjaC1Do+Q/WGibmQpygKwHKjx5Rq4ojOlQJc/sYuBiVOSBXJ5z8LwJ+/UfVSz2YyRanE9
	EE1rWEYXqp5FqibclVgHVMjxu6HY8tA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-QC27in53P_WlAlx7FhiDiA-1; Thu, 06 Aug 2026 06:08:03 -0400
X-MC-Unique: QC27in53P_WlAlx7FhiDiA-1
X-Mimecast-MFC-AGG-ID: QC27in53P_WlAlx7FhiDiA_1786010882
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso17709995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010882; x=1786615682;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhZld27+M+uSfFp/4mUcI1U/RKA6sGB9YBQVMpH+L0A=;
        b=oxn0NYQFQsbId65nf45osYJR9Y2jUV66mSv8JiYh80TvnuCmsnR4Jh0Ng8I5MhmKxM
         ZZ/7pHNMCFKJgRmTForiKsf50wjaP9xHbb3dWluS1jBfquSMaxS3/yyD2SDrIhHHE/uW
         I9qa62ZUdNUGfqrnDD+U/j+fRJVMFuePYmsxJpZ+ZBLOhULVRx05ZjTGhvZ71Z1YBky2
         lrJ3Xcn93lUiVPPDU9Y10rwKBF86YpV2A8dfsvVzYvPXUu9jNU3ShHbJPuQOsBOf4XzP
         oHgFOpP+lUKw9fljnM5oo7UWJrTNVwJH7ADr/AwfEM14dKxGrVqt6s23PqsP9Rb69wF0
         psSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrvzz9vaCSal6cszvlugli+ww2uEDlMhp2cdEQk1jwExDn9uZxINyAwIrn74r4m2jDRnbgkK9iIOw+IrBLWl5sH@lists.infradead.org
X-Gm-Message-State: AOJu0YwguUUqeeSLK0BD4h/kJEBZLlxdsuP+yEEG5x22EyK9QDYSw+JN
	6uBvF+KvZinLcOXxU5s7DU13FM7HlytNkhHxMQGLvyjFLVys4vcrN6PDh2VjtGGg43BitUR78QM
	SG/0QIZoME0K6LDN/tC5ydGVcTu05y5yfPRXHG8NkTUswy6CthhOuo2f/sdmGBC5emMMTBEVhEK
	aF
X-Gm-Gg: AR+sD126PVwXBpUGmLglnBJNwc5RcJEvonnvIPJAJd7Q3zujoGIyBs+fWtfRQwwbOYD
	5kpo0UP5bL6laz9SYhDvxp6R1hwHtv9cEGusuFcg/Jczzr+aKc1e9cVKoBFIEP5P1lTA6LYmX8i
	dME0PmmwijcvIfvLYH+1pqKSHFH+aEef4qddfFWFFRo6IXe8hcpSpxXsz0RLMuh9Ky0da87vpry
	YQi+CiaH2myJFterQgSk8d1EE8xEcqA4uexqNRZ5L01uLSITCW68jhAZe6cGA+d+0wn0KLwg6pG
	dlnZBTkOXHEgAz/RSLt6aGsp6TxQNMEbcF2Rj+XJAfnDqCkdUpo7nrCQU8TaxqkS1AH8YvOH9Db
	uaS0YmxxzqcKHOh5upTkR1E+LFoaX+JJrNGfpBQ8Efd5Uy5el7/J3h/AMZ39ocKMA09gQgAEbwe
	s=
X-Received: by 2002:a05:600c:8010:b0:499:521d:bff1 with SMTP id 5b1f17b1804b1-499521dc012mr92037255e9.2.1786010881760;
        Thu, 06 Aug 2026 03:08:01 -0700 (PDT)
X-Received: by 2002:a05:600c:8010:b0:499:521d:bff1 with SMTP id 5b1f17b1804b1-499521dc012mr92036505e9.2.1786010881353;
        Thu, 06 Aug 2026 03:08:01 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49952d16496sm24832495e9.0.2026.08.06.03.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:08:00 -0700 (PDT)
Message-ID: <a4b4b8c1-6c6a-40d3-a8f2-727407b0bfa2@redhat.com>
Date: Thu, 6 Aug 2026 12:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: fpe: Add missing return in
 stmmac_fpe_init()
To: muhammad.nazim.amirul.nazle.asmade@altera.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260803032358.16282-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803032358.16282-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260803032358.16282-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ycXBbqJvEHIJ9Xd1YXVkWyirjeSGAAMRSbPAYkbV8x8_1786010882
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_110808_096933_782F8B19 
X-CRM114-Status: GOOD (  17.17  )
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

On 8/3/26 5:23 AM, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> When FPE is not supported by the driver, stmmac_fpe_init() prints a
> warning but falls through into the pmac_enabled initialization, which
> should only be reached on supported hardware. Add the missing return
> to prevent this.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v2: No changes. Collect Reviewed-by from Maxime Chevallier.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 2f880c5e35b0..3436e962a238 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -174,8 +174,10 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  			  &stmmac_mmsv_ops);
>  
>  	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
> -	    priv->dma_cap.fpesel)
> +	    priv->dma_cap.fpesel) {

Sashiko noted that the above condition does not reach the intended effect:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260803032358.16282-1-muhammad.nazim.amirul.nazle.asmade%40altera.com

Also please be aware of net-next commit c82ff94592fb

/P


