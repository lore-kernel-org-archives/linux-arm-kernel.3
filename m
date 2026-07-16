Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A465C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxMW+cZvUWvRljOA6VXL+6atXYnie85udU5ilmsN1H0=; b=nG3lWaohpRXPViHQizFr4sr00F
	c9iO3U/5Q4hvN9FHNH2KW7XHDMstFWlkHHWJyKcHuorwNR/vlZrHT3IsFgjiW67LJBJBlYfJwFmp8
	eIN5Mcf2RwjP7jeQ0hIFoEkVqYBKK3B/Bmo9RLeFEaa1HDHRMcENELTg868XnxjsIUPvrkPXzEPlq
	ndBi9mAmYj+/KyCRBu9WrVfe1QNUb+5KMdfOmJYoNfCH0FgHv+GvRViDLVQHjR2sN1qDn4+FF/kFd
	rCZ4X2tTm7yCkl3WY1QXqnxXCx3rIEi3Ssw1eyjJhJSORZpDPdcMsHnVEjUwA6ON2c3HfMKfTDhmn
	FvBkOBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMG9-0000000HOdq-06wy;
	Thu, 16 Jul 2026 13:36:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMG6-0000000HOcw-11fu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:36:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so41558025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784208972; x=1784813772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxMW+cZvUWvRljOA6VXL+6atXYnie85udU5ilmsN1H0=;
        b=LQnAJDrZRYMvrxAE30E2Sc6bkxoA5EOae9sf/UtfnBkSwIaGe6uMWsWe9YVhUvGBSQ
         1o/SR99nSXirXhTJXg8/9Y6w503TWXaf0lWdtFKPQOdtlHocAE2I0eEAw26ZtwsBLJbL
         ResgCKaa111LV1C+Y8xxkEYDB3s0iKHS0j1oJlgHtAvIr3tdhUHQxiE0NXgQ/2vqt17Z
         uFyiFNmwov1xoWj9yJaHP0wCKnNJVKGtV+7qDROE6AtgCMxgi+hdsG6IcHbwMeaS0UNc
         3LMybj/hYxASkFXmgwhohxPtxn9PoteAie/7lC+BwB+uYOO5qka1L9ZOprtWzSGr6x7X
         t6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208972; x=1784813772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxMW+cZvUWvRljOA6VXL+6atXYnie85udU5ilmsN1H0=;
        b=P+UQTQKAUfWPkkZzhESTQB/Jnkbkd+Z90yUzO/A/NsG1V8O5kbVBf0vD3+cAZ4vNAA
         LXqgxQy5bTjF/FxGxEBur3zWjYdzxv7orKaKpJ8xtiDua/rJrfOaVeLzwi1cbSDi/RFq
         9iDx3qfKLnMxZH6JTGShsxaSmxiiTuaLYz6knqLOtbX8vZjDNb7Xgni4vi1tLQz5y4Z2
         HeVkfqz6KJeMafNF4fc82N6KaTCPq7TC6yw1dfAj2jGIxmyDcl2ye56u75pDNXjbNyx0
         dHOmfn5p/gFbv4bjLDp0/Tl7P5SttQvTtfioemyIdyczvOXu4XNUftauTM2xuBmNFV3K
         qyag==
X-Forwarded-Encrypted: i=1; AHgh+RqVqaFzl99nnpW9qFtZywUpSBdEoBHLrX29vr3YnOr1ln/R4VNdrKHj279vODbjZPkLmGF0TVVysZmwRoCPckar@lists.infradead.org
X-Gm-Message-State: AOJu0YxtGFY5n3n+LVqdQpXPyaFn5EfN0IHIVZQUc1Q0MH167lb9E37l
	C2J3l5L81rNeTMxr6qqmZ5wOpPRzQWl1AkxwwKQwuzou9TvoOaIX3Y8oDoxhxG/92Gs=
X-Gm-Gg: AfdE7clNkcDbPWp91xAGSzs6ep/n8Dozi8JXPMsAGjPqLMe86NYU5ocBJ9RDq1KtxXo
	xmi0JPCqY7mIKVoRGmgCteyUCyxGs4aACjRd0f0hpZs55C1K5trjFxkTUCycnjhoMDxNOUcZY0/
	PaOCNFsMnVQpkrVouUiGt3xg/0zAHjxC55sLGyIiHX+B7Eev8fiI65ysYX/TfjLC094hFGKMxZW
	Ezg/edsg9AUik/8BK+AWDiXiAr6LqwhyqqAE10A5BG5KP/sBRYraSpus2yGURMm3tuTwi7WpksP
	hjEOy9FxMUYD1rxLJEl2uh1aHqOvGMvSukSuKdm0C3s91BhflpWPqIYFXHovN2yuGsAuWjjHL5/
	lv9l+h33ys+SB3xrQX+DM6jARnPynmiScHQSqGB1mdFtj67kux9DId+NYQE70SE6lsEmfcbYtUU
	wKSu/t
X-Received: by 2002:a05:600d:644d:20b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49538992cfbmr95343205e9.5.1784208972253;
        Thu, 16 Jul 2026 06:36:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm24902683f8f.29.2026.07.16.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:36:12 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:36:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 4/6] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <aljeSRmY7K38ySmL@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_063614_302559_D3FABF73 
X-CRM114-Status: GOOD (  16.13  )
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

On Sun 2026-07-12 11:20:35, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> boot_delay provides a kernel parameter for delaying printk output from
> kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> configurable only via sysctl and thus is only used post boot.
> 
> Let's deprecate the boot_delay feature in favour of printk_delay. In order
> to preserve functionality, we'll also extend printk_delay such that it can
> additionally configured via an early kernel parameter.
> 
> Behavior change:
> 
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
> 
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.

s/used to skipped/used to be skipped/

> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

The code changes look good to me. With the above typo fix:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

