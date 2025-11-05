Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AFECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eEl5tuPcKQIbbiQU4HmtriawKnG+Y/aITWPg2eK/vk=; b=q1RTfRmfiakN5hblZGPxn7T67S
	QImrvqtjYqwDaftCVPb9yedjh6CM4nstmoRp/HtvJbRmqn41eLrZ+rGR6A3WJDazviMXl4+Sj8Td3
	0Ab/EQmTTcO7yQre/rKem8M+2zv45AM5U9jpqa5Wg59oGHw5zPHzuN8u1whJK1XKkSJM1OtnWkapF
	I4HvxHW63jZKPmYaoKiVKTOMBFMHg8+0hyiLk18AEUi6xD/iQoblkT4DGbYKxc6bfLokxzLYosT9c
	D/7Z0ZkXA0fvvexMPfjPkisrSBM9jMjWlnFXOyD3VRKAoeZUQacPWyAb2PSFw/lHRkopbNmGdUh4r
	1AB3HjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYn-0000000E5Hv-2BPx;
	Wed, 05 Nov 2025 16:40:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgYk-0000000E5H9-0xTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:40:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47754e0a13bso33745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762360831; x=1762965631; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eEl5tuPcKQIbbiQU4HmtriawKnG+Y/aITWPg2eK/vk=;
        b=XSeT7RTPrCxqQTmPR932sRxaPKPUhI9xrRnBheQYt0E1JNI/+C9yMMJYeGSbO3MV7R
         qLhAB2yY8K/wIgmSuGJz8j2t6uffP4rYe3yTp0b1GnVaThmwk7RB8FokXyYHN8ckTdqM
         /EYFLLbSmDH/0ar0pqz/g8eF6zEiSVwFE7vZp9iFxVoYaJBhO+7BUYWI8UZBTRYhEvCG
         O2IXTY6t2p0M28SpO3iAKQpPTWIvgsGCkZpkMRByghPMREPAL9ChGRu8YWbQWn9U0KLo
         u8S3jCUugLF/BZL7iv/O7wXwd6ZEYrXKIf6ek3w/g8hSyPXvMu7yOVkANfUCOjub21Ly
         oaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360831; x=1762965631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eEl5tuPcKQIbbiQU4HmtriawKnG+Y/aITWPg2eK/vk=;
        b=Qr1jiX5rT9zRUqsxdtUOFY4c4e4DDZ8sX7MzeCP8V0+bEiv+C1xiv/sG5dClC+qI+f
         Y4BAfrPwdUbchnF5tSCR11tTG7TOrX9Fd1ibXh2or3nVmRBjYo0IjI2L5DTgX+1cZlF/
         zttGR55iendFxpz2Bok2XUmQjGmzzeU21pSQfTTgMsgTBsRBO547Ab/VqhTV74tXZlki
         WeX34s6wK0IvO64LNTmWgmDs0qiovrjztq5FkIXwa4IXBVr171f/y3es+YdONHs88El3
         zMVfJq+d3FXoU+VFeEBvR3Yrv0+4tLdu5jjjrokHziMxCrIVjqV55PQE3Wu0j111qwcS
         k9uA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8ZczXgTA2TPnYbqr15eBOzonbeAHALIEer4Rfl+IoaewPc7ejhoYWFkX0C5+71sJkO98qerRvPaViw8d1PV6@lists.infradead.org
X-Gm-Message-State: AOJu0YxaknbDIdbocVuPCEUuxTPMW/3ouoDqz9kg/bhFzkkPu3peCMle
	25UidGWuJ2bhYk2tXLMuAN75/j2QfibQt5B12YSrmjEZ0ZSvQrmhomvgsXuQ7uStjw==
X-Gm-Gg: ASbGncvR2qfCqCeNPDt1xmVkqvR+DLZhB3LOLBDKc3eDR7y3E1pCZwLGsUfovOpU03H
	yhne0byr7SYQ0tMrxnoD4+ckyjLhUSb/hx2ZoLgqbmEtyOeBuobBclKfPq0bLxtqQqgDOquvmah
	DP8kxFPQ3k6bYZkZoyZlA9M12bgKKP1AKDabbcH5qVguMIVRrsYgwgjhGEF7xU56Z7CkduNtsDb
	rnWO2iif+8ZQNab1dAjnbTxkSX8TuWdWLnOpMOwMs/KPDgGki697AlXx6i6ZfZP/fY855AvtZii
	adiHygcJG5n5eZWInPYTzyjryBLe4kM0JukatxeO9u5BreArBFuzZUAv8/QWA75FNOZ0twYIADn
	SGG4um7jHathaALnQrH9nmk1OZx4prZUS+r8a8j2Nmt/3tCYbkyorcrrJuRpJvl1XI2LQr6xVhp
	hZQxnhlU+G6OGoTYbgqIsEAO6u0Vqsgf1TfWTvlRPTIj/MpkYVEFgvvfjk/sOk
