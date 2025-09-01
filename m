Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B679FCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=; b=44W0uxAyCdQFIn
	A0RZHu4Metz/+8TT10nGwSulXMKSdXNlHWMHNl3pVsmdSoK1tTHaQ5LH7JHF/zntIPjfKUWmaZSI/
	brr9LTjm57pyC5sFVon8Y7t+6PuMZBD5tXYFgIy51cPW1M5uWiYgc8WQDcmyFldmcuvAXAusXkuWh
	ogmzI+lRaW9Qdw5Le3I90yZuaGVXx4sLVVfjSCKUjQzddpSyIKS7N5u6uS+V/F77LBiYjP7wlo+VS
	dJBpKiwEmWjaRmd7O7Shz9T6jXw+s7/qvgWI42swgzM9rRFSIJkve64vm1jtaEKy/w+Zwl52O+aIS
	tdrJzyOf/pYuYxfaql0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3gr-0000000CUpf-17yl;
	Mon, 01 Sep 2025 12:31:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1kh-0000000BuER-1S7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:27:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3d1bf79d6eeso1227635f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 03:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756722425; x=1757327225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=sn8HBA3SPhHrSzWSd0tpe758Va1kGKHFIItskyHU4TxpGx3Uo4EVyu0ABODmPhQRCz
         8G00VClDrJ5S96VjBXUOlxnJw2JtpGa9OdeOupR9fn8ivgVrCPYR+y5CgI1jzxjLDVyB
         NsSsQx1bm2s72UibbQFnjFq+QGO/sQ4k902pmp0Dfjz8HkLV2d7tSVhz5hOOSBNOVn7z
         f8eAh7NOsOU3DibBGVfENrtWLU8dql7dQjWgXON5IoncTvrV6Z4Z8ZbsJUu47sxmbnnb
         cIR0qUKddUfJ0XajJdTuN1RVKLAmHuATLzH8qknGIijKvRC6JFZGKbmR4abS/r+4xbHv
         MrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722425; x=1757327225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=t5Lbvevrh/FcYZecz8yAOm8+Nj3d7e27gZi/mwgrKrt4bxBYI65bV/+I1z2VNKd/CX
         vpC+synaK/wuFnzWN+4RaHJMGbOMp5deCB13w+sPGDVDmvsboaSHfcx4J7lisDtYu3tv
         +ynMLgxlXzc465DeKt/iCcIUEfiM+PasfKQkI4LTsh9qOw6ozB14Bn/pHe/fwuEeDE9q
         W7nV+ihjj05HRD2GdY2o22NbMIla9BtalCaeE9/0BktB+0T0VQGcThfUuRiXSXblfleS
         ytb8iL9+jgOvdTIk9MWl71X3W9YcqpwiUNgWdkOqNd4VrLkK5dt1RuMGbWBaayJKHZpf
         0syw==
X-Forwarded-Encrypted: i=1; AJvYcCX6cpQCDJ4Vp/Du5VWp7tG4Sjma/MKKlX/N6AoFadxOXavQZx9i/Q59Jx6AirDDIjxdHM33JJPdgas2LG1wgWu+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4xShv6gIA1y935MxD5fdmYWS5aGOnGxrsiE/TdEAB2YMLMhXZ
	xCroAANCYjBVH7tRDfFY2fETNZafjrpwrNAZpaGZx4uFY6URUARvPR660QoCOFDgNFc=
X-Gm-Gg: ASbGncvVI/MXgRjtXEMmwoc+aeOMdLbph4YtvEs3R8gCxzrPosy+UJ/74Bsaj6Z9xjc
	XVorPZ5XoKzw6HB706FjTn1o0vqqlFE1vRzaj4CLNlZTBB7nFTh3ASt2S8Aq0eJkv9gJsb4nUQI
	cC1gsXIW8nlMC8TLbdTsSz+nLx7bWMKCWS+WRayQNHCGzFssfbWGSY300QWY5m4+2VqaOhMjQkq
	6pcl19W1cx3bEzzAY4/zGL7mw0VXhdFBRJUTg28uxjJSOMct9wXHX0HJUf6ScaBz5al+vAqs8ze
	yaz6uSXIAQu/A09ntPMIiYplfH1wkbFC6dZQhT6gMOdifISeWPGLMeHyIER7LWt8WK7wm+QDS3T
	mgUhZc5Wxukbmh+wUJCj7grgBsrcjjGMv3Y6how==
