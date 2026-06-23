Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D301CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic50QGLcvtZ0vS3i/+z4+DL+suRayRsebfMRMDJCfJw=; b=vQpL6XvVng0hQXqx5KHY+g3nVp
	E0vsBZCLBPo+GBtk/nClmFnncyBD63GXhRJ4vfm3JexcaL3JX8NqRoEffUqz+BZzHfO8FQNpA5vpc
	TPU1E0XGN9FzfXHQe9U6hHlOw7uCf1qXFzge/r87JgDIY3qe+3ijCmhExM7WDd5YL9ifo1r6wMZu3
	Fsu6/apaKI0fH0hj1Qnwy4AaY7D/jPEsQQJJ2+McsL3FEGlybSoAMobKkN5sIDKk6FWT5sDO3Qvz4
	hVFoeT14epMXuq3SXF0cnulsya9qxpTI0V6TFodYCOoj2pz/p0MfNYhYjFLkE8oyEX0uqEtH7Lulc
	iQjjsPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0mL-00000006JAx-2RYG;
	Tue, 23 Jun 2026 13:03:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0mK-00000006JAn-2mRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:03:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EFC441E61;
	Tue, 23 Jun 2026 13:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530831F000E9;
	Tue, 23 Jun 2026 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782219779;
	bh=Ic50QGLcvtZ0vS3i/+z4+DL+suRayRsebfMRMDJCfJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eN/qzKvqGAInNy/HebvMYGmi9onQQpGC8yfBHiYsfyqh3jKSOK8vTZhQNlkvPADAt
	 QoTM93ttGyukAb89gMMID+mAn6Il4qrjbbTKjwm5OomWfXwQ2W5501YjmXweN0I/x9
	 suendL34NNi5wL9csRkkbAmyi5d5NqeMfemdfvntb0jfZ5oT+L41G1v09dqqurUdMy
	 ONXsMJ+Yo+LU1U0nEDcwDBapF8D1lpKW8rAtFh3HxQBC/xiVVI/MEsimTgGnY3B7Fy
	 5sU2WmqG5TgrlkZiHtIaNS5PmfoMBVt8Nsg3sh9rff4w5/AKxFxpw9Rl8EkUBAcDYr
	 PdOOM8QvrJLnw==
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	seiden@linux.ibm.com
Subject: Re: [PATCH kvmtool v2 0/7] x86 compilation fixes and arm64 PMU improvements
Date: Tue, 23 Jun 2026 14:02:41 +0100
Message-ID: <178221837797.2618973.1411525576893271029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
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

On Thu, 18 Jun 2026 16:49:54 +0100, Alexandru Elisei wrote:
> v1 here [1].
> 
> v1 was sent to fix this compilation error:
> 
> disk/core.c: In function ‘disk_img_name_parser’:
> disk/core.c:27:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    27 |                 sep = strstr(arg, ":");
>       |                     ^
> 
> [...]

Applied to kvmtool (master), thanks!

[1/7] x86: Define bioscall only in 32-bit mode
      https://git.kernel.org/will/kvmtool/c/4ac426b16525
[2/7] virtio: Do not modify const strings in virtio_9p_rootdir_parser()
      https://git.kernel.org/will/kvmtool/c/ddb340d8bcd4
[3/7] disk/core: Do not modify const strings in disk_img_name_parser()
      https://git.kernel.org/will/kvmtool/c/63a29eb4e73e
[4/7] arm64: Initialise the PMU after the GIC
      https://git.kernel.org/will/kvmtool/c/d4f6367f9a92
[5/7] util: Set exit status to errno in die_perror()
      https://git.kernel.org/will/kvmtool/c/6bb2256a59c2
[6/7] util: Allow die_perror() to take a variable list of argument
      https://git.kernel.org/will/kvmtool/c/88aeb551e3bc
[7/7] arm64: Improve KVM_ARM_VCPU_PMU_V3_CTRL diagnostics
      https://git.kernel.org/will/kvmtool/c/1cf1acf838df

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

