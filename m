Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D102DCFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lymtWkABTw0hdE/FIgSwpoWnmefZZJJLODll+UbmvVc=; b=LHt+6brxOrIj7NQCyPS2KkHpEW
	XVzk8cRi2CVllPL4HMCf+Ym4FYLw+A8XG6inp5XrJDIKVkN8Qt+w+N7Zh7pp0g+0nB4au69HAB+5q
	RdR0i86+LGBNhcQ5Cfg+iCFp4IqwAVTIpf6crdapbjYfOllEBHPwFcBjfsPJROKI4a6qr+neNzWOP
	DTDkY6QY9hxgBecsuKIl7bqpWMmhYf5f35a4Fa/hyDH652NUSC6UbuJv2sRah1B/fEIyrxLRANfsg
	eE4GpSgdQ0tyr6aJWV3BUHC4tXTiGkk8CW/CpaLfVIRVjJT0xxoaJFdqcQhdAqI/f4W2sek6od3DA
	6z5ICB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUWv-00000008loJ-0W1A;
	Fri, 21 Nov 2025 17:02:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUWs-00000008lnu-33X5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 17:02:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2953ad5517dso28888625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763744558; x=1764349358; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lymtWkABTw0hdE/FIgSwpoWnmefZZJJLODll+UbmvVc=;
        b=Rc9axB6NceQttob7MY4+EIGWb2zp75ckekNtMCkGwE4rakayHQlgB+bOdbNabADViS
         14A7EsTrjZSlKl43FpWpoVWkClBLsJ/+YBFvYXEHWU6qiknTmoiSa1MVbfU5o4/ASyUz
         UqibWd/XYci0BDMs3AF/k6T6BtgqCf41vZMq8sVuI6EKb4v5tUKSGduE/vPXoI4uMDGr
         vyVcIh/hK7BzlS20RK6qeMKXpW/qxug+1iHg1/9eNFDehuxPGDucqKt+5B1WbUEx65SR
         i/Cwsirtvi91PZ3nFFa40/XYv9bwkdzGf8uZsbSak2iuBEYiJea4/UO+/ZY+fBqsbiJ3
         Vm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763744558; x=1764349358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lymtWkABTw0hdE/FIgSwpoWnmefZZJJLODll+UbmvVc=;
        b=o68fgBf9Cbl5K97rI5uYgBas2y4b2CfC3ihVOL1lTFTq194D09BBQM84FCR6C9UwJ8
         JVesDtB67XYT+WzjSZe0PUScI6zhMBw6A4eDmycFD7afyJB5K5J84StzjpQ0BTA6iiXa
         Uoo4altQT7oCE+9V7SXn7RtM+fKLen1qo6jkZ9z+kpZ9zKsSmL48Hyz7qJuDIl5Nk8LA
         fYuYUmBW1afU+TytQIu1NqcCyJAcan5vTU+KH0VdCckTIhnkX66GU7whIHKri8ZlGYm6
         ke3OkVWneg/UisijFyo3e1rD0JanMzAHbidcNwiumi1xC+gKet+9v5LEe2o+AT/Kigu1
         6qww==
X-Forwarded-Encrypted: i=1; AJvYcCVP1boS04M+Zny68xAzcq6BajeMAHaoMORzABxOTEK9xCe60XAu/HjD9OvQk1RqlvXH0LiIpC+estxRiMlp6uDb@lists.infradead.org
X-Gm-Message-State: AOJu0YypK4xvg0IIm0ZGfKXKxqOpo+YWeM03/2f7kc1tBb84TRG88nkx
	NLhF9MfTZz6bThCygXF6Nit94577vJpByftbHzKO8Vls0YzpTuD0h3nt
