Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7BC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWtHuqnTqW9SLdraO93l+DGah0VpZgdlob2IbGFczGM=; b=snNek4654rA6OIYzAM0GUOEAvw
	JtvNrwJIgf2MbCB9oMsLHE3o9ODvrqPy4hFVCd1XQzWYLl+8EfTQgIG7XqVv8EDUTsE31CaYG3E3j
	5HEykrduTvZGrc3Qd36w9k/8RgWqwIzDusHK84FfN/oCE8iwmbuBS81gFskzHHVB+x5oALqeuvrhP
	BxkKXwzAdzIAije0Z6qVb/rn6W0dFsHkEW9fUlzVhALlUTwA0GKsezYdjezjWyCE0eJ09y3Hq3E6V
	7BhAGNi/dfN0pPGzUPZD2Hy+glTt0H9bhpgRAlIDjXP+NIA2v9DmIXqiOdELmtPZJg6LpBPQjMajB
	uHfVJp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg0-0000000CpXB-2dGx;
	Wed, 22 Jul 2026 21:40:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefa-0000000CpNL-0vx1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3B3E43FD1;
	Wed, 22 Jul 2026 21:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7948E1F00A3F;
	Wed, 22 Jul 2026 21:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756401;
	bh=yWtHuqnTqW9SLdraO93l+DGah0VpZgdlob2IbGFczGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S1Dfi8YyEl6vyEKr83gS8maBJDojpNuLsez2F6xCXFPd9wfppENt0wP+Oor03fqkQ
	 DgfrQMtlorzPtISyAqKmWwSuY8DXHp9xZdfonj/SYO9fzbml6TO/+O2g0/Nqxv22lE
	 rumzQUoJmozPC9BkIW7g5Jl7Y+BBQ5gsgO8lDhsceTWV9mkP+TxIU7H4K7ThvYNrXR
	 mT4bpemgptfKJgvpdsta6a20PRK0TZC/1GDiF4dsK6FDnDCRtvtFtCj+16E50hbRco
	 kcIFATpABOo0hUdhuKunynEgrlMqEDaBxDRryANaSg6wZEvq66e+cJxH3Ig3g028wo
	 3kDh+kVEkIqdQ==
From: Will Deacon <will@kernel.org>
To: robin.clark@oss.qualcomm.com,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jroedel@suse.de,
	Haoxiang Li <haoxiang_li2024@163.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
Date: Wed, 22 Jul 2026 22:39:22 +0100
Message-ID: <178472514942.2872651.16544710591935905775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623071245.1985938-1-haoxiang_li2024@163.com>
References: <20260623071245.1985938-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 23 Jun 2026 15:12:45 +0800, Haoxiang Li wrote:
> In qcom_iommu_device_probe(), if iommu_device_register()
> fails, the sysfs device created by iommu_device_sysfs_add()
> is not released. Add a goto label to do the cleanup.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/qcom: Remove sysfs device on probe failure path
      https://git.kernel.org/iommu/c/c579f18e7959

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

