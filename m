Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B9AE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 00:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zBMw4h5r1DHd9vdVz86pK744fnpBsE1YtwHZmWop23c=; b=dzXlbqJQH+5f7jLRxLl3bEd978
	+bFY118CZGXIQpk/DYK2PAztnQqJWCCKo3q17wznSCA96/dowqJh8dhhWZkv4/OFIH7ugLvKvp8JO
	uTVh+NU+n1ei9T9/EAdyyegR4+VVKPJk6N0T1vsJiGN2YBQ4LdEAawF4NNSjiLWLHgZcTut3KL8zx
	zVf4DAdpY6efoeH87bg/6RivGEnnK7YvVIGv/MyHi0hqLfLalE1FBMWyzTuN4Fn76iRTHlKZddUUe
	3I3UG1hrzgB1I9FgU5VaINDM933h3GkGzNOBqFiz1mOeX/rkrLEmwxZQSUBSic+JuZ2svL7y9WAoN
	XunZBWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOvg-0000000HKMl-0P5C;
	Sat, 11 Jan 2025 00:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOs0-0000000HK5E-3lC2;
	Fri, 10 Jan 2025 23:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zBMw4h5r1DHd9vdVz86pK744fnpBsE1YtwHZmWop23c=; b=pfRjVKVg6kMl0d3WlEhzuDW4El
	QPrYeHsTiiqlRGwbsRVN5OtghBkLoTYcBDdYvpCAtoI915nzufgpQapVxrSI7PqOjeMVx/LwDZVJs
	ukyqX03Y19AsGSpOl4IebRDa6W+Tgy7wIqJh47FSVbTYi4WVWZGJtVJhoe46fv8j2T+lDsC8/Zqjd
	nOqyPwf2OsDk+N8hT7z+NlM1zI4SBwUXt7Fj6x3icxv63ECk3jBH5ujLj1eEz1vHo/fooorin+qtn
	px3FMed+OnBpdgc3y66Y3XDr2i0AfQemxcqta9nT1zl3MzS6KtEuWEtX+tx83Oj3PGWGNN+Yx/Xrg
	N1AjptVg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOrx-00000009wWJ-3pGZ;
	Fri, 10 Jan 2025 23:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zBMw4h5r1DHd9vdVz86pK744fnpBsE1YtwHZmWop23c=; b=xNsp6Tt6ESw6lcgSZTb42kNonk
	UlSTfW2OMXLK1KXKvWgs9qQkDkCUEAA5GpYt5HLIsMKT3HOFyo1e1TN8qVzpz2YRcZ+1CFzWBeyQU
	hS/Bw7+V/wumPz2o80BDEgo6nFd1T0wzLFKvlszMEYj3PzE0U13jsbiEoUn/NXNKFdL/snPiGmRgu
	Im600I3iHhKCXx0UqN1rwn9ULtO8PRtSIqlCMYkY2d4e/jRjiCLbbiX2W1xap8VJDW0N0Bt5hkEIY
	0jMmQr3AX/fxu2sOnoGZuadPctEg4JQSZJktISSKVi/BYYm9wAY/VPCjpbWhlxtRz5kPWA/yTcUmZ
	FIxWYwfQ==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tWOrx-000105-85; Sat, 11 Jan 2025 00:56:49 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.14 #1
Date: Sat, 11 Jan 2025 00:56:46 +0100
Message-ID: <3095859.687JKscXgg@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_235650_213247_49BFB907 
X-CRM114-Status: UNSURE (   7.64  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-defconfig64-1

for you to fetch changes up to 06835ccec2efb71d54a810265e8ef69b1011608e:

  arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP (2025-01-10 00:21:25 +0100)

----------------------------------------------------------------
Rockchip DRM extension for the DW-HDMI-QP controller and rfkill-gpio.

----------------------------------------------------------------
Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP

Nicolas Dufresne (1):
      arm64: defconfig: Enable RFKILL GPIO

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)




