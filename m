Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52B1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G99tVPT35Cx2nG78ZUHeQ7G3ZpSzdoUFsWDICSXxOU0=; b=ai1QUrnwNcAWUVDK7m/Rs/hnIf
	Wlsx/cnQ35OBD4m3tgLKmcq5uPzjEwLn1U7gCPU9UjXH9ThVtLli1SqE9OsPjOYwnwsExky4t5Xon
	2wsus3hHc98FuSShMehA9rpXzvyyftKh+57caAhhv7DNWWW7AesAlt1aNS0L12kjP1txKB1oRy8p0
	PFe0DWhYf8qmr6KcgkgKrPESKQ5CiSDSq/Osfs4M/PB8Ss1ajUaDR6PSA0w6q+oa+UWuJZdnypqaE
	Au6KRy7nrZ4oH8DKSe919GJ/fEpNwUiddipr7HBqLV6QG+2lugSXzOznxv9567wDNuBCy48CqO1l8
	FV1S4tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyjX-00000000drN-39h9;
	Tue, 25 Feb 2025 17:28:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyRV-00000000Y3J-19zq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D6D51BCB;
	Tue, 25 Feb 2025 09:10:16 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B1B23F5A1;
	Tue, 25 Feb 2025 09:09:58 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] coresight: etm4x: don't include '<linux/pm_wakeup.h>' directly
Date: Tue, 25 Feb 2025 17:09:50 +0000
Message-ID: <174050337860.1543266.5427475115330100876.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210113635.51935-2-wsa+renesas@sang-engineering.com>
References: <20250210113635.51935-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_091001_357352_F055AFA7 
X-CRM114-Status: UNSURE (   6.45  )
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


On Mon, 10 Feb 2025 12:36:36 +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via '<linux/(platform_)?device.h>'. Which is already present, so
> delete the superfluous include.
> 
> 

Applied, thanks!

[1/1] coresight: etm4x: don't include '<linux/pm_wakeup.h>' directly
      commit: b2d67616fcf9f0a21940b2ba8d80af2fb0c81bc1

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

