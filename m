Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF436E7E345
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxQFvqelXHDHyvDQl7EWq8XKSqTOS9+kkTkwsuSR9EM=; b=a2Rn+BU34poxtHVfrasowfT4K8
	SCue9oPnYJ8sprwa8H9vSLjFyRJqngoUJyCjhhFaZAwXuBOsflsoBgE9JqEPZ+6yMNgwluxsNM9Bq
	fZZPRyaAroUiESHF3kSRlOhsua6WU8HqR3NPIJphfeh9B75ALBBPb0kv7/TbPQZSxscsYeMMcIHh8
	SYrY5QfePvlx7UilaqVJkdwzP1eY/1MSnlrhz9b39JusSPZjP5O4a+q1XwKz+xf60cnFFjyGMb585
	4sZb0iT/pe/Q9RnGyFR8glbdxkp1FkIARFjA+L/oGx+rp1HvBOfiNl3sbyAhFO4zTixV7fNkIVBN5
	vSLNQSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aLs-00000001l8s-0BrH;
	Fri, 03 Apr 2026 08:58:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aLp-00000001l8Q-0iHh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:58:02 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8296dabef74so1677304b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775206679; x=1775811479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxQFvqelXHDHyvDQl7EWq8XKSqTOS9+kkTkwsuSR9EM=;
        b=dVAV6nvRDx9lEiQY6HNNKucqLeHPhbyAqzOjw113sJvMszGLIf50HRlvPpP0jyhSNx
         JeOhoYQutUM4I0GlSMnjd0xKMIBYdKuy1siqHBTKFoQaGpGZvJffLXV602MRxPCJy+kC
         tPu8C26v7cXtgSx7+X+ix11hK6DPUTNt5pP0cvNxJlUxPNpLjVeBEM52g7SjbOj0lFkN
         mf5jDi/iqhdlKZm09+oBU/aKIlk/SkYEiVDOUYLWbu82AlBjDB9nCmDp0boY02OMJZ78
         lLivIPR743J4fnxrKQ7x0Wr4F5KC1jFk2WNpFGp1sDXAMx9Bl5g0m4Xn4AzkiMSZFmF/
         PUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206679; x=1775811479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxQFvqelXHDHyvDQl7EWq8XKSqTOS9+kkTkwsuSR9EM=;
        b=KpoUqUbwfybBw6aegdw2fT4FTry6ZRaCzeVnLSmjjrhraHP6wkzJUMYg7XE4MaCUbe
         1NNaZ4HkDiRRbiRLJHagd3E9x/PVXQ3jwkNgQw/yLB5VRAWIteYWz8cKxGJknWGqsOR+
         zTnuF7NHpm2Ezz1uDCPZmfNzSgieXu7PtjQ+o3Iw4Wbpt1E6X8F8CFEk7OyZqdGche++
         LgpTCyEzuL5CVOpjwjCf773feJbwUs4HXHx8bw0aN7I1/sRViJg8r08jGAlFBj+KUy/d
         eeauluQWLjTKibvvKi9cNgejDb5EYe0a/J8FsfyfneGjsptMhxTWTgUs93LXofRMg5eR
         ZI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVUyVg4mAd2XJO+N9nx6o4QVVoPO2x3Ia+7FTdiUZlGYLqMRqABkxhKHmsi6YDfaSz2v19xOOS0pEBOzBjPsMn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/6WjR/3e95QCU1tRQHXIrm0gIRlmMKobILYxDr80b1EZtv4U2
	Fxs87RX3a4zxnBFeSD+yZBRnkbTlSHTSJetASHR5YiFQVGQgVqRSE9rk
X-Gm-Gg: AeBDievg+c2PRO6VDFe8092J8JJHDiWJNK5gGKgCofaZridvV+4aRT0ebDaVzm0MySx
	5PS0YHCxGNRqx7T5D/vByng9D8L0xmVHltduki22cVTqwnh7m4TpXIZBth5Ad36/AQpJmsGWeev
	AOo7lDuVwDDG2UOT9+LFw8K/LvGRNFwBh//MNfMYBDrTe/vgQ7njuGaCk9fQPFADGvxdbWc+tX5
	8imJCDOy5Hvj5I3rQtp7IHiuBCtQch9fxhR1+DJymWQoYkr1qYph0IrJWT/+odrHR/htASybYyb
	4NB1YH1xDBGEJUX/FUwbwy8weDxZ+z7Yv0D9Twlhd3eqYKjnPyf0sSROddfeOiWvGhzD34mvMDH
	WaxVnNBhqbtfkhfJ2yqF2fbT/IHOfvke1li95R0B2j+Dh949YDzjod61kVcp7zXOVG32uea0BuR
	rE9f/PkrOkeoUaqofgwBQM7tpVAJ2JujWKxIBpkyE9Rvl0NPo=
