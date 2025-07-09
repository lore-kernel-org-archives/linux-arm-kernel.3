Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CECC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=; b=1C+PZEJIN3syXir00dxwnkIb8I
	n+WF8vvykQxQa1fgtRTiGWjhAnfLStmvTfyukqX7HxsNfqwPGLujBGw/BGgz9rZFklZbo9NtyT0k9
	bKvi3GRp1foYR6JvklxJuBo2JpyBOWJJqZJ06KUOmo38fE0i9ULWFCJkS+ID88PR7LPg8jU0uFWwz
	NfvYSsmW07ixZoWqytQ6ItGTvK8CCXAge07TaUvcqYfMnJ2CqcLZo+rBXv5oK2WpQi3HVtyZ3TaCw
	McLKwdPd53G4iJ1QYqak1iOBxGAz8Pj9bLovmJdQNEA7qvBtTYlb0Bl5C9i6e9p9I/RTHAIPTEgVY
	rNXs1ZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXcR-00000009JDA-2JBy;
	Wed, 09 Jul 2025 16:26:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVpw-00000008zVo-13q0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:31:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23649faf69fso49404595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071511; x=1752676311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=WZV+sSgTX1ojz+Pzk87v1isjJ+TWJ0cWFvu4ZvrSG9tY/8hkZEJ7hKYsWmwAWYdd99
         L6hLgIkAeROMapZbpdjhlyLJCYa2JRASBAeJsJ8HOrKVkMTnXBNSQW3sV/49EzlLenN0
         uZgtD9AXOuc7nyojt3zZlG6KdRmUVG61xOrl75GPxdKVHc4L2xmhk335rgQz+r2I8IYw
         Q69/JcDTnHORaL/IRiXPV9rc6jTVj1nzssQbB4iNjkluHwTW+UfjVPA6hQwsZkZ2ITQI
         wcKfu/CiHsbPMyeNhNGFxtuq/Ud37U+Ma78a2DtNlO+o2QRg2r4gcRpH4vC8/AyZX2y/
         LZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071511; x=1752676311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ob8aeY+0rAZIUvRDNkYhpVzGwYIQJmUrDC32TtGUBQ=;
        b=eRb+dXGuBArzUZt6DoRoJskLmTygqjjKypI5UKJpNepSOa+o/3+eEX7kd2pn+XA5d+
         54jdmBd8LBuM5Cxy/0cxvge1oEWAzD8oyw3szzL34P257oOruMdMzrupGrHm1Ef77hwP
         WCjetl/R2+k7zs2WRLYGM6nSQJj7gx/qDmrFPRR5tnOmlts+qXyFcm2f0XGf96PoEekS
         WvJHL7Jpk/94Q2r2JSs3Ny+x7LaZPcQZOau7yhyqR+v7+QK+BINL3ib+Y0owGYNCos4P
         BgxGm6IuUKVuHVZJQXQhmk+rNzwthw05evil3UDSL1V+p2b6tPKNVy2TZ4F7nrxFtYGa
         gwLg==
X-Forwarded-Encrypted: i=1; AJvYcCV1jW9uvO+Dpjr3xVS5MrsKOoHdSEc/8IQJN/MtDKj/ZS+Fytr0Ky+Lia59aXP5fBQZQ+iRrKTPdTUM1O/ALJKD@lists.infradead.org
X-Gm-Message-State: AOJu0YyQvgBhfwTqQYn9bcI6TQK9cI6VsmM4tRpRPpJHVJ9HnG+W2CLb
	VG/fhr+BQOyJ6blzzYS2GpLfjKdetmoHc1aPGZSoVOYftgnzYE8STaPPOuhLTC1aUR4=
X-Gm-Gg: ASbGncuSzpr2mhCu4ubKJUs3rhKGgcwR8q2GsQ1eFH3DRIfZSDKJylsgMdD8FuCAMwZ
	cOW88YRNPake948LKt0FR6118tPoO950s1CEomZw2Eq3xiBjhDxkl6MH0IOvzRSeYxUT6Wb6CXL
	yTzT2b0+I8T72kBo4G+aTVoG+/PtKqHsiqn1rCjysIcuIVfeInr1v2Xiw3ewepawkj93A/tBi63
	fypk1BNQ6GNy0R5sxOrP+QKqKWOZFJHBgmJKiECaHdC6COyTSjN5ysH06PonMItmsKz+ucWrT1c
	Da605xaKYaAqe80FlQ9gTAhF5O/o4bM4vRjae0ztiCMERpsRIRUrPUnlaExYkbjj
X-Google-Smtp-Source: AGHT+IEXpbvwTdHDHQUcQtVRwNjYawEjvuYkoQ5Xje633BngDr3uR9fCxc8nAve+MqnqlBJ1YgrlwQ==
X-Received: by 2002:a17:902:e80d:b0:234:adce:3ece with SMTP id d9443c01a7336-23ddb199277mr35277255ad.11.1752071511405;
        Wed, 09 Jul 2025 07:31:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bcf0fsm136242895ad.249.2025.07.09.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:31:50 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:31:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG59VPhYY5deFo_h@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
 <aG1J2_nK-LkLQVRj@p14s>
 <20250709074940.GA14535@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709074940.GA14535@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073152_316892_2F54DB4D 
X-CRM114-Status: GOOD (  26.35  )
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

On Wed, Jul 09, 2025 at 03:49:40PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:39:55AM -0600, Mathieu Poirier wrote:
> >On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> >> Add i.MX95 of_device_id entry.
> >> 
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
> >>  1 file changed, 25 insertions(+)
> >> 
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -73,6 +73,10 @@
> >>  
> >>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
> >>  
> >> +/* Must align with System Manager Firmware */
> >> +#define IMX95_M7_CPUID			1
> >> +#define IMX95_M7_LMID			1
> >
> >Any reason those aren't set in the device tree?
> 
> Krzysztof rejected to introduce the IDs to devicetree.
> 
> From IRC:
> "To me this makes no sense in current explanayton - you have 8 cores, but only
> one can be put there, so what happens with the rest?
> And I don't think we care about something like remote and local ID - it is
> the same. CPUs have single number. So this looks like copy paste downstream
> and thus solve it internally first"
> 
> 
> In System Manager Firmware, CPUID is fixed and will not change.
> LMID is also fixed as of now, we not expect customer to change LMID.
> 
> So with "fsl,imx95-m7", we could know the CPUID and LMID for M7, so 
> it does not make sense to introduce new property saying "fsl,imx95-lmid"
> and "fsl,imx95-cpuid". This should be the main concern that DT maintainers
> reject to add properties for the IDs.
>

Ok
 
> Thanks,
> Peng
> 
> >
> >Thanks,
> >Mathieu
> >

