Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DBE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=; b=AmyAKivRNOcut4Djed725vyjlr
	B+YkAmxyZ4hZ+/qXpN3m5FQtzjMs3S4zOWgel1Zh/7jp4jJufCfElBHtpzG0+H5C8xta/dPFzdDSJ
	5HTxP43ZiIDyVSWKCYqkb+WaEyHmDmW8N04cgikaKSnDXx9TUXY6zWFW77F7uLHwsBvmiHM/quUUW
	RNvlGMY1hDI4uglmyX68MtO54GSpcH+tpW+AnwdhUbYzy575O3PypLh0J4d/9JUJ33NVQURgqx222
	xtZnIR6Lfit6FThHP4pdXxiTwxNmCO995Y5iBoYYBOZIGwjQSc0JVzL8CSH1PxJM4vXQ13lmL3/h+
	YSttFxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBW2-00000005Qwr-32RE;
	Tue, 07 Jan 2025 15:29:10 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBTt-00000005QTx-0dq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:26:58 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-844dfe4b136so481984539f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736263616; x=1736868416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
        b=EyoqQw9e+8s+nvwYH4FKF+RVqLkD85XMPGlEq+kDqaJyoEDS5+0E5dz3GSROPGdDxV
         irPeb3joKk0WKO1YzqXwJNpPq+aDcMUewQKgaeStTjIUSXU1tuxmlpYIRVbgHk/YkAo3
         P08xy1+mWrJ543e0hK6jjNTbvz7BJzzK/wAZJXX3SmnW5gtT3vNsWGtR8VcyZotdddNi
         jaJrVFAqXRj4YA6/iyHynUUtDc2SFOmaC9BPnO1ChvOKkhgkWpFbMsA9vM8qoC4GAQLt
         UImcWbBfM0/T2iB1P/YlyklNy2zQ/eUhsLn+kUdSHyyWJPDiJ1gLBQK+h5ye/d2qD+ZJ
         rXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263616; x=1736868416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYd26+ANvMzt3bh8JMGQhBXRVd6LUHx6ZcNpu+1HZ/s=;
        b=PWhLoZEGQO6s8r7MHQJ8wJU8RygLXcjyL+Wm/UlMk0dHAwudOsjw5lMRFbbDHZchbo
         YNzeSjHCq91QiZIJhEdmejHTxxidh1r8E9QQZxYMvpG7y2pI0n6riuFQUETzNIDp5muL
         Z+g+kECdOYkSj//+pn0P3PK7kTyDw06xI6UV9FWhBfpIPe5iTO4ChwfQTcnyyvljNzv1
         YopxcMSadZIOQ35t744D33d3mx0uYUDKNIrunmFYoUWyppJby/Z9VJs/xN6IB3zEtvHF
         luHOfO1GeW75ZTwpWK7AGp7Lde9I0RdLuxPLrbYifVPgzPEQ0ro5QnCdkF3dOCG49hlI
         o0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV478TtzlMPmCIYAm3W2xsQN+pzskpuh6rlRvEtuJcvFKQ2RXgi/gY8UiYy1pBtgWo37Ln4sF7A1Kg18cYGeNhw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3LRAQxJ3DPM41rwCsRghPv68/m+UsCd2JDpGWgg0GsvOuGjf+
	EPrM62knt9FYu/oVUj++Xq8/CPg9x8viUEd17HRkYK9Ibs2TbsOPLsLd0fYypMrG69DeUF9KooD
	UGNKXfgxIF5DnB3LKmNowOzqsW08=
X-Gm-Gg: ASbGnct7CX2DfqCy5ukeywtVFEDCth/jLUVf2JwUYDlzwpuFJLt1WVDPxkaDmZ3ep+z
	iYhwdzqNh6tMjAvtE2bn5Nhkd/Pu/YmilvOa1ip2xpo5Zq5oiAgR4t4Wigobm8KAgZxse
X-Google-Smtp-Source: AGHT+IHwuMLCJR6Vl2J967epV117Dufpeur0fSxmS2hJJtoEYpotAHxco0Dw2fvR3j5a3grMMCdXDq+mOt2AdoHs9GI=
X-Received: by 2002:a05:6e02:20eb:b0:3a7:6c6a:e2a2 with SMTP id
 e9e14a558f8ab-3c2d2568e30mr508063205ab.9.1736263615657; Tue, 07 Jan 2025
 07:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <20250107125738.GA6991@willie-the-truck>
In-Reply-To: <20250107125738.GA6991@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 07:26:44 -0800
Message-ID: <CAF6AEGtZSOMi-=AOmjoXSVkwfyvKOymSuRRMZ7jOcM2wyhu5qg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_072657_188749_A4F84813 
X-CRM114-Status: GOOD (  21.08  )
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

On Tue, Jan 7, 2025 at 4:57=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > On mmu-500, stall-on-fault seems to stall all context banks, causing th=
e
> > GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > This fixes an issue with an older mesa bug taking outo the system
> > because of GMU going off into the weeds.
> >
> > What we _think_ is happening is that, if the GPU generates 1000's of
> > faults at ~once (which is something that GPUs can be good at), it can
> > result in a sufficient number of stalled translations preventing other
> > transactions from entering the same TBU.
>
> MMU-500 is an implementation of the SMMUv2 architecture, so this feels
> upside-down to me. That is, it should always be valid to probe with
> the less specific "SMMUv2" compatible string (modulo hardware errata)
> and be limited to the architectural behaviour.

I should have been more specific and referred to qcom,smmu-v2

> So what is about MMU-500 that means stalling doesn't work when compared
> to any other SMMUv2 implementation?

Well, I have a limited # of data points, in the sense that there
aren't too many a6xx devices prior to the switch to qcom,smmu-500..
but I have access to crash metrics for a lot of sc7180 devices
(qcom,smmu-v2), and I've been unable to find any signs of this sort of
stall related issue.

So maybe I can't 100% say this is qcom,smmu-500 vs qcom,smmu-v2, vs
some other change in later gens that used qcom,smmu-500 or some other
factor, I'm not sure what other conclusion to draw.

BR,
-R

