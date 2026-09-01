Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5820DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UlX93nSvROQ8orZsQua2pNpCMWXVoCfD8XbaC0jjYKA=; b=hlmywxDBpc73ND
	T8MTrXAPzw0vbqGsdwFynivRZDsxWRb4+DeTci196Zz/xOAPyP+fyJmCINwq5sCXluQo5fHFaGK7+
	fxi6OBiBKFl52FaWsJPlNONO/mMxsEI+IBA7zWNnadwp5HaPdPGjCxrCxrjbCPwxOMmXmUC6s7erk
	63Ikri3D6FqOTe44AtlPd70cDp/RjRtbFBImcL7yUHlnmlHazOPBtJghV8baAvmFefWmv7/MRBLH3
	NKKLionHGRzwp6yl/RfExeot4HaQ6/BYqIyVyebctp7Qfex6RbsrW9bKJdJw91YebR8tGfHRMs6K3
	5/YeXwXS+DNTyid7hkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QBc-0000000CRjl-0gs5;
	Tue, 01 Sep 2026 15:14:08 +0000
Received: from sender6-pp-f112.zoho.com ([165.173.180.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QBZ-0000000CRhd-2HqP;
	Tue, 01 Sep 2026 15:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788275631; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R4uCjY+j7B/QtZXR2M7aq1asZZynec9vDaXwE5wImlVNHHAiSSbN12l7iy/VIzvXbQZHrFTxDbhM0CZ/i/tCiFd/MgBeAauOL3ZOiue3JTpGCkr7KZAb6HKF2kZvu/tLBsB+4+79PF5BnYmt+NDfj9vO3Fo8vZUQ/aVb5kV+jqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275631; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UlX93nSvROQ8orZsQua2pNpCMWXVoCfD8XbaC0jjYKA=; 
	b=ZLlyuc1EYvMB5nC+g3vG1vLHdiUJuEt6owWHFodxnJXdvIEzQecZkIWrZiLj50D2vs41aLJ1dFBz28eK6cezU04BNejALkV3cmeqjeFJVrhv7kt6TWe4DYln0Bt4RLXZ7/KDOiPWshlmncXHvftJnRzrQmyLESLJ+ho5bs7ysNk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275631;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=UlX93nSvROQ8orZsQua2pNpCMWXVoCfD8XbaC0jjYKA=;
	b=D01HND6oGkvWYh1TL6+xAcjhU42UqffznR+PBrMdppt1rTfqj7k3NXA0yGqdhwwy
	RZtT1mhuAc0FKOoA8AuEdI9QQkuMHG6ZrXZ208dJsKmNroFEKCFZcHTqS0/PTPfq6zn
	Pb4AUe5c0lp72PmUy0094bXJZWI/Cz4w2MUl0wNU=
Received: by mx.zohomail.com with SMTPS id 17882756295181022.9404483889587;
	Tue, 1 Sep 2026 08:13:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Rockchip softrst cleanup
Date: Tue, 01 Sep 2026 17:13:33 +0200
Message-Id: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NTQqDMBCFryKzbiCxUFqvUlzE6UudFhObRBHEu
 zfVbh58vL+VEqIgUVOtFDFLkuALmFNF3Fv/hJJHYap1fdE3bVQM/OZeRhWRkIs6yzlEZR1YG2c
 BByrtsTiy7Mv39uA0dS9w/s39ExGfqVzmI0adTVAchkFyU3ksWe2317Ohdtu+pVOFp6wAAAA=
X-Change-ID: 20260901-rockchip-reset-refactor-afec01faeefe
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_081405_653652_3256215D 
X-CRM114-Status: UNSURE (   7.99  )
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

A small bit of cleanup, prompted by me looking at the softrst driver
during a patch review and noticing that there's some dead code in this
here reset driver.

Testbooted on an RK3588.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      clk: rockchip: Remove dead code from softrst driver
      clk: rockchip: softrst: Remove unused num_regs member

 drivers/clk/rockchip/clk-px30.c    |  3 +--
 drivers/clk/rockchip/clk-rk3036.c  |  3 +--
 drivers/clk/rockchip/clk-rk3128.c  |  3 +--
 drivers/clk/rockchip/clk-rk3188.c  |  3 +--
 drivers/clk/rockchip/clk-rk3228.c  |  3 +--
 drivers/clk/rockchip/clk-rk3288.c  |  3 +--
 drivers/clk/rockchip/clk-rk3308.c  |  3 +--
 drivers/clk/rockchip/clk-rk3328.c  |  3 +--
 drivers/clk/rockchip/clk-rk3368.c  |  3 +--
 drivers/clk/rockchip/clk-rk3399.c  |  6 ++---
 drivers/clk/rockchip/clk-rk3568.c  |  6 ++---
 drivers/clk/rockchip/clk-rv1108.c  |  3 +--
 drivers/clk/rockchip/clk-rv1126.c  |  6 ++---
 drivers/clk/rockchip/clk.h         | 10 +++----
 drivers/clk/rockchip/rst-rk3506.c  |  3 +--
 drivers/clk/rockchip/rst-rk3528.c  |  3 +--
 drivers/clk/rockchip/rst-rk3562.c  |  3 +--
 drivers/clk/rockchip/rst-rk3576.c  |  3 +--
 drivers/clk/rockchip/rst-rk3588.c  |  3 +--
 drivers/clk/rockchip/rst-rv1126b.c |  4 +--
 drivers/clk/rockchip/softrst.c     | 54 +++++++-------------------------------
 21 files changed, 37 insertions(+), 94 deletions(-)
---
base-commit: c7507e07687010738e5f16926078f78ac0d6509d
change-id: 20260901-rockchip-reset-refactor-afec01faeefe

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


