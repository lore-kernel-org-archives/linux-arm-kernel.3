Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF5C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th+KCDURk+54uiOu7vrQtTKV4wr7vJCxQzUoT2E5qpU=; b=x2/Kjhu+7fXUqlTwAN/b3h6Fav
	WaEaA/my1Olhe5GqsZPdLZjtJAxXxAlvKZJysq/NoXcU/B0LHk0gN1e1iU93+hfkxjgDQM9RLm6od
	cgUQr+4NBECxrO1c3KRdYM3E99T+bwzG3fa0bhO0292fvKboteu7LXhwNokcXUYPmySLfDJpSvh/C
	CI1jFc1N3P1AKp4AGUR2/KsH2b5jrFjz2jzmx2KZ2+sOGR1ZNwCpB+7MJNy/hQ0EZ9oPCH6smwtzv
	lUsIv7oSv/UY1XE6QEOVKxdHV0FW0F4zffCH4NFK0qLmKVy/6XmAq9M9kPClYKiDp35+/wchPln2I
	zS7gvwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRHi-0000000FG10-3hrp;
	Thu, 16 Jan 2025 14:55:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRCD-0000000FEbs-1ztg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:50:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso45705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737039007; x=1737643807; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=th+KCDURk+54uiOu7vrQtTKV4wr7vJCxQzUoT2E5qpU=;
        b=mFRjkbSX1HtC0foO73Tc0R5PG2NoVoPgCUnIcJ0PFNp2Hq5ygAyT3B2qtreXUbqwQv
         wnHFZajDkcEQdxyLrcbd0cF9W/Be3Cb6iP8PEdzaORX3etJaoDwlk7xD/4KNJO4hA/q5
         cv9etlm6Na6Sg51jtoFcw1yGKxyuoazZMO23YJc6vfnboN4srK9iVxgp7nM1lpwTYILY
         C4HMwXINSL+jybk1tgHejq1BOt+uZ298YLEP3wJQBQ0NfecXSyfmuGk0ehqRuu98S4Xk
         qhvqlWMmU0wnxs7nDnQ75xj9mOIGRSAUpsTC3Tw7S8V05dRA/wIA3+TLnCXL4Ia5Rd54
         y8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737039007; x=1737643807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+KCDURk+54uiOu7vrQtTKV4wr7vJCxQzUoT2E5qpU=;
        b=o9NzAUwcfhK3Uz9X4GzbSRF9iCZ+vw46bhgY84ntePxARTNUFTv2Nx61nZFM8kDkVA
         5ZN73liZ9u6rMTtj2pdROHB/Wrw9Wban3QOc0W9RaK+LdH3rRYBe4p4nb3M1IGCOhyUW
         vlk/gsLbjIFwA34RS79sCYuVciZ2Rjlzzh2642vM8Tl18tb2ViT3lyC/LpOEuWKl+8wY
         kbZRxnZW9275U5S9Ans3hrHlI0IcqJmPUsaBccl4xvVFjBwAxD9JOB/4+blFXEJozczS
         4SdzA7Lu4y8Llt/C9wSKkw1hugz5ce83IPgWLIrgPsNt71uYvoSI0GGXyV2HKSE21l9D
         3I3w==
X-Forwarded-Encrypted: i=1; AJvYcCVSNjOozc1GHQ41WYJiF6I2p45IA38z5J9DUJqeijGqFzyH2yzJpMfPPx4cDSBWDLHtHhpIGgi46PPoRd4vAlXK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0SD6DQbY/i0ksQpiKlnk9fnWVUDls/zw6ioSxcB7YlEU0toqF
	OyW+4c6xvRFHZ/6Xj3Wu4MZgkdXeX7yLQ5pxP4/7kMYgELWPghfc6jFdXFriFg==
