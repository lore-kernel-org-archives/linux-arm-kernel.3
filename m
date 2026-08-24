Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BF6C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=; b=kWUKU+KJ5jQt1usc1j9UkAXRTp
	l5SxCRu6eUs5hnoWFkV2m/BGw0ZecWWiN8faUqL368dzktRNEeMpWlCvby8pGd7aaFTqOv4zbqqyw
	t5szI4PlRPJVBC7Ns6GxSOFow/pUwYiaW2LiUQiQZinebPNNZ8H8/dKSodaC7clKzvZbDkDAMCAo8
	DJXC98jK2+wKYRSU+aEztHLzJQ6jsE4HKermwY+Kedq5ei6vOtTpOpHIGIN9YwzL8VUYs/7xc8vDb
	BwHatIcToLSABGBtZzetr4tfIkRKpG5/PeQtXXHkAoUaflHWWvA/sXKC4nUHoU9UJr7WwXTNIprMn
	qLybl52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWWk-0000000GuwB-2BgQ;
	Mon, 24 Aug 2026 15:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWWf-0000000Gutt-1R4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=;
	b=iy+z0aozX5vWBjlAoHAHrmeDI4AofDhMbBhAIyGvnKKZPkwQvd88WGj3xbghEGNd8Lhn03
	fEXNYfhAZgVWvETlXfs+6XxtX1m/0LT5otvbjsT7NayCnmFmJWbq1NJuDvINVH1I7sweAs
	Nk+BL60oxCjkRMULgRV6O1GEcaRDNCE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-va-W51mtO8OpnT4rexYaVw-1; Mon, 24 Aug 2026 11:23:50 -0400
X-MC-Unique: va-W51mtO8OpnT4rexYaVw-1
X-Mimecast-MFC-AGG-ID: va-W51mtO8OpnT4rexYaVw_1787585029
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so360881185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585029; x=1788189829;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=;
        b=R2Gt9Mm70bAetN1Fdu9/iKToHW+VHyhrGULfZkB+SeEKe4HeVKVkzc1O4jYO1PSxxt
         vFpz+WtmhRqoCIIcrO+0WRJjVU3Ez2Lvz2+rdT86sFsynPtU49PIaYwNSN/fcYYJoIwr
         nj4DV0hI0oXYk1JH2SE21UPGjCHxahnYLiMGj2XQtvmnLos0w8Pr9O7ie4yzJ6FmdF6u
         4i7NLrgrWPzwn5g0aEf1daWrVXIfcmDHZWejwwuEPrt4TL8aYUNGUY+RyX3BQsiTnaCQ
         cAGwDbNiC3IT5rYb4KPZqOkN5+D8FuRpcUfU8CrFBxClV2pWNeS4b7WblrmYjcnafvhZ
         blLA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+n4DwLawy8VtNdw6JFLZQ5H2fhVR9RYHS8lm50DVCRrr+XCqXi7kie/pG5W0xycVwphvbUK3//dqBBN+PeL46@lists.infradead.org
X-Gm-Message-State: AFuF++lsGx0jxLaksT2tCFX/yf1CMK37q1/Kv3NyYZRgZnD070JBU5iB
	CvgGbtYb3bsDM0dvDf0N+ZGoUnMx25Tt2u/Vh5uAEy3kEBipFCVAzhT6eEfm3rYR+V4SPsnLXBR
	o7mzAzWXfdtXNWYP31GSxuxi4GXZHnsI3OK0TcbFs1+NODW1lplDLTAIv6xQPEVa1xAx/Np8U2B
	JdSgKNUJwRAC4=
X-Gm-Gg: AR+sD11WMDYy1zgGUIX9OVBGwBcf9wxcUpN5aogm4dvsbhLYLK7xdw9kHUx0usatfZz
	s3kyUARHls3vmOctDxkQEhPrpiednsJTDm2v7xGo8HU+uzMruwCE45G2cNobM7Fo4cjIZHIgoLp
	5IPdRnY+wI9agvq49igKs3HmlmxHKYgvu3B8RCQYbnkIrk/1Y0vbIEVYGeHCPUcJXprul3rePgX
	CZhzN32csvi0WW2QicgQ9NLRZLW6RvjHpTk82H9wziEKx/4QCVXCGObBylQJfOK6X73adBZJNCX
	sA+rRclseNVtAhkWMbJ2D28uQH6HaDVzl8BTqpk314OMMrQNker/ukq4sssIgNlGLGH2U6HoHtd
	bjJsxUKgtTMxWcCnfuKmUVcSPgdcFUWmHluk=
X-Received: by 2002:a05:620a:410b:b0:918:7e9e:de74 with SMTP id af79cd13be357-93728511a13mr3206788085a.17.1787585029372;
        Mon, 24 Aug 2026 08:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:410b:b0:918:7e9e:de74 with SMTP id af79cd13be357-93728511a13mr3206778885a.17.1787585028700;
        Mon, 24 Aug 2026 08:23:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749ae390esm523684385a.16.2026.08.24.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] phy: Make sure clk_init_data is fully initialized
Message-ID: <aoxiAyoETWEZ1bue@redhat.com>
References: <cover.1787240165.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <cover.1787240165.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -8f1PoB_9Y4O-HWkSa96Yt8EliF9HdJAaGfJJ8wgKn0_1787585029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_082353_452806_8F765D8C 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, Aug 21, 2026 at 12:08:38PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the PHY subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>


