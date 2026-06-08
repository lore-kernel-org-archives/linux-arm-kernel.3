Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38FCCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4M7oLkbEYpMFnDXvWy4q+ZCA9NW6fdqs7xW4QLchcE=; b=W/RPJqlHkj4843QjwBffJKEFqr
	hI7IGxZYYgq1YWmzNbQFaPfkdyVoOfbS3dq/C+UlTb513hIB4Pa+4a0u4QP06zgzb4ASpxUgfmdwN
	l2q24TgnPsd7hwbvwskks4SOczOg/ew+fYAgpNspAzzlUuW6/0y+tlt6Z+43Wnzs/bbnGWgCPqGlk
	kjdciGMQmSD3KKTQ+TBSBOpzv0dTcxTL1TBVSHc0CjpA22dB4IWZ2kTWguhUqKLtvSzTRbxFhxYQf
	coTJS8I7sOI3UYBUa1dWSHeXVT46OCdWPB0DHhi+fQNc3cECnG+wtPoZdYdtMZrqv1cOGQAImV14M
	p8qwa1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXCR-00000003Ks0-3uSq;
	Mon, 08 Jun 2026 10:27:19 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXCP-00000003Krc-1Yqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:27:18 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1336742714fso28680c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780914436; x=1781519236; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4M7oLkbEYpMFnDXvWy4q+ZCA9NW6fdqs7xW4QLchcE=;
        b=Jk9oCsQSugO7hj9JDNzjmOFHbE4rC1fDm5knB5w1TeNTcxRC6GD+xi/GgQi/kkzlbP
         MDmxBdvcIU8X8vkgrVxkyhLefac+ZFyw0mLUv3EQ9uFxUVXSSq570ttyqeXCNdaTPwmH
         I/3RQ1yaAoQfrHko4mZx5gHoUZ875BU19VnyC26g2lTDClaFj37bZLkCd2uJU11sN2t5
         ksTiafGZ/+rECPdZauel1E3+P3k+iNjdy2/RzS3bTp2oDPE204n3mAMM3zsa2lowQuKh
         X8Zqg+zOIrgv45y+GZde3tCz1WwOcPB+oho5lUyynagjuCZ2ynxrLFxUKhR0SPWzYNEf
         rlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914436; x=1781519236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4M7oLkbEYpMFnDXvWy4q+ZCA9NW6fdqs7xW4QLchcE=;
        b=erhXcn3WSgfXJyEVFrYKGjbxFFHYdPEd8kKQIBjAWpqjodxxwCKkHqg8rGdJXZbiZo
         xSQjpwgpE2FQJkuaYLeTmZIGciqC/hYonukAuCdoxh78vxOqRn3UoPelmA7eh8S+kgg+
         XxDscA+4E4gay69AxFZIvUxwwFEAjSZt4UXOg5WJhOHT8fJhdCI8+tUdph28qHMCoqQe
         OkEMy2Twc4WzSsSCfRz12raJFZKg/vx9gPp2yFBaifCNYDrXBWs3WDFqLg9Sced1hoO8
         wN5taEiPFhz0BVW189IhGw+xFsUsqzr3Gv3eFBb1PGvTC5ERZklDdsX5cu044lPBZ1Pp
         iPyg==
X-Forwarded-Encrypted: i=1; AFNElJ8qj0cpLPZRRM26MX93dE2Hdb1qbRJrKuwUr5y+m6ds8FoGP8d+jscbvKJS8dOcnvV8sCi1Xhnuv7HIXWfSv4d/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8j1bX8xb+aEsiAdlgBJJy/TN3gOskhgNd+QEpuBQ9H0iRu2aK
	eswpHXb2aNUCVV0n03+0y/HUBzon6JmBj3xBYDP+O6S++eHWR02nP2zaANU8JiZhNQ==
