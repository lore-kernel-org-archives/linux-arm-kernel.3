Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB20CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z6CQ3IeyoNCQzM4n8QUnxz+E0eb5nkL31cz1hZskRQ=; b=4SJtTNJhFjBfAmAQdSUdjsh8jk
	xQbs5v8mTwp9AgII9xwm3LVksMnwpqUBpYbz9NIwDhNvlGdxlP6gDXQ/HXeMrhUEITYqt6/4CgxIu
	wGlbPUvKW8ryGTMJH2FYsNevio1rfhmtzpF3JSLVw+aS5QEGmg2x+vOFu4yaFXntQLdYUqz3NZUyF
	ZLDsOmhuGK/yR6U5XK3Oj0ogQ9R1d8bXn/dR4AN+KkNJ6MKe8OnL64bkbE2giKHZMWiyTutvPBqdz
	3gN/MYtCZ/M12kk/V6hcoDWpUpJ0PPtUCcU+WA3yBzPAfAGlwssulhhC43ZQzodAhZJ4efjM3fvwS
	1wDivWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHTS-000000066dD-3bzD;
	Fri, 08 May 2026 09:26:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHTQ-000000066cO-1aRi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:26:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so65225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778232379; x=1778837179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z6CQ3IeyoNCQzM4n8QUnxz+E0eb5nkL31cz1hZskRQ=;
        b=Qj0kQkoARPrWZrnxPOldKMA7Bev3rTmbnZ1Rmb/nexVtSZZjbc75AYcZC4dyqAPXfN
         cZA80TGsaihq+aEaazryrc6WYKWevJ5LEzz4h4io2KMbiCB7+WlgOqEMR44h4UM/UJjw
         l0PiSQ/b3un6mDYkVghlNhyznSLRJKsfUfryBHENGLRB+Y9v+MyAgPjcaW28jFwYKeor
         F7HSJfohg8i26tqTeLj88AG+IQIIEHQPQvCVCJhlWr6v6TmBq8SVne0fKS9HsfNML9F8
         k4NHnf6uC6ZkLlxPTeBMW9zX1LEvM70zgbGD4XV50G+YvJS0cQnkhVM2LF49OCo3C+it
         XeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778232379; x=1778837179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z6CQ3IeyoNCQzM4n8QUnxz+E0eb5nkL31cz1hZskRQ=;
        b=lwLc70BtUPFJnsuHYoYMV73945XYgA0PT36iODRAFH3gfUAaH7M+6KWh5cr4jbkP7Q
         wUfHLpV0CJNXUf0yND5HKUQL9CgvXeIVzFTYms+9Vl3nba68SMOfim35vgP1hdSMmRLZ
         jttXkZ7Hnmd07NHwNblip3z7GGISivlGRcwAqDsfMiS09mQQuK0giRqBNJRTfMJHIwwB
         YxPDbA7nQVY2Pu5EYp2zgegpRzpVE9E6nh7e0rw6K0U9iEc0sJVl/uWOmcvlxIpfK/FA
         bq4tUjRuqizR3u/VX/U2q5aLz61EC+pRBmBVoheByX59VIPG1t5R9FkhhT5MJngqHF4w
         8KVA==
X-Forwarded-Encrypted: i=1; AFNElJ983XOdaoEh2l9zD0fA7LwAf4IZ57RQnhUstqnLVcbhAnKE1eWPAEOeonaGyvOLw2/3rgelLupZevEqrUdKa3Ng@lists.infradead.org
X-Gm-Message-State: AOJu0YyguRYXEjwXTWHbwNp6D3aLRJjzXl5wuQLdPJFz5ed8l4j8zLM1
	3RQnO1v3OID2TwCAC3kHjtV+ieyB6TgDDCkljL2lGYPIJlWNUQrbijAPvQy2NTEoRY8u9TFK8r1
	sZWZdRQ==
X-Gm-Gg: Acq92OHXV7Oq67dljrOr2iLKL5v+8WLCP2HO+wyaZwXu6iiHl5DbFClNVDzW3gFzkGz
	5eUraBNM8j/PRoX9XABj4KflDF8F9ZSsHZESISfOQtMNKfF48CiIgSf6NvDbPxJ6hCPkIkhv7iC
	x/d8hAaNORKwUlDWX9hDEZFG0C2g31T0kxwlO8ZR9HG6UIezEWf/AnLCeKPp1gOOTTEgB08erER
	MRQjqH2l0dW8uRy9fg5M68/rSton6iKOypJ28JV2SZAHGaf/erEQ7bYD6An96Zmva8/aEyBvOPi
	h5SYlsydKPSV0dIh5sgWSIR5QHAQMzSz63mkf1R5lIeP8Nj50YJqI02CwB/7qOFloKj5fDoa1Or
	o0uN5vIGGJE8zUryhbHwHrAFhXLHz5KstDfGGCzX98z7vTbId027lknnbZEY/UVeO9Jj+DOLbk2
	LNlUaG0ki5k8EyNnQQNQgwYyGFD8hSMVfFuUF6rz1dKlWmQNfSz+Jj+o414FJLSU8hQmFe
X-Received: by 2002:a17:903:22ce:b0:2b4:641a:6b7c with SMTP id d9443c01a7336-2baee828aaemr2177755ad.13.1778232378829;
        Fri, 08 May 2026 02:26:18 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm14866545ad.72.2026.05.08.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:26:18 -0700 (PDT)
Date: Fri, 8 May 2026 09:26:11 +0000
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
Subject: Re: [PATCH 4/9] iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds
 to struct arm_smmu_cmd
Message-ID: <af2sM-NtNvzCpvyg@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_022620_467070_A4214EBE 
X-CRM114-Status: UNSURE (   9.88  )
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

On Fri, May 01, 2026 at 11:29:13AM -0300, Jason Gunthorpe wrote:
> Convert the batch's type to also get the remaining helper functions to
> use the new type and complete replacing naked u64s with the new struct.
> 
> The low-level queue_write()/queue_read()/queue_remove_raw() functions
> remain u64-based since they are shared by event and PRI queues which
> have different entry sizes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com

Thanks

