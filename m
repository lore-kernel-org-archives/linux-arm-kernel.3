Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33925C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=; b=vmV9uptl4xT24aDdKQ/D6TYliS
	VjyVHgmKmGg0nYPg3Ed9Jjnk9BRcdfpV4rQ1aLVxr6soRfLmVRywTg7bvap9RyA4Ry1WQDtbm1f46
	e7NMaRo0uHall4jmTyUHK/5bifCBsRT6+P819B1WwZuABGPWp/ggWPXg6sk+0CNNeYI6eNnV972hV
	TCMqe0pJH7TaxiGRppzSUVv6fISI4sUQJdXMaiWgXO2gH5eNlxUkiP3zm9RFE/gOsTpHSQcqheu2F
	4pmeyTmzKytEDnIjsZxN7C4D83NAHqktHtVu9yYTX4cl5k01C61UIPS1TuKDsnomC8mwPd1SF+L2C
	PmggvZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GIU-00000008J4K-29Ym;
	Thu, 03 Apr 2025 08:51:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GGh-00000008Ipw-2pEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:49:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so3641445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670186; x=1744274986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=KemPZFLJgaNO/hWGdv2nvSq0Ygc0gZKjETB0Be+3OjUiyHw0DBEWjMWa2o5k+CvkjB
         581WyzC59ovGbxYu3GIMnHGRrtZf9RBv4KUbmraPprJs2xQwPfla/P/Wahtd7JneHKje
         m7ZNiPXK2vsJfNx/mycQdk/dYpDtfsueEbxTxIxxKAVsTNUqyv1pHQDNP7VN6gTlXcQn
         yij2I5uhPP+5NOYU4F9/X7+nQlg3btSWrREMUeqKy1qZhY61HnRYtg4sbCIer2bzVFfC
         SGBazFrKDDGhxzKOZsoh9EDxZSivmReoQ27Lrzg/41fci71BWKBer51c23+NiuYYnkAX
         M0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670186; x=1744274986;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBu8J27ftlzEshktz7zCJQ/1Jp+jqvvKxGVjR8a7qWQ=;
        b=bMPAEv1LlmBEVBlT1LOHQpJouLLVmkmnleHXFc33NqlK4A+rqu3jNZkNQwlLtKBrCK
         GnRKKWdhMFTe152WvF4ahTgNCER8YQLBmOXLEQ0T+kS3I2IFrWajznrRoPuNEEChBOaJ
         TUQ8dfUiFcrdqkjty2Cz7PJ71dUGVWaM7vZjF8khJMez6BqKelC3vHcA6isBysBRLfbp
         +YSmycRAOTvQGTZpl7P+BTS7xZRQa++6I3dN+0jQqP7V4bKxyg402U8MptcQiICk3VHf
         eGttZ7YA2AOv2iWxFSdPM6RM44Chua9PoDzNUgaOJiTE0QxhlPC/nTpTEhnZ3hhuOfke
         6eWA==
X-Gm-Message-State: AOJu0YwAobmD2W9lwom9RX2fj0Sg/pp4yyS7LM6q28PH8nk9hiZ2sYPy
	VOt28McF4oasIR9XeAJEjS1IRj8P05S7uH4IIdXLk87ed+aL1iXoLTS+pwAsFgc=
X-Gm-Gg: ASbGncsyFi9Az8Gn4bCWUoPzIttq6JZVOeDNg7BScfnFvFDCqUX7Wacdhn2vVnGapUf
	zikRz4clfroUrXou8MhSrCeOSs3O2WtZB/eNczHdrgMn/WjXXOMjmh4v/blxswNC6ECluxjzuvx
	OKqyiYuQnWEZgrCj8CzAaPyDhrqAV0A19eu7YXN7Q9EYd8cj24hz5pWfzpUKLhzIYixZuKpUQqT
	hrl3oXh+L3jgqto9Hy2hjRpPWlGO3uSKrou2i2JK0dPtLWQv8ipvauVfNJghBvLZmRpINj45RHJ
	t2eH0mX+3I+IjGX1RwCRyYOuekoEKOeGYr5G+Ikhnnkk9QxQCIsX71PMxYuR2GRgNA==
X-Google-Smtp-Source: AGHT+IHXc5iNcd+rK/nAzT2TA4Y/VmWE4yJGK6u8qDCUGXOzUoFZeO8r9utVgQgnH5ORrul8GFjY2w==
X-Received: by 2002:a05:600c:1c22:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43eb5bfc50cmr55015725e9.2.1743670185785;
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d07csm11578105e9.28.2025.04.03.01.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:49:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size
 of clk-measure
Message-Id: <174367018513.531300.4479678290582017713.b4-ty@linaro.org>
Date: Thu, 03 Apr 2025 10:49:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_014947_742884_A57A578B 
X-CRM114-Status: GOOD (  11.80  )
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

Hi,

On Wed, 05 Feb 2025 15:58:43 +0800, Chuan Liu wrote:
> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
> the structure to specify the count of msr_id.
> 
> Mark the table of msr_id as const.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/drivers)

[1/1] soc: amlogic: clk-measure: Optimize the memory size of clk-measure
      https://git.kernel.org/amlogic/c/37021be47d02d2913d6767795a6f4c72b4e63a4f

These changes has been applied on the intermediate git tree [1].

The v6.16/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


