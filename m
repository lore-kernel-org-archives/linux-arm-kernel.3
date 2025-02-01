Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6F9C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=; b=3KU4xqyYCou4f+9xUOXxTKIOWq
	J0+4+XGPXThi8/XPI4PYI1JedAGnSIOJY4yJIqa2gsXQnArcoPNr7KeI0Ha9J0GWRFUetwqsQseBV
	SuHXKBr9Z99vti42VK3AJUD3H9goMX6JUtT6BdXmavtN7JbEciVTAgx/sD7xkceJ2c9a56L9Lr1Zb
	VHzwMQXlw8bOoZbYUYL8Vh8N+/BO2v0w+wlyrYe+SAx8r5BlQ6HxXJpxbD57eeufknnTewbSFN7u9
	w7EXQ2a+VXzv8s1mYQQYML7ebglbFD20eW0AkKIXnuCd//eDLj3gskP7G7mQxEB90pZPKzSNcsHFG
	drtRw/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGKn-0000000CrYV-1xx3;
	Sat, 01 Feb 2025 16:27:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGIm-0000000CrLu-276O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 16:25:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21ddab8800bso41466505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738427100; x=1739031900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=H0yjddlqcXHnnB9Dl4XVIBxpVmhO3YnC/o3pWuZEn0U4aSG9qKta/DMtxwdpPbGCTx
         pxadIutHPC4DBNCRunwSzgEzKUItgizSkypnSJ3sdkexqJbGhQL9lFblIY9P7ur8BEhJ
         xeTsjBhny5TBtwk1lpRGywR9opER+mEcEWIPLE5zCTJGMtgzfdSmBNmge3Q2a62BcLRG
         X8h3q5CIyQZNsN7rkleHB+ZuWls9OT0o8H9cljjb1emMVbn/LsdaZA68T6qlS/uEtmUV
         xw22ZlJ/rOKdYsjKnIGcclSF2Jx3jVN89v61hSRXF9LvhfYW4vGF6JRBOUk6yDzhufCh
         eJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427100; x=1739031900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=mmRggQLPXRG09L2RVBzsKLrBjUmBFEnBRZOykORt+ZvkzMsYDeSYrU2EhsnoV36qPo
         JeNNllzTMdp/cKnkXd1a9YtBlYWALq2uX4vYWFVLJpTDO8Y0JePoC/+bIe9+NP4qziql
         Jjknj6W5aOlso/Nv1i7b30ndNYlxs3ITDtWla9n8oIGVDY4kbN1JC64pG9Sh6dhvwUJJ
         +90KUAwA0mcuLIlCgnUViJPxy1sA8Ivu/Ng6RdWHTai30Ek8iBkj2kkjE/6qbQXokS4e
         PddNvd0MuPOX+IZvn28LkJip8RNlJbcEad6xJR7NzVdpthWMcei8dvPGvzrqZOwenbqS
         xDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3xNEfamMjyD4K1jX+JoPuG3zO7PYgDcKvn+v+DEm/1DhUFJlT+SjSLSrdvXyb5vGYUcdSRdP1G7CNtzBgQPNv@lists.infradead.org
X-Gm-Message-State: AOJu0YyrhShMHC/PprrnZxPe8rr2j5eSyNwxneVckhAtbP0WV2Vg4v6n
	fG3DLU6AuWBfIcwKfLS6ZbYx9RJYMJ6EqplRxTFFz/mjFgEueXF5SFFUQcE96Q==
X-Gm-Gg: ASbGncuj2r2OWnw1Oj1OOJ1ywL7uE9BzKVIBQ1bMxh5Ax7l6fFViYMiQrlULakxDbXP
	PXeixKZd0TMnzm9MKnQ5k8I4U22MILmkGeOO72htdQ3KaAJVMLgTe4b7foNhUpHVgFYrqQWboUX
	neiWN09j7oLbOZuQucS+5jGJzAC/qcAtze5wnqhJhvvFviArVAV7IpILU4mqAmW/PX4P5sQsf8X
	EIda7DkkfxhwreXc20MlBh3snARnEBhIznydZkwC31olF8Pc94X5QE+Qu5ze2gbMxv7TnTUyX4O
	d2iuwU9QhO4rFoKF4paGI1bPj4I=
X-Google-Smtp-Source: AGHT+IGTWHq/F06CpcrmFryngFoTcdvCxiBh6JdgpfJOZKD+GgbyyI6EvDWMGbH+eGJ1NmIPO9v+cA==
X-Received: by 2002:a17:902:f690:b0:216:501e:e314 with SMTP id d9443c01a7336-21dd7d74aedmr224666875ad.20.1738427099834;
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm6324512a91.3.2025.02.01.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Date: Sat, 1 Feb 2025 21:54:53 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250201162453.rwnd7igaiwnngdlb@thinkpad>
References: <20250107052108.8643-1-jianjun.wang@mediatek.com>
 <20250115173156.a73ntoyyn3xy52ze@thinkpad>
 <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082500_556951_3EA4A60D 
X-CRM114-Status: GOOD (  14.74  )
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

On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > when
> > > building on some platforms.
> > > 
> > 
> > Strange. What are those warnings and platforms?
> 
> There are some warning messages when building tests with different
> configs on different platforms (e.g., allmodconfig.arm,
> allmodconfig.i386, allmodconfig.mips, etc.):
> 
> pcie-mediatek.c:399:40: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:399:40: sparse:    expected void const volatile *x
> pcie-mediatek.c:399:40: sparse:    got void [noderef] __iomem *
> pcie-mediatek.c:515:44: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:515:44: sparse:    expected void const volatile *x
> pcie-mediatek.c:515:44: sparse:    got void [noderef] __iomem *
> 

This need to be added to the patch description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

