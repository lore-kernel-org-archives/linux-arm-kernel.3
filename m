Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F160C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsIvwEcUTBMStw2MMLLuDVcTGQeCcLwOBqA9S/j+YXs=; b=RQ1PuDgU1oWGZwh68RPRidSqt3
	QD5ZdqBqug4yGtyrbB/O7pJCTyMQd3iG8OW+4uPa482GI0d+a90isWY0TDbeqZbcX9VbSRgqZPyyl
	kLFzGsOb8LAbASXqdR3lmscgdfwq3gRzEn5ezqZS/8o8DvM4GMqrb34aYN91mrp64K4sRDxXZp404
	izN8A0NZxhbjINQgyrgk641m//IGGiKHm3RYiACjMnC3M4yioxt/o4uVns4sfsear5FynerdsLpIk
	EJJUybAiGSTP/4kaOvdLVb43Mz/quwOvKW7yh3uyNJCCes+k/y2575AhXZ5hvACzUyNLFNpGMYnz7
	n0nbKCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwKS-000000056tE-1hoO;
	Tue, 11 Feb 2025 19:53:56 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwGj-0000000560O-3Ydr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:50:08 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-8553d7576daso63961639f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1739303404; x=1739908204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsIvwEcUTBMStw2MMLLuDVcTGQeCcLwOBqA9S/j+YXs=;
        b=VgRq+F4pK9j/IBU+z9vLcqpc6pXeJsmlRaR6k3hWF8IvrDXHdS63vuxdYAXqzd7Gp6
         JaAdFf9P4sbM60KarzmYbNM/Pp1sqo7ffsP+EC4HdBc0IbHiNrfjP30Ej1tRRoZ0R57i
         RKfqSebJv+HhaFvbaSiCh2fF+l0ZDo7YEiLz3ih2IIFAaS1Wu5MyCQeJN0r/10ll2TJ+
         3rJ3MBAb6HcSs/Oq8SRVKNa/6hK88t8nDLHxkCjvoa78nAiGigvs5XAwfK7O2iFjwIGc
         6J2JOVRTvpxl9mZR8orUBGhCoFCOGQDJjKT6kkIm68GoQ61zKJz0ubHlgfp44spWv3Ox
         k7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303404; x=1739908204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsIvwEcUTBMStw2MMLLuDVcTGQeCcLwOBqA9S/j+YXs=;
        b=b/DzAPHhlyUPnOQOIJTmXWkOmwOiYxYflb20Xsxn4foPB+CiqAfip6iurF76+geRIz
         RhIh0GL2ixiKn33p9qYgpgM+dTxnRFgUkH1SQGdG1Ka6p9CembiDvCLJig1t3impNOEj
         SQnbC2T8kAfJrxaT5aQGDkxnYuxlP8P/OcKoqeGlyAmh5sUzK+MQzQKnF5xTcqtB+ANm
         lNCEmf9p7x4NaD1EBU18lL+i6zEiDhAFzOecSWvEqmQZURKy4BB2AKs6YXtXfIUAzpUR
         HWTn0rVD3npN6Yva5vEFbhpldywwmYER91G3xuukRw4mxAJSIOwFyL5+aL3RymX/2fMY
         FkHw==
X-Forwarded-Encrypted: i=1; AJvYcCWsaj5sQ+VqFZE5VLxyXfkC5UN1YboY6UtaYfFeaH+/UELhnlZ8GRWCgUacB+yYDdQISJlqOLhjRxfoX3hvW4YG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+MWvMaKYoO2q19Vy1175F548q6cnp+Bje5jo135aAGTbZNw/f
	hX0FoAdZ0u0FeCpIRG8L74e2UatNCorZ1vRb/3v4Ckj+49ABYhjKWHPpJgUbWuk=
X-Gm-Gg: ASbGncuyvwqm2qcXgmdWTqwZoRSYYqSOruGW4xHlszHCo+b91k6IeqdNJ1hLHZdXbQg
	llzfskK+rysPxVVjxf09ja/3gqDjqRrRZ+N3H+A+KsUFKVfBIyYwuLDRUsybjazzxG6j36xbXiU
	mTgycxddc9mUXMFX81fO0wMktgRS3j9JjchnP6xBkiCWjDK1qa+c1/FxzdGYNR/0J3SxcZEZDvj
	pC+RzLiL3KDYBrEyrE1jW+U9XbpY+VR9/DPLi/PavoI/kg6xrBrLs45nlCtLO16hGwDGACEKkiD
	xuiAMRtaU2Y=
X-Google-Smtp-Source: AGHT+IFrTVAEGiw2EoTh/b9YW5R/KtzW2+Oh2EsbSrKLQH+zV7TjtxzGKsJ/H8T6kpwj7fxcn/baxg==
X-Received: by 2002:a05:6602:14c3:b0:843:e667:f196 with SMTP id ca18e2360f4ac-85555c8c4eemr91680639f.4.1739303404598;
        Tue, 11 Feb 2025 11:50:04 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed1885b085sm77104173.69.2025.02.11.11.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 11:50:03 -0800 (PST)
Message-ID: <84447986-6cd7-499c-834e-9aa01fad98da@kernel.dk>
Date: Tue, 11 Feb 2025 12:50:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] apple-nvme: defer cache flushes by a specified amount
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250211-nvme-fixes-v1-0-6958b3aa49fe@rosenzweig.io>
 <20250211-nvme-fixes-v1-3-6958b3aa49fe@rosenzweig.io>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250211-nvme-fixes-v1-3-6958b3aa49fe@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115006_082555_5C96E823 
X-CRM114-Status: GOOD (  16.09  )
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

On 2/11/25 11:25 AM, Alyssa Rosenzweig wrote:
> From: Jens Axboe <axboe@kernel.dk>
> 
> Cache flushes on the M1 nvme are really slow, taking 17-18 msec to
> complete. This can slow down workloads considerably, pure random writes
> end up being bound by the flush latency and hence run at 55-60 IOPS.
> 
> Add a deferred flush work around to provide better performance, at a
> minimal risk. By default, flushes are delayed at most 1 second, but this
> is configurable.
> 
> With this work-around, a pure random write workload runs at ~12K IOPS
> rather than 56 IOPS.

I knew this one would bite in the ass at some point down the line ;-)

I do think the feature is sane, and to my knowledge we haven't had any
issues with it since I originally wrote it 3 years ago. But I also
think it should probably go in the block layer proper, as other
devices might benefit from it.

That said, I'm fine with parking this in the apple nvme driver for
now, as we don't have to deal with multiple namespaces etc. Can
always get migrated to a core feature later, if desired.

-- 
Jens Axboe


