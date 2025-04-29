Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=; b=TR5tmXp6hab4RKJ7RXRS6gujgi
	z3SaNkm4vATSDtpiMEUBlCiQo+jUl5zjkpY3aCoT3qPNcgk9GE1+wohIPuV17WmBjOOneAZT3SqEP
	n7VPqL/owVmCyo4y3C99Yoe9ZljMfQclst37yQ2EZf7j4bzHaWdWs/S64Ic9r97kjBPK18k+O4ScX
	+98TrIt1YSX5KmP24ijMM+DGxBWFNOyhK7tvZCxaYSjDxJsCoJ8aIVqCd7uHyr/j8jeG5tt11D04y
	NuE0unE+XmkiMBwHElolZ4ny72jZLh157aA1FIqy3hukPMR7tBj/xSac5RMN1wrn2aRF2W7ue3yjo
	VpwiTGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qRF-0000000AdwM-1Sob;
	Tue, 29 Apr 2025 19:16:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pIj-0000000ATnn-3Yyi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:03:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2263428c8baso47785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949805; x=1746554605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=ICxchRAPalyYX+J0dd4Val3iRLTTnlBsvBMM/EtE2/sEuhDE8bRiOgeNg8yhLrtt6X
         vLVzJ+W0BgxNrflP+1x8EJraWNK/4wP6fxfW2H07Q73NEsl7CkUu5Irpv2o4feMBHz7w
         mmBkwfOoEtqgsD5uET7DMY2+zSF0oTlLcMKBtpaBSYF6zXs4j0nsxUe2X8aZrxXgI/ml
         Q+yWhV+9YFHr/DKcyQ32yGZo9/pmj7sa9lOde9dLKaiuWoE6CAfAanHtQIm5tQis9Qjo
         sZChtqy5GSRUdrkLRUCcZ7XIicXhdivRHg4aTFJHlhsyFSOcJ5PZtFWbWRb6+qqUkSHT
         X0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949805; x=1746554605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=CiKePtlSurvSNboaRrOjDFkAmPkImsBeynPqhyEvCzB5Bptx14p+ZnGituNqNI25tn
         6WGCJIn9p5RYUuhbQD0NuXDRIPYgnyfqKchOAbBqhHFQHXYmn7IRSxSa04soJWHt3acu
         PoTYqbn8Hs6j0h6sh0WJeWN+5vMtai6sAOCBmjjdBp0IOyt3sK6VEU6BieJRpzcMcYVP
         fMopbQnwu1JkmvCkz2+r7b+93HK36EIYv/0z9kAwfabAaBK0Mv5GDqFmgMtRbbAxF1R0
         63drRrC9RpSerMJpr1iM4VEsu0AcRc4dvKqbxmPFtdJxDruUU1ucYVQ5HWNarZWIoSQz
         vE0w==
X-Forwarded-Encrypted: i=1; AJvYcCU5r1n36AuKcsW9EOc7ZQTh0aujR/+04VE2/OVkXA4KaEvIsn1p3nEPCViV/2sI3+DDAsCeDJCPDfTvXg2Gd/Uq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp0Evw3/iuFHQEQB5qcHl87RqNeiObYGCDqzK/HD6hMhpAFou3
	hRjsuCNtSv6DKviWMhH8lIqajzQZ9tlSlLId7MorEVwJ0PCw9PmWVcR8tdldog==
X-Gm-Gg: ASbGnctmkX1lGw2W8rnLyScQXeMvWkxkjSYGoNuDr8jXCfFOSmVUtsOPPVSJ+Myi54Q
	tLyty79ScyzuYZRra0MJPmxBbM0F97kKhtckFyllvriyQrX/4Eb483ZWy0qmWGq9soawnpfd1qC
	gDCYbv3oylPZY394as9EA0RYeljM3BvZKVKZnQ91eDrRdEkFEldreyD2VdzE4TNpVJ9VJO2YAUy
	6mnKmB46lfj7L8t2sA1uF2eEjdg2wry4gkJlaVn0jSEShTd4PHDlp3CrylqDFP//LuLWOLeVvsc
	+uJF/0KcexOY2UMulJREy2AAL1OuaakhWIKbV7r3GxzS+SXOFQdiyb/2wJo1ndd9DdhzTx3X
X-Google-Smtp-Source: AGHT+IHcbHv78LbKHTcjYARgVuVMIU3PlvzwcFa5Mynrm4iDVnN6pnPgBf3EmKTpPOmaL66ic8Z84Q==
X-Received: by 2002:a17:902:f60a:b0:215:9ab0:402 with SMTP id d9443c01a7336-22df40757bemr145535ad.18.1745949804669;
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded711sm9272213a12.66.2025.04.29.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:03:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aBEUYdlCLcH70UlT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <aA_hm_AD4Xzm3qJZ@google.com>
 <aA/9TZq99TF+MRYv@Asurada-Nvidia>
 <aBAQdq0jeoCdKdsC@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAQdq0jeoCdKdsC@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_110325_887195_6330B1E3 
X-CRM114-Status: GOOD (  20.56  )
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

On Mon, Apr 28, 2025 at 04:34:14PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 03:12:33PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 08:14:19PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:03PM -0700, Nicolin Chen wrote:
> > > > +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> > > > +		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> > > > +		unsigned long last_index = iopt_area_iova_to_index(area, last);
> > > > +		unsigned long index =
> > > > +			iopt_area_iova_to_index(area, iter.cur_iova);
> > > > +
> > > > +		if (area->prevent_access ||
> > > 
> > > Nit:
> > > Shouldn't we return -EBUSY or something if (area->prevent_access == 1) ?
> > > IIUC, this just means that an unmap attempt is in progress, hence avoid
> > > accessing the area.
> > 
> > Maybe. But this is what it was. So we need a different patch to
> > change that.
> 
> Rereading the code. The prevent_access is set by an unmap(), which
> means there shouldn't be any pin() and rw() as the caller should
> finish unmap() first.
> 
> In the newer use case of vCMDQ, it's similar. If VMM is unmapping
> the stage-2 mapping, it shouldn't try to allocate a vCMDQ.
> 
> -EBUSY makes some sense, but -EINVAL could still stand.
> 
> So, I am leaving it as is, since this patch is just about moving
> the functions for sharing.

Ack. I don't have a strong preference too. This should be fine, we can
re-visit this if needed in the future.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Nicolin

Thanks!

