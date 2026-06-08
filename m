Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39D2CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68P+IvGopl7vOMGvwR8RStoFVF/R6GJT532HBzXY5XY=; b=B5qix39Krx16uL3e+W1t19mBFB
	S/HHEzkogHo4boN4SmRqlSKHnlZc/Qpy1Mfb+lUBODsd8+Gs0HB4KUGBbFzmYknk5eWPNCix2wGSt
	mXjh9SP0Ljow8AbxoCZGBTbeWpilKoh9VK9MOGCO2VBxsteHeB2NprU0m1I/XHs3WdI8Xyfep54j0
	ZBnojvb6mNnqW/h1h9IuZ6MvAzSqXSdsxFHBJ2dKwm2HSj7hV579M1DfCW3KDQZunA9BMUmKnKN7Y
	148hpoDzpicORA28Q4/ko7P9d0EMZs2gp2hO+11sRDg9GCGSLGsm8a2irYQKQ3fOyYr6nCqxI3nr/
	VkJ1GdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdFq-000000047CS-2m1N;
	Mon, 08 Jun 2026 16:55:14 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdFn-000000047Bv-2c9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:55:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c8573e75425so1722842a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780937710; x=1781542510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=68P+IvGopl7vOMGvwR8RStoFVF/R6GJT532HBzXY5XY=;
        b=m/2/lF8iSctttN0jC41PIVwCeJ4KIrgXuX9iP+MdoOHpngpDjQiPymSV0VsB1oYsuO
         1YIyV7LSaPqXAO2ly/1JotR7Xl+JLY+AFimNaCV+cBEldB/EqkAtEeag62/BFqq1mpeC
         i5Os/ckfhYD4JRpNUx54P8WsY6tg3c1lJxe3/n76zm+jQO9VHQ2wjUTaWLXkBwYE3ETa
         nJqA/9GmErWA0y2tnNKil0njrW6fAyVAQHv1HK+IvvIzB35dQDtkEiWZuLhwTC6hEAAR
         +/OnH6W7XhtlogNMNyXHueVOdYQ94W+quI3yi+pvGkwWFfBHPb0qsXHN3w2pXU93KaVQ
         f+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937710; x=1781542510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68P+IvGopl7vOMGvwR8RStoFVF/R6GJT532HBzXY5XY=;
        b=dCYM7i8dPEPH0nIRoSdBc74cr0NvKcTbcGjAMt5wVv3Q7bhehHNNBNCLtx+LpZP+e6
         YEEaSasZRjvQE/XNx3y1h8rJXc1VoripHgy2GvQ9VGWzuwv8L5IYKvFz5n1bWH+uQIZV
         CC/W5Pda5HljyGp2sEVRjU3WOGUTYQWuGl6drkiVMwKj4QPKC4jvuL7eZegMHwvISxqU
         y4vB7xvjmqOZb6uHk1dcjYVF0JOEji7bO85kidmjdbM/78tcu3bzpFAFTSLexxyb955o
         K/wviPrMbhj4dVOep1N3+ztrzmHDJXJGhXaBVyt+zAoySduFZiE3UFidVSdcls+RFxHH
         T5FA==
X-Forwarded-Encrypted: i=1; AFNElJ87vM02yvDezsr0f7i0lN0Tn5b0P7TgJ1XSYovMetKiQWjGTPQTb6Y206tOoGbGlQVRLZHYKqsy6qbxrAf+ShF8@lists.infradead.org
X-Gm-Message-State: AOJu0YzK6VISyXLK6EoSFqGJN/d1U2Vbf3nbTXMrgWQd6cmvvaeTd8jB
	HvGAkuC0aEBRZ1HswyW/Pk3uIMp1MWWaMrG29EwJ/6aG3dVshT0ZiyIa
X-Gm-Gg: Acq92OF2dfdPQuBXtROv4e/QY77ddQ0WiCXiG5rh/rzSgjKYCcCjs+kBEu/NqJd8oZ0
	wtwm/U5CE6puGxB90n9ukMV4E4gB0ZgeL2+pGOH7fJkoOj2evHoAiqe6xiv0S3PtzBE5GxoO/8/
	LAtdjGiQCgb9P/afErUzDuYDybiw9DREe0A7m+Z4VrvcdriijPFMk5mwUOCViZ84Z8ahrBHrDZz
	otQI3+8l/MODcQW7J5yum4+qyopirhAC5f57FKFl+YIdpQfdwSpR6n6l3pnQ4pin7h81tawI3HR
	WNADy2lf5c1Unan4xQJhl5I/xxRtmHAdsJv7Mgb90GQeJhkw6SNfKCnfk4aZ6sY47XFfoqYarF8
	d0v2EXyDcXFQ0AD/HprP1hpTWxl5VdBZ17pFw6bxsfnYm/8cEfB6kll+tHFmc+KQ9uBk//Yatfl
	FWJcThcIqn8KTIsTM4KD0nTQS10u801buHtpBx
