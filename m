Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B29DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ow0jXvjkh77pOXWIP6I5DYsF4xpz6igLz3RhPzX2Hc=; b=Ajt912JsytqGqB7m/ioAuHyEtJ
	Xc07Keb8ZZub/nkArUsCVamxG5sEBOZP63GM4MzUCZT3ldAdbTPo7ZZaOc0bT9QVyuOtG8UCKWnWB
	fSCNC7vIalNKWIxaUtS2R7cU+cDu5UpaaiAxf3MtIMnUjQhwbmlx2iIN/m5PJPp3J19/vBFIET7Qh
	KQqQUHDEQVW+8nrsdSSkl5SXhXHEOjCxkXl/EFmbuHtpUlNvWqEDSEZnCUcaOqPtzkX/sZO9W4pbL
	PEqM2Ox1PlwRZ+XKuCW72XooLT6BrFK/CrNCzIn5VkJGUckGPcCcNZnQvUOuNjavy77D9EkLAYZEn
	aZOnddzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN73-00000004y1U-3AfJ;
	Mon, 10 Nov 2025 08:18:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN71-00000004y0g-1JzW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:18:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477632cc932so10054565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762762733; x=1763367533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ow0jXvjkh77pOXWIP6I5DYsF4xpz6igLz3RhPzX2Hc=;
        b=cVtERCXGVSYvsdxIWSxBizOKYPj8a1/IhhgYbsmwAa8dp5pbxQLzGTQ4er7M6GE0T5
         FbWo4a9zl4F3UokSKFCYNcDjTgQeMWEBSni7b3XwU2zIKmoUXIUW/m+bfapsN7g1p0Eo
         UOsxnUwmIMPUzj1Pt3iqN05ho4DM3QyZGCcMEdz1cRaOmW4yXlbQiBMd4+EZKI0isYRk
         StQ2kb+JoBZmFGdJ2Q5wCz24TxDkGXG3h986ldY9UzUhk3JrajZjEyDDhGQijzHU7RKU
         cggOpEhHOJUTLPsgRMoEs+K04sNTHMcVOQT7p57A+RvBdy+p1ElINlgP1eQeZ7WZU8Ti
         Y/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762733; x=1763367533;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Ow0jXvjkh77pOXWIP6I5DYsF4xpz6igLz3RhPzX2Hc=;
        b=nmtBa/ibJA3QBdlbPkvIv2ndl92rTzKK9+vJQRzugtrRVUcGrvFjZRdWoRky+PYDq2
         7rwKpZg9BAcLgMVTU31OVuyqmsxPsKpngIQ3VE6KHXc7cGIgq6OUQwWTEy/98kSPxq7D
         xQwECdXnrPPbbD29R39RRk5RcrsBZppE/DNq7rRL5gc3/7iJAtiH+5Lw2Nfv1f2MHL6m
         J1As1s3dM2MEW0WzkKuu6d5wAj13C17hmGyiW2vkQ+taqe4M6WTQAKrTpb3Z0iK8m37G
         VPLvhv9C9j4JQ1SmlDgDu08ys7g+TR3fCPzZvwX/eK2R4Pvzts6aESvMi2FTcJpLffEy
         GaNA==
X-Forwarded-Encrypted: i=1; AJvYcCXvda77w/VycZFFSWWeAl8MFwngNuYgsMbJH3ExgGBHOhHM/qpypnqyJFOgkzlfoNJtr/c9RHmOqFPgwiT/tVR0@lists.infradead.org
X-Gm-Message-State: AOJu0YzVyt6sa4B9QJmiri8e2upLT9Q6sFPD30PiPZqzfDzGSL93L0TN
	x8mqnU6iHd4Iz+Q38gjgZl4Y0DUkszDhE1U3fVVakNMGdXIzZ5KjYIrxe8VzTSEsAqY=
X-Gm-Gg: ASbGncvjCrZGFY7IBzaDoz1PreL+5gfDRwX5j+BSXZBE+/CiFXKvNXyGPqMjaRahXVl
	yJqTILLpt4pVO2QkHJOeV+E7NLg+9ggiyO6vlo+xDEftmHIHj+v/aS/sH6MahQBNbVlkSgFFAdO
	OuHY1OcvUqotUobnBXOAqWESueZEEblwBtI8s79rNqGgW/fQMkFiDw/93Vmw3OP7OtAAI+etSp2
	hs6ygmc4GyCmbc8jXmRrTxGToIpW2PYy97HnOFnGTcxQO5mUhUdu5L0pJv3VRAMIFCskld6ZvbE
	kkIRN0+eXtke3RZjl/6aDKYo/D+FNSrwO2E7XzbKe00/mnFe0NTJtFDmFcv9PancKxaaKrLnF7y
	mY4amjVCSXXc80ayY32+CPuWFHLwQFQlHVO6z0irgqmgx9CqT5iMR9zwz+RIjeBVGd3pNtgISya
	2/2EJfHX1GO5XjvQWA93AB
X-Google-Smtp-Source: AGHT+IFNAJ6Bn4FpyZtFF1NnxwYE2SjgYr7mpYVD4++XybQIbWpInXbD7iemC8JYoesp/8+j6x9DXg==
X-Received: by 2002:a05:600c:4fc7:b0:477:6d96:b3dd with SMTP id 5b1f17b1804b1-47773236f6cmr51381675e9.1.1762762733314;
        Mon, 10 Nov 2025 00:18:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd08834sm192070105e9.15.2025.11.10.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 00:18:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org, 
 stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI
 region
Message-Id: <176276273239.834148.1225755186046227156.b4-ty@linaro.org>
Date: Mon, 10 Nov 2025 09:18:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001855_462671_BCD20362 
X-CRM114-Status: GOOD (  14.45  )
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

On Sat, 01 Nov 2025 09:59:39 +0530, Manivannan Sadhasivam wrote:
> This compile tested only series aims to fix the DBI parsing issue repored in
> [1]. The issue stems from the fact that the DT and binding described 'dbi'
> region as 'elbi' from the start.
> 
> Now, both binding and DTs are fixed and the driver is reworked to work with both
> old and new DTs.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[2/3] arm64: dts: amlogic: Fix the register name of the 'DBI' region
      https://git.kernel.org/amlogic/c/8b983ae355aab50942c72096beba30254c5078bd

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


