Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F45ECD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn3HnEGpfsinsQczYQb+6skEifl1bNdoE4T6rMB6rKk=; b=atGckRrXvpB9EccZ3CEJ3x1Wk6
	OL8cuBt2ly4UioJRbnOcJeJGsVMZ5Yk24JX8JR4SINc4iZx9P0aYDgdYlS2syg5omK2YwiNMe3pxl
	YRUj4N9p8UW6ruxeto0ioAY65zzGqZpYlg/ROmeNF/EGA9avo2GDSiNztCgS2mIuanwLdPVqu8Zfa
	nht58T61ysi1g5JZbjf1xEaITfgrxBMxYmWyNC9qYzw2ApSRbOWT/Z3AJ1lpBTD1Evsi+WAzdW0HP
	hDcALCbJlpsPxmKXEX5EcJjTHFRuh+Z9E/c3/bH99zP4fICYKh3oNGCdxusXIOiWEZi5xm1HHFL3J
	JWTVq7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLSU-00000006a35-3vBw;
	Fri, 08 May 2026 13:41:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLSR-00000006a2S-2vIq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:41:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso85625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778247695; x=1778852495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kn3HnEGpfsinsQczYQb+6skEifl1bNdoE4T6rMB6rKk=;
        b=ZQLj86RxKFQX9IuZEPedwWb8nKBK5Y13eO16IAXHVqnvtbCaMQOHRfQhXIhyypjTqr
         LjRI8RNSF8QlxYLLt+c+SrzsR+wTDuT/ROaNIddp1RZ2xRw9l7m5Q0JLkpginfXvChR0
         eKaPwORDoBpQkiiSgGGnIyifZma+x2tKSuXrIuKg/hAkn+WxwhhS27eveCdZ0pdO6Cf5
         dbEI+kW138TPuXQq02D22PZJ1M7UCpUU9tjLjRGu1FZPn+PriP7fX5Q4nZc3qejUE3V3
         FWscFF9KkypK/1Ehx4lIDthf2oAiBU4v26SaoxJQiJFCCbslzuk4PTHAJabDF6mZjKaP
         W1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247695; x=1778852495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn3HnEGpfsinsQczYQb+6skEifl1bNdoE4T6rMB6rKk=;
        b=VbUsrM3so171ftOmDYc7YVeYb/xDs/5LfqkECjHJlquxri+3nGuLelzJFe09CfLJ+y
         NAwMjAVQhCBWHtVu1EYkOUgNDU1qQFlOjkfueRS73irEV4/I4H/CrEFTpOoXe0wCnOQO
         kO8vVZmGtySEsiy2dn+G5Y38F6k0AqSGPZmxkYx8DJ17apgSZbIePbDzFcN8RZ5zbe4H
         S4wHGtO3/UQ3EshafeiVbNsHlSpuJiAhUDpbXOmPd8X5YJVuwh2cCwqNrW34f0VEq/Rg
         e/xtiorRwWVyoPpzdtSii7dpiJ7aAjQKjHIqkHtLjNL0VChMHrnbSH/20Y2GenWqXe+A
         QHxg==
X-Forwarded-Encrypted: i=1; AFNElJ+d68Axo/MOam+vtPRIHAvGENYWrXsvzv02HYYkNReOQGIFT1XSkgKIpK6qcLMZRKhWp/3zzEVRJ6Nh5YQEB2CC@lists.infradead.org
X-Gm-Message-State: AOJu0YzZJkdVq2P0BPouZi0UHH0zmcIEKRNCL2hVgyhgaUc0tSIBoN47
	8TtVVwsmyTGdaaXMdEvQV+uLxY34yP+LhMFJwS0ZA+JnxVa8f8mC2rSDjQRqT7TEEA==
X-Gm-Gg: Acq92OGugdOqgt6go6/DdxP4I3PUaj0Zmq6shILbnw2TuwkWnZgeGjE+JWM8Z7hYbMM
	3R3Hf8IpKSb7EAP0nf9IRtzRHI1gzdjfNd+3eX736qD4viovts4w29D8MXjcxrRgbj/MjRwYMki
	xJg1xz7luVs+7/rwUlD965Pj3lM9SK0WgdOTo9hSUKVxzOS3wC51zNKsXDil1Jkp3qlkUGiqAqU
	04INrQsdBJFsgu3YI6WlClFeI47hr+BjLxAsboUwk1Tsv6x1YtaDjZ+5MiPNmM3evH0MVFuyTRR
	y53TJ8sYp09VhFNgTTSw51q8HbO0plRgsIytYAC9UdXjHoPno8Bl0r8N/r3k3KzrfF51SSbvGF1
	5I0KJ0eUXez877oO0Zd0Hj8pVw7oLANlr5H5FBR4ZhyWBls3To+UiVlTEbJLw3dXCbEk/VYTQ58
	X/rzYVHK533Y7HWzNW2A7tlY4qgYibtaa09nPpUVkk0GzcRfm8yxruMMSh42d/8ekVWd2B
X-Received: by 2002:a17:903:198b:b0:2b4:6529:7bae with SMTP id d9443c01a7336-2baee842030mr2436805ad.17.1778247694198;
        Fri, 08 May 2026 06:41:34 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664da1f5d6sm2479705a91.3.2026.05.08.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:41:33 -0700 (PDT)
Date: Fri, 8 May 2026 13:41:27 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
Message-ID: <af3oB0efZjr7HZi9@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064135_734086_62FE9658 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, May 01, 2026 at 11:29:17AM -0300, Jason Gunthorpe wrote:
> Change the flow so the caller controls the CS field and remove the
> weird u64p_replace_bits() thing to override it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

