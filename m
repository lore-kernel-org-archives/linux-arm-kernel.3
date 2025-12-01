Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6BDD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDER+MAQplrxhK0hdlEzUbQpxtfqDMXbC4KPwCBf7Lc=; b=XaPjhWkDZM/qef2yzJUKErPG8u
	EsZKQjzGxuBAJrOjPNzNssw6X6505qz4xPxwGRLaNUuE+4Pn7yWiWpy/1nb71K9msDUChwCryDc5p
	VdhrCmlfVZYs2kqqoi1ln239olOjD+vUyZgwuWYWLOGFOZnaQzNb433I/fxouR3fwLvadj0Cmb+Pa
	Wh/KhP9wDo5hHigfyN4KPcGmpRqoh7GbUx+VLUu1nBViRzK+BnEBBCB4Lo/9xmu8+OBdbApZKWLz+
	wTM0vseIH2qevy24a2Y3eSvLsHzaHGXSFmW1mCzsl7fCA3SP0ARpTeg6lrpihBbKbPFCwxybP2OHQ
	tKV77W9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1JL-00000003Lkb-0G1L;
	Mon, 01 Dec 2025 10:39:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1JH-00000003Lje-42Nw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:39:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7aace33b75bso3911966b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585551; x=1765190351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDER+MAQplrxhK0hdlEzUbQpxtfqDMXbC4KPwCBf7Lc=;
        b=YB4j6NuD9lA4HmLjt4fVpYprNC1PIYpl/GfQgIH34Sm8i4tQRqBaZqWGXCoEKovM5Q
         1hTZ8fI24dKmoziH/ed8/fuBVogkQMDleqjnIFIzIx1WnCkuHgdHLbh9ZddK7gy6U4uY
         hnTAi06SpPXJ1KXbr2N3pSlZ6fR7D0R0Np0Xfiq4H0ThQ2VJ+fGQx/Q4dKOLnr54SsrS
         1zT2fnErSQ9MnW78dC5NCrmRjjKCgeYWNs7tS3SL3cupVJDyoc19uJDilhHeO+0LiTKZ
         IunzCiKnDEiEVwvo1bb1Nmd1nOrqNdNMcmQMIxmUD48ehWrm2whjg3Ha5fgpe24ArUp8
         UKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585551; x=1765190351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDER+MAQplrxhK0hdlEzUbQpxtfqDMXbC4KPwCBf7Lc=;
        b=t2cnpYGuVBST5NPeHMmnN1zp9PbpFvZ1kizWM9CqJv/SFiTcTCZ1OPV7phKppsIF6c
         Z6jDXyzWu0WabBRRKXGn3MbeSy8yXRngKUrsNU3pT4DBlUXB4NrJ6w3o9lJT4htkvRfJ
         BTI8Nm3zEJaPosQsUJvejZQgu0JnS70PrH4XQuut5UhfZKOKz2hmKHku+UFR1n5O9hZU
         4RvFwn+6lLZ8L6B3hcyn+TltBpp0rr8U+3pAane1YE6a/GOMGNLjDZWDVEEWGNIcfIHZ
         ANxxXDLu3ctHKBeV1Am7RYTEm68VDcclQcXM0VCclGBDHyjLs3hHjfJQHmO7vAWr41oy
         Evog==
X-Forwarded-Encrypted: i=1; AJvYcCXCiVMH/jVam7oH+O/A48P6IkLZyacnvt4FrfbetR534r5FbhhLc99OPLoMRQPp1fMdCo9ZQEpUUIP7kVPiThtd@lists.infradead.org
X-Gm-Message-State: AOJu0YwtiT0rcVy8+zP6b/s/LUef5C27YiWWilEmawwJJE5Dpw/9OYqH
	tqtnFrDRrsP60mBfP07jehr9UeFLeMYCqWUmHns41PDstpsLMjF8xwiwoDuIKKPa
X-Gm-Gg: ASbGncuiReQE1q/8LLSq27vQCTW0nsuHXYilcz8lTwY8L8F/rK3a23FOhh2SO3lV/1f
	fGp2gMBoaFRRwVtd/hLpPAu7L6tI/TW978bcmkOWyDjfcHfSVg7IEiAu0Xfye71uFfE4P7eqrmf
	LGhRBN0dg57BkaTKNQ+g95Jqhi/Qd33A1x/Diiaw5VZxXF/tQzqtatY+1pVuIO/Cv+CbhGjCVpe
	SWgwKRGQZOnUSJm1Dzlv3N79t9QWMtz+iLwhjpoJ7YJLf+e2GoO5O9XUDwhZfYxFLVuZuPvfRGp
	ce2EVcKIQE6v1yhaYqrYRiZfcrRFbQ/211Vg6qQsYCp+PH470A2E9lOw5ZOILiVb1ctBvkn+d33
	uQAMaqM366C+NLlHKoP4tAjSfkYnRm/BcW/wLizqwWDteoT0Fehx2aI44/g8WQZZkI/GydGB3jQ
	gYDMO9GBOAeHc7fNzF6OM=
