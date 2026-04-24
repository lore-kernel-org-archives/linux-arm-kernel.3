Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365C3FE51EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwFNTETipk2+0oOmAmumV4DtfgdBkUEEsoK+rKkQKqg=; b=NgNqYcu8SHywdqWB1tcR9XW/4T
	Jh9TNR4PtB6BemoHN3J+uGicdAwBqKE4YMjwlt0o10OYn9YMF21VfwA/kERwCiNjURFfURo8kGc9H
	BipvY2inEUnherhf4XuBumXGUtwUU27LQn+CM9+KWkReHthDYb+Yx3SJLsBCwKeqODwR4PlwwQmEp
	c872UcYLAmmgkn4OcZ92jrIrF8UUXxQpH/7iBA8GeByl4AkYAJjSoTGYlu2wgNfHTI4oVrpU5KRkG
	3HnPSjsGF3NS0uYladoMRMuG0qQesq0yxqhdSWvP0iACw/HOOuF3Xy+uBduvNAHe96Qs84sjfs/1O
	3wS+WfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCMI-0000000CuIe-1zaI;
	Fri, 24 Apr 2026 08:57:58 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCMG-0000000CuID-1l3D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:57:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so14146906a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777021075; x=1777625875; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwFNTETipk2+0oOmAmumV4DtfgdBkUEEsoK+rKkQKqg=;
        b=Nv66/TqwmyermPA/ny7us+JCQ8y6wY0Mjduwhr1LKube4RFLujHeMSN5TiGL4sUCUU
         R0k2zGTPtHR93Z6O1XoD5/S89xd/DIb18ENwQabdkgMp7KSzUA7hWX7bPqYQxcJ4B+8B
         IUXBri6jEWq1EEsWOfLJVAtdRP+XfhLwHhnGmEBNIviq6F0bOxGuSJnHKXEqcWpt4oEg
         dlWaC4p2BU1LgjByxBzs1AvS/AfnC4GAIH8Av0MMTy66WzI1f+WL2CYSUKWIkeNSfrlJ
         XjOC6nEyu+6UOVT6MR95coTSAqWSLi+3wM0ZH9hmAaOxxN5XVkeq/KoPjgOVn7J7J83C
         PBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021075; x=1777625875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwFNTETipk2+0oOmAmumV4DtfgdBkUEEsoK+rKkQKqg=;
        b=TcE+LVJYAjPf+iEcNXBl3Zxsf22VMV5+bp1+2Bi7JkB03gPo1oA2MwY7pK0M05yY0D
         r11BYYnQ8qybeJXzJNrtg2ioruQlB7QGJRKka9pztMkIooAtFsmIMYO8SbUCAvc+YQt3
         Mc4xe6Z4jfQSSHF3uvMcqrwQ2yGmRzQd++V8sQdaTrDtQOeuiiL5RXHOuoA+IiCPwQH+
         Cn2dHuQ08p0q7jBtNQw6kFXYSJjSUboG/m0ZewgORDCG8vifxLfdVo1lLDU2qXgIWeri
         ynqpKf2mieElM3P3GjetqMXBufJBAn3EMJFmfdt8SoYxZR6mql4Q/z7cpgX7naMB1YwY
         pz3w==
X-Forwarded-Encrypted: i=1; AFNElJ+2KnAyWNsV00EQWBpxMfSbcKiDDMHxbrOxVIe4qS9xJnAX+Ng2BVAcQlhmLcM/cCCaW1juoB3J5qDQAfgKX9e3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3qaK69qEQTNIt7kY58u8TsxlROn/4pUvURQzz77nNIIH6wyue
	+l7QZyXNp2Wc7trKgg3qM9VZj+MgZ0V+QmlGrRtOBvJJBW5fD12hLewoEcrN5i86xJA8LU2YAiA
	q8D7SgIBxicsy7uFmnqhAQnuMVA==
X-Received: from pfbfm15.prod.google.com ([2002:a05:6a00:2f8f:b0:82a:6ac2:2386])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:734c:b0:39b:c4cd:d854 with SMTP id adf61e73a8af0-3a08d8a876emr35407723637.30.1777021074747;
 Fri, 24 Apr 2026 01:57:54 -0700 (PDT)
Date: Fri, 24 Apr 2026 08:57:53 +0000
In-Reply-To: <20260424085011.3502295-1-joonwonkang@google.com>
Mime-Version: 1.0
References: <20260424085011.3502295-1-joonwonkang@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260424085753.3505585-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: joonwonkang@google.com
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, iommu@lists.linux.dev, jgg@ziepe.ca, 
	joro@8bytes.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nicolinc@nvidia.com, praan@google.com, 
	robin.murphy@arm.com, smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_015756_464916_8BBA3CE4 
X-CRM114-Status: GOOD (  19.73  )
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

> For SVA, the IOMMU core always allocates PASID from the global PASID
> space. The use of this global PASID space comes from the limitation of
> the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> from IA32_PASID, which is per-task.
> 
> Due to this nature, SVA with ARM SMMU v3 has been found not working in
> our environment when other modules/devices compete for PASID. The
> environment looks as follows:
> 
> - The device is not a PCIe device.
> - The device is to use SVA.
> - The supported SSID/PASID space is very small for the device; only 1 to
>   3 SSIDs are supported.
> - There is a custom way of transmitting the SSID from the kernel to the
>   device.
> 
> With this setup, when other modules have allocated all the PASIDs that
> our device is expected to use from the global PASID space via APIs like
> iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> our device fails due to the lack of available PASIDs.
> 
> Since SSID/PASID is supported per-SID in ARM SMMU v3, this commit
> leverages the fact and lifts the use of the global PASID space if
> possible. What it does includes:
> 
> - Introduce a new IOMMU capability IOMMU_CAP_PER_DEV_PASID_SPACE, which
>   represents whether the IOMMU supports an independent PASID space per-
>   device, not shared across devices. ARM SMMU v3 is the case.
> - Open a new API iommu_attach_device_pasid_any() to allocate any
>   available PASID and attach an IOMMU domain to it.
> - Opt out the use of the global PASID space for SVA if the IOMMU has
>   that capability, and use the new API to allocate a PASID in that case.
> 
> Signed-off-by: Joonwon Kang <joonwonkang@google.com>

Please disregard this RFC as I have sent a new one with more recipients.

Thanks,
Joonwon Kang