X-Google-Smtp-Source: AGHT+IE2RqWOouUNKF0LuMwYDv8VNEg+V4AVmzf6zsck7npghoz21h/jWKBn3nN0q+raGVTCFFwHxQ==
X-Received: by 2002:a05:6000:2510:b0:3d7:7def:8435 with SMTP id ffacd0b85a97d-3d77def8d9dmr1055874f8f.18.1756722425227;
        Mon, 01 Sep 2025 03:27:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf34493b8csm14441165f8f.59.2025.09.01.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:27:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:27:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
Message-ID: <202508291556.kjNumYgR-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823154009.25992-11-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_032707_395860_B4F172E8 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Jisheng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-11-jszhang%40kernel.org
patch subject: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291556.kjNumYgR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508291556.kjNumYgR-lkp@intel.com/

smatch warnings:
drivers/dma/arm-dma350.c:387 d350_get_residue() error: uninitialized symbol 'sgcur'.

vim +/sgcur +387 drivers/dma/arm-dma350.c

5d099706449d54 Robin Murphy  2025-03-12  360  static u32 d350_get_residue(struct d350_chan *dch)
5d099706449d54 Robin Murphy  2025-03-12  361  {
eae79fde2ff50c Jisheng Zhang 2025-08-23  362  	u32 res, xsize, xsizehi, linkaddr, linkaddrhi, hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  363  	int i, sgcur, retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
eae79fde2ff50c Jisheng Zhang 2025-08-23  364  	struct d350_desc *desc = dch->desc;
5d099706449d54 Robin Murphy  2025-03-12  365  
5d099706449d54 Robin Murphy  2025-03-12  366  	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  367  	do {
5d099706449d54 Robin Murphy  2025-03-12  368  		xsizehi = hi_new;
5d099706449d54 Robin Murphy  2025-03-12  369  		xsize = readl_relaxed(dch->base + CH_XSIZE);
5d099706449d54 Robin Murphy  2025-03-12  370  		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  371  	} while (xsizehi != hi_new && --retries);
5d099706449d54 Robin Murphy  2025-03-12  372  
eae79fde2ff50c Jisheng Zhang 2025-08-23  373  	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  374  	do {
eae79fde2ff50c Jisheng Zhang 2025-08-23  375  		linkaddrhi = hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  376  		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
eae79fde2ff50c Jisheng Zhang 2025-08-23  377  		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  378  	} while (linkaddrhi != hi_new && --retries);
eae79fde2ff50c Jisheng Zhang 2025-08-23  379  
eae79fde2ff50c Jisheng Zhang 2025-08-23  380  	for (i = 0; i < desc->sglen; i++) {
eae79fde2ff50c Jisheng Zhang 2025-08-23  381  		if (desc->sg[i].phys == (((u64)linkaddrhi << 32) | (linkaddr & ~CH_LINKADDR_EN)))
eae79fde2ff50c Jisheng Zhang 2025-08-23  382  			sgcur = i;

I'm suprised there isn't a break statement after this assignment.
What if we exit the loop with i == desc->sglen?

eae79fde2ff50c Jisheng Zhang 2025-08-23  383  	}
eae79fde2ff50c Jisheng Zhang 2025-08-23  384  
5d099706449d54 Robin Murphy  2025-03-12  385  	res = FIELD_GET(CH_XY_DES, xsize);
5d099706449d54 Robin Murphy  2025-03-12  386  	res |= FIELD_GET(CH_XY_DES, xsizehi) << 16;
eae79fde2ff50c Jisheng Zhang 2025-08-23 @387  	res <<= desc->sg[sgcur].tsz;
                                                                 ^^^^^
Uninitialized.

eae79fde2ff50c Jisheng Zhang 2025-08-23  388  
eae79fde2ff50c Jisheng Zhang 2025-08-23  389  	for (i = sgcur + 1; i < desc->sglen; i++)
eae79fde2ff50c Jisheng Zhang 2025-08-23  390  		res += (((u32)desc->sg[i].xsizehi << 16 | desc->sg[i].xsize) << desc->sg[i].tsz);
5d099706449d54 Robin Murphy  2025-03-12  391  
eae79fde2ff50c Jisheng Zhang 2025-08-23  392  	return res;
5d099706449d54 Robin Murphy  2025-03-12  393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


