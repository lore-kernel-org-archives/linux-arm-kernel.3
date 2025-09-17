Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E08CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZVlkWCCuCYTghm7E9xutK12OPPCXr3fuw+E/JSa8+A=; b=mlM0cdsvGPWANejE+OyJ7E3P3n
	OZJjOrsDuNuAJqy12h9hoHjeDeNBsjXujytmDDnHLtuzWPk3REKFY1iJ2ujGChotXIGiGMsA+36B3
	bA4xpxXmpASj8d6+F0iJ7Oen4TvmOd8OFoDoh53uaorwQlOcZIqttkjLtSkSElGGYH13M2V+0+Tap
	fqhEcb2APTk/f/wN8yRQ4bcirH701Ctj2C1qfxMunbjJ4zqQg5duqDt9af11FUHUq7GK9kcFemaLL
	PbEfJNXDmHEf41hBqhTBfiaDgCaq63rhFcnToqRSwrcwF+YAjNPT6e42PjXb5Jut+6mSQggYvVygb
	0feHqWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxoK-0000000EHBU-3PRX;
	Wed, 17 Sep 2025 19:27:24 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxoI-0000000EH9r-0yA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:27:23 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-78f15d5846dso2069316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758137241; x=1758742041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZVlkWCCuCYTghm7E9xutK12OPPCXr3fuw+E/JSa8+A=;
        b=cH14T7kzyOhrUcqL3h906moiOegqWcFLCl3Myr/LQPPgTPxPeOjg3JHnp48i5KZHQZ
         nZAz0xy0+PYZMBGbI1LQiGlaoHKGnfJTi0GpO7tLTQHD2gdavdEzI/StVZzPLAmaXFw/
         eMNayR0kN2oetb/tWpCXnI2D9+e7uyd44261bHRXpFWRDYjjzIltHXyanObjYs7Yfzjl
         vJ2EnEB/VGgm7K8FiydO6BKSQj/q+L81IVd5QDkkMB33biwYf2rgyJLAsm3T2/PTU0ga
         9bGthlwa5INCn5s/M/t/8VzvRWYLC2WfC16RR1u8+X0CKaVVzNVYw1IcPk5B3fK043Id
         6GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758137241; x=1758742041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZVlkWCCuCYTghm7E9xutK12OPPCXr3fuw+E/JSa8+A=;
        b=POAnJHjsv703l77mUsiZCqhQZbowwfRKv+InYJSmpYO0wvVdhGkJ6kwi4QfCW4O1bL
         OhLmGBOBnVVXmfQsG2t+gsUfmzM8qESnkf08/KbWhg686Jfs2nQ/AR/FGTajxUb7y1ft
         /kYoJYyuLf/ecUPOa7H02cJY8sEXq/lngEvUq7KNOCy0aBDloMvK4GqOcIgnKILcvCrQ
         Y+VUt1crFq/9B466892a3p5NaMt0Z5VBy3+OWyPmS6sZbHJZezGv2oLR84G6hPyqLFC2
         DysZXVkzY/s/wm4DH3XLn1tGZFtZgFgEzDXf+uOoi46d3U5PTJrOw0iTubwc45WsdRgY
         xNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXaCmtE5/Mi9mw6NJF1NDOxEk+NrIWO/B0KSdA+LZU9yrTyJy6LmCMyUENprzxqRe3C5+/4Aayg4uYl9pzWqix@lists.infradead.org
X-Gm-Message-State: AOJu0Yykn0XFqhYYifqNmjfFBZRR8z5/6fDsELlHQBxc34aHvTxJ7w67
	3wwn0AluCf9iXa4G6Dn6WDCd5VJr4oB3HzYC+2V0WHp7G20oV1Q+E00yNztLuFDdZ70=
X-Gm-Gg: ASbGncv1pvEHYC0NvGvYuFsN2f8SclvSE2LxFjD0t73cWfmXIXtrLO4jskCRRxUr7rH
	EQMnbskv4XoDgmLkD12cUwQQf8EY9g1/BBsgaqqTkUtG+5OfYj3ZZLr+rnyc0ceOU7COZ+d4EGD
	c4GuwwhrZ1cwQMtkkX78peDxzreDLsVgDrLaIHeJg71KlKf7Wlj/nRwejElSTDpvu3lLxpLjpt+
	rIK2grX4Ppkw4sYktTTp9IUAcoOhR2UVveQltf8e7SxW1fsjSwBcvJK00/WW2l5LyAnHNePhmiR
	odafc6bBriC8cPftl320ziXf0GSjnkz26Q4j7In3hpBQO72XxhSwpCI0WG7oDHSHZB7tVdExJcd
	GIxtsG6+jCMR6o2+q2E1lmmXRkjTF99frLn5cb8eAuRD/uWDZAKzvtded3bGoEAZ7JBVRYRrwTh
	di0sqogH04FkI+FOtfNZkxeA==
X-Google-Smtp-Source: AGHT+IGM3xhmzXDRFrNe6F6REL+f8AdNqllu9mwFuh9hgnJJGII/zf5nl5KF8jaDrmx00pWc9hQPkQ==
X-Received: by 2002:a05:6214:1d23:b0:711:4042:9484 with SMTP id 6a1803df08f44-78ece45eb76mr37540046d6.35.1758137240831;
        Wed, 17 Sep 2025 12:27:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm903096d6.53.2025.09.17.12.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 12:27:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyxoF-00000008n2r-3JSd;
	Wed, 17 Sep 2025 16:27:19 -0300
Date: Wed, 17 Sep 2025 16:27:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 0/3] Move io-pgtable-arm selftest to KUnit
Message-ID: <20250917192719.GJ1326709@ziepe.ca>
References: <20250917191143.3847487-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917191143.3847487-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_122722_411188_5C5B8A82 
X-CRM114-Status: GOOD (  15.74  )
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

On Wed, Sep 17, 2025 at 07:11:37PM +0000, Mostafa Saleh wrote:
> --------
> - With CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
>   It will automatically run at boot as before this patch series.

I would drop this kconfig, kunit does everything required including
run at boot if you want.

> - Otherwise with CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=m:
>   1) on module load:
>      Once the module load the self test will run
>      # modprobe io-pgtable-arm-selftests
> 
>   2) debugfs
>      With CONFIG_KUNIT_DEBUGFS=y You can run the test with
>      # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run
> 
>   3) Using kunit.py
>      You can also use the helper script which uses Qemu in the background
> 
>      # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 \
>        --make_options LLVM=1 --kunitconfig ./kunit/kunitconfig
>       [18:01:09] ============= io-pgtable-arm-test (1 subtest) ==============
>       [18:01:09] [PASSED] arm_lpae_do_selftests
>       [18:01:09] =============== [PASSED] io-pgtable-arm-test ===============
>       [18:01:09] ============================================================

Suggest to include the above instruction in the commit message adding
the kunit so at least it is in the history

Jason

