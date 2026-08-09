Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA14C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=; b=u648QazhnPejAz+1dUUMveeO14
	3hK65B8lBAU0sQLkxPRuYPkaAJBXumNRrtu8x/v45TIZpvzzjMt1lCKPSKBnduOgC2BlFgPHYvW8I
	bp5xQdeVUzbQGunqKbdP+jOqnn7c7H3glSbsdcHVAoYpx98ZATlj9/KsNKXv3Ap0SjAL+idS9+aPX
	kgsDOgNCHvzPlE/zPC4Fa4hB91gXHcFgLsQi0qsISL+FQF4Kc6TRJtAC9bQwxecfoLIzSMizs5e/S
	FnSFwJ+wxHsWVy7QjPE4JQLzcWxSmXBIXwMp4D/95M73CidGcqghFw8Mh9HtgMuRTBg0z6IQMhXAd
	K/iN+mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt565-0000000AQOG-1uxj;
	Sun, 09 Aug 2026 15:05:57 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt560-0000000AQNW-3Exx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:05:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1460023b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287951; x=1786892751; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=q87gZuGiqN1iED0i1eqP8sQgquXjnw15rF8lbk5WClUQlNP4JY0mJJJvEJ6AGEwU9Z
         TbFK1OXYBuu9hFeC4rYBCN3J+UEGP2VycoztIxsVU5anEEwqS9E9sELVj8VRZ/zVkPaD
         JTdKHehGEERXz7Dq9djLOwKHUmvdKsJK7A/zZTX/0NaODf8KWuBfHr+d6yU1gAkNxysr
         7QfSXpfLagEFRCw3qPFICepsysPBT2zl2yP1bJZxKNvEBa26Hl4W5e62BtUurdj2/jov
         tNlHwmND7UjA9CRUuwVswc32M1scH5v4K2Ubpoj3GhzhWDohHwG85mwn/eNMJQ1XHXa5
         5Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287951; x=1786892751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xMkbVk8Vq9ADk/FsQY03JHzIZEPQoL7wUy/e23YhPc=;
        b=j8OOr5LUYqNhL2u8kb2WvPxEVIMw/KDRhUQ4pCXEKWTUiV+Ky/O5KYqRpHAZ96nUiC
         Ex+VnzyKIaQerUygX0rrQHK09O01+Hlzv4BMTecT9fcxqHvx7zQGDOvK5cle+z7Z5ZsA
         U1rH3rolF9jh+aBFyA54+SyC3sqHaeFtLiZzDbDRFp7s5Z2DjHXXzVEhQp718XvKOCGq
         JLKHjHte4qTt3EAkPf7FiaVDB0gLIaINq1IWmy+wZ/cf26yOm1mt4zBaVujAfjRZmn/9
         IGROvVijR5PKfOUuVHntG5XkWVtBRWdeFN2hR0Fo0xZkY0bmz7PzJVRi5A+yL4HxVngS
         0YPg==
X-Forwarded-Encrypted: i=1; AHgh+RptDIXqJIZWRC/PtbM8MWbbYOqpfIgt/lRSfWYjFXBtHbGNzQ/B/+PbOu1t1t6bcP8rHuE011zLqnAp2UPFhyvr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ksNwu39GMpZdN8KBab7ALVChpKnufqc1/ZZDV4gvVHsNwCx/
	DWPEJTYfZ7ud6KE8cO63puAGoTxYgJMbXNrbVh10x/8/nLJxPg1/gXrx
X-Gm-Gg: AR+sD13DpeGPXhg5oTXbdJAB7K1xrhVinAipmSoCxCNHT2eMlEsf4qvCPltEjZmH2TO
	Qt7Ds5/AkFos5czhZg/sZWVjwmr3Y7vi7BfyJvS8VqC7lDX8h3EadkFOL+PjJKIvIcTR7PUPjbF
	JJL6Bom7U/9fThyOFSDTRjRviAAgCeG/IGwZm5+CVTTA+X/SQFjiXN1vEUCvGKtfcMJwsVn0NyO
	xmfhk8MP8uLHzLC2UuH66ssD5z3a+56zIABGxuDrO/37pDnPvPZxnQ2ln7L6QKxAbhaOG9a078y
	zTCa6RFpfL22pZd6RfwOCeTNokZxxxIvjxxt9gxTIl93QPn4/ZtB5up3kyEkOnYP+YTVPQEX9/d
	mXqFxfUDl+tjfkcFExpKgVrNn6C2bA+DMWQDCvXgZbV47LTYS7p3eCdRyAxYWgS0CeParhqC5ho
	x1PjNaAZKujYkw4K8zEDjFBZ1fZjv/e4dpB3iWqe/tkWedbxzmgUpkUwajgwgvC0ALKc+eNrkvN
	g==
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr20974725637.36.1786287951463;
        Sun, 09 Aug 2026 08:05:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm54797483eec.18.2026.08.09.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:05:50 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:05:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080552_817463_8F90EEF3 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri, Aug 07, 2026 at 03:16:52PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index c9e79851504c..48454ac86074 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -429,6 +429,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	if (wdt->cfg->irq_mask) {
>  		int irq = platform_get_irq_optional(pdev, 0);
>  
> +		if (irq < 0 && irq != -ENXIO)
> +			return irq;
>  		if (irq > 0) {

This if () is no longer needed.

Thanks,
Guenter

>  			ret = devm_request_irq(dev, irq, aspeed_wdt_irq,
>  					       IRQF_SHARED, dev_name(dev),

