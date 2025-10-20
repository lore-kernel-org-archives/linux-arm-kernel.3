Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A719CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHVQBOgfMJzCCeFhdkC/b3sv/nMI28GluLmG2pV5wk0=; b=rIJwr3Bz4SJl3wi3i8TBKRUCW7
	5hyg0I7vTLX1gkCuCoZJEMLO808+zJlTDhZ3hFGeK5BZLXUfyPkdGxeKk2Vspne9Xdn256ygxhZgT
	3uVxFecjwpI8XKQJS1cAjTCmFI4AcyLfEghNMxPIIUHSGXV1S8rcLImuPowzgzOJgsaYv5X7XJKxs
	59fTsb6TXWSUTqW5ANFoE7io0VHi0yW4f3CLsqT4CQMS2T1s6yssT5WHjzwVl8fcCMscA5MVt6Was
	zZOBhX919vt0KSQQkXfjNo6tLaFs3kBi4ONfSGQn7TPb+KpJkxYV5HGMht7kX3snOd1FPK1pt82gv
	n7CPVdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArF6-0000000E0rc-1viK;
	Mon, 20 Oct 2025 14:52:12 +0000
Received: from wxsgout03.xfusion.com ([36.139.52.80] helo=wxsgout04.xfusion.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArEx-0000000E0nD-48WH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:52:05 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cqyzl3J8tzB6LnB;
	Mon, 20 Oct 2025 22:51:15 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Mon, 20 Oct 2025 22:51:40 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, <yuxiating@xfusion.com>, shechenglong
	<shechenglong@xfusion.com>
Subject: [PATCH v2 1/2] cpu:Remove the print when the
  CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY Kconfig option is disabled.
Date: Mon, 20 Oct 2025 22:51:16 +0800
Message-ID: <20251020145118.1306-2-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.38.0.windows.1
In-Reply-To: <20251020145118.1306-1-shechenglong@xfusion.com>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20251020145118.1306-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_075204_282907_292B6B1A 
X-CRM114-Status: UNSURE (   5.11  )
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
Reply-To: linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Following the pattern established with other Spectre mitigations,=0D
do not prints a message when the CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY=0D
Kconfig option is disabled.=0D
=0D
Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/202509180=
64907.1832-1-shechenglong@xfusion.com/=0D
Suggested-by: Will Deacon <will@kernel.org>=0D
Signed-off-by: shechenglong <shechenglong@xfusion.com>=0D
---=0D
 arch/arm64/kernel/proton-pack.c | 2 --=0D
 1 file changed, 2 deletions(-)=0D
=0D
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pac=
k.c=0D
index f9a32dfde006..d833b7c1bba8 100644=0D
--- a/arch/arm64/kernel/proton-pack.c=0D
+++ b/arch/arm64/kernel/proton-pack.c=0D
@@ -1042,8 +1042,6 @@ void spectre_bhb_enable_mitigation(const struct arm64=
_cpu_capabilities *entry)=0D
=0D
        if (arm64_get_spectre_v2_state() =3D=3D SPECTRE_VULNERABLE) {=0D
                /* No point mitigating Spectre-BHB alone. */=0D
-       } else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {=0D
-               pr_info_once("spectre-bhb mitigation disabled by compile ti=
me option\n");=0D
        } else if (cpu_mitigations_off() || __nospectre_bhb) {=0D
                pr_info_once("spectre-bhb mitigation disabled by command li=
ne option\n");=0D
        } else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {=0D
--=0D
2.33.0=0D

