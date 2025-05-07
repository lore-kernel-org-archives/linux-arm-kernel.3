Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F9C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=; b=mdLsFqZEeMGoim6dFbNLR+Il9f
	j0ymEhsV3pjLHNLMU+jbJGhNfIQnydg69rV8NIBbAhOkjiFMw7IyiHBAX3jKWVwkrOd1PJfDkH672
	TrciecpuVfPzlronROw3Z0rT51ORTZ/hK05xR3V62lNeFTfqfm9sD6qkTKi0I5/e5WxtCX3E7gA/J
	rjTdLkY2L0+2XV0yZVoVHRQIDgtDpHYu4fEXhzxxlhfD7tNG75m7I65DmrbE+6LFgcUKJ5y713ms7
	deWE4gMU6NcDV7ismi5pK5e7WC2O5qYMoVF47C9N1M5BeD5SoDx4MYsFgLMqna6+TRSNi5lrQfY/5
	mD9aUe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgdn-0000000FxY4-2N4T;
	Wed, 07 May 2025 15:24:59 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfwv-0000000FpN8-2v0M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:40:43 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c54f67db99so113386985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746628840; x=1747233640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=a3kfOsH5jpfbvWGop3rFnVnXRKmjlLGl6Qe1jnbNbs1jKOQJynIF6mDRWMWsSTDhb1
         1TBTc/SPP6E3u6eEv/2Z3MgsoR2gXY41mt0qbXJmIiGb/IhRYrUSx0/8dwiav5iUCnh9
         69sFIV4V1GBlZFsDjpWopYu140uhlbm3yhmGEXeUdQjwvk5SmLhUg6MmRL3HK2RYZtCo
         2Q4iFb5EvNcsDtaETnx8Kn6e+E/BV1KeTvEwWJqYx3qPwJ9eTx3bbcFjdsFvX4UI+8Se
         JDJNPPLGvYNCM9285g43tN1Hb4hbskgIOIrWI77BOL3jODR4at9ez+ha2eCamypKXBSx
         J2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628840; x=1747233640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=DKYsFzKbRc27Tj2ejRdJIS8GIyDQnNYNccNP0/ML/zzi8w6PhXjpNWT39tFtORORR7
         KwSstsY8tnVjr3Ui8pyMau43MEs+/2S4Ht+BhvRd5E9fhA8GPG6XFFxLcIvpTqU9QKwM
         ckck9b/knodMxWp+Xi/k4bJdwRj6vG9Oahwr6i+TezdCJx1zsbhnEX5AX2of9wySb2AF
         fYBjskV84K/XUOQF/+4HriJzwmR/wncJ20ZRoQXP5QgLnbW23eDA4lR2lV7Ictq54abU
         PCKStvjTCQXwfBhg1xRTvKxl8O1gR316IGtt+4Zu+G796VCdgGUJd3XvGlxGLY+ISqFW
         FNxA==
X-Forwarded-Encrypted: i=1; AJvYcCVblz2ZjPpjXJ/MZaFoRfIAtDLgDW/fwdAzVVx8eWxATfHOxIadOj6aJMyhJbYhrJm5GAAuDeYboVDgPB6rO0xe@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPciZIwWpeWaFsdkPL6dQKPPu3lgBpEsT0/CyOgbyBfWsGNdt
	HDvtTnDuDzFADnl2CtqZxFscwEs00JteG5Yh9MSTV+nHRfaBNpi2zGP9kL7SjeI=
X-Gm-Gg: ASbGncveV8C88jrJbNI4BkPpJ5PaV1M+Y8EG6KXPRMXZNCloE46qpiPAYefOHrfz4rD
	XBVV2Z5JQxiPn/siRdw2pLGs5k3pHYNywHHgXDdLvFF6TDFUjIlY3tYPuGP1GctikiBRvtEJnFI
	w1H7O9xOnK40cvQpq8IoOqweJo6wiB6C6NEnVBBNRVKKgslAVLihilnc/opbg0dqphQYpcQJoIv
	zl1wnprhl/wOSp44Uspj28UUKCjfNmV4zLCWHJZDJXjf3rH60siytKcXfCOX0fTTlbXbFqm5XGI
	7CO0K/4BqyXwiVNPVoV98d3JXiWpiNC2LKy83MZwQxv3wLhvdoGvzy+P+a3x8OgwBlzIirOyk0N
	mBaoqq0s18V1NTEt3jS6SgJq8GRsXYw==
X-Google-Smtp-Source: AGHT+IFBJ2lDgmMwPn9NZnZ8/xbfRhIS1u/h+c1wZoIdheyW8lXaMbj8dqq9Df2szLQOMYCQifNTEg==
X-Received: by 2002:a05:620a:370d:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7caf6d53f0cmr559703785a.23.1746628839912;
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf752a60fsm159257985a.42.2025.05.07.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCfws-000000011tV-36y7;
	Wed, 07 May 2025 11:40:38 -0300
Date: Wed, 7 May 2025 11:40:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507144038.GC33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507142953.269300-1-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_074041_890041_771DC10A 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping sequence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Sending v2 stand-alone, since I'm not quite ready to send a new
> iteration of the full VM_BIND series.  And with selftest_running
> removed, I think this patch stands on it's own.  (And maybe there
> is still time to sneak this in for v6.16, removing an iommu dep
> for the VM_BIND series in v6.17?)

You should just remove the warn on completely, no other driver does this.

Jason

