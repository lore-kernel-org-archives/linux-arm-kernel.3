Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA6D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcUIGeln3xRDoGBvCez/U/OJM3j8EXaZabhV7We/sH8=; b=sImqWtOsFIIQwYaKI/oifNDS5g
	eC200r1p5dOTEnEHrW7/tTMiNCpotA034we9GPKDydqWCA7fer1oiJ2bcC27HDLeBYcIiqbJlb/BN
	FM8+PCnl16I+Bctkq15uxihSgC7PlydMvO4sTlKkwiBBj3TpKZoPvQzTgPRBAsSTnm9lm5roEEq43
	PGCigpGfctLn6mlOzcgWUSDU+cOZxFtmjcazijY7c6f0GGDdqhsW5ycedpesrrHScnX2lgZh7OjoY
	xteQC+/bRrgiNkBDGlL/JPdXUp9QZh4pCHD5uNM+LEcTQokG6GV7YDUlDoNCix3ts5GRj//285Ja+
	ZzVT3gTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1wn-00000000hrA-0j2M;
	Fri, 28 Nov 2025 17:07:53 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1wl-00000000hqf-1A4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:07:52 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b22b1d3e7fso187122885a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764349670; x=1764954470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DcUIGeln3xRDoGBvCez/U/OJM3j8EXaZabhV7We/sH8=;
        b=gSz+P81ueb++Revf1h4ATHcBCEEBT6w3w0C6bfn8FaBk0NAvAeVhMB6INoEaHQoLyT
         G4QPA609dxt+Skh3dq+mUwkvIHbQrQ87uorr0AqHK1Rl+VrOBLiRKWwnztInGn6TJGJn
         6G0daBDlpazD+BBcNr7rR4vi0OooM63uZfnPequDvi60ZBDkLTEKILKZqdnnc76hMpqs
         0aacUcu2XM+z9E99O7JU+fVNXWaRcCxcyrxKWvk5+VDdeCUJKHbRh82yISqYtZf2Qe+O
         mkbbogUzm55NcaX4W78Ik6d97G7PLmFrhQtBKGvWXRSwm6h+9tRCz11uSG6agi1lJD8y
         1Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764349670; x=1764954470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcUIGeln3xRDoGBvCez/U/OJM3j8EXaZabhV7We/sH8=;
        b=l45pYE2aTCc1I9x6Kegci0CK8m89xW/b4P67licvNvgAx29mn7oBuDekzlrLi/9g/U
         dhaWvmcV4mMgjQzxJHuxspUqa+dc1RJgSdRaeLkRPdI7xg0biFZPOtEJurNRwhd6bJy1
         UcFSM1BG6Pm3JDvGeEStslpudkpd6zDRI6Ybdd7AvW4UYjjdzpZTS8B2pmQ4oy5AgiBI
         9NcsJJo9SKV5vL1uOp00mQ+zyB7R3AQwqpsAj9dB2UAIzxqIn34yV41tkSuMgCiZeNen
         WdijgL69PmzbBN7gz4F6NG3vH9hBmzGdVdnPvlkgr+Ta9LWDMJIWQRK8FlGQ9mdnns96
         Am5A==
X-Gm-Message-State: AOJu0YxtmQ/Zc7g3rJdlx5xTIdh7GdqXYTZuJxK1uyD8VJV/eF1drD3V
	Gvsj63TEPxJktYF5ILANQFHQdAUhGhImQGTKl8Zm3PNlfY3mGwam5gad1qOxG4N9ll8=
X-Gm-Gg: ASbGncsOtNiGd3Fmdk0iYafJYzurM5E2vO91HclKnf6FThYYwIVdnKsDapeWi3pyr/y
	v3m2GwmkMMB1//UQvCGOoCJUXHiGWV0Y9ZLlp9FovfVLdMOBNZOwcNAxw338yIlq6f56YTf/4i4
	VEbKNRZkbvwvUsZuK1aDXFwSJ6mhXsdRsuwcZKHvh9devR7SlMIysUwzJ1XJxw3khNhYECuCu+y
	eVixcb2Z02xji+sESuhSL2ofq+3aYqPSlOMQhPFNh3s+GZDybQP1abQLtsRCqA8uREFKICSKq51
	oq03xTRspEbZkJEiiYkt1S5XJmL9v25ZAMivwx40assxbgXWgucwMtrczZyU+TXQAI/4N0s4wLm
	dK/6oFwNmU8rIlpCvAPa3MjXyF9S9aG0Xb4QjosLrzawN/ytx6V35bfmVQ8+lx92Xmj6oxXNLyY
	3pV0k7bGqzTY1YnqUA2tN01vaifGOwd+j7d3n6GIF1p1uN0MMkcLI+TBvZ8IKJRxk6sWQ=
X-Google-Smtp-Source: AGHT+IFbx9IVrRQnr08bZ25S6T/6GTAT6maBFJIZM+QU3ERFbdXAlH12nWX3gx47Z9oyfN+s9pa16A==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr3923929185a.49.1764349669847;
        Fri, 28 Nov 2025 09:07:49 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a5f1dsm338261485a.13.2025.11.28.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:07:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP1wi-00000003Q7z-2Cdq;
	Fri, 28 Nov 2025 13:07:48 -0400
Date: Fri, 28 Nov 2025 13:07:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 17/27] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <20251128170748.GE812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-18-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-18-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_090751_320628_0A408522 
X-CRM114-Status: GOOD (  14.19  )
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

On Mon, Nov 17, 2025 at 06:48:04PM +0000, Mostafa Saleh wrote:

> +/*
> + * Mini-probe and validation for the hypervisor.
> + */
> +static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	u32 reg;
> +
> +	/* IDR0 */
> +	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
> +	smmu->features = smmu_idr0_features(reg);
> +
> +	/*
> +	 * Some MMU600 and MMU700 have errata that prevent them from using nesting,
> +	 * not sure how can we identify those, so it's recommended not to enable this
> +	 * drivers on such systems.
> +	 * And preventing any of those will be too restrictive
> +	 */

This driver is doing nesting though ??

Shouldn't you detect those IPs and not support a S1 at all so there is
no nesting? Identity only?

Jason

