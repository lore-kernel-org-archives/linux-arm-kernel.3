Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B9ACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sce070X88mUVBdz9b9Y4+DDwl2h8zEkLOKh5Apexnnk=; b=QXVpCvDfPBx47Tkn947FvfpaSE
	40BMo8VrsVsEpCBn6fH+ShWJwSbwzoUzdGtCi7ksM7XiZJBjWiw5yM6AWCoIZTRtHb5O8cQ9GUEQY
	ZqrztnFg7+DFNLMzVcVxKnlPQ3kDHhaVxRdF31+BfkVRZIUXrCEKaGkvI3GCj3wjSarzuhQnxaXRc
	Ng1YTAGbX4hB7q00LCLSEgpFjiX81z4MZ21VEEbz/v/Z5Ra6Qh8jFKbmgy7qjvnRtWOrQ5bUd7TmM
	Ag8UaSK/arJI12835RkPHqlEWBe+NOhLqVdBGO/DvIXBJgGM/vuJaunZefSA65WnYxqNAy88XDXn2
	GOcpLybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLr71-00000009okU-3qZn;
	Sat, 09 May 2026 23:29:35 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLr70-00000009ojx-0J8H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 23:29:35 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so49929886d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778369373; x=1778974173; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sce070X88mUVBdz9b9Y4+DDwl2h8zEkLOKh5Apexnnk=;
        b=P7bMZQydDdDmDXm3CLgCJ9UhanIG8Ev1KAtUHCjavtn5WEYoHD1Kb+iLffgXweRo3Y
         EGvCErH/DJ/6qOkywElPv6Tkq0IQ5wrXX6TNV0U3IL8/ksBcVlhZsYkEBgNGP95fcWAh
         AHu6irMNqwMWR1mWpM/mQ+9mvHgFDz/KQktwmBlp9sIlWygdOnWVI2ROH2/EGNHMCyOM
         jBYghvtv+Ie396bmI58C5JokvNryTnvv5KCGAALL5C+j4Nd3EDDAZmSVPk4LPr+8vPND
         wYvoQRXJmUrFQx7k2uzwjL/dSeTLTe405ELrg3dy8XamdkDhmj+0w+ZC2yBTR3q/CZ79
         CNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778369373; x=1778974173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sce070X88mUVBdz9b9Y4+DDwl2h8zEkLOKh5Apexnnk=;
        b=KZlJFNmtpeJQ/07XFa7fBsK5k6PZvQc1z+XDMYBcu/SJ0ItHpu7pWx3yBYuPcr9L8y
         yKAz0XnD0E1AYeO5QIR3G2T9nbbJWIlOoDbFyFp9P0cZpFTsPqeZZ0Z7BEkhbiS1qVVV
         W+8cythTIFJjGekFsgNTWWhiE65fgFE48kFTnCnnYUWNe5cpD2Qackpdm/NLq8+pqZAv
         0W79fgZjq2JQJLexnnrswMHZPjdJzlYl/zldKWhdtIftIT3DY64fRuoC+9tr6Ao5GheQ
         uTvG6Uy7vujyaMOSPku2YbUVgqX+DOJk8UoBxBT95f9k5ldPMtTysj9eKMm+80cwTvs/
         Z6TQ==
X-Gm-Message-State: AOJu0Ywa+wQKIcG/TH7ouEwrsz2L/DL1bH7nGBEl+DcvKj8/6CGhqQns
	DfJeVOwg8bN25kzQrRcQ7gMCi31MLftMSuEcJrW3ZvvzZkqxHOulEYOz/+uzP6U7BV0=
X-Gm-Gg: Acq92OHTcOZi47MEkc8xpq0QyG7IbfNrFwtRvmkEazAhleZtenl5ob28/yeXQpTpbxF
	CC+XdEn8sZZXBn8ZAmprzzFa6UJPvAYVALiwJTaau50OHpiaM+fH5ORgHPpekmJBj9pR7Aoj4tY
	yRcWIfwzDqLEvyfcFmaj5gCPuAvWxBkHazZWS05w52xlq0GJN8Sl0UFL2458UH7RmgtG2BkyEBm
	5tmJH7rmCey8PQZtFgqHV6CNy3wJHojruvLgHXHDIWA3PE3ozeM8/uEZNSBi9taOOxNNDF07paG
	NnAFvPQxDL3rcASGjAhsSdqj73St4FlmMVRXEeA+IfqCxLPT7FcBEHwhffiqdn8SdosgoOujyA7
	fay+wGrHR98/eBljPDt5LGD4++vHs08KgTg/GCxL+72qdEdQvbGceYCQvnHLH9xN1qicTH7F4ue
	nxeTcNDQTIlcNL59BZYx0bo85QV9/Hz1iPIWpnciLzlW33gCbQlAKNeqWVWMBKwrWX3UqK2RxnT
	/3DZA==
X-Received: by 2002:a05:6214:3a8a:b0:8bd:de6d:c33a with SMTP id 6a1803df08f44-8bdde6dc799mr202539986d6.21.1778369372915;
        Sat, 09 May 2026 16:29:32 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a33fab4sm53837756d6.23.2026.05.09.16.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 16:29:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLr6x-00000002NrB-31tQ;
	Sat, 09 May 2026 20:29:31 -0300
Date: Sat, 9 May 2026 20:29:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <20260509232931.GJ9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
 <afoeIVIGE-JjYy22@google.com>
 <afsPfEzgGtAFrN5P@ziepe.ca>
 <afxd8Km40A5ulZvd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afxd8Km40A5ulZvd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_162934_139718_76AC35E5 
X-CRM114-Status: UNSURE (   9.81  )
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

On Thu, May 07, 2026 at 09:40:00AM +0000, Mostafa Saleh wrote:
> But that doesn’t solve the problem, which is: At some point, whether
> eagerly from the page table code, through gather sync or a fancy
> invalidation array, the driver will need to populate a range
> invalidation command (tg, ttl, scale...) and this logic is better
> shared with the main driver which is this patch does.

My point is this patch doesn't share enough. If you do need to issue
invalidations then share everything below the top level tlbi entry
point and don't try to make a pkvm version of the entire logic just by
ripping out the range logic.

There is no reason for pkvm to need a different algorithm
here. Especially when you get to supporting ATS and multiple devices
and smmus you may as well just use the whole thing.

Which is why I suggested to copy the entire call chain into a shared
file

Jason

