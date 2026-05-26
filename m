Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEB0CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdQjmHgCA99B/85Oyl/wYQVRe3ldFqiFSU1yS4ZaDZw=; b=UBDt6rGXQg3kohJ6pq0Nwi/X5M
	/V+9yD0h1bZob95mIOvpeReUSDR5v9cG9IPyeSG+NL3c3p2co7jgQRhe3oeQAMZnOcJUN0eL6KhHX
	Qv8gx57iuap6Aj0si1rW/i7b4D+VJfim1uj/OPcgQuiVzDX6zMLhKcg60OgEq2Vur3F2vu1lUMD6H
	9Vdxplw0c4X9cQFPTkLq/7vhxFhuVaq1Nkc+8+maScy0YpgnjMO/pO+akLRT+9mRyncwsEz+1madK
	lHQxPIRCXyhjE7vozdVe5efasAQjkyBT6C0+zhLjr3S4xqhe1IFf3MBSz/UBrInfNkByyjAKT9aR1
	mhEC/N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlkE-00000001DOQ-0kS1;
	Tue, 26 May 2026 06:58:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlkA-00000001DN6-3Pjj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 06:58:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3692f395339so10628621a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779778705; x=1780383505; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdQjmHgCA99B/85Oyl/wYQVRe3ldFqiFSU1yS4ZaDZw=;
        b=UnW0Fq+sXfLIhLgubfwU1BGOB/eB8to7Vh1I6920te276MtwtWcQHG4z5/A1ep7WCL
         tUqQHyMllFlA76IxI3KJKHe4PSIJ8VEe7Qbkg9Lf/wSWRxmxUxENI7Om8E3ZzSDWTsAE
         KRkSxXopQxqBTaIWST9sbVFBUWdengmBekOHgcBHfALW3kLAZj6U20wg9+XpaiYDUZaF
         IgpshhFhuF3v6UtArQLwWcwd0FZ0k0bBOI0G/mdiSj5W83OYePKIzoUr5pUQOSaOjQze
         R2rDcenlX9Q9b6MfoX4mLpvHMI3Ujp2QpOZkzXcEXb0iZOUOzWBOJC7WMP9SAnL8AF+l
         dVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779778705; x=1780383505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdQjmHgCA99B/85Oyl/wYQVRe3ldFqiFSU1yS4ZaDZw=;
        b=OqNt+b3FkMttKj7qNzvNgWiQvFd9K0MeW5aGDC+eT4RJtrcDxh6nEr0EAREXq4TIks
         Im06lRMP01EFUG+FXFS3ZCoIqm7UNEdWvxecv9aCJ+A98HE/h5FGtji6wCq5HRm0ikwK
         lE37iMbjq1aP4CQjvI03WTdjVq1xXhUYX3unnH3WXJWmR7rofCApKBwBmdPVTzJ3tfye
         dGaFON+Vsg1O0ujzm0UiX8scbgTTMHb691dsOB0KCfgH2PkKNYUeU2++SJhdKmcYTdBT
         kojiwPlqoZQBA9lMGxnheeuiInI/986e4IcZWnXF4XTwPP4R+lrAzeOPhkBNKsS0460g
         6aDg==
X-Forwarded-Encrypted: i=1; AFNElJ80btkVoXtzhspL7LYysZoYHHuOMQ4jNVC0ReGFKegdme+46UJwqcXpTUrGbiqJn6R2qSlcfp7rqEC7xIOSJkZ/@lists.infradead.org
X-Gm-Message-State: AOJu0YziRVmnNkxXK6dnGlBwFjCDdpWospRYAEB3Wv2ZgWM2nRJPAjDg
	NBapGtDW965WIqcHLApbs63WQFExtOQgDVrIklg5oM/27ceNOItROLMsiQG9wzpmuDE/huCalyy
	/rwNzUi/+zUPb4SC4RDyUmyi1BA==
X-Received: from pjbsz6.prod.google.com ([2002:a17:90b:2d46:b0:369:4369:c7f9])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b51:b0:369:971:4883 with SMTP id 98e67ed59e1d1-36a674f49bemr16530730a91.17.1779778704573;
 Mon, 25 May 2026 23:58:24 -0700 (PDT)
Date: Tue, 26 May 2026 06:58:22 +0000
In-Reply-To: <20260525164715.GA2487554@ziepe.ca>
Mime-Version: 1.0
References: <20260525164715.GA2487554@ziepe.ca>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526065822.914216-1-joonwonkang@google.com>
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kas@kernel.org, 
	kees@kernel.org, kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_235827_117322_0C69EF36 
X-CRM114-Status: GOOD (  14.59  )
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

> On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:
> 
> > Currently, the only known expected user of the new kAPI is our team. Since
> > I test if the patch resolves our problem before sending it, I believe it
> > should be good enough. Do you mean more than our team by "accompanied
> > users"?
> 
> He means you cannot send patches like this that only serve OOT drivers
> to the mainline kernel.

Hmm, it gets back to the chicken-and-egg problem. So, do you recommend
deferring the patch submission until we find a new in-tree user of the
new kAPI? I believe we will not make our module in-tree anytime soon.
Or, is it like I still can send the patch and get it reviewed although we
cannot merge it to the mainline?

Thanks,
Joonwon Kang

