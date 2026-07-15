Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE298C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OujpRFSpw/QAEHNMk5YVjM7csawMlwgTgeHiHNUlLio=; b=SGobE/Uayq4S19/4VG4iXhFUAM
	COMxLus94Kv+wqACPVwMQfvIraqdbcJBS0zMpQByXY2O8d9IsQWhh2WuIhWfxG2JLhYuF1HkPs0os
	qmsxvj4SXNDPnOk9/Tua6/pIAWV1gEHQOtdK7Mwf19PcS4/KeFLZCxLpVLPhpiq8LNOOrdzTWdCpX
	G1u7+vKx1Bwlmt/JN4IaOmgQlmyihiKNw553zh/Vwleb7Fk++iPuOweWoi2zI8H7weRX/vPiQpAgi
	Fu7DhhkZ53/+o6M1Rtqj7yL9CAJPVGhT7oJ3SwMoJjZVoRD1750jOKh1B/N6LTz6kd0uP+41zw3iI
	4rvJ/jJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5QI-0000000FntX-0eQm;
	Wed, 15 Jul 2026 19:37:38 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5QF-0000000Fnsr-1D6U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:37:36 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-9217d13c276so402332185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784144254; x=1784749054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OujpRFSpw/QAEHNMk5YVjM7csawMlwgTgeHiHNUlLio=;
        b=TrTcY+ByrQysAMegTkQGlNrCg1Zl1B1nxnV3m/T890zjENfSe+ZHCJDFgBkS/DsBij
         iD3E10pnqnp2Itd9IH9NPXEVpQzidfzhKM2GRPAQjfNTT9/rXNkOSNT6upy3c3bMfdTy
         rrirYUHJMap2OCpTa5Dlyy8ifi67sbRODpuOOHkr07G4YzzNB4zPS4GuRAOOL3kBvnVn
         iN42aKgMVRNqM/jTZuXssy2XCV19jgsmUJ518pWRJ7kNz8fhqn+PqIoepmyqCTylz075
         Yoqwlzw1+i8E46rYLMISu2tdyfwVFAiFr63bYsqF4NOZ/9hk87ACe/xLV4EBlyt3WiAT
         hlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144254; x=1784749054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OujpRFSpw/QAEHNMk5YVjM7csawMlwgTgeHiHNUlLio=;
        b=Vvdt23BYkjsVxjhiYp1Q8WhDJl0Gt7vfVKuFJlcy1DgNiNWuIVTFGqfMULQVZtHMMs
         9Lw6Y9082G2FCg5Whic40EyL7d22btEwnuyK7f+9U8mpSZsGXz3+gp1uyXQDx4U2o1Ri
         lswwbjj/G/7a/iQYnXCSGjxIgLxwcZOUtxPHUpozwsg4CV9LS0CSRR6pXLUMZfkOuA40
         tVcg63i9MTjpuJCdKzfWXrWORhVvPLZJJySJ3gwy8BTluLQssnws9tahHOmBkX42wo30
         IdWwy70rRvSAMb/MMmUPuzDQfzd92i+KDKRhxmGcTYKxpCJXBxVydWtOQRMmE3F3QxGQ
         Jrlw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ9d03rfJQA94eCV6tT4Dji6nbeMvPRGOArjYm+SXtladx1PquOwJKUdPQ2+oCiZRZrp551tCumufdqQQ/MBIp@lists.infradead.org
X-Gm-Message-State: AOJu0YwGmzFi4qhmDmBI+eLfBEqBnllVNT90dbmiLK1gwe1ogZVIXZy1
	diZqeECUA0MvZVKAJ938klIqc1T1HS9E1ndFBw9wXzKFkkfxYMSy3n2BonlsMa6+Jpg=
X-Gm-Gg: AfdE7ckp1xnUeA9eImDnvK0j7o2PBqL7MbXNki6/5Z9uvP0RlY537hk1SwruW1ai2c3
	lIltmYByQwnMBxFeKNRzS/oXd6lzLcBl9jo3DOB5XcOpXPQkMXgeBoQqCyVSauO2K+BVYOGhSqy
	4yBDFbUXSPCtT5ER9eDhmAUUiJxR9Qfg20FNtqE6V5jHEkXV31K8lX2za4bZ1HPW9w+zJjt2AC/
	O6dPlud6LHaXMvOnu38kh/Hl6BS01epSvdBxOBE43V+vWXrcJlaStJWDIHGSR3G+m6IqT+MRufi
	gaL77uzvvPJKs3JCtm37CiVxpRxqGPNJxKoPLqc5slTflaoOE/S/R51OL7TPJc/oEXch1XxmG1P
	e3Zeo/EmwpE5ppTeTGcMnMyW32kecFJuRaqNf0K9yH9TQ9LSNZtEatu8X5mmN
X-Received: by 2002:ac8:5805:0:b0:51c:12bf:d4a3 with SMTP id d75a77b69052e-51e3c2cc193mr94283961cf.52.1784144253535;
        Wed, 15 Jul 2026 12:37:33 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e9f4sm144211471cf.2.2026.07.15.12.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:37:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk5QC-00000000tnI-0nFm;
	Wed, 15 Jul 2026 16:37:32 -0300
Date: Wed, 15 Jul 2026 16:37:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Fix fwnode lookup lifetime
 handling
Message-ID: <20260715193732.GA210048@ziepe.ca>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <20260714060930.220277-3-xiongwm2026@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714060930.220277-3-xiongwm2026@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123735_472771_E9ACE23D 
X-CRM114-Status: GOOD (  12.29  )
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

On Tue, Jul 14, 2026 at 02:09:28PM +0800, weimin xiong wrote:
> bus_find_device_by_fwnode() returns a device with its reference count
> incremented. arm_smmu_get_by_fwnode() drops that reference before
> reading the driver data, which leaves the returned pointer derived from
> a device after its reference has been released.
> 
> Read the driver data before put_device() and return NULL directly when
> the lookup fails.
> 
> Signed-off-by: weimin xiong <xiongwm2026@163.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

