Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FA8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgapLk0U8W9ohmKNOKBlmGBZxDjWC3tsNDHbpGJHrbQ=; b=f6oWnyX1GWKLQ36oMg3T0+zQHF
	M8Ldr/qajl+6/51mAuFgmn9r2v1KldXq8YNwjU/dk/+FIQAEfWQYnThMgwG9l8N/5PQeSGKfb/+7c
	ZaMX+wGuwEEN1OiPKrpLuGAzXmizSm7fOz8PbGgiy0KF+5+jQIfDy6I0HuZcCComaBizgwujKLJPG
	4oRC4SX06L5m7hJf5LIVv2SBrrOgBB2+wa5OZASr45EJSEiX3T0O50pc7ElTqlowBC+Rfpugb6Z7R
	37jalAU2v4BalOvt62rOc0E1ggherQF/6+EPBDmQuYhDuFhL/G15+vdrYko+kam1ds7tUqDT8X6x+
	ZgLHN+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWaw-00000005S6Q-19uY;
	Thu, 28 May 2026 09:00:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWau-00000005S5L-16Kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:00:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4906238c62eso39024405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958798; x=1780563598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgapLk0U8W9ohmKNOKBlmGBZxDjWC3tsNDHbpGJHrbQ=;
        b=R93CoZGpi1ncGpD9IMwA7doyKfy89h7ElbYNUd9oIy4W1oFTca+idPDFDRa1eZcEEK
         0MH1e7WT+OFSO5SblnWl+V6GgxPmKno6L86JCjPl55unq6Dv+HCe12pHjEfxmzBJK/XH
         oV2EEQRTzls5GtvK7F2RzhUaeTBItvdp1ir+t7MdYmDz/vfMySsXyANOCvhDbvBfTHAh
         P/YuOTbMfvt/aOobb9CPQhBXafy1qgLwqXt8nEXwIhudayYLUUqE5WtYHM3oamHtnmn+
         yxMZOzstdCT2g79pZv3U96pUeQNGPI1GhHYyM5DX2IoiX+EEPWgX/0CpE6OQyKoApuRK
         qE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958798; x=1780563598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgapLk0U8W9ohmKNOKBlmGBZxDjWC3tsNDHbpGJHrbQ=;
        b=Zv0hSMepMJmTJvZrmNmVBZOnRrYjR66sr96VncgWJpcddM3nbird13w4nkjeZCqMNI
         a03CuWJ9lgsW+0rxyZ3nE2Kt1wylQe+2sfN2sx3dczLPdbTYjOeKhbIdq2TVmgR9NVhg
         7bWwgS8v3JlDueShoMvPQAiXWKrJ6BEsIgOPBtH6xujTeTCvNItoB4B7OGqnahfJedQp
         u0zP13f+goiu7QfKhkUtSJBD3a/D4RO9YOCW2io8KDnF6zLboK/NEiXTm6lm76Cc1syA
         2hypYvCEepwqQ/8Kz9QRefWVepV+zwRmktiuFr8KBff2eSf6O6VD6UISSRpZT8T0jR/0
         vNFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WDRchvOsoR6x3Jtnpe8g66Iq5F1WZlkB6ZW4eX3P6oNuJDK2/R6hir5jyjyNv2fqAfZx6Fo4vUeyKXcMf0AHG@lists.infradead.org
X-Gm-Message-State: AOJu0YwynXpZBUeSjm0TInkE8bTJqnaWYCKt7evuB3tlDJDr7AcGSWfQ
	HsvE9bMIAR/TPZvsCYUEmZD49trbSb2DeEUSihjJHPTALbcAxpTIJd2V
X-Gm-Gg: Acq92OEkRSiUUP22UPwKTLZOoxqQ+24NM+bePRf/l9s0uzgQfMhAN9258KfgkKeV0ch
	H4Zd2+FjN1SSkpTbLKe+BkSOFDbVMnlGql6Iu74KEokrN/MCEEwzXuZh433KBg+jfzd2iFTiIU0
	lcvX91LUF2LUcDua4zUx1tQjCbR9tpZFaqlCTEbiy59p0upy2A4Gf6aeIuzqYjeAAmVTuUsT1AR
	TWqA+Wi0Y7q/6mnUFGtFYTI7y0+PynRsCeTEkPKDcZ2vu74RShV+gj+SXI/SsTeTQ9F6uI2JXi+
	zaHjy59Mw1cETdwg/I+6IXU202uCdRZxEq3Y6UEqQuL9K/tOGyAV1Hxr/0NeurioEhOOaD10IZI
	gbm5qHe21K4JvL2JgmisPJWltLoHU/quVJUfIMUMvRngvXq2y8zyKqEpelLgAZIHb65Kh69c/jj
	5wSbd5qelcp/IlI50M1/kLPL2xo4TXDVUnTQ==
X-Received: by 2002:a05:600c:35cf:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-490426bc737mr484669565e9.19.1779958797723;
        Thu, 28 May 2026 01:59:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49091d55972sm26972035e9.0.2026.05.28.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:59:57 -0700 (PDT)
Date: Thu, 28 May 2026 11:59:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Message-ID: <ahgECVKG-djR9_l3@stanley.mountain>
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
 <ahfeOh091V3BuuaB@stanley.mountain>
 <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020000_323436_B082AF5D 
X-CRM114-Status: GOOD (  24.43  )
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

On Thu, May 28, 2026 at 04:00:53AM -0400, Sean Anderson wrote:
> On 5/28/26 02:18, Dan Carpenter wrote:
> > On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
> > > On 5/25/26 03:16, Dan Carpenter wrote:
> > > > If the *ppos is non-zero then simple_write_to_buffer() will not
> > > > initialize the start of the buf[] buffer.  It doesn't really make sense
> > > > to allow non-zero values for *ppos, so check for that at the start and
> > > > return -EINVAL.
> > > 
> > > non-zero ppos seems to be handled properly by simple_write_to_buffer.
> > > 
> > 
> > It's not an overflow bug, it's an uninitialized variable bug.
> > 
> > The simple_write_to_buffer() is designed to handle partial writes so it
> > leaves the first "written" (scare quotes) part of the string as is.  But
> > in this case, we can't handle a partial write and the first part of
> > buf[] is left uninitialized.
> > 
> > https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/
> 
> OK, that's a bit strange. Can you add this to the doc comment? I certainly
> missed it when looking around for appropriate functions.
> 
> And I like the explicit copy_from_user variant better, especially since
> we are setting the nul-terminator anyway.
> 
> > Also this appears to be dead code since fops_zynqmp_dp_pattern is never
> > used.
> 
> It's of course used in zynqmp_dp_bridge_debugfs_init.

Ah, yes.  I just did a git grep and the CREATE_FILE() macro confused me.
But obviously this wouldn't compile if we had an unused local variable.
Duh...

regards,
dan carpenter

