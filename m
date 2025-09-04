Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169A9CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=; b=DW8/9zx3seYEOvzeu4+u2GtcE6
	hopsRVU4DypSF+K+FfSU6Eh/lO5Rqayr1g+6kcb3HRSJoC9jAHFH9H77WJajJkBim6yTMKoF5N+SJ
	yFbPJa4QMjHcXMYXxXkaDIMRRG1E+GgoZylhk6uJk0/5GFB7UzEtircI+EH5lccrZ39GIGpHifc4w
	WSqMqLZNMDztdKyOeCOew5yuU58UOQg83Sf4+wlcyCx0XAgYk7U/vB0tYfHx+PiuXcpVBvn3Qyadb
	0UuiVGCgA1LK/9vZsT9E4uWA/zwZJeVE+MqEpIW+mq+0i2B0i4Org3TQ39rGci0O17l1h7YysdVBD
	OBUmbpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6le-0000000AjDs-0L22;
	Thu, 04 Sep 2025 10:00:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5em-0000000ALnq-0873
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:49:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso6278165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756975762; x=1757580562; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=wBa9TUkDYYj4vCaxAd+m0hV6onn6UnK6M0q9EAFXeOUQv60ANHYqUQQPCl8/Xkwet0
         XFbwPvwYvGAeSqJs9+N1D7ZqPcly18URjiVRea0B13oAWEEJgwHaPaerRwmMaCh+SgPk
         N0wsn2OflhOKPCPykPO/kPaF4nZdXdPiRbtlvHIie0LM+wUdUiqqk2vHnXIHv6s9mJ0r
         sIyCD918nyIHXGdxxtUh4JQxv73srgKdEZsJ+Jj/eYcjt81UmhYIHmPgO/uzXqsrn6ZM
         u9XM0DyXBf1meAN86+PPajDMQWAos9paoO3DDXSDtCIh2XfaDJXROvE9b7saGyphkJ4d
         JKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756975762; x=1757580562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbFxI1nbUxvYttiFTOIOkRfkrktqt/DTjxu5fMg4KBU=;
        b=Tw7+AbYcePm+82ubw0DDdO+Y2SCA4UEfWwZksRyazRkDbQVAy1QpjEvEfNWXaJcERM
         09PAtk59y9CPGaVneYUeKkaZBAuOF5T3OQ2DYv5y5IAQoMjhd5GnOVuMhFIeAdB9S7FI
         Y0pRwGdABdG7PiffnAW6SisCZAJZoU877zgOWqihRli39CTtdvTtcWaa11Dx+bwtuVaX
         usIACA6tpQHC+VfiekXTSywU5UK1U8HKb/A0g1KiwRzRaBHj4g+IyIWo0WeXMsI+K2au
         IaAubQRr7bV3tdlW5Ala0Tm++/A5B8bN8LVZjcQLAvGUK8Gt/I8sTOTryT47D54+hvUU
         PN4A==
X-Forwarded-Encrypted: i=1; AJvYcCUdTLqKSc701yjhgba8TdyO2kbLZ1SjfGQGbMCdB/YpDwvC8vhKgVAW4wEBmxnbt7HbhK2DdXyLvEnfidxYjTwc@lists.infradead.org
X-Gm-Message-State: AOJu0YzFAvNrl70UoyLCFzb4mFxeRKWPEck/vwYthe6Zp1cg7D4Nh7iH
	+LIqJq8V8LN1+fUktXt5gvH8zhvUUelEY04i3TXr+Vp0TdB61332FcQJVEmhtS7O/ZQ=
X-Gm-Gg: ASbGnctT4IQrDkZxjuPeh1rsVPaTUGoxDV7zLr3Ezn8oqMdUcMJIhBxPIpfOBr39LRX
	NHhhOz9xaXp5Z8ntNA+jSKF+a0sODV2lOQFiJjC5tKwTDXC03b9c4tsemsfWo6WC5F2IZrqGwiZ
	VTzA9z86LHxRwGhgIy77bEFGvzXJFowzH9fjOlEPE6/nahrV1qoOYD/MF3lgINdKyFbW1jvbZQ7
	lIe5nOYY3YgeR+Cds/I6FUW3R2yWCaH37fSLqQj+k29/RSA0SPAClqGLZgsWIJMgbzdQPvgsBCU
	/Y49cPTBYBkPvGJh34B9Kkkp/VZiSX9E6c3mbq9HUHY/UrJiZ9bulSO+Nu4XFkikdUN199OK66d
	cL+Dt3qMMWgaOFWCA9yrAx5lHMwRK5XWfFlqZCw==
X-Google-Smtp-Source: AGHT+IEXzX+ko/VujNgyg1NkhNKGRrpRh4vT/RECxhIyLp2Rrc+Ao5e4p7lcyFLqt6liOn/R8Fm6cA==
X-Received: by 2002:a05:600c:1f06:b0:45c:b6d3:a11d with SMTP id 5b1f17b1804b1-45cb6d3a1aamr38609495e9.1.1756975761979;
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd0754597sm12220685e9.11.2025.09.04.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 01:49:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 11:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <aLlSjZX_l8ifxL_h@stanley.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdapzTTJhAvY1BL8GnUpCc_iHESbY9bFsNTE4Z6FjusiJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_014924_080000_7BE15E59 
X-CRM114-Status: GOOD (  18.72  )
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

On Mon, Aug 18, 2025 at 11:03:43AM +0200, Linus Walleij wrote:
> On Sun, Jul 20, 2025 at 9:38 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > This is version 2 of the RFC.  The main reason I'm sending this is because
> > there was a bug in the first version where it didn't calculate the offset
> > correctly so pins and groups weren't linked correctly.
> 
> I'm thinking of applying patches 4, 5 and 7 of this patch set to get
> some movement in the code upstream and make less work for you
> to rebase the thing, would this be OK?

I think we need to hold of on 5.  I think patch 5 is the right thing, but
I need to make sure that it doesn't break anything.  I was hoping people
who care about it would let me know.

Applying patch 1 is pretty easy as well.  We could do that too.

Sorry for the delayed response.

regards,
dan carpenter

