Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236AD10F59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UygfS1gmAzBwZyN5jNpTgDld1SbxnKAShfYEWk/vvM8=; b=I5tEUGRQaxlUUZ/5sC2ridS6rO
	00l4UpmlF+OZ877HQlNEqnvg19DvwdirdrSEK5AweSSURBOoz7WzQFFKDbIe1eLfF03TBUdnhGg7z
	IZQwHXVSSA05Qt6SCUwH3k3vxUuc9HFU3yjokVWADxRYrr4hYvmD1CqLWzicPKL3EpWO+J6/IdQA0
	aEC3tKSF3XUZU78oqtQoKw6bPECUzPCTmInvXLqhdaN0kekB8Fv7coBH+qR0iKgp7sX0Vr9kXt1uA
	kKGuMQ5WbOxoz2xdMGtOy3SpX0oclevexiKdVQDKAqL75hGsxY95bsPGP5HdMW59z6Qo4q3QgpHhZ
	mRbBiQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGNi-0000000F66s-0oRE;
	Wed, 26 Nov 2025 14:20:30 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGNe-0000000F63v-0H0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:20:28 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b31a665ba5so621660585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764166825; x=1764771625; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UygfS1gmAzBwZyN5jNpTgDld1SbxnKAShfYEWk/vvM8=;
        b=RdxKUC8x/5Vy5LFm92MMKVZZr0x1HvFnNGtnp1qBjW/DmcHA0stMVYsrxcVOPgn104
         JorP69teTGphbZH7tdStPUQoddB7TtZHCQlvJPIp7BIAAWlyDTvrEFVnRQ8wSCvZO+FO
         Y8y7EThDXOJj1V7E6kUp3LgTqBL8EZVzVEcHU2/4RoU7zJzmqv5qi0kFZss45pqqMmgW
         rBw7CsIPYso4YDryKdkF188PxapjrPsdjv23+yZ08zgSg5nbR4Qu8pfjMQquiV4JQ8yP
         sOZv0gpGBlaCgeSe8EH+eMiRaqUBQJVK0eWvfu279jfntAH8FSCVp/ewdOFeBT0/G6VY
         k8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166825; x=1764771625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UygfS1gmAzBwZyN5jNpTgDld1SbxnKAShfYEWk/vvM8=;
        b=MKdm45QucaZsUTEv5B4rAByon/DNuf3CHCYVwDPpEDSor2EyNzDxo4BC8lOXAuQkg4
         3PdDyBAvOui66XIYY7MEQS/FsxmTEkm/8iDIv0O+3CNYVy9hkY09lOxyk/+WIN/gvqdk
         GCJqqScJ96UaQvm7l/kkmtrZw7lHVeDCxjNYEoxxDpF6mbvkOb7ihpPgDD+NEBpIoyl+
         Qt1Zh8lLNHFAWU+SBAOzWDvOeFzFvT79QxQoi+FUMVeW+LS9PAhHVVWZCzJkX3HME6c4
         sEJtACp1NWwJACxNsKPeDgfTi8y/j7d47qSwj2PFcJMscBJk3NOIc3NI+ENFTVWCfuzp
         BhYg==
X-Forwarded-Encrypted: i=1; AJvYcCVMaFbD/krOJOiUkLh+Z8RlAeYGIfCJ4ck9MGoe5NVxt1yolB8Z16f+LO19dyNQ6iCkAROUozfnIdO6g+lI6QzY@lists.infradead.org
X-Gm-Message-State: AOJu0YyhfyaEuMHKRxmjIz6xlVJZLHgrtVVa0gXE1bAPwRjqTScwN/Ym
	dcNKvR4PbUVxaYApkJEJmlRNPqjS2SKjvTXpcs/Fe1fTOLQQ+z59oeo1PKcdu/dMqX3q/OgNWaj
	GuLM0RDg1H+fmQ93W7Vrdx7kofezw7oEVj3PspK7ArA==
X-Gm-Gg: ASbGncuWUdOxqAc7UccQgtTJbLQauAEKqvl3suqJJjrFhWrt/vdEf0mL7nQK0ExAl57
	eGAcG9eyuyB9FXsFgNqrB9f+bSP/CrUUNU/IxpGazIODGvwgh4q8XeFdPtDjUXCVJLyNHH+TT8t
	ylXm15yZH7hgGqSKvMt0TYGsLaAYK9KYK2XYdmkgXpd9Nj5921M/5B+O6YCs4evyrUbmuIPnBYS
	QIez5zH8Ws5jawZINrwiz5ntdXg8vk/+Ec412TcIT1YSF8Y3Hx3LpqOtGXhNY4xwE/pcjyXQdRD
	QqBkxN0IIeCu94I/nf7ny94tzlIduhHkxCGXT6Y=
X-Google-Smtp-Source: AGHT+IEXhMtdXqOIXMjzdjhXPvF+1CFwLCKnETjmeKA2ia2qVKHR8qbNsixLeJGiRYPNKgiHRvy/8M3YPyXRFNRpBZc=
X-Received: by 2002:a05:620a:460f:b0:8b2:e5da:d317 with SMTP id
 af79cd13be357-8b4ebdae699mr876378985a.54.1764166824849; Wed, 26 Nov 2025
 06:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org> <20251126140154.GK724103@e132581.arm.com>
In-Reply-To: <20251126140154.GK724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 26 Nov 2025 14:20:14 +0000
X-Gm-Features: AWmQ_blJiwM7FEghF6YmUIgQn0KwXPlNxgpbgeT3ameLv_-rX431e10EWW7vOyw
Message-ID: <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_062026_130302_84901BA0 
X-CRM114-Status: GOOD (  25.46  )
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

On Wed, 26 Nov 2025 at 14:01, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Nov 26, 2025 at 10:54:42AM +0000, James Clark wrote:
> > Document how the new field is used, maximum value and the interaction
> > with SYNC timestamps.
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> > ---
> >  Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> > index 806699871b80..d461de4e067e 100644
> > --- a/Documentation/trace/coresight/coresight.rst
> > +++ b/Documentation/trace/coresight/coresight.rst
> > @@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
> >       - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
> >         <coresight-return-stack>`
> >     * - timestamp
> > -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> > -       <coresight-timestamp>`
> > +     - Controls generation and interval of timestamps.
> > +
> > +       0 = off, 1 = minimum interval .. 15 = maximum interval.
> > +
> > +       Values 1 - 14 use a counter that decrements every cycle to generate a
> > +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
> > +       - 1). If the value is 1 then the reload value is 1, if the value is 11
> > +       then the reload value is 1024 etc.
> > +
> > +       Setting the maximum interval (15) will disable the counter generated
> > +       timestamps, freeing the counter resource, leaving only ones emitted when
> > +       a SYNC packet is generated. The sync interval is controlled with
> > +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
> > +

What is the default value?

As far as I recall when this command line parameter was a bool then:
perf -e cs_etm/timestamp/ <program>
is sufficient to turn on timestamping.

This is worth mentioning so users can correctly assess what happens
for any existing scripts they might have.

Based on this then the same command must set the timestamp to 1 -
which will have the same effect as before as we do not want to break
existing behaviour.

Mike


> >     * - cc_threshold
> >       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
> >         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> >
> > --
> > 2.34.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