X-Google-Smtp-Source: AGHT+IHF+eZVE3C0cEuEBRumNGUDfaRlB4Mv1q8oJ5yjxaz8ScKS+9O6EnZusB3BjbUji03iZI5cZg==
X-Received: by 2002:a05:6a20:72a0:b0:342:a7cd:9211 with SMTP id adf61e73a8af0-36150f05e58mr40521914637.34.1764585550855;
        Mon, 01 Dec 2025 02:39:10 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:9418:7391:496a:8ca8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68367sm13267239b3a.12.2025.12.01.02.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:39:10 -0800 (PST)
Date: Mon, 1 Dec 2025 18:39:05 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org,
	mathieu.poirier@linaro.org, leo.yan@arm.com, Al.Grant@arm.com,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
Message-ID: <aS1wSVFnOE906wLc@google.com>
References: <20251201095228.1905489-1-visitorckw@gmail.com>
 <d7c17bc4-a7dd-42fa-8dd3-16a404a6d713@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7c17bc4-a7dd-42fa-8dd3-16a404a6d713@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_023912_030638_4B687512 
X-CRM114-Status: GOOD (  31.95  )
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

On Mon, Dec 01, 2025 at 10:25:25AM +0000, James Clark wrote:
> 
> 
> On 01/12/2025 9:52 am, Kuan-Wei Chiu wrote:
> > The cntr_val_show() function was intended to print the values of all
> > counters using a loop. However, due to a buffer overwrite issue with
> > sprintf(), it effectively only displayed the value of the last counter.
> > 
> > The companion function, cntr_val_store(), allows users to modify a
> > specific counter selected by 'cntr_idx'. To maintain consistency
> > between read and write operations and to align with the ETM4x driver
> > behavior, modify cntr_val_show() to report only the value of the
> > currently selected counter.
> > 
> > This change removes the loop and the "counter %d:" prefix, printing
> > only the hexadecimal value. It also adopts sysfs_emit() for standard
> > sysfs output formatting.
> > 
> > Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Build test only.
> > 
> > Changes in v2:
> > - Redesigned the fix to match cntr_val_store() logic (display only the
> >    currently selected counter) instead of attempting to list all
> >    counters.
> > - Removed the loop and the "counter %d:" prefix.
> > - Switched from sprintf() to sysfs_emit().
> > - Refactored control flow to use a single return point.
> > 
> > v1: https://lore.kernel.org/lkml/20251121002350.1166758-1-visitorckw@gmail.com/
> > 
> >   .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
> >   1 file changed, 4 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > index 762109307b86..a6a650331196 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > @@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
> >   static ssize_t cntr_val_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> > -	int i, ret = 0;
> >   	u32 val;
> >   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> >   	struct etm_config *config = &drvdata->config;
> >   	if (!coresight_get_mode(drvdata->csdev)) {
> >   		spin_lock(&drvdata->spinlock);
> > -		for (i = 0; i < drvdata->nr_cntr; i++)
> > -			ret += sprintf(buf, "counter %d: %x\n",
> > -				       i, config->cntr_val[i]);
> > +		val = config->cntr_val[config->cntr_idx];
> >   		spin_unlock(&drvdata->spinlock);
> > -		return ret;
> > -	}
> > -
> > -	for (i = 0; i < drvdata->nr_cntr; i++) {
> > -		val = etm_readl(drvdata, ETMCNTVRn(i));
> > -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> > +	} else {
> > +		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
> >   	}
> > -	return ret;
> > +	return sysfs_emit(buf, "%x\n", val);
> 
> Sorry I missed this on the previous version, but this should be %#x to add
> the "0x" prefix. All the other ones in this file have it. Otherwise you
> can't tell the difference between decimal and hex.
> 

Thanks for catching that. I will fix it in v3.

I'll wait a day or two to see if there are any other comments, and then
respin with the Cc stable tag.

Regards,
Kuan-Wei

> >   }
> >   static ssize_t cntr_val_store(struct device *dev,
> 

