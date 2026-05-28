Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F6CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etZpU7Yp9Hm6cYfSBeTGXh+SR9t2+n6rYsabbI1Ed3U=; b=xakbqGELEt91xjYB93Yxl2kaLD
	+2lN9fy29/8KAKxrBQftorwYDRA5re8VXAA+Sc8KhKzQEPBOIJdONrscYFGUoMT/thsCVnN8/YOTM
	AMk3Op9k+Z/vzCvwcw1cDPBvwPnh9cgBVZaxGRTw5VGGAzquiRQB1ogfZGw5N5nI7TlnK3mR2oi55
	SjDf+uGl6WN8DZ+7qYU5ia8mBVEywWj6PLGL3SXeUq4Bi9D5+5A+2E5z0Bnu0vvqxWZKOkY583dio
	TO1damL6h1zAReKsPzZEwtX6CL2TWIrxlx/kDq9uDqM+q3lA4TC5tavnAWHzoGVOy4TWeUE2KRJ8g
	JUF1aN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjsS-00000006W0N-0Rxv;
	Thu, 28 May 2026 23:11:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjsQ-00000006W00-0gYJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:10:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b46da8c48eso1995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 16:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780009857; x=1780614657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=etZpU7Yp9Hm6cYfSBeTGXh+SR9t2+n6rYsabbI1Ed3U=;
        b=BiqoJu60Uap8GyaQUm7r3aB1NiZMjwhNTuGWPWPia7wyVjQ6dOHZir9nTwqXaVw+Ye
         mceY/JpmVzm+sn//jc3AZJgbE+wIq8gpE6W7BSiXza6tXvd9sg/sST/Nm5rxS3vK95w+
         HPN73X4B2ua60GmbRcvKUqIQPpQM9QP6ftQRxBtSYKXicJuJ9rf/sAOxZJBZiComGJ/W
         lhDb8hJweGZ4wlwdLYP1yopCrQChEubT+GwH5we/wpA7Z76f+p+f/9C5jxD5yJYn4/AA
         vykeN3q1BlQFydppjg0OMZuPjzj91e+LnxywuFn8tgFYhFwV14hyy3keBTzZRuyJPKwx
         NiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009857; x=1780614657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etZpU7Yp9Hm6cYfSBeTGXh+SR9t2+n6rYsabbI1Ed3U=;
        b=YlXqOba9A4zri05TlUX2x6viCJe37ykFqjNP4ZaY3kSS6FIWW5eud3Lw+bnwmRLlqI
         IcKsuxQkcX2bHMgpnjFkkH+MFIjSht62MSZpBxXwvE1KBaKr1/6G0FyhPKl0gCTilcz0
         vupRheBnhZbfANxSLvskpwpvb/F0Xbl8a+ssuQc61ggjn3YydVXz4sp0QxEpSbNQ9+vK
         Oar0VroYRCs14kTsM+9mJ2Z/45UlvmxfMNHfw492VWWQBzSCd7Cua7/yfCBSJNf8oVGw
         niUUabyDRMmsnIIkY24YpI5GxAPmQcsJZk4TQbI3yCkwNsh95BhG9JDwoTxnJqtV/LZ9
         e1kA==
X-Forwarded-Encrypted: i=1; AFNElJ+XLhXbm6Q0sVNcDS3jCUIuH59WaxbUEQ8Xh07QUsznreTDqoYtPR2CTDHX070a8pkJjAKr/RwAYrJCQd3/Cfg9@lists.infradead.org
X-Gm-Message-State: AOJu0YyIONeTlM3PvwsqwOQNy9m/9GYoS4iudYztXqUjGLQLqzz7ihc5
	1G+qwKsUuBQk0b/HsMCWhiGMMdAZLgU1dNdXTbdh6SWQlV9EJxccU1AC1Jsmpom2aA==
X-Gm-Gg: Acq92OELEfJcUL1iZMa3aRiPLE3Ck3B3VLYOwdKAsZoBN4agzgkAxFw3bK2P1ZkDMZi
	msUlausTPeIPcHo+LdyWObEtY1FvpfNWanSELZ7yRZ6yxEQrGbw7DbOGt1GIIB3ZkM7i2pmK2D2
	+Xkso4ZFi2O4PQ9GJKEIFknTrwdOkuFy06iZxy9TlAZ4jacL/h8VzaJuVJV2FttiQId1kLQv1oi
	qCKZqKaFN9FcA9h8kMktNoSjRVm3gzxeCXzA/Vs8tMH04Ax6axt6zgcb6KFJ1SPakMEQ5cPhS+0
	zm/9YxBTFxs4yj7cywsZRwBPPuQv1o8YwxLAfdFd1vNl9rQe1Ryqd3kc2s2Smu5l8Tdl459SNn1
	czcfbAayP3WA0ylevFWNfO0DN7NNobkX9tx8dWefj8oRagHlVbxeDBjBF48ZNpOR4XU7VJlxzlY
	YuK6X7sw5sn4xJg8Fx0zgwHfimiIetIAxZ4vxCHSbLkGyGxzNYFvQMmFb0V/Vxyhu0rMtd88jCp
	itZH8c=
X-Received: by 2002:a17:903:2409:b0:2ba:6518:e4d8 with SMTP id d9443c01a7336-2bf20d124a0mr536595ad.20.1780009856790;
        Thu, 28 May 2026 16:10:56 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8575b7bd15sm94187a12.15.2026.05.28.16.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:10:56 -0700 (PDT)
Date: Thu, 28 May 2026 23:10:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 11/11] iommu/arm-smmu-v3: Add KUnit unit tests for
 Runtime PM
Message-ID: <ahjLeryndiVuTULP@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-12-praan@google.com>
 <ahi3HYssUY9mjjbg@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahi3HYssUY9mjjbg@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_161058_223352_BA6706CA 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, May 28, 2026 at 02:43:57PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:07PM +0000, Pranjal Shrivastava wrote:
> > Introduce a kunit selftests to verify the Runtime PM elision gating,
> > post-suspend elisions and progress on resumption under active
> > invalidation load. Simulate concurrent HW suspension using a timer.
> > Mock all HW registers and CMDQ buffers by allocating them on RAM.
> > Make the mock CMDQ self-consuming to avoid hitting queue_full scenarios.
> > 
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> 
> Maybe I am wrong, yet this reads like an entirely AI-generated code.
> So, should it have an Assisted-by?
> 

Agh, It appears I made an error during the final send and mistakenly
posted an old WIP version of this patch! I created a patch file before
committing the final changes. This has remnants of older experiments and 
lacks severals other cleanups!

I'm aware of the AI usage guidelines. However, this is not an entirely AI
generated patch, it's a pre-cleanup snapshot of a WIP version where I had
multiple rpm tests (an attempt to use kthreads to simulate races) that
were using shared functions like the mock_cmdq etc. remnants of which 
are seen in this patch. *FACEPALM*.

I'll send out a v8 soon!

Thanks!
Praan

