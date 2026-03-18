Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59221088E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm5cgq431AMp+29aAA5yYiOJktECVQ9HyfYhNIrC+D4=; b=3GUMg6kmwbANUEmVLgPhFdZboV
	MDp9HZDremk/sBKSlLBWs0jAIlX9SZ/wqGKxPegojN8pU0n0+a+x4sophg/bhNhdMJsCL94GpziS2
	LIDx22pheWWVGiaC1LcaNmDdWJEMGSmV/sJFsugm/QpfzcgTxO5A+mAjIvnGwftKk2ALRSuN6ymDy
	2eWnz/jRMf6+kxkWs0w127uYIrQDw5UOVcqLicV5kx5Jy/D3X9XzHJWnHF34aPw82aEgAUAEQ9kyx
	8WdPF6WbO4chRRqO+PO6cS4UK5Emz8MpQwShM7yWsR35kZ71nZVY+oi6RhwIHoTolHarzR66Ce5O4
	eKaVtRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z2Y-00000009PVy-0xeu;
	Wed, 18 Mar 2026 22:06:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z2S-00000009PUd-3bBj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 22:06:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aeab6ff148so13995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773871612; x=1774476412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm5cgq431AMp+29aAA5yYiOJktECVQ9HyfYhNIrC+D4=;
        b=memU3VnZKpWM+5ZBgkHZKgMwae/CzEV0iYrtMx5xR6fEqUKkCpAxtRib6Qhtof4i8/
         6QPVYNAxvpJOPlheLB3ySPRCkU1cZY1bQVDE8z7fMacb8vCtO4IeXTehcie/ItdOO1fH
         PmMonJXs599d3Ns1tYH1uZqoi9POybmt3NusrIEaPmftMGFPpHp6Vuki4CNzvYEH26gO
         9sJ4pRif3m4eOK0LIad6HqF0n0IEkoWi1dRxgz86pdgmrihMmHhAC2jK+mzDungdgwb1
         m+v4OonS80un28dNnldbunw6CttEji8ie74wWzP9ffCM6YaK6MHqGCvcK22yaqo5Zep0
         KiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773871612; x=1774476412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm5cgq431AMp+29aAA5yYiOJktECVQ9HyfYhNIrC+D4=;
        b=o9nXLVOA9W3QvAUXGrW07SN5/gq3VISSRHZDYwsvi3lrFUTqLZ7HZvl39J6Nb+CVSI
         +gMLdVqiS5qwj8ChQjjSLVp/d2CpLgwwqxd74jPPhk4zlbTsi6LOQilr3TXm+pTrqqHk
         pGGNL9YbbyncH8CLBfvPidOCGwZMoS7KmInZV6bbRlwD1JCavtXHAOMxH5sMEhVJHR6W
         W2zpBwRemRIC7uSmANlpYgHHa9/SEVOlCnFsWPtVhdk3ucGzr8DLdF423ItLYxc7QFlQ
         M+cBprAajoix6J9cN5UnTAxTLM3hcVUdC6TMu2pgSreM5XBZu6xdzvYGYP+2PjDigPLD
         EV0g==
X-Forwarded-Encrypted: i=1; AJvYcCUjPjgakwXEWfCAQStAwUmY+EQcCeurvIGrwcRr+T56CDqdCql5P/7gyG82zy9oK9UWVv3eTEmgj6kUfvb1m0rW@lists.infradead.org
X-Gm-Message-State: AOJu0YzlHPqpTAowJI7OYMM4iy/7GtjRv5DvPFWZ0OUPq7xaowdPxJ6X
	KdhymNiLy5vhT5JZ11iP4tPKEZ/eA7r54EMiXSUOSt5yfAHcd97tjJfd9GgkkCloxw==
