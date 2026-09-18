Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550BBC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+QN5KkkjNb5WJjRU9SzJ0Y+OF8nxYNyQV24JJbuLlA=; b=pa9J7EH22zKybo8xplk4xWy3K0
	qRgojVpYpbVYe1OzuBsw+i+m4FA2Bty1uiV+cJay69RIu7vCTpc82GiDjC6Z6KrGEbPEuLU2jeGRd
	pVG4tMrF4ILWafKWne9MhzsydBpK1LzxBWFt9EveCen9dJa9q+GPFjdpWb3TTxIt0Rb8y4oYXz28a
	cilQUIq7Xrimsgw1is6ElNPoPLb4bZALDrKUHPukHgi1zOA9Q5KOHmHzU8PaYCQHbTC3CoBNeVoa2
	Iq/+pM1KeFxhqZUfwyDgtgy+7qe1qg90R79ipLB2NNlYdzeuE4fxUUR3Vh7hTwfFXhvPhla/bKLDc
	/3kwvTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XRM-0000000EL4E-0yGE;
	Fri, 18 Sep 2026 12:11:40 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XRJ-0000000EL3U-2vnK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:11:38 +0000
Received: by mail-qk2-x0e.google.com with SMTP id d75a77b69052e-52fb767cc97so6160831cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789733495; x=1790338295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+QN5KkkjNb5WJjRU9SzJ0Y+OF8nxYNyQV24JJbuLlA=;
        b=OnJfhOSuB1sTVC0BN3Ep/yIt1GUmFbjQBUd4CcpY607RHmCgVey0rB1oqibjEIWUkF
         PQ1vaSl/iXWzaz87zX6ALB0sktt80tHv0sNsouytdRwtcmJ6wwFvAOHCdLAkmvCvMyOl
         IKf3Rf1FSjWsRmI9pFVp7FXd6JrhKYWx5l2c8+afwSrWkg3uYVmaul4pK85fGxIfIIJE
         ihgCm3IX72bIqr8J5MTEpXISREb4GXB2C1XpTlokotLdo9XWSz8StETadW+uaVOOmSpC
         YW6eaEk1P9qW2aRxx5GAxTj1256gRpPdlfGtU4K6IR2V/8ANSaUgRY0VKXlc6bM66q48
         WNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733495; x=1790338295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+QN5KkkjNb5WJjRU9SzJ0Y+OF8nxYNyQV24JJbuLlA=;
        b=MTK0AomDtUOm3jLnIbdnnhLV7d9PQJByVfnwleRQo67nCfG5XCfpbqy+r+07jnZWIW
         tOC4CGta9IoEuKZqf5/pzarzZGaYBkxLiHBxmqrhRVRsqfWalYAfCutXOb84sqpFVUV+
         LXpklcRwh/jn8tdSN5SJ1XEef6F9MbVhM/EiFGcZsvpoXGjCvPAbRQlIAlet9J0ClHAA
         7Jk16DLXEqVcVT29hidkD/34YHAD3NO4o5Oe+RSwNy1AguXI7ieH2M8o7FLfool5Hdni
         9vNMDxmnjX7frGLz5zwjpgrv+gXC+HrxsFKl1PJG1bqRx9LBdyCVarbH7hdCq3nxC28n
         la7w==
X-Forwarded-Encrypted: i=1; AKwUvBymHMwoiiRZndgckTaNoz1Fa74ERlUfaqbhRcYIigwrOQSJNqcoGZna2lWltwJR9WjQQuxFSumCU7U/IZb9j/vk@lists.infradead.org
X-Gm-Message-State: AFuF++kzvIU1gsr3HchbRp2fr5vxikJY5EixoZq8jKPUt8UyDhYDRrzk
	5LmL8tDWepYPfJtvzxLOYGzDq3ikEhWSs9++thyQy3L3DbImIiorxAprIyN918U4X6Y=
X-Gm-Gg: AYBFou3d+uxN+fHwvQKgrniubZr+VWqC4fZ4XXnwgkIwlLvzP5igNN9Ew6SHwSJEpir
	cstdZmpWyIj9ONWAmJSgfp47WIlohIO34j5slr9dNlGSioqubKqz4EVsSq/XHnlq7WnR5L7YQPx
	KhWZm2WWKLimfH9dK4PbvbznX3C2kxTzDhpPwBBH9rePcAJRKa8cg7UjS8DPwsQ/HhwX9ZIt0AS
	6jb2gGamoHFfZOeFU1YZlUgQwFsUuVfkGlOT1j/2CB6HfwTvksf2tz5zVGeOOUChCS71I1SiMYu
	CgvksH8lotHs2S5HOb/buaItqqkvhXaK0tsb+WB/KHmCjFPb6F5tT4bPnjelfjJukToBzDfALp9
	PWTs0wIKb2E4ySK5mDrLFhfxXfUdrzAeBe+db71vGPwz8MDnETf1XzP3RJkM+oLlGG4mX+6SAHJ
	K99FSIzT6kyPwGXg2qnQjQlEbZJ7I9M8lDT8iSleoTWn8WFFftnZInNuDB3OmAXrBj2VrbQtTw0
	q40VKkLNvTftX2GteqQmjPtAs1f6gi9ft55o+K1z5vFJTiNYdLpMrcS
X-Received: by 2002:ac8:5c95:0:b0:532:9ade:b6e5 with SMTP id d75a77b69052e-5329e58dffdmr33222601cf.78.1789733494642;
        Fri, 18 Sep 2026 05:11:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532a1a27288sm12168121cf.28.2026.09.18.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:11:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7XRE-00000001A2N-2VCC;
	Fri, 18 Sep 2026 09:11:32 -0300
Date: Fri, 18 Sep 2026 09:11:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Frank Li <frank.li@nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Message-ID: <20260918121132.GA11599@ziepe.ca>
References: <20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com>
 <20260916161018.GE3196566@ziepe.ca>
 <aqtDg1EH95RYOdCJ@shlinux89>
 <20260917144804.GI3196566@ziepe.ca>
 <aq0lEk56qRi93geW@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0lEk56qRi93geW@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_051137_808925_6D176CB3 
X-CRM114-Status: GOOD (  12.80  )
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

On Fri, Sep 18, 2026 at 07:48:34PM +0800, Peng Fan wrote:

> However, the DMA channel case was just one example - the shared-SID
> need exists independently of it. Our SoC (i.MX95) has only 64 SIDs
> total, serving MMC, SD, NET, PCI, DMA, NPU, DSP, DISPLAY and more.
> Some of these are genuinely separate platform devices (distinct DT
> nodes, distinct drivers) that share a SID by hardware design because
> the SID space is exhausted.
> 
> That cross-IP case cannot be solved by DT restructuring - the devices
> really are separate. Would you be open to reviewing the shared-SID
> SMMU support (patches 1-4) on that basis, independent of the DMA
> channel question?

I think you should revise your commit message/cover letter to focus on
something that is not a DT abuse and try again 

IIRC Robin said the SID aliasing was a PITA on SMMUv2 so it
really needs to have a strong reason.

Jason

