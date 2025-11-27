Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28CFCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CIPxSe6WqdAeZvPYoUG24H2wnnUhwZ4rLI2ODwXSBI=; b=3idWfyjh4cT031fS7nrNUt4AUC
	ytnFuFl4BmDRTcKMw4wSyOynlhvA/+mbC8tfQer3prxpbd/ShpuZd7NDnkmllqZnU907/r0mZ8Tnl
	lj8c5U1U44KmXhG5GFtC1qi1f4evtajvXvLtkkdwn+dWHNGkT5nQTncP6NpPQ1cYIscjGcWuUNrs4
	DIvIeZtalT64BX/zxIy8Ak6Zusvdi7i4OrtWE/FmRZa7yItQDcdOKQjWwVt3nKH6H2lRGzCjXr+ex
	vk00neP75lKt0gQUTTxdz8arHNQC9tG3NbmAZSDrNd0pXwbEKvTG/ZllYwDReaoub3POWTnzigsgT
	N2kuLamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXcc-0000000GEIS-2SF2;
	Thu, 27 Nov 2025 08:45:02 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXca-0000000GEHi-0zHb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:45:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so407095b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 00:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764233099; x=1764837899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CIPxSe6WqdAeZvPYoUG24H2wnnUhwZ4rLI2ODwXSBI=;
        b=Pf7xjuqWfMGM9NTmerbOpVB2gBb+Wn/wm7dvHHw6wOQ5nUNYMKhs5g6smu2cpxvuZj
         vs4729mQulYd7U2OHwOejQjaITBjxhScOQLOVsh9IFMVgIibEOoMxAYTXf5vJf4a3x0H
         eMZlvorRLAqYrTyiSWzjInfg/gkf/Fr4bAO8bDZ3jgEx3mVKRKJ2N+YwGTe68cI/lIrU
         ft1CNiDJFF+br8No5Yz1bsb5MMG3AoSxnX9XtlygglZfmGv0xg8DeU4TYAU/Dyg29nc+
         mJnVGc7qHzKKhh0fTmkRhVnBlnPj+3BuscAeFKWo3M05mxRA6NxV9YJttEDSZXNooS9V
         Xpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764233099; x=1764837899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CIPxSe6WqdAeZvPYoUG24H2wnnUhwZ4rLI2ODwXSBI=;
        b=MKQ3EirUCvnuwoNPaNEY7BmqoBi5b+sjuRWGI/TODNcqQyGuxq5qewhyFxzxJNkfor
         4oIYjWnnu3M9tV503E3Har9Gd1BGZqbnIHYLU4/lZ8tjlZwoLFUBrZmd4tO7JEzUNLnF
         szXScMeenz8/osNWnye5L0lzKGOxX2JjmJoXlQwJ64x3MV1X7C1KA7GeEfuoHA8rwy8V
         gBPsdAr6bIyAO1TtvqHCMxpQED8173cdiSTosH+tASuoS01e1iDXkqYQNWBZfXepxz+P
         lWZM3Dh/ttCYDiXCquZBrbGhpRg90pgYLSFbmOVpU1+xmSQ1RzEJmu6BuguAa/xTqSi9
         Ftjw==
X-Forwarded-Encrypted: i=1; AJvYcCU4qgY3cwzORWCSeRP9nM682oxREoLGqWPZ7035UK0yWfjcMeN1J1bkb3cL0ozR/h3fe3AaeqTZ0u1WDMgK5gua@lists.infradead.org
X-Gm-Message-State: AOJu0Yy88DWbneGE6SvIukIey0u167jLUtLJdpOHeajvxFgOmkK3+RvH
	o/u6TP58n7HovWfXEC/gQlFa2SnotNoJ9gPvo5O3lBs48TECjWHWfXGc
