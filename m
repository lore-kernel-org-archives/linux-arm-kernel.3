Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C71C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4bzWxHlPU7MqJB48RCZkWi7VhwVSBi+YJBgcfpl30Q=; b=YpWF/354elytoB1v5xOT9yWkc0
	MqNc+zqAM2qkyq9RBF3dTvCmcCs181jxgUJav3WjdKgf//Knt0ji6w/Cz4rkuqQ7FOwhUnw19jNzr
	jVDubXeCeJ5G33g/ySkoR0pZwtTya6sq4s96/o58yNWS68dyYdK/TP4Y2M+s4Sd3I6lp3Hj6nijxb
	NHkeXH1TqL8qHGWq9hVi5BUSmN6nAQoLyANlYwyPxB//xTaWc3dZUjj5dVvpsiV4dDp7Sl4KbHT2p
	cwESsqiccvKrbw6KvPF7flBOcTEOpry0d/MnaHYE2M5J7PAbXqpPh/OuuL+3K5BaS+Sbi3yED9GFo
	QVYRVJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8qE-00000009xHY-26El;
	Tue, 06 May 2025 03:19:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4qH-00000008wPa-41wb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 23:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y4bzWxHlPU7MqJB48RCZkWi7VhwVSBi+YJBgcfpl30Q=; b=cQEDV7NUOqcS4m6EQPle4YB7BW
	ZRviYg7Qr98zkOgE/AOs6rzzv7GgaaXNkMSq/TVIJx/rlinmJlY/dw3Non2C3nq9SNiNFV83/+DqJ
	W11Wm5P+gY1C5wAfoxw+91bbbQJC8jm0iCHyRy/n8POfDVE/ONNV3PBv1Ni3GRP4Z+WxlP+6PCmI7
	tecdex8W7ToZiGndPJ8ewxsw/19fPxOOosIHQZGryS1wAHMMM5xRYgs1w5KTW4kfa5/ZBwj+5SDUq
	ic42NXnO3ka7pK2i2MWNkWCvbwaeuT9N5837sF5wKSrPV+8VasXz7z1Pp89gu3evzUhjOnph6S3uh
	rZvDB9EA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC4qE-0000000FZBR-1KRi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CA4EA4D2D7;
	Mon,  5 May 2025 22:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1397C4CEF1;
	Mon,  5 May 2025 23:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486195;
	bh=GVVXTEw23c+3r68phwdy/OxA9lfvg13unNs7GMRjoTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SYkHosweXBv4PMyoIV24xN7hpTxBRCpFHiYCiq6lsvLxRR25nrUthAYv8nBPu8fuJ
	 5D7rYHNE3OeGXEQxLKQ9COfczk3iyr40sW5Ekvco5Y04zWEbwpbs2vG0bMWQlQDzPx
	 fvrUFBQIMcAgivEj8mjWSQa/dbOTNozM4B7WmYNx4XdQZoVW3kc78W4OtZRP9Xp3nv
	 HAeJFpXnXKtNeOi578VePrGHCqJdxbsjWqB0TdyFtdo9+PPRPg7C9ymnzx7DxYGlIO
	 AeWQFjuypwefnpiZUohJi6BvQJwaBNtHq0RxQ4SPYjT7+LrPkZZ/jNSlCPIugWLLHC
	 0qUY20cgnc5/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 198/294] firmware: arm_ffa: Reject higher major version as incompatible
Date: Mon,  5 May 2025 18:54:58 -0400
Message-Id: <20250505225634.2688578-198-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_000318_993129_A696EB18 
X-CRM114-Status: GOOD (  11.00  )
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

From: Sudeep Holla <sudeep.holla@arm.com>

[ Upstream commit efff6a7f16b34fd902f342b58bd8bafc2d6f2fd1 ]

When the firmware compatibility was handled previously in the commit
8e3f9da608f1 ("firmware: arm_ffa: Handle compatibility with different firmware versions"),
we only addressed firmware versions that have higher minor versions
compared to the driver version which is should be considered compatible
unless the firmware returns NOT_SUPPORTED.

However, if the firmware reports higher major version than the driver
supported, we need to reject it. If the firmware can work in a compatible
mode with the driver requested version, it must return the same major
version as requested.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <20250217-ffa_updates-v3-12-bd1d9de615e7@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 7cd6b1564e801..906f0988bb557 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -121,6 +121,14 @@ static int ffa_version_check(u32 *version)
 		return -EOPNOTSUPP;
 	}
 
+	if (FFA_MAJOR_VERSION(ver.a0) > FFA_MAJOR_VERSION(FFA_DRIVER_VERSION)) {
+		pr_err("Incompatible v%d.%d! Latest supported v%d.%d\n",
+		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),
+		       FFA_MAJOR_VERSION(FFA_DRIVER_VERSION),
+		       FFA_MINOR_VERSION(FFA_DRIVER_VERSION));
+		return -EINVAL;
+	}
+
 	if (ver.a0 < FFA_MIN_VERSION) {
 		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
 		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),
-- 
2.39.5


