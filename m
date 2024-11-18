Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F355D4921D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpSDLLCiFqZ+5i7REgdBLPfhOaMYuIy1hAA6x67KYek=; b=Ri67u+/jI1FKcA7TK4lBmBGfFv
	b4QAsZFpmcgVHxyBGoQJ+rUpkd3oNwY+4RaXbl/aJ+43vDd3pf26gW5aNYqkC7bzz6A0Pl+psIzsX
	wPgjCpjBSk/x434L7oBKMLlwdktv057TTdC20hgGiI1abJwgBqAtpYGDzT4bM/qZDHO8VvmXxZAn4
	RZFV6L8GGfKnF4a+tPAP0tNDEptd7xettY9kvkC/8tEF7HFLXASSjQc3ihX68PdVwygliAh/Lo2UX
	L9WP5mNn7heDSYQFFMfJ+xyPaYWqMFlZRM2PUzAMUZ4UAJsXddOYsQG2j+ujMKgJaf2fYcxsXWHJE
	5MNfNgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2vD-00000009mjm-0MxT;
	Mon, 18 Nov 2024 14:40:11 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2uG-00000009mYW-2dSd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 14:39:13 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ee7ea48ad8so13345717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731940751; x=1732545551; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JpSDLLCiFqZ+5i7REgdBLPfhOaMYuIy1hAA6x67KYek=;
        b=dKR8sk7GIMJnshtlzNWKPodsDC7morTlv3G9LS9o8ALg+YhVMwGrTy5f4V8U43Dtp1
         fSNQI/YVUHP+jZWJE3nGqDsDT8llhpSJwcACUQdrJjqLAtZNJ+TYyvj5n8s5/F/t6wzP
         QNB8pxm3wQWCqIXQJGUetxNmYeDywkbvIcffOKXp72eWPyij+TtpRMPdQTsXRkfD0nrC
         4ydNVHSHV/NCJWaVDsCJ3YfjEd5qT2Orbd4rRBZN9SMb4mnc1+GJTKDhPKuokByK9KDv
         eP0BuoQhMruLSFbK2bUKcywtssraRe6nKtbROaBHqYK0EB4D9uiQsxFemNGtVHKN7WVh
         cCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731940751; x=1732545551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpSDLLCiFqZ+5i7REgdBLPfhOaMYuIy1hAA6x67KYek=;
        b=E0h8013Kngzig9R4Dfk1JxjcwZN/2mn0SjxQDlPFQXJWK+FfMveR2tqFUtvZiHnoom
         qdvjqCmnEfFzZN3Sq03bYKsDwP3r6HQXE2BqrUk7VINgQhx4vtXrcPtXL1eJOSvPvA9B
         3RKJlt/QoP24CmviOOk0HtcWjIWs747m6/E6oSIFGVVky1rwBZwzOU3JycQF3RydSxSA
         YYZtk6hzVe3cmy0L9T8zFPyXplX5NXo4d+iNZutZLPVQ8FYVGYQgDHlijUEfJ4ztpfe1
         77fP4Mblvn4krvzXzaDQG5QATvmJ08xEEj/99patok5QHkBGW8wih9ThHAXvm2JhGulu
         L8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFjIDkL7v6JuN2kbNw2T7Gmqw1KDmrd9/mqkjUoq3GADQjZpMr+Jggylr6V3vJARehgaQ6cj3SS86dmWjKpGoE@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9jUViKCJX0UeVy2jDqsXAX5OeIXILB823g3diDjDK7CTExul
	uMq+K3QY11QY3clMnFIzN/kJQnC/rywY4JbFb8pPOrt1x/e40+rhXZ7SzG1uVWmyLr76VE71fzC
	WuirXXfsaPi0rgbceZuMzY7rjhhHZJyhEc3ZMVA==
X-Google-Smtp-Source: AGHT+IHcxZP0Ath2/RjkGLMJxqqaiGHP0b+6h9Soy7AfLhFb6uhahD7NhGEvfbdoMkjB6y+o/cSPi6JDoO2JA9z4VLo=
X-Received: by 2002:a05:690c:6806:b0:6dc:7877:1ea3 with SMTP id
 00721157ae682-6ee55a6c9ebmr125661007b3.17.1731940751262; Mon, 18 Nov 2024
 06:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <mcyes5nikfr6ptzorlttrzvtjgh5zugmbo5ao3pkh4q2r5h6j4@vonmpvsqykv4>
 <95843301-2061-49bd-80aa-c443e3694438@quicinc.com> <348605e8-a583-49c2-8921-dafed033f53d@quicinc.com>
In-Reply-To: <348605e8-a583-49c2-8921-dafed033f53d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 16:39:00 +0200
Message-ID: <CAA8EJpoGpA4AoUvnf_Nby5e0u1hGjMgyDuv4TVkejZyidBp=Jw@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_063912_673426_AB3F8AE1 
X-CRM114-Status: GOOD (  21.32  )
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

On Mon, 18 Nov 2024 at 14:12, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2024 10:43 PM, Bibek Kumar Patro wrote:
> >
> >
> > On 11/15/2024 4:26 AM, Dmitry Baryshkov wrote:
> >> On Thu, Nov 14, 2024 at 09:37:16PM +0530, Bibek Kumar Patro wrote:
> >>> This patch series consist of six parts and covers the following:
> >>>
> >>> 1. Provide option to re-enable context caching to retain prefetcher
> >>>     settings during reset and runtime suspend.
> >>>
> >>> 2. Remove cfg inside qcom_smmu structure and replace it with single
> >>>     pointer to qcom_smmu_match_data avoiding replication of multiple
> >>>     members from same.
> >>>
> >>> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> >>>
> >>> 4. Introduce intital set of driver changes to implement ACTLR register
> >>>     for custom prefetcher settings in Qualcomm SoCs.
> >>>
> >>> 5. Add ACTLR data and support for qcom_smmu_500.
> >>>
> >>> Resend of v17:
> >>>   Addition of minor fix of the build warning reported by kernel test
> >>> robot [1] by powerpc_random config [2].
> >>>   [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
> >>>   [2]:https://download.01.org/0day-ci/
> >>> archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config
> >>
> >> Nit: then it's not a resend, but a new iteration. RESEND literally means
> >> resending the same patchset.
> >
> > I see. Since it is a simple "int i" and so did not feel worth a new
> > iteration.
> >
> > Thanks & regards,
> > Bibek
> >
>
> Let me know if you still feel this should be a new patch, I will send
> the new iteration then in that case or I'll wait till further reviews on
> this series.

I think it should be fine like it is now. Thus I marked the comment as
"nit", "not important thing"

-- 
With best wishes
Dmitry

