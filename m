Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45651E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eKaWxEhhuVWvBsU53E8KZ6fOQTi8MzTOfznqa4xjH0=; b=KvuHbmto6RpErAa7u/u5fxbmj1
	Nmdt4N9nWcX/TEXpFvOeLgqDVPKtnR4JBKHHAqNASw5fVSEw9CBwBm5X/XUo6nX5gcLxIJf907O2a
	KJkk3cyxXZs9TPP1NrZ/VvKSRTB1/fmDtGpy25my2v/GWffm0oxW63Bq2T8jxdtuBv6g1WQeC8Yuf
	3DFxzVhHOwNpUxC9Vt1ufsrYzlBJIj3rm5h+tacpusZcmvtid+MlmmJ88fZ6ZFjPNO/iisa7N7QLZ
	DvX6XpF9LCDMiX55RQqXlaoHAHLLbdZIYAxZ7zMBmtseunXCWOFxMLH+B9pnoyPhyzQoYb+gZ7ij3
	5DsM5kRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMfz-0000000Ey5n-0K4g;
	Wed, 11 Dec 2024 13:22:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMew-0000000Exzv-04e5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:21:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434ab938e37so43830535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733923304; x=1734528104; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9eKaWxEhhuVWvBsU53E8KZ6fOQTi8MzTOfznqa4xjH0=;
        b=bu8//OAx1FnvQl2QKsCK2QCiLDdCvnVkf+t0IC/rcwjkCqgnt3o1ftkFRd/MCqUZQW
         QZY3n5f2AHwE2zB0R/2D7KnhZCOSDyuZRyXl9bUg1a6GC0Qf3uA2A8ZdmxEA+SDN6n32
         mIraZr+YgWFKUCa++TyDq26sjVzrmZWFiPA2UwwpIdvwx1yrSZDRQBHGLumqgbq6yK4t
         WFEJYjMpRt+ydNyV874Kmbmnli+aITFmcPP7AuiATdmHZc0srXFxJPhlZQlAcZmQyAw0
         aeePcx7isyLRYLkOPd3xeR3xliJdyNE0ApKmlsw/PgEUXBYONV5pjE+cjZ+HbZPXVz2k
         wC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923304; x=1734528104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eKaWxEhhuVWvBsU53E8KZ6fOQTi8MzTOfznqa4xjH0=;
        b=LNV3YTDCJl3aTGlV+ZEc6qK/b68lEvcglCcZ+7kbZJv2++GHgsjNxaHv4N9makZTNH
         mlChLijvblyjQ93Qp6YEnWABYgURhfdybKolD+qPxiQhbL53Wft3Ht/n+ee8NCsVkiQx
         ZrkhtsldDkpJ47fsJO7L3McOFirddSRFYnChdtDeyuE00bAvmK7oqKwSCHgEU+gRiB1i
         S+yzMw8UJG5rSpUhf15HG/CxfLjaiEmR4zcCfCrsb2EAQZawaGRGRysKg6YRt7h6ny7i
         VBnSc+ODKQvT5fg2RrLWvAU1k19EjY6NvnS9Vsw7AbWoW9ctFnNrnHWgT1o8qV7wO0Oa
         iDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0wgiZc0ZSNSVK4U33SxmKzZ/3U/TcdXAJVxj/J/LDFOWMdW4Si6EsdmCnXIi19G8J+k7IUyqPUh4LrlkLeaq5@lists.infradead.org
X-Gm-Message-State: AOJu0YyIDXGFdUhvVuGART35zXpZqe1fUiePNM1dzPPt45ehJAehVHQz
	3+D1aVG7zOstYm8nY5Y2IlRaWqvdJNPO3Ma61+plchDJPrgeIfcJBqq0nnum6mY=
X-Gm-Gg: ASbGncvNilX8mgeCvEk5SJ0cD0issu89ff5LDfsG8CtgxodKJqNquc1Bwr1QkqoN3DY
	HAZzdSLTa3ZnP+YaaWqXvSQemwerOezBOi6t3TejnJlw6TmD7zFxa+9rZhw9o6b2Bx/qh4hYma9
	NFQGJun7bSyxAxHiOwOGx1lz95+/qXzg+CdCiCDIrAxTZTFls0uT+8owfmivvvdvV0j1UarrBIY
	iDePMSVnmzcrXmFXMmlUv7RA60Rqm4za9dLPXr5+j3ifB6p48syKQumwSU=
X-Google-Smtp-Source: AGHT+IFfC29j6czTll9rOLSqjnFeJosj8hGWZx1V8FqolEsDfwkRoQYubFcSENWm0L8tfipl6WqLzA==
X-Received: by 2002:a5d:6486:0:b0:386:4a60:6650 with SMTP id ffacd0b85a97d-3864cec5bd0mr2542328f8f.42.1733923303738;
        Wed, 11 Dec 2024 05:21:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d97sm1260997f8f.64.2024.12.11.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:21:43 -0800 (PST)
Date: Wed, 11 Dec 2024 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Laight <David.Laight@aculab.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"toke@kernel.org" <toke@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"kernel@jfarr.cc" <kernel@jfarr.cc>,
	"kees@kernel.org" <kees@kernel.org>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Message-ID: <49a14c12-a452-4877-aedf-94bac6ed2b7b@stanley.mountain>
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
 <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
 <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
 <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf8CmKs-_FddnLFU7aoOAPU6Xv8MqyZo8x9Uv-Eu+hs_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_052146_084510_75078094 
X-CRM114-Status: GOOD (  20.32  )
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

On Wed, Dec 11, 2024 at 01:46:11PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 6, 2024 at 3:20 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Naresh Kamboju
> > > Sent: 05 December 2024 18:42
> > >
> > > On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > Add David to the CC list.
> > >
> > > Anders bisected this reported issue and found the first bad commit as,
> > >
> > > # first bad commit:
> > >   [ef32b92ac605ba1b7692827330b9c60259f0af49]
> > >   minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
> >
> > That 'just' changed the test to use __builtin_constant_p() and
> > thus gets checked after the optimiser has run.
> >
> > I can paraphrase the code as:
> > unsigned int fn(unsigned int x)
> > {
> >         return clamp(10, 5, x == 0 ? 0 : x - 1);
> > }
> > which is never actually called with x <= 5.
> > The compiler converts it to:
> >         return x < 0 ? clamp(10, 5, 0) : clamp(10, 5, x);
> > (Probably because it can see that clamp(10, 5, 0) is constant.)
> > And then the compile-time sanity check in clamp() fires.
> >
> > The order of the arguments to clamp is just wrong!
> >
> >         David
> >
> 
> The build is still failing with today's next, should the offending
> commit be reverted?
> 

It's a simple fix.  I've sent a patch.

regards,
dan carpenter


