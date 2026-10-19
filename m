Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF7CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=; b=HnF8u28D5Hg86Kx0Oc7+CG3KZk
	bCEK6SxWZv9orqmeuzhz4oiApTlTPzR+xwQedYJ42PkOtkT7aYbFeU4fnQvjA3NcA0MEBTgYsne6D
	ageFbYJyhdu7CQdRGM1yzC4p/R9wzB6oyl4rMN7xQVMgHs+ZSzqI0x/fjTiBWWVlyUUH04YK2rSi6
	0mOUG2ftJ5EAekh7NrO7eg1CZpmdx1sTn/TqwrQBwNZiEiD8Y3lIFWHeaFoG+kefAnpvKC9p0LxeB
	XehgoQdCOCMV9x/QMKrFpE3V3E5mVsFCbiNImi5tEs2kFwOW/6q7XvPymb5aRegz4w1MhNy0gEuhc
	M9OYKn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkWA-00000007AVJ-1Mbf;
	Mon, 19 Oct 2026 10:22:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkW7-00000007AUe-3lb6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:22:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1565557f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=IKUUmCcPUzRvv9ZwhB9UgmRAuYWjLEqqMylUefL0ZCbyM5UC1W+oPALQeOui0+Ut58
         Ne3gsYW4WgvVGxbp/7RxOyqss58XiHEqPM3GPMVfclAk4H8ldaY00ekbQMry81AfmB47
         XW4kAF0A+Y3i7ns+F78yGnGM4rbC79q3YMGZW9oyPoJXKO2eUi7dJHUoXk1oO6s6oTUu
         D2u+dFyM3eIhvnUYzlR5Wnk3UOzl2Yfmr4AipLMY2/HGxMeo6Yn0i70HDYOdE4H514tQ
         ZgfwpKwq0n5iC9MvFvG+9WqDuiBQnPYBBYuLs/vpOloh4TTuBrL8Ky0Od8txEzURTI6O
         AXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=tAacb6qiPoPOQdyvaKKfsra7PFQW/+k3MsZkamrqoyspk5qtgfKlFhTKZ7LJx4c43W
         mJcOT5nEyCuBsb6enZ66LLhyEB5guxDuXswjbq0VAuVwxmUVAwqqBUTJDZBMM4AjVXwb
         unfZEabPTgBbzVR9uqpK+RWBsdMpbezRxNi3KyZOAZwph9EG2tOyiXX9D4I9/30UOeoX
         7aBZk5sE65nbpju6c1FVqpRBY3npLlAQOGRCkjt4WgyUoDrlyfUBXvU+v4Q5OjVMiEPL
         v7WqENK8wQtS9uG3vMUsEW9rzJ+1NQi5Qz4tO0SJ1AtxH7Nrne1YSnlRwpLbJlye/X1L
         dZhg==
X-Forwarded-Encrypted: i=1; AKwUvBz+ViVqXvZUGvADtgRQDAOyEBLUzp3+KeJq34jsde4ek9kIpfAb7B9U/ObLJgifz+cyLAJlf5FlgpFsVtHMt3eW@lists.infradead.org
X-Gm-Message-State: AFq9FYJ23GtaUlyRvHHd+T9gWc+XHbwcCLAkDHHWPW5UumCuAiWTi8s6
	Nt5a84A5Je+aDdpx1GYsqvaLVaACtc36CQ4SMj4J4r2vofqbHpNVfNvQ/M2k8w==
X-Gm-Gg: AYBFou2OeECVmV3JJS7Y9Fp3iCuNbO9SRGd9+J49bm5+O06EhJUxoHCwhEVJlz/1yVm
	6FivCJD7to+ni+ihK1prG9eY8j2+CjA/7l89WwRZ2qaQGckd5+/IorGeoNVXPuiWYyJBNrfDJvK
	e+NJz/tRjJcxK95T9OliDkb8ge/pC1YURkFBIDfASxW1iUEgM2N5a1s5ElXydkrUIThgUd7aAVn
	3NMU3bs+pO0VwNXZA8vs4acpPLWFY6GWfGMuTtvDoDcEUExpaSUKCEKoSwMkLD/ScOMfCKOgoRI
	DvM9FZHJJXQazX0toadO7D6wE8om9N0JGiCeQ5I2M5nqqnS6trJNKTnEEcAwr/hQDdEVUx9zY05
	t5jfBQehyFjovApL+tN9TEMexIAkKSvUoBUFVC38FlEqhwTmP6zDqTL1683dUvDB/WgKNXMpnmR
	01jd6+Zd5RkQKyFjayCJZErIVnCu04baACTdirCbl0G+NIzQD6qRT21RF2zvrnUcO7qQLrF9i1K
	ezwRgF6gn2kEM1SbJl8qG0FdYlZwEX0nPqSf/f/vd0Q/fM2xaUk7PxOAj64bRdEoBjeyjSFSXoa
	WR2Atq66HLXCMTfYu0pGp4arzpGVhH2NYFIBCZQ=
X-Received: by 2002:a05:6000:2889:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48e07fadef3mr14864487f8f.48.1792405373733;
        Mon, 19 Oct 2026 03:22:53 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23771242f8f.6.2026.10.19.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:22:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:22:50 +0200
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
Message-ID: <atXver4B2Acc3z0w@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
 <atKHI1B0hL6q-CmY@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atKHI1B0hL6q-CmY@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032255_955599_D47D61DF 
X-CRM114-Status: GOOD (  26.88  )
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

On Fri, Oct 16, 2026 at 03:20:51PM -0500, Frank Li wrote:
> On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> > On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add support for the OV5640 camera connected to the Sonata carrier
> > > > board's first MIPI CSI port.
> > >
> > > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > > for other boards.
> > >
> > > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > > to define connectors?
> > >
> > > Frank
> > >
> >
> > Hi Frank,
> >
> > Thanks for your feedback! I looked at the Toradex approach you linked.
> >
> > In our case, the same connector can also accommodate Basler cameras and
> > potentially other camera modules in the future, while some of our other
> > carrier boards use different connectors.
> >
> > Given these differences, I would prefer to keep the classic approach proposed
> > in this patch, describing the camera directly in the carrier board DTS.
> > Do you think we should still use connector bindings in our case?
> > If so, how would you suggest handling these differences?
> 
> Need understand whole board familar, basic Two problem:
> 
>  	Does carrier board support difference kinds camera?
> 
> 	Does carrier board or camera module reused for other boards?
> 
> Frank
> 

Hi Frank,

Yes to both:

- The carrier board supports different cameras: we currently support
  OV5640 and Basler modules, and support for another camera is planned.
- The OV5640 module can be used on multiple carrier boards that share
  the same camera connector.
  Other carrier boards in our family use a different connector.

Given these combinations, would you consider reasonable keeping the
camera described directly in the carrier board DTS as proposed in this patch?
This would avoid adding complexity across the different configurations.

If you still recommend connector bindings, how would you suggest
structuring them to handle these differences?

Thank you so much for your help,
Best Regards,
Stefano

