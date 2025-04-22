Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51675C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 23:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7gFECswBR82rOuJZXYrMO6x34hzdB9wF7yn3yimsy0=; b=yyaOnw0oEGwV9F7FwMDmyg9Yp9
	/t+1LT7veSsPDarCmhoW6OqvKYlMYJVDgbTYH+/YMKVc2LHgWuT3GCjhpzD7Z1C3+nVsZJ0seS5+k
	2nDJ3Q9tzXJFUU79P3PssNOcIAjRwPxG4BEvIi6gdZx1DGvxtaBfKhA5tMLmg3ja+hAcaI0DBbarz
	/0DwP1rLPuENH5J95L66aP7Y6l/GflePgsKBtWL3450UKJJ1cPmAhB8gcBiWXo4IM+8Z6ca48Qw5s
	LPoxkJLKaaxOJoAGO0MqfRFiZ0qsKerTOdeBSNIKyfjahn3lDQf+afqg4dSy6VJzKJKSRL8IsXxh1
	SP4qhvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NHM-00000008pP2-3MTy;
	Tue, 22 Apr 2025 23:43:52 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NFT-00000008pFJ-2lz4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 23:41:57 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-47692b9d059so84980861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745365314; x=1745970114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7gFECswBR82rOuJZXYrMO6x34hzdB9wF7yn3yimsy0=;
        b=hEb9Ddij9NyldlUPknGb/aJX05kYprNLlOwlx3SvI2wi28NfG/QKfadWPPJNYD4eQy
         7gvWtslFbD+02xIHmhtfEF2+FCG8HsEMVWhOXTsrpAoHhTo4PhxunHnfg3nzPjgvFym5
         hUt1EwwshGlwK+dxQw4LRlXLLn1DNtH0L0iFtxtQt8fV4QdsLt+c2/pXeV/c1khjpkeA
         TGo6lQD8D1xF7gz7/jdEivhyT8lLcm3SOz3mwsOXLZ+jkuHQTJc28uEaE98c/rJ29Rd/
         vUjduWEuXcbXhx0sVN3Oe6IQUftWqEnAgm0ESbzQHhmqnYvuSw9ShZXNlcKdUy+bwQSd
         hTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365314; x=1745970114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7gFECswBR82rOuJZXYrMO6x34hzdB9wF7yn3yimsy0=;
        b=WaXmUue3HwKEowCbXZ7NX+3F+smackNocS2J99SzCgMgBJ4SkoeFbjyM6VllsY/11v
         5oZGXUGaueqPLCkVBSp6BA8aoluTnJl4v509Z7tAebOJoFxHMMXHIqk3hgm6JUCSOOnc
         Di7VQxAY4nAw3qxPBy3NKM61Lpe7LqQlcwKlunKKBfl1fVtqGXD8E1swF8JoZdUwRz49
         EuttctHOAr1KU2mBvGnK0gX24uSWai/62Z2ZjBZlqVm4295Iei33r6XvlLr90ZEtiW/w
         A/TnZZYlE++0Uc5sOuxsJs5MaZ3HzvlUjKzhCK1IPoKBMVg/GzCHQENXJ6MNtmkl899v
         q6Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV6wxMX4xuK6TGjJ1JIyQWsTDcOWw2qw/yYrlE4MLN6J9ixf0UYTzMxWGwWyEoXtC9BMm4LyyocRc0+Su7CWI68@lists.infradead.org
X-Gm-Message-State: AOJu0YzoTQtTVveB78HJPxCJjPxKiVkyHtvCFaTaG4iKHMoP7GXeTC/P
	HWsMUdOaZV6x5okwAh1SO5FLnmENSmIOoKXI9ueVcZvuBGOM8FIg7A/mMxWTpbg=
X-Gm-Gg: ASbGncuojHHBrhRiWPCHGvWt07nbU7zxXumobnD2fIAZ0NP0QpPfP2J/6vVt/6tweW5
	LKHicX/4QtLzH/VJNChJCwHtSiznVi3UvT38Tu7jAiMYydINzKW1zfXDQTS0vlnQBKybrflkgdn
	fh9BakJYVBDevoAChH6atOUb5ZBC7aftggyOjSladtKAV8hX84QqQ5fCtZEy8dc9RVO8SgF2gF3
	d1nyfaC2DW4qqqvOdZSCo2Qeoqn9Mo1/ujLWlWPrAlzBphchCm/eLpGZdqwW2Ech908Umy2/Ye6
	AqMK4+1e7XzqGQ8/lDLnc53lcoTgfiDD9GhnhdvQ8ADSkUATJSc6LtFcC1aXqGuWkR2S7AnYf5h
	Ev4gf+ajp+UIcqkv14JQ=
X-Google-Smtp-Source: AGHT+IHMJVzBS9ofe/pFhoyhF1nSXR0nkPPB8mnB6Kmq2s/kk2ojN9lhj/BWknemUlGIDrPDFrdQpA==
X-Received: by 2002:a05:622a:255:b0:476:6189:4f30 with SMTP id d75a77b69052e-47aec4b5239mr303709741cf.36.1745365314381;
        Tue, 22 Apr 2025 16:41:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c4d68csm62754761cf.47.2025.04.22.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 16:41:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7NFR-00000006xuY-19ey;
	Tue, 22 Apr 2025 20:41:53 -0300
Date: Tue, 22 Apr 2025 20:41:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: William McVicker <willmcvicker@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Message-ID: <20250422234153.GD1213339@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
 <aAgQUMbsf0ADRRNc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAgQUMbsf0ADRRNc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_164155_818434_73B2E3F1 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Apr 22, 2025 at 02:55:28PM -0700, William McVicker wrote:

> On this note, I was looking through `of_dma_configure_id()` and am also
> wondering if we may hit other race conditions if the device is still being
> probed and the dma properties (like the coherent dma mask) haven't been fully
> populated? Just checking if the driver is bound, doesn't seem like enough to
> start configuring the DMA when async probing can happen.

I think the reasoning at work here is that the plugin path for a
struct device should synchronously setup the iommu.

There is enough locking there that the iommu code won't allow the
device plugin to continue until the iommu is fully setup under the
global lock.

The trick of using dev->driver is only a way to tell if this function
is being called from the driver plugin path just before starting the
driver, or from the iommu code just before configuring the iommu.

Given that explanation can you see issues with of_dma_configure_id() ?

Jason