X-Gm-Gg: ATEYQzxzYd2sVtIBksngm8jNyBC3WPbQhlJHfRPb67fO1HO3/uVkelrpFw4Owgwisgq
	Dsi+nlHxk0WJ+LXV/uUJOBF4S4oxEIfELmcyru7Gr6l1r0CekwAz4ySJN3hSVujeDJByq6zxYL7
	VnGQ85f3bjDIXmrwkg63DYxmpZoMkhJ9GRaZ9jdBPBWRSiFhlVSCkI3wyjqNkr5aIgeM0rXcozy
	XDPR/nTZa5NhiFmrYIFk5JuQ2yYdy1rMriJVUdznw1ICpkjnUi4OPO/pqYyFbWEOCyU7Hsk6dzM
	SXKT29dHOG9s66dxsWK6AzrwpbkGU+zJFO/RfYPuCl9CelDjS2lyT9QagaFS9l/nXdFDB5lDn4d
	1ni6dxzTSgptAz2/gZTFdx6B7GEnPAmlqNIqtIZN2Uae7BYCDRaFWAK0DMUUTpJB//pd4wh6tzr
	22Iyb0LxOxZbHDwJAgII5Ypgt6Lh+Ifo65Wr+nSpWa8WJIrYOxT56OsH2nOl9DBQ==
X-Received: by 2002:a17:902:f54b:b0:2ae:4808:bd99 with SMTP id d9443c01a7336-2b077ca07c1mr1353525ad.2.1773871611494;
        Wed, 18 Mar 2026 15:06:51 -0700 (PDT)
Received: from google.com (168.136.83.34.bc.googleusercontent.com. [34.83.136.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e44a42esm37397735ad.33.2026.03.18.15.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:06:50 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:06:48 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	"joro@8bytes.org" <joro@8bytes.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"jgg@nvidia.com" <jgg@nvidia.com>, "rafael@kernel.org" <rafael@kernel.org>, 
	"lenb@kernel.org" <lenb@kernel.org>, "praan@google.com" <praan@google.com>, 
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 4/7] iommu/arm-smmu-v3: Mark ATC invalidate timeouts
 via lockless bitmap
Message-ID: <absaKimeI_TXXxuu@google.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <0c5525367cc67ccc84a675544d1d9f8462704065.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52763AB181F5213FAAB4F4F08C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abr8aS/MDU9aeKu9@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <abr8aS/MDU9aeKu9@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_150652_905921_7850B788 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Nicolin,

On Wed, Mar 18, 2026 at 12:26:33PM -0700, Nicolin Chen wrote:
>On Wed, Mar 18, 2026 at 07:36:20AM +0000, Tian, Kevin wrote:
>> > From: Nicolin Chen <nicolinc@nvidia.com>
>> > Sent: Wednesday, March 18, 2026 3:16 AM
>> >
>> > An ATC invalidation timeout is a fatal error. While the SMMUv3 hardware is
>> > aware of the timeout via a GERROR interrupt, the driver thread issuing the
>> > commands lacks a direct mechanism to verify whether its specific batch was
>> > the cause or not, as polling the CMD_SYNC status doesn't natively return a
>> > failure code, making it very difficult to coordinate per-device recovery.
>> >
>> > Introduce an atc_sync_timeouts bitmap in the cmdq structure to bridge this
>> > gap. When the ISR detects an ATC timeout, set the bit corresponding to the
>> > physical CMDQ index of the faulting CMD_SYNC command.
>> >
>>
>> It's nice to see the ability of allowing sw to identify the faulting sync command
>> upon an ATC timeout! On VT-d it's not feasible when multiple wait descriptors
>> (similar to CMD_SYNC) are in-fly... :/
>
>Actually SMMU doesn't know which device is faulting when CMD_SYNC

VT-d is able to find out the SID of the device for which the device TLB
invalidation timed-out occured by using the SID reported in the
"Invalidation Queue Error Record Register" (VT-d Specs 11.4.9.9).
>follows ATC_INV commands for multiple devices. The commit message
>in PATCH-7 describes this in the end. So Jason suggested to retry
>those ATC_INV commands by bisecting them per-device, which allows
>us to pinpoint which device.

But for a software timeout, something like this would be needed.
>
>Could VT-d do the same?
>
>Nicolin
>

Thanks,
Sami

