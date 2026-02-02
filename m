Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA87D172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjbiA4RQMfYKLmkhjuBB5OyBq3Fn1YFJd6sTAf8pd+I=; b=Jjf3HHpzxCt4QHq3z+6OGC7m/3
	bu3csQs4BpQRKXkOdRMXXo8gOb/HvpzZiV8rGj09v5GQfydRDefzSgohNQ+wXafn75XzSEZHE1Hbl
	2OngwI4g+c0Y3IxbxFyWE0ej+VQ6UoTOo3Qj4T2L5oslgDNyeP1642Uqk8uUniI+LqvYlaIrBX5ev
	gbsjCz3T2QPvdZ083rkTCPOHyRudL5t2UM8ehWsehZ8hEmQAQvpZ8+S6M1Z0BBYBedVkmSA1omFTX
	gAb852rEKT7Su/AfkH1tPLDDYBNDkvDVz1rEk6cDElRBlonpUgXWW36vcS3liw4HjnmGE6BImBwlm
	XUs2hCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmmBX-00000004Rl8-38hV;
	Mon, 02 Feb 2026 05:09:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmmBS-00000004RkF-270i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 05:09:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so2493000a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 21:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770008947; x=1770613747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjbiA4RQMfYKLmkhjuBB5OyBq3Fn1YFJd6sTAf8pd+I=;
        b=hkLsjksvMdpt/sdr2pwD2UvvrKCq0EhkI8FVUC53crNqQEA5vlsKPrxYlgdLHLbX1g
         wVDFWHXrHw/z5h3le4UoBSJ1Xm65wOkUeun2XaklsLFxulxqJACMaScrYSUH5yY4mmca
         MjR/PhGTRH4nCOdp9xXmy/DDfLwkydEWKfMEHewq5xUyyyLjvqh2w0MVlNS6Ntk+WirZ
         yJKQmX5bIX4/5jUCSgkhyQtHb9VF9On2YEuC2bhTbhEERLmC5R3aulfAL7HQluHFP5Wz
         GAwV7Q1gVtlR8d5PGy+qgM0pESGYX8cwsGIS8bpv6iAWKVMJA7TiWRdOnsknHdZKeQHg
         pmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770008947; x=1770613747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjbiA4RQMfYKLmkhjuBB5OyBq3Fn1YFJd6sTAf8pd+I=;
        b=HN1odmfgYaYf6wOtyjiG/RBSR/a+NR1YwOJXU+tStCzLClpXQyasocqUpsWC3CunDg
         y4oQJkOhvmAQEAZGz8dKQr3Aq7syp8k/OhDzgCpOVYl4xF6DumbCZoORvxeq70RW5WOG
         riegH3DvRci9yqzL/Ay14hMBLz8swb6ZxVEPD/YMVb/yaY2fEY505YBU/epJnQV0pVeB
         bbI46I0ac0ZY0hlnwVyhvleszAWHRB4Djwgz4AlcooDuCGOylKjXDBXBvNTv7PFaRq75
         mvgeDzgFvj2Z54jHdFc40JgHPjriYFZ22g+KKldzNL/0b8ztxDaBbSQXIIMK6u/TCDui
         dY7w==
X-Forwarded-Encrypted: i=1; AJvYcCXsXRBvloODdt9W1JvDs6kqB+7EKXFHhBk2+50uRrl59sDxpugqsCpzHmgnmCwueUihkR/3ivxJYYgcJziQ1SM0@lists.infradead.org
X-Gm-Message-State: AOJu0YzfNe0E95091vlhAgyG5uufy4MkP5kfjkxPeJD1ORl3BrAC9I/H
	dwpi3cGonW9g7eWCD/CM9h+HFs5KLIHidPE49o0PQHXfjkD7ge7uU9C+
X-Gm-Gg: AZuq6aLj3hCOOcCGJ74QsgCmJCjNFUKMvOU7XA/m16PgQQth1hntQBpA7g4Aq8TWJjY
	Qke7q6Gy7JCjBDZ2qSi/2hJP7GJtIHPN+eye5Pew/B9BcMdyba8PzuqFifsD6PN2DYAa0c7A1R0
	2GcuYcE6i9jLzjTM9c1+CMNOSvreTfah3GUyKHJHqgdLjE43+VxNdFwdctrgzB1Aw9CDiebIvEZ
	iAe6TYxtke6BAxAaUgWpDMqOOyHgrx6qYXru+0/legGSpCDFoNRlrhdI5v0ru1N7Uu2mVUeD7Qc
	R/Km0SDgwX74WhePJKix14dNm1JHsrjB2hwWp3jpGpdPUUTJqUCc+Pb6ovIqguTJ76V8+1Q42XT
	48QEEdCIznB1QWiLU/aAlzh0P6wg6LvP0JogGZx7li6aQpCv4Xmo44ctGtmvjl1Jyjz63F8S51g
	zTUDlk8rN3tHu6N/SUidqtm3SrNBFK4RtqXuWlzHHQDgKRBfSJFx+1Jis=
X-Received: by 2002:a05:6a21:1509:b0:38e:9acd:97b3 with SMTP id adf61e73a8af0-392e01a7a57mr9582307637.73.1770008946706;
        Sun, 01 Feb 2026 21:09:06 -0800 (PST)
Received: from google.com (61-230-34-48.dynamic-ip.hinet.net. [61.230.34.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b346de2sm128805315ad.0.2026.02.01.21.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 21:09:06 -0800 (PST)
Date: Mon, 2 Feb 2026 13:09:01 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org,
	mathieu.poirier@linaro.org, leo.yan@arm.com, Al.Grant@arm.com,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
	milesjiang@google.com, nickpan@google.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
Message-ID: <aYAxbbkHslAP9RBN@google.com>
References: <20251202082613.3265761-1-visitorckw@gmail.com>
 <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bec7ceb-61a8-4b38-a794-02ee2fc9e68c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_210910_636143_2F3ECBF8 
X-CRM114-Status: GOOD (  29.23  )
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

On Tue, Dec 02, 2025 at 09:26:19AM +0000, James Clark wrote:
> 
> 
> On 02/12/2025 8:26 am, Kuan-Wei Chiu wrote:
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
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > Build test only.
> > 
> > Changes in v3:
> > - Switch format specifier to %#x to include the 0x prefix.
> > - Add Cc stable
> > 
> > v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/
> > 
> >   .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
> >   1 file changed, 4 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> > index 762109307b86..b3c67e96a82a 100644
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
> > +	return sysfs_emit(buf, "%#x\n", val);
> >   }
> >   static ssize_t cntr_val_store(struct device *dev,
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 
Thanks for the review!
Is there anything else I need to do for this fix to land?

Regards,
Kuan-Wei