X-Gm-Gg: ASbGncuy6e/udSfSlR3/sdphp23b/JT8CI1/3sxf4eDplcrCVZrcKOrIq7ZFavo38m0
	oCCTfkiX7kpy9M8gC/4OQSEqR4mOowCfJZS1jVHl+yinwPasIqzbnEvFBt6Q4jrtHWtrpH6drjh
	6Io9EvbOWK1xNhPRRbDwwYVJ4XwyBkkoFaUeilQy2QBCwo67O24lQUbSLpx5Bxi2gF95fg3Sd8i
	EUl7Q2kQePuNeeUCWxw2LfL1ipkbST7JP3Q/JM8vDzscGF/i1Wegc06MXV57Dfb9tD95ru8DIgT
	/gUAct7VXLQGST6MRPwCskdhkjBYPnl3Q5Oj0ei8oG5J8hsbk4RocCN2EMEMmsC34+/+V5h2VS5
	NX3ZDEhrc5JsGKT/m05O2td9cPRRMlwUBs6pcdSIUs8aAntC8lFXiXFk/h5jzPq/F0L9DbcV3bH
	aohNZ1hZUJJQ3nM8kXdhYGpcpp/3XQhg==
X-Google-Smtp-Source: AGHT+IFpB8QDYo0X047UxMjQMoL/8YC0eWeUsVVGFheJ8SWeVasCDnSIvPVoTh2rziXGzdE/Gyyz8Q==
X-Received: by 2002:a05:6a20:549d:b0:35f:30ff:89f6 with SMTP id adf61e73a8af0-3637e0d10c4mr12036204637.57.1764233098786;
        Thu, 27 Nov 2025 00:44:58 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:9dba:732d:751a:dc3b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm1105129b3a.50.2025.11.27.00.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 00:44:58 -0800 (PST)
Date: Thu, 27 Nov 2025 16:44:53 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <aSgPhd4u3Oqi3Ymy@google.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
 <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
 <CAJ9a7VipxW5-2roAQA3y212sQWr1kq2HNbLK1jmLNP1jFseYiQ@mail.gmail.com>
 <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68efd5a2-3b65-4f37-9bf0-40c4e5ade480@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_004500_283763_FCF6483F 
X-CRM114-Status: GOOD (  69.50  )
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

On Wed, Nov 26, 2025 at 10:57:23AM +0000, James Clark wrote:
> 
> 
> On 26/11/2025 10:49 am, Mike Leach wrote:
> > Hi,
> > 
> > On Mon, 24 Nov 2025 at 16:12, James Clark <james.clark@linaro.org> wrote:
> > > 
> > > 
> > > 
> > > On 21/11/2025 5:02 pm, Kuan-Wei Chiu wrote:
> > > > Hi James,
> > > > 
> > > > On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
> > > > > 
> > > > > 
> > > > > On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
> > > > > > The cntr_val_show() function is meant to display the values of all
> > > > > > available counters. However, the sprintf() call inside the loop was
> > > > > > always writing to the beginning of the buffer, causing the output of
> > > > > > previous iterations to be overwritten. As a result, only the value of
> > > > > > the last counter was actually returned to the user.
> > > > > > 
> > > > > > Fix this by using the return value of sprintf() to calculate the
> > > > > > correct offset into the buffer for the next write, ensuring that all
> > > > > > counter values are appended sequentially.
> > > > > > 
> > > > > > Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> > > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > > ---
> > > > > > Build tested only. I do not have the hardware to run the etm3x driver,
> > > > > > so I would be grateful if someone could verify this on actual hardware.
> > > > > > 
> > > > > > I noticed this issue while browsing the coresight code after attending
> > > > > > a technical talk on the subject. This code dates back to the initial
> > > > > > driver submission over 10 years ago, so I was surprised it hadn't been
> > > > > > caught earlier. Although I cannot perform runtime testing, the logic
> > > > > > error seems obvious to me, so I still decided to submit this patch.
> > > > > 
> > > > > Nice find. I think the point that it wasn't caught changes how we fix it.
> > > > > Either nobody used it ever - so we can just delete it. Or someone was using
> > > > > it and they expect it to always return a single entry with the value of the
> > > > > last counter and this is a potentially breaking change. So maybe instead of
> > > > > fixing this we should add a new cntr_vals_show() which works correctly. But
> > > > > then again if nobody is using it we shouldn't do that either.
> > > > 
> > > > Thanks for your feedback.
> > > > 
> > > > I agree that if any tool relies on the current behavior, this patch
> > > > would break the ABI and violate the hard rule that we must never break
> > > > userspace.
> > > > 
> > > > However, I am not sure how to determine if any userspace tools are
> > > > actually using this sysfs interface. Is there a recommended way to
> > > > verify this, or a standard procedure/convention to follow in this
> > > > situation?
> > > > 
> > > > Regards,
> > > > Kuan-Wei
> > > > 
> > > 
> > > There's no way of knowing apart from deducing that there are 0 users of
> > > the 'correct' version of the API because it never existed. This isn't
> > > even a regression, it was broken from the beginning.
> > > 
> > > I suppose it does work when hardware only has one counter, but I don't
> > > know how likely that is?
> > > 
> > > Looking at cntr_val_store() I think I was wrong before when I said it
> > > should be a separate file for each counter. Writing to it already writes
> > > to the counter currently selected by cntr_idx and splitting it out to
> > > separate files would have to break that too. So we can fix the display
> > > bug by making show operate on the currently selected counter in the same
> > > way as store. Then it makes a bit more sense and we can delete the
> > > "counter %d: " prefix.
> > > 
> > > ETM4 already does it this way too.
> > > 
> > I agree with this.
> > 
> > The difficulty in having a file per counter is that different
> > implementations have different numbers of counters. Rather than
> > complicate the driver by dynamically generating the sysfs files, the
> 
> It wouldn't be that hard because there is a maximum number of counters.
> You'd generate them all and then use the is_visible() thing to hide ones
> that didn't exist on that device.
> 
> But it looks like we don't want to do it that way for other reasons anyway.
> 

