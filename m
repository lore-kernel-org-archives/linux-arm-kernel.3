Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E43C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjlLTJox+aEPkr7SyVNi+vSqzknO8UAJgxNui7KfZqI=; b=CejIzV0bla/kZMdPNMEyX5RpJC
	9Ppd743wWBNh52H2vqB3pmq/splwuXpZYOWN4xcuGhUSr38x16Kxuhmfy94KuhmwdHcdoSY0r4l9m
	jPnd1ZN24ikPsth29fWBn5qVeqdTwkHhv9XrPA/Nnxf9urYwNPyYxb3xlRP8EeqixtxllpCY2aNER
	BNZir25JcIioMEQuNSy5DaaB0ozlvXjljRdpbCf4xKuOlWnp+c6qqYQBApw91g/6OA/aWffyP0knb
	DsT1MAmX0kHBtyRSZX0pzg8g18LD35prG8WKNtnxx7e42hXwHTOFiKQNv9/PTJkTV7h5cK6POgHcM
	sBvP9kSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMLS-00000002p16-3zeH;
	Fri, 08 Aug 2025 12:37:14 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM0E-00000002mKl-3QFV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:15:20 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-70748a0e13dso16250336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754655317; x=1755260117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjlLTJox+aEPkr7SyVNi+vSqzknO8UAJgxNui7KfZqI=;
        b=Q1J3X6EWm59TJkusHwbmK5LYFz5p19u4hOZGv7BoAACrYD2u7tsdmzuHxkjTSJx2f6
         FGfQBxHiGB4zxCTIyfm7gb7G6TZHn0lf49KK3KpI2O2bPMz6IPmqLKzVVjrDb/ytdXGf
         PlRHHPwY3QvGLcOAOFto3wqp1jg9HHagJ9sd6g2wvZPGn7EDjVJUmYI5OhzZgIkop1hO
         /1BLtDDaqSqhVNAkCqC+pUyYqnxQXYvvOgN5zNwyMHISbosdZmdysEa5IgdB78CKIrZE
         c/ow4Aq3pBJC5OO8wQjV50mSGjLPVRWo0jvHq53Z7T//gOCYvgdYaNyYF2QFxT1GUhUn
         YiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754655317; x=1755260117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjlLTJox+aEPkr7SyVNi+vSqzknO8UAJgxNui7KfZqI=;
        b=HF1Tt+mwmlgUYhJMhGrPwL60omKvv4KbtrcRRYlukDXQoSmb7eo89tqtzDdtPbxKEL
         0onEAEJogS5MaasVeyCIyVw0C6xxZitzTQiE3JO32rjFFH9Vw1qoYDliHzzcgB9udCDP
         j6Pmgpvd9yFu0BlptFHd82SE+S1qxIFbsVAmGSL4HF/GsvoormUsbmQU/lxh8Q47eJO0
         lMsA5qOejUh+bpd6gvqpGnMtMOVye8JmdOwsz2NTxJMip1sj5/ZvB2rEC2K/Ipn2h2qo
         RquIULuyMFVsYYhBfftXFB8mwnwrh/Fb7mpSydEm0Dxhizl7XhfvZAXQpQhlyOPujqdb
         Ru5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmB+Dy7bbaOA80F96iU4v4TPR59yxvUauENgNWfCbLZAHf8aalzueIzSAsCgsZqTUNpCWVlL1nNG8C1NtKF1z7@lists.infradead.org
X-Gm-Message-State: AOJu0YxHMPAWd74dNL471KyjezgEHyZXZXDSJKEN7LFjzDOFbAqZNTtl
	xWAKWipTJChbrfUXaafKdp9GI16fvCodWy4sNFMwvohFCmdmeFjAVoGgMplOURXnRzk=
X-Gm-Gg: ASbGncu0U3mz4cQ5HixWdbiymcQplHujkLh4PjW3nEJQ5RUVFwuIVXHtyh0xywhTx1a
	p2P5J8eRqQ+Audz4rddQSHseFi7Ict0IsRf8yOtLspxGca+cFfLksyRRAxq9fP0HQUj9fbb1iMc
	kpLhzJHZovCMSHQSSq5qzGmt6ZhLATGTL9RFBtmMgGkKf+oSnYwtAgaeWwhuaZzC27T5/58BvKi
	SDNwtsdOSqC/xvrlruHajT0P77uAqQnHsU/4fP7x6L2HR25MXuzXLP+KndT2/pIZB7dYry8EHcb
	t90YuM2dyJjTJpJveSb6/5ACG0J+fq8KZOpeJ4vy4m9FyDPQu02NI4fvJYxx7H4hnbgJgF3Zvd1
	ITCap0rDQ+0DCpqN5MX3lEJJZHfp7pozzP8b88M8Aw0PpDic/a3ZFFLkK/dUxYJ4xlgRml8ZRM/
	Ji1dk=
X-Google-Smtp-Source: AGHT+IFydq6l6b5JXXNn6gOqeE0yXEq9dZ/J9DKgW7tPI3RiBa0ZAO/jnR4IhHmIeHf5pIqVx18YPw==
X-Received: by 2002:a05:6214:29cb:b0:709:3d74:2ed5 with SMTP id 6a1803df08f44-7099a301143mr35261076d6.29.1754655317080;
        Fri, 08 Aug 2025 05:15:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cddc290sm112232056d6.63.2025.08.08.05.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 05:15:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ukM0B-0000000256j-2zO9;
	Fri, 08 Aug 2025 09:15:15 -0300
Date: Fri, 8 Aug 2025 09:15:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250808121515.GE377696@ziepe.ca>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_051518_920533_4ACB3A8F 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 06, 2025 at 02:55:38PM -0700, Shyam Saini wrote:
> Individual PCI devices lack dedicated device tree nodes, but

This is not the case, you can put PCI devices in the DT as well, there
is a syntax for it. Why not do that and have the FW populate it on the
device node itself?

You should CC all the device tree maintainers on something like this
as well.

Jason

