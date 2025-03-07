Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59317C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNAp1guL3DdfnvorYMboaljiCgvGEgEmNmgxMM62RUY=; b=GWMBlyW34rmN697uBPrp05V/NX
	lMLrfluf/sxZx5YK/joEQqeJP1cd0rMkuz7BfHid1DAHrN9UNv/aHw9OIrUDz9rvsl2U9OVvNsh55
	qxji2B6SZWcbd/FgoGrVenax+n7OhIlyMQxT1H/QC1mcESLPqoVJDpVBS5v2X1jKFY2dy5elYGjU5
	goPHr5N3vSNmU+gFZsLhG0Ld92sUOJZytFG2NzTK3DjmIkf2AoMpmnQMBpms8GO8+jrQtddls1vc1
	zWmGSoy3IzJT+7WEuHnHKXSEesxChuqGy85mkPD7kcij64hACa+0S3EWzTnKV+rfueMq5Sx/kUtHy
	Lmmi8nvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW65-0000000E56F-2pkP;
	Fri, 07 Mar 2025 11:42:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVz6-0000000E4Fw-39rx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:35:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so14415255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741347318; x=1741952118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNAp1guL3DdfnvorYMboaljiCgvGEgEmNmgxMM62RUY=;
        b=hR244VWf1PKXaCARBSuCe+RPztW7ax6vp2l1SLxx33zWsl0KMrLJyMp5l2ODCVde5i
         cD+qkZxHIVTFkc9bfvxIf/w/s9f5pFr8aieNXLd4Rd6HXm07hRjNSiIo2aYG2ApZxoLL
         kmkchhikw4W6snm9dGcJ++85Lqy3DJToNU15C7J2UVBBHJ0h2teSzB0fBIVXJYT7nhr8
         R83THclfWtD+BQamKvvrzE45QK9wWPMWDXnr7asudGedZjH5Gv1aMVbCqGe0S3hMxbne
         5uFqNyw5aZRzwiZR2aX1Quy1mf9nvrfdh1r3ldgLw1jP3f2DQErzhv5LgdEIOexTHzpO
         BvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347318; x=1741952118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNAp1guL3DdfnvorYMboaljiCgvGEgEmNmgxMM62RUY=;
        b=BdLx6cSsu/TZEuTbX+FKpLq3zRhoUvEdhdFNU2w4ovuoM4JEIVw+CYfVRmkGvDUPrz
         xfL05SozvsVbehO2ooZVeI6MvbEHgXGcwjqB20SA0DSo0L92rQ9w96S3EzOLMk9aVa6X
         IBm7w0tJmMVR+mgfKyLcPAxlvxyXL0tUQbaX8fZAqele+B08es10Eir9RLsjsDzIekoI
         Kh/LnXAZZNrHQj/HedgzWqciwcKQqWj2n1ukF+/RGcN60wbd/xvWzNp7eLgstFJm5wtn
         qdUrSbm0rVOu3pwFx78SUNGc0/rAz7scppdp6voaqu7RhkWyrJzS5xIZ4E75Ch3OZSGP
         c8yw==
X-Forwarded-Encrypted: i=1; AJvYcCXf5JW/+dOlv1Ws/fyPOQD2yz9/TkcUhtorMo4TjWPTeXOckLKbXYw08ueWm/dshThb+Aez0siNxvSicmYSufmM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy8ttfIc+nGuuCQu63jjBggIYOvw1EQRtdLGN8rY/k1uyvOtNw
	gpSjMQb8SLoCCKKZCCDcxcHm0Jnnx0AoOfP+JMqPcuPSaxme2YMwKgHJuUw1Bw==
X-Gm-Gg: ASbGncuvTyFPCMNhg9j+x/3PZhRxYQglq3rm99uKbUt2lPklfAoczaiutoWqX4jY2rt
	jpSZosoyMPZnwJuNkEX48j41RgJgylp9id9bHJULAtxwO7z0XrYkVprqbaBnswaTYWwXXj1ss5p
	Lv48DLf18bOlRlw00NWDruFEvHcdWej3n7ict3Lnd2tYjp8iTdwZzVVfup35d1ByEUmfhbrNlMv
	V0Fz5GAf1GfRNIJN24387ek5WTzJtV91t0B/9DKoBqf7fluqeveTwYYpUZLr8G7gX8OSA22kFCr
	IlHg7f8gKLvjhdjc/cFdLem5ihSebBzS+lsgSZy1noLER5vsl1dDF2dnb3NWOuVTSqOVIVwbmIV
	aGuTdHbKZIYyK
X-Google-Smtp-Source: AGHT+IGjS32YvEDJ0dggC62JcymX/iPFtuS61I6Hr817oYxnTdUEtKfb2H4jSY7/r9bkym5Nc7UyVQ==
X-Received: by 2002:a05:600c:1c92:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43c54a13899mr24034885e9.0.1741347318291;
        Fri, 07 Mar 2025 03:35:18 -0800 (PST)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01957csm5051720f8f.47.2025.03.07.03.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 03:35:17 -0800 (PST)
Date: Fri, 7 Mar 2025 11:35:13 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
Message-ID: <Z8rZ8bBnSllaZCEs@google.com>
References: <20250304134347.369854-1-vdonnefort@google.com>
 <20250304134347.369854-2-vdonnefort@google.com>
 <Z8qeIPfTOJU6w_8l@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qeIPfTOJU6w_8l@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033520_790561_DE9E6065 
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

On Thu, Mar 06, 2025 at 11:20:00PM -0800, Oliver Upton wrote:
> Hi Vincent,
> 
> On Tue, Mar 04, 2025 at 01:43:44PM +0000, Vincent Donnefort wrote:
> > Add flags to kvm_hyp_memcache and propagate them up to the allocation
> > and free callbacks. This will later allow to account for memory, based
> > on the memcache configuration.
> 
> It seems slightly more obvious to me if we pass a pointer to the
> memcache instead, but that's just a minor nit.

That sounds good!

> 
> Unless you have a preference on this, I can change it when I apply the
> patch.

I have just sent a v3 to save you the trouble.

> 
> Thanks,
> Oliver

