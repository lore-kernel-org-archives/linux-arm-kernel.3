Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDA8CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEvrj3FcHgr8xXb2mLKuhtzTWtWLNi+whddxtH2ZY2w=; b=OfwJmyx9zHio4YPfmFzhPaxT6Y
	2Lpjt/xFkNTf3xGHyjxcI60732OARQlkewDSeb7+MjHhmB230VCzqfWxOCJhitZ9thUwLwIE73Wqe
	lYF5WMvNW41gkS1h00zSKNOe5pto/MEesd8CarvB+0wiTXN8YDQecKr1vQxOsamwYlH22IEoDCwVL
	jizbWrgfdcdsyDbdx2asN1/CiIQvjKXwbAvfKaA87Ka/T2sjnix4cdxxWt89EsoTMXVNmimfMJmgQ
	0pM+xKZoXQv+zhA8mZySgIulhLtCUwHUayL1MS3XRwJgr8tAFD9YxXZXZlLbTMdeMi5oE6Ni8dDeR
	644VD0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbro-00000003xYj-3uTk;
	Mon, 08 Jun 2026 15:26:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbrl-00000003xXG-1KDj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:26:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10912275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780932375; x=1781537175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEvrj3FcHgr8xXb2mLKuhtzTWtWLNi+whddxtH2ZY2w=;
        b=QL+VVbY9v6AdfBuQEkXALWSrw18EMZf6DX/lfMrXpqlzwVsmdVytO2hgmdFlD3WPth
         PKkG9qahvh+zn/lcN9E46Jnp4AWNavYvyhO3gs8Gt/mYgonmFpwl6TOdz87RN4wXqk+c
         fX/Sv61jkk/rxtl259OVuFxLphXWgmXhk3c+XK1XtiiFjq5AnJJz9Dj23T3o1YthXyR8
         JlPIzn2z7PdKs822VA+dToPmgOPiOaIvhMHMNK70Uacjxo8YZ75ilw7bri7ulMMjBr8/
         2ueUCTGo4KXz/kj4aU1qFuEkzCRoZbV4f00yZFJ/mIpG2wam0htQgmIxLJHZ1Bvtr3oD
         SqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932375; x=1781537175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEvrj3FcHgr8xXb2mLKuhtzTWtWLNi+whddxtH2ZY2w=;
        b=Bs3deChfgvOpRCBpUUDNpQx5caFH+oLsbhbGqc3JCV2m7okE//zTJxjonWpNy9LmIO
         oUcGQwEQVamtuldTLCbcpq02RnF6xrisjFJnyDqrQElSBF6hVnFnUGt/Tk7js7CGU3qy
         7dZZaMNPmIA5jXTW7w7gve5+ws0SJR9gJOov0FI+ri26nBxMhAzijMyBe7hjAp4Qq0As
         wFJltG1HT079SXX5SNGbhmPWz5ZQZiYefGpSvb3ROSH56qWdZUp4EOB68wnWv4JK1BzH
         GV9xH5xfqniS2mbYs2pkylW9AQs2QGkT6aAvN7+cs/m6kuQEZDmul4YABs5wbaGrCBUZ
         FhWQ==
X-Forwarded-Encrypted: i=1; AFNElJ99/HWPuQ8EHN41nmgfM+AkqT9fnk1HoHdlv8O/KoK4yq+yGSWJj1upbxN84gTxtnicXKBE+tcJKI0IzB97gnHz@lists.infradead.org
X-Gm-Message-State: AOJu0YxHhB7EUnKrC7xDvgXtf+2CYPSebxxLO4GjUKIKyh1ppbtF01XD
	ueshPRrR1ne8D0GAiYjhv0wY7YOhPtT9rWDLjJWvfoA9KbEQpvkdDqaJQ/bWEMi3a98=
X-Gm-Gg: Acq92OGl2mKIR5/eJYnG/eKCu937Cg2X6mVul0XE3PVMuvFsbebQWOpVsQIzBArLowm
	0cebe4iliFScFpJZKGfwDPYkgeD+dGguxTAkpmWDXpaJ6MJ+nZDASZ76hjvOfgjGbOZ8NDfYOfA
	AcKEFCd73Gct7U8jK02ekK0mdzWRZRifzzOO47tVrsDppRvEKjT4ist+J9zE6bx6uf1x8FR2BK4
	lcJ+gUbSjvIvKMRb6ZoEGxC4wcBYGTAWzTwzvcGutSCmG0YK7k6LDt4SweufaFUroaeS3irCNKN
	v2WszFIuS+R0RtiwGzkriXQnOcA20KbOB2UBbWYTefJ2ZlBzLyb6MPoGS7LHBLinwdH1OgohibE
	1X504fMDimkyt+4xeLwuJsQO0FMuo2i4wn2frV2OEH1fETlFeYbc3mVPiz3QyVqH7Poo+g6F3xe
	9rfO0PYOtBi5YPy73Xp5betaNdkGP2oLklNgrVVQXSe9cofrI=
X-Received: by 2002:a05:600d:849c:10b0:490:b58a:e6ff with SMTP id 5b1f17b1804b1-490c26e1aeemr178859365e9.22.1780932375459;
        Mon, 08 Jun 2026 08:26:15 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm57162809f8f.36.2026.06.08.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:26:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:26:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <aibfFQpK0Se-SiaT@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_082617_358876_95816556 
X-CRM114-Status: GOOD (  10.00  )
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

On Mon 2026-06-01 00:17:40, Andrew Murray wrote:
> boot_delay has been deprecated in favour of an extended printk_delay,
> let's update kernel-parameters to reflect the addition of printk_delay
> and the deprecation of boot_delay.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

