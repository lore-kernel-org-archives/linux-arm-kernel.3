Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DB4FD4F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=; b=K6cOfErdR20ang/ocQeUikA9eW
	nh93NjCNhDeyGZfuUJQLbyacTVbVOe8pR8usT9L8zHe+J3BiaIwmH9Cq0hgPEm9S0YAJrLCq2ddky
	Xbpxu3o5fK6I9aAFq5ZbfgOUaC/1Va3bY498ITByjsuOzOFijG8izzeUXZlFhyuGn/4luz4ZkAc24
	9JNTWefpJmjtYz26PczYV4FsvOCBjxaPqnU4BMF1Nf7qEV2IOCAvBS4lP/RckazeOCA3A6rs0I2JL
	f+tiMjKj/5wiwyVWl4lhRsQsFjwpzF2CKXSnf5sSAmTqfsBjmvzBLsdckxe3L2aoYZqOif6w+h680
	kXRTkUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01xd-0000000A5u0-3Dh1;
	Tue, 10 Mar 2026 18:37:41 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01xb-0000000A5tD-3pQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:37:40 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2b4520f6b32so16213710eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773167858; x=1773772658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=;
        b=gEz3VL4I+ykr8mVFtkCDq8w7YWPlBtvV2TDNDGwVZLtt+R0jyxZDgJQ2xOqxlqrbC3
         9P3yTVTPaYq9vfP2vhFnCvn9lqrmQ9U2KJpFqCW7UyZ85HTM8/WeCmkw054FHShi/V3L
         nBAR4afLYQFHbdsC0WjcyV7r7P/xuNTEWeeWo4lClK4TjXDJpyqESktnMNngaMmaL4Af
         UXTchjvtoKb6zw9nKx4spCzFBMRu2cYidA0ptQir3eNdURgVT89ctPoycgqqd32A/4W6
         Loe1IQMQWgsrmZ9Ca6h70EdMsbvegVRX5PcWy1tE+yZmWLsTS+qZXT4IHmwSTxf/nKB1
         rZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167858; x=1773772658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEydtYkjbJ0qWFFzbilGZORGZlN37D01JySG0l90LLg=;
        b=KXw8mlTMhPYCvyXX6vyqNd+ewP0PEG7vf/EJPEppQNjrVS1K+xU8MphBtXGRoHXeqB
         cKxFfCCIFO4QRNBoPtuJEkBoG9amJsFxLQb0Dfbymffb6m2yH5AaAj3XHBr3sDTz5fia
         EAlBF716eFhgCEjjhJciYPUbrl0fYD2cH9bnB194YD5agliML3cY4CEZryeVfQSkAEda
         9QUVYKh/YvIG5V5JVmJbW2kodjfnrCOFRg/lsSHo5p0XW6rZiXQ6pMYeD/PCVjYVo4cC
         VJg/VJEhQfyv0GDYyoAVFcHV2bqadWKVmA6KvhWW51nA6ffBqK43WD8tzFgcMUAjpYpL
         2LUg==
X-Forwarded-Encrypted: i=1; AJvYcCU+iGmudyGLcaau7ZUOYsyw7LRsC9Y4sM+1E61eJAg9plMBTReEL4k8MgsgckBM1XfI017iXTRqUR47cfOZ/sS5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjw7yW1kD+JOnvyw/ZaFukQTZBMczdswX1NfkV7sWPNgFxPIKz
	JHUPB5V8Ie7r3GMe+j+ZsJ+7/k8Qlw6HPKEa2eJ5IOe8JiIRAbWSIXPM
X-Gm-Gg: ATEYQzwCDHxUHMWnGtsvvirj79dIfV8M17RzlHmVvbskBz/gjardoE6VN0OsdJadSZ+
	L1cqS3rXPzlW2xfxZgu+Fe2W3RBxV3bnrI92Hcy8yFYznRRxQCOfBXTgKdmrF793fY1DAoc/ff+
	di8cVT4RNBWCBoa1+ggjQH/2PKRBbI8UQ8Kss7eDPTn7igw4k6S+qHJfOMmaarsQ/2iH4dvfXFb
	JDQ/4S0nU0EInTX2vAmMcR95GhsrzLm+8j3Nlgh8hX+6289WELjnaENxHOsnQAWZzZ/hzDx7jea
	worNwDC3FbOiavi/u6WMD5yljJMzA4HXWnJ9IzhkFiHPWLvSC8G/8CczC2OZv78ClSW37H8pxVq
	hcbJTD+wH9V3XOI3l5rPc7u5zRLHTggcRzlGparannsi77vsIh61d14tw0w98yepK+rOS6gttNb
	xMvDAeZYcDbqkMcK2H8kRUrXew+K/W7mTmATiCLuZplt0yGF4Bl1uPmJ67kEM6nuVU
X-Received: by 2002:a05:7300:2156:b0:2b8:29e2:93e9 with SMTP id 5a478bee46e88-2be4e08fccdmr5761447eec.37.1773167858414;
        Tue, 10 Mar 2026 11:37:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:9:5df8:fa34:6102:3b03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f64dsm14294515eec.27.2026.03.10.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:37:37 -0700 (PDT)
Date: Tue, 10 Mar 2026 18:37:34 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, robin@protonic.nl, andy@kernel.org, 
	geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, lee@kernel.org, alexander.sverdlin@gmail.com, 
	marek.vasut@gmail.com, akurz@blala.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <abBkk4Ng-_MDHd6t@google.com>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-5-hugo@hugovil.com>
 <aari1Y1CPZSYEVj3@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aari1Y1CPZSYEVj3@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113739_950573_C9BB7E1E 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, Mar 06, 2026 at 04:21:09PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:
> > +static void charlieplex_keypad_poll(struct input_dev *input)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> 
> > +	int oline;
> 
> Why signed?
> 
> > +	int code;
> > +
> > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> 
> Can be like
> 
> 	code = 0;
> 	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> 
> as iterator is not used outside the loop.
> 
> > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> 
> > +		int iline;
> 
> Why signed?

Does it make any difference given practical limits on nlines?

Thanks.

-- 
Dmitry

