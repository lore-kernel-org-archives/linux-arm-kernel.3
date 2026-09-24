Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F36C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=; b=DtgRMBlpDQhOQsJkMZc538YrnT
	BNYijmyfDUX1d/14wccbxR/69QErQZQyzFKfsUepMTy5Cfwy/5Nb6yKyMJAJYQKdFlpCiQrmuQVCt
	vsufSLXgvAm4oOjgWobt9n3peg7EVZskjV1VKF+JQ2GtgDHrrtAytxVSqW9ZFCcF8wdViWslICnS6
	+8ERL5kXfx8Q0onDcleAKoKhbv8LBSczGiWs5E7k7qoAq+XjNNrwYPnJZzos3ggyDBgZzevqYtxEe
	tVokQp1tKk0YmV+w7sSpCtOBzza3vGTdt2S4tdfDkDphlAZi01gR7daPk00A/xONnc7f77DPpw0Rj
	xKhfN9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sW0-0000000CMoc-2OVX;
	Thu, 24 Sep 2026 23:06:08 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sVx-0000000CMoH-2bE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:06:07 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-340f56c44b0so102102eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790291165; x=1790895965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=Y9paeck2b3wL/dmruAhDTJnyRS4GWIzfh+18yy6C16alDcqwhlixOAeygaOjmfXrLJ
         /Mg0TXHNvvHdJfjXn4y1M3KmN0JMotku9QLlvvZZpWjCbcm2hsv+6asDh2NTyBlTp8fv
         knWH63apT4rXOjWcGbvX8h9rSySXU8SL15zsnKq+u5bQYxrXfsAiV5KJIkd6ywvXQXLM
         uyI3txwyni0W/bKKQ4N2O1PfceboBQdsOI9L3XOtpIT2oSrQhX0TVvB1i7NO00BNQeeX
         X8Fy6ZF8mcsn5BK4mmUqBKdbrNLfr7xAopQ5jBVX24rdpl5Bx99mdpY1p/4KtnCxh2i+
         K4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790291165; x=1790895965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zQnsR23bVv3+/11lzu9TDysHJ//x+6ClkLoNDM2wVg=;
        b=G5GS2FiOp9qDaLJjs8ZFurUB0Txc0GC6b7bERmaECWHRXXxqG7UWhU+87BIN3uIsy/
         ktOFsbBpVnsnOrcqbO9+EHOe8m66UgR7yclQfh1dXaeNfJTianG2j17+KIwqca7PYJCl
         aZIJSVDwwDoPCGTl13opY9f5aR9qpcgZVUX3Ze2YYvoZZY1v+Iv/pPBPfYgtEB9HsEfn
         H4M9qBUz2lYRa5VUMqaxdyOmZMfjKMXIG0bzI0X7hug4QI5JDSMg4K+vjpgKcION4aAP
         Wy2TTlIZyk+GrEDIB0qq/ZSwjKS3o1nBCDVGhWe625yKxC4gsztxsHWGvdghdESPi19S
         gsmg==
X-Forwarded-Encrypted: i=1; AKwUvBxBI00I3UpITUbAu50a3ZOJnoHkRa4Rce7Fcj8RLB3oRuGGQYtWB3cH0WYy1WwtJuEGDJLbxDuDTACGszX0/Fq3@lists.infradead.org
X-Gm-Message-State: AFuF++m3B9M2DsfRjtwnSa+94+7HkI5N68gIkpgDZdelhU0WE7ilvBrF
	Sp6EGt+Wr7mGLzfsNxKikDtaDyKT5EX7RgDk8QkOEQ6nuurDv5uxioTZ9WRngeD6+uI=
X-Gm-Gg: AYBFou3gzVN3e5rJdKSgiRO6uj61cL7/DMYTDlO/ZjkoZoWvTg3l9qRIxPy0KUb4eno
	84UlyisMwdlFUgmygbQdShRVfpyVL8PSa5E0SEV/qG1HjPgRQJD/QKuJTehXvjnIgXlQGIClk58
	4U8qsantXZrwoLH33qWCRRbYq44KV9KZX/qkfrTi5f074YSTqMAaeqsMAIY5nmfrinq6C8uNIPE
	kNWrT1G75lylc3o/7uycQsXWnh61KEYoQLp3VtUhq2lvbE3h2gLZnZDEipQyL+pMsWB0Kr0KXwK
	y6wNSDLlAxjOL/QcLqEzkj5PDOifYQkObRyPQfQz4ZIVDgUJ3KKVTGZMxALbNYam6T2A03ZLXsu
	5OFJjRogawnOqlgfgd6oU8WD2L3xbkUTwQcegqM+oIYAfiyUj65uMn01XaUy6Cdxh3BLsgt9rxq
	sK19ZdnZvlIdAYNHlG8W4zsmXNi9P5Ivc7HhX0HRxRm5zN
X-Received: by 2002:a05:7301:6406:b0:33e:42d5:1d3 with SMTP id 5a478bee46e88-34000c382e2mr2555669eec.30.1790291164415;
        Thu, 24 Sep 2026 16:06:04 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1480231eec.10.2026.09.24.16.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:06:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sVu-00000000fXu-3DDy;
	Thu, 24 Sep 2026 20:06:02 -0300
Date: Thu, 24 Sep 2026 20:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add support for
 arm,instdata-override DT property
Message-ID: <20260924230602.GE16465@ziepe.ca>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
 <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-2-5804e4f400b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160605_679287_D3FC2426 
X-CRM114-Status: GOOD (  19.81  )
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

On Fri, Sep 11, 2026 at 09:21:06PM +0000, Peter Griffin wrote:
> The Google Tensor G5 SoC (Laguna) has a silicon errata with the SMMU
> integration where the AxPROT[2] signal is always 1, which makes all
> transactions appear as instructions.
> 
> To avoid F_PERMISSION faults (due to the VMSAv8-64 requirement that
> unprivilieged writable buffers are treated as Privileged Execute-Never
> (PXN)), as a software workaround we make use of the INSTCFG override
> feature to force all incoming traffic to data.
> 
> To enable this workaround, the "arm,instdata-override" DT property can be
> provided in the device tree entry for the SMMU, similar to how existing
> errata workarounds are handled by this driver.
> 
> Note this is added for "stage-1" and "stage-2" but we intentionally leave
> out "bypass" as nothing is downstream of the SMMU that makes use of the
> Instruction/Data attribute.
> 
> Signed-off-by: Pranjal Shrivastava <praan@google.com>
> [peter.griffin: ported to upstream, updated commit message, remove
> feature flag]
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2
>  - Fixup incorrect bracket (Sashiko / Nicolin)
>  - Add more verbose description of the issue (Will/Robin)
>  - Add note about why "bypass" is not required (Nicolin)
>  - Remove ARM_SMMU_FEAT_PERMS_OVR flag (Nicolin)
>  - Move check closer to IDR1_ATTR_TYPES_OVR read
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
>  2 files changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