X-Gm-Gg: ASbGnctomKdXG2Nly+CxaXpInwxMNntmus9TwFIFloorKzjN7SAlO1lA/1ChTzIRz1C
	qywXiEP36MnmBogmaSkUoIG9OR7mHf4eUrXOybbHIAkpfjWBEnKEL/2RQPoF2zq7BkpmIH4MZ1U
	upciTkZS6WtG/CcvVIqwS42V4Fzr25h5qNESrbXBtHmKBl+1TIGdt+uYTGGf6vfUjQVzGYeFmWe
	996lanZl0FG6z+GD5Az5w+2CLrmn1P2YA0OOBAd/Ra6jf8Sa6e8f1HdCxKs3ZZiR5YEOEI2KbfV
	OVpm8MHxX2J3ToSt+Kbhep9r
X-Google-Smtp-Source: AGHT+IHbW5e6FcdINOIJSuAL5IxGPUZUYCUoVAOoYMejLluSZuDbScxH72g/lWhucPA8oug2f237Bw==
X-Received: by 2002:a05:600c:693:b0:436:1811:a79c with SMTP id 5b1f17b1804b1-4388b98b77amr1013155e9.5.1737039006638;
        Thu, 16 Jan 2025 06:50:06 -0800 (PST)
Received: from google.com (47.246.140.34.bc.googleusercontent.com. [34.140.246.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625e5sm1453475e9.32.2025.01.16.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:50:05 -0800 (PST)
Date: Thu, 16 Jan 2025 14:50:03 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	oliver.upton@linux.dev, will@kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH] KVM: arm64: Fix the upper limit of the walker range
Message-ID: <Z4kcmwzoRINgTtrO@google.com>
References: <20250114145050.563658-2-sebastianene@google.com>
 <14cce00c-29bd-4feb-b7d0-7aae6e948d1e@sirena.org.uk>
 <8634hjvxi2.wl-maz@kernel.org>
 <e79c78a7-24a3-42e6-a217-ec64f8320e91@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e79c78a7-24a3-42e6-a217-ec64f8320e91@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_065009_511542_9874A85B 
X-CRM114-Status: GOOD (  24.72  )
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

On Thu, Jan 16, 2025 at 01:49:54PM +0000, Suzuki K Poulose wrote:

Hi,

> On 16/01/2025 10:55, Marc Zyngier wrote:
> > On Thu, 16 Jan 2025 01:16:40 +0000,
> > Mark Brown <broonie@kernel.org> wrote:
> > > 
> > > On Tue, Jan 14, 2025 at 02:50:51PM +0000, Sebastian Ene wrote:
> > > 
> > > > Prevent the walker from running into weeds when walking an
> > > > entire address range.
> > > 
> > > The KVM page_fault_test selftest started failing in next-20250115 on
> > > at least n1sdp and TX2 in VHE mode and a bisect seems to point to this
> > > change.  The bisect only just finished, I've done no further
> > > investigation.
> > > 
> > > When the test fails it generates backtraces like that below:
> > 
> > [...]
> > 
> > Thanks for the heads up.
> > 
> > Given how close we are to the merge window opening, I've dropped this
> > patch from -next.
> > 
> > Seb: it looks this breaks a bunch of existing assumptions. Let's
> > revisit this before -rc1, if possible.
> In kvm_pgtable_walk() we set the walk_data.end to PAGE_ALIGNED(start +
> size), where size is BIT(ia_size) and start = 0, for
> kvm_pgtable_stage2_destroy().
> 
> And subtracting the limit in _kvm_pgtable_walk makes things go bad,
>  returning -ERANGE.
> Given the kvm_pgtable_walk() passes the "end" as the top address (not
> including it), and is always PAGE_ALIGNED, we should probably leave things
> as it is in the code.
>

Thanks for looking into this.
I have a fix but it is too much of a surgery so we decided not to send
it and instead go with the removal of my change. 

> 
> Cheers
> Suzuki
> 
> 
> > 
> > Thanks,
> > 
> > 	M.
> > 
>

Thanks,
Sebastian

