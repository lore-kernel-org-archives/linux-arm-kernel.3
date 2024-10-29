Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EFAD74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXG3uAnR8xUGDWWZqqgTv3bWvp45oe+e7aGU+Lgvdes=; b=kY12oTKXBodlAct2+FSmgoAvoW
	fK0nVj91V9b1OCb1iRNU7tcOd0EFHqB/uoolHdPBBrBLXGGjod/zBr82KXFc4Vi18xj5zw+hssnGq
	JHFlIhSTKYHJeB5ccWwmpzY0V4GJqu5sUo+CHQhu7E/11fEOz2o1Md1yDEiIoQEXkaVE0/Qlcdc6Q
	cGdUyhOfJHbS0IMc5+BRaqCCpNtLxJiWHbZL0YD8tCjTGv7DaUffkPmSEr+XCvcVICAQfsSkvlEed
	Ya3mYgEVhu5MJnHwGCdc4tgvCCgqOgXjdHzGQIJqjkZ1ICHc//qVh4MnA1o252MLGwm2JOamdKfGI
	qhkWrScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5thZ-0000000Fwf5-1pao;
	Tue, 29 Oct 2024 21:24:33 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tfv-0000000FwWW-2RyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 21:22:53 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7b13fe8f4d0so449170985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 14:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730236970; x=1730841770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXG3uAnR8xUGDWWZqqgTv3bWvp45oe+e7aGU+Lgvdes=;
        b=BPEo001YqwMYZn633mJo6z4IAe/+EEAy80WZaWz7u16yK6RaOy3YcXPiPqZuWRtjqk
         TwdSBRGaRvyo7aVDPtsFKNK+qmh3lJOzJXkp0drzs19tdGX626kI4ORxtRYA24A8FrbE
         6al3LkoocGwV4qAg9pfgyCqSwI8DSymxDI16hvnpvivEOnoQkonDUN87RaAxRpVGKu0n
         9NYKJb+BWVScgJ5otYoFqaumv+1xzZHafqS/D31MoW3sAKvFsO1EOIGfDcVG4O2HgEEF
         4SLaNX8k0Zfh9JsjIL+WFmwpaIs6VKVVzu4M4DNz7snfWxaWQNSb9g2ySWEr7wQnsPpk
         +1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730236970; x=1730841770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXG3uAnR8xUGDWWZqqgTv3bWvp45oe+e7aGU+Lgvdes=;
        b=uzsnqIqvauniMKPOxkanfzGxap3yNMPyijuIhLCRk1N5fXrWrpSY8SSBeLPsYIKrxi
         G3WK+2Sl3B9KV7iWLp1m17E3DjkRl8SGVoJidiSgrCGmBzwsNsQUQwnizcvYnyS1LiFI
         hMHXiSDltNK1Ik6mzgrsEls1pAy6i2ZpHzJqJNzEkpnEylpC+6ezrAUs4fvZ2zHtTDQ7
         vjyLWMQDOgQZS25tJf3FVvlKn5xDO2oakdR7LNJFoKmzapYvl/8XZO/JtVMGLHE4Woyg
         Te62LeFyryhqdhZ0BywyhBZScFkJCMDhBXLq1UzUamOPYDb+kZ0tMI4n7mdrZ7IkEeXD
         bzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiPlZLUB35qktTnhJXU1W647ILZqfYq33qQFOlh3GL6dCwQ0NohH9OxA87X2lhDHoJJGtKyqTsvzSa5N47gBDv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9eNzK+vobsnq5G3vsZlj4YtnY8tmYacam0529Y2Gpxoyxj/pF
	csYY7gsRLwJ61YXRD4IOaM4tFDByERRWQ0qbkdMn8F0OYIiepaML
X-Google-Smtp-Source: AGHT+IGvPaY6eHkYtHcRujijpGZOkw5olQHZ+nTec+dmVsgZDErM8pZ7dmQgEqITB0HkJ64Bv404AQ==
X-Received: by 2002:a05:620a:4621:b0:7b1:49cb:5842 with SMTP id af79cd13be357-7b193eeb9d4mr2054633985a.15.1730236969778;
        Tue, 29 Oct 2024 14:22:49 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::98bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d32b9a2sm454857185a.82.2024.10.29.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 14:22:49 -0700 (PDT)
Date: Tue, 29 Oct 2024 17:22:46 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Message-ID: <ZyFSJjO2fkqCwzWm@radian>
References: <20240730013820.41702-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730013820.41702-4-mailingradian@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_142251_648097_5936EDD6 
X-CRM114-Status: GOOD (  13.32  )
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

On Mon, Jul 29, 2024 at 09:38:21PM -0400, Richard Acayan wrote:
> This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.
> 
> Richard Acayan (2):
>   dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
>   iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
>  2 files changed, 2 insertions(+)

Hi, I'm wondering if this is still being considered.

The NAK doesn't really make sense here, as there's a warning/BUG at the
bottom of the qcom SMMU driver that occurs when the compatible isn't
added:

	/*
	 * If you hit this WARN_ON() you are missing an entry in the
	 * qcom_smmu_impl_of_match[] table, and GPU per-process page-
	 * tables will be broken.
	 */
	WARN(of_device_is_compatible(np, "qcom,adreno-smmu"),
	     "Missing qcom_smmu_impl_of_match entry for: %s",
	     dev_name(smmu->dev));

DTS change for context (pending):
https://lore.kernel.org/linux-arm-msm/20240806214452.16406-10-mailingradian@gmail.com

