Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74660CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJdd5gCENWxVBNzk0LITi7rBVPLt55cKg02vaft5zSo=; b=yejQmmFBM07+sjv7utX4U4Djj6
	/ehjYQcbeM8+bHklXsakQ5fwsI2f4gC0tv6NxsagrNh26mufRGfciUM3rRKXMZNJDvoaWWEDZTMtt
	JOPLb1V/61E/c8RSQSlPHb3o1bzrwE6TO1cka7OmFagwitGwAIzkLj8+cuRTP9haPEPVG8MyDPAB5
	iV7xscjP7//tMVyYSOF57u4uKUENWaIVJM38uEZKUGwXOTM4yhPrNbRCJOGIgBpyogbOp8yGhsomF
	wXIaSt5tiQXwxAMjO1R97VM9N5IzGEAsQIK66lWu1/o8fcaqPdvrWfOxchMolnFnDdm5wOPaeIq+t
	4nH6m0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KzZ-0000000AhKm-3OaT;
	Thu, 02 Oct 2025 15:13:13 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KzX-0000000AhKP-10Aq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 15:13:12 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-875d55217a5so120734485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 08:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1759417990; x=1760022790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJdd5gCENWxVBNzk0LITi7rBVPLt55cKg02vaft5zSo=;
        b=YkoNhkVOMbL0D1DZdx1PXqE3RJMWCAe7njQytJv32G22npCPYkw8k9e0Dt02LtwrN2
         k8bab2TAHEoYz0f0MIm8DkmyX0TNVRvt1CCk+ru5O9hN5wch5WJjhHh42tWQBauAD8T6
         jrvZgWfWVmT8wHxkaQNim8HUugvzpAozD8uTTjsUWI763gAwprx3wFJNZIlw6vdKmf6T
         0ffflHQKB2u5SBObsX3ctP4a/8aEBHknUIajhZ/lsxGCjDMnvEEDZb9l6OAAC7JJdDzU
         2NTqe2vHZtt1MjFjWEZPo6jNmlrbJliH/hDH/LOllN3KI/G7RZj/fyprJyM4PZmnHOHQ
         ZmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417990; x=1760022790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJdd5gCENWxVBNzk0LITi7rBVPLt55cKg02vaft5zSo=;
        b=qmIVW0nh7Jocg9sYRFBi7WyFFk9Dtx5i/nP7OGpZC6RyC7o6xL2/ZiNVkTl2vSA1nx
         nglXvpAD47XnSyJ0VjlfjNHJtKUy5TGAcYI1ncoiH4R1qNJ883rcUmYE2TuhgleLZyne
         DMs5LXfsFDSMfFQlAR2AhMy7mL/rfwrK4ezubNdfTdhJlRb6ZOffs5CT4PH4ycrsOHzl
         2lNu8zgVN1doQN/Hngm+uD/X7LT6rKv+RqtfQffJ8DXU+7g79mSKRd+NOzYWVDxi1e5y
         N4BHMygkQyZ2+VaU7RFGsT199QlYKFQVbj0sjns4rgmpSyXEyF4PojS498V0MxeVgTYq
         zxFg==
X-Forwarded-Encrypted: i=1; AJvYcCWi5SogQ/1JX75GPSSC4yYmuXUmDxcUkvXDkRhSriav7EwmE2VaRWWeaohA7fiUeWD4dxGOCEiTg5kjwartalJY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1kkN6Jja9713rzbdTXu0/myFcTfRt01Wdbiv+ZviHNaSQI0Ok
	m1FTFgdwOFFP7/SQQ98IfsWk7Upukw6ffZBPGMvmaI3ThsrMsdlTadxKZx5+f+i9XMs=
X-Gm-Gg: ASbGncv3QHwA8BrtB6s5QLN/2DidtrCDZf1p3dMiRta0bREFoQYc+gGOJsDGIlobF6y
	7IENoDonJqTiF/k3IDwS+qx0U+nKXtzV2tqiHZOWOoNGo39lIWIyVew9PHxFiL2FNpOOYmf9tzj
	cRZNzxjG5KZlHp6TIYMHmqUi4n2OhkBSn9NK1xNOthxDIzyvcFYAKNALTobM44wgZMC0Ac29KMp
	MYWWy97YnuF2yas6N9JJXEE2EuHYgv+b9BcWqgSlB6VZh8onoZWRoUgX5GYE7fgips0mW20DfXu
	Abd9Gw9DQlVSkyyzPx2TDXHQZuPP/TFO0oFKiWm2PsODE3fFkJzQ5UWaqlz/wZebszRBrCynZof
	rkMMzyA1hoIMKOOYwqH4LW9CR7+21EVqJLNmGbuIJFn9OzeBfuu8AI/edv+Mz5kPQ2BjOcSDZNV
	uWZImVHyzx/fIwk69r
X-Google-Smtp-Source: AGHT+IG0oPe5CNlBpr3wJjmSULJ8S5uq9PiyYd4xVRPRgnIUY7cEyRWUA/GTHx85PtOoXdDh+uje/A==
X-Received: by 2002:a05:620a:1a0c:b0:85e:5022:33b7 with SMTP id af79cd13be357-8737780ae60mr1108818085a.72.1759417989421;
        Thu, 02 Oct 2025 08:13:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8777aabeac7sm224623585a.64.2025.10.02.08.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 08:13:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v4KzU-0000000DqDS-0i6h;
	Thu, 02 Oct 2025 12:13:08 -0300
Date: Thu, 2 Oct 2025 12:13:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <20251002151308.GG3195829@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNppE9A3PDiDg_1W@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_081311_283761_D04876A7 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, Sep 29, 2025 at 11:10:11AM +0000, Mostafa Saleh wrote:
> Another possible solution, to keep a device bound to the KVM driver,
> is to probe the SMMUs from the KVM driver, then to create child devices;
> possibly use something as device_set_of_node_from_dev to bind those to
> the main SMMUv3 or find another way to probe the main SMMUv3 without
> changes.

I do prefer something more like this one, I think it is nice that the
kvm specific driver will remain bound and visible so there is some
breadcrumbs about what happened to the system for debugging/etc.

Not sure how to do it, but I think it should be achievable..

Maybe even a simple faux/aux device and just pick up the of_node from
the parent..

Jason

