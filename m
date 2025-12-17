Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CECD65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNOaMPGrnsuzc/K3PgD8W+kjT2zih8ixOp0jwu7uQa8=; b=H2Tnn+JcSy9Jtj9W87Z3FFZtPy
	WqjRz10orlHvxOZgMhEXSLgZ0jwh0HwPB40jA1inExM93tNsV3CVAZQxtf3ThyxiIEyuPlsqbRSGQ
	qR+x1kZnt1MYGf5qou1QoLOzwBQ3PbrXKWaqtzhi1y5nF6WyQ7JnJaQNKdJ3EvLwTfqiuvqMnoVhD
	MgsR8Z2OWyYSYbgcB4LXPaFIlR/sJNaGeTqBgt85u00Tt2VEjtyKzzMEc0N4ZBHybtPONnzuo+xYr
	7u7YRnRmJC1FncXM9TNTBrEhKYpekmw3PqQsbcUE8k7mchpwY4iMTmFMY4AltzsJ1u/ynHo2EiMcH
	mNixGkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVs5E-00000006tiS-2gPh;
	Wed, 17 Dec 2025 14:00:52 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVs5C-00000006thk-2UUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:00:51 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4f1899960f0so59869251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1765980049; x=1766584849; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNOaMPGrnsuzc/K3PgD8W+kjT2zih8ixOp0jwu7uQa8=;
        b=BLo7ALaNYOJLUFrkcDiRhRDJa2bRk/y6bq5ybN54qyNnz291rYVMqTghx61hpTZkrQ
         p7aHwZ2KBqjpM9eCJJtyhUxlAzJgxara7pX4CrQJx3pOadtU7hEZZHUCDILRofmkYQ3u
         KdowXG1Pu8CApD4USW3PbDPjiR8UIdY6fxXWUg+V3Xso4LjMuSUgfiJ4OsiGkOzfQZ5e
         NawNc8Bv5O64/J5XHnLlfx9JrNqszkyehKzqOkmJptsKIqqWKT5CGnbjWnnVI0BzHBZ8
         hfUf7Ipd1yEPlNLv9y8KJwvpYYxH0iFpBs2Bk+LapGZEQcmFxJhVKbZO3D0GO04AJvCP
         OHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765980049; x=1766584849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNOaMPGrnsuzc/K3PgD8W+kjT2zih8ixOp0jwu7uQa8=;
        b=jiP6ENW0KoIELnUdJB7ugLnlN3UOKl7P2xh4VPwGkwChjPplz8jca89+C49kKWYV4B
         MICvLb6ZO+Q67eZriuF3/2/6xmF/oeiaxmumLAhVyvrf0hgaj0CbtCzQKE18KaagpCl+
         c2Sv+pouf0FsbrmEcO7aPl3SsoES0m6Mbb8znwFXbouiFVglDeZY3DFnhzQ4/qI1Ywbo
         ow6wV19D+x7FMsg0H/Nbvq5c1fWgQKVmvKLA4q1JUsi0F5HqFADOVaE5xk7W4QMrXu95
         5+EWgrIAKnU3RlAzBWafQmtMv8rZCyylYyOin4oJP1HkKhaX3kISx3a2ByZaz4rogRnk
         q1DA==
X-Gm-Message-State: AOJu0YwGwqDodYbIPBiqXEZv3KzEibunGZ4dCjjn76nQQ5puxO4xeQiD
	p/QrrJ1lF63KNb1saSTRqYuDiiJoTZNLa4WwXAkuXo02Vb5yPk+DqdvEn94qqLyrtW8=
X-Gm-Gg: AY/fxX5PqkSY0mBgRMQcTK/ApyLgaJ1E9svjCkCB2InCXBF0OFkUECpHtahjmJmWUyz
	5JsG94E69XhudS2Z3oAQOx2hswjxcdG+sQUbZTU/GT5X0bMNrByLhw/P7env1qxfCTmN+U/o51h
	C7MfoRtALeeGViEAatexcJAUPd2BCCDVOamYOHyV3a9FYSvxNhWkjSP6aZfFaJzp39JUNC6ImL8
	5jH60cy0c0nGiL5qmwUoGpWN//b3XpArlpJPydrEtvpIpojSxtZqKwHUEG/wfYG/MW1WZf+rN9F
	LR2efebF7ZagVvSzC3AjSDboiR2njp62gSaTHeFw1C6luSh0dzVMowScOwkRkyHJXZqq2C+C1Ag
	HsLYz/yfHGtGs8Rqe0OlgsL0vEMVqQ+ckGsHUBn/GF+r1+J+CUV7gdCa4Acftm1TS2NoniesM/u
	Vg5ipEgVyvqmdiHfQPDT12JAkQMdtftpYRrsoSglgWlmBbebi3QmC/mGq/
X-Google-Smtp-Source: AGHT+IEn7RK/pIYtYXrPbKMGVYlcUHkadYn8QaTKBX4Kd2HwfE2NzoNCX8QU7VpeXmpS/UZ6Pqr5SA==
X-Received: by 2002:ac8:7515:0:b0:4f3:4c1a:4c49 with SMTP id d75a77b69052e-4f34c1a5041mr45692141cf.48.1765980048007;
        Wed, 17 Dec 2025 06:00:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a85eaf02sm95103076d6.40.2025.12.17.06.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:00:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vVs58-00000000fUk-3YUQ;
	Wed, 17 Dec 2025 10:00:46 -0400
Date: Wed, 17 Dec 2025 10:00:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 14/27] iommu/arm-smmu-v3: Support probing KVM emulated
 devices
Message-ID: <20251217140046.GF31492@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-15-smostafa@google.com>
 <20251128165616.GD812105@ziepe.ca>
 <aTw6afum4eqr5_e7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTw6afum4eqr5_e7@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_060050_639070_CB13B901 
X-CRM114-Status: GOOD (  20.37  )
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

On Fri, Dec 12, 2025 at 03:53:13PM +0000, Mostafa Saleh wrote:
> > It is OK I guess, I wouldn't insist you change it, but I think it is
> > kind of gross. Registering the iommu driver against the platform
> > device instead of the aux is pretty ugly and denies userspace the
> > ability to see that the hypervisor is sitting in there through the
> > sysfs topology.
> 
> Yes, that’s why I was wondering if it’s better to keep this as a platform
> driver and create the aux devices for the parent(KVM) but that was really
> complicated to handle the probe ordering.

That sounds worse and inverts the required probe ordering.

Attach it to the aux device :\

> > Not sure why the commentary about built-in though, what does that have
> > to do with anything? If the aux driver is not built in then it will
> > just module load later and everything should be fine?
> 
> As at the moment the KVM driver doesn’t use drvdata(nor any device
> resources) and the main driver(aux) does, but if that was a module, we
> can’t know which version does what (if that changes in the future,
> although unlikely).

Kernel is monolithic, you don't need to worry about people doing silly
games with modules.

Jason

