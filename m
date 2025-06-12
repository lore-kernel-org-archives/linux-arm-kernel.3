Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDvBjA71GmpX5nP9HttUMJtzkqgE1hal7LMXprTdfkQ=; b=q9MHH7Nquc8PyR6ibg0W8sOguq
	NtInZ0aZWSsutQbHGet6fbWYaPx1mSwwhKM7TmmT2VZvOBNhHYX6rWJHnGsNkJwgOLEwKB1KjW6Dp
	/vuRANATWykTChJ5j0alxZ6D8M5UYZhIFBjTGRCYi2ixTeBVhnoUqGBj1BzbsfI16eMQmsJ9uhEsR
	OuLKrovjNqCyJCpBHXYcaLNC8EgPChR9/p46pFWCJ2fAtdYwhodAUIJTfMdp7FLYszWfEc+VFAxL0
	3N/3hm/hcHOrfqF/rOYfnRaUkD56TdzZom+ZCqcPr7W5FrIeMXlhCKBYYAcbvrTlqBFa7L23ro34u
	eWpV7j7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeb5-0000000CsC5-0uad;
	Thu, 12 Jun 2025 09:51:47 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdIs-0000000CcoG-3BMc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:28:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so578601a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 01:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749716934; x=1750321734; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDvBjA71GmpX5nP9HttUMJtzkqgE1hal7LMXprTdfkQ=;
        b=eJFj9ge6yUMhrrMCrtL8EZfjsRc0NCc2AiePEvONMaMnvkbhueXg2b6KPADJidrJdV
         oQ+Ix4n8n6tDGjkH1/arYltROS+W967R5oGuBpqjDclyxaR4dYjinG47BC9VBOeWtoBl
         no1n7BOlZnQF8sxb9PDbcaz01XrmKVieB+N4FMvnKxwKb3wE0lwhGdaCqY05ilB3UpXC
         Ngeq7zWf/pplaGjz1CU3tDS1CI9XsoOj8HYF4jrM1bcS6uKk+SuNhz2MpuKv2ntivXoN
         KXyg0Vbxu/+k3iYzVbk91Rv8NbcHnwe04I11ft6T1oz4bEcxqt3ejCU1G6x7MiZr0JiH
         0C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749716934; x=1750321734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDvBjA71GmpX5nP9HttUMJtzkqgE1hal7LMXprTdfkQ=;
        b=ks1EeAgG5sWDFQTaaN6yVO8fFl0GE3Tau+d2qgTK+iHm3UKBtT3Fg2o5BWkWVB8zIi
         LAV8R90bh5llZMWOpUSUXt8cuGYvB2mYOoASYfWxRcuNZyrPkDlkPKGQPibLoxwuZWqH
         vlRq3WUETxIsK0CB5/YRzI5AnibI5ZzoLaNvppXiMfN5JmTRr8dEiv8KljY2rMZptsPE
         Kq0SG+pi3WMA9PAHuCU0mU/HPmG+Ln2TYQPb5x14ZMqCaJjDZWf4GqJFuE+IShNn4u09
         0jakVB5XaD2mhVjGZorQ/uvL5twEbpdxAds9fE6saa51qTjA+e5iM35QPga8DNmhniQP
         bDjA==
X-Forwarded-Encrypted: i=1; AJvYcCXcIp0abY/S1w0QWcHj/In8ZAPYipWsAre5QlVh5ACSTk6vv9tWnu+oUltNShsky8nrlWtvK8kzG9wyHq4Ai6aI@lists.infradead.org
X-Gm-Message-State: AOJu0YwR0O6jqZxpsPhkFC36g8SvxUI7+GXE+homLl7g2VXi0EQhW6yi
	pwK0UMD2RrbVXfXiXIWDglxQwIDmvMTJHlRDH/Oa/ycCiK/ZPAYw0FxTRRxUapCP7wmDMQcTw1e
	kkC/BMVCtQ4rv8IvDGXAheqlEYi5tYdoHzqw5g2fmUA==
X-Gm-Gg: ASbGnctU2TXnFb99rz+yP6n59Y8gS8aABu0/bOPgalCpPktdgqbncqWnnpkCcMmcpgS
	Js7eKAiUG4F03CVjUO+w7viLMu4yf1WhmB1vxVZUBltgcq/CjSL/gaz3tLbszmQESQTzJAznumS
	Ce6wfhnL8qkxaUxF08Oj1IZSxWv3qi2s0oUS5ERr4ysXnU5aUugh/SqXQ=
