Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98918C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=; b=MC2UCNKb5z4Oodlb5xe7xEJnrJ
	06Octoaxvtc/jfUuXh0tNvX6RFNf2snHy0kei45pTjVA2+n64KoqaSvLI7zsRMpfpQeX2v5umT21e
	DXzTsA0ToJpN6MjMrsHc3WV5vHcG1FFJ6O9MiJ6yqoORZxIjIVON7MHhPeX1wRY7YbGanYn7LkAet
	9maUcyrff3HoJsvDje7vSfC39cnnCe3vy4YMhZPVuAOQwZViTt4ECTwlS+Ag+BXEZnJhrjAGOqJms
	wmz9KZMtnuR4q9hEI6sUfSxH2FPtSgwI0KMu++4tQy9GL2my5uUgSPGqCR9l30buik5Z1QglXBlEx
	QA9zno1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnph-0000000AZBh-0Idc;
	Wed, 19 Aug 2026 21:28:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnpe-0000000AZBJ-3rsg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=;
	b=VpshaSFuUoJg2r/IuEPPSm8K9mHS8sUWH7B9dQA/mS6h2dSRM0l6BuEJFNtTcuNUpa9S/K
	9B11QMwELJ7AB1hZIAvIeGdZOR4/EoAws1UBb7YnzrITlGMm7K41h+AjW2QMAwBFLP01Oo
	ud0at1KgueboYQt49jeZYUMT4t5ru4w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-5ypUGJtSMYW2tR6trToOdA-1; Wed, 19 Aug 2026 17:28:20 -0400
X-MC-Unique: 5ypUGJtSMYW2tR6trToOdA-1
X-Mimecast-MFC-AGG-ID: 5ypUGJtSMYW2tR6trToOdA_1787174899
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4e6517e9so28436136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174899; x=1787779699;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajzV8c1ll+kVcclTyddW9HB0GLh5YAmk3HylAH7l8/Y=;
        b=OdZnPKlhhkrstISeSp3ZZoIgpCHS1eEbm8qHCl3FyoLj2mqeUQKbPQoNQpKdFXSEQ3
         f6zccIKQZyUwhIsdVhwnENxULXMmSCcdaqHrqOHC4ePD3QEmONzf7vGFC+Pj3TIaRvC5
         C32zQXrP7wFPZ9vKpoPodQOh7URC5rJWxX8gQqKmRVRuyLLRd6JgcxXPnasr5Bp9PF87
         IEl1wPwgH0eRjzc0OUVEsmFLgtq9+ZR6oH+zu9qe47ADUhJUstvenxJvzPvYkap15u3W
         aTnXVKiRhnbfh3NdzS8Met/XhfFPfHFEPjkgy0nRj5TckTBBYdJ6IjhCD4BrI7RJNz10
         4XiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTf0bkHYfg1b0cmDF+o40mTZrwe3CZn6SbOfuVjmXa/cFjgq3cdiz4uJ5QqZeMhngodoUnp28OOQ20pTsNtP2R@lists.infradead.org
X-Gm-Message-State: AOJu0YxSwK2n/OTRQ0wSb5VMlRIVt7fi4BhzFZtyLPFb0RDM5f/sc9c2
	28mODggDvn9sIGzDh3KvWymQ4FflgpI3UogPCh/XMucqc5moZD4mTRnJX/TH6Cy/NLJVgA+MFm6
	bkOo7uHXwFTA9EjriF1bPHHbBSCqwG4NoHxWRCyuLxpebz9aKiMjtHnx8Qv8yrMcjfjZlPQX8ee
	yz
X-Gm-Gg: AR+sD10dZmlSaXPWUM0+yFiuyP+G7fC3CHBqx/n/hBct/EP8l1gwC2IqWRp4U6p/miS
	hu8iRYd5lOmg2C0HrronthWsQJtXBBPXp4/EA/B4KNILgKuf2/EZNRBPI1ra6HSVQ+GA50FGiAf
	vEnMDMCkwM8G2IzCfwd/nFE54zXVO1efEfkzWO5LWnHAM+VSqlB7MXC3QtTToaGbJD2rvQzWyKG
	uhR0yDsKIlAUsfnTzPvfiedNDKem164i90C/LSYWdoSWK3kg8peCjrDhIDJJPXOwPFGyTHqJzwW
	7a4MB6g8LyF9A40hM/2I31XezlFANSyFQjNPSGa+hByNnQuZi7MyDuUx/41kmY4dpBQWRdbEqGA
	XU/YrVZedl5lYtCMOjRiLeCBxvUp+OaXSIMo=
X-Received: by 2002:a05:620a:2621:b0:930:f35d:41ba with SMTP id af79cd13be357-9371e334457mr869887485a.36.1787174899589;
        Wed, 19 Aug 2026 14:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:930:f35d:41ba with SMTP id af79cd13be357-9371e334457mr869884585a.36.1787174899185;
        Wed, 19 Aug 2026 14:28:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204afbadsm225655485a.17.2026.08.19.14.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:28:18 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:28:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-ID: <aoYf8UprO1A3I-53@redhat.com>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eupO2O7yqUuqhoq6YByBeKQlnXSxZNKrQiSRka2UKz0_1787174899
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142823_041125_CCA60139 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 14, 2026 at 04:43:30PM +0200, Geert Uytterhoeven wrote:
> This is already provided by <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


