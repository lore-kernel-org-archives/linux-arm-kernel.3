Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D6ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnJnkot1+rn4s3cdxJNe0XcEndPrzF+uQQTDlNWewzk=; b=C3HPho/RDHzZLPFTIEUPJO+q10
	ydZO0EN5OsgcriKsfVg79xDPTBzxIWZFT8ZlBAKKV1Iwk3oqI5JtivHPhOLuA3PWn4WUw5BpsSSyg
	iyGg0AVsgVY5+glNOAJluSdHkZsIH7E+zMbyjoX3tmSOhLNFrIG2Jy6U4kjdh/7lPemxu8mz+/5Xw
	0a8WsUm+oKU50ed5etVR4febWWXezjj5SMCaN88QVpe9M8Jg7f+f0P5/ua3UAn+sePmghzs5as+7e
	Lls2iUQLKk6CIMUtwf+WTXOJDxGk85aciTXO5wrqVFnnSJECpcPksMZbhOMAQJyQsWmQq2kXGz37M
	GgoFwYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytOj-0000000CLPD-3kjD;
	Wed, 17 Sep 2025 14:44:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytOg-0000000CLLN-1yT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:44:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so5479747b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758120277; x=1758725077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnJnkot1+rn4s3cdxJNe0XcEndPrzF+uQQTDlNWewzk=;
        b=bKI33W9ecrO+2wmqEI9WDQQk5/n6ckUJt+LbRfkKGMmyoWdHsddzxPCz6D+SVkqX8t
         FOr/yM1FREe5Y6q9Ctox8E4WBiPqJ42hj/M0/cgAFWnfdaie+jZrkCBvItN/JG8eDWhn
         Jc+2+tBA4kLM76VP+RNHOXmP6RKtE4zDoyWRx9kZ82WPAHxjZEHQolbqsAZRgYgVefux
         1hb/dGedVGF5bzB5ErfPJ0pXtSdbthfL0QWjl1kSC/eyG5L7q2i7HYruHpKN126nXwx5
         MxGoybXL2UALHfdGvKt+arD3qogvdyuEWgK9mEU8XQvLFr1vhpfXvdnRolH+QolYfvX+
         ruZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120277; x=1758725077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnJnkot1+rn4s3cdxJNe0XcEndPrzF+uQQTDlNWewzk=;
        b=mAFEnzFDBxV34RSj/YGv/rLWPnJF188m3CuMKezoNDmasTwfsVmaFgrZL/KC1hkZe5
         6HLl/7PGRnfF9/1z964vU1LHva5sjZYXETbJS1PMYhvTefDFGyKPCEltRERXckDWeSv2
         IRwJSH46e+8YvyzkCskiFkvC+Bs6Rl+/9V5FZxBUiqRuFkc1SepTQy0NSM2WklLmUMZf
         xcLCGn69K6Shjvyj88fNxat8CYvDxq80QQLehS+o9U6F44GuLeJumW9BNuNlJEx4YMTx
         kTMSWJbvjqRKJ8A/v7uA2noZuDr0K2FWb3fuM4y4aCAmT4i7pZvYEY0I06FEIpfZJUcK
         jhig==
X-Forwarded-Encrypted: i=1; AJvYcCWBZ4MJXXLrwiItbXBIJycKiTxwRZ+uJB7v70azsP0bg6HIrhQhvy1+XnPh9GN7evZHDZnxHb5ZJOQ4iyX3s29g@lists.infradead.org
X-Gm-Message-State: AOJu0YzekKRBQZwK9OG8Y3f2I86+dTainFFfyd6tFZuf+XKNsv1jB8qC
	UZ6n9a+qmFpzfXHRtTD56bgSuGZJxQ7t4BoQCBOvbFzausj9LlcwiEmRdRVEdg7Tct0=
X-Gm-Gg: ASbGncseGJ23d8q5af3hC18ewLLTZORqODCroevtTSgDNHWdNKy5Uqcp+o5n3IJ0JO9
	7NS6gE3T+cVjbNOWXiPcYtsqZfTj0cInyhqJeGOTzWiPh1wNK3oEprr+wuLSDTguEk5B1S+2Qzc
	Ws1/mj6cxz0Fq4DDopYnMV3oqyFDNSWy9Bs/EU0eAygxOwrgtRmNd4UjfSH4BRpbBca+QzPguA1
	0rWHc+AEsibokwud79tOe7nOv45rZlPP6SOvfErDdlMkq7M+DFXktagwPjLMuC2wchhgmLpXwwa
	qbdRFe6f6Txeh06QIKm8YLg9lUHSOkn8NlFTR+D2rbomO/PyJorVR/Qxip78beCp/iwr7ORNYeL
	gxhT8paU=
X-Google-Smtp-Source: AGHT+IGxxIJHN/EMwPyG7Tm3jmmOepTSVr4yhyZOluH1XV/4YRxZqqt3gswoEzoCKIkgz4edkbVgoQ==
X-Received: by 2002:a05:6a00:8d1:b0:771:e2f7:5a12 with SMTP id d2e1a72fcca58-77bf6dce4eamr3307903b3a.6.1758120277565;
        Wed, 17 Sep 2025 07:44:37 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47acasm19051666b3a.38.2025.09.17.07.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:44:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uytOd-00000008NTr-49fM;
	Wed, 17 Sep 2025 11:44:35 -0300
Date: Wed, 17 Sep 2025 11:44:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH 0/2] Move io-pgtable-arm selftest to KUnit
Message-ID: <20250917144435.GE1326709@ziepe.ca>
References: <20250917140216.2199055-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917140216.2199055-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_074438_538505_0D3F206B 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Sep 17, 2025 at 02:02:01PM +0000, Mostafa Saleh wrote:
> Instead, we can remove the __init constraint, and be able to run the tests
> on-demand, and possibly compile it as a module.

I think you can just put the kunit in a module to avoid all this?

alloc_io_pgtable_ops() is always exported, and I didn't notice any
symbols crossing from io-pgtable-arm-selftests.c to io-pgtable-arm??

Jason

