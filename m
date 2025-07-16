Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D0C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=; b=0AIuPyayEcHkQ8rS557KGyqtbT
	Lfp5k/jDgsVZc8/+FSiCL7/dEYUCcKZHhyL4QbIklK1APhQcaaotON9rflCLUZmmaTtG/5bZf3tv6
	RcFg1WfZ5Ao1phEZUNKAThrju6Az736V8y4jJhZH9Uh+GxlWfAoAQAho3BSabUOi+u1Ue9N41nwnv
	pcIr3q/hrRzYQj9/ipS+gVVM1rQHvj/ZVuaFNYE8Cp3kWD/zp/AXlSEhizqZ+dfs6hTXGGCdiwa9x
	j45BEoWX2rxC4saFPvhrSlvgXUfBdkU/w9ohBYnT27FCEkcilK9VveTOUHrnHKHCeVEH80LFKZA21
	+ucdn95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0wl-00000007dHQ-1J0o;
	Wed, 16 Jul 2025 12:09:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0si-00000007cwn-3vIx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:05:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so12304204a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667503; x=1753272303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=ccg9bvL+o4Pdwl4um2ZPlI6nWuP+mOg9yTzYmp5sURrju5O3mZLt8WvL5kTHNeCNHM
         Pt2idale3fsUuUgfxyokErQqs8MEXpncTIFRrfan3aNeAX4ENcBezFQz85TBaaxuj6uX
         6/hU0o4Fzvq+xA4tiHX4xFJDFX2QdheeKEo1veTd2vVIVLa/EicxDIxbP86uBMOag3lz
         tdqhEShsVxIagMuvKxT9Fh5W9D3B9GiMalXa4D0stA3RSiNWgcjh92VjpIpx3opFTHhF
         dr5RXoIvBMGbDwZqAn92F/4qzw29HL6xJ7ySf4ogIF9uI0f4HC+WVG4mbmGY+fQXFJPQ
         4faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667503; x=1753272303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=th5adE+El/Y+S4Xyb6dVpIQqtV5OgVfOd9WpxSo2UH/t3gP+9MKIrNkt2n4ER9/gzL
         58Ie7o14S8TqXbEJ4wxeulx5ZbenBDwpaMVk4ttPEJf6k+3H8D6OsMWawxXH1j5fWDap
         n1LAu9TqFhUC/ryQ9pkTJfCkdU0Kbb39DuyF6vsoMzrFOEwScK1NDZzdDUPfU7pjnff0
         JGZOvLHxzrygbAl0zfY22RCMrYIZP4K8BsCMZJahufjF2Mit+Jv6P2lq2/qBOuA3lkqb
         TNL0MDvyutjabNmjKVnpVVZYpWj7voTVr1lRoYaulXmPaQbadKGV6pwtv4w6grdEaKxk
         ibxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJNCJ1T1a9wC8ZBfMreaKQExLWFThgKX9kPxWp+1wxo+RSP2XHC9cKms9exb3QnL0UeSZhFyNAEWo6xyqB3wgG@lists.infradead.org
X-Gm-Message-State: AOJu0Yym95FSjNlCHpzXDd4l0S3EQyxvvH1qc0pKK5AIMPVD1DXNqHKh
	872eZCpbAEx+CmJoFX7JszXd6nHIvsUiAVTaSUSoc5dRmypx7ZtK8v71ET3dXYYjYLA=
X-Gm-Gg: ASbGncs1NWxTFESPQ5P/kCHCAcJ2jPRPpvM00ohv3SaNySXKie/UPU/p4Sxlm3ppgEr
	1kzL9Q3YGNV1RhdpVLVNZtze8mPjWlV9MRDNDHwztBjj3XH2BrI1z+4t5hCLcnRfdd1QeMgBiBQ
	VT4sAxBSlUfbgwFSt9jFWDRs2h6JWc77Bnp9yUDhy6+lJAuAwg/1hC5ZGLEGYtFUS+0lYguBUzN
	c1lrqY1WEXNpdrQpXmnXHLqYvS9534uFUHAQbavaQGQ6mTo6sZk6JCxvPb9yPQuwnhryHBgNzqx
	Td+yN2ljg4at6DoE6a6lDcv8bzVnOM6z01fWmPF9fQN3lDtahIk2Jit/ynFlrzuvtFUChrQPrnG
	kzb1FlC5OApFtDra48/uxJYTm/Pe/8A==
X-Google-Smtp-Source: AGHT+IEHWN0R93F6utf9eOM9iKnjv5S7ssfr5R2MO8UdDd3ai68a3PSrvOh737Pa7gqaj1wFZ0jbCw==
X-Received: by 2002:a17:907:7207:b0:ae7:cb7:9005 with SMTP id a640c23a62f3a-ae9c9af35afmr267572766b.35.1752667503179;
        Wed, 16 Jul 2025 05:05:03 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm1185884366b.117.2025.07.16.05.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:05:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:05:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when
 RPM routines are called
Message-ID: <aHeVbInuGbZM7TUJ@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_050504_978733_A30E5716 
X-CRM114-Status: GOOD (  11.35  )
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

On 25-07-16 11:15:06, Laurentiu Palcu wrote:
> If runtime PM is used for the clock providers and they're part of a
> power domain, then the power domain supply will be cut off when runtime
> suspended. That means all BLK CTL registers belonging to that power
> domain will be reset. Save the registers, then, before entering suspend
> and restore them in resume.
> 
> Also, fix the suspend/resume routines and make sure we disable/enable
> the clock correctly.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