X-Received: by 2002:a05:6a21:685:b0:3a8:7fb:ca0e with SMTP id adf61e73a8af0-3b4ccf91e30mr20858772637.23.1780937710303;
        Mon, 08 Jun 2026 09:55:10 -0700 (PDT)
Received: from google.com ([2402:7500:498:d80a:6ed1:11c1:50ff:fc30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df034a2csm16345455a12.3.2026.06.08.09.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:55:09 -0700 (PDT)
Date: Tue, 9 Jun 2026 00:55:03 +0800
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
Message-ID: <aibz51FAJG1neRg1@google.com>
References: <20251202082613.3265761-1-visitorckw@gmail.com>
 <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
 <aYAxbbkHslAP9RBN@google.com>
 <bb521240-ab53-4c5a-aa1d-6b140ed4262e@arm.com>
 <ac-BEX0Rfe9RBJJn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac-BEX0Rfe9RBJJn@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_095511_669904_CFE64B73 
X-CRM114-Status: GOOD (  38.32  )
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

On Fri, Apr 03, 2026 at 04:57:59PM +0800, Kuan-Wei Chiu wrote:
> Hi Suzuki,
> 
> On Mon, Feb 02, 2026 at 09:33:59AM +0000, Suzuki K Poulose wrote:
> > Hello
> > 
> > On 02/02/2026 05:09, Kuan-Wei Chiu wrote:
> > > On Tue, Dec 02, 2025 at 09:26:19AM +0000, James Clark wrote:
> > > > 
> > > > 
> > > > On 02/12/2025 8:26 am, Kuan-Wei Chiu wrote:
> > > > > The cntr_val_show() function was intended to print the values of all
> > > > > counters using a loop. However, due to a buffer overwrite issue with
> > > > > sprintf(), it effectively only displayed the value of the last counter.
> > > > > 
> > > > > The companion function, cntr_val_store(), allows users to modify a
> > > > > specific counter selected by 'cntr_idx'. To maintain consistency
> > > > > between read and write operations and to align with the ETM4x driver
> > > > > behavior, modify cntr_val_show() to report only the value of the
> > > > > currently selected counter.
> > > > > 
> > > > > This change removes the loop and the "counter %d:" prefix, printing
> > > > > only the hexadecimal value. It also adopts sysfs_emit() for standard
> > > > > sysfs output formatting.
> > > > > 
> > > > > Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > ---
> > > > > Build test only.
> > > > > 
> > > > > Changes in v3:
> > > > > - Switch format specifier to %#x to include the 0x prefix.
> > > > > - Add Cc stable
> > > > > 
> > > > > v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/
> > > > > 
> > > > >    .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
> > > > >    1 file changed, 4 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > index 762109307b86..b3c67e96a82a 100644
> > > > > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > > > > @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
> > > > >    static ssize_t cntr_val_show(struct device *dev,
> > > > >    			     struct device_attribute *attr, char *buf)
> > > > >    {
> > > > > -	int i, ret = 0;
> > > > >    	u32 val;
> > > > >    	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > > >    	struct etm_config *config = &drvdata->config;
> > > > >    	if (!coresight_get_mode(drvdata->csdev)) {
> > > > >    		spin_lock(&drvdata->spinlock);
> > > > > -		for (i = 0; i < drvdata->nr_cntr; i++)
> > > > > -			ret += sprintf(buf, "counter %d: %x\n",
> > > > > -				       i, config->cntr_val[i]);
> > > > > +		val = config->cntr_val[config->cntr_idx];
> > > > >    		spin_unlock(&drvdata->spinlock);
> > > > > -		return ret;
> > > > > -	}
> > > > > -
> > > > > -	for (i = 0; i < drvdata->nr_cntr; i++) {
> > > > > -		val = etm_readl(drvdata, ETMCNTVRn(i));
> > > > > -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> > > > > +	} else {
> > > > > +		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> > > > >    	}
> > > > > -	return ret;
> > > > > +	return sysfs_emit(buf, "%#x\n", val);
> > > > >    }
> > > > >    static ssize_t cntr_val_store(struct device *dev,
> > > > 
> > > > Reviewed-by: James Clark <james.clark@linaro.org>
> > > > 
> > > Thanks for the review!
> > > Is there anything else I need to do for this fix to land?
> > 
> > Thanks for the patch, I will queue this for the next release (v7.1).
> >
> Just a gentle ping.
> 
> Since the v7.1 merge window is presumably opening in about a week, I
> noticed this patch isn't in linux-next yet and wanted to send a quick
> reminder. Thanks.
> 
This patch still applies cleanly on top of linux-next.
I suspect this patch may have fallen through the cracks.
Would you still be willing to pick it up?

Regards,
Kuan-Wei