X-Google-Smtp-Source: AGHT+IGYCHSxxYAK1lUYlEfjUNj0HfuvYBJ+GyFXWDzmjBL8bN4NtQl4LBBIk1mZ0vHmk0mMH9eqIuQGhtcvMaKOVS4=
X-Received: by 2002:a05:6a20:244b:b0:201:b65:81ab with SMTP id
 adf61e73a8af0-21f9786f8abmr4230027637.23.1749716933731; Thu, 12 Jun 2025
 01:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
 <20250611-arm_cs_fix_smatch_warning_v1-v1-1-02a66c69b604@arm.com> <28ccdeaa-865e-4e81-8a95-eaec9b2754ef@arm.com>
In-Reply-To: <28ccdeaa-865e-4e81-8a95-eaec9b2754ef@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 12 Jun 2025 09:28:42 +0100
X-Gm-Features: AX0GCFt1q0QSOQiwZOfq-Tz5egMRVip_IVRj5fhs9T0CubDJTamCPIfEraiMPdY
Message-ID: <CAJ9a7ViTTVzXifBc0u_sB54Q71MDVk40=53TfK4OfXwy2vL3bg@mail.gmail.com>
Subject: Re: [PATCH 1/2] coresight: stm: Remove redundant NULL checks
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012854_801501_0B9DFBEC 
X-CRM114-Status: GOOD (  20.62  )
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

On Thu, 12 Jun 2025 at 06:19, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 11/06/25 8:14 PM, Leo Yan wrote:
> > container_of() cannot return NULL, so the checks for NULL pointers are
> > unnecessary and can be safely removed.
> >
> > As a result, this commit silences the following smatch warnings:
> >
> >   coresight-stm.c:345 stm_generic_link() warn: can 'drvdata' even be NULL?
> >   coresight-stm.c:356 stm_generic_unlink() warn: can 'drvdata' even be NULL?
> >   coresight-stm.c:387 stm_generic_set_options() warn: can 'drvdata' even be NULL?
> >   coresight-stm.c:422 stm_generic_packet() warn: can 'drvdata' even be NULL?
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> > index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..464b0c85c3f7d3519169d62a51e9f8c6281b5358 100644
> > --- a/drivers/hwtracing/coresight/coresight-stm.c
> > +++ b/drivers/hwtracing/coresight/coresight-stm.c
> > @@ -342,7 +342,7 @@ static int stm_generic_link(struct stm_data *stm_data,
> >  {
> >       struct stm_drvdata *drvdata = container_of(stm_data,
> >                                                  struct stm_drvdata, stm);
> > -     if (!drvdata || !drvdata->csdev)
> > +     if (!drvdata->csdev)
> >               return -EINVAL;
> >
I'd agree that the container_of() cannot return NULL, but what happens
if stm_data is NULL?
Perhaps the NULL check was on the wrong parameter?

Mike

> >       return coresight_enable_sysfs(drvdata->csdev);
> > @@ -353,7 +353,7 @@ static void stm_generic_unlink(struct stm_data *stm_data,
> >  {
> >       struct stm_drvdata *drvdata = container_of(stm_data,
> >                                                  struct stm_drvdata, stm);
> > -     if (!drvdata || !drvdata->csdev)
> > +     if (!drvdata->csdev)
> >               return;
> >
> >       coresight_disable_sysfs(drvdata->csdev);
> > @@ -384,7 +384,7 @@ static long stm_generic_set_options(struct stm_data *stm_data,
> >  {
> >       struct stm_drvdata *drvdata = container_of(stm_data,
> >                                                  struct stm_drvdata, stm);
> > -     if (!(drvdata && coresight_get_mode(drvdata->csdev)))
> > +     if (!coresight_get_mode(drvdata->csdev))
> >               return -EINVAL;
> >
> >       if (channel >= drvdata->numsp)
> > @@ -419,7 +419,7 @@ static ssize_t notrace stm_generic_packet(struct stm_data *stm_data,
> >                                                  struct stm_drvdata, stm);
> >       unsigned int stm_flags;
> >
> > -     if (!(drvdata && coresight_get_mode(drvdata->csdev)))
> > +     if (!coresight_get_mode(drvdata->csdev))
> >               return -EACCES;
> >
> >       if (channel >= drvdata->numsp)
> >
>
> Seems to be a sensible clean up.
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

