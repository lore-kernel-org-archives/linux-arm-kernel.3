Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BB2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryDaMDdUIlJtmHnTUoGTHsXnTD+6T4wqV6GsP0/9lPI=; b=mUUKCyzYKRmcxYYMomP3zVyzR3
	1Vt3tAeHJqwviN04CwIm4CI3vNhw7ZYZPnFkBmOa1yy/e7tzrThaA2Ddtta3tpB1bUQATa0iQ50eJ
	JHMaWBN57AEGNcpl+NZJlzUarKDvVdKpt8QDuvXYkngNfsS8oTp8QTuDPiCCY5nlvg4rj4T7iED7a
	bSJmVa6GKqR3TDUvu/WFSgaE9SjDgATxkSJLu2gfa8DRXPAadKhsCFP6aCuMNK/aNHe/HMIZKcf9i
	f63hIC+rFRfDvVfetEYX4tqozMh/67uRry+Z8d5wyTF1eOJmRvJ7CgCp56q18L0I4kGgNnqy1865J
	Nj6qIaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpNX-0000000DUZt-1hq2;
	Mon, 06 Jul 2026 19:53:19 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpNU-0000000DUZP-1yye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:53:17 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e5cb052edso253241185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783367595; x=1783972395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ryDaMDdUIlJtmHnTUoGTHsXnTD+6T4wqV6GsP0/9lPI=;
        b=ZTcvCQx6u70qPLUe3Q1obEwPEO32aqkS1IeBOIqDFqoglbBrpCrpOxJp5mf7YBGDt9
         HqTUEbM1Kas8aXxYC75f3v9JmHTSz6J2+A/ST1kOOuDVBySrb/DEJOoiFzgpTe4lIAh1
         SCjTdA2pK4jsADumMykpXSOGrFeG2gevjx+DE0IrwNfE0LDp3JaPLw56GpgZfgRsjo5i
         CjzaZAw11JQ95jUY4pfOMClDvjwjHs2DtSpoKLlzoe2ArqfymiW9FidFcN6VE2AXR5Wj
         32V5JzKuSQhO/IKZpdASPbMdRcgUNn9cXQv5OIh8EhGR8o15d4Os+iUxzwuIHJVs4Jlq
         WLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367595; x=1783972395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryDaMDdUIlJtmHnTUoGTHsXnTD+6T4wqV6GsP0/9lPI=;
        b=UCuwQp/Ysfs+29dRdwct1CmjYXwLK02dITgNTKEWeVyhBqeJPm/juA/xROQKVlEse5
         IKDEzirBZSPbl8cjjd1qDPiuJurqvJ08QfqMTH0REdLxZMb9m2xT8kgqi1ukOR26G2uQ
         ShedXdC1J1aA6936NkgJSKHoS/6FNlJWaYZeNQgJjPEh8BJGzt1x23OSk8hWn+QSgHxK
         iH/xYAsCGlOaB6lz3rXEfpW1/3HGcIVVOEj+zGEDZbLOxq1vhoCK9O7ulOCPeZAI2Dd7
         KvV6/ncQTRM8pvAeGrRW/MCGS+dDfME9AlI+eyAtTUBn1Tnpd59ZGX9SNus4afK8/QGi
         6JEw==
X-Forwarded-Encrypted: i=1; AHgh+RqgDM+5/2k1UqHPr3bfjOwnIQAwtLeD1KDOJWN0UZ3pRo+1InlJoc3DdVIjv/52ICemV8bcwkFuAzbyZdu9ItPg@lists.infradead.org
X-Gm-Message-State: AOJu0YxH60a0ofHydNoZY+Xa+1KILErgQ9wlG4ji8K/iVn5Hjqix6AZ6
	5JgYqoRucTcwEZ1ko7hfJ1SE/yREINQEU/kZz8LEmdVpj7TNg6jM9C35O5tECNXstHg=
X-Gm-Gg: AfdE7ckrA8o//rdqfJRBQ1bIUmT5ggycZgbxdRkzWbFxKrsXvt6n4Pgd7H20gGKTDyO
	kLDRlp5+gg3vIgyh9hsxtIIAMvePo3z6z+qXVjjw+oiCnvLU4fegRaGng6Y27I80EepBdn043Fu
	m09/MyX1vp8EuL2DiCmnm889SLeRg199KNpSqN5FSkcYvb1hgpz4Pd83XGH9uRK/0X1ftWrTEgB
	rismYs7FdEtg7gFSeTqaZBHkr2RzQu8l1NPwCORhA4XgbMLPNm5E5i/LtwK19V5VyQoToWO7s85
	lQ7ZSu50TsMwyQFYVx1nSOLOJCuT6tyCCbcv/od2yO6fmhBIEbExJ95TPppq7K2EAEzit9CJuPy
	leWwTgcq0HBqHh/UgVbGhNdNoMqss6efAa/LimMHNFLckdG4AhrP7LEIStqB3
X-Received: by 2002:a05:620a:1791:b0:92e:4773:5a05 with SMTP id af79cd13be357-92ebb52f990mr273301285a.4.1783367594962;
        Mon, 06 Jul 2026 12:53:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cce037sm988196785a.38.2026.07.06.12.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:53:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgpNR-00000000euT-3bF7;
	Mon, 06 Jul 2026 16:53:13 -0300
Date: Mon, 6 Jul 2026 16:53:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v4 01/27] VFIO: take reference to the KVM module
Message-ID: <20260706195313.GE118978@ziepe.ca>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
 <20260706085229.979525-2-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706085229.979525-2-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125316_516758_A19E9FAB 
X-CRM114-Status: GOOD (  10.14  )
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

On Mon, Jul 06, 2026 at 10:52:01AM +0200, Steffen Eiden wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> VFIO is implicitly taking a reference to the KVM module between
> vfio_device_get_kvm_safe and vfio_device_put_kvm, thanks to
> symbol_get and symbol_put.

I thought we weren't doing this approach? Use the struct file as the
kvm handle. I thought I saw patches doing that already?

Jason

