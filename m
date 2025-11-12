Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBE6CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpWDz2CP+X9nGGLnLXUARBiwQAPrqWu8Jn1ZRGxzdHs=; b=EGEjuAH/hTBHVp8habveksOP8n
	kYMk2HkhO/5aICbnbtoqUfHbSjlGmszBhBadNexDKH6OR96mmqXSM9VV2kV9Qhh0MydM2DFE7HLbk
	XngVPrAGXkYb54jO53ZFVZqB2R0VADnDBJadWIh9tg3GcQuv+jLml1n6AehFj8XN0Qq1M25YHPELV
	muC1CZ3NPENlIiFmaimSWvDflYzDJEdrrFIkZVKXr8thad2dPYDLbRR9Hvh6BYcO9uOjjGp7V6Fa/
	SxuKKtD7I5oeKqegm2AUWXDz319JEi+9B1pIn4jG/YSoSsF1HlthyD4+Dc7krlucftn4F4VFj8z2f
	SliEw5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFph-00000009NiP-0vao;
	Wed, 12 Nov 2025 18:44:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFpg-00000009NiE-101w;
	Wed, 12 Nov 2025 18:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 505AC601B9;
	Wed, 12 Nov 2025 18:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961ACC4AF09;
	Wed, 12 Nov 2025 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762973079;
	bh=055fA2CcwKNGCqakO62I6DCYxSUugUIeFCK4IyWOGVg=;
	h=From:Date:Subject:To:Cc:From;
	b=A995IPFpTapVlJqGhwaAGw7ocQ0uSewMFDBBtyk/BARi8MMR+cA6dsgCYGiNXIE92
	 QdoFNxhg6k4otIJmkKSGNernxl7SW5/5f4/BCgg9532ZL/JaEtqWDXzwAZrS4rah8L
	 +aJrO/gdz4vp9iKRGafW6voDJ3QD1ETuJiQG14wO43H2Dao2q9bRva+QSC4X3+rsT6
	 ezgXhParowvCx/yKoCVXDjdfIs26fpujzTVG7+zj41pLJwPDOa5VAKH3zAEfpoQL9x
	 2j6MrBHdg7iBpgj6BOc+gr1mZf3VLDhlHWhq7RovvvLOCSZAYFIIJe4a6aqOUdOI05
	 UGCRHep8+/4rA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 12 Nov 2025 11:44:30 -0700
Subject: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in
 an7583_pinctrl_match_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI3VFGkC/x2NQQrCMBAAv1L27EKSGhS/Ih426aZdkE3ZaBFK/
 97gcQ4zs0NjE27wGHYw3qRJ1Q7+MkBeSGdGmTpDcCF67wOuovljbySxuhAW+SHpLd5HnEw2Rg6
 Yq5YZv426nVK55lKCS9FBj67GXfkPn6/jOAGR+b8jgAAAAA==
X-Change-ID: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50
To: Linus Walleij <linus.walleij@linaro.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=nathan@kernel.org;
 h=from:subject:message-id; bh=055fA2CcwKNGCqakO62I6DCYxSUugUIeFCK4IyWOGVg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkiV6fY70/MEmkRqhM71vLBzL0kvufblMQer7viT7N6H
 zO2xYl3lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIn84GVkWLlfgW3R/fOeiTdq
 54Vzn2Wf+df0bOzvrqrujLPak2fnazMyXOJbaVHMqD7nyLf2SH/N7Nkiu00XX1khNe2n8b9dXP6
 ybAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
   2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
        |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
evaluated at compile time, so it will not be needed in the final object
file.

Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
an7583_pinctrl_match_data to clear up the warning.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index bfcedc7f920b..706532a820b0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2993,7 +2993,7 @@ static const struct airoha_pinctrl_match_data an7583_pinctrl_match_data = {
 			.num_confs = ARRAY_SIZE(an7583_pinctrl_pulldown_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
-			.confs = en7581_pinctrl_drive_e2_conf,
+			.confs = an7583_pinctrl_drive_e2_conf,
 			.num_confs = ARRAY_SIZE(an7583_pinctrl_drive_e2_conf),
 		},
 		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {

---
base-commit: 57916750bc0886917ea2c6209ca6a56acb7b8182
change-id: 20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-bbf4cff20b50

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


