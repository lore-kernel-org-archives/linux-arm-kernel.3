Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB982C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=; b=Dhb3WREyK5KVkoYM45KSV58nvN
	Z86hoYmDtaTT7b/cyg4xcntM2pBwit6V3Aakizb45lPzKiux5vFjFPZ9cnFpquG6H7zORQIjymKBo
	6LnW9HgyA7tjtluf7VFgvE8QXZzn56FBDK8PSC5/6IYbHsSQRzgNpqd4Ek5lGIneJcvPxIHjKk02k
	Gnzq+t8KTVA83kvAJoDmBs8YOTzDvEmwZEMKtAkpblKdCYBZwa34KBsZGX+NghpyzCuk9D6Jk6VtO
	0erqjKlz5+D2XuubusBKUCUCl/is9es+83fqBnPuAuTBcDAn3QORpxYtAeEWiNFB5WhX60DL/g2dS
	QZhPhFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSEw-0000000B7eH-39f2;
	Tue, 03 Jun 2025 14:03:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0a-0000000B5JK-1lFG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Jun 2025 13:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=; b=pbO+qoMuFoB20sMbrFR4LpAapC
	4hBaUDWZX1flQHIBnmFP2NUth5rGF3MPCgieN5OsT46DV67odi9CB9Yx4YPcw+vQw8/zhHc8YqZNM
	Eb3CfJnlRK4+ItKYg2bdSNS53pkvs4wdrVDZKovw9ANBiBq5oB+HIsEssW7e3Bk1bQsxF5Idg3ESR
	fzB1wGddcOPsNShPRdYFUcrrP555012WiRJnHo1BGOl5w7nVVDsEzp1hT9Joy1jmKE6y5wvXXFbbV
	vnUjsJ7U3deVUt4lRg3wTDxtTtkBxb/ikLnpky8x3xVUh3Rr2q8/una5jYJF5adGkgHI5NmB9Mt/t
	Mulha+CQ==;
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS0X-00000000lZu-1cYx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:48:51 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so47150316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958525; x=1749563325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=aQBA1l0pR0YWIQXZWttLaAJCMmPZZLr+4zJBGF0AmHv+P7MSfmJA52FGl29Neib4Vp
         bY5sl3kt4n+YjAYp4bzVvIjD5M0gs2PKhmsLzqCPSoFmf6mq9K3KhEyr1mTgEDM1sQPP
         ag7DANIA7miFGBgY4mgJDErzQzhJCJnvUui2kYxIzSQZJzCAi12Aaw0+98sNhK59puaU
         sh8RSd3CfCEsPn/kHUS68ibBQgams1cEwqb8gdxD0wmvLvg1Bl9cE3ZJCByI7Bc4jYzH
         Vy58bZirD7FhiNdzouxOVutqNquVzDBchVHby86edLvhtQlGXldEIwV23CxF4Q94GCpo
         usfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958525; x=1749563325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=Ga0EP0dWIJKF3fbWlbX70WSMXqdGwkgFRbbQurpTvkQbdiuoMeqVq1ywzneUuJGarB
         vlaAhFzkTjtf4KNqhhwlYGhuK2VcWB5nst/x/1/Wt6A0kJmEiiAFOvBRqdgSvDHIwuZ5
         UTQk0EZPzFZFOsnyresqQA3T7+e19pyBVORdlDAOimI0l95e8ciY3Jl/JKLbC0bq7OIY
         FBxZCAGt3HuNgdUehNNraiQHIy9ZhmGRHYAE2U/4TKjou+X5ZoM2isQohL/2R9o5b1rr
         mtrfHCSkhlL7oJwomdlvRdL8E9nzsdoe2T4hoLi0LQTX6VWk2cBTQ1HsiAMZcrPKLIaK
         DoeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsduFS5VMazjN8bjbVgc+MVGolobYfBVpFkYE8ammpsrwVb8fWc0sI0eprj/KS1sgDzNc8HD0eZ+oLG5BuEbJY@lists.infradead.org
X-Gm-Message-State: AOJu0YxQTC9buiNZjxzi+RimdzheWs8F3ta5VDRDbWHhAOKGQyo51mOe
	46SKO50HuhUlnuELV+Ou1B5b3gBCzGYXMfNiVwzgMR7PkqfNhEz4RB9JHzw+ayfXhc4=
X-Gm-Gg: ASbGnctHiz1X6YGIP9iN9kNu1jFUAj+qDVTfi42ZNTC1JkLkgmR77wSS0X643bcpOmb
	Dv/87HIMt6IfL/25d2tyNLewyfp5JQgSM4AiQuiZlBegbVCCVhTkK+w3fETAs3Hqi8ORnkXke6Y
	Z3Vbj0dtne75ysWo3JU24G+jyYeg/IQ7FBrwrTmMrStAl49fqM4Yx+cr8oSLTkzDyS93tqrE1mu
	ep8du27ZLFHxlbKpdn+J4gxzp5GC2ishGDeaNymQiYkFgWJqJPFwmr93rLhkDa5qYXPfznlTDAC
	SK8q5kHePtC9hd6XOKBLeGs5NgpMWJP4aWNovMHr/TYz9eCU6VkjL1FEN3cIJ6My8KfIq/dhnuo
	vTtZoBSYAG15cx9OdTdUYoHNPLok=
X-Google-Smtp-Source: AGHT+IH3Vn4y24ccOnNjvyrMKRdXMvoXmINXxWtKUHHRDjsnlypx2qCEJce143rhCfMATkU1PKi1PQ==
X-Received: by 2002:a05:6214:27cb:b0:6fa:acc1:f077 with SMTP id 6a1803df08f44-6facebef794mr265266426d6.35.1748958525108;
        Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10e844sm842209085a.49.2025.06.03.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0S-00000001hBt-0o7d;
	Tue, 03 Jun 2025 10:48:44 -0300
Date: Tue, 3 Jun 2025 10:48:44 -0300
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
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
Message-ID: <20250603134844.GI386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_144849_567530_3018B700 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, May 29, 2025 at 04:32:09PM +1000, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

