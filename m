Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B5FE67814
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+XocHkFUKpDEJpf18SQH85+5kjYH1Vo/u0ss5VVPJPI=; b=LnDs0EY+c2iVTtQ5jglNdWD7fE
	162kgK+OjMdumRz8vZuzA/j4C6SopoR/zsp+WnnUrcUVAJpGrKlzm+XgeIgEgRWAw9MdAQaBC/BT/
	YcP585z9wa4XgpDnhjkjvoqQFq0Uj77SgdpC4WNodY++GZxVOpDvysDR783/Zr/fbq8/OEVI7SG9n
	F6HlpL2n4K1RVTJ7gnbuE4WXidMK6PT/Cs4p8/et6k5UaxRhLOOe0Bp/zQ88dNo4Vb/7TYwJ18eXn
	9sD1bcx/fIXJ6CJdw9PySLSD7zvVQX2VUUOIG90MVFzssjju5VQvboc7EBxgwjocQJeqsvMnEpzaI
	NQlM/PwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7MoS-0000000AXck-3LhS;
	Sat, 02 Nov 2024 22:41:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Mml-0000000AXLM-3OkE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 22:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E409A5C49F8;
	Sat,  2 Nov 2024 22:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA96C4CEC3;
	Sat,  2 Nov 2024 22:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730587198;
	bh=aL8vPt43xOAa05XThvzCfmCy6Q4q+AcnEyVn/oe/3t4=;
	h=From:To:Cc:Subject:Date:From;
	b=bGb1ElCR/c+MYDKNQVBAAScpxc1MPAPifV494KIS/oagZee4soo36OQXiu/B6PwVq
	 CoyZhMeTVS/YKTaNX/7Ik4n3wG0q3Ue5J9DKaMnX8RPnEnhVVvUewQ0tEHu/tX3VSI
	 m9Ey8Cf92FQYA2nxKhA/hFL8Cst95YZBptnni1ms4hv9bTYGP5CJg1e7msWjaDY9D3
	 GC5vv4d6GtQdz0JMB2htF7rGexhRjj+nyjd54NtOTXoRkiLD0PTLW/OdBVWC5sEV+F
	 XexxKY5diKhrEHe17Za3qOZ+OtoDTdu3J52WM7Mu8GgHZYuo21CYH2p48v3UdX+vXS
	 /m6EzIKZiZlAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: [GIT PULL] Qualcomm clock fixes for v6.12
Date: Sat,  2 Nov 2024 17:39:54 -0500
Message-ID: <20241102223956.868257-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_153959_912445_9F5F8BBF 
X-CRM114-Status: UNSURE (   8.00  )
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


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.12

for you to fetch changes up to e7f37a7d16310d3c9474825de26a67f00983ebea:

  clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags (2024-10-22 15:35:15 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v6.12

Correct flags for X Elite USB MP GDSC and pcie pipediv2 clocks. Fix
alpha PLL post_div mask for the cases where width is not specified.
Enable the use of the recently introduced HW_CTRL trigger feature for
SM8350 video clocks, to avoid hangs in the venus driver.

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Fix USB MP SS1 PHY GDSC pwrsts flags

Barnabás Czémán (1):
      clk: qcom: clk-alpha-pll: Fix pll post div mask when width is not set

Johan Hovold (1):
      clk: qcom: videocc-sm8350: use HW_CTRL_TRIGGER for vcodec GDSCs

Qiang Yu (1):
      clk: qcom: gcc-x1e80100: Fix halt_check for pipediv2 clocks

 drivers/clk/qcom/clk-alpha-pll.c  |  2 +-
 drivers/clk/qcom/gcc-x1e80100.c   | 12 ++++++------
 drivers/clk/qcom/videocc-sm8350.c |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

