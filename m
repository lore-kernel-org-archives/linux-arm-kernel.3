Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526FCCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc6pgqWzO31GcfGCTNln0AgR5OIp9uTholSS3yz043E=; b=IXYbLPcDM5gr4bKtE1pLOVVXUF
	DhfEK2aPQYEoi/cU9jT0XEKFkPhovQa5nnvCQRqaSANWtilD1F0dnVQ20F10kYvjH7iwWpH2aR+Cg
	XGUMjtdTyMLycegq8dtEY9zaAhHGRfC0lbwHZATyNdj2VATSqgCrmxFiZnQ2NUFbayuooxiRArsbV
	5Efx6ZDwaPoaEyI2xxyl28fEYkIrdDf60YgYVbRfBpyivIppQe9dpaVkCLzlBJ6cmn7hG8s/qvhJr
	45lbMuQLwz46SKRskPKXJ8lmcVi64j0Vep33m/HclJh0tnlIew/3Hh+zWZQzF8JTIc2XGI0K0hTxv
	u2KodeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgMq-0000000323m-2WZp;
	Sat, 08 Nov 2025 10:40:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHgMp-0000000323S-2UGR;
	Sat, 08 Nov 2025 10:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 428336013D;
	Sat,  8 Nov 2025 10:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C53C19421;
	Sat,  8 Nov 2025 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762598421;
	bh=zmpl9/6Gu+ycYJXFFYRN3iGuNWhx7bx2ECgx8oeCqZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydn3h6FHAWaeJdaQAb7LKY8bkJ2Mzixlyje4BUsl/nYnrBA9rZZmCGsNE6Tk9n4gW
	 NSTC+0wmoI2jU+cAywXO3Bi2C0fsrqOKmjwLYyEaw41Xx1WpXTNHQpIDwKcpr3oaJQ
	 r3vU26WNXYw14T3NfYYqu3unBjRRLUBJJVbhIISBjVg9kF4TSzcnVmBvjp21jnpt8t
	 xpRL7SqKni70GZMh+S+QHk8RtOZ4G981Sg8nCtc7iRNCc3L8E4hSM/wye60LIx5+Vx
	 st1xJe6fkLBLmGi57Sh99sl27+0qJKtO5oJBCASrJYYIHG0c+8t5+34jivkn9CIHMG
	 l2pVhVle6XvAg==
Date: Sat, 8 Nov 2025 16:10:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
 <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
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

On Thu, Nov 06, 2025 at 02:37:17PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 09:30:15AM +0100, Krzysztof Kozlowski wrote:
> > On Mon, Nov 03, 2025 at 03:42:58PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
> > > > Hi Mani,
> > > > 
> > > > On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> > > > > Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
> > > > > have region for DWC controllers as it has the Root Port and controller
> > > > > specific registers, while ELBI has optional registers.
> > > > > 
> > > > > Hence, fix the binding. Though this is an ABI break, this change is needed
> > > > > to accurately describe the PCI memory map.
> > > > 
> > > > Not fan of this ABI break, the current bindings should be marked as deprecated instead.
> > > > 
> > > 
> > > Fair enough. Will make it as deprecated.
> > 
> > The true question is what value was being passed as that item (ELBI)?
> > Because if this was always DBI - device has DBI there - then what
> > deprecation would change?
> 
> Nothing, except not breaking old DTs with the binding check. That's why I
> decided to remove it in the first place.
> 

Neil, do you still insist on marking the 'elbi' region deprecated than removing
it?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

