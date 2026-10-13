Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE7CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=; b=KhY+UI7rpnL2ATS8OlvxqKNYfY
	pPV0V/ZqD4OqDr5h5f939mteJJbj531iCLEL6v0EoNHIqa1qGmE5bn/z9DRCn1QDzdhXGCK/QyEla
	z9T0z6mgqt2y4JdLAGDHwvoai/bzDCn6bUyWGgLovvZL7NecSJekjJ9bMr299wFxVCt2i1Ropkb01
	J7ia5VVeWTcTHQIZJlwes+b1KZDJzCXf9XQd6IYDcsWKqAFertSb7ZQYuaMBl705dPzKTUQVcnxV9
	eS31bgUNerUzF80fFtwoa0CDmoEWEe+E0dkZarjh3IesEXtwbS++I5aBz4ggPQrI5rE8ZqlGuxw+v
	vKrxjXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbrS-0000000Cqdz-2vOJ;
	Tue, 13 Oct 2026 12:44:08 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbrP-0000000Cqd1-2WRS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:44:05 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93e6fb35f91so288661785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791895442; x=1792500242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=;
        b=Y/NbH1/QX7QAR9FFvWrw4yD1u3f5MyQ4SbPQyrrR0bTaOIV2Liylz0lGyRkZKsfLUe
         +/EEhErgzAllIaDeD/GsbBx1qa+DECcNu64FK13GYx/8tTSzT8L4iv47a5My+OZSJgaM
         GpGLl5dtthMX6DJcVi/TkGct3kQ+g6aiBwdyIgyDWmyUGaqkYhjdc+CT8egG1wYj3S9W
         5hMEY074JzEczIc9grEZMLLOm9S9ltRxMUZidAZ6pzET3l9je6JZw2LAuZC/Z+mwooPH
         mwJnaBLL6XX9y66nzkydKyKBzmD83vuWZallbI5sWYn9KirNavWGhzi8Zb1Njp9tYF/j
         Cy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895442; x=1792500242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=;
        b=1w7WFmaCifkQ0D+SxkO4kAF9Vr7PyiJ8ol5P6YMJw3sqyI3sVGGlzulKj6g6z/gpDq
         QoxXyIQqeBmIhOg5nR/Z4Hrv6LaSuKtgABOEWgJJWjHbS6VDtaxpGamvBI9uoxLde88E
         5qMDS/2rPlb0Rnm1lgW6efPMDH4O0R0gluLU1M5HUUTmYiixbOoFg92QDBHt/cbw6GHl
         HZIVmjmsoXuJ6PgeG5Kn3OEyJEoxPxSZwG6DxW8m/SK8hAo/+zxnTqzqTgnrMZN9Btoj
         UM3oQolOGarfcC/w38UaMEkYKWePA1hmS0VbQtIbXVkIvbGuz3zJc2FjD+vVcH8hTWPe
         XOGg==
X-Forwarded-Encrypted: i=1; AKwUvBzMuq+jXuGezDoC1y4wzjXf/ihhk0cITEW2jLn+p2gwwsIXWZr3ZGNdC1XrhO8vObIb/UaKHw6E+RcNTClMc5Np@lists.infradead.org
X-Gm-Message-State: AFq9FYJBfBiVLibOazeP+9JGBemeOZX4lpy+sG3ZahuGZsR1iPvspEFC
	bbBMcSVD3jz5PNE/vyb/n9By0gjLyWxU0YI4gkM80bx/HywCDsthaYN6JfF6LV3ZDB/5+hDpHhh
	Edq8j
X-Gm-Gg: AYBFou1999XzU7NLCisdoum6WtQ7stViulaSmDBG2XqXHs06nKRL2cfOy6IjZw6PHRW
	H9a+ayf1QXZiRLklNpKzkdnVTevieyxFBVkF7OHG7MSj4QCgnAxAWB6+MNrcbXYbOyOzxVjx0bR
	0DFczku82oHUtLRl2x38oZq1UsxcE9K4NgJyptPyiwwDTXEhZSMmwRhB8r1CdBqBcNLstxGlez1
	Uk0nR2xGgRhYeRytZPbH9ul+CB9DY2zJMaVrJDZCV0iS6F8bdoKo7WicszQ0Xy4+kVW/qdjUvdT
	NkquurlpHsM0+gqZi+qSr1+87A123y8d3DWDSHtGBqcQoqh+KzVM6ZmWUXB4rN8ajJxjY2sFe7z
	cJjKH2sdRzZUHiIL8Rb+MivcVwoAWVNfWLIZf9PuZMnuTGL2fo5FfcIMJHqC8TlXVV4+c0PEq20
	6GACeI+M/bset8inZ7lZ6loBWXU9xYHj2gOWJ9yvqzikG6sTbcbjgTzSqDEKuPBxWrZMESQ7Z8c
	F3mPlyFf2ozXd73D6z5RqNRdujBDQKaZHUhTaiQwtFDHTL5LqQSoWkx
X-Received: by 2002:a05:620a:6601:b0:93e:6ff1:b67c with SMTP id af79cd13be357-93ebd1e0149mr2182476585a.20.1791895442098;
        Tue, 13 Oct 2026 05:44:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5009ca3sm227528285a.7.2026.10.13.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:44:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGbrM-00000009Wdr-3fVQ;
	Tue, 13 Oct 2026 09:44:00 -0300
Date: Tue, 13 Oct 2026 09:44:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Peng Fan <peng.fan@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <20261013124400.GI14213@ziepe.ca>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89>
 <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_054403_732294_9130E927 
X-CRM114-Status: GOOD (  12.61  )
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

On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
> If we're not going to support PASID for shared streams (which I suggest we
> don't...) than we shouldn't strictly need to worry about CD tables anyway.
> So rather than having to special-case CD table sharing for shared streams,
> perhaps it might make sense to generalise back to a "default" per-domain CD
> for non-PASID use, which can then get switched for the private per-stream
> cd_table if and when a device does enable PASID?

If we have stared STEs then the group becomes the per-STE data
structure not the master.. We don't have any way right now to do that,
but it would make some sense for the group to store the shared CD

Jason

