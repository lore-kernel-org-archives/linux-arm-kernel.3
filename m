Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2810CD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b6KghMzyGlulCdJzKHaDP4v0Z+KFWhNkuEqTY+EVEo=; b=IGLNXIPeMPSWNxcu0cnyXCKMpL
	b0UXTOBofLKSsBruyr95v72zXGTbShufRKvaC50UM12X9qXG/hxqi32lyZQMFhuBnBlPRTgtVkQ9W
	vGdO57bYgt7JIqntvCgyL3ySJehE1JCjn2VpHRpYg9SLtZjwfWsNE9MGoE4WjqjTzaFDzwDqEnDbI
	DJhHgMISr9iI0bmJQvMhJwQfr+68SIAt7TDWlQFSqwjuhkpd9Qy/LxEUNDmCjiWl9NRZnDHv/pMmc
	kCBw8e8ZvqkfAyuae+7f5Vo0sNOzyOLsjMmrIxHu0iyzh4hYy7Grq8GQaZaRlfrisZXQCZc2HdqRv
	w4b9hbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD5X-0000000Epjw-1Skz;
	Wed, 26 Nov 2025 10:49:31 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD5U-0000000Epja-2vMf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:49:29 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso83622371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154167; x=1764758967; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1b6KghMzyGlulCdJzKHaDP4v0Z+KFWhNkuEqTY+EVEo=;
        b=VQRdk3zOQ0D9UdR1XHgqYnzixmx91qD1JcBkw+diJjn6ekSJm0laSOnN0988Aytig5
         IWo8SBoz96P4ZlOiqb8psE2IShYMVC6uF4lcuOTBiv5MP/+GeA1XxxM7GyC302uOw3va
         mWMzHZdYVp806+yhV0ssX9xGbOyeqbdJNqaruhQ51WY/jSO0tI4FVQD6SHDEKGXW5Kx3
         jwB8dyjk3D5+FoP3g+TldW5r4bSir1F810zohgXDNB/ZQg0VTGRAD7sKI7glZawpAJ7Q
         lB8yZzOz9LzIaTV8n7R6YbWgg1+UYd29DS6c7WFsaIKNRXbwXimJw8ZPVwB6aNlbwBYX
         Zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154167; x=1764758967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b6KghMzyGlulCdJzKHaDP4v0Z+KFWhNkuEqTY+EVEo=;
        b=Bt5j09y2jmXdB80Dg8sh6MEKVbmTMwZx5HI80O1HQ+KWDyZnXjdt5YwvRlICdbn0cy
         Tq1qmUNEEqQUzj+wlFSZpzA3ZeyAtVcnfWlHB8E1ViSuAxleAYUOszYp+K+dULSksWQ4
         P2lXWdzNZD17/qBGnU38WdMX4VzLZyYXeozaJ8VQ2ZPSBbjXIvkAAKW7kktwvGrF/UO6
         UeqTaxm+e0315nHpS3TB/MV//dVkBe/ZV0J5VNsRUzAtg9OIwTXCPZ33RY95FoJbPGPu
         t/KYa9LPfiydUEIsI2gtB1hx3RdHrod33syaf1BWWx/pBkKVmVztFSCGXnPOkXa1sA7G
         v1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7X0JjFRuYvK2c/GtKKXh0v9vshwb1tOK0M+Kue8B9YJhEMRQdn4/in9vdmH9SovbIphAY1vT0PpshdwD3qsBL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg9b7+10CoEJbcVg9hEjA5dGne+izce81jQ5V8YCdwqOHh5IN0
	It4O0aeLRUy6pWjQ7oR1Mv4/82/nnYp6MBVpbaecCr3GRpUJA5oksuIk5ttZnILZ0t0umVv2yXT
	XeIEE7xCmAyzbd8XfjjN7lKwyNZXrswKxPyvDcOZ0wg==
X-Gm-Gg: ASbGnct4rDicNFe65jn/riJaKEksaWTMmYLCQ89h/yW31g+GcdQH6fY+LycLLlVo4A4
	c61A8lB5ciPYdYHkPXchQkwibb9Oeke3I+x6H+0f02ansIAOVuoP3mgwxsQFbDMgpbaC7RyCI7n
	oaW+N/Rwz1dz1sACF94PNbJd8U4YVJ9QJwToyB4x+QLfrHBzP+4AHftr+czZroClpftMrgW1EA6
	aiUVrgCdklTPiWrtB15AOIguneg8rwnJtzf+JD+NTZ7qPX5ia+R6aEqzFu6CMYuFWCyte9lIPl/
	LZhWB7JZORxZmXb64Xma/odd0ReK
X-Google-Smtp-Source: AGHT+IEFT2GmylD3gexnqn8BkEkSALqFWUaqq6ae23HI47uM2j6NwHVY2h+pu4iQBc5luXpBMYGgVsZdkzJJNhSakaU=
X-Received: by 2002:ac8:7fcc:0:b0:4ee:1b36:b5b2 with SMTP id
 d75a77b69052e-4efbda3956fmr82730291cf.23.1764154167063; Wed, 26 Nov 2025
 02:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org> <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
