Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFCFC35FF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW523EAS3Rk6Z2Gf4pN5+J61D3es3lTSy0uI9oNxP9Q=; b=qP14Q9aElAGovgV3jRk7dm1RgW
	gb9gpecHrTFnJgSzCEq3ms6X3/kuGb9regXx9mfFTs6NZLKvAnVgGygq33Nsm9G61uiuNQoJf1atA
	0rdpZuG0qXJqkw1RNbj+7OmW2KYm6gGWJHaiZniExzbfpawAtluDOi0IlUJQca3+WlLGw6+HtiKzs
	Wm/wPt/Z5LcatWJeKhm+GWIAxGT2zh9iz75nxgTJwelmkM2uR9eG+4x7zMYLNcWGFxJOJms4TQmMF
	Il3w3TR+yIrXRMnEhMJlxn7G/9CH7uKtJjdFZo/DhdqVFygcgJhQycXqf6DB7fidGfAXVEy4FUE1O
	1KPuGKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Iq-00000006vlg-3jdZ;
	Tue, 11 Mar 2025 20:34:16 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5pG-00000006s9z-2PQ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:03:43 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso42699675ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 13:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741723421; x=1742328221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW523EAS3Rk6Z2Gf4pN5+J61D3es3lTSy0uI9oNxP9Q=;
        b=VMC+cRe7DYUJM5GGdfKL8rTBOlzdeLixIb8Fa08T1++h3fuHJXM6tMDTaLkZdUVO70
         aGyMUaN9cq1edaUSIK5yCuCu8HwHp3H4oxofTRWB1kbHTUzncNfvpfPHyhJ34+bv8uUH
         4jrZCwwGWJJFH2FTXgKqP2weHwwi2xDpfhq23/Cb5yxOlnbtfr3v5iepYxSMLmrr3sjC
         Znc3QHXzpe9LlvBCl460Sm2P0dYUGxXOwvFi5GItByxmbc7/cUchItL2yJQ7yV+lpmfU
         92WdmpK0rU+zJ3JY+UTwPnhF8MIv9mJyMeN6zAuiBeY1+Cesp5kd0R8iw50froF4MlEs
         TeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723421; x=1742328221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW523EAS3Rk6Z2Gf4pN5+J61D3es3lTSy0uI9oNxP9Q=;
        b=Q/C7CoXLu3y6IBJKE0VoAZH5IWRG/ntAnUTzNESFvIyu3FN3ZyEWV4XFVGyw/I3kGR
         fjc020BxQ+oHMSQg08Pzv/Psimg3yNNFS9tRCqiSgLKMX3H8TlXv9hDu8IDgMqFS6F9s
         bhq2QMkg1UtdXllTYteDRAIv4IdaJIhpXUdVa8j2uIbYm/J8s+1Amp1xhqhNSZNfGc1Y
         feH4pYhSAVPW4pxx4bugNLQ7HBxhj/QQ6n/VN305iCY7V9ZxYYvjeR2sA1ttcolHrdDq
         rHdFPTT8BoYQtocwIX4697l+5Aoh4UXMLtP811Sir5LPUnlTiHANpWskAcIrIPXLaXrB
         3IKg==
X-Forwarded-Encrypted: i=1; AJvYcCVQSQD0fwr8KixIOVXgySGa5Iew8L/kZdqsgqJ0GlCe21vaj27EiJf4ASgSXgE32YbxS3Mvei6xXL2y+3xyVzPb@lists.infradead.org
X-Gm-Message-State: AOJu0YyhzNrf88qUTytjSSwgDoS4MOLyBswaCch7VISNoFub9YOUAbg6
	88Lt0RPKedVAKFJCqr6/Pf1JnigHHEvXkVz8l1ixrNciqr7lGV050eRTF+XeYGKXxVwrGFEaclb
	Od9uYHlgpLYw/x5a+RQJD/6g9J2A=
X-Gm-Gg: ASbGnct2iZOHQUkQwVYZ1c6+Rzb9UWvlgrCnuxLTrnVzGqugCyHpHg+7YFMMWsOjVHi
	T9kCxr70Mi6llFG98wUrBRcyLgnXHNjlmJjs3kWDGirdc0jPhYcqt27lBUUOqK5dmmyLNnUDYlf
	IpnKEnUecQ5K7kv3huj4bnXetQfaWa12H+w+Mq3LiOxPLXM/1h9SUVTxeK
X-Google-Smtp-Source: AGHT+IFYEIdqAXj57O99Zh2iip2gE6hYr3XolthP5tdHAJes3eWs+x8BQxcINUUI2peKOTGt7uFekvG8SKVQk3DUgs8=
X-Received: by 2002:a05:6e02:174a:b0:3d3:e296:1c1c with SMTP id
 e9e14a558f8ab-3d468921f95mr51075145ab.9.1741723421512; Tue, 11 Mar 2025
 13:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org> <20250311175528.GA5216@willie-the-truck>
In-Reply-To: <20250311175528.GA5216@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Mar 2025 13:03:29 -0700
X-Gm-Features: AQ5f1JrHvI_RF7xvW5BrP_PBmrcW3VTWeSbeCSaeqxqwJS9gRSEMDCWlVX4sKfA
Message-ID: <CAF6AEGvDyPtXN7Cn98BKsTM9GjUzy1sTEOsLiz-cdvaZ14qWyA@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, Bibek Kumar Patro <quic_bibekkum@quicinc.com>, 
	catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_130342_611672_B060E7DA 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Mar 11, 2025 at 10:55=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> > On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > > This patch series consist of six parts and covers the following:
> > >
> > > 1. Provide option to re-enable context caching to retain prefetcher
> > >    settings during reset and runtime suspend.
> > >
> > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > >    pointer to qcom_smmu_match_data avoiding replication of multiple
> > >    members from same.
> > >
> > > [...]
> >
> > Applied to iommu (arm/smmu/updates), thanks!
> >
> > [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
> >       https://git.kernel.org/iommu/c/ef4144b1b47d
> > [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single po=
inter
> >       https://git.kernel.org/iommu/c/445d7a8ed90e
> > [3/5] iommu/arm-smmu: Add support for PRR bit setup
> >       https://git.kernel.org/iommu/c/7f2ef1bfc758
> > [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
> >       https://git.kernel.org/iommu/c/9fe18d825a58
> > [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
> >       https://git.kernel.org/iommu/c/3e35c3e725de
>
> Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
> linux-next yet. Is there something under review, or should I revert this
> for now?

It is WIP, part of a larger patchset adding sparse binding support in
drm/msm.  Please do not revert.

BR,
-R

