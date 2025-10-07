Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DB9CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAnLlpyoSkhhQNvbeLxXC34OHtMlQNWj8ecDQ3GZeEk=; b=LCd6qMcEcSVrwMxXhWsVvn1mgQ
	F/eeM2+7shAMgbg/Ujdr1FVw9wHjCqmsQ+1N3qS1I3nG49E0iX/COCHoZYOtS4JwFmHnIR8CRpCDn
	UB5irvIV8gAxtgs4+Yf5g4tb02ELPD6XSclB80XN2JzFRhCDVXW7T42tmt9WOzUutAC0EWuY6eolD
	o22ICH0/YKOQT16WZQ/Q0YZbjg5rYFO1Hsg4rd7I+zEqZT5Fg3ETgzuOYj8kbDf1/LjZYV5qxHVfR
	WoqhVSTb+8Z560lI/Jh1WAYzXbpje+6VL3CRqvX4aN6DpQxk780rn97V4NW/p2ePf2G+jjPuYbzdl
	EKQwyi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65PB-00000001pGh-0tJu;
	Tue, 07 Oct 2025 10:58:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65P8-00000001pGG-1kjT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:58:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7930132f59aso471671b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759834729; x=1760439529; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAnLlpyoSkhhQNvbeLxXC34OHtMlQNWj8ecDQ3GZeEk=;
        b=w8dDDjcxi15tZpCk6lZ3cIsRwQxhwxAXZpqvqgVm2Yr5sMK486lNpCF24/HXA7ukXI
         J61KSY8nPCxjNpswUNvqL/i5gJuq6fQNBTW/UFhwYHHseC/lKuMrxolEPpHYnyab4KcG
         vxznfylCDEd1f6ct/xx5myOooRu8gmTVF1Qe8pDPPR1E7b/Se7hI9diA1fjE0L5XmiyR
         768OSzKNPUabrTTf/RiUSO6su0nI1T5EdNdze1jOmr3lKQLhxnJIqzexO3GOu11zsW48
         eFaIuNgZn2/BUL0jy+iu7/QeteMo5UANQXKMukvQC57Gra/BPkVLiDZrt2LIu80bcK5a
         QT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834729; x=1760439529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAnLlpyoSkhhQNvbeLxXC34OHtMlQNWj8ecDQ3GZeEk=;
        b=YhCU02llC83Q70jmFYzKACFNv6bZvhcxrphX0pHH2yz3vMTWga7kV6zIE+EMazZwCb
         XFmPFUtJntvbKYXQaWzp6dQdHVwEEBJlhbzOGyzZD9orbGVwiDkyLXlJrgKketAIkCvN
         IefKTQ6fW2eXnP/Ot3jem7VDB5LpHSRmC6kk4qM7ZbAE4THvpB6TgUPMjo3QCg06XG4n
         k8Yn6hmLINg5Inw6BvbEwB7smlvaNDJQwZvIeSRevADn9SvPKjjfoZJ44eQHdwgqjzd9
         s6hl5TcXn7rkoWHKasWc7QKaaPkTRNssFhn5JfsFZrJJvGesem+UpogsR7Bas5RLPfy2
         n9mA==
X-Forwarded-Encrypted: i=1; AJvYcCXiEWYNWeBAQFDPArrOLva+PRHvZ30z8q4TAUbjhARE087Z0ZPGQ0tP9Ji7g7otJ3Rr20+w4VeA1It4CrUIx5JS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70n8Fh/8SDn9rumHnXshpivV/gZ21BApkZeQfzmzD6vgD+JtF
	H3jOrPwaP7bjQeimyCnEAbkza0DfhmgZF4d2yvR8XiEnJsNtoH6T/q3bDeIfmnPbwz6Tw697iq/
	aPoR8vLTyNs6fllmY9bLmgybx0tuCTQWCdBZfoCnVAQ==
X-Gm-Gg: ASbGncsAt85E8A6a3tTYGZhBegzbJifyN+CrO60sMpN5lLJ6f/dRFsi45LQRLNwich/
	jYAg1xVYuwJ0fMbKM+8doIoRStTl1oee+OVS8cOEikLJmRNm+LKhS8L9GSA8QrwNUABDwVgACAv
	B/SuXn66fl26evtzYFlBBBSTVaXoRgdK/PrsPTH0CQHmCFgrV6VUwmysu9mfs2aNRE7LzQKCgdJ
	ughWO7OH679vmUoOJo7mA9+zAvkkhaKUqOoGxXn1R5FoshLbPegGpIa+iOogeJmt/fY
X-Google-Smtp-Source: AGHT+IGUa8eJRihLVNzOYGFbXUIm+N3gJO2ciJmqJHjBjPDlfoQHUwh4NF9fU46TjTNIJF7oexDTVMkXGcu7LoImngw=
X-Received: by 2002:a05:6a21:3086:b0:2df:8271:f095 with SMTP id
 adf61e73a8af0-32b61e57fd4mr22332424637.24.1759834729397; Tue, 07 Oct 2025
 03:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-20-ea49e91124ec@arm.com>
 <CAJ9a7VjoW=U42SztbdHfxM=v=UaAmJn1=cdJd1EZU3rB6x+WAA@mail.gmail.com> <20251003145017.GA7985@e132581.arm.com>
In-Reply-To: <20251003145017.GA7985@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 7 Oct 2025 11:58:36 +0100
X-Gm-Features: AS18NWA1eTVKugm6tPgBhUp_w-ROnrHU-pCieNlFUTBLM5SYTli5UWLKPh5z7aU
Message-ID: <CAJ9a7VjnGigCP9Wc1tk-_pXBNspbyQO2bN_M0Ymk+UTBNZH-7w@mail.gmail.com>
Subject: Re: [PATCH v3 20/31] coresight: cti: Register PM notifier after data initialization
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_035850_621734_81DE8830 
X-CRM114-Status: GOOD (  22.05  )
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

Hi Leo

On Fri, 3 Oct 2025 at 15:50, Leo Yan <leo.yan@arm.com> wrote:
>
> On Fri, Oct 03, 2025 at 10:38:24AM +0100, Mike Leach wrote:
> > Hi Leo,
> >
> > The CTI PM code was initially set up before the CTI was a helper device.
> >
> > If the core bound CTIs, which are helpers to the core bound ETMs, are
> > disabled as part of the path disable helpers, then I think the CTI
> > specific PM code might be redundant.
>
> > If it is not, then should this not  hook into the generic PM code in
> > coresight-core.c?
>
> Correct, CTI devices will be managed as a part of path in
> coresight-core.c (See patches 26 and 31).
>
> However, we still need cti_pm_setup() - when a CPU bound CTI is enabled
> via CTI's sysfs interface, in this case, no path is enabled but purely
> CTI device is enabled.
>
> A side topic not related to this series, I am curious if we can remove
> the enable/disable knobs in coresight-cti-sysfs.c, then CTI will only
> work as helper. This can significantly simplify the CTI driver.
>

Not all CTIs are on the path, but potentially even non-path CTIs can
introduce signal inputs to the CTM that trigger events in the trace
path.

Mike

> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

