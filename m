Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45177CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcOSrIvcAcDO9WkkqWoNEexjLGDP5koDwQkJhDioOAo=; b=NpHNn29UgCg/L+5YodrGEuxxzP
	oVx0IBh/JJGjHAvML31xO8oyDf/IvALIbJ/7AKwKqN28ZfaU1WyjrrEEaPHhOM3TEkQsPf+P7EsMl
	sIVNVNXbug14hvCvEzUwmutFhZyoEes4S8MjX0NA0kMQWGlMaiHPx6OOUNI39rUIFb9NIWpgjeXKP
	OKPaRmbpe8qvWqenHMfTWr8K6A4W+taVLIj7XlS0E0GuqjhwPoUjoAMHsNlEsP8GfI2oRkRiwcXkr
	dMFDnWNLVHg+rY1dnd7TJcDrqEoZ7smw+TZPaciepA8VEhUhwIyUW7M8TDOeGJipB/tUkYqsm6JY+
	KV/W1Ebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwvr-000000093Rk-1Pew;
	Fri, 15 May 2026 18:06:43 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwvo-000000093RA-2298
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:06:41 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8b701756684so13220266d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778868399; x=1779473199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rcOSrIvcAcDO9WkkqWoNEexjLGDP5koDwQkJhDioOAo=;
        b=Bd6S/7mZkyvAwZ94Tz/DSdsVWfMqfR1AozZOwcwS+YePm+h2pkzafWWI+lXyqlkdcY
         mU1FH7QGFTgRa4svouHHIKHfkSh92MvKfpYASyOiG/8hFEgxOrhMViqJg3EzIgRHxiSp
         Mw63euwJOpTN5ZWxvjGL95a8CUOP9rFQJKQ+59H+EkvkKucJfMKHqGQZ2gzj3PNtrcpw
         pFPm3euEYtLMVytmdk+jes35q1y1vsM+iHIMtsBISaFFXzokdbB8pOnmz8z/tESuc4uR
         PpvzPt7SKPlnpWwYlvap84KmoudlShm1emZGqZXhyX/iJPBzrap8GP9pbfMbFKd7ISIW
         vlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868399; x=1779473199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcOSrIvcAcDO9WkkqWoNEexjLGDP5koDwQkJhDioOAo=;
        b=KA0YYxWXzvafeRETKLdu98mhTl7nvzJdC2C99kdSD3pyYM9vXnarsYd0AyEhdxW8b0
         T/gW1GxD8fufbvV+cAoZ5ETKUfCqdIQpZAJ1W2n5PEmgjDzchvl90g3/7pbN/Vr90bBi
         UdN4wkUJiCe53L8Z8fh/N/XC48lKtBwrTpCLuRdrJC0frGsDPsghk3UC02aEBsy1JY7E
         hTqBmpEJnYCeT9BniS74z3IRIJv/iFQ6nZZIrQlsClcJzO5MSdSpQwUhCiQst5KJOWUT
         TNQaTh1wq58vqC39+zNW5ZdGUlndI4kga2TBRKn2u6mL3MYswpsXt364tHZx4mv1lRc0
         wttQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fyHtP9J2Yxqwuu0UfnmmrSfVcuZB5kvA30z73ClvS21olRxHwpeyejVfuSv+f8iXhFYRCieJAwtDGZTohUDRk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/oSRia3pX8faSw8VmgCbKZPyKgeWB/Cguwvup9TmlSKeRAC+n
	VS4tXRmvQUJiPrM5cmc06Pz0I8pANi0EWnmxBzP2wQQMfjtHJHYfIrtGoxEme7YxX9o=
X-Gm-Gg: Acq92OEIXqIGKGeZDUEahza/TGJQzBPCYqLV96BLQ9Hhp/6jhDVXMpVQeu+ZLTMslQg
	1TADCJL6ozGpe0QevuY5phhDuWqZxMlysHG0cwHasVS/XxkIPVxBqFK0KrlWO6hUoG/CoJyVO7A
	eBB/VT1UfS7OwUq1QXlqgCRuO4he0pasWJjfR5q3cqV9FfiuqGwc4FQk8y0aNDjo5vCCrnNMUgW
	Y2RbP3q1f9TKegA28PxhPAEeH3YwxHeuQ5jXxII2pppO9yt8fuoTGs5xzPN7qOQMdJmygvSQwWi
	hhKZ408zwUpxONttx/FNQpap/z/YCj87Wd8+y2qTRqXRftQx6iK9CZA03fjHv7K0AJBXCCdmbrA
	z0iqFha0uIgmPr7FttvbOPjmLdAsIzEuh+YKMjG01ReJ7CYeOaQfB5XnO8HLt6efvfLxu5JejjT
	C91GqQQf3qD6zvDsEnlQl8S2kG/0SXp133xHK1fNTX1YqOao/21Z3RCi8G/YdMm/G0Y4jxKrYX9
	nXUiQ==
X-Received: by 2002:a05:620a:a092:b0:8ef:6b87:5c52 with SMTP id af79cd13be357-910b14f8cb0mr1004416585a.38.1778868399150;
        Fri, 15 May 2026 11:06:39 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c35cdb1sm58747396d6.46.2026.05.15.11.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:06:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNwvm-00000007s92-0MaY;
	Fri, 15 May 2026 15:06:38 -0300
Date: Fri, 15 May 2026 15:06:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section
 mismatch warnings
Message-ID: <20260515180638.GH7702@ziepe.ca>
References: <20260513145425.1579430-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_110640_626156_7AE75722 
X-CRM114-Status: GOOD (  16.96  )
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

On Wed, May 13, 2026 at 04:53:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 has gained some more advanced inter-procedual optimization
> techniques that enable it to inline the dummy_tlb_add_page() and
> dummy_tlb_flush() function pointers into a specialized version of
> __arm_v7s_unmap:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
> ERROR: modpost: Section mismatches detected.
> 
> From what I can tell, the transformation is correct, as this is only
> called when __arm_v7s_unmap() is called from arm_v7s_do_selftests(),
> which is also __init. Since __arm_v7s_unmap() however is not __init,
> gcc cannot inline the inner function calls directly.

The selftests should be moved into a kunit like was done for pgtable-arm:

commit 699b059962add22b2a324645b6ae2a607fc1a93e
Author: Mostafa Saleh <smostafa@google.com>
Date:   Mon Nov 3 12:33:50 2025 +0000

    iommu/io-pgtable-arm: Move selftests to a separate file
    
    Clean up the io-pgtable-arm library by moving the selftests out.
    Next the tests will be registered with kunit.
    

Then you won't have these section problems because the code will be in
another module :)

Jason

