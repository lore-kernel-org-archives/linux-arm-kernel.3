Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D413CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nb42As4a1Tt2TakmJwcUkP/IrOzz7ol8ZmDuilSE7QY=; b=IIJh+6I9fw7qds+Y1Jwp4TZqRA
	musaIhyEfDJCjJro4cY+T0owhA98lvmqd84xDeFxWrWYqRQM2sXChKqsrpspqKsKGdTHzKhhvelzG
	AcIVn8UTTvN388HRolRgNqNHTyg2+g6Wm2TJNUcnxDrg/7gp1dVoirgEng/zwga/cUMdvK53RTnB1
	H6f0mAN8q4z2LQHliwSQ5V5/KQYxowszCEwwkmFW2UWv6WV6t6jk6FYO1n0vy+fCQDZu21CEq7/xs
	0awYha4+VeLpDHlb+IDikkDR6HOs4AnUsHvmD5DFKQOVgb3D8/ujAUYgcIg6M8UwGgbwCabkQeRym
	RbcWwW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMa3-0000000AMag-1Twz;
	Fri, 25 Jul 2025 17:51:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMVy-0000000AM1K-1Cro
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 17:47:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23dd9ae5aacso11905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753465645; x=1754070445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nb42As4a1Tt2TakmJwcUkP/IrOzz7ol8ZmDuilSE7QY=;
        b=2P2n+NnP0rhi6N06fO8YoLGrqqnd0GjjCk5gUUatWS4YzOFbr9TIrOsFBRvnmJO1Do
         Wd3JW6yujriUbVfV6TBF6RJpzwaJf+HXNZCUH+0wlMU8PA1JRorW3u6kJPUYQ3m17QC2
         hBh+nVpsFcDHKzOFCV6qu8/pfgS3+ELKLdGi0HFBvcI+OSa+6Oo/AB6L+S2EQ8vwvw/x
         izOXoiuD6OdfEzHw3tCUfhX2OOGBDC0TQY3k9EcSekT+k07dpw0036eumlWj5NLCDD4Z
         KzS83aB4C5MR48OUUaAhquo8HkoTrdJ2CSsi2fzXuTgubI+5nR42BvImH/rUs1cU61dA
         I/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753465645; x=1754070445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb42As4a1Tt2TakmJwcUkP/IrOzz7ol8ZmDuilSE7QY=;
        b=X5NjB6zy2QXiTJOGTWGWuWTD53bn1RhIIoEfAT+Wb2bsZiw4Oq2HSbw/JvDVK/h8mW
         9dUoPUyCwAwbgbkLZ5zoE57aEx+rNRN1Fq08pMtnbH9IdglacAiq44GNqrWJSHppWbPg
         Cx5b36eT1OAHxEd54kWQG1ZttL2PjCAy43nTyPW0dF0z86qrkEiOY/x5AFfoTiceEfCp
         i4cuVomtngaqSEKdBBNUUD1w/Bp4qlFCrdE+XAhmtKf5/dvCYT+k7ceaW7EENKWZA/nS
         js+i4iMgMvg7frAnCL5CqO6RZnMm6e43wuYTQP8DhqKyYc9tHYbZEcuKWxc3u+gC3toa
         VUYA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2kmuy5KnkGYAb8jROyW23cfodLedp8fTJdjI7WpgIUtE4yRr6HhfGt4GpmyGuBL66RE1ukLuFy8ImDIbeMFX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt3Tge8kABv/Bspx96qzkaPEmJpgUs3ImHrl9brtL+aoZUN9E2
	oWPKdvLD6EBmH+9PU0yiwydgmOlixS1obFi4bBlDCLSffv+8R1Po/O5CTn7Kmv9NHbJ0lnzYhSD
	lcoX6Og==
X-Gm-Gg: ASbGnct6w9PAsMfduj+eMn5YqcK1IWvQpneSylsXTTUqbPVoBQeGrEgA98TQ6fFHGG1
	yISTqe/2Kzfzi0s2QBT7T7pgpyp3CP/yTpRDZK9L6MAQxre92aA4jdo3E0YZHlID3bvqe1wF99L
	loG2ysKF4N4PJal/2PN2yof15qgmZFpO4V67Kqm+QcTpoc8isO+fqZboF8vs9fvwDOd3Rj+GggK
	HypFvjFvmF0qtTKCFjTsVvyoqGabpdKIA1/FlF6wuHFCy8Cd4JHkIFVMzJZ/EbMsFMZmp2QdVdL
	tfD+t8FMuZPzz4KL5L+1EkDjB14qE3HLg47CbimCCPnYV4VZc7XbLWOVbp4hcSqSX48xrx8PHhk
	4nq4uudBR6y8chmd8FDbr8xgMHIDNw2D/iYuRzfyG1KQ8sb1OIXBVGpK+
X-Google-Smtp-Source: AGHT+IH6CzP73NhGeAVCvr5tnhQ0xcNucVsA1Zx6VNhDEe6MGsxi7hQ/IPtgDO+K7Qiu3C7e0YT0ug==
X-Received: by 2002:a17:902:e889:b0:235:e1fa:1fbc with SMTP id d9443c01a7336-23fbf677572mr113455ad.0.1753465644867;
        Fri, 25 Jul 2025 10:47:24 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm1791005ad.167.2025.07.25.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:47:24 -0700 (PDT)
Date: Fri, 25 Jul 2025 17:47:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIPDJyuSVpqMV8sn@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aIMR6xxR3Jdpy8kX@google.com>
 <aIOq2ysFPfZsNUix@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIOq2ysFPfZsNUix@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_104726_325137_300CD812 
X-CRM114-Status: GOOD (  20.04  )
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

On Fri, Jul 25, 2025 at 09:03:39AM -0700, Nicolin Chen wrote:
> On Fri, Jul 25, 2025 at 05:11:07AM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> > I'm agreeing with all of it, it's just that the comment says something 
> > was rejected in by the size op, which raises confusion as to why we're
> > in the init op. The init op rejecting something due to data corruption
> > is a different thing..
> > 
> > I totally get the point about data corruption, i.e.:
> > 
> > size op -> returned something valid
> > <data corruption>
> > init op -> rejecting corrupted type
> > 
> > Wheras I was just trying to understand a case where as per the comment:
> > "Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()", 
> > i.e. ->size op returned 0, yet we ended up calling the init op
> 
> Is the updated one in v4 fine to you?
> 
> /*
>  * Unsupported type should be rejected by tegra241_cmdqv_get_vintf_size.
>  * Seeing one here indicates a kernel bug or some data corruption.
>  */

Yes, v4 looks fine.. but I was just trying to understand if the comment
was wrong, didn't necessarily need a re-spin just for that comment :)
Thanks for accommodating it though.

> 
> Nicolin