X-Received: by 2002:a05:6a00:3027:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82d0da3f8afmr2250267b3a.13.1775206679416;
        Fri, 03 Apr 2026 01:57:59 -0700 (PDT)
Received: from google.com ([2402:7500:477:c367:541d:a40c:7624:4482])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm7096151b3a.41.2026.04.03.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:57:58 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:57:53 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>, mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org,
	mathieu.poirier@linaro.org, leo.yan@arm.com, Al.Grant@arm.com,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
Message-ID: <ac-BEX0Rfe9RBJJn@google.com>
References: <20251202082613.3265761-1-visitorckw@gmail.com>
 <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
 <aYAxbbkHslAP9RBN@google.com>
 <bb521240-ab53-4c5a-aa1d-6b140ed4262e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb521240-ab53-4c5a-aa1d-6b140ed4262e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_015801_236707_2D0F176F 
X-CRM114-Status: GOOD (  34.72  )
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

Hi Suzuki,

On Mon, Feb 02, 2026 at 09:33:59AM +0000, Suzuki K Poulose wrote:
> Hello
> 
> On 02/02/2026 05:09, Kuan-Wei Chiu wrote:
> > On Tue, Dec 02, 2025 at 09:26:19AM +0000, James Clark wrote:
> > > 
> > > 
> > > On 02/12/2025 8:26 am, Kuan-Wei Chiu wrote:
> > > > The cntr_val_show() function was intended to print the values of all
> > > > counters using a loop. However, due to a buffer overwrite issue with
> > > > sprintf(), it effectively only displayed the value of the last counter.
> > > > 
> > > > The companion function, cntr_val_store(), allows users to modify a
> > > > specific counter selected by 'cntr_idx'. To maintain consistency
> > > > between read and write operations and to align with the ETM4x driver
> > > > behavior, modify cntr_val_show() to report only the value of the
> > > > currently selected counter.
> > > > 
> > > > This change removes the loop and the "counter %d:" prefix, printing
> > > > only the hexadecimal value. It also adopts sysfs_emit() for standard
> > > > sysfs output formatting.
> > > > 
> > > > Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > > Build test only.
> > > > 
> > > > Changes in v3:
> > > > - Switch format specifier to %#x to include the 0x prefix.
> > > > - Add Cc stable
> > > > 
> > > > v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/
> > > > 
> > > >    .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
> > > >    1 file changed, 4 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > index 762109307b86..b3c67e96a82a 100644
> > > > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
> > > >    static ssize_t cntr_val_show(struct device *dev,
> > > >    			     struct device_attribute *attr, char *buf)
> > > >    {
> > > > -	int i, ret = 0;
> > > >    	u32 val;
> > > >    	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > >    	struct etm_config *config = &drvdata->config;
> > > >    	if (!coresight_get_mode(drvdata->csdev)) {
> > > >    		spin_lock(&drvdata->spinlock);
> > > > -		for (i = 0; i < drvdata->nr_cntr; i++)
> > > > -			ret += sprintf(buf, "counter %d: %x\n",
> > > > -				       i, config->cntr_val[i]);
> > > > +		val = config->cntr_val[config->cntr_idx];
> > > >    		spin_unlock(&drvdata->spinlock);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > > -	for (i = 0; i < drvdata->nr_cntr; i++) {
> > > > -		val = etm_readl(drvdata, ETMCNTVRn(i));
> > > > -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> > > > +	} else {
> > > > +		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> > > >    	}
> > > > -	return ret;
> > > > +	return sysfs_emit(buf, "%#x\n", val);
> > > >    }
> > > >    static ssize_t cntr_val_store(struct device *dev,
> > > 
> > > Reviewed-by: James Clark <james.clark@linaro.org>
> > > 
> > Thanks for the review!
> > Is there anything else I need to do for this fix to land?
> 
> Thanks for the patch, I will queue this for the next release (v7.1).
>
Just a gentle ping.

Since the v7.1 merge window is presumably opening in about a week, I
noticed this patch isn't in linux-next yet and wanted to send a quick
reminder. Thanks.

Regards,
Kuan-Wei

