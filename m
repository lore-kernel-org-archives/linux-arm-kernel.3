Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539D5C83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=; b=xWhQPXdqiiyKmDMINJymZOWWK7
	W5QtgFjpJg6AJyPL80nMvFLatZKfwYXv595gFZ7ta5rZhyKIQYmIsIyoCmoxoTPojbIIae2Wr7qSN
	RgdWgVdw6gWkIuMtU3rmNPnFizP95UuF5jFrA+er2BwHCEwbRCgetHqJAMrpgNmTK4aFh+skKNVsC
	xjps3V7acM20sEtYRQNq48mgNPo0ZUE2s3I45PfVCIHnIgjPlZpMN8PVurInYMd4FvKeyQW20eXc5
	UGscPvjTdZjCsyP2PNN8YaS544WWkJkP/bUf3vD70hM79CIzFSrKitBwWbXzJ+qY6rii5u1NC2WT2
	yfgMN/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7oi-0000000GrbG-44Tu;
	Sat, 05 Jul 2025 18:40:52 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7mP-0000000GrT3-37hG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 18:38:31 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5b8d13f73so195149785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751740708; x=1752345508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=;
        b=VnBWAYlipN3Jc4b71hyzHUvCpKPFIbrOeRBpyVAOI706eyEKmPaeX15QBc7eWkxGSx
         hlJBeYAVulaG59ughn+u+XUiMKVqsdxnEemfLcDqBO+tKGs8VrkfvV7qW1zLQYRhzqLe
         R+MdUBhpTcsbksxCP4EbIaH4oxTkzbZMm+hzT7gju1JELbyjB79lLGl0qdQzKQivbK4n
         8wtBL1Exc5YrlKaiW1uub+9U4lLhlqk6WZ/fOO4h46SB1wm/WesIwcnBfo5WqtTg/gUn
         A5Lg6TOrggR4+fs5pJRiU80BvxUR1HRb6NHC4LtiJmS0nuINNalaTjROtIn52hSpjsXV
         p9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751740708; x=1752345508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=;
        b=Z+ZHug0GzGybG6rNKkU16paWQJ15ePW+moCG48IjjHDzzedheM8yqzqvPiFWntnd0e
         O7H1ppzNc127BxvdpqAQwOeUx3yif8QjeKT7r3FVPKRV3u5/ckofFuqkesM60t8a/Huv
         n1iyzzGQlqlN7N9F5odT/6ynf+IvOsnusxkmjvSK0r13oQpn0iP2fdBP+lzvk8ALY2TP
         cGJgpcn4P9jhSYvUQM8CRniUPKJlfkzWrid5Ir89SGhlXsHUVG6oBa33V5b4xYpqLR4w
         elQeds1vvgJZvYnFruerAVSXRH/p8WOxMy4adIIdg27W9wHvf6bOuIKYnxtQnz//S6LD
         sy/A==
X-Forwarded-Encrypted: i=1; AJvYcCUk8GnjvRub8hfvhOCkLAV90t29B0VPo6PNX3CIAPp/efzHGZf4lHWvhnRP+EjLWSZ1cZuqm4AtgPAqaPaaRoEJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6uXfTWTG5aua8aY1CTxAxQe+wkM+8mjf3GwDMt0k4WLn+MEtd
	vRvt7QMpQsbUboBfJGNm2F0lkOZ0ZXK/8WS59/9iq3smr+w05spDp3Ck1N+C2IvVG1Y=
X-Gm-Gg: ASbGncsqbU1NvIT3X8+jYsnhQKUu5MrqhpXz/dKoCwBDffTYvk2PqqdBOr8Bb1jDEWX
	AAh65Hs/afwQAWfBK86JojFVR/zz0wy60vZp3RnYW1r6EAVmV42QQVpogN/OQTte+RAolTn1gnF
	E/2GK0LXJuNboXvEftaM9SG2awyGTrit8OsYMpi7o/H8OlI9nDcNJYr4Ah0eXqk+B36YgU0njYz
	pswj3a/QCg1IBoIFWGi+RvFKKALr6GyApHWcg0N090+2tHJBnk1jdjkrZYxlMMHn6IFXryhf6Sr
	kyZxzPPfbwOuH2TPZVCbpGYUFrnr8qiiTU3ZGJSKR9Ysf2ruF7V2YvZSM4UbIjFnKSjhUmcefh8
	oOM3Y69Eb7k0NGcyDcu7ilsPqXAMZ3tUWSGn1fpFbNad1PlxY
X-Google-Smtp-Source: AGHT+IHGynn880Btao0rr5ATgmcaLhy8fafgWIOLP+yaNkVftZqqbIrm82pa3BfiHgQu8aK3kR04IA==
X-Received: by 2002:a05:620a:40c9:b0:7d3:f0a3:d8cc with SMTP id af79cd13be357-7d5df169b32mr814175485a.45.1751740708064;
        Sat, 05 Jul 2025 11:38:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm345886685a.57.2025.07.05.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 11:38:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uY7mM-000000068pv-2jB7;
	Sat, 05 Jul 2025 15:38:26 -0300
Date: Sat, 5 Jul 2025 15:38:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250705183826.GN904431@ziepe.ca>
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-4-benjamin.gaignard@collabora.com>
 <20250704175425.GM904431@ziepe.ca>
 <62cead85-2d50-45f1-8020-7aea77f6833b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62cead85-2d50-45f1-8020-7aea77f6833b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_113829_930853_A55A87C7 
X-CRM114-Status: UNSURE (   8.88  )
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

On Sat, Jul 05, 2025 at 12:04:05PM +0200, Benjamin Gaignard wrote:

> I would like to avoid that but maybe a static spinlock can solve that problem ?

I think you can't really (technically) store an iommu pointer in a
domain and not prevent it from being used by other iommus.

Can't the spinlock be in the domain?

Jason

