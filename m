Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BD8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c03A3LH7d83Cegd5HDCzDLCooLS3wTLR4hiaN3J0A3I=; b=abi6wp+sbfNBhrcNw8iufhEoz+
	V8kiDMiPwREZgZ1QDsdxcaWBNYF0P6uBHLilZECMUOxsPHm5yFr6/OpVzGFRhTRuDYNa2E/WIq2mN
	65fkxh35ov/L/yQY4fPeqaH6F/bh7AFUyeXe4JmQfS3D05fm250YQvAie3lh/SiaCpxPId7Lgy8Ab
	Y1vfHcvQKv1ITW6xEZXE15DVwJLpKj2lGkE3i+WraBn/JkhqJH3A9vAExQtwVx9Dke4VL/sscYiZD
	K8hkCTmlRgQ1PF6D1ct/2JRWgmYCE/m8ELa5/TuGtejx1JJJ5akHDAFjQilAsHW478WHjIiLunNne
	bLOQF5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRtH-0000000DirW-360a;
	Tue, 06 May 2025 23:39:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNbF-0000000DBkm-3lga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB184A8FE;
	Tue,  6 May 2025 19:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CEFC4CEEF;
	Tue,  6 May 2025 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558305;
	bh=Drs4DiRLxahMb8LIqCxbQcciRHLWjAnt7/5/YflhtNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aIhKK3nb7jyNNrVpwUDyXULbwlWgOWNG+t7C5LV9hXshqqAk+jGr52VoCGyoStd4n
	 5hvtDawwjlvWIrf1gcKnkX1QwQle+W5kjaBH7edX77JQcGlycR532h4tkV7c5nKLxq
	 tsqaSYJqf9Jgcff6mzLwZEorQeIExUyB4M/vEyqNOcUXyDlHujXHzHQ1mTQSzRy70C
	 5spBF9iSK/7C39wp7j8zgTF5rYfiLzFZJ5N2Z0ynoMWybhKKk/o5Exp25TzLyDhyvT
	 zh3CQeGSVQvuM8MPGbdeYXbDy7LzcUR5xQsBmbl0ZU1P190GA77UWSJ2lnTFwiHv6O
	 V8IcZOL3WJVeQ==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	yangyicong@huawei.com,
	wangzhou1@hisilicon.com,
	Qinxin Xia <xiaqinxin@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linuxarm@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
Date: Tue,  6 May 2025 20:04:53 +0100
Message-Id: <174653555029.1663285.12170965708138106654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250422112951.2027969-1-xiaqinxin@huawei.com>
References: <20250422112951.2027969-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_120505_954493_EDEB231D 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, 22 Apr 2025 19:29:51 +0800, Qinxin Xia wrote:
> An error is introduced in commit '48e7b8e284e5'. When the smmu
> does not match with domain,an error code is not returned.
> An example of an error scenario: In vfio_iommu_type1_attach_group,
> vfio will try to match an existing compatible domain. During this process,
> iommu invokes the attach_dev interface.The mismatched dev and domain
> does not return an error code as expected.
> As a result, an exception occurs when the vfio operates the smmu.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
      https://git.kernel.org/iommu/c/be5a2d3f8f97

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

