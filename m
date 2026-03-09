Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AE6FCA18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=08FUjVlWTNMzL5S/exOeyVovYLx6iMeMkiYppdTmvic=; b=24VtaKXntlSMfZ
	aO2Ua8gcyKuQTIW7aOP7tyv/zl8JTnfM4jlLQtdVRd01TqXWvzhdctDG1U0dqC1KncENDmvdoMJWY
	et9ZvIao4Nwf185VcZwrfY2hAmHLOuxMfHFDY8TYX11iTcYSmJf9fabAsZBgbPV0zW8pWSly+LbAJ
	bm62Xi/i7I1tSPm4mZnWsx2hKaWAMcx8U4E4vC0Y0lc0tSTakDzLBnJXf/mjQi9PdIPCPwm8trv7o
	GdDGh7gJIOLN6O71R3bVqaaUkZYtg3iNmh3/6UmUK9iLCagdv1g/aQJ/0pnMCpXWGNpzPG9WHQtwr
	GfCxYr2d7K8Iv6JEuOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhqO-000000089qc-3vg9;
	Mon, 09 Mar 2026 21:08:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhqN-000000089po-2HZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 21:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E215760054;
	Mon,  9 Mar 2026 21:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE8BC4CEF7;
	Mon,  9 Mar 2026 21:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773090530;
	bh=U7I3bh69J3B4cMe2WWPQdGTO1zM2gflc1SsDGP9ZT0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A0L3JiuPR1xjYzTSESZft46f57l2sFUINbyiBwaa6vFAi1NfK83JHNon+cdjeHKbn
	 7dtI21fEV5QD8ro2YvLh2Si8Xpmb/17KnuNGo/q5fBhZ11PkzUawLhZoFdFNhVyGZM
	 h/UhGimNDd/Bac8cHifHRIEZ0rQmMlZ0lNoOeU0rl8G4gzJtuuk805FkZ6Mu2QWd+Z
	 3MmBuE34eHGaY4YmNqZFA/7GR/Hc/hOENwdlrhexbxhowZ156iiF3wnKTE7av1xp4N
	 wTipYJkof56uIJTznJYFJZWnhgT23MKaop5kLLZPDuod/62QnQMcD8mDWMFBsMhO4/
	 d13soJV6gfW+A==
Date: Mon, 9 Mar 2026 16:08:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <20260309210849.GA591344@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-3-c62fcaa5a1d8@oss.qualcomm.com>
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

On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properites has always blindly

s/properites/properties/

