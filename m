Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C35ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddOV/4AeMTKAaTlLO+S2d6s4wCcUbRWR+oBWKnZEc/A=; b=28kUBSV6ozH0XEKDarCwTNCGHR
	wvSp67zDz4a4EL2oMa7Www6/iXIJiND86ZqCbSJ1Wa5pMSlLST0uuhHbO54h2swDZ/i/qnMuuH0rB
	UbiAzikjEs50d6C41IzUiWSKxuaY8Xzm0berIAQQM4AYc4/UpHXhpwLl0qxIxL9gC0hScWlfTQkTB
	phIzFeH4cP8NmTXJnfIb6BnBuoBhwGk24+qTXd8WMsKR/XrGp9Cohc14Yt60/aVrk31+aQfh5gCH+
	fI9u06ofLHFdhMCC4kxDrqxfgatYsGxX0WiRUD1xLhvv46/jBygq1yNOaFiFtrdjAWTljWYyEztYQ
	gghRqnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZuv-00000002ldb-2vvy;
	Fri, 19 Sep 2025 12:08:45 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZus-00000002ldA-27zG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:08:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-621c69d767aso724317eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758283721; x=1758888521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddOV/4AeMTKAaTlLO+S2d6s4wCcUbRWR+oBWKnZEc/A=;
        b=DV/zQrUut2jsvg9/+wZGnGkk7M29BwCuDrBVwyayyiWyEYtmkiZIb85sNKss2VuRF9
         k+CrZOXMrzbK8IFtvKtiyFRIClSpSp0XQmM+iw6dz/qDvzs7t/hmtucsCxxoYTvfoK+e
         adEpE5/PGgmT5RpFOMyRrWGGlmKI652oU2q0bldXa1DpzV47ffQKTvugKpEpgB7Kntlh
         a4ixjK2qDzMw7109kb9z1AC0aIuXh/ED/BxC/W0ar+HbNv05ofddVV79HQQlrcigFvel
         QlIBnrLDmpOxFl5fOL1rml1ewY/Pa2GlSNHRyjQxdthOFH416DLH8geaAMXmsPRtUkdc
         yxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758283721; x=1758888521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddOV/4AeMTKAaTlLO+S2d6s4wCcUbRWR+oBWKnZEc/A=;
        b=er2xkp9JCVLc+e4pm8pZyfXiXxgxwX2C0omxsAjmdpCJ7zq6odu84WCA0I3edxNcB4
         EQ+73qxSNcyqlTRScYJNmwampPzAmsJHzT/mCqTRRydIdJPFGbWVzwM76F4lfGAMFeWK
         JbRd3uHbb/30EQ4Y4V7WqiHr0FSYbo7rnGfZWUCyePURT5//pe+26EXcXXngbnxtU1Xs
         7JbJ5cjn8xqhfXQW/ukc+aupWckMJb2VYY6K3IAxlxez14imkB7AGJVMsswYHbERvuvL
         aype95dC8lHbRpZtwBYUIFAkREGytfZUAqeN0zljfUFmbE0JeWRdXKHKzRP3zMBhQBCr
         tGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRLbiiG2M0bgZco9C02XuVyj7zUkV9H73vkJY5q9JOCnmWQ8sO9V40OyzkiWhGBL8awwX/9NhOjrOwOCYfvF4a@lists.infradead.org
X-Gm-Message-State: AOJu0YyPvCEBBMvj1rnmkOGbSg7mHzjE9OEtsIgc8UkF6fuXIU0w7y4E
	mP3FoaC33/VKCxfJwPrj0Buu/A4Q2Xqvm9y1iFe92cNZlY7LpD7+JE7phnok09xhkjs=
X-Gm-Gg: ASbGncut0HbnxztXUdkdFyTo6++8TddYt4TvMO/p60mDHO1dHiWdRjWEpdvcEt3SGC9
	z4IqnRLA/kdeBki5WqXQ4kzFj6xTzfBgaBTR54cKEkmfFw4+SJIhC6fyEtp1gcT+H/IsVXzeuqR
	R3b4Sn5TMOEDORb76I/d1NldYHJAOtS3Pd1TtxN5Ny3E7X0TrEh+XjkqXtLEcpK2ozS/x7KhvO+
	yMcFBGbCGXX5w5FsuYXB06eXywCHmo0slsC9Xh+/BKUDWdeohrYZB0uE61bitAaB/YNas2qKQK8
	MONkS/4BsdrXpN3i1OutBEW7JBtD07FUI6/6KpPInBDHhnG6Ghaq0UcCGoERDxncXX/MGlPwT5q
	sS6lzh3Y=
X-Google-Smtp-Source: AGHT+IFaCWGfMylYUS564NQsUR0mWVuwnX1ZTO8LwVtBeK6iF/UthAXLSHYAnBZ/pCpVTkoFVFyzFQ==
X-Received: by 2002:a05:6820:2285:b0:621:7820:a28 with SMTP id 006d021491bc7-6272abee5f2mr1140086eaf.8.1758283721447;
        Fri, 19 Sep 2025 05:08:41 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692a973dc1sm2326849a34.30.2025.09.19.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:08:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uzZup-000000097kO-1FuO;
	Fri, 19 Sep 2025 09:08:39 -0300
Date: Fri, 19 Sep 2025 09:08:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, thierry.reding@gmail.com,
	robin.murphy@arm.com, robh@kernel.org, joro@8bytes.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 3/4] arm-smmu: select suitable MSI IOVA
Message-ID: <20250919120839.GV1326709@ziepe.ca>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-4-shyamsaini@linux.microsoft.com>
 <aMw4I0AjKNPY6SOw@willie-the-truck>
 <20250918224322.GR1326709@ziepe.ca>
 <aM0HQ51DelZW_Rt8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM0HQ51DelZW_Rt8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_050842_550108_0793B076 
X-CRM114-Status: GOOD (  16.43  )
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

On Fri, Sep 19, 2025 at 08:33:23AM +0100, Will Deacon wrote:
> pieces and will need to work on the userspace side. It's not like
> MSI_IOVA2 is magically going to work (and I bet it won't be tested).

It could, if someone checks the default memory map a second constant
could be selected that works.

> > Nicolin has some patches on the iommufd side to let userspace select
> > the MSI address instead, but they are not done yet.
> 
> Maybe we should just wait for that? Carrying a temporary hack with ABI
> implications to support broken hardware isn't particularly compelling
> to me.

This patch would still be needed for kernel users.

Arguably the kernel users should just be using the iova allocator from
dma-iommu.c. This whole hard coded constant/sneaky uapi is just a hack
to make vfio work..

So maybe if the single constant doesn't work we could set some
indication that the caller must allocate the MSI iova, the kernel can
use the dma-iommu allocator and VFIO can just refuse to use the device
for now.

Jason