X-Gm-Gg: Acq92OFjGeWPddH+ls0kVr0wZemeC4g3fcpJ0Da0Bjyq2gYu8m+K7UtPYSfP03MgzY8
	+/If8mtQfeC16tYCGfC3LHFMr/I0w6xCiGlLSSafq1dVdcJ7ybLJoax05V5sep6zKLRUIr6K6Lu
	R3OsUfeXD7rQigvRcnuQTdZbS4SBey5XBRdf5Cz39PILi/1sbhmhM6Hm8nxJpugtLCUIIw3eepl
	VnPQyokgwDxKSqrO+cApoGLegX4uyg46a4Ig9WO5Q55h6wOsupTuwT8EjzIJ10YHSlhDcAlWGBM
	+ceeBb8TLrlqSUKRdSq1dulmozlPm1lbFvqmZzcvlrYwVsAQvwoIiEYy1AOtiwCzK8gBHaNxYv1
	K0YjJ4cq/tgavSRJj5cVZNKA/QJWsAO/GhN4CY+P80ttiYj8x6IDn+6K/knY/C5cajBV2nyccDI
	SZ8J1xxV/mhhKEGgH7Oy3YSG7g3TXDvr9teQSXzzu9FJGuYFFtUkwqazQYuSMnRF2vbIwNGsI=
X-Received: by 2002:a05:7022:38f:b0:11a:2c18:9e70 with SMTP id a92af1059eb24-13807c516c0mr363192c88.11.1780914434891;
        Mon, 08 Jun 2026 03:27:14 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15284369eec.10.2026.06.08.03.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:27:14 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:27:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <aiaY_EmbRxDxSe8-@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
 <ahi3uY9YZZtR1Lq5@google.com>
 <CAE2F3rDeZe+w7-V6hyJtSOwCj619E5SNtjJjZ1-yu1sVdf=35A@mail.gmail.com>
 <aiEm0yuNtG3PGJ4D@google.com>
 <CAE2F3rDwx9qX3O0GQOJ-CQ1dqREKNp3vf_PkWWP+xmyEHRuOnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDwx9qX3O0GQOJ-CQ1dqREKNp3vf_PkWWP+xmyEHRuOnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_032717_446969_F984E08E 
X-CRM114-Status: GOOD (  25.01  )
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

On Sun, Jun 07, 2026 at 01:17:39PM -0700, Daniel Mentz wrote:
> On Thu, Jun 4, 2026 at 12:18 AM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Wed, Jun 03, 2026 at 03:18:32PM -0700, Daniel Mentz wrote:
> > > On Thu, May 28, 2026 at 2:46 PM Pranjal Shrivastava <praan@google.com> wrote:
> > > >
> > > > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > > > > TLB and CFG invalidations are
> > > > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > > > > > the arm_smmu_can_elide() helper.
> > > > >
[..]
> > > Hi Pranjal,
> > >
> > > Have you observed unmap storms in a real-world use case, or is this a
> > > preemptive optimization? I would not expect a high rate of map/unmap
> > > operations while the SMMU is suspended. If a client device calls
> > > iommu_map/iommu_unmap (directly or indirectly), it suggests the client
> > > device is RPM_ACTIVE, meaning the SMMU should be active as well.
> > >
> > > I am in favor of removing arm_smmu_can_elide().
> >
> > I saw some with DMA_FQ (fq_timer does batched async invalidations) but
> > the early ellision doesn't really help with perf which I agreed to in my
> > reply to Nicolin as well.
> >
> > The early checks were dropped in v8 (except for invs_array and for the
> > WARN_ON in inv_master).
> 
> Hi Pranjal,
> 
> Please correct me if I'm wrong, but in v8, I can see a call to
> arm_smmu_cmdq_can_elide() at the very beginning of
> arm_smmu_domain_inv_range(). Isn't this the path every iommu_unmap
> goes through?

That's correct. In v7 there were 4-5 callsites for these checks, most of
which were dropped. This one (for invs array) was retained in v8 based on
this discussion with Nicolin [1].

Thanks,
Praan

https://lore.kernel.org/all/ahjNYqe8hjPUQIQD@Asurada-Nvidia/

