Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B8C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=; b=3MpT5mtkuJd753mlJ5Awi6QCTD
	Xvt8VstnE9H6DZpKEKLIuZUJDKDY+ZXxv3o4mDVEKqP6Hrv5Ja6AXaDnDoLnSvxBnch8PHOBPvQj6
	0XXIW6eHzt8LmzFLtZPiiWZaY+4GRpakJsRVcjSDmvr6VP9QJg1In2LBl7RkhPwobAE4NHZBr2OBK
	J8SSNtk75ustWp3r+p65U4JRel9B1oNwVT7oXRhhm57CrnQPnHvDvBPHHogpvR5g/fzGSsdasm1j+
	lAb28HaI0MkwXjySneTZttY7zlifjlgD8MfA4sLNO9ENgnhZDIHxANyLGKb7jIu/es1yjd49s97qU
	YBA6GTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PMm-00000008p6r-1kQK;
	Wed, 23 Sep 2026 15:58:40 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PMj-00000008p6D-3Hgc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:58:39 +0000
Received: by mail-yx2-x10.google.com with SMTP id 00721157ae682-85d43f9b119so19262107b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790179116; x=1790783916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=mEKnmBI9t7pXs5QFhRyz1qQJEVK0j3b8MYB3MYoZepuGjJ5ihcbXda3DpKllb6fRFX
         rInlprLWQyH7cGdKbuhDSuGP9KB5gOn+fU8fPgukXjmi1YlglR32qSc/BmB0glZafp0r
         hFINquv6BAcutSsHVQLPyiJfDVWRvxosYe1MCvvBzyW3GkiXr6G490SMSNz668flZpLK
         d8uSr36Km12QsXvkc5RPnEE+bNpInOLwT1X0SAgaO9/CppR6dSwUpY0AXvG6Yd5enNfr
         3bNp0UHdcwvZn91zgCwN+ambuTUyBUw2jsgB0Ij+F790SNFjYSxRQoWHNiX9Dfqe745i
         eZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179116; x=1790783916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=bDkiukBxZzvUPuiQOnBOVvAmCOJNhhgXHDd9a1OaXshgD4UFy4CNS5EYDZA5D8Zm26
         /5UzG3cCQ3vg9OUwRJ0xYf1ZLH8HjjVttmUPQBcoKKpzZaEhi6hbk7yZkgSW9vLJxZuv
         OgpOXE4lcNGr+/eFTVbGlGFeoZTPIvuy0KdXy9vAjdV5nVCR7tXT/CDTzVDamBpl7er+
         W/e6/sR5OfcW7vifMNqZW7KwDI386roN6i2bUd94BwO5I+PLOf2UGMg6ER9sgGlc5oQJ
         QvZdcvTIawGOEHulJpfCTDIrKQiKf6tkRLNZDm6/LogRs5k3t2zhHEyLBNrkZUyyrNVV
         NwZw==
X-Forwarded-Encrypted: i=1; AKwUvBwuvQkD8SZ7slgmdPLStuzoBx7IaCSNQbc9sd4DPR+cT0qr3YrS3sSZxFF4QpLzaUAIxe74fuh+gzgBOFrsBoo0@lists.infradead.org
X-Gm-Message-State: AFuF++kEWPa9bD+9ZyDhwo7R0o+e4FwK1SRMYGHNvbfFtC2x8gBRdSwE
	9yixSxcBV1yzgUXFRWLAck3bEF7ciAfvqXEtDgdE83YCfGdpRqAph+ixCHjZk6PsclM=
X-Gm-Gg: AYBFou0Hi545NQ/GHpyXUQHGmPJpOjFRmyTM2cS5JynItNJOPQhd6DpmJpHu7oSI5Lr
	SiUyCtKYBpml5BWMlhWSD6bHnIHhz+QSluBooklibtiwkSdkCpMF4TuGslVlZzp2GiPj3/4S1xN
	nzFYb9DKJaJL8GlVqawm/Ft0Fv7lLMtMMyfeTe+fdegS8gpiDn/V+pAE1jxvhHoCCXRN9zQIdLz
	w4/5lM8JNoRJjNVNXMGEoUAZ7wJaQhmMOB18/fZYcnSZ7ct0FxGKFmKWoj9KR36dNgXNCvYhVGP
	L6pjJvk8W5nHlQbZu/zXt1c0wUEkU9JucZP5eyhXtcSbOj0VGOQ6id66elS+M+VgAa9OWT8M6Ta
	Dd7wDhfWh/5xdo0M6h8vnnI97xZyN2ZuL8BMiBi7RJq1ApCnTVqokqVkJLBtjlZXbK631FzSQKF
	j4QxPayb61gMqWxXnDOBSf39Lefm81OdX3WIBv6KIc5XmP
X-Received: by 2002:a05:690c:f07:b0:89a:63da:fa90 with SMTP id 00721157ae682-8a45bb7ceb7mr18084857b3.75.1790179116666;
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c72f3sm11900977b3.17.2026.09.23.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9PMg-0000000DwaY-36Ny;
	Wed, 23 Sep 2026 12:58:34 -0300
Date: Wed, 23 Sep 2026 12:58:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260923155834.GK1540250@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
 <20260918165754.GG11599@ziepe.ca>
 <yq5ao6do36jk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6do36jk.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_085837_883925_5EB1F403 
X-CRM114-Status: GOOD (  14.22  )
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

On Wed, Sep 23, 2026 at 10:31:19AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:
> >
> >> TBH, I'm tempted not to support this configuration at all, just fail
> >> gracefully if the realm page size doesn't match the host's. However, if
> >> that's a real world configuration, 
> >
> > realm != host is going to be fairly common.
> >
> > host > realm is probably not that common, I would guess.
> 
> Wouldn't it be more common to run a distro with a 4K page size as the
> guest on a custom hypervisor with a 4K or larger page size?

Maybe someday, but right now I think the 4k hyp is going to be common
and people who really reach for 16/64k are going to need to run !4k
guests too.

Jason

