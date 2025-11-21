Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C10CFC29B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOczehve2+cnsMUNrag+s9SdOyzwCWr1O+HoNDArIDs=; b=Vd+4RPrIaPpbFab1ZQgnZkitCQ
	5fdASJDLRFl78hMJ9ZduyrDeATtLyv0Il+yMef2IOHlzNc2XCwZvfmaWTRttg4rHZkwrFreaiBkCP
	JgmFPNIiOemzhMKXqFErKlLtLpfOOv5xeTu3ODJhnutqgV+QgLw0CkBiYnGo2e9Nz7vVPsDXTgJfo
	5588FIKrLioz8KUetQCPnSO1nxizs1XZzrVk/P1o2Rs62JJ2f84aB0ELVsbNmvKJQtWukT59kKSVM
	OgPgqXQ8pnQcZQ1DoBFS88/bZUr+wNHVAxXyofb6RhYe/9bq1Hxhy5q+E1ylGYgIn0D9VBd+9S1qU
	pVYOwbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVMS-00000008own-3CJS;
	Fri, 21 Nov 2025 17:55:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVMP-00000008owL-2pMh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 17:55:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-298145fe27eso35077585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763747753; x=1764352553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOczehve2+cnsMUNrag+s9SdOyzwCWr1O+HoNDArIDs=;
        b=HiYZsQAwx05kRqOL5g5aVRUNKOC9ZvheKdkZrwQsUwlS+N+Jz6fpK7/zwb/0FuIfpp
         sN3D44DCjHHHw6Jd/ju9h5AsgRprCELXwP2fnaFXLOlG0BEABtsopaDJm/rPNN9M8Z4S
         EpzLe6q63pmPbDKK0GHvb2QZBkuO+dAV+GW/B+Uuk1VK7+MU68ORChveFTdtj6RrSonN
         b2s9ZxX+Bz3kHuJCpxg2qt2uPJQIvRLbpyO6ogVzvvlz/k+UNSRGbP7dzl3R/qXzPDNw
         XvWzY9egyrbWaR3IeMj1j8ySanMtdZA4zDGRoNsXYxzEEZXRrPpWH/R7rXdpcYqwEYC5
         /OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747753; x=1764352553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOczehve2+cnsMUNrag+s9SdOyzwCWr1O+HoNDArIDs=;
        b=mBePy4ys8ahev8P/OFBs/1wf8EF9SFI8yaj8PI+wuSnJ2YQqaYWT6PGI+8F0r1Ivrf
         W5+HLQphM9wxJC5ohV4LtQ/4LZ4Yg9DGmUvK37wy3vz/PlEg8Mj0YBTRUJpnkJ7H3z10
         qwYSJyNLhVCVdR2MI0H7ey7NlUNdpowMXvyJmX50i2ROazkGJ6duXVm2m7h28aqY7HIH
         qmbZOS2NtG1przoz/Ok4bWvydgHhwNvXxmNpwZ7VcFI/0vbWGHdbMV7uiyOzJr+02ft6
         DDAa6QcOp+QyBsE6YtnhWUTcI//Ude3WiPx3juM7RAFel55tdO5ARgGhb/WQSPvqO3fs
         L1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVfFjQ18ZVF+9KFC6amBvHc0HJ8uQPdT41FDkbQkO5p8IWAHqxQEV2T/1a/WgWQskLzsJr5DA/oegcAW7gbZsi7@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmtdngmROj1fpyH6El4OVld9RZU0SJzL4s3KPpezk+TzEJlhC
	1u7QMrVxMezuFkQuD6DVFoAOBs/xnuVUL4VvSK6uVe4nd9yeB7sJE3/sf3MIVJc51g==
X-Gm-Gg: ASbGncuCmF7mSuMY7gA9fZOFeUeB99JrkGw/1o9Bvd3k05bO9FSnDDRVIzftt/PHOhV
	RrBUUftGq0hEGQThgYE1vpHi4Ry6SZJl1e9u27+8zV20gvYAUtcjOXGG9sx6QIn8Z5LqR7buMMw
	ngR+d7neR4f7CdxcD3GUIiHjWq8iKdW/8+krowkKwm6rvhDprXe2RaS0G52r2mF10+TDNLMyLSk
	rwUPcAzt5Hg4+/gvQ6EM+jVbOTlfP9go3+wg5928lbgu4gy7YSpyJALA3tAVpASsbD+SXzwAGhG
	TyFHO4+M1aRue6msgb4AT5AWPBUwNCt7np/qC4UmOQoowYAlmtKISt81djrfmA5lkvVy45RLkTo
	iQxP6i+EygnFfVs+6Z2SgYsV6NCBEgb2g3Nc4oNn923ZeHiJqnAPyIcw06PnNrd8alAk1tieifo
	9cXM4AH1pCse/MZbPj9TwFuYmMBL3K5L/oWjzq/jcq25/E6jZxVXFUcGM=
X-Google-Smtp-Source: AGHT+IE2W4u9IOFJelWNiCRMfwPVNTwdUvO0tURMAaL/pRmfzeXyfqcqSuXHOyjy9NczAMIsi751Tw==
X-Received: by 2002:a17:903:3c43:b0:298:1156:acd5 with SMTP id d9443c01a7336-29b6bf1a67fmr42515655ad.39.1763747752665;
        Fri, 21 Nov 2025 09:55:52 -0800 (PST)
Received: from google.com (226.174.82.34.bc.googleusercontent.com. [34.82.174.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e6c6ad3sm6145258a12.13.2025.11.21.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:55:52 -0800 (PST)
Date: Fri, 21 Nov 2025 17:55:48 +0000
From: William McVicker <willmcvicker@google.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
Message-ID: <aSCnpO72osBqfmTj@google.com>
References: <20251120184242.1625820-1-willmcvicker@google.com>
 <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSCBKRpA4jSw1iuF@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_095553_715679_6DDA1298 
X-CRM114-Status: GOOD (  23.38  )
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

Hi Russell,

On 11/21/2025, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 06:42:28PM +0000, Will McVicker wrote:
> > This series adds support to build the Arm64 Exynos MCT driver as a module.
> 
> There are parts of this that are just totally incompatible with it
> being a module. For example, you can't register a replacement udelay
> loop after the system has booted.
> 
> This is the second time I've faced a patch series wanting to remove
> __init anntations to call it from a module, where the author has
> clearly not analysed the code to see whether that is a valid thing
> to do. This is unfair on reviewers - it is the submitters
> responsibility to check that what they are doing is valid.
> 
> Moreover, in _this_ case, you will have received a kernel diagnostic
> message stating that the call to register_current_timer_delay()
> was ignored, so I also question whether you bothered to run-time
> test this change.

Sorry for wasting your time on this due to my lack of explanation. PTAL at my
response in the other patch set.

To address your testing concerns, this series has been thoroughly tested on
Pixel 6 (ARM64) since 2021 starting with the 5.10 kernel version and is
continually being tested on the latest kernel version today.

Thanks,
Will

