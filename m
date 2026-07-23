Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2C4C531D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=; b=z/vh3M7N/BgcdSEifRExb4MLFF
	kP0fZbifC6KsRRYYpGCDyrEebddIZ1l/eLwdAJfR9BvoG9iTW6JgJt/87HtQ7ST61DW4U1DhTRG3+
	TiYiioDoAuvqlXUKCgJSfs2D8+KGyjH7owFFWgo6IyShtiBUVnZpzUP+cHjNUp27/ckoZlwL2kfW0
	SddElaf+GPflIBbELZxHcXTYVIEyqZFTsa6pZ5Av3mmRZJWur6KQE3BthK84wVUvrLtxPTLcJoHxq
	KLEPfMUPPafjUx4I83Ry16SzRJut/690Ye0FYtEXV5V2y37iXxLLqlqs5vSVcrDRiWVnMuhGuPzdn
	CHa/JZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmubF-0000000EWIv-3Rcc;
	Thu, 23 Jul 2026 14:40:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmubC-0000000EWHf-1WCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=;
	b=FvigiGY7Jt6TNeyaFjITWCu4PQGBXw2FK41XqFbxQFHi8SJ3+Caj/hKBELG/ElTMq7Z6YV
	kG0omrx+KpLDufaYwkpGHcVqhyzHJvWl6+KNO7PcuqZXvx1pbw6FNf9cTDvIcDt5UssMZp
	t9B8/Qo2iMnZlUEVo+OYCzFmpEgkH3E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-SyyBBlVmNmClcYZ6SZy6pA-1; Thu, 23 Jul 2026 10:40:31 -0400
X-MC-Unique: SyyBBlVmNmClcYZ6SZy6pA-1
X-Mimecast-MFC-AGG-ID: SyyBBlVmNmClcYZ6SZy6pA_1784817631
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso126853585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 07:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817631; x=1785422431;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBbJHj3/HGRQnu2lI6pHC51IXPFz8msF1DYjvpECwOc=;
        b=m7j0j/qxuYlGUHeXFIuiDmFH6SLT/VmFcWqKRIn1jXDuqkO8mUQ/z2bsd3HRsb8plk
         R1eORf+hTv9EmNyS+I82JlDvvvZMo68vfN6Y0yNQzqZv1GenFOCces16Y4jMevYKfYfn
         IFyyTt9KzCgwUhbPL5gmkXkWGKmStMobbZeYkDerzEP4QRfm+XMo+VIBmarkZ6ErAOhn
         WN/0ENmrwJ1gFb0+20U3i64eCHppriz36L+b3/ey/7YoC+0mkmlS7Ig0Kc7YspUsF0Qy
         xV+Q2maoGHffgtKrt+ryJIBAp2/qHRSs31uSB3fpbN/tCWjP6k+HDiquXWGC2tWCcYu6
         SO3w==
X-Forwarded-Encrypted: i=1; AHgh+Rozm2+afg6CODlqLCzNoHdTaXvhDIYVYVmZ2IfYeUeC4xTVWQ6jy3GU4f85doeJ4C5VGy7eooLlnQ3dZkGjr6L8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywze0yO1Avd+d+85CGFofL8tWla2W34HB0CRgBgmNF2rA9l6FxE
	It95+kB1bll+TFxNp5rH/9QZraGFBSZAH7ifrQtW5epYTb3lgFUjygdqgX7PT2YLn07/mP6nR5B
	ncktpviLuvW9hI+laBmfZTOqhl6EBMZbg8K1sBWob05B2kuhqigezmwnpYZUfemyFXhhTy+scbj
	DA
X-Gm-Gg: AR+sD12ML5KOD+axieNlk6XTGzN/KX7QDX9u1FeQbuAYM/W0h39w85XOX0w/qRqMerB
	mlKmdw30iL5vwEfjJv69hJWoBZsxO4zFbp3CQDO/R6nIsRULP0Of2LNeSGdg7uF64g7VkYNU6Ki
	NBNVCTcEqsookIQbJj664THXP6XCaOz+QrRGGWyPRqsK+hPYXKkl+gHzpO5yt0RL/8QueFlT6Sx
	17RB3oWtyYZqcw7s+aPAvmNZ62bUFLmEqVBY9hCeyFFLkR7BLmUmIcg+/P0HphoL744zWXqIci7
	KyrMaG0SwRqrEubsflDCqjWx4Tu/x/2q3krVusvigeFfqe3huaRUFO0kpzWzA3XxWnO16wlAPb+
	JCLnn7WUSsr8zb4s1/F0xGv4paRoksUx6KFs=
X-Received: by 2002:a05:620a:90ce:10b0:92e:8a84:7041 with SMTP id af79cd13be357-931035ce976mr246942785a.8.1784817631158;
        Thu, 23 Jul 2026 07:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:90ce:10b0:92e:8a84:7041 with SMTP id af79cd13be357-931035ce976mr246937785a.8.1784817630329;
        Thu, 23 Jul 2026 07:40:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6a157sm425415285a.37.2026.07.23.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:40:29 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:40:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <amIn3DO_65uyItS_@redhat.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mqz7X4MNf8doV2VYzLYMYBCShH4GhOrBjIX89Hs_GII_1784817631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_074034_479105_909EE923 
X-CRM114-Status: GOOD (  28.41  )
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

Hi Jerome,

On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> struct clk_hw.
> 
> When a struct clk is created, the module usage count of the provider
> is unconditionally increased. For a self-consuming provider, this means
> it pins itself and the module can never be unloaded.
> 
> Increasing the module usage count should only be done when the consumer
> lives in a different module from the provider. Use THIS_MODULE to
> capture caller's module and increase the module usage count accordingly.
> 
> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> pass a NULL owner. As a result, any provider module will get pinned,
> same as before.
> 
> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> This issue has been present for a while. Virtually all users of
> clk_hw_get_clk() are affected. The majority are compiled as builtins
> according to the defconfigs. It is not problem in this case but it is
> if the configuration is changed to module.
> 
> The following modules are using clk_hw_get_clk() and are compiled as
> module with some shipped defconfigs:
> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> * drivers/phy/cadence/phy-cadence-sierra.c
> * drivers/pwm/pwm-meson.c
> * sound/soc/codecs/lpass-va-macro.c
> 
> Currently those module cannot be unloaded once they have been loaded.
> 
> """
> rmmod: ERROR: Module blabla-module is in use
> """
> 
> With this applied, we can get back to removing the direct usage
> of the struct clk in struct clk_hw and eventually remove this
> struct member entirely.
> ---
> Changes in v2:
> - Update comment in __clk_register()
> - Add missing documention for the new parameter of clk_hw_create_clk()
> - No functional change
> - Link to v1: https://patch.msgid.link/20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com

Reviewed-by: Brian Masney <bmasney@redhat.com>

This looks good to me. I'm planning to send Stephen a pull next week for
content that I think is ready during this development cycle, however I'm
not going to include this. I suspect he's going to want a kunit test for
this and I know it's going to be complicated. My suggestion is to post
some kind of rough test scenario for this, even if it's initially not in
kunit. As I get some spare time at work, I can help you to see if we can
get a kunit test together for this.

Brian


