Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99399C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2K4Lg9UXWodayqGkEaP9bm9sDSNteHJq58dHhFg6dY=; b=ilm75SQg3x8ZGgW9S3y5pt1i5e
	xel8pmNt1fCh/+GS0OwaMnE+ArpDLwQQjZ0XFeABzb5vziDrBbUuSylg6FMkWyu3Nxo+DMLwiA4QJ
	0xVkKyOxi+nCgBYdRYmqey1WtEo1VD7Hsa0lTI3q7uAOOsmLAS9jLsuOPoSzPnGwcbGRfTFKu2Elp
	8ZBnDQaMvBCk5+M85ss9QFkoyYaPmtwgqvOO16C3HSOMtGdpYX5iSPnpvtjpaHo8S8kkGT+YOJ/Gu
	Z/pUYuq5HlJxjZdIS0X1f6+hKgPI3A+dCvlDeApqW7hHmjHVXOJxKlyukSRDtf+tyVlZMlh3o8ZyC
	7ssT4mgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fAn-0000000BeEH-2B0a;
	Wed, 23 Apr 2025 18:50:17 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7efo-0000000BWwj-0OUH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 18:18:17 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8fce04655so1656306d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745432295; x=1746037095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2K4Lg9UXWodayqGkEaP9bm9sDSNteHJq58dHhFg6dY=;
        b=k8NNGSJgWCjG8he26qQ7GK3uYILlYyHW0Lv8Z8IArS8DP63Cs9+Fhru2EytMpe2hGx
         vny9EanMESEjxp/bauBB+jCnf7Fws0CgMxVwveES6t61ItHy+qJUCzYrK3HpkEEQImmk
         Cp8G/Ie7t7RTrzY50Ph+2zremna7LSJxDoU6qf4BIgUyUPerBNa+4QxgBg3v5LrS5D7n
         0c7hqBtVIR5WBwlSD9HP0zLwWlZsZ0uaExiJJ9nNK48vCOnTOvb3HO4mGs9g7NEqzKUL
         lxLmL8U9SfG/7BWK5G7Lc9DzB/tLZmXMhh1jDvbyKCtMNdi8KqQJZQe2RWeuwKzoKWev
         yo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745432295; x=1746037095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2K4Lg9UXWodayqGkEaP9bm9sDSNteHJq58dHhFg6dY=;
        b=FxU4DdiLImd7IPSTkmyehLP32qwLGmlAIDSaJlOHyiXd0I5lDOMjndeZ5CWiVy7QJJ
         KSg6XsIAKLIbhCV0KoBbWhpw+SQfY5RALc2JPavozSJiDhz0klfi5Uve60o/vn7JPdRS
         SJjh8hzbPgf+Qdxnqx50FMM9U69zb462cMRQ1tc3fjO5EjJEU90F1DAzJn7RZqJV3fl0
         vnNYK/RmnM1OOeMNck8N3Dsw5XYu3iQ5cDIVa3998y8Z3lJ0Hp0/xJK1bp5SE6Ur42X8
         0Mzs6TY7+FDqDmQBmc41whdTRw4pBS5W/L6T4UOg/8aTe4bB0ttfujg6n19ECW2kGLf1
         +zGA==
X-Forwarded-Encrypted: i=1; AJvYcCUh4DNVYsDXgyfVKRz4+4HoIUFDIl9ZYa4rlVSIcbbjrmznVfFDTZPYLT6OfxXu2BgAd+Tm6BVwToJ52TVPDtHc@lists.infradead.org
X-Gm-Message-State: AOJu0YwtNNwkqBMSQo1mKD999aSAc3lBYioxk6FXc81d0mmv+rlU2mbK
	f0vlpYn+EJ/aDYLAb4BxfNohuWJmx2ezmLKKisr6QRX8qgWK2owd9kDtttXXfZM=
X-Gm-Gg: ASbGncuJMx4+eGQ676Lfks1comKlXCqbNexr8eRgwmg+nBeCCn5oAoFqNn2hla+jNBL
	hDcZ3QfWBREn40UUzHixStesmujQbrI5iJUqbrILoxgaY/fBabRj82930HC5Wmf8QFINPfGvkq+
	gEO8KC6Od/+tOdiXZCRunDlfsDMpq0eiCge+ePAFpXR1U2alkLcfnfQihYgIOX1h0751zmA2/UJ
	9zLau546Sp2xuyubuK/bEaJR3jFJpekmLaKD0cx+rV1vpu5tey0oVv/ELN3XdQPTxjHbZgIFeCX
	0LV+05q26j0GMrmiRc+ntqsNlKrYJkr35uoCtuNftXR01JYBn119+sKCEKhXr+CnJ3HbmBnzjNa
	9hcFvnb0b25MEjA/0RIo=
X-Google-Smtp-Source: AGHT+IG4/MsY26Rj4xYm6pWmvlAPuVFdcPLdJFOh3iEBlJVLpm+B1c5dpvU4P4SztDpvWCyGwRESRw==
X-Received: by 2002:a05:6214:21c4:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f4bed4600emr4321856d6.2.1745432294768;
        Wed, 23 Apr 2025 11:18:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1433sm73395536d6.19.2025.04.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:18:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7efl-00000007M0V-3VVh;
	Wed, 23 Apr 2025 15:18:13 -0300
Date: Wed, 23 Apr 2025 15:18:13 -0300
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
Message-ID: <20250423181813.GU1213339@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
 <aAgQUMbsf0ADRRNc@google.com>
 <20250422234153.GD1213339@ziepe.ca>
 <aAkj5P1I-e9lylIU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkj5P1I-e9lylIU@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_111816_135922_5006A529 
X-CRM114-Status: GOOD (  25.01  )
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

On Wed, Apr 23, 2025 at 10:31:16AM -0700, William McVicker wrote:
> On 04/22/2025, Jason Gunthorpe wrote:
> > On Tue, Apr 22, 2025 at 02:55:28PM -0700, William McVicker wrote:
> > 
> > > On this note, I was looking through `of_dma_configure_id()` and am also
> > > wondering if we may hit other race conditions if the device is still being
> > > probed and the dma properties (like the coherent dma mask) haven't been fully
> > > populated? Just checking if the driver is bound, doesn't seem like enough to
> > > start configuring the DMA when async probing can happen.
> > 
> > I think the reasoning at work here is that the plugin path for a
> > struct device should synchronously setup the iommu.
> > 
> > There is enough locking there that the iommu code won't allow the
> > device plugin to continue until the iommu is fully setup under the
> > global lock.
> > 
> > The trick of using dev->driver is only a way to tell if this function
> > is being called from the driver plugin path just before starting the
> > driver, or from the iommu code just before configuring the iommu.
> > 
> > Given that explanation can you see issues with of_dma_configure_id() ?
> > 
> > Jason
> 
> I think the only concern is when a driver calls dma_set_mask_and_coherent() in
> it's probe function. If we can handle that case in an asynchrounous manner,
> then I think we are good.

You should never get to a driver probe function while iommu setup is
still concurrently running. That would be a major bug and break alot
of stuff.

Jason

