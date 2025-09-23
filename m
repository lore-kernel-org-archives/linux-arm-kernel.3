Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FEECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpGYqVi5hf1kqSDhOzouIOkYFhp9lAGx8gTYX7wSjXI=; b=iANRar75vyxFBI/ldK1fgvQcCP
	DzdrrAkU3bHMsr9PZ/+S7K9MUMor4Kv/S441LgMI2MDIpx79cGJYbJ61AaUFr+lvzYmrJofsNU2Ph
	lQppCC8ICMZMx7ceivW3YFfNZfAKdRuvs6aYr58wRepFJbW0hBHOhu826J2vrA/jOZX5HipEyESZ0
	ZXWkF8c7g0N2pUFzQsKxMQSt7ZX0G0bIvrpv7NRl3UL5NW8ezkJ9aWb+5HsoCFP8w+BvDLOezGToo
	4J2TAZdN7ypdRaq0Wx5+DV3BT8gcJ2er76maivUYWAuK29jkVvRvjXDghiIA2rc6Wr41kd+wDo6qc
	ZlvrXUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yN0-0000000CoDb-2mv9;
	Tue, 23 Sep 2025 08:27:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yMx-0000000CoBu-2TvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 08:27:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso39806645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758616046; x=1759220846; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpGYqVi5hf1kqSDhOzouIOkYFhp9lAGx8gTYX7wSjXI=;
        b=YJUtfDYmuHdlwvJ500Y4XCbO/Y7TKcUHo5D1Ira5FCpmj3KIrnKFlpfwlbJuFFrRXG
         tEQXedDzSBworzfSeqJ7lbMRTHTVGbuO8tHq6hsgXAy1CGNAqKHQSJ26wRdWFX2QME3v
         0J+jSowms2NWrqoj37FrkLRA6INxAQXrvEamZrsA5c3ymUUpCwbHcBzrB2HC3CWv7pto
         sZFJt9F8mXo4XtILARHA1y32rFU2h9LicryWLEGPkHVp3GiLyfTAfvqwRkJPZBeFeR2T
         SeqITCXk4yFnON0RCZqTWpdmfKIaoeR09c3BVS3t61q7t02d5FD1Eiawd/8SnXKXpMi6
         sy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758616046; x=1759220846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpGYqVi5hf1kqSDhOzouIOkYFhp9lAGx8gTYX7wSjXI=;
        b=XN9Bo2AZQ9BbbHiNje7Ki5QvpQSEOqlpOvHdb7uEW96En+m6sft9UikE9QuH0JS7f9
         5X2eMlfwTo5L4+3qdPowv4VhXJr1xWxcAis8zfss8qsEuG4v6SCUy0AGe1zmbzuvNy//
         0Z6KDhduJpK7VN9DHuBv1EJsgOob2XOA4C8KigmsTarP/JDgLvUh+VG8n/G9c5jJMWng
         EXjX/So9t4+rCV8J7aJHBdm4Djh42QmhTJV61eJ+Tg5rpwq9vSnvrAQJXMGGkJ1k8GTA
         fsM92RpTztpv++VvMvZnnYrEoNEBG1AKYXefwkdJiBlXKw5+3KVCq311u2P+nmXSfltV
         l1ew==
X-Forwarded-Encrypted: i=1; AJvYcCUM0frJ1jGGWA4nl1g3ZNgvMhHF3c+RO7d+kg6fazwDK6RMFiDJBzlw8sbrG7ymYzLTqI9C9ArAkmDstzj2hq58@lists.infradead.org
X-Gm-Message-State: AOJu0YwHHNdn3GP5bstIC7U+97k6QipqxLSpiMPnfzUwCIBsw7Wt19Ra
	NXoRKNutDfWXUHckmjw8q2ZgLNyRrTvSUkPqZzuDeea9OlTjX7/dIuV0ZV2ofoHLkdY=
X-Gm-Gg: ASbGncsD6ILvGNR8W4mKoHfVZ0EnZtKYrF5z0b4lXupVO+hPSKgARPIRWCxpXcINWsQ
	qI/NGGIr89V6zk3Q7KumsLI7PfhmttbAcmIrfna/hXODj48RWNwD6uH/QZ7zDxaTztnJidFEEGP
	7PhGJRPulHk5o5+HnI8tkooHMkB6rcDD7/HVokqJu4duJaCCHbj/ZZNgr5qNzOStYZza2j5Z2zR
	Yjf9IsvWXZn4qvlk8g6GHCu0z9JsdTbH6WkcnUFbqHRkCux9nPZUYE54GOOht6ytfZARCnMnmqy
	CW6MhNn1IeyDsklPiUA6bYtFoFhW398GbkItQNiOkMm1PZY1UDzR0ZIY/v9dAJXOYNek+KNqRGL
	b1NgeATTrYrRfxxQ/gxopG0gISGatWpjBwyDZR2Q=
X-Google-Smtp-Source: AGHT+IGWAo9jrh5BzHBdYB7EPethaAYsyhu+UjZUGORfpar6nubw1VsXbHY/5Rg9h0dxbvNaHHjFbg==
X-Received: by 2002:a05:600c:198c:b0:45f:28c9:c4aa with SMTP id 5b1f17b1804b1-46e1d97fb07mr17761725e9.9.1758616045492;
        Tue, 23 Sep 2025 01:27:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a286edsm261270095e9.16.2025.09.23.01.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:27:25 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:27:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJZ6SqYvBfjZlrZ@stanley.mountain>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_012727_657383_F0FC3D9C 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> 
> 
> Hi Will,
> 
> That's cleary a bug and I don't know how I missed it.

Because we disabled uninitialized variable warnings for GCC and because
everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
testing either.

regards,
dan carpenter