I don't feel it is my place to say whether the etm3x driver should be
removed entirely.

However, if we decide to keep it, I agree that aligning cntr_val_show
with the cntr_val_store behavior (using cntr_idx) makes more sense.

Here is my plan for v2:

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..77578885e8f3 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
 static ssize_t cntr_val_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	int i, ret = 0;
 	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		spin_lock(&drvdata->spinlock);
-		for (i = 0; i < drvdata->nr_cntr; i++)
-			ret += sprintf(buf, "counter %d: %x\n",
-				       i, config->cntr_val[i]);
+		val = config->cntr_val[config->cntr_idx];
 		spin_unlock(&drvdata->spinlock);
-		return ret;
-	}
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		val = etm_readl(drvdata, ETMCNTVRn(i));
-		ret += sprintf(buf, "counter %d: %x\n", i, val);
+		return sprintf(buf, "%x\n", val);
 	}
 
-	return ret;
+	val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
+	return sprintf(buf, "%x\n", val);
 }
 
 static ssize_t cntr_val_store(struct device *dev,


Given the upcoming merge window, I plan to submit this v2 after -rc1
is released.

Alternatively, if the consensus is to drop the driver, I am happy to
submit a patch for that instead.

Regards,
Kuan-Wei


> > single file + selector paradigm makes things easier. The index is
> > validated against the actual number of counters for this instance, and
> > read/write occurs for the selected one.
> > 
> > Regards
> > 
> > Mike
> > 
> > > > > 
> > > > > The interface isn't even that great, it should be a separate file per
> > > > > counter. You don't want to be parsing strings and colons to try to read a
> > > > > single value, especially in C. Separate files allows you to read it directly
> > > > > without any hassle.
> > > > > 
> > > > > > 
> > > > > >     drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
> > > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > > index 762109307b86..312033e74b7a 100644
> > > > > > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > > @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
> > > > > >      if (!coresight_get_mode(drvdata->csdev)) {
> > > > > >              spin_lock(&drvdata->spinlock);
> > > > > >              for (i = 0; i < drvdata->nr_cntr; i++)
> > > > > > -                   ret += sprintf(buf, "counter %d: %x\n",
> > > > > > +                   ret += sprintf(buf + ret, "counter %d: %x\n",
> > > > > >                                     i, config->cntr_val[i]);
> > > > > >              spin_unlock(&drvdata->spinlock);
> > > > > >              return ret;
> > > > > > @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
> > > > > >      for (i = 0; i < drvdata->nr_cntr; i++) {
> > > > > >              val = etm_readl(drvdata, ETMCNTVRn(i));
> > > > > > -           ret += sprintf(buf, "counter %d: %x\n", i, val);
> > > > > > +           ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
> > > > > >      }
> > > > > >      return ret;
> > > > > 
> > > 
> > 
> > 
> 

