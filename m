Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3655CCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 03:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY008MPWSsuWGEdFdj3lmBKy6+4tXxccW7r2CevLYzA=; b=w7Q5XHIIpOYMB3Ogl69PzArXLX
	bQ7BvHw9DojxIrvgC4sAhzVFPfAxxxM4O9MxJ/sjg8jAB9+uDZ7nwN9gEQe5YndRgjzFaugK4b++K
	FHoBX2sHXYFPeDB4J5GT1RiI/ImAk76zfbv4QKY0isFlq+UiJWrHT+swTQuZBsamgzoqbUCaH3nuH
	IrrE57o9X9ppehVBDD6rA1pb/dM4Xfc9j04GZV6k5j2q0SH0SuZjkSFj04x55QJdpYawo6XcJh2iQ
	n0Ns6VH5iOJvPGSfcLWdfc4eoPiUVnPjkmOSN4HyAOalWdoWFXs3jHabuPU4NZpVtRrD5gsiO2GCz
	YuKed81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDx8h-0000000H471-3S9y;
	Wed, 29 Oct 2025 03:46:23 +0000
Received: from wxsgout04.xfusion.com ([36.139.87.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDx8e-0000000H43L-419r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 03:46:23 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cxClK0Jz4zBCLfh;
	Wed, 29 Oct 2025 11:43:41 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Wed, 29 Oct 2025 11:46:01 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stone.xulei@xfusion.com>, <chenjialong@xfusion.com>, <yuxiating@xfusion.com>
Subject: [RESEND v2 0/2] arm64: spectre: Fix hard lockup and cleanup mitigation messages
Date: Wed, 29 Oct 2025 11:45:52 +0800
Message-ID: <20251029034554.1839-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.37.1.windows.1
In-Reply-To: <20250918064907.1832-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03046.xfusion.com (10.32.128.186) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_204621_245929_5BB2476B 
X-CRM114-Status: UNSURE (   8.04  )
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

On Wed, Sep 24, 2025 at 08:32:47PM +0800, shechenglong wrote:=0D
> relocate the printk() calls from spectre_v4_mitigations_off() and=0D
> spectre_v2_mitigations_off() into setup_system_capabilities() =0D
> function, preventing hard lockups that occur when printk() is invoked fro=
m scheduler context.=0D
> =0D
> Link: =0D
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2025091806=0D
> 4907.1832-1-shechenglong@xfusion.com/=0D
> Suggested-by: Mark Rutland <mark.rutland@arm.com>=0D
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>=0D
> Signed-off-by: shechenglong <shechenglong@xfusion.com>=0D
=0D
Thanks for the review and suggestions, Will!=0D
=0D
This v2 series addresses your comments:=0D
- Fixed the message to use "command-line" consistently=0D
- Created spectre_print_disabled_mitigations() function to handle all spect=
re mitigation messages=0D
- Added a separate patch to remove the CONFIG_MITIGATE_SPECTRE_BHB option=0D
=0D
The series includes two patches:=0D
=0D
Patch 1: "fix hard lockup triggered by printk calls within scheduling conte=
xt"=0D
- Moves printk calls from scheduler context to setup_system_capabilities()=
=0D
- Prevents hard lockups by avoiding printk in unsafe contexts=0D
- Consolidates spectre mitigation status reporting=0D
=0D
Patch 2: "Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY =
Kconfig option is disabled"=0D
- Removes the obsolete CONFIG_MITIGATE_SPECTRE_BHB Kconfig option=0D
- Cleans up the spectre mitigation code as suggested=0D
=0D
shechenglong (2):=0D
  arm64: spectre: fix hard lockup triggered by printk calls within scheduli=
ng context=0D
  arm64: spectre: Remove the print when the CONFIG_MITIGATE_SPECTRE_BRANCH_=
HISTORY Kconfig option is disabled=0D
=0D
 arch/arm64/include/asm/spectre.h |  2 ++=0D
 arch/arm64/kernel/cpufeature.c   |  7 ++++++-=0D
 arch/arm64/kernel/proton-pack.c  | 28 ++++++++++++++--------------=0D
 3 files changed, 22 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.25.1=

