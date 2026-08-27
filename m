Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C713C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rLw85QI5KuKc5agEQz75PovFSVMRDvO5mw1LXgC2ng=; b=eMiNf2TjoXH2nB43EdcdKi7VT/
	rtmPrUsQler6U1ymNJV161wpYPmhYMPV1YR2SbdOnVVbwN8P9/lAiz9wB7O0ZwlSRkz3aK7JtSMOn
	BhsNF+Fj4ZiKrnLgSL6c/24FmkrGOEdOvDjl9ovzykIxkmFRU/V6CxS6Ws8izMoDrY3vhOZboGTro
	7PGM89smgAg5voCMJdY87NecF7CbPSm0EizBnZOC97KP0yi2fBjuwoOq9czfaHy++h5ix4wrGQSsL
	mzNbTu470wkwlh70T2kAXZXZcKBZcFiF+KLjgTccwzqC/7daitnEmVrK4XX+Jhs+3J1zgcXEuXGmC
	RL03tZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV5i-00000003b2a-2zYf;
	Thu, 27 Aug 2026 08:04:06 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV5d-00000003b0u-3sMx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:04:04 +0000
X-QQ-mid: zesmtpgz1t1787817806t73a14df5
X-QQ-Originating-IP: EQuvAfVQvBDQc+OBqFpqyOCsJlKRNpzxMs3t9Ors+V0=
Received: from rd.. ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 16:03:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8051406103579778583
EX-QQ-RecipientCnt: 10
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Dalin <liudalin@kylinsec.com.cn>,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH v2 0/3] rtc: ftrtc010: fix resource management and integer overflow
Date: Thu, 27 Aug 2026 16:03:17 +0800
Message-ID: <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827021054.0963C1F000E9@smtp.kernel.org>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NEtAzFYxEdvUlw66KnVgHRLUGs39t65vDz4Yjo6NG1USV2fMvKx973IG
	VfD3eImyXPrbDJElyALKyR6fm56r1thtVhxu0nO1bKOif+SR08j/Z0YsHLcKNLcHJtXKhLB
	gCf1MbUDGijLwZg+heZr121ATzv9WnwLRKaH6OF3v2Ly2OjLcd/rDmTICzAFb8RhPAxTe0a
	lGlkJZLUCjPvczEcihsSuDR8heP3Vl2lIujTRi5S3uiQipvk8K+fXMk4rtIsNDuUfZdFqXf
	Ud6FGeEa9QsK8yzpA651uE6S07GMyoAzczkmtJ/mb8HPL9mU/0yw2Tfja4dKENjjO3lhyvm
	TeXfC2gyVgKZkfrBdmOP/7X7+vNHm8Vv7SOxGcD+ocgCBsBPBlMe2RDGxhEoChwIcLvdK9k
	HAfCZJK67ir6Ve2s0Vf1pHKzp9+CmsV3Oo+5HeNOebCu/Jc9rwLRfHEYKVl2Q8/1KQZl0Vl
	Ye2KXchI29t9PqTNAvt6vm2jbQtdXqHpZdYvHpLGPp5O/XulL1MtI7RxWyxQa4LLY+EcXa4
	49bSYLSmdClEhpdSsPFprqC5CWt+5TvyegmjrdzDXhUWM2+KQNlXmd6F5FMHon57XoQtV3c
	iow2tj5/nRGn3IzOjDcTEvjmb+DEsuf/ooPFirjjh5yHFe8kX4Vgz5W41owhKlN2A9EvDzx
	+xJpuyhr7OYfv2FcN/NcJ78e76Fmuom0GA1YMG3XKcIayVH/yDpUX40J1fIlTagQQ4Ys5A9
	FO5dwbmSI5s+UVaq87vjXERciBDzTK0b/mHYqQCg7G8U/hxNmD/CFvKth9l6utjnwtRXPNU
	EDu4H9Ia8zESFte4gGjfalv4CDBgyui6mrYUAfqwh8BMNZ9l9ek9Hj3IxHG5srqcmaagkoX
	6dq/euJEXeh7PC2rcRYOD9CEkGEQmIc0RDdlc4XejwCmtU7hjPfalvUR9/qLNMfcTdu8kVm
	GLYd2uCdOcTda+RUDsiQO82/AAPM7mU8zpUXZeJHOG4yLvdNLodexsHO2NkfcdAA6fYorEX
	z6Of+2WieF8RhTJSvpM3RKLptmfH0KY+MDPnp5XDDRy3yk85eAhv41zhNueajsbCtVXXI8I
	dypk1ByAcsuKA8k+PXtQjRPlC/XU39brwJNpP3xeCvnzJoRlBna9HFr9SL0TDItmKWXeF4N
	EbpD
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_010402_528555_769F836D 
X-CRM114-Status: UNSURE (   9.72  )
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

This series fixes three issues in the Faraday FTRTC010 RTC driver
found by Sashiko AI static analysis:

Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
fails in ftrtc010_rtc_probe().

Patch 2: Replaces manual clock management with devm APIs to fix a
use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
device is registered via devm_rtc_register_device() but clocks are
manually disabled in .remove() before devres cleanup, creating a
window where MMIO reads on clock-gated hardware can cause a
synchronous external abort.

Patch 3: Fixes integer overflow in ftrtc010_rtc_read_time() and
ftrtc010_rtc_set_time() where u32 arithmetic wraps for dates
beyond year 2106.

All three patches are based on v7.2-rc2 and have been verified
with checkpatch.pl --strict.

Changes since v1:
- Added reply to Sashiko AI review comments on pre-existing issues
  (shared IRQ handler, sequential read rollover, TOCTOU race)
  explaining why they are not in scope for these patches.
- Clarified that PCLK/EXTCLK are required by the hardware and
  devicetree binding, so the old "optional" behavior was a bug.
- Patch 3 received no Sashiko AI review comments, confirming the
  integer overflow fix is correct.

Liu Dalin (3):
  rtc: ftrtc010: fix clock resource leak on probe failure
  rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove
  rtc: ftrtc010: fix integer overflow in time calculation

 drivers/rtc/rtc-ftrtc010.c | 72 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

--
2.43.0

