Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D43C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=; b=vHVae2bF+WGDrYblO0cxBdGjFX
	sqmI1ZN85mJHSS0NH6AwwqiwvwxwPd40cYblnvpPv0mRj8YglsMmUGutBb6Hb4L5Ry4gXfkyWTh4x
	3rfurSEFUi4oOfxBrN9b4YqHCYCYoVO1AqE7C44lQDBQbHcwKVY8C76zXJxAPgS3GUPa1Kysyp9UQ
	HQ2iKjBIsZic1/PCuLwPhDbQlSlu+xXlLNGv5NwJUag8NOGnJj+Vgt2Hree2p7NBAuBG9SAVsC8YH
	yBOiFbwX1ssORphXCdzfwbo5uz3/siTH8RGdXulwMjRnwVdTVrUm52AGSCUhDJB2NeTWiWbcO7NXV
	JrU+zE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWWN-0000000Gunf-0Fjv;
	Mon, 24 Aug 2026 15:23:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWWK-0000000GumG-3yBm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
	b=GjdIR1wrlljmRwfJk3l5VXV7fTfNcfmGg7Z4+RC0+1CRg7e0YTSfJSE7hYaNG6Jc9aSkwi
	YQjfAEIBGXO/WfvWRMO+fo6ujiLiO6m6/sjfTgby207P3xXL0ajMotF0yxuq7SEWrXxkLw
	TcdPGYwcCfowog/++IRfoMqawln7fV0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-nZ4-pRhqMtWNFHNoaVGoFg-1; Mon, 24 Aug 2026 11:23:30 -0400
X-MC-Unique: nZ4-pRhqMtWNFHNoaVGoFg-1
X-Mimecast-MFC-AGG-ID: nZ4-pRhqMtWNFHNoaVGoFg_1787585010
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so40891471cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585010; x=1788189810;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyWMUGGCNpdQSR+UOCnNr9F3b3WrWX6YNL1yYdbXEgo=;
        b=EUaSaFyyFK2t1q9UpiDI9DWa/cJnV4O452+KcLNpSFd8p90XoMXPg5G5WaaxBBmsnj
         +i+jjxGoGv1ZoIr7gGI5dAFh9HGZV3Rq7br/UWxUTYJnFD1Ujoea6H7Q6JhMswAomohH
         vMF6mypLnZGssEITYlodY4IaJcuIHV7RkL8cOljfzWLTzweASLyeQsR+EAMCepRsLLFD
         2vjJWgY1yus9yFwLGUQeHQQm633Vn1k0gnRGt24WQYGCIiOveAEYWC+q+fbSRg7FJ62Q
         xJzN7AHOUDTe6vEkpIjTdtSjBhFn3gPgFp0lvcnuscfJCwPjxi5JbfRhBAm4GYguojs4
         2Nlg==
X-Forwarded-Encrypted: i=1; AHgh+RoWSx7eUTogrkjK7mJwsELna6WIqyekVX6z8Q9A5h7b1+U/gvrDAHz226ChNJbZA1m33sPYau1G6AQOyLGYVdZi@lists.infradead.org
X-Gm-Message-State: AFuF++mRcFRP7esTTwwxHICn+EbXRCBYI9ZXPYNUjUcIzyPZa5LFQ2po
	N+yVfnTYncRJFuuvCow1y5uMUX7XSvPhB8jB6L6yixuuZeBKxZaqj2IfrWchmtyBN1Cn1DO5to8
	M31motvI9i8nItFGTmvj/LLw2qNRF+oAGeAdioX2/kJiWBC/KoMa3EjfxdxKDgpP17D6hVeTvga
	GP
X-Gm-Gg: AR+sD13ZXtqGbQO4RSi005RE2O7ZHBUHWQho93wlUpDhaypE8TFJUcHqfJGW+AuWFVn
	QN3is02s1jwKfC798lAvW2osD63O/2lnZzc9NqH7/pkF0mL6P3JpSocJuFwRiZp05DoXh+nM8sB
	zh++tfV7YpVveQtxmB8kSzfaRI9usCViFME3/SCfnVX8BLd8aZ/SYjsS8w5VYmW/oxNAwe554aL
	F/dc1hB3T/mTUqKRKN3xsL2oRtfrXAFjbJL+t+Fbn1p/T+sbATM9sWu3kgn/ZFtmUfZwtcgHADF
	bQolFI76JsIiDVaq0WBtqWWogRlr7tSdLx3eW3t0jDwVmUmx3vQMCeAzEFen30cmrKtJgWGZ56x
	5E5bVcKyBUaObJQU1P4+PtodD31eJ19kgziw=
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291839011cf.30.1787585009798;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52df5a4a524mr291838151cf.30.1787585009336;
        Mon, 24 Aug 2026 08:23:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9393202esm65764626d6.27.2026.08.24.08.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:28 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] peci: controller: aspeed: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxh76RQucnlttcA@redhat.com>
References: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MYM7hl6NVaWUwdCP0JjSV905OqlUD66alMUFfizlYLc_1787585010
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082333_057666_0F2DD0C3 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Aug 21, 2026 at 12:08:05PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


