Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39FBCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=; b=FweLTC9M3P39GxEZws5Q5ffNKx
	BYebid7MQaYENIo7AEJ9syZZr0unGNf/642My9z1kEKsvk36X+79RhfOuODiODshnzjQiXAjQXvcf
	1HUucHBcQHsURgVw2PEkmIZHEkD3MfXeudxduggSZFuJXnZgqzFOUSBcy+kHHL0Efx8VXsmkDSIG8
	wKVo9Aj9ss82pFgb3aHmXmmJJ5zISuyZIWU9KKUdREkfYutjuNNOEMFxhs4OtC2n2y9xnTH8H9gyz
	KuVOymVD5aOvyVY8zId+eKGJy5y5H47dlWofnWJptbO0dwKJ/3l+aPRylnRqWpwnLgMFnN2+ihfbw
	vmnBQdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlLS-00000003W7y-0TRR;
	Fri, 16 Oct 2026 17:03:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlLP-00000003W7R-1Scb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:03:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1546695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170225; x=1792775025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=FQpRpsFuQJSBbbvmeYDKIsdVSIOF6v9A1j79QUonPX/A1pC36OTZ8Y9kWXRdZT27z8
         XG4rM9zo0H70z7RI/MZLQIyV0NyWHDjzK1FzlXYFkiPZUo63pk4fVi2mRKwbCzzKpaZk
         jUK71kjyqtkpeNBgrnrESF7SoipnBM0tXir0hBbzC3kGlvFJG/jEFj20eK9EH2El/h0f
         +Uy4V+icNBnS5LHykVGJa9LGl2kaQk2V8Y2DZgwIBHrqwuTqSvE3XStnGajvD6c1g+HZ
         Z5LAfOGCHewyViwHKYjdpj9rpD4eEGYHbNdqkGtG8mfdlmMmwAhasOVeAsyxkC6QgFag
         MKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170225; x=1792775025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=C1BaQzeYmGg1xfLJs/gtNgLbnzdBDlr2NL1ahS8NsSSLCSVmLMjNM2r/KVcQchul8Y
         ahJI4tFuD0x0ThUlx4uvXrB+Y7W8v5eNC/fgLwFVCiyiOB9vUhkRwSlaYCBxQIVy3cFk
         N3ly/sqzQqq/e+CBGunPMzC6w2b5WTYmof5oOfeBErGdSs6sv5BLIV5oqoerZLoWyp6Z
         +X/oaJTrW5TM6Sraatw84pgOEL/qZ0N5VNTWCyw5dC2gjQ7VdKMWIkpSNN50PWuKUO5H
         ll+ynIwBBf2KUXvlE1dtnI72VA+4hq+BN0pGLTdmvz3kg6QnQ1urhnvDs9rt4ANr7qK1
         Kw6w==
X-Forwarded-Encrypted: i=1; AKwUvBysMUS81pEuFyM1kKIufjsgfKJUW2YsDmV4h6z/gTZgTczSX4LuVGdznPCYNy7jZ5LSA49TyVgT5frxJHgGyaYT@lists.infradead.org
X-Gm-Message-State: AFq9FYLrVpoa6zT/zUHj+sFaeQpFqqz0uxpgJVfyFtYCXJoxw6uuhVgH
	pECNudQl/MHQeXTYviksyASfwM4D+he8F1tAZZikZPUgPvGBHtagmVOb
X-Gm-Gg: AYBFou0d8eLMz+bqfxn1xQ5E85rz443nwI7Wf6UaVCbBZ1A7hWah4uySPpITgew/8IR
	65t4GglO2h6xdJRz3BuTYHNq6snxwFcahI2AcD+qUxNZkshRsBUrYsE5oEJVhPY6G/gS1BjeXos
	vnffrsCJhpk69HuH0XUhQCJWCHxs/NlUftbjGAiuookP7yurIMRO4pfr8GYazcP2+u+7zSi1ZgO
	6OyM4e4tORh6GF5WCtec5esIedhaQomZNuNQbT7iSiIAV1Yixv9IGWJJP+p1DDigVbwQ2SXoADP
	wpxdl3hGzhSamBL3ZSYtUFFjko5Deft8Cl+AKoITO15DdlAODwXLybUGKEYuCIPaiauCR0u6JdX
	u/fzDSZ1DI+oAjOhpxpcTPJvA/+WcF6bwbUup2rv92GZP0B24mQNkE7JTY/ILNMBvZ3iP81D93N
	Qeg2DLRoyUoIX87TH3KMlnqXYDZwhB0we/Yzyule9lTKTU3vlt8yRvy9BABQtHkiofT5Xt+R51g
	1NiX3JqUhy1yMLf5SZIpX7kYyaadr05YadOEpeJCxonC9zj+UR9Boh5XLx+udyMtmLcvbTsxRps
	RYQxx5bdPVuTsqg0+H7SXG7XgJvGJg==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr10105175e9.0.1792170220437;
        Fri, 16 Oct 2026 10:03:40 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm186598225e9.10.2026.10.16.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:03:39 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:03:36 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atJY6DzjmAeq7U8q@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEci_KwxUdvAekv@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_100347_402671_A9D127F6 
X-CRM114-Status: GOOD (  17.15  )
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

On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add support for the OV5640 camera connected to the Sonata carrier
> > board's first MIPI CSI port.
> 
> Does this board only support ov5640 camera? Suppose ov5640 module also use
> for other boards.
> 
> Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> to define connectors?
> 
> Frank
> 

Hi Frank,

Thanks for your feedback! I looked at the Toradex approach you linked.

In our case, the same connector can also accommodate Basler cameras and
potentially other camera modules in the future, while some of our other
carrier boards use different connectors.

Given these differences, I would prefer to keep the classic approach proposed
in this patch, describing the camera directly in the carrier board DTS.
Do you think we should still use connector bindings in our case?
If so, how would you suggest handling these differences?

Thanks,
Best Regards,
Stefano

