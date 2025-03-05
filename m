Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9585FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qytsi8AsRvyusqMe3jOhTvgsVPTM08UZ5Jj8wi8LUdo=; b=DWq2vD5lS57SNo8pnCrxFh4mF3
	RpV51JLM66MMrqSHJdCpOnQgAedlUhnwvRa9Tg64VNG0h4HlA2VtoV/5aZQrSOLbyZL7qLVi+p+qd
	44ZPDHZ3Vzi0xn13rnRYkgo8LKSOBhkuzXTdSq2nNTA6O+wOVIzb+2I0JyVWE6IH+GLG7d0UpWID9
	z8dLB2pWJE/Sxd6ppF4ON8le86bP4OZ4y/pgrhIM78idlHi/Oemw2O7xs6IQxEuqFj0/wu9VS1KLz
	WRsCvWJJ1l7yb3tTb+rhVCfBFcb6BfO0Hwl7xvA2MA7Yi5sUdQ1kWUqnpvneAKW+z4lwPGwRsb+C9
	On/+OFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptcC-00000008wdg-0by0;
	Wed, 05 Mar 2025 18:37:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptab-00000008wX8-3Lra
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qytsi8AsRvyusqMe3jOhTvgsVPTM08UZ5Jj8wi8LUdo=; b=CTwbgJP203RiSQiJHZTs7YysXZ
	cogPRfcxeLIbbh+WRf++Jxqt1sC/B25fo4APmFWUs7Ddh5LdJ4dh9gUE8t5D9g+qXv+47+BQPJgc/
	wqrZHoLsirSo7kLe3PsMwaPyHh+qwJgW/XM5uIxiX3P4l9UM/lQnE8OP8WSULwXB1l+VDucFVa4XW
	JJ/aSEOA8kI+MAYuQEE9aXA0MNNn7y/D6Px+ZMKMjg0/Nv7SJJ2M0eRbHDXoFDr9V1sjuCevCVqXN
	glvufsiOZKFpi8ygEAoqE+JYsxDWlcORSbBP6LpHppD7sE1yFXmqGEw++OAP6vHeorXzbA9x/5GV6
	q4i3cmvA==;
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptaY-00000000gnh-38Sv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:35:28 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-60027f8eedcso874950eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741199724; x=1741804524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qytsi8AsRvyusqMe3jOhTvgsVPTM08UZ5Jj8wi8LUdo=;
        b=LufaWpgCI8SlvvyUshUG/etM7ytI7oMMgsZBW9Y8nexCoI+1FwgXgjfxzGb4bX26z3
         7e+KzKrUiSlkwqZJTXns3gXcYaUwgX1AYhffdC+jBR1aBu9QVZl4VkqPG0Vf9os6wCYI
         IIWbk1xLx88o8JJnybFtFmmHpBpWiQX+XD/RtKj6Mc8EUEjmFtR+W6dopunwUrz639+R
         VChFgYlFmvgLz1X1nK54yCcOH4DzTCT9GWYM7IM+TUlrGYQH84RcyT8qVcU+Ccxknuap
         pciC0yxmBENjNjQNiqCcD/yOAbVIqHGdDIrtOAlHPJHhFsJrb33u1LUBg9jHoTBDKgXX
         ++QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199724; x=1741804524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qytsi8AsRvyusqMe3jOhTvgsVPTM08UZ5Jj8wi8LUdo=;
        b=bsKHTCJ3NrHtxkpG+kulnloU8BGsHjbiXiucGUpmnGcXuS1UlNlzwDEorc3kdKMSC3
         /S26p4m42FLyKtETnEMyWdloKL9AtxwmpJMIbcT6L7iJfpoIa266cxBkU0Ssrz/lKLhF
         syLpW6Kkqsf0l+DbKMLveBFNvh8pgKVjmPR99wD2xQIkuL8Z8fMIGDL0XZAD1uiJcOOK
         5HM2ooN7PFQFwEpXtBqCqn9at1J3BGbz8Lrk7dZUm8EsKug5zUDibKT+m+BxJ3yIUz3W
         fDQ+DXn0glKEcppK1BJWpZLxogBX45OxIWgvzrSreCTeunvhM0FoegSGcqkD1YUbKFvi
         Sd9g==
X-Forwarded-Encrypted: i=1; AJvYcCWurm3Im8two2DS3ijDJ6Dmw2uSFszYPDH9WZviNp4DTNJdnLUL2JKr1jqr6sKWFe2+Wpu+ei8gIpodmLSuIwSh@lists.infradead.org
X-Gm-Message-State: AOJu0YyJVlp6t5vTudLESTSs+ISQ9o5BoB6iBdgY6TTMBx7QjUdKOrW9
	9is08VQBVyIu/lEzQGYvtWe/LUDktUTXhfL0giAPaTl4pS16d8i+NhX9OsTxso7IDyjVWL+H0eJ
	w
X-Gm-Gg: ASbGncuUdcoX/zxg8yR1UQUqTU61PAflz8+cqnjF6As9Zcp1IX6CIZUPX8hWHj/9aGd
	4Cf+Wd7ZBLijIYEvm2kDzFBMURdDHQK03gQ2Ys2ULxK2aXeGtwO/+VBFH30u4ZNtMdcu46vZBtx
	NDFKZ7AbMQKq0dohlMHMJtwy6cr+emxDVFhEjrAaKat8Dnkmuc4tdxzJkJfqAbipSKUbbzYe0Pj
	KetSbF+QNedtFURYoE2heMJr/AxSzQjmBV1QfjOrTeC9B94j2g/JLlMI7Q6Lt+maTGub6hqAPSO
	aB7ubMm+3CE96WsLsfY=
X-Google-Smtp-Source: AGHT+IFWMmT9cW2Ut5DYuDUpvyIFOmmiZcEpt4WPetA8yQdQkDPqbKkYQiVXDZwiZSFr/BdwTkrEVw==
X-Received: by 2002:a05:620a:8806:b0:7c3:bcb2:f440 with SMTP id af79cd13be357-7c3d8e703f8mr618694385a.33.1741199340112;
        Wed, 05 Mar 2025 10:29:00 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474e90b8853sm44121231cf.65.2025.03.05.10.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:28:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tptUI-00000001UBj-3ss3;
	Wed, 05 Mar 2025 14:28:58 -0400
Date: Wed, 5 Mar 2025 14:28:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <20250305182858.GK5011@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_183527_041007_D3EFE0FC 
X-CRM114-Status: GOOD (  15.17  )
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

On Fri, Feb 28, 2025 at 03:46:33PM +0000, Robin Murphy wrote:
> +	if (!dev->driver && dev->bus->dma_configure) {
> +		mutex_unlock(&iommu_probe_device_lock);
> +		dev->bus->dma_configure(dev);
> +		mutex_lock(&iommu_probe_device_lock);
> +	}

I think it would be very nice to get rid of the lock/unlock.. It makes
me nervous that we continue on assuming dev->iommu was freshly
allocated..

 setup the dev->iommu partially, then drop the lock.

There is only one other caller in:

static int really_probe(struct device *dev, const struct device_driver *drv)
{
	if (dev->bus->dma_configure) {
		ret = dev->bus->dma_configure(dev);
		if (ret)
			goto pinctrl_bind_failed;
	}

Is it feasible to make it so the caller has to hold the
iommu_probe_device_lock prior to calling the op?

That would require moving the locking inside of_dma_configure to less
inside, and using a new iommu_probe_device() wrapper.

However, if you plan to turn this inside out soonish then it would not
be worth the bother.

Anyhow:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

