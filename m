Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615F3CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzUqB8Gc1l3ZB4Tk3EJ59Avlc95OFGNMp6MXOzHPn0U=; b=vmXQxE1YQRui8A9RGmKvimGGac
	frI7bxvy2uIYU2svFHCRHdhqGT7kuYE9DHEt7jy8/Cz2kVFA75hAkjWFMVKXsY3Qvmmz1xxczhjdn
	M7Pcb02MhtgYL0dfJJtux8GiQy/4YzvhtHb8kPh5zkXBzx51rinvHFHb+xM8eyHc8zcU3sx5klq1h
	GnWMEV/vETgiS0ZPOhk6qTIXf+zfkJ+nmpYhGQi44mXctEeUBgmPRFRKhRlJshd5nQY/fqW0Jm07+
	IPlgkBMlM5xTLvx/wNd02xcwJFLHOyLdA3rbAcE+jN05Gf6ubVm34eu+6g+73KcCwxFF3C/J25OHT
	Tzs8cdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBEK-0000000H69l-0Yh1;
	Thu, 04 Jun 2026 16:47:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBEI-0000000H69d-2dI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:47:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 636AC419B6;
	Thu,  4 Jun 2026 16:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3415C1F00893;
	Thu,  4 Jun 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591658;
	bh=bzUqB8Gc1l3ZB4Tk3EJ59Avlc95OFGNMp6MXOzHPn0U=;
	h=From:To:Cc:Subject:Date;
	b=HCPsq6i+V09pfMmfGxWoKNEYyGxwupz2Nu52t1RkNAdF0kK3rtYxslp0ZSIfYJwjG
	 t0njQ6W8KVpDccxS4UAO0yQ5QWxPy/Li6Bt3Pw+rvZ+ip7+V9CCcxKwTOBaMSaMbS0
	 VApU/XyCYuFzcbM3k/qM9OAlp1HHzwV1ZIe1snH1WbUjUJgSfdl+soXu1hcwt6NqBK
	 MgayyiNn4hPA+oEXQTo+3WxhbKroODaEmIuLhfdQiPUR571FnRn/EU585VxiDrWvwO
	 DziRfjP0JoOHrkNK5rsvvTg0aQrjFHcMyLWf950Jwjm255LGlPuRU0PKTUucw+CVC0
	 aWCid2xG/b3VQ==
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
Subject: [GIT PULL] clk: samsung: drivers for v7.2
Date: Thu,  4 Jun 2026 18:47:25 +0200
Message-ID: <20260604164729.83284-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=krzk@kernel.org; h=from:subject; bh=YPPo8chYFB6K+I/VduhClAFbvZ2Q8inq9cNixSn75as=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqIawh9/qRh5P2EStG1jdge75NoukzkQxSp+Gpe IfafIhNgjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiGsIQAKCRDBN2bmhouD 12e/D/9szn7IdgDb1ogfGC/rerXAt1JQ4TLsuhxza6M0m9A8mUSAkPEjmH8D3/SjgR9EJM92b4N /AZOU25nzgNc0veD0E4Yt0l/aY/Ps83KdeBpEn3Q3ey80UG68fveDunU1f/aFLh4cgNpV+jgQrG KZQ7AbJ5D+KpKFfktUI5TOIbukRejrH7NwFgO4AKKvrvzmFyifnbReU4Tv8jq/dlAPKAmqeqRNe 12XfhjCPlspltebls8uOcxn7PUslM1E2y4XyTWWfmV4ZcCFjNnV01zKpWSMp4P8SIPZYk4+xaVl g5eDDH3eFHQRc/LHQTKjh1UUintVsRY/wNmRBoQftQU6QxZAdE09Pergeu73vG64ffR2W5VRP+Z Pkc5zqX0w3Fl9tzgCLxgfLGIJ+YhPbhfksbAAp/15+hJYpoqEOQOeaFm++3KibgreHRG/cGdhKO qTijaAot/jnJESCkR8CivFAUOv0CBDO5eHR6QDMmemppuySXwUKFcEjRGlsxdnYNRSVY91bMSnG p7GhKnar2ddumN3iY7jo0Kqk6ICq2RxPfMLCD6YO7U2HQmcNF499evxPTz3p9F2PH+r+04MDM4G Tc/2wEEsZBpLpu88chn8lZMQeQGO09JILx37TP6wsSmNEoDDTdgIkS69RO8CRf/XDbRM0Z1q8gT fKAx3kUWHjepdFw==
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

Notable change outside of this pull: Peter Griffin was added as co-maintainer
to Samsung SoC and Samsung SoC clocks.  See also commit 20550601bf4 in
linux-next and
https://lore.kernel.org/all/178015858043.36212.8088079079471293822.b4-ty@b4/

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.2

for you to fetch changes up to e11560b050ce867bd7d3ccea138231db54e2250a:

  clk: samsung: exynos990: Fix PERIC0/1 USI clock types (2026-05-30 18:50:36 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.2

1. Exynos850: Mark APM (Active Power Management) I3C clocks as critical,
   because they are necessary for communication with firmware but we do
   not have any consumer of them so far.

2. Exynos990: Correct the parents of a few muxes and propagate rate
   requests up.

----------------------------------------------------------------
Alexey Klimov (1):
      clk: samsung: exynos850: mark APM I3C clocks as critical

Denzeel Oliva (1):
      clk: samsung: exynos990: Fix PERIC0/1 USI clock types

 drivers/clk/samsung/clk-exynos850.c |   5 +-
 drivers/clk/samsung/clk-exynos990.c | 307 +++++++++++++++++-------------------
 2 files changed, 146 insertions(+), 166 deletions(-)

