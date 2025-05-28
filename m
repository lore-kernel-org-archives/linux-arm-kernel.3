Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD92C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YHtjZlzujO+OZY5wLx3avviOj2IXgZPhCfaUncMK/oE=; b=P9OZtv5nm9Ga8K9e4Fix8H249Z
	hBRDeWd62Y4IHe2yJiYKsMCxT8xrJGkgqpTx3x/2f93nZZbmeAJDtqd6lG8LjiwYzk9tf1EMPmYc6
	036ckBjkety/Emg1EPb8JKGMPs1X0FWUXnb3KsTA+zhMvNXZ8/UiWT+/cEHO5mWHNNrP/T4uQXJV3
	hhLy3OD4b5pTvBZNOlyKoUeBTQPLG+9aqz4g/6RvvfHnVVyVwn6XbzS13fwLRGye5a6zRBWNwNIom
	o+OnD+r1rQaIvbyrJBmgGLRpKnezawZIf1mFdMNp2Amp7MvNPrwJccyKOyO/t4i6XzixPqldDdR28
	Ta4SLI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj3-0000000CwxT-0kBn;
	Wed, 28 May 2025 11:13:37 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEQU-0000000CvHx-0ZmG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:54:27 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nnJeqQi36M1JUBeNUekhtBJzrhCM26XoWxcgYcaYP7fXq+cYBNZ90x0c54Lcrx6s75XKMJ1vTVnxBYP4+ZmTc3uiEpsmpL8AFJofttLAaZsg7ofN1zC7EecoC7EcGUFhi74TxnXRl9QErcPUd0xUi8Gx1RQxO6xDZ7ZcM0AGjTUGVcWQyY6dGdWLuEU8cxVVyZ/wGDdLFwShwCS+8QRicaVAdOrU4qXimmtsKAONc6uK/XNGi4GDDsfMpbK76rt0aGai84ddVXpYaVvU1fGoMYNYNaDb3cfr16lboLzCzBOSWGIZ6bBOFFjIZbzPrfm6/W5OptdklnSNyQwgwWJ/LQ==; s=purelymail3; d=purelymail.com; v=1; bh=P5UNf+zad20y7Zm/Q5xw4JbkbAaKqLePPnMsQnYWaNE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:45 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add CMU_HSI1 support for Exynos990 SoC
Date: Wed, 28 May 2025 11:52:50 +0100
Message-ID: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035426_249390_D6FD3D96 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi all, definitely long time no see.

This small patchset adds support for the CMU_HSI1 block for the
Exynos990 SoC. Gates are not implemented as we can make use of
the HWACG system set up by previous bootloaders.

Best regards,
Umer Uddin

Umer Uddin (2):
  dt-bindings: clock: exynos990: Add CMU_HSI1 bindings
  clk: samsung: exynos990: Add CMU_HSI1 block

 .../clock/samsung,exynos990-clock.yaml        |  27 +++
 drivers/clk/samsung/clk-exynos990.c           | 221 ++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |   7 +
 3 files changed, 255 insertions(+)

--=20
2.47.2


