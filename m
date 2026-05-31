Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3CDCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmuO3W1I2r8igx3GUMilp2TWl+RQ7oW1rVuzlsosPns=; b=MBRfXPdJ02VxKhx1ynydwBrqQX
	iVaO0lKvYKUihOOoS28uwq/OspTPeDEfvytKzOA4r9Bp0hpLNSikQL17D1uKPVo4aUCti9k8d9vrL
	eb/44A3NCqaktKtSUTqVQS6l9vt+5LPJQ4Etz6oU+iXXpkEHYpcoopzYsziMhiujlo9wcc0RVBTYF
	LvhBZluCqVmwrbqG0pdmNVeFpoecivl16RzCIZffMu1Yt8Yg5BQoyyHXZM6kwDB99gbeXQNakZ5o6
	5HbU96GgiV5EhgP5/7eSP3Gp9mSxx3CKzJlcHW7cEHst18aghSXJWSmhCXNRGJ4QpSOitUOcqqbSP
	Z6Bxgbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjcO-00000009luI-3pU9;
	Sun, 31 May 2026 17:06:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjcM-00000009ltc-2F80
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 17:06:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf2d865383so1055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780247189; x=1780851989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmuO3W1I2r8igx3GUMilp2TWl+RQ7oW1rVuzlsosPns=;
        b=KsQkR9IGuSL9GwjZNNaomiuRSSqgWaUBf/TZvqBkOdIZ84gO4R638aMFD08poSxWxk
         3E5Z8joWcbGQZcOGMZeB1IEWIYeqhyBwDEYdes5jF+ck2x7F6GD2vnMHlnAGVbCB/xo7
         zmJadXfrvD46UdO6V7ZXAmraob4mLiKfgT/7dim4c1iUnc5V0rwjPtfoiUhsUGJ5yEJE
         JC508DBw99hgXMeIFVfdlD3aMXfm67ysUFTA+FJzRwLZoPpe0eWN8PSzTMPUsAxtcL2q
         hFQO1z+ATSdra7eqxwiDHlzS33+UfV3LN4aGZ8GEJV+5mU2FJeGeuZjhchY7hu2fQp57
         18lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780247189; x=1780851989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmuO3W1I2r8igx3GUMilp2TWl+RQ7oW1rVuzlsosPns=;
        b=CENSJfG/El7CwFR5DnfrrRW4FNiym+mpDyE3Mljvp2Ok2PpsJc8VyctVbEaHGQTR4l
         CoJ/HPI2nhJ6zBt7ZoS2Zeeccw8XlNAZjvmf9IcHDYZjKHqRShvdumPnnTrqhW0aaAaq
         gZvxvPXMSeD4HYQaCQRxTHlitxU6KxO561ClL4lUX26JvLK/+H9hYm5An9fsgT5qBdgR
         J58Y1xwrQw6FTs8nx77WhhGHh8RGPdumC7+dVxJd+Fsr62yKBoWEAQuGSVBmN1Ru4dLK
         9jM/GZN6cpqyaxVlsZjD2sB5otO77i+2pb4R1eaw+MRyOZGvin21Gawf8T8qYN8saVsR
         vAAw==
X-Forwarded-Encrypted: i=1; AFNElJ/uKWiXKw/gPGoXeHZKIAUYZYpPXvGvnnN04NmSmNLXqkJ3BmL//srm30i9j3tKBWsjKxflD+saYeazibLxJGpV@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ3Zxd+n9C9OWwKIc7YL30Wdp9vu2nDd3rKw1lIaCbUmJBZg1r
	56/rcROh0rnXqMxFXFAVckc8Rg28ud5M1IaJjiEbgHhjDGdQQ1JhzDpaTY0L8itNrA==
X-Gm-Gg: Acq92OE5w+s5JHOLFDlcoIrtYPwmupRyZ+9teg+s/hFSQpgwDIQT5lGmSCxT1scfTl6
	4N9JxZ/mjUM6X+VRW4cvq5je3KzjH1JpAWVJ/6QZ1o2PLkmv3bghBSDXiqmYmuv6W60ftbvyMiH
	QWEo7kVmaQWgjCqKaxnRZArO7gDlXc3gKIpFRYHwk5qAbJCGaN62Mvq+SXxQ++iqUffaAx5/cRr
	05oX0jNAwyzHWd0DXl+adAV9M+ETYoEzFajnC57Idrb2HR+5kWYYZTslu6mxMWWflv2u1ONp9gK
	Mlf2rVm5klMYlaDm/p7cnWspAPAei5d7hv3idh1pLJlr2/wLk6MJB31Y3JCVAw321wcfC0ec/7H
	BrAlcjrbpEBIXIkMBJdn9ZeXgkG1dM6jKqNGpdBWBIKbt70HUeCHiAAgscaKqwYZOrXSvzlgCiJ
	M3VUBFck6/Xq9fwIb5dQh9v4kYW2k4w8fK7+jAYe/wKECM4ybVinAj1V63v7kwVhyMYlBWcmc=
X-Received: by 2002:a17:902:d4c5:b0:2bd:6dad:7cca with SMTP id d9443c01a7336-2bf975b1f95mr4195355ad.22.1780247187838;
        Sun, 31 May 2026 10:06:27 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm97965615ad.69.2026.05.31.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:06:27 -0700 (PDT)
Date: Sun, 31 May 2026 17:06:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v6 3/6] PCI/ATS: Mandate checking pci_ats_supported()
 before pci_prepare_ats()
Message-ID: <ahxqjLg3yRzWhgqE@google.com>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-4-praan@google.com>
 <ahoLccjQvmoE90sx@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahoLccjQvmoE90sx@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_100630_602387_AEFB00AD 
X-CRM114-Status: GOOD (  16.69  )
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

On Fri, May 29, 2026 at 02:56:01PM -0700, Nicolin Chen wrote:
> On Fri, May 29, 2026 at 11:12:05AM +0000, Pranjal Shrivastava wrote:
> > Currently, pci_prepare_ats() internally calls pci_ats_supported() and
> > returns -EINVAL if the device does not support ATS. While this provides
> > a silent safety check, it conflates support detection with configuration.
> > 
> > Update pci_prepare_ats() to wrap the internal pci_ats_supported check in
> > a WARN_ON(). This mandates all callers to call pci_prepare_ats() only if
> > the function supports ATS.
> > 
> > Update the function documentation to mention that callers must verify
> > ATS support (via pci_ats_supported()) before calling pci_prepare_ats().
> > 
> > Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> 
> Sashiko pointed out a bisect issue. So, you might want to reorder
> a bit. The patch itself looks good to me.
> 

Ack. I'll re-order for bisectibility.

> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks!
Praan

