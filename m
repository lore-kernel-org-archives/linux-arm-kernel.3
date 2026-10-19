Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F10FCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7EoCo9+cczE65jwKsEPVDD2E1w/i2GesRReq0VwToI=; b=NN902mDQnSQ49/NXw3ww0XEcE6
	MluzifgMHbw/sHnfH8yfqv1m3Zv1iHiyk7NaBDI4JA35sCZLOV4ObU1HT9yxrPAuPMaE7H9JaEpui
	93yGGpmwKcKPgOyganAoZB1nG2e7tnCJvwHeH71MWo3QEiaHnrZpeVlGpe2cWAyk9UUHJlyzRkUKj
	iYI/Iy87LGs3dodGQdaID5kJUeHEwiIHmeJPDFRlqkUYZDuWZA5xgPh8IrN8n6bG56quzRRcQu0sg
	p0NHNnNRc3D5TICy3E9iDWAt35/0Spi4ep586G+wwHfNCm5utKxAolmhjeO0ZiBjt2Y33dJIhgCP3
	7+HkyuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImhB-00000007Pq1-490r;
	Mon, 19 Oct 2026 12:42:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImh6-00000007PnE-03tX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:42:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1099190f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413742; x=1793018542; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7EoCo9+cczE65jwKsEPVDD2E1w/i2GesRReq0VwToI=;
        b=FWH5BIgDbfhHxF8ethBNstLloKKpMeWMEbnyEMKAx/yvLEdxcb4i6/+ZZ8d6ostNVG
         m9MmsP8Wix3VQV5MlAXiWf0LXrhFx210KDOVE84G/ix9S5HZbBPkFqtcdUqmh7Jguq25
         mn4mUzEqdzYH6qb/U5dlnqSZqEJJlACdpqh9XbrY0UvNEk7gas/5gNIQMJEh8fzn6y0w
         UfIvmREHR4J0JHVoGrbSCelyGzJlgLlT0uyVxZl8nIriadHwjd1hA8XgJKWxU8nijYYv
         HXEzdcpUvlI8xxBX0mymKpvqxrNXlDQ7amhAIPqKRM/b1K9CoQ4rdcKVza18Y7oaaelC
         kv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413742; x=1793018542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7EoCo9+cczE65jwKsEPVDD2E1w/i2GesRReq0VwToI=;
        b=XMawN/mVbk+bb3UqFNvh1w4Qwf/sbcEMn5NHxHtKf8qNU1rLsBf0UzrVCsaI8Fr9Ie
         7XShwMRxbOj1ECV/ST4LwaFGHjSHtQwk/QnJe173fsJNKOJCDr2n6+61uLzZA2YeEt5r
         FW6am2N9i88jUc7XpK5f/1S3I6O/wYWi/IY/Ml/arLvbA0U/EPe0iV9x2Yg3n8zA9uyz
         0RZKEek6ErQe/dh7Dax/VsHUTqsxe5cTaFIsxohNRJm6ck3q1O8jQzLqrO6iJpeAwONr
         DCvlZwsAExVJRudE+3ACYec3RK1pHMqEM7IjQsbp8pk36oKV0G1p3+BvjSMBWovKl1Fl
         CFrw==
X-Forwarded-Encrypted: i=1; AKwUvBzO+hfO3iBYa15Pq+5IaZnkm3Pdq3Ymh2whINunyDfG9FWturJBpkOFx6mCWJlpW+rtQKmJXwkkTA3x3G2bKGSU@lists.infradead.org
X-Gm-Message-State: AFq9FYKm42xZ4Lyuzhx/2+kYIwb1nW2I6pgTa/A3JRv4HluEUb5lBDQs
	CHi3BDZEge2cqd5k2tRG1NP1KovnxFjetB3ZQXglkkyzl0YJFIKq46ezBZpEtjlzDg==
X-Gm-Gg: AYBFou0za5Zf8sp4/VU2eAGV8Tt108MGgzsbe02P7OiBqeXdi+6p2GsoP0GqBfxPsW9
	cnFaNPkXk4gY4k1zgH0ER2lEGZVOGXQzL309NzzyfVZHuISGBi20UQfOPZnzap0cohra/r6BN4D
	CrMQduhEd5edXjVljnqgMJo+dP4FoOuLNkmtH5fJ66Hg6KtUm3GbwLjIi3nXpoXTCB0eQAPZuoW
	XjOH9LjDdOeOepKHoJcYSQYT1ZUzKuXk098bVUtlYTZQHBW6HqLgGmkuVyBPpWina4PY8MFB69L
	J3q/TZnpc/dplx/rLdzJMMiLmmwwd0nHo5wmrD70iBXDf1WJk8yt79A+DqznrDtMzHFkCMeFD7b
	954C4Vo0RT3K6EqvwviGt4fju0S7RlyOEn0Ro3fN8n7sDRwQYXZ49JPZhN+QX74BmHzVT+kNpSk
	RXm5OVRFWqOzZG3WFFPdWREp5duQe+noj+YA7HyC1/qO8SGqaMYZQuXGih1NuPzm4dBd2yCXFcL
	F7SxoE84Nsqr3Ma16EWyCMXT+9n0Eb7+7EiQQjhvss=
X-Received: by 2002:a5d:4904:0:b0:488:7787:469d with SMTP id ffacd0b85a97d-48e07fbbf4emr11756626f8f.25.1792413741500;
        Mon, 19 Oct 2026 05:42:21 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm23717496f8f.47.2026.10.19.05.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:42:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:42:17 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atYQKaLo4VJDoNJn@google.com>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
 <20261014125510.2928306-3-fuad.tabba@linux.dev>
 <atXqLxU5bBtJ8U9W@google.com>
 <20261019114357.3528498-1-fuad.tabba@linux.dev>
 <atYPZeJuw2grFDlz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atYPZeJuw2grFDlz@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054224_069993_DC624B9A 
X-CRM114-Status: GOOD (  21.73  )
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

On Mon, Oct 19, 2026 at 01:39:01PM +0100, Vincent Donnefort wrote:
> On Mon, Oct 19, 2026 at 12:43:57PM +0100, Fuad Tabba wrote:
> > Hi Vincent,
> > 
> > On Mon, 19 Oct 2026 11:00:15 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> > [...]
> > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > [...]
> > > > @@ -54,6 +54,9 @@ struct pkvm_hyp_vm {
> > > >          unsigned short refcount;
> > > >          hyp_spinlock_t lock;
> > > >  
> > > > +        /* Per physical CPU, the vcpu_idx of the last vCPU of this VM loaded there. */
> > > > +        int *last_vcpu_ran;
> > > 
> > > Unlikely to be a problem in pratice, but vcpu_idx is "unsigned int". I wonder if
> > > this shouldn't be unsigned int here too and initialised to UINT_MAX?
> > 
> > I'd copied int and -1 from the host's mmu->last_vcpu_ran, but the
> > vcpu_idx it's comparing against here is unsigned int, so I'll switch to
> > unsigned int and UINT_MAX in v2.
> > 
> > Thanks,
> > /fuad
> 
> Also,
> 
> as it is always allocated when pkvm_hyp_vm is, Would it make sense to add this
> to pkvm_get_hyp_vm_size() instead of allocating separately?
> 
> -- 
> Vincent

Ha, I just saw your answer to Marc and you will switch to a per-cpu approach
anyway it seems?

-- 
Vincent