In-Reply-To: <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 26 Nov 2025 10:49:15 +0000
X-Gm-Features: AWmQ_bm0-_2XCx4pJEKuCHlhWipkyP1pJtNS4u8xDXl7ZT9nS3C2gMuE2ro4hO0
Message-ID: <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: James Clark <james.clark@linaro.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com, 
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org, 
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org, 
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com, 
	milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_024928_756156_17AE3737 
X-CRM114-Status: GOOD (  52.09  )
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

Hi,

On Mon, 24 Nov 2025 at 16:12, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 21/11/2025 5:02 pm, Kuan-Wei Chiu wrote:
> > Hi James,
> >
> > On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
> >>
> >>
> >> On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
> >>> The cntr_val_show() function is meant to display the values of all
> >>> available counters. However, the sprintf() call inside the loop was
> >>> always writing to the beginning of the buffer, causing the output of
> >>> previous iterations to be overwritten. As a result, only the value of
> >>> the last counter was actually returned to the user.
> >>>
> >>> Fix this by using the return value of sprintf() to calculate the
> >>> correct offset into the buffer for the next write, ensuring that all
> >>> counter values are appended sequentially.
> >>>
> >>> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> >>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >>> ---
> >>> Build tested only. I do not have the hardware to run the etm3x driver,
> >>> so I would be grateful if someone could verify this on actual hardware.
> >>>
> >>> I noticed this issue while browsing the coresight code after attending
> >>> a technical talk on the subject. This code dates back to the initial
> >>> driver submission over 10 years ago, so I was surprised it hadn't been
> >>> caught earlier. Although I cannot perform runtime testing, the logic
> >>> error seems obvious to me, so I still decided to submit this patch.
> >>
> >> Nice find. I think the point that it wasn't caught changes how we fix it.
> >> Either nobody used it ever - so we can just delete it. Or someone was using
> >> it and they expect it to always return a single entry with the value of the
> >> last counter and this is a potentially breaking change. So maybe instead of
> >> fixing this we should add a new cntr_vals_show() which works correctly. But
> >> then again if nobody is using it we shouldn't do that either.
> >
> > Thanks for your feedback.
> >
> > I agree that if any tool relies on the current behavior, this patch
> > would break the ABI and violate the hard rule that we must never break
> > userspace.
> >
> > However, I am not sure how to determine if any userspace tools are
> > actually using this sysfs interface. Is there a recommended way to
> > verify this, or a standard procedure/convention to follow in this
> > situation?
> >
> > Regards,
> > Kuan-Wei
> >
>
> There's no way of knowing apart from deducing that there are 0 users of
> the 'correct' version of the API because it never existed. This isn't
> even a regression, it was broken from the beginning.
>
> I suppose it does work when hardware only has one counter, but I don't
> know how likely that is?
>
> Looking at cntr_val_store() I think I was wrong before when I said it
> should be a separate file for each counter. Writing to it already writes
> to the counter currently selected by cntr_idx and splitting it out to
> separate files would have to break that too. So we can fix the display
> bug by making show operate on the currently selected counter in the same
> way as store. Then it makes a bit more sense and we can delete the
> "counter %d: " prefix.
>
> ETM4 already does it this way too.
>
I agree with this.

The difficulty in having a file per counter is that different
implementations have different numbers of counters. Rather than
complicate the driver by dynamically generating the sysfs files, the
single file + selector paradigm makes things easier. The index is
validated against the actual number of counters for this instance, and
read/write occurs for the selected one.

Regards

Mike

> >>
> >> The interface isn't even that great, it should be a separate file per
> >> counter. You don't want to be parsing strings and colons to try to read a
> >> single value, especially in C. Separate files allows you to read it directly
> >> without any hassle.
> >>
> >>>
> >>>    drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >>> index 762109307b86..312033e74b7a 100644
> >>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> >>> @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
> >>>     if (!coresight_get_mode(drvdata->csdev)) {
> >>>             spin_lock(&drvdata->spinlock);
> >>>             for (i = 0; i < drvdata->nr_cntr; i++)
> >>> -                   ret += sprintf(buf, "counter %d: %x\n",
> >>> +                   ret += sprintf(buf + ret, "counter %d: %x\n",
> >>>                                    i, config->cntr_val[i]);
> >>>             spin_unlock(&drvdata->spinlock);
> >>>             return ret;
> >>> @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
> >>>     for (i = 0; i < drvdata->nr_cntr; i++) {
> >>>             val = etm_readl(drvdata, ETMCNTVRn(i));
> >>> -           ret += sprintf(buf, "counter %d: %x\n", i, val);
> >>> +           ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
> >>>     }
> >>>     return ret;
> >>
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

