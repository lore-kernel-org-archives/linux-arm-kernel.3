Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 04:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFGLMoBlVOgugds4B4DTTXS16Xixz4tT84fPGswN8Ic=; b=oerW7SyoYSvCdy0VpTD+UdEJ2+
	Gp+mYgMU/ivlxxqltX0dcQWzanEpBwIXaNAFiXGUhjLw/VF4AZz10I/q0Jscy+q5husJfvLf5COyR
	b/yGEmZkTryN7LIiPea4D9OkOawxkuWmZfHdaH/0xeaxcjKnPxr6uzSx8R9r31g0dy4jy6hPtIlgr
	wQ4+hyYW4pT+At+71M0QU+yw1m4MLrCqjm+vYyOq5/Ib+cGZ5ioYZ4O7R0GGNDFgkaaaFFlVUpiVn
	4I5NzfdIfdhPd765/GYocmecpWDdUGsDPaOXYpiJ+t8tpF5V2fyea0veUa//lArCC2A48xcpkKvqm
	IcqShQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcQr-0000000CjRZ-2MLE;
	Sun, 14 Jun 2026 04:26:49 +0000
Received: from ferryfair.com ([103.227.96.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcQo-0000000CjR3-3ncN;
	Sun, 14 Jun 2026 04:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ferryfair.com; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XFGLMoBlVOgugds4B4DTTXS16Xixz4tT84fPGswN8Ic=; b=RVv1mLtCj7GQkC/xFp3coEbf81
	NINRuosnmUR+QpY7o8iQE9BjzYFLWUfeEdsSGZfn56xW+L8mmAOs6lCG0xRLeLRBiETAifyaTD+fd
	4P3wgPmn+/F4/1H2WIP+Ok9OLwtpPjsIeX9Xw2tDbpILg7GKO5DaNRFggvjQ9SGWIKVw/qcKybpAF
	9kk3jdaQdKoJ2A/bpZDa5X1rNbCWU/DIvr7A0qnzD4mCjmtzMOJ9cYYrN4AT5J8CHRR4RJxZnVug7
	cnnK9RFsMA1YMeCpHnndDzIVEVnKp47Kky3NcM4IYl44uG6rPNracRHUCg1CP+o+eURNU1cC0TjyM
	JjjxUoAw==;
Received: from console.gl-inet.com ([192.168.0.1] helo=slick.ferryfair.com)
	by ferryfair.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <gowtham@ferryfair.com>)
	id 1wYcQV-0000000009z-3bVo;
	Sun, 14 Jun 2026 09:56:27 +0530
Date: Sun, 14 Jun 2026 09:56:26 +0530
From: gowtham <gowtham@ferryfair.com>
To: yue.wang@Amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PULL] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <20260614095626.7afb7c04@slick.ferryfair.com>
Organization: FerryFair
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_212646_956598_4355EC11 
X-CRM114-Status: UNSURE (   7.80  )
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

The following changes since commit
bb532bfaf7919c7c98caab81864e9ce2646e11e3:

  Linux 7.0.11 (2026-06-01 17:54:55 +0200)

are available in the Git repository at:

  https://github.com/GowthamKudupudi/linux.git
  tags/meson-pcie-warm-reset-linux-7.0.y

for you to fetch changes up to 852811b11795ee389ea6a953ed0db69b76722469:

  PCI: meson: Fix PERST# timing by asserting reset before LTSSM enable
  (2026-06-14 09:41:01 +0530)

----------------------------------------------------------------
PCI: meson: Fix PERST# timing by asserting reset before LTSSM enable

On warm reboot, the PCIe controller's LTSSM starts link training
immediately if PERST# is already deasserted from the previous boot.
The driver then pulses PERST# for only 500us, which is too short to
properly reset the endpoint device that has already started training.

Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
so the endpoint gets a clean reset cycle before link training begins.

This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
Cold boot worked because POR held PERST# low; warm reboot did not.
The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.

----------------------------------------------------------------
Gowtham Kudupudi (1):
      PCI: meson: Fix PERST# timing by asserting reset before LTSSM
enable

 drivers/pci/controller/dwc/pci-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

