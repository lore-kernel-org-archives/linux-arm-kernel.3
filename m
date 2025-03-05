Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22163C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ep2jN4skgI+D4W4EsgQGzXEpA82GjT/riHpbC+3iOM=; b=iw8MS3XyTzSoJpGSCEY1WpeQao
	VXTc5bsUisxE7Oc0Lw2QiNvaB4u7NW9LWFioKkGXPRtpi6Rj5k+qG4Udu7bIW0w7DREj3NbtDvMPW
	sUGs9xs/N5fKnz5b0emCeFCyTPdJZYpzkgccejnDTK6vulBs+GTz7XvBnJrZhgbu5qqTCYiNmuM32
	pLPuTQGWaNlbAzcOHsz2Vl+MQFTjLhtNntGaNJ0TM6s1BeQnsDMRM95j3Y2+tXTONsY/sBkGxzaUF
	4KpmfDyOyCe3FGtAxorbUsPak5J15MURrK0xzKwWEKnEiIdGwIQub12Lg0zTVdUVyvElJS+msgmpz
	shdEwzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt3c-00000008rjS-1LnL;
	Wed, 05 Mar 2025 18:01:24 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsyO-00000008qxC-3AOi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:56:01 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c3d3147b81so219335285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741197359; x=1741802159; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ep2jN4skgI+D4W4EsgQGzXEpA82GjT/riHpbC+3iOM=;
        b=MapXd7sXgwpdJ7W1zzogL7M8GpuTgmvvRKD6mqVcZyxLcSc5jYrwi8SEA+Ub1HDqsO
         r0bcraY7gmAkh4vQHelGdVr89j78SeraDsqUiBZaGf64TNopqetK26iixNkGD2S3EF0+
         OPW87/dDkFomDTfDzykPspWaKilDK+oJSGy6BoXitG9nZ1osuk1mQ1cZ8vVV/dcyEh5e
         JfZHGNrbFi2wHuU3Gif0yFsGZjeF8+V81+fgLju6Ee9wqISSSR9tJiM0oUGLN33qpUxQ
         QPfpJV7/aFR3888+XGL3WQxAkr79GbQ6m88GsZaoR3SnHQqlBoTyAHQjZWBjLHbTQdK/
         sXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197359; x=1741802159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ep2jN4skgI+D4W4EsgQGzXEpA82GjT/riHpbC+3iOM=;
        b=w0hMgmTbDAEmuVfHjdKAlvQ++4hwVDdSDUxXkTwpELz+DwGv2S3NMGkptDPjSNj90z
         Yyg3ImyoWLRK35WOiiaywKMTHSGtcTiwLhaov9QbdtruKFsSjZDJQii2Q238mHJz4JeD
         MYIktrqvjxDJp2CvQMsbG9DFaZxIRtEsV9rYIz5S96EAYgV2xV3mGWa72ibXnS/5XU4x
         oMUVKy6Y5I6M5lx0q25nu0We8EVX7Q29Mls6VeoCxcjJlXrVsKDvaRhqNjRWApSO3QnH
         VHP9To9pqOcI3jk3wI4WRvYJIPd+nezGKCSSgHo/mzGS4xkQkSXsk3xrFzuoz+FMxk53
         KAOg==
X-Forwarded-Encrypted: i=1; AJvYcCXbh0E3gSSP9h//jJZwY4WNUwyLkxWUDaWBZW6CXrHAOPbotPOmJyPRZH3z+j8EA6RCGLYIQkZe0afDiQJN+Stc@lists.infradead.org
X-Gm-Message-State: AOJu0YxLtN6CGvxRSyWGTp3dSHW8P8TvoGl/oNejxyUhU17Jbz4I9/yV
	YG+mnMEr9cgKnJhgIhsTac410BMwpsmt4WaK0tiptntdTw2/DDQDIrlmuo5aCNo=
X-Gm-Gg: ASbGncs8Q6WsygTffyW1vHSdh1vtsNbW0HBI3devxkEYs3oqQiNoYtmpI/kw+e2dmti
	88vkoarKyKKxCp+zB5Zzj68fsFpzwwoYylnZywOUO9a1v1afOqifjaww1EGfM6o/NVEKy6Wv2Z0
	tiJOwE1qhEXlk3in7ywSHdpreM8Ol6Nm/GWqXlft92g5+BcJ004QU/AGaXbT2LO8Qj+eeKrssnw
	nD8ux1HR6m26bXLK9x8UOHTGF5d2MAUwB+H942k9eioi0GmegevrGFR2rvkHXWla0ERNrlnZsxm
	95KOkvizGDkf8b0hMxE=
X-Google-Smtp-Source: AGHT+IE075gQ9paRBr5FJqePHxLiGeTWllaX8jx4kAg32gkUcqpKhkxzc9FKZ5jSjzoHlrJkCTJ+cQ==
X-Received: by 2002:a05:620a:8908:b0:7c3:cbad:5729 with SMTP id af79cd13be357-7c3d8e7ae8cmr768466685a.25.1741197359262;
        Wed, 05 Mar 2025 09:55:59 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3b4c9e120sm486128485a.11.2025.03.05.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:55:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tpsyL-00000001TVM-2YSq;
	Wed, 05 Mar 2025 13:55:57 -0400
Date: Wed, 5 Mar 2025 13:55:57 -0400
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
Subject: Re: [PATCH v2 2/4] iommu: Resolve ops in iommu_init_device()
Message-ID: <20250305175557.GI5011@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <fa4b6cfc67a352488b7f4e0b736008307ce9ac2e.1740753261.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4b6cfc67a352488b7f4e0b736008307ce9ac2e.1740753261.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095600_794131_C1BB5389 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri, Feb 28, 2025 at 03:46:31PM +0000, Robin Murphy wrote:
> Since iommu_init_device() was factored out, it is in fact the only
> consumer of the ops which __iommu_probe_device() is resolving, so let it
> do that itself rather than passing them in. This also puts the ops
> lookup at a more logical point relative to the rest of the flow through
> __iommu_probe_device().
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v2: New
> 
>  drivers/iommu/iommu.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

