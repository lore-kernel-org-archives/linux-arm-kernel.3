Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22901C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp6Bjp2wzhtrtLJqG7J8nPwf3VRW15hJCwHjUU/I7Wg=; b=bZSQHo29vyyxYzHsGTfPMCQCSi
	RPIeC1l5BQwGYqESXz7qUbDXO3aqMoHxbsXnjPDCRbHj9Gfi8c44bSdyrI5PFWIcPJ1E63rHAopHV
	PR3dDjrL0ioUXeWH3IdmTNhYVI4mDymZmFLFbo9kM+vM9mwMSR8HkDyb+hvvaVEUOD+Jp6/QvcsjN
	BOt/cFjZgANycisrR75pQavTUy7IDmET0/JVosTICCcHdv63tMVdBLw+yXOq+2sOH/3g1spc/+eAH
	Fm3kV2qZdUuBKHJIQ2HgcAfSMwQkIBoZvOxLra6pdZzPzy7iAY/HySpNOulbrRV4xUUadFP3ru1J/
	z7hDdsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNJP-0000000HWnO-35MO;
	Thu, 16 Jul 2026 14:43:43 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNJM-0000000HWmi-3CPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:43:42 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-66825847b2cso916764d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784213019; x=1784817819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vp6Bjp2wzhtrtLJqG7J8nPwf3VRW15hJCwHjUU/I7Wg=;
        b=pytGMUR7y1FuRgPRVEtgGmdBFE1w9Sl+KD4xTm89Qj7uIAGZTrlGYdiUP86QfozjIs
         s0dI3jeXnOni26HZEet0i6mC3AEBOKep3Dpn29H4YvOyzzhS/9bcUTwUyVKjXPXqrELj
         ED3lFoMGri47iPDPFm5EwBhGpwUoAfyfTJigVsbbqnXzztVQ5qLKWRHtFsMvkXRPR9UF
         sLgxOsW+BQ4O8PgsaNoj59ghlaWpbMRvlRgrq5U6t/0LLQBXSpu7W8G+F+HT6GhoMpOb
         I8ZOpgjeAgQPdHt8YsD/Xyh5H9n0k1PcdBrRnjmAGQq4yoHBAb6Q91IB9Ky4gJQsOwlg
         HX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213019; x=1784817819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp6Bjp2wzhtrtLJqG7J8nPwf3VRW15hJCwHjUU/I7Wg=;
        b=PG5MefFpDJ3W5hdouUBmlWi5ynQmkewELQFDqvcyHAPXhWO3x77pOsI/aa3hW7MIWw
         b0aNcV0qYwriiS6gTWEmtkI+th1Y8xETmrmVqm5sx0I50m987H7lYei9m3iWzoPPH9Cg
         pl3Wt2WbVz475sxGyTbv+pb8Jbx6rq71pq/bVtz/HGO3cOjPWfW7EzD0STvYPpGWohnF
         BRhRGWKmtpQzshW76gqSD1Rh1Y64UFBgDIOxD59ktU2XWNAQmzbcgZlQSV45TnABYGEy
         RLfxOqQnc6BO4A8ea538iEiTowWCp6r1UFSaTrkXwIraTiWVg+PfZiYe9rNlEgLK+yaE
         vbdg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2N8vqR6S5m0W5nKJMPrzlfdqoOXuIrGhWBYTneABLNomF6xENwMjG5eS3y1ksiP0/OZswVajjSKzrX73NBS10@lists.infradead.org
X-Gm-Message-State: AOJu0YwjTFp1ApcmnQaPhEQo+q+ebBOS81OFAua8CTdFTCRbKD9jb2wj
	o5RYH3VNaaXMKjifT5nJz5lEQqcSg0gSvaoMxREt/jFeoHxbp3CJC9WB
X-Gm-Gg: AfdE7cmIvFxqnB3ESWYU7XLMqOkIgnUiPmVMVXly4EmVWcDANsJdBhcTEyUnyyv7sdp
	7EyAfpQmOT9iedA34SWwYWklaU0H1Z+yqa2ESvo1hUtW/BVrbVzckK4A3YWdbXV+dHGIqh0gy3r
	gJf6bMlzaINRMukDQlzR11CO8LU4ERfeIWZBPV/QaZOlGXv/Ts1nv79YntdxH2is6xCnmjGDgZI
	vaOeRfNoNfYYl2vgXsWE0OqEH0jivk2tdKZ322OLtY71UySTph3JWFx/WSkxG/AEJYIAsEuwV+a
	3MNoaJOyhFWzD29ey0tZFLocFvgJeG582iX+GvjUGtiR9R9LnpYkhy2RPPcfk1F1jmv0xiqhY/t
	j04Sf+xZMkCeJ0ze33j9Zb1hZh60FhTc3xbmhsEkEb/HHQXB7CQTOflmISUj7ulDScfKnyfsUHE
	aJ03oP4L0xySFWFUrvcFih1zhAynJmTbykAkz7eGolFaeCghpoyfURKdq9CUZoeuAU1XBl9g==
X-Received: by 2002:a05:690e:16e5:b0:667:9f79:35cb with SMTP id 956f58d0204a3-66813436773mr4282441d50.53.1784213018782;
        Thu, 16 Jul 2026 07:43:38 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fe46cd8sm3509707d50.15.2026.07.16.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:43:38 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:43:31 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: hongxing.zhu@oss.nxp.com
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, leonardo.costa@toradex.com
Subject: Re: [PATCH v2] PCI: imx6: Fix i.MX6Q/DL boot hang by separating PHY
 power and reference clock control
Message-ID: <blkjlbskmfiyprh6wlbfilwlgjw3zkbslh6fpogcc5vcfu5dvn@hcrojgleuxob>
References: <20260708035928.580236-1-hongxing.zhu@oss.nxp.com>
 <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708035928.580236-2-hongxing.zhu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_074340_827605_011B6E5B 
X-CRM114-Status: GOOD (  14.15  )
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

On Wed, Jul 08, 2026 at 11:59:27AM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> introduced a boot hang on i.MX6Q/DL variants by changing the initialization
> sequence.
> 
> The issue stems from coupling PHY power (TEST_PD) and reference clock
> (REF_CLK_EN) control in imx6q_pcie_enable_ref_clk(). When these are
> managed together, the timing between PHY power-up and reference clock
> enablement cannot be properly controlled, leading to initialization
> failures.
> 
> Fix this by separating the two concerns:
> 
> - Move PHY power control (TEST_PD) to imx6q_pcie_core_reset() where it
>   logically belongs with reset operations. This ensures PHY power state
>   is managed as part of the core reset sequence.
> 
> - Update imx6qp_pcie_core_reset() to call imx6q_pcie_core_reset() for
>   shared PHY power management, avoiding code duplication.
> 
> - Make imx6q_pcie_enable_ref_clk() responsible only for reference clock
>   (REF_CLK_EN) control, simplifying its purpose.
> 
> - Remove the 10us delay workaround from imx6q_pcie_enable_ref_clk() as
>   proper sequencing is now handled by the core_reset functions.
> 
> This refactoring ensures PHY power is controlled during reset
> operations, fixing the boot hang while improving code maintainability.
> 
> Fixes: 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Tested-by: Leonardo Costa <leonardo.costa@toradex.com>

