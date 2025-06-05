Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E94BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=; b=4UeJo5Ep2Xip5XRevDXjjKwgvU
	x6UzTXrNhmH0kUSpGicz+DpRvlhoUvlV67mAkpS/D9zW/STAbdBmF3HFebLNKkEr9c7DgTowwUdOw
	Ce/pqWZ1LTSjPMDQv/JSrUvWhSPSuXu/LJskQeTiyCIe2AKyJ5j8twDdUtPjd4tC7OrgoHWl7UOQL
	t/TMCPeeN8UcTx6r/bx0gz1ItmD5Rxu6//xNaNb1R2v4wxoML+678PPHRbgltyjfkbrbK2UXBV4Hu
	j9PgSNDL+Qp3YQhxj9Z4pAeD+hyVX6WUaOD4q0OAp8lmKPNJQm9++bpPs11HHb0DY6aCKYiIpYz1L
	rR0hq94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9RZ-0000000FSD1-288y;
	Thu, 05 Jun 2025 12:11:37 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9PM-0000000FRsK-1QQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:09:21 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fadb9a0325so8791546d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749125359; x=1749730159; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=Ea3W2kxGpSNxlB97wEOVcKzrT6U4jtQ+55rHNTBsgMcaFoDZiL7ix5d7q9jun+/di9
         qSyElzf+X3NInWn4VuyePNv9wWFLX5ZDdcvCXSNxvqIZZY9lkfEkZbPhDdP9kn5F7O9n
         AT2tIE4OmHuCpvbAnIT6L7YOzRf1SUJS9A9dd20gt1J4891/XGKLD5cXdSTSdr7hEEZ6
         xJEErtZc6DJXrY8GCApADCBY7LqzIngmG3ubt5jKd1YKafKZtgSoBoatWR9fitnKg3q8
         gShrLHBacLbPTZIMOEupNpj54SrvCueMcKj53YEMOIlQEviXh+TcJyV6uj+zBReUiCzA
         CDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125359; x=1749730159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=mpCDUwt7WAy619h0OmngiLphaRv3maAvAbXiFqVHiMzrFsPI70QsDCCY5abAkYMckF
         5g7tvT0RRIinIYrmNhnFTMHovgZa32F3rXfrbF8wLQ/1KvwJ5+j4/7IeEd0ybwj+D7nu
         nWXhGBTF1bFhiTMlgfv4ioeQR/UohejzkKgMfeTrOKAtSjs8OTnQebVU5b2vJv1Ok8OG
         YZFv7CZZ/3xeH/WCmSdJwYI3o1q9mwRn5C96dBnU6zqraA2OE3fj5J6I+f5JkxG7knoZ
         1823ZFU12hDJizkL7gglU2Ht92tXyHRYjAj1FtFOFjZ1niYCsCmeTr7WEAVceEdnxnt2
         GVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWjDoqTV2dqOOwEKbIqN4Bj2buYZZGxww7y2I6YKlKFn6jx4j/kdsTZ2pqgqWTs8LdSUngT7v9wSmg2hH+Ms/+@lists.infradead.org
X-Gm-Message-State: AOJu0YwWyIkEvSHj062PVAXd6pY+cCABGSxxfl4qmHKdkkyc1HwRfW2d
	JQe8dI2ddggZ2whmDJSxVnEZqMbPhTqTh8gHxsh75bWPnAqxX+zYTdNL8vWVLuJAHW0=
X-Gm-Gg: ASbGncv2+zAo1VRpJRAJvrtLWmGx2Xa0hNCjrCZBH16kcEkiqF+P1PFBx3OI0BVlzGn
	vO2UCoHspBDpM6VCg1ieN3432CfsbweYpthaXRS8MI5rfgNlPLI+SM4e4ykzbaapValzYbk2j6C
	0uUWe+m46ttFukb2U99vAys8WLxi+x0onmF3UO4GJZQfj1W0IxI3u9XBXpo5HoPs8KEsRD6VrXh
	c0aafd+aQAQbOyEFF1PIH97rIyE6koFn8UKjSOUcAVOXaNDYOQh2VBp46s1DrdJfG8nwQb4X3a2
	Lq6WfM4Eobs9YtqURKIAAUFbccEL7MJvc+AZ/3PCY9wePDbF5hzMoK275cD5kVcHP2H52KIF7o5
	7gL6UrSQqOYK8Q2/dAoGPZ9N7Rr4=
X-Google-Smtp-Source: AGHT+IGoKm/5U4/UM2uM64qO2HBitYJapsKbuDFJlmk9byEyE/W8ROsmev/IR9V9jeal6LfHAI1O8g==
X-Received: by 2002:a05:6214:224d:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-6faf70163f2mr115317766d6.37.1749125350351;
        Thu, 05 Jun 2025 05:09:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4c7d8sm120604836d6.36.2025.06.05.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:09:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uN9PB-00000000EdT-18gz;
	Thu, 05 Jun 2025 09:09:09 -0300
Date: Thu, 5 Jun 2025 09:09:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	gerald.schaefer@linux.ibm.com, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250605120909.GA44681@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_050920_423549_0A416012 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:

> If all dax pages are special, then vm_normal_page() should never find
> them and gup should fail.
> 
> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> 'special' is not set in the pte path.

That seems really suboptimal?? Why would pmd and pte be different?

> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> 'special', right?

There should be dedicated functions for installing pages and PFNs,
only the PFN one would set the special bit.

And certainly your tests *should* be failing as special entries should
never ever be converted to struct page.

Jason

