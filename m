Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF330C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 00:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=; b=Guk7VuA5ML/cM4jQmlPgDU7pIU
	0T1+GIVm2MQr4tzt4UYGQ0Rnq5jaKS3Q3Z5q9UuJPi12Q8v3H4TShCfrulV4rTNQiA34/S4+pxm1r
	Wub6jDp60Q9DfWdyQwiGK4YXW4+NsIH+XcUc93HRy1vubX6NbIPtZq8VUyvAy0fRgDoR6Rnn+Nmic
	NQH1W7sC1HQhc60HXXAyvR0kTeiQ+1FHWDOPci2UsHvHOJxPHYu6u/JGkfaInUqs0NLvu7+Tr18Se
	fnQgPy6Y2UqrCsR9xLV8/iIRVJhTFDv6AES+BwtUTFrDQxiCAPhLP8EQm0JZv6Kh6hRpP1XzeqvEU
	Ej6G9Ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BCX-00000000PaL-3WCe;
	Sat, 12 Sep 2026 00:02:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BCV-00000000PZm-0dco
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 00:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789171354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=;
	b=aleqaMyo/7AAPDGUk7b6lVfChlFTJ0pyI58MjPijRgXd1HnEekFnMDLSyFt6FYY0KHjLKQ
	hTd7rX9TXwv47inKikNaYyIElMSKfLhd/1fjhoEUs8c5ANyTpY+epn+tIct4DiAwRo/vpb
	tJEvmei10zoeyWrVWA0qvFCWez4j2Bw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-JbZH8B3jOSGKKdyNS19Srw-1; Fri, 11 Sep 2026 20:02:32 -0400
X-MC-Unique: JbZH8B3jOSGKKdyNS19Srw-1
X-Mimecast-MFC-AGG-ID: JbZH8B3jOSGKKdyNS19Srw_1789171352
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-982a948acf8so637127241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171352; x=1789776152;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD3rHJHT6IXoplMI1G9PUB23ltzGVExlvF1tjwSpHoA=;
        b=FDZ0NYsq1APuKjUvL55PiKJdXGtjBu+xzFwNtOHLDOROKdlTiCb5u8XfupaOOwWxFY
         oR5g5y7AteUkzHGjatLGn/6fFUnZ/6uhJuxYXWo5YS82YMbmaszZj4/rWI93RvasC6eE
         MVFGD8V5SrZ73F5RvSAjX0ZdOOhiwrJoW7mi7bTVTsUAYeXZLZWkO/wzTxorVqaTd6mU
         VYH/B/RMUE8URE8kIDbWImENE+Nb6EdPpmjk1MM8kKUfuxG6/baHrh++kxWUJ1lWU0Y0
         jHxW8zkOSkfpoEGtCcxXzI8Dg1lAzOp3kSSZIAF6WD3FIv9mT+d/BKXU1TyVT6VqNdA8
         CcWw==
X-Forwarded-Encrypted: i=1; AKwUvBya/nhuf8CFGyc6HzX6SI/nFxxzX66w5UWeMnkdeOvvyOdgel4/bVKVP/X4PBBB53PaTzlRLiZqD6Uce1lUBe2/@lists.infradead.org
X-Gm-Message-State: AFuF++lOvpiTLkrYYx7shm2wJQwb9hh13UnTb+9BoLuxNHO/fPGi+69d
	ydDgH4HO4JYBh9EXbV5ojgV+37ME02ZKubcZ9EiwwnX4HDU8xIyv4zg5RIVh/WIbrSNvS897dV2
	sFK1ELqkXbV2D6E9yMc0rWIEK31lJBjrYXbSZjKmLgiehG22HtvzFLsTVdQThqpq8OiKvLi0J+g
	cx
X-Gm-Gg: AYBFou26RK7La6bernsf1QC2utV9+8C4aEK+G/Sv+m89CUKrDasWqiUsYju9mGL00C3
	GGQwJXZDCjzNIWWAdnRgMJmqAgOddhC5nkRO3GGI4++aXSgtPyJtbJUBZTCo2ojMbGUNsPLkUJ1
	/ERenPolrV1/JS6JFKmFtTI406m/XSb64Ix4CQK92bf5sNuGYQNkCjIMQxvK3onGjrw8w1/cFfq
	3BelStapuPX4yBkICVXuDWLZxurJBgWgUfqT/AJ9GtRiwFe3ofGlVYCLFUvihoAu5AjKKQjznM6
	FmFpNhB/CqaCNFnM3RqE1APie3q8zAB1pXFHVgO2oi5sfaJBL4/N5DdoTmh3g45osmH+k9ichmZ
	jB7P52k2f0g4rVl4OWnxNQTkzzykHOhm8V/s=
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr223319137.0.1789171351661;
        Fri, 11 Sep 2026 17:02:31 -0700 (PDT)
X-Received: by 2002:a05:6102:f88:b0:796:1ed:ba3f with SMTP id ada2fe7eead31-79601edbb2bmr223244137.0.1789171351235;
        Fri, 11 Sep 2026 17:02:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4963fcsm32883346d6.33.2026.09.11.17.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:02:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:02:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: actions: owl-pll: cast delay to unsigned long for
 uelay()
Message-ID: <aqSWlPP4YfAi15rE@redhat.com>
References: <20260904215013.98283-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260904215013.98283-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k0nuns16tLb4xAxpTAtZF08cU9jiZ6YtN7kNMHvkQfI_1789171352
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_170235_261642_23F3DC81 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Rosen,

The subject has a typo: s/uelay/udelay/

On Fri, Sep 04, 2026 at 02:50:13PM -0700, Rosen Penev wrote:
> The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
> compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
> can never exceed 255, the compiler warns of a tautological comparison
> that is always false:
> 
>   drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
>   constant 2000 with expression of type 'u8' is always false
> 
> Cast the delay value to unsigned long to widen the type and silence the
> warning without changing behavior.

Just to clarify: This only shows up with a W=1 build, right? If so, it
would be good to clarify that in the commit message.

> 
> Assisted-by: opencode:big-pickle

The new guidance is:

Assisted-by: LLM

Brian


