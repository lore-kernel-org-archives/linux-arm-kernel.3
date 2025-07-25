Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BC4C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx1cvWLmG31uLnbCDZX1np35fkcLxkLr007ob70MLnA=; b=jmfYeXgtLao7+uihEyAj2OAS6q
	zerM82/ulPvgH7Oo0yav0WtIm6hxlc560TCmuLjWro0NrZ50oNF0RqHrV1BWQAIKaoc92mPZSiQtp
	noTEtpyhdeMVlJ9X1QfIvo1ukna7XApSfvWSAHgJFvp+jnA0ppz7y2ysrd10TGiJgkBFDElMiWAb6
	8nBIrP7NyQRdYztLRbvMJuN5Jt34Fg6nYWGDv3vx4Iec552yloy/l8pTp65sL8tnTLP3vGc5sc6nY
	KFK9aJ+EzcOx6kctKb1QnzjKJE8cx6FAHEeVjiXyXeHXmsEkCYQDPfzItxxy8xUkBuJw/mLJzXmac
	wvMNsaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEeI-00000009Rrv-3pVi;
	Fri, 25 Jul 2025 09:23:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEZd-00000009RUh-2RAU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:18:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4561b43de62so68315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753435119; x=1754039919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx1cvWLmG31uLnbCDZX1np35fkcLxkLr007ob70MLnA=;
        b=H6OgJzZtHNJFquDsSlgUBcsuJ+XUDm2PTfpPJrhkMKlFvBUHaxfwwBN9QRxKik9Ftu
         z7opyPwcraAjBvQ88LgQX9Rs3rXjBNEIWX8U9lmqLqYXbriXSI0f6UEIeNrMeJrmn5/n
         OjUDwhV8eW1t4agQjuW+l4xt1ceUEeOb0Z6h1/9kXR10QhOEGIhfNIZ5pw0czFH6N++5
         PN5qk/dyAwRqN6018wHLk2+e6tbl69yZFrees6SxaNBy4ZpFUZcvzZridpCCtjLQtYjA
         Lfi9sRJul/oQT8v8cs72iitqyX3APlSwkb+yCVgx/F9C9qYk0O5swoZgNfhI8oSQ5stl
         7gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753435119; x=1754039919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx1cvWLmG31uLnbCDZX1np35fkcLxkLr007ob70MLnA=;
        b=Ba+qpvPVfeByVTtPZ7wzUY9IXEP1PLdCVVcGxCv8QcXFXox9gO2ket+E7qfRmcgM76
         T+EQzFgy2c+N6E3f0A2Yf2gu097nBuY5HvfHKnzplDbX4WdvcAdWd6sLZKEIhgFK1GeE
         +mV9LF9RrTXVmyrtflgh71QBksftihPo/9aNj1xGT3zYLhli4hxbG5nii9vOoXOa55hq
         b8/EI+c6QaDsA0oDjvDhUbE27ENKTCwxjCfXR4svFjoWuEpkWxnme2iAUeKnceZLQ97y
         hqawf9+kOHKXo3x+nS3dmbgSv6C9nI3ckg3PrwtlKM07+oPve9QxY/U+/jPyJedrXynJ
         V7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXI3Sc7tghXUsZHtvYRTfcyST1iCO2UOEpTfh3GDrf2tLP1DMbg4s9Eb5x5+gSpDkSWacufXOhTMGRnGVb7CL+5@lists.infradead.org
X-Gm-Message-State: AOJu0YzVDiht24hBYJb2YuoGs1IvTVsl8x6KfTyC3IU3J6VGa327SFM0
	zZMzJUZE+ZqWJ0XtINdGXDKif4OnDomtL6n4TAkfYELGILN5TdkKj54wxLBVSTU6GA==
X-Gm-Gg: ASbGncv53DWqsnqtSAO3YnsKZ8HV63vD8k355urfCK+u9toFZHfxqG/wIL/PNaqnc4a
	0XQENKHQRUcgaPJT9g2R71WNVfTcNOO2k6cNI5N0bIceMtU9TyW6xt+S7gEZjn+xMGfDHMI1uaa
	kOzrmC6eM5R75MVBdJYqGIedOyP2U7U5OfNcLdB+942EIDQXLeK64xormswSIGvm3uhjh7N+HKv
	n9uy7d9xU3V/3cMOP/h+aj0/7Au7S3bVVI/z6IB7GJmGDYhYJ39abwo/dtxZTEjr6xOy6iOz2Mu
	b4aoO0+SJczbYH214uOakO6ag20GooKvY9L9tH+JZyJ46rwzSXKNj7IqcVBwcXhGIwehQi6+Tuk
	6GURKaXLxraMam8zq5ZL+ygomw/v7BkIGoC94KPF1GZ0F3AYBW25EZQytglNCTvDuH3nS
X-Google-Smtp-Source: AGHT+IG/k0Q54xhpN2oIpbKY4vSeV5TCdZSBuTuoauwrucxpglZQHZulK/b5JzyYYm2oFY7AoMBuLw==
X-Received: by 2002:a05:600c:548b:b0:455:fb2e:95e9 with SMTP id 5b1f17b1804b1-458730cfd06mr1447805e9.6.1753435119066;
        Fri, 25 Jul 2025 02:18:39 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705c4dbdsm49065635e9.25.2025.07.25.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 02:18:38 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:18:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, jgg@nvidia.com, will@kernel.org,
	joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aINL66r_1NO3Nx-f@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIKqaGMMpsIuAVab@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_021841_618442_4212C403 
X-CRM114-Status: GOOD (  21.57  )
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

Hi Nicolin,

On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> On Thu, Jul 24, 2025 at 08:55:50PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> > > On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > > > >  	phys_addr_t page0_base;
> > > > > >  	int ret;
> > > > > >  
> > > > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > 
> > Sorry, if this wasn't clear in the previous comment. I meant this
> > comment must be updated, the "unsupported type" wasn't rejected in
> > vintf_size, rather the type got corrupted which brought us here.
> 
> Any unsupported type would be indeed rejected by the init op
> callback. There is nothing wrong with that statement.
> 
> It indicates that we shouldn't see an unsupported type here,
> unless some serious kernel bug like data corruption happens,
> which is implied by the WARN_ON itself.
> 
> > Had the
> > vintf_size rejected it, we wouldn't be calling the init op.
> 
> A data corruption could happen any time, not related to the
> init op. A concurrent buggy thread can overwrite the vIOMMU
> object when a write access to its adjacent memory overflows.

Can you please elaborate on that, as memory corruption can happen
any time event after the next check and there is no way to defend
against that?

Thanks,
Mostafa

> 
> Nicolin

