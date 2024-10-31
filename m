Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68712D767F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD/pY/i638YKtWjS7I89D6wpk5BweHDNRe5Pjk8A2Hc=; b=CWTXfDflX4R75YqfdCIpAJ4X2O
	jbugpcq+EpfNKlhHPRCTd2qr3DzW1oii6W7yGYKXolNTP/aXhHvf+/sRRYwjJnLTJaG8SiSI5bKVx
	SyGN6nsCh4Hes+mutdiGOmuv6MB5cJ9tBAubgcFPEwH0DfoEaIEDUwphJ6voADR0enrNcyI35Ir7K
	tUURCrEpcrMhldTKThVG5p4HKC/uzWUFUPTLSwbZLz4U+ds+x+TroT9uc/zFhNyZN/ijFRb2PaYcj
	kRkrLoIHlc0VOHtA2LvChFbSSYxVPoFS+4t4zuu5we87YXxr0dPwIxKPg6wSIus0kRHkiXDESI5rj
	cJHGuicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6acs-00000004bEv-22nP;
	Thu, 31 Oct 2024 19:14:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6abD-00000004b4R-0OkB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:12:52 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1415487e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 12:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730401969; x=1731006769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rD/pY/i638YKtWjS7I89D6wpk5BweHDNRe5Pjk8A2Hc=;
        b=vnvpISBvdK5i6eSF+vYqdWqu0xmzvX7vdl+ezOjlK0oc6I+wpwox8zGO1VDWJaQn5v
         czNan7rH5alS66is2X4H5ioORAiDXIGltXSVWWt/cZ/ZJIkHRd3nszlc2Vudm4zp7ZmT
         9WME/VdsnR4OEFMq+bsa2A7UutLzcurBNng7/OicwxT9/IheKEIwBGWHmcGP91vrAbgw
         rvYvLlyP+gNHEF2qKfhNuJlnmprhIeuF1xfvRn2Nldi66cPhi0IteAmXoOwG42POpyIv
         Ac8JtdlbIwE/mx1j+OrnRGyqfSEjv5JD9aUNdZik9eCW0T9CZM1goIj74/HW3LF2vZL4
         aRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730401969; x=1731006769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD/pY/i638YKtWjS7I89D6wpk5BweHDNRe5Pjk8A2Hc=;
        b=Q52TKF5LRsXsSgqZsuJNZFmz/M7wvrffC5vEhGJ1cn0c1zvzfupbs0w16UirociYqQ
         0aD9g3B2juG/muL5qpiOgasbNJbsIzrb/4nzpQ4qyhjX0Q5gKDjViTpVe/sQke+oeQvF
         JEZFEqBvU5IP2VI8oxTJpOGHCHdnCvsoUEO3T0UKo3GVVmo74CqCr3dD5+XzCr298nwU
         5g4Ww57TmMLcLZ12o8MiwirPS3JlbSx/TLV2CT52xd+ilR2AAKiNuNOWTeb5TDCXerch
         2PuRqIfnKp98yScxVDP9V84/gcdSDAaHqHCtsuPde2uKuHaFvlR9/g8QncQSqTEZwLhi
         YBWg==
X-Forwarded-Encrypted: i=1; AJvYcCXqEYyufOq3+QKzBjVytxBWBQAr9DtkpuTplnqdfFclTpbvLu7Fa4k5JQ0ftUCTRBLcXMwieafQPnkLcxWW1TZY@lists.infradead.org
X-Gm-Message-State: AOJu0YzMTPWJG/hEHIwqKfIeqc6ed/OioulVw4L7/70B4k9TsZtdbGkW
	AUs7PWecUtM784Z+q0St9sUima2DVWYoSKNMqyrx07qWjGxXf2ZfmG2DoKdo0aM=
X-Google-Smtp-Source: AGHT+IEHlgrOOPldK5P7S57DuVyfV2iyV8RJOHXDbZ5tbr/99nLsMq1Jtiuo0Qol8RifwvNdY1Zhjg==
X-Received: by 2002:a05:6512:3b25:b0:539:e9b4:7ff6 with SMTP id 2adb3069b0e04-53b34a18f2fmr10168609e87.45.1730401968815;
        Thu, 31 Oct 2024 12:12:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc957aasm302503e87.42.2024.10.31.12.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:12:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:12:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Message-ID: <jivvekptfdr5zh6xnzvzgye7oaana6q3dpyge65m4uklfo6ubv@rq5uar3avkdg>
References: <20240730013820.41702-4-mailingradian@gmail.com>
 <ZyFSJjO2fkqCwzWm@radian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyFSJjO2fkqCwzWm@radian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_121251_176097_CE0F4583 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, Oct 29, 2024 at 05:22:46PM -0400, Richard Acayan wrote:
> On Mon, Jul 29, 2024 at 09:38:21PM -0400, Richard Acayan wrote:
> > This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.
> > 
> > Richard Acayan (2):
> >   dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
> >   iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
> > 
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
> >  2 files changed, 2 insertions(+)
> 
> Hi, I'm wondering if this is still being considered.
> 
> The NAK doesn't really make sense here, as there's a warning/BUG at the
> bottom of the qcom SMMU driver that occurs when the compatible isn't
> added:

Please resend it, adding an explicit note about having no generic
-v2 fallback and that being a correct way. I don't think Krzysztof
reacts to old patches.

> 
> 	/*
> 	 * If you hit this WARN_ON() you are missing an entry in the
> 	 * qcom_smmu_impl_of_match[] table, and GPU per-process page-
> 	 * tables will be broken.
> 	 */
> 	WARN(of_device_is_compatible(np, "qcom,adreno-smmu"),
> 	     "Missing qcom_smmu_impl_of_match entry for: %s",
> 	     dev_name(smmu->dev));
> 
> DTS change for context (pending):
> https://lore.kernel.org/linux-arm-msm/20240806214452.16406-10-mailingradian@gmail.com

-- 
With best wishes
Dmitry

