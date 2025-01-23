Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C604C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYJFJJLzNzJAn7tKjvuUDrRgZAArenLWovfu+NUU020=; b=WDfeGfCe+ssFcO/cqnRgYa5zCK
	6MHJzkEN6D+roTb0Wg8Od04u156roqIheXAErkJvv6u6R4iDilXeBnqHl+e0VxLJNNd6wD4/n4qqL
	IkMh4M032npTjL97kZqUDGpN59J/xtKn/qjMLkm38nkaZeZ1zweNbAzB7fHCnDnXzqTuSTDtCqo0M
	BMA+EYem5cEZIoKb8sAwUYxQZDppa3ZJjOilTBZ0IM77kX48IyoFhe8bzQ657stB2nbg5JBt99z+J
	+Q8cuBVhHyqV1bMqDG7qSOR9On7zu+d7eUD3VAUJt3r8ZI0Vex/cyUQpHtuZ+tboTrRIJOF7x6mcl
	BKPkxPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauf1-0000000CEuc-3h9Q;
	Thu, 23 Jan 2025 10:42:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taubc-0000000CEWI-3ArF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:38:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3863494591bso343321f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737628715; x=1738233515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYJFJJLzNzJAn7tKjvuUDrRgZAArenLWovfu+NUU020=;
        b=sC8z3IerYaS24f1P8T9wOeGpCmP9ydYStnRRLXqBU+fHJT/oOZyO//BGBa0E5L6JOE
         2VeMdp5nNhayQN040dASPYKL010bZ7J6M+/mTqEYfAlucZLx5Dm7IIihdyo/CchnNTpZ
         VWGYpL9liD0HfhFHVSc3YqUouV3e1qTO4tVLHx4QPqWPEDzd2qxkI0IK4bL6DRNP9eJC
         BFvx8pIe5Twt+yIyky0h0SqA21VZpNApf/SLrZWGHXyXh8JxbIpQT5ZbzkrRC5H/Ne+z
         lsFd+H/b+M7EEJtI11XOMH+kGkd+7s8Xm44nqkKEQiOb5u3TYAT+4l1ozV/G7QZMP3Pk
         nD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628715; x=1738233515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYJFJJLzNzJAn7tKjvuUDrRgZAArenLWovfu+NUU020=;
        b=Ku5RYCp5Qf017HEj8TELc4YKG4UoBJ0JIRGlcHcWhEcMFCcvDcXsjLEYeHtr7YStps
         JQJDWZCcW4VGkkp9teDmwvvXNLYq6t0ki+NgTZaNW4fol6yCmQxETje/59b3TGtXT98a
         cWY2YqVLDL+7m12mbv/S7YQO906em2405D7zVztGG9M/XUW+N3FbnWwVycgmiLJAIFQR
         GTLeHr1mX6xWODe6Ns4TM9Qo0w2uvH+QPmY69BrLf8Xj81faLLY9D1UFpgSAoISXiqUk
         AQfOrA97BULbNj2ogdl2RmCnGyl0RwSANPG2H61ILDyPveCuu5fDl/Qp+S5tGXsWYAIb
         WwPA==
X-Forwarded-Encrypted: i=1; AJvYcCVgOaSO8bWuI0wLOyHxwRJkQWFfIPqzE/5hv4hQy/kYDpkNnsged62z/5tWqqJO5Of4hvasv5CYNNH+cAggeCQN@lists.infradead.org
X-Gm-Message-State: AOJu0YySZrhLgMANdRzMywZm8xd2Sc/+d1UtCR6jElWlmcU/2VIkd4ua
	nAE+9Qomi9d3G7AtcS05c39ApYwJ4Fq2HGPy3+OFBbdGV9MsA6eXg80Rl2MBai0=
X-Gm-Gg: ASbGncsD0Fx24YRSzks3/yY4Nb34cTFcevt5pS1C/VPO72zSM7/9vGWsFTPH+nZkihR
	YnhxtR+ETLteWilCSOKwdhhTYzAiSXsPfosJtOVVeL471YoEVuD2a9/D7IzIZT4X25vHgXya2Fk
	/cgTqlNPNd9/RRVleth4HqnsrK52v2cK2g7xdwaXgSvb1l2IdKqYhbCOMC7Vra1xOuCfeCSuIcG
	jmGXTQxIX2Hz3xC2u3MWivJXCGbnb8WK2hnCwSVhCYQ6QqZhv7sI3N6FC1wfIyxcO9JLnFl+ykl
	tjaYcY2LiA==
X-Google-Smtp-Source: AGHT+IFVka4iqlv+f8wHSLTkHDxtLa2dS7V4LAO7Kbt+oHZUKJl3kcd38xxqwMLxo7Hl7A2K9Dihww==
X-Received: by 2002:a05:6000:188c:b0:38b:ed6f:f012 with SMTP id ffacd0b85a97d-38bf566e472mr23216204f8f.9.1737628714689;
        Thu, 23 Jan 2025 02:38:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b319f6absm57036035e9.12.2025.01.23.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:38:34 -0800 (PST)
Date: Thu, 23 Jan 2025 13:38:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: jack21 <jackhuang021@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: Re: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Message-ID: <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
References: <20250123083323.2363749-1-jackhuang021@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123083323.2363749-1-jackhuang021@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_023836_810297_D27BF345 
X-CRM114-Status: GOOD (  11.73  )
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

s/dirvers/drivers/

On Thu, Jan 23, 2025 at 04:33:24PM +0800, jack21 wrote:
> From: Huangjie <huangjie1663@phytium.com.cn>
> 
> spin_until_cond() not really hold a spin lock, possible timeout may occur
> in preemption kernel when preempted after spin_until_cond().
> 
> We check status again when reach timeout is reached to prevent incorrect
> jugement of timeout.
> 

I suspect the real issue is that we exit the spin loop when
try_wait_for_completion(&xfer->done) is true.  Probably we should add
that as a Fixes tag?:

Fixes: ed7c04c1fea3 ("firmware: arm_scmi: Handle concurrent and out-of-order messages")

Btw, the scmi_xfer_done_no_timeout() has a confusing name, because it
does timeout.  Was the "_no" an accident?

regards,
dan carpenter


