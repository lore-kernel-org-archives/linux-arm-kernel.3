Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A37DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=; b=15qAz6FvD3KrqIKDu7izaez0Lz
	4fO7UAsIyE1v1I2wlS/d+zCscxso8fzsInpm0Sdm7Vw9i/nRfE9mNCH1vIQWIj2GI1qJ6sBiHWwGe
	1T0umexpdVhoixrrNixFRreIEslKusOhOlL2+xnAy5twGe8I0flSRzwk3SAsVHjlC1iDTO3zutrUG
	7fY38ufpj5L+rPbrHlzzb6gZZNTEzv/Cwlzo8OJ6xKQ6ypbv1GKXGOb0EZLPusju3Y6b3R64Fw1vJ
	NkLpHCgkIkzsS/kzERhTKS0D5dOqgGQlyK+AWbriwO85exb4II+KP2K8i5RbLRBEUMCO9Y4v+o5mz
	Ec8JawKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taLVF-00000008mNc-1FDt;
	Tue, 21 Jan 2025 21:09:41 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taLTx-00000008m86-23JZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 21:08:22 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-467a8d2d7f1so51094351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 13:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737493700; x=1738098500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=;
        b=nXBlw4QIOzBsx6LfqMFkkeidprfMKWjr3IVPJ+RCX+1NLqfafKGLAtug+GJk/A8Xr2
         onsIvzww+tQ/k6xj1dWoyfg+V6nQYtRy5El360e41uWa6VnmYKX5w/g0H01K7vgj487y
         9P/+jnfZghxKgwrNWBHsEdTegJP1V83Ed+5pKo8Mb36nxYtSa2MCIPBnXVAvOhr/aefq
         lujByYI67lJekbv1VDTgqqB55QZvygmhcHW7PR6ik8Q5Wi3r328fT7AklNgnM44jmIFX
         3dol3TTdRGJIbnK5q7pnN7brjxQfXrxCBOnyr1K6FfPDBykNfSEzjUmfbXWI8L/TrwAL
         sNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737493700; x=1738098500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uluMxOufkVTyf9lJfEzbWc5BVYqo/uuD+oDGx4hL5jk=;
        b=DE28Wz0wX7Vr10YCDJ0A/IL+XElzngRqIlYCz1Yy1OoKLfiE2+tJ8x+Ljek/Pz9Aq+
         HqBKKbuNQmwFsWOO17WZ5LOvnvfsVsG+0Qgdh5RuIFW6ciYXLhVuRAbCSPn/wnNHqSQF
         HW7MH3yOnQsUAi7+cer/6AahTgsjHKecBoasuQ3KYzWY7/oLmTBh5uLp0JSk3D3w4We0
         iFUmB4XvZIasITCwUT2fIOhFtjAbZGTEX2+VfYxbdJhKWDULLyk0Cg5itCxUSWulne6K
         jEDMbGfyjD2kGJ2RHGgpFJqHGF9ZmfHWJTjHEoO9cM3D5wwDQpdY9XwhISpcKb12OoQp
         AZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw7mNNY65DmNDx/n+fgZmU8PDEMzmzFTzrdOs2RJpIfMJK74AxovDC8QR8YrI5bNW405ogC3iK7G9u+eahYgz8@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZ4qMQMocvYFlO6qF1qTUOmG5hfmCJEKFtaN8fAWHPOLUar7O
	iu3o/hglUu1PV+Ulnrb4NbrvSH5N7YtxU3/uEG0srBGHOuo6dQirzsGHadnTWtA=
X-Gm-Gg: ASbGncs0/e1nH2228Z6hIpJsXkGkXePjiRN7xM1aRvuviJm4UPSmNwLrJ8LG+N+rOFx
	l/mb2c4d5QUQrK+ctTF5OK8V5OvZCNPCdt2iGSKYB24KjFdnKrQJRMPqZilaLW7k6di653eb830
	9wJLq687jXveoNF7bWNL1dfLjyXnuuxZp4L2mK0Z+UOv1wv9OVIPI3DnhV+AuqDdXNzOxuLSust
	sb5lpyNKlKzFCTfz0d8UpgZn7opxbSRaDE/4Mby1UJ9
X-Google-Smtp-Source: AGHT+IG5YP9eNd9K/tULkbOh+15rO6VP7dx9Kko33NgE7yfMs5pyEbUR5KFZXToPZd7tel5NdyHGag==
X-Received: by 2002:a05:622a:20d:b0:467:5910:255f with SMTP id d75a77b69052e-46e12b75c5cmr309673581cf.30.1737493699799;
        Tue, 21 Jan 2025 13:08:19 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1043468esm56871721cf.75.2025.01.21.13.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:08:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1taLTu-00000003kDx-1Y7y;
	Tue, 21 Jan 2025 17:08:18 -0400
Date: Tue, 21 Jan 2025 17:08:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/msm: Temporarily disable stall-on-fault after
 a page fault
Message-ID: <20250121210818.GS674319@ziepe.ca>
References: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
 <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-msm-gpu-fault-fixes-next-v2-3-d636c4027042@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_130821_527674_950AB15E 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, Jan 20, 2025 at 10:46:47AM -0500, Connor Abbott wrote:

> To work around these problem, disable stall-on-fault as soon as we get a
> page fault until a cooldown period after pagefaults stop. This allows
> the GMU some guaranteed time to continue working. We also keep it
> disabled so long as the current devcoredump hasn't been deleted, because
> in that case we likely won't capture another one if there's a fault.

I don't have any particular interest here, but I'm surprised to read
this paragraph, maybe you could explain this some more in the commit
message?

I would think terminating transactions and returning a failure to the
GPU would be fatal to the GPU operating model when the entire point of
stall and fault handling is to make OS paging transparent to the GPU??

What happens on the GPU side when it gets this spurious failure?

Jason