X-Google-Smtp-Source: AGHT+IEy+8V+O2C0Flc9TdN/DCHlTtarKl1lxRtJWgoMhvht/+272KjjM3JvTIZWVNcKN9O18oV/xA==
X-Received: by 2002:a05:600c:3ba3:b0:477:1afe:b962 with SMTP id 5b1f17b1804b1-4775dae9364mr3187645e9.1.1762360831358;
        Wed, 05 Nov 2025 08:40:31 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc200878sm11360022f8f.45.2025.11.05.08.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:40:30 -0800 (PST)
Date: Wed, 5 Nov 2025 16:40:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <aQt9-kTCe8TpuyVq@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002151308.GG3195829@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084034_299413_6B5FA862 
X-CRM114-Status: GOOD (  28.90  )
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

On Thu, Oct 02, 2025 at 12:13:08PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 11:10:11AM +0000, Mostafa Saleh wrote:
> > Another possible solution, to keep a device bound to the KVM driver,
> > is to probe the SMMUs from the KVM driver, then to create child devices;
> > possibly use something as device_set_of_node_from_dev to bind those to
> > the main SMMUv3 or find another way to probe the main SMMUv3 without
> > changes.
> 
> I do prefer something more like this one, I think it is nice that the
> kvm specific driver will remain bound and visible so there is some
> breadcrumbs about what happened to the system for debugging/etc.
> 
> Not sure how to do it, but I think it should be achievable..
> 
> Maybe even a simple faux/aux device and just pick up the of_node from
> the parent..

I spent some time looking into this

With the approach of creating new devices as:

	pdev = platform_device_alloc(dev_name(dev), PLATFORM_DEVID_AUTO);
	pdev->dev.parent = dev;
	device_set_node(&pdev->dev, dev->fwnode);
	platform_device_add_resources(pdev, cur_pdev->resource,
				      cur_pdev->num_resources);
	platform_device_add(pdev);

That is done from an init call after KVM init, where the KVM driver
probes the SMMUs, which then does
	bus_rescan_devices(&platform_bus_type);

In the KVM driver probe, it had:
	if (pdev->dev.parent->driver == &smmuv3_nesting_driver.driver)
		return -ENODEV;

Which causes the main SMMU driver to probe the new devices.

However, that didn’t work because, as from Linux perspective the
nested driver was bound to all the SMMUs which means that any
device that is connected to an SMMUv3 has its dependencies met, which
caused those drivers to start probing without IOMMU ops.

Also, the approach with bind/unbind seemed to not work reliably
because of the same reason.

Looking into the probe path, it roughly does.
1) Device / Driver matching driver_match_device
2) Check suppliers before probe (device_links_check_suppliers)
3) Actual probe

I can’t see a way of adding dependencies in #1

For #2, there 2 problems,
i) It’s not clear how to create links, something as fwnode_link_add()
   won’t work as one of the devices won’t have fwnode and device_link_add()
   will need the device to be already created (and not sure how
   to guarantee it won’t probe)
ii) Assuming we were able to create the link, it will be set to
    DL_STATE_AVAILABLE once the nested driver probes, which won’t prevent
    the main driver from probing till KVM initialises.

It seems device links are not the write tool to use.

So far, the requirements we need to satisfy are:
1- No driver should bind to the SMMUs before KVM initialises.
2- Back the nested driver with devices and possibly link them

The only possible solutions I see:
1- Keep patch as is
2- Check if KVM is initialised from the SMMUv3 driver,
   if not -EPROBE_DEFER (as Will suggested), that will guarded by the
   KVM driver macro and cmdline to enable protected mode.

Then if needed, we can create devices from the nested driver and link
them to the main ones in same initcall after the devices are created.

I can to look into more suggestions, otherwise, I will try with #2
with the -EPROBE_DEFER.

Thanks,
Mostafa

> 
> Jason

