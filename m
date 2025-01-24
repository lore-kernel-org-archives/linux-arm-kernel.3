Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B6C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LifBFldK/SpUUkgRIniyUZ0w+Qs+4h46zuwK1mAJwE=; b=FYk2dSpttn8YRRiSZd91IOqaRR
	jBBjRLIUVbp0xpf0TqCqlpuyiOLdnzS6sVdHPvJAK6b81VUkbbOcBgwaRlPpkLZ5+jjIpfPNccKbr
	cDW2UoEoYjhtCROPamr1umeDQapk/HUdzrAThHVbW6k8hz8hn9N/sbCBUHW2mHWf9tOXbSyHgT5Cd
	pi6oGlaPLbtFLSGB9qxl7XPLAXstfyH2bY3gVpWosIkjlwr6eb9C2QkoA2O6+PtOlX3EKZi7C+myC
	5FAXRcPopPnRotiUMX3tTBoijLKFXGvubgBQ+TWNLguhuzPF1Ru+gF2eL0d5zm9sgonSvgXfV8QYd
	OIzGsVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAWt-0000000DpBn-3sab;
	Fri, 24 Jan 2025 03:38:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAVa-0000000Dp7P-2QAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:37:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21628b3fe7dso28222755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689845; x=1738294645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LifBFldK/SpUUkgRIniyUZ0w+Qs+4h46zuwK1mAJwE=;
        b=BPDn9PGfwYub6FyAFUngyZpUQclxIy4RINTx8JuWN8ZxowYgliYwJYQ4tCFCnkd5/k
         rM33YFnQYNucc3TS0wJ1eapdCuLgrc4dkQoCuGXlv2R3Vngw2faZ3+D0Qg3Ka4bu23q2
         L2v4o9dTWPzI0QLYPuUNgV5qK2TjoliWnTqZgn06BM3ZyDLToXYqcryO7AsvY7AuCY44
         8cFR+p66Z78+A6qirVkF3b+rG51n3idzB3gC/rvEjzAo6MkWJB1bWoc+Ghys3nOXRVhs
         5clhwfqRclq7Y/REsy3Js5EEdamVkIMJ4zc/KIGQ4HlqH4bbET5EV4/mMeG8kIy2Zd9y
         BCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689845; x=1738294645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LifBFldK/SpUUkgRIniyUZ0w+Qs+4h46zuwK1mAJwE=;
        b=AYD6rgH4o0mzwigOAHGOb+U7+rBGPA1Gmp5TLe7/Ml7x2yYPMv70VDy0FXvNu0XUYc
         0qzZOKZ1KrI7wj/9S1eI1X4i5wAItNFmpKC9fU8yqqeT56aMz2V96piGlIUKZ4Bb+nWv
         uby0KXPCxW/a/O+PjSsapTUBBgHAOEDKtPQoKD/S1HUCoE4d8umHp4qkSb/FlQBjiGi2
         /Haos2J8QakfCBmHs1QPhlY2pn1wdSIEpTyB8M0/Kk8QBZ9osuPdqx3o6XQeexps0VXZ
         VDGR7j0d/hWn+Ewx3KiLavG7ngtqDahZcx5Ref2PsVFk3dz8GoZfO2wuUBoXH2UvCw9Y
         qTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU9E7jJr+HNAUjhJh28b3tV1Vv31r0U4A/0sZJ/Km8Sf5giwscX3lFuzoD4+uASV0iKWsX39DzTmGg5fMs5pyx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kNRud/Iw4dNVJ8svapQtom2M9H/xI1XOQ9zTnkvotLGEROm5
	f05iMmbaPul9VLGg8I7wEGgdpK9ElmGp+scpvVmVTt9juoNLIxpzYgvmrkvQk/c=
X-Gm-Gg: ASbGnctKYC0hV5ZYD0zsqX7AqtWDGMyuANBlh/0aJUIZwlf8To6AEvmlRqjW4BhMaHY
	7eDutEkrTMCouk0D79jZpg06UywDehENhhD4uDa/66gFbe+zcymhoAay7rq2pG+18zDdyl3eG2R
	LRJTpDu4Y0YlzXVW0cxQC2fnYJrlfqawo+aFo46LFHO8hT3zwp3gY+WqXfcauYLQzkriMInJDa/
	hRu/1CC/k7WVVLqUII+epjZ1oZw+OKYrJplPElFbwxNIiUrASQEr3ZquZZPPWU190VTpk4vmSkD
	kj1aGzQ=
X-Google-Smtp-Source: AGHT+IHcqfC+v8gzUXazCowAQBPBuxdQoh+SZRxB2j3/lIdPn6sKxbgWfYj8WfYvtG+U859TlGDWtQ==
X-Received: by 2002:a05:6a20:72a6:b0:1e0:f390:f2ac with SMTP id adf61e73a8af0-1eb2148e003mr42405519637.15.1737689845619;
        Thu, 23 Jan 2025 19:37:25 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761193sm775883b3a.93.2025.01.23.19.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:37:25 -0800 (PST)
Date: Fri, 24 Jan 2025 09:07:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/33] cpufreq: scmi: Stop setting cpufreq_driver->attr
 field
Message-ID: <20250124033723.akxoajfjct2ju6n6@vireshk-i7>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
 <d4893396c4bacdd995d03a296b9d3ff44e71d072.1737631669.git.viresh.kumar@linaro.org>
 <Z5IvnF_dw3ez33Bv@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5IvnF_dw3ez33Bv@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_193726_629353_BCC56553 
X-CRM114-Status: GOOD (  14.75  )
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

On 23-01-25, 12:01, Sudeep Holla wrote:
> On Thu, Jan 23, 2025 at 05:06:00PM +0530, Viresh Kumar wrote:
> > The cpufreq core handles this for basic attributes now, the driver can skip
> > setting them.
> >
> 
> I know this is boiler plate commit message but it made me go check if boosts
> are handled too even though I checked it in 01/33. So if possible, you can
> add "basic attributes including boost frequencies", that would be good,
> aligns with the change below and makes it easy to refer in the future if
> required. Not a must, I will leave that to you. Anyways,

Even if it creates doubt for a single person, its better to go fix it
(for all commits).

I will do that while applying the series (unless I need to send
another version now for other reasons).

-- 
viresh

