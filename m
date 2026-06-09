Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3279CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eW0rDfpFsySPqf1AUB4FLAgQw5OmaNrmK8cpMyCc6Kc=; b=wyud1waBuucbjsxV5eDsFAs1Fc
	SYcm3k4Lh92mMMxjQVDno/z9vwUe81yXo1b+lKa7DONIIa/w0mH+xqXf+q2P4egVapV4i6IHpnDTI
	Hvz6le5HH2GWdEtQwoUa2YnNg7F32eFZcEWGYaiRg9DvvKtPNMn99e4hpVI/KC5C9RA/gVAUp335C
	YbcyxG+dglFf03u85zKSBSEj3vdUwKkqBjoSbLf35xzudVZOyrw//IO49Aclz11eZfVditTmJatGm
	wAGBMLKeILMK5KE7xhP3XE/q4lUbNZbCZE8pZdDVsCP9dZFwPOrgGAulFBTVpjMfE9RBS+XWO1e3u
	eKLOfNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWya9-00000005wdv-1NJt;
	Tue, 09 Jun 2026 15:41:37 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWya6-00000005wcO-2d5u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1781019693;
 bh=eW0rDfpFsySPqf1AUB4FLAgQw5OmaNrmK8cpMyCc6Kc=;
 b=ciIobUvlK9GjQCKoGxpAIsfVG4wFq/iaUuqss8vL74PeJgF9/R7c/1xcsRp+sfkCmiiooT1I1
 eSxRKT/LLG6wi79dIkZqEpVNrebuE3ww0cwKPEgiF1gcOn4uSakXAmCR6jpSGWx30B+SZuoi9GW
 hbci+LgecDdQGgUcIPd7QWR2GrP3l23/QExzurHl53qa45oOyxqOmp9AMHYM+FSI+wT+N8Bgxd0
 fVycxKWlCSRa9LBh0S9bp2O4+llUXBBq4nZcmIfqj4BGr59gJ4GMO2VwrF1FbVtvgrmbPYJysxw
 3mpzbfnohHPE6FB/fWjzkj9d+nRbhgu/g6uGCvh7FVvA==
X-Forward-Email-ID: 6a28342a2d71d6ad28f66de9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] rockchip: Fix devices suspend freeze on RK3568/RK3566
Date: Tue,  9 Jun 2026 15:41:21 +0000
Message-ID: <20260609154124.445182-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_084135_073334_BB21E865 
X-CRM114-Status: UNSURE (   7.50  )
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

This series fixes a system freeze during suspend in ohci_suspend() due
to clk_usbphy1_480m not being enabled when EHCI/OHCI registers are
accessed on e.g. a Raxa ROCK 3C board.

Following pm_test modes work on my ROCK 3C with the missing usbphy clk
refs added:

  echo N > /sys/module/printk/parameters/console_suspend

  echo devices > /sys/power/pm_test
  echo platform > /sys/power/pm_test
  echo processors > /sys/power/pm_test
  echo core > /sys/power/pm_test

  echo mem > /sys/power/state

Jonas Karlman (2):
  dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI
  arm64: dts: rockchip: Fix devices suspend freeze on RK3568/RK3566

 .../devicetree/bindings/usb/generic-ehci.yaml    | 10 ++++++++++
 .../devicetree/bindings/usb/generic-ohci.yaml    |  5 ++++-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi    | 16 ++++++++--------
 3 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.54.0


