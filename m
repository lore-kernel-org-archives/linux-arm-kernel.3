Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF75C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=; b=HM4XVJBOwmoEM7vArn/lwtOkLE
	uGeBTFDmh/F8u/+krUR1BNukngdMH533MdqFFfMj2+1G/fHn1o94yzwfMHqonZPomxdFRVXyOAG/d
	hsW/FUZzvUdqGWNw4RI2NYzgkLHM7Y+9kq4YWMBo2zRn5+R7YQu8PIFo5hTDGKetzEtkRkPMeOZl7
	nNt7lXuLpq751JIhsdqE3/qJ7tBrZe8Puq7VrxDH8F3FHo7mdAA9NI5X2ntHQjDiocOfqlpQQDQBr
	LOyef53kbmU6jGlAmw3AAs3qJNpREN62s8gErAFvpsNIc7n1MqTXV747p0C6aXvDvRprCCj7DswdL
	d9WFXKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gnP-0000000FcHN-0UsM;
	Fri, 18 Sep 2026 22:11:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gnM-0000000FcGn-44FJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789769459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
	b=PmbnsF3G7MJqLFyFtCVslqZZ6KZNvnIH81rii1+9R4CV0HYr8kjEuLkotCns0fBp/P/k5Z
	PonaMfwRHnkQYOP4EnjH7Xzc83mVxz0O44NN4Um8LOkLZHqeuBgItPpoVTzlG2FwhnDI2E
	jW+a+cvxRpyAYx1cihogPHO9nAmkVvc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-TTnlYa9iMuqvRcaGibsX5A-1; Fri, 18 Sep 2026 18:10:57 -0400
X-MC-Unique: TTnlYa9iMuqvRcaGibsX5A-1
X-Mimecast-MFC-AGG-ID: TTnlYa9iMuqvRcaGibsX5A_1789769457
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7de22fddso25189386d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769457; x=1790374257;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
        b=sFtjiHxtdl4cEUIsngrY1SKARHzIy7kYpRrMCr7fw9SwsgpszFC8CRNtipJVZYpGfV
         gSpw4HQjjOjUxDshlm8s2CB0LrPxhIfbaVMMUuk2EWo+DCrmFWVh4VPCTi0GVUewbR8Q
         sZ7qmHmCVH3dHPjsWUKvsLKTRSUeiJXHkTCKQ0nog6BC/KkDlegWpd2zUHlfK15IoVLz
         kdoldcSeSgFt6Rf5lylC/HuTG8rQo1tKC73fH+buwY7Df+RC1g3fW1bUJNuZvm4IA9/Y
         2vQjsG68lJ2j2vBM67L7UkTRy1X3+/PlLb7DoCPBeFKWZ3vpDS2ph+20MsOvAAwWxLUF
         ofog==
X-Forwarded-Encrypted: i=1; AKwUvBzDpMGxi8zMqjL1nUCbXjoVoksbLHnJ+JrcBkXxaSBg1JEIxfYvGiyuauFLof5xo+KI4irgtoplZiIJ3wfxKSSq@lists.infradead.org
X-Gm-Message-State: AFuF++mSUJU7GD1vUS195ywjpT+V/iL8GYRyyWz8aGffp6oH4J8YSO/N
	bU37HFBcPAkA1W1Ukk1k1Knsd2zqBStbmxRk89FmqKUMhQKImPlecxBfKrU59Krh8MOtRP3AFYm
	o20YxyFcb4yqUz3NaO3uAje3pm/94t7/NoIcaQBh6+Gaf7ZF6niiwKMosWC82iFd+6ZJNmniC2K
	ud
X-Gm-Gg: AYBFou3sW8F55shOGXaX2pjda5bmf5CjEzfpTRKITqwQPgwM0UcByBstlGryc1gQ4Ka
	G+wILErX1KXxSnxNeRuK3CqUpn2YremKeWWLK2fhnz6RK4AO0vUV2CQPGFnJjKwYyVHQEjVqHow
	shqoBV4wHtwv7tnpIaRe2pVAnOZm6XcwFzUK+SPwiVuMpXjAoO/G2i8jrzLxfzfLu3HljYdvQfZ
	MeFClruysJbkcVNZXjyuzxBZEweG/9wwwdaJe+okoy71uAwhQaJteo1mLUmlN9UyY3RQPua2i34
	DnsoVFcDHFO3oHhoCH71aHwHRc5UxBi6p+BAdSR3DU2aCtk+4WDm0IBZAk70tC+NyOD00Gs=
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091826d6.5.1789769456753;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091386d6.5.1789769456370;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260967307sm6178666d6.6.2026.09.18.15.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:10:54 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:10:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, mcanal@igalia.com,
	wahrenst@gmx.net, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Message-ID: <aq227UOtx6XMa2My@redhat.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AuegQBm_1-bXKydwIXWaWmeJ2a5PyoZKdRGlIXrnZ9M_1789769457
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_151101_086134_99131B51 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, Sep 18, 2026 at 11:41:30AM +0700, Triet Hoang wrote:
> Check the return value of platform_device_register_data() when
> registering the raspberrypi-cpufreq device and propagate the error
> if registration fails.
> 
> This prevents the clock driver from reporting a successful probe
> when the cpufreq device could not be registered.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Fixes: e2bb18347c8e5 ("clk: raspberrypi: register platform device for raspberrypi-cpufreq")


