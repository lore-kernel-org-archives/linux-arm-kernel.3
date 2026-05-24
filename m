Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89747CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=niOxQJJsZUKwCVBFs/P9XxBLtyrby3KTijl8MALkwNY=; b=S1vPjfzT+3wNl0++XwA1fOZUUo
	2WScWknJ+q2BVX/EaTu2vn3j0ktiSntKHhfVuLdOTof2i5qbu9fX4f5gV6H6JGLhnpK4lEK5th/zB
	8Un8WL4hBpnRlX5UxXsxm0VV12JvUzvcOQfALG3XAiB510XmA9uKwiaBfyIbB2W7z0VuXnKDu7Dpu
	TwOAwgJCskmSqF/fBL+Ez1SRgZP2dqS5YW66rFob6iLlp5TpcAZrFLO+9Odgk3oLGC0C8ucjelGR+
	sh+ff5Z94TCaSBxcI+sGtsFgjf/fG2+Zs9tPFI16nglNzNC44jC7RxkZ6elQVSW8rJOD1whRLKIMn
	1Ka3Owlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDqy-0000000FRjB-2ZYG;
	Sun, 24 May 2026 18:47:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRDqx-0000000FRiy-1ayh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 18:47:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D12D601E3;
	Sun, 24 May 2026 18:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB9C1F000E9;
	Sun, 24 May 2026 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648428;
	bh=niOxQJJsZUKwCVBFs/P9XxBLtyrby3KTijl8MALkwNY=;
	h=From:To:Cc:Subject:Date;
	b=Y6/SYUGgdMAnxTk4WX2Ajtjizi1Mibnv2EZc72p74H/+K7SmhWI511tKcKRpQL52k
	 CMXSNMle+279VbjGLeidDcnMfRNzqD5mUZ6Wklt1XtL5X4l0fc3o+FivBIYVWIOXDy
	 IfhOXD1fGvpOWulZo2CLHhPX7Jxb7e7CfxuMzJ7HPaJMm1bgF40hfDzzsDYphKz3v7
	 mUlw2JtdGGxAFsoR+8ln9TFk7xLwoxK2Xl76LKuZcoGhRAxexWoMSknTYHOHVpOGaG
	 kiYYtiubAJ402upToAFS1DvJOycyZGFZHb/02vrEQjgpXQCMzwScLf4CX5PI4TGvYZ
	 ca4PR30XvBzsQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: fixes for v7.1
Date: Sun, 24 May 2026 20:47:02 +0200
Message-ID: <20260524184701.16599-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=krzk@kernel.org; h=from:subject; bh=LCtZAW+AcOeEbyi7sL4pq6RsgIrX7MuL0JX2JoHAQiI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqE0em10qaZuuG4+y717Zph3hsoxQ7QMtqD8Iqp t2on+ea1AKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahNHpgAKCRDBN2bmhouD 16nmD/4pCnIRNSmTu0pj0BC2Z4WqEtRAl+3rdcvTtgTtIjMuK7IWDO0lOv67a437yI1tTjUhNfW gZyEhKVkmVOKKtZ3+O+3DlMyZ/vbzZkYl2XnS78H6hlI7IuzvB7DkhXhCoEdXfFBM6SjLQfjvWZ HI5WsjvfDivp/flbZ9ZQBDX5NmR26YRN3YyBDR9FqYmm4jruB83PcPskmkrlapU0WeeolNOpHUa PQOQAZ6na5OKVmeFYzB+8QzZLwCtJHOGFS8v/yDqtAhca/SL6iGD7Z5aqqk6tQ1ESCyTLI1SdW9 GkzlIhDr0kEBJByIuPpKV1tJXAEmoh3S/ZCmhGDarejH+vd4UhrjD31CjN+f3vREmiDonvevh31 CvPGVkEztAlvIuAEXA8t+W86U6UyyhuhBAgGJzVMFlVCxrAp7K699NaD4sUBYqtVCX6enraH/e9 7zMrMX0CwlTXRVz/JAvK2fs9Q8wxDNWg1kGxg+V0aim8QXpirji/g27ViwJRHBH5nxcEqihwe/I /MtEMDt/EjNR/fwdIsA6DXpgGm2LsfI+0CwNEq6RD3K2mOY/xsDX50DyLnMPuc9yI9lJNh+SVMW ZCaOmPr6y6g9R6AhgvkGlkL3lXxV8LJoFOoujtPYQ3kX56vH75NhLlQh1sFrlzTL5twGcI82Jph 3uBR7XChUr7sdEA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Hi Stephen and Michael,

Just one fix for current cycle.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-7.1

for you to fetch changes up to 78ee734b36284d82454e87a92094fdb926985b47:

  clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs (2026-05-14 18:48:05 +0200)

----------------------------------------------------------------
Samsung clock controller fixes for v7.1

Google GS101: Correct the register name for saving and restoring state
during system suspend and resume.  Lack of proper save/restore leads to
incorrect clock values after system resume.

----------------------------------------------------------------
Kuan-Wei Chiu (1):
      clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs

 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

