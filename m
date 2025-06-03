Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2415C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=; b=a5alYLt3WnT09zrF8S6l+v2dxy
	ufJRqAsH4TrJnyAHiPDWXK+FY1328+KMgtd4TzAtwRMrVWWnUMf9SjE0cF/NzftxsbnSmVbXO/lt/
	ZWPIbP2z08AbaSLbH93Wd0MHOG4aC24Xgo8lVkashFx/MiGojU6OIvXz0j6Fm8LMchc3DeNV5Nw55
	s1BFlaeLLDgXKb5Qi2qonWb/B37J5NNta4tDVzmaHr9wmI7mn6RfXkKmjbBAE7UX8j3yMkT+MFQtM
	zrOhS2xvBy2zbVTQT+sONBrc16M0oYPHoN3LVIEfkykLJbidTM7KehLJhNXncfU81mlfrFmRgxXha
	vyDk91bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSLV-0000000B8nw-1oxd;
	Tue, 03 Jun 2025 14:10:29 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS2g-0000000B5vV-2Lpj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:51:04 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-48d71b77cc0so65876201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958661; x=1749563461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=maKSJTgAb45dTnuTUo3DH3X0uuFMonoRcna612QMCN0Gb42B40SaBPz8J6ipVINXZR
         cHHJhaUQqUWSXdShptKxYBtRgHpJxbbJm8tFN7ip6D2skcGGHrVcvn2j3EymXPkKjknY
         FXWfXp1vMU24AV3Ga3gaH0j0WztKfGUuQAxEZyR06/SMH64a150bOvX4P7JCsplQzccT
         ug7J5ZFS7D/oystMLJ0pgUdSzbkr0OQ1FFRVdB5iG+MqvlYkEgy6ISwi8/ow6Mjx4QJE
         gODTEeckOAU3gsq1PObR1S27T3Pmf+CqSoYpWyk09eKbhgviYsJoin2LmLx8G7U2idYG
         2baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958661; x=1749563461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=RnjtkNGsEYBfaOEZ/o91M7OuD/6tDlfWOzJEOLxrU9l3pAdWRbCTQR+2HKE8aLaYS9
         ri8akrKfAEStOhme3uBepMbtyhQGvBoOElXjT3WDtq570MJmoq97xzOrwC9YCWZ09/5x
         LAbJm/qMHMasfGSfokVXpNOQoMdW3ZULzvmyRQI9mGXbUSxV/7m1us4amjxC+L8vV8Dn
         L0nbPoWb7FzaVPEP7PljyU4OzZzWztgJTW0TkWElKhs0NFrByQZ90Y6ZWajWKwkRbBXB
         /pp7OqEoe6TFkDHBnBCLcH8FuepO+YIIXayEXM/kD1TSeJrh8cLPqeUeO60yIm/AQ9T4
         /L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKgnE0DlXv7yEQ+i6Z6h/Eqt8BXN0Pkj8aGucrej+0KVc40sw1+4z2Y511FuUj7BiHBkP4cEyR9dqg9OPXB/S6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5NS5/RL5ydNcPzE1e4wvCaNQL324QZ7KejvABr9tDqnRUj31G
	cs2UC1aiBevtIy7wRj1pMHkcYupIFuOosFr5xL2SJWRlCjDMtdpxK0OpROoiULecoRiaDQ4OWzY
	C4e3K
X-Gm-Gg: ASbGncueU+lF8KdAek5A+B8sQXdHnVqQ+xpE178fNFiU3b3BxfaiWmTHVYKrQDpzw83
	xqhGNpnt4ZUbBro107bcJulC3Z5i/VLuZo2bPPzmXmKS4ym98Y7oZfZJpsMuDJS190fvZhX2V3E
	ywQEz0fhocyMO05Rbc/Qjwt7dAiLaNa0oIGY+1mZCV9gZs7r68/wzXtiPxgg77DEThiMVyJEJgd
	iz6j2ugB75t6/4QTFXC1/5DpN19F494cNa3ncQPowhUkUWq5Jeb0YwhlKAqklUg+7ko0nQjESq9
	SnfRY4aXxaHQG0ui+7Ddqln44xWuCejGzLigWfNxlcL/3epRM9GJLE63jOUkh/CzTjOAK7tCVNX
	uHm4cNT4d1ixkGcPvhWup7V1SCdk=
X-Google-Smtp-Source: AGHT+IEFP32FP1kWWCcJZHDROTyLVsjrCtV3bR6kiIwGVnTYe5RPt72l9Jyf9JX2LfFifGppycDP9g==
X-Received: by 2002:a05:620a:4629:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7d0eac62c8fmr1708400485a.14.1748958650816;
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f9925sm841658185a.41.2025.06.03.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2T-00000001hDC-3YG8;
	Tue, 03 Jun 2025 10:50:49 -0300
Date: Tue, 3 Jun 2025 10:50:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <20250603135049.GL386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065102_599733_C83522CD 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 29, 2025 at 04:32:12PM +1000, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Yay!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