X-Gm-Gg: ASbGnctBDkISXmf4QXykZPNcNCceklrsFUS3j59uwg5WBb2NhEJmjpBVEIeeREUQol0
	8LCm9Hj54+VTOrAyOdZ3DPdHTLh9OvgLwp4cwURCNOJQdvyVjm3d6n++zw8WD90cTqKzufey4nm
	uqeDssbM1I4qt8RnNqnNtZm56w9wluqUYt3u3DcoxyqeUytlGotx5f27l1ImGrJpKBdqej1hd1x
	rED18JD2XbYPnNJIWN5MgvJzL17DMz9GgmN/YdSklF9dHudj7/PoxWrcUwd0dPkid4rhC3MYA09
	6i72mZl45ztbw5cF21HBqR/XmExwyBeBcTc7r64Zzu9/58Ti+eN5FS+3K3M9XwhICoxxFCemqrw
	o78e10DuVWt1tTlfOhu2asxC/AMoxxhhLrPorYgpudaFwTwPjKT0zpbWcsY605Kt1oQ4A1ENUm8
	i9BnSifvYGZEkUBiD6M96wol3a
X-Google-Smtp-Source: AGHT+IESX0iIZC54W5N9ogWNgFKNFvkXrfEsHoQEyi+cB9v/cq+ARm6HldAqJQP+IzueGtEYdLGiog==
X-Received: by 2002:a17:903:384c:b0:27c:56af:88ea with SMTP id d9443c01a7336-29b6bfa1f66mr38248585ad.60.1763744557293;
        Fri, 21 Nov 2025 09:02:37 -0800 (PST)
Received: from google.com ([2402:7500:499:ceaa:ae86:a8ee:bdfa:37bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e7e6sm61238345ad.40.2025.11.21.09.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:02:36 -0800 (PST)
Date: Sat, 22 Nov 2025 01:02:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <aSCbJR9aT1vOpz0a@google.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_090238_790905_DE9A9622 
X-CRM114-Status: GOOD (  40.82  )
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

Hi James,

On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
> 
> 
> On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
> > The cntr_val_show() function is meant to display the values of all
> > available counters. However, the sprintf() call inside the loop was
> > always writing to the beginning of the buffer, causing the output of
> > previous iterations to be overwritten. As a result, only the value of
> > the last counter was actually returned to the user.
> > 
> > Fix this by using the return value of sprintf() to calculate the
> > correct offset into the buffer for the next write, ensuring that all
> > counter values are appended sequentially.
> > 
> > Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Build tested only. I do not have the hardware to run the etm3x driver,
> > so I would be grateful if someone could verify this on actual hardware.
> > 
> > I noticed this issue while browsing the coresight code after attending
> > a technical talk on the subject. This code dates back to the initial
> > driver submission over 10 years ago, so I was surprised it hadn't been
> > caught earlier. Although I cannot perform runtime testing, the logic
> > error seems obvious to me, so I still decided to submit this patch.
> 
> Nice find. I think the point that it wasn't caught changes how we fix it.
> Either nobody used it ever - so we can just delete it. Or someone was using
> it and they expect it to always return a single entry with the value of the
> last counter and this is a potentially breaking change. So maybe instead of
> fixing this we should add a new cntr_vals_show() which works correctly. But
> then again if nobody is using it we shouldn't do that either.

Thanks for your feedback.

I agree that if any tool relies on the current behavior, this patch
would break the ABI and violate the hard rule that we must never break
userspace.

However, I am not sure how to determine if any userspace tools are
actually using this sysfs interface. Is there a recommended way to
verify this, or a standard procedure/convention to follow in this
situation?

Regards,
Kuan-Wei

> 
> The interface isn't even that great, it should be a separate file per
> counter. You don't want to be parsing strings and colons to try to read a
> single value, especially in C. Separate files allows you to read it directly
> without any hassle.
> 
> > 
> >   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > index 762109307b86..312033e74b7a 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
> >   	if (!coresight_get_mode(drvdata->csdev)) {
> >   		spin_lock(&drvdata->spinlock);
> >   		for (i = 0; i < drvdata->nr_cntr; i++)
> > -			ret += sprintf(buf, "counter %d: %x\n",
> > +			ret += sprintf(buf + ret, "counter %d: %x\n",
> >   				       i, config->cntr_val[i]);
> >   		spin_unlock(&drvdata->spinlock);
> >   		return ret;
> > @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
> >   	for (i = 0; i < drvdata->nr_cntr; i++) {
> >   		val = etm_readl(drvdata, ETMCNTVRn(i));
> > -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> > +		ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
> >   	}
> >   	return ret;
> 

