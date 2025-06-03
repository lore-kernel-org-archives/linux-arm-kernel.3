Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292C3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=; b=tdbIBNNrccCd4vRLPIlavnHpi8
	GCJ/CrhzcoFTxzRzSf6uLzq+CGLf/zaI7zIqpQA4zz+5rD9Rq6JSxRALdwQq+Xg08RsBgV+5NFIwT
	WhvTGo3tDuin81nscbXgFuydsVqUiw3umxBJfYil0sAcVLOJuEO5cfB3MVIECMBpTemzucnhajtOp
	YrlIbrqBo9lxqWO3hcUjkGpv9iHcuCGkgLPf65gEZO+a0eBxpk/g6+7Rfd+hw5QyWjBJHyy4lXxjn
	y8Tqze686XygtJ6rTrt7oRg84o2nW7nr6+AoJ+YQArmifdqlTiWeuY33EF7hetNyn109cugcGJ5QE
	U3StaqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSNf-0000000B8y3-0VZZ;
	Tue, 03 Jun 2025 14:12:43 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS32-0000000B62Z-2C7L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:51:25 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a58b120bedso26779211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958683; x=1749563483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=krWoRxFmEiMHKW/MjxaH9TjDAoliwUNHUrrtDuSE4SUtnzTHF28AKoBE6nkl+IATK9
         4XjvQVhYsB0UtkEfQGgUbMZr7TuDDFziAapm+372gA6iqR4FrVc5vmZymTWxUP91/18P
         BIuSnJDia/7qxWoTfcKefhuPAh0OclC1yoz8o91w1wIJVxOoKL58Rvw7cfZoFKQAybuJ
         NrreI7e6vpUvhgVNF2EvWSi1E3DTwf1Nno1RllULSFYJuGwEuR5dP4PGkNNHIrSEQTn3
         awrFaPOaNIJInEEwvYheGiErA9vjMVrX3SsBaps1jHAzg2EHKS9zY+xCD/UNUslBeqbY
         nrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958683; x=1749563483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
        b=dSn0FkmzwiOnQZi+mt1eJzz8O0ou2ztInX6y7rwU9IXVUZKKrLv/MolzKMqMKsVRuV
         gLCWmsgiBn/1s+7PmGICFrEkR5OICFrW7PA9o9mpcaptF+BRf7UN7T7QaxCblKe+ibwb
         iYYdHNmOUbHzkC6TBgJkVTDlYz+E08Qk+r2hDyZQw40/NT/xqFr00On3PZgEvTuccHYe
         i6mTazQz5x7IdWrGK5kP0UsvXUJYR+tPK8aoxObSVBqV2HLGse0Vj9H/8sarasaiu3hL
         L/n4Im9C223ZOYrccw9XFdYmZ24PF+PJa+g5hglr0QP6IjaGf56Yb6iO15tBmyMgCjDV
         XRUg==
X-Forwarded-Encrypted: i=1; AJvYcCXFeyitMOy509jqT+Y0R0Y2+Qhv2OrKzcrUq673Y5+l9Oj+8KS+n4qj+TNIt+OEZKv9ltowklet0g9C8dXuKpjL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WbYBFIpHY68OdAa0rzSocmDOZoPx9qJWpBUWMK77ADg7XdPN
	yTD/bF0InsdMyXs/MT7gpRUXbcDitS7WaSdMka/V1CSwDcOsAefqWIiN/w2JnD4Dig8O5+NNcHa
	Xxuza
X-Gm-Gg: ASbGncvtTyOQN80EuCBgUZIrCj0T3Xjw1ya/YX3yYnTpQpBmJZXrNqDIG9dym1YHTqg
	UZsTcSSSz3MBhc4iBC6yDsE03W7fQRvtRigWvijTb4Z1eZ4BtAG7ZGCQtKurmdiaFiQq1DDKbrd
	cDcbcy7ghpMTetVdILkTqaQ1ZbzcLQjSUTdrXjUiIiZCpsM5qVT31noBrNThijXCUylKrentqwY
	XnYOblHH1fzJ4iFAC/JcBUYWMZLMnk20JPlMTXWDacsZnGMVgT5B+Ko20zMHC2jgZyWK1Jgl83D
	3NCtUBI8oql6xR7GPlcutwplvKP2t/+4i/+HfLyyx8enfxkXo9skZLJ1xXhVa47h5z8mMCoIvYO
	hZsdf9bPwXt3opPGsUwS+Ndwacic=
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893;
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2p-00000001hDX-3xh9;
	Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065124_566914_FD03D6C0 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

