Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB4C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 00:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqldt/xcAytwXtteev0RCwhSZB7KS4Y37ipxJQOWiro=; b=O5FzxsMXoZLhCvO0Pxw7/OtDD3
	INRMaNtwbF/X1xdwrjbQYQWc+7t5LlTAmo6HUbyl3KjOcPPBak2oupJmNcuXX6+IE//x/F8ZNfkem
	VqDQeT1iCi8aPc9cYhj8h+TsmyxT80/yJP2Svj0c8jvaDGaikQloQAtw+ftpLnXYxsRMtX2vGgpu9
	BhcqJfuRwnhop67eg0eRSOYndBQFsAgQFTLsUsbatr8UltoLYbyq57WHi4FcB46HsywjS54XTkJ7w
	y1zhUj8RFIFT3geHUfTq7z6zPNdMgsWoHza9Bq5fIwJy6C2HbcnXKxIZumW9F7QYW/gVtob7CGMeo
	YgQRNnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdf2V-00000009qvB-2a4K;
	Fri, 31 Jan 2025 00:37:43 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdf1A-00000009qrB-3j0J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 00:36:22 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6f75f61f9so222945685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 16:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738283779; x=1738888579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqldt/xcAytwXtteev0RCwhSZB7KS4Y37ipxJQOWiro=;
        b=QfEoxVm0bAeSLa+ACHgPYzbTdP5FVzZByII9xsXtpoeXvBcGH3g3nDCzlGlJDVPckj
         ug9NoCMFJhD7a1jaYWmDG0kzJPO1l6ttxUdqg5uq/orJ4cCjBvUBw4rflLT7WpwpSEax
         mrFSo4BwAwcLVnuBkykWcE2vsy/TBX6LolMNe42+iN5Jdm1RBm8Es7fOR4q2MB+0Z95k
         CvlJHSd7/Nj0tk1+NJkW5GKQugP94lZZyv/KKLkjxBpmgxdhxn3EJY+EL3iF42WtVRsP
         2bveVEDBV76mtgKKHNqNw/fk1DfcMRLguamAYH1UaXPHocrGPPwPgIFeezvBiPdHMj4m
         X0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738283779; x=1738888579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqldt/xcAytwXtteev0RCwhSZB7KS4Y37ipxJQOWiro=;
        b=jlkqmNSRgOvIoMbPuF0DcYT7CvH87TIapVgPHBcP4WH7lw6GkIieqGILN60G7Jf+mM
         SoarLxc3wZj9hXDlr2OMWUu/Lzod1Krt78dzQqNoPzLKSWeQ+IL7Kxyrtnq6IK8HeEk8
         iFireLo+hRqbSDLvFiFOO7eYnyj2y27RdT4ehTJl2578R9mdSA4tpXyTWA2I2vvvPIL0
         il2P9j1zbjgndJ1PAaAmb35EGIqaZCF4CZwUApPzRp3dAAQMLVUOPtZm/EOHYqtnSsN/
         90dnRFGNGxVZk+Fqc7zB8K04ppdfe9GvJ3Pnxs/5p5093SEMM2nzhuk5KNMquQq+h7n8
         +FOg==
X-Forwarded-Encrypted: i=1; AJvYcCX/o+E8MfnM76k7IjIzVtuhaR6Ay2D4MZayIK73ehfXZ6yyver0DG6mHoePAnrRgjU4BxCFv+zFcxNjJUqqco+I@lists.infradead.org
X-Gm-Message-State: AOJu0YxGg/+dYhEueGTJcnXtkVdOHYZK256v0KqYKu3S7dBFw2w0TeNN
	rXrIuAG/P2rngacqsnk36dkye6WVuIqtep2lO7Tw0wLGdzeQLxwUd2Xh5mHvqjs=
X-Gm-Gg: ASbGncv+OU9IPAZ4qSeGcpM0talAoCZ5NBaW0fLSY8ulqMKjlR7HvIdizOVAEu9G2wJ
	OfwTiutbnf8Sw4rZOeTrAKqTWj7XDvBc3/vO5ZX6qnZGU+gBQhglCDpbN6e8COc9UZJd9V8bq0k
	gC6ZtpZHGdPo+hljtxE0mThoF3KrTALe2oBNLioTRtbEpwOFA0vZtKQ5+DXk2ksvMjtLl1rYcV7
	f5j+5Q2RnzW0SQub5d+nGRZYgKKC71u2mX7te0/cfcaFG0sCivj1IAegOjANG4OgGho+LmlnPPk
	QZB/2ETGwt4IcjkWpAc3UhWWIEunJjlXoOWsk1ZTewbDsILcIq+zcz3RDjvkYYQC
X-Google-Smtp-Source: AGHT+IE07V3qiTAW6EZ1X13h/qc9229k1AUAAxkUW5w5v/ZxDuN93Om57N1kexxou5u4vA0fw80BGw==
X-Received: by 2002:a05:620a:3723:b0:7b6:cb66:ad74 with SMTP id af79cd13be357-7bffccdfa82mr1548427185a.18.1738283779269;
        Thu, 30 Jan 2025 16:36:19 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bca3bsm130417385a.13.2025.01.30.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:36:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdf18-00000009rfr-0aTF;
	Thu, 30 Jan 2025 20:36:18 -0400
Date: Thu, 30 Jan 2025 20:36:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250131003618.GB2296753@ziepe.ca>
References: <20250116232307.1436693-1-shyamsaini@linux.microsoft.com>
 <20250120142643.GM674319@ziepe.ca>
 <67901659.170a0220.20b206.f1f5SMTPIN_ADDED_BROKEN@mx.google.com>
 <20250122001924.GT674319@ziepe.ca>
 <20250130232137.GA14836@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130232137.GA14836@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_163621_089642_ED1BC0E3 
X-CRM114-Status: UNSURE (   9.34  )
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

On Thu, Jan 30, 2025 at 03:21:37PM -0800, Shyam Saini wrote:

> Unfortunately, it is an HW issue.

Well, that's pretty bad to have built HW that can't DMA to low
addresses at all.. But OK.
 
> Are you okay with this passing custom MSI_IOVA via DTS approach ?

It isn't up to me, but I've understood the DT maintainers would reject
this as it isn't is describing HW but just a random Linux software
knob.

I think you should make selecting the sw_msi dynamic in Linux.

Jason

