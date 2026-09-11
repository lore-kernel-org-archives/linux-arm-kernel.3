Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C50C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWJ9/QLmlJdH1a4A4ox4tvmelMsF0lXR1XmcXFxvJXY=; b=xust/ljBq/eK4fwCJSBHyl0tQo
	NeuXKb1rOZ7+YmCzR4Ij7qK4jQWEpAXi2Xhb9gGs5I/xBDb6UPLs2xItmhX1mnxkr7dWs84RJ2Do5
	K7uPNojotmsSu7HYh3uQLQDEPArqY1ZaXZpNtSsD5nqQb4+38XP8EQPPYshK7zC4+g1SfJXaNXkdT
	iawWaJM2yC2m77OCmprzqv9YPYlYMYaP7MlfLa51mJeltMegFWBOgiUGTDAXHGV2WM56Pjh0U53xf
	AazgV1G/V8LeJpkyhLqy8ytrMdmfLTVpuMGyhlosY6zTN31EClKPurcoiKtLo7ILDqvCFwSvTwHBe
	9Ir7ImHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52hV-0000000Gyjy-1TiW;
	Fri, 11 Sep 2026 14:58:01 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52hT-0000000GyjW-10cu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=sWJ9/QLmlJdH1a4A4ox4tvmelMsF0lXR1XmcXFxvJXY=; b=c4MZ28NjcGLoT5gvFsqSD2qxTd
	JvWNXyAS12CEm6CWfG7BXBPNpC0fryaEfoHNgwjdrsSDuyKz+xMNcPZM+6KSyPeJhcr20f424vkS4
	SgTiY+emYvLRLhi/z8TGHUcRPD7CvP7aE0CbO9VBmdZ3HxGv0ZCej8qCUQNMM8WAKykjDDvSk8Fmd
	LzdnLW9Tfv4zw6Gj/u2GgZv4KmdlZPwY/TGMXHhqwn29akk+MG5hjHhX3RxEDalhYKBXdxPKCsxvF
	7OD/I/qRRe/5+AcMQ7SB7q6mINlTLpnv62Xzuu4J3Di1162En8H69+FJNKtPdfGARVplpJmuq8Uvb
	EO+NpenA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x52hN-001MsA-2r;
	Fri, 11 Sep 2026 14:57:54 +0000
Date: Fri, 11 Sep 2026 07:57:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, catalin.marinas@arm.com, mark.rutland@arm.com
Cc: puranjay@kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, rmikey@meta.com, 
	kernel-team@meta.com
Subject: Re: [PATCH 0/2] iommu/arm-smmu-v3: SMMU hitting kdump mid-air
Message-ID: <aqQWrz74_sOmyZrT@gmail.com>
References: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_075759_283364_CF1F4145 
X-CRM114-Status: GOOD (  12.59  )
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

On Fri, Sep 11, 2026 at 07:54:43AM -0700, Breno Leitao wrote:
> I've found that kdump does not work on some ARM host, such as AWS
> Graviton metal, and the SMMU is what seems to kills it.
>
> The capture kernel dies about a second after it resets the SMMU, part
> way through PCI enumeration, and takes the machine with it.
>
> There is no panic and no oops: the console stops mid-line and the box
> reboots, leaving no vmcore, no log and nothing on disk. Crashes on this
> hardware mostly produce no dump at all.
>
> This is my theory, from an "outsider view":

This should really have been tagged RFC — apologies for missing that.

