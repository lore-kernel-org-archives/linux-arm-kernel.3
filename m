Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08BCCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOp4VzQJzpVrzaLWG2n8IsNxEYbCwRvMjRwLio3IkjI=; b=hmqu+6fKkqxWuyB40s76vfsIVI
	qqF25bDiXA5TBYlvxW1bm9OIarvymqPeDwYchSZElFhgdHdm72I8+DLRB96TUxrMdEMUSoc9wNwbS
	bkp8yMQW8fV6e1VXgi2jFl4+St5xzxJU/4jRK6ene9JaPU9SbrucyTIoC3F01cGPcKw6dqRZVWp+d
	q8o+G1uznvFx0aRA3Wm7CtVsl1GHgNDNQjNJ8SuKpSwIWjBri9sRKcVS9GA+8yCSsCabIevg2W1Ed
	LK842tJ8hIPzwy3MZqoWxuzRBJlH7QQQLM8S7+9Pw+vuizMKx0ybr338knOhP5Md8ULaG4pR332xn
	PajSxCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmLk-0000000Ggd9-32Dr;
	Tue, 12 May 2026 12:36:36 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmLi-0000000GgcX-3Z4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:36:36 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-512f09ecc67so38277561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778589393; x=1779194193; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOp4VzQJzpVrzaLWG2n8IsNxEYbCwRvMjRwLio3IkjI=;
        b=BSH4vyVkZ0Jfq8zC8miLUr0OXVvCxTUgQ5KRpe0LGuuvl/0Rho8of5bfYtkRXZ9k9E
         OUWavEaVsuMpyxT2IkJ0ES3fw0ToK4UWyk8kwU8Vho4zmpfsVZ25RMcwZxtaTlEBFIc4
         MKOgdHxQ0cajs+xkZ+rzsTasfIf+5IVt6sZgA7bz6IsZiqkSg0399THQyM3VewguOStS
         Ez+Vc4fdTLnVdU9Z/hNWxrLSxPhL3J69JcyWlPRt9QKsiVggoFqRjF55zD2M6ZfCJNkx
         7GAyvDQJb/KUEVuYMZ5qPwIbBM6nZx+d8Mvl7J6eE23Xbsk/wKuFc5OKZqcM90+LfLDk
         lASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589393; x=1779194193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOp4VzQJzpVrzaLWG2n8IsNxEYbCwRvMjRwLio3IkjI=;
        b=tOnKWB4je7YdxBUiTfRrYW8sAEVv4+cHYjb+TImMS4inw2b96MyqGPs6PK1sGlsdSG
         Uma3gFaoZUmbZQ111sPyCX46MYdLPSPV9iz++K4DC4yy0exqSWsVfxijkyDTM87HUSwe
         5146lFgNewQZKkfhhw0CkCYzXJvQV4hJ15ckSNQFBz6UhfK/fQEmw7gxOWrzlkbPQdlV
         oiWnEY0aPGhQop3X2m3x3CWTWibVt2AmT6M1hHNxOfphQjdyENhqknNtu2C+T7hMiqjV
         O+6JZfN1mL0coDxFIS0dddKY5QHxY7mWzD7AVFQCO+o65nJXOfdn2HROTUJFQJaM+UTh
         plbQ==
X-Gm-Message-State: AOJu0Yzx13Gya7l6pMlxWCV3e/REnOCwNPb6DeLF8dglafzvt4gJZsZY
	zy/5tgGVhZbrXMmRGZkG6Xlt4FFpVsroEVkOuzdZ6AOx2uJNpoc2ova0OZxhCDN/gHs=
X-Gm-Gg: Acq92OGJkngnu1GiTacQ0/da9+OkXHSUU7VmBGTOjqcCkTRvQrnWBZn5f0OO0mjCuz+
	i1PgJCcfIpfxrbVKNhH9URLmbrT24KktogKeuZWrrweduvZD/7gkJjSGNFA7Y5uB+/FDqrH5lrV
	CRvYcJR6Y6FUow33dYKBNtJ4IpzPGtUvpJRGOx4GolueIynJsMus2emzD3Jg/NX/IKiZ+b06xrm
	OgJvtnVwED5BQg87dNsnskcN8aGDWakAdNIh6HBHoJXuIrH3KiZB3020bXE3yktalUsATQ/Ss7t
	vJO+5Wc/6WZ03p30uL6zO/1L0sBTsztNVIX/H2IQ/grqv6/PxX0ZDlP9PxzF0Sa3Tlnb7p2bdKf
	DLIA3jaWrjNJdBmzruLb4TwJHQ8JM74MFHh+6zBMqqa1YZLFqBif22EnL/NSUnkAHSCJDzABPyI
	OhED/q/tFIHkBpZLOCyxLua9vbinLxabvIiNGq8ZL3dTspxL/bQIeD9fuI7qe0XS/Vg4Vp3rJaj
	Xb2mA==
X-Received: by 2002:a05:622a:4ccc:b0:50d:97e8:939b with SMTP id d75a77b69052e-51461f9e47fmr406246311cf.36.1778589393437;
        Tue, 12 May 2026 05:36:33 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53cd827c5sm391412326d6.40.2026.05.12.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:36:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMmLg-00000005AiQ-0kgs;
	Tue, 12 May 2026 09:36:32 -0300
Date: Tue, 12 May 2026 09:36:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <20260512123632.GT9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <20260501130006.GF6912@ziepe.ca>
 <afiRB3e3o0G1oZvY@google.com>
 <20260509232714.GI9285@ziepe.ca>
 <agG8XtrHUfWGy-kd@google.com>
 <20260511142232.GP9285@ziepe.ca>
 <agMEFhxsmjpO0thM@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agMEFhxsmjpO0thM@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_053635_050183_A9658446 
X-CRM114-Status: GOOD (  20.33  )
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

On Tue, May 12, 2026 at 10:42:30AM +0000, Mostafa Saleh wrote:
> > Also io-pgtable arm cannot trigger BBM behaviors, so how do you
> > implement it?
> 
> At the moment, we workaround this by mapping all the memory with PTE
> level, while MMIO remains at block level as they never change ownership
> at the moment.
> 
> This is one of the missing features I plan to add after this series,
> if you look in the cover letter, these are listed under “Future work”

Hrm, I would not be happy to see io-pgtable modified to have bbm
features :\ They are very complex this is what iommupt is for..

> > So that's the real explanation, KVM cannot manage the S2 in the right
> > way so you can't share it. RMM/etc are managing the S2 without
> > pointless page faults so they can share it.
> 
> Well, there is not really a right way, even with a fully populated
> stage-2 page table, you can’t guarantee not getting TLB conflict aborts
> without FEAT_BBML3 (which is quite recent), unless you map everything
> with a leaf level, which then impacts performance.

I mean, there is a right way - you need to rely on the BBM features in
all HW and fully populate the S2 for no faults. So if that isn't
present then you are doing things that will harm performance to work
around the issue. It's fine, but just explain in the commit message.

Jason

