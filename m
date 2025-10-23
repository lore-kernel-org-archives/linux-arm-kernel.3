Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3829CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nuVu2NCjXz8jJvEP5g+aU1zoPZ/sRqG0jqru7JqmYI4=; b=Ezpj1ubQiBowL7DiKigQ6FRGvu
	/OXKohu9zlSHMqysFMY0o423nw7Dn4rgyUnKsFA6dtp0q0G+UCAGrq2aBZxZca8/l7snLwC6oTjNy
	G0+PfxkDVnp0l5AIqoQGOmgGPRCmKuR3nADnjZcDy5qpisTImxvxSEIAVEt1loTxVT7ZUyeK9bWVS
	+3VFMJVQm42w9NaFoGqRh8H5OIoLgZg7trFPOWGowSUxcGLtZOxI65+ZSMshbStavqQHTemfwEEDq
	JVqhqNmsLXX+9wEWa4FcdnrjohDqIznFwU/z6pq+4rQ5fGQJGDMWPbIrg6gJMVLGRdvmDkxWDyPd7
	vHUcvJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqbA-00000005WnV-2pL7;
	Thu, 23 Oct 2025 08:23:04 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqb7-00000005Wdp-3VcV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761207714;
	bh=nuVu2NCjXz8jJvEP5g+aU1zoPZ/sRqG0jqru7JqmYI4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=e+xmSc6ppvLF3/VKA+x5CEzBloM18OPAaSzq1JM6JYle0QY+bpB4hFL/8qtZPjJkP
	 3zFqizfiytQW3t2bHiagDpphH1tgPAhvdg5giOMIBsvOTKvpHmObTCjjQNlWasHFbE
	 trdg0jf79LRHBKN4YeqLH8AvDCJ774I2ZXvw7QH4=
X-QQ-mid: esmtpsz17t1761207696ta4c5843b
X-QQ-Originating-IP: 3/MQeF6QIz9mC8m2fmz4QH6lhabTcyDLi834ZS1yOiU=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 16:21:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15809968397798270910
EX-QQ-RecipientCnt: 6
From: Qiang Ma <maqianga@uniontech.com>
To: ardb@kernel.org,
	linux@armlinux.org.uk
Cc: linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
Date: Thu, 23 Oct 2025 16:21:28 +0800
Message-Id: <20251023082129.75612-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MQPu5pFEJFN4FC2AxXnYnFS0c+i/12zWXtVC++pynRPaul1YR/aSHjog
	V7wYG4Siaxxh7IHCvFd7INhHxNBkEVl6i0RkcProFRYetQH4jx4iYgxdhzh4hau4zF6W4MV
	/PMTVrmrsyy2qhbmWVB8eawBF0dNlJea7YL0im+V9UbYAv3ugz2jA/kTl5sapKOOskoQ8NP
	2SIfKt9+7pixdG3ABms/7sU+PpK6ea2H3D3LQZp7W6/qRouLXAZ+edRjWQDrkw9vREmSEUd
	u1O4Xdc6Z6FjqdxcbrGvjs1fPfY3eAoX9m4B7nWPL7/ib8niEIowmDhddjgGQICmMuExSZD
	FFWQMpTqKNFZ+W3aTY2IA0Es1Bt8XM4OE2l9ROzSYUnMmEdWcoMFkuNfss/Y1KE6rYw1jIk
	16eg3m9gc0ICARdYuihrjZgzpRqVrH74ff9OfnO+y5eNsjkphOtFrjAS/JBJNYyThL8fmtw
	zpxKGDiGkzCtmf2G/1t+NO0uVTA8qmnMziVmhpWwW9Y7o8DxspGd16kCQZH/KruUDAEVTRc
	TPlfvnpTAwprWTRw2XAhz/JmD1FeBYuhDlhCC27AmdKbhMYNNrtkZiB4UYRLuQGhBUhC7OT
	Xwg8Ix8DZ3OdSLiwBq4co/5g1kMb05yms4uq78vhddo4fTLHQtHW9QNxIdNiqelNLYewX2v
	qy3iNJOqTKRJyGLxp+Te9QPP66Ubc6I/SnbH8ArJPWkMreinIpekdF7XTsw//6b3eIYk4KY
	Ki/QQUtY36mf7QJqTkUxIEMHV3odno3zZ+VYZO1w/N34CkLKHOlLhIiAP5mehmVyoik8tP7
	H2RdADQc+3qfjWb/1xakxB4EJSpoGKsQHvt0pkVJ4tQYXp5EUSdF7Uhv6Sn4Dk2luTmn5rJ
	SwMG87Z1pdvAYfvsnK455/3I05I/eqe2c30pBi0XrpZNeogWjLpeSBpilhvPxpoFmZHMR+U
	OY5D77ze5MMWHEbADzbOE834SHnyUkICIaab5awVLmqVzVGEwlq7nYrdr7zIVQnu39HKFQS
	jPBeoB+Cpqx7M9zauRSO6xwPwx90q69ucKdEbNFg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012302_163620_DE993D4A 
X-CRM114-Status: UNSURE (   8.66  )
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

In the efi_virtmap_init(), permission settings have been applied:

static bool __init efi_virtmap_init(void)
{
	...
	for_each_efi_memory_desc(md)
		...
                efi_create_mapping(&efi_mm, md);
	...
	efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
	...
}

Therefore, there is no need to apply it again in the efi_create_mapping().

Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/arm/kernel/efi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
index 6f9ec7d28a71..d2fca20d912e 100644
--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -70,11 +70,6 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 
 	create_mapping_late(mm, &desc, true);
 
-	/*
-	 * If stricter permissions were specified, apply them now.
-	 */
-	if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
-		return efi_set_mapping_permissions(mm, md, false);
 	return 0;
 }
 
-- 
2.20.1


