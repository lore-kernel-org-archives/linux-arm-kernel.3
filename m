Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C5EC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=; b=IApzPzAD3lnBlowTS6gghFsTJn
	31fH8SizybmAiLXknZrTKMAZYxn+q/Xn92YQZwJDeBgejBI2sP1s+wwXSJW231UmfUbAH2ZQ+yQQT
	W2d0iYkPHeEz/0ClS+b+75XJ/gQIk2+17ePsLYRr94fxZnTeGR/3p2P0CC7qto0N432txDFEEukj7
	rNn5LvIOv9grwnWOcKsGhbx3UgM84vnqTn4EehIFQA9Q54EjLgwIJPjnG1mzSjghmmrjNsXvEjo2c
	wVNQnRwg3uG4ebQk8OcQxC/QujHPR/Ai9FHdPcRsiUhypOU3gpFrunMnpqstU8PGG38tsFz698Du/
	RVg5HX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kqO-00000003NiL-1CY2;
	Mon, 21 Sep 2026 20:42:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kqM-00000003Ni2-42dE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 20:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=; b=WvLop9Tblzw3K9XlK7vuDDEGfF
	5phKJF8N8fnklG57b0kBjHSAmdBaOQjmw2l0qGevujr+QHy7H8zxbSod6gwk1qxTRUB5GKv+EQMyg
	NJMOEmvTZ5pifEolc+fepGxIjyqr8QGxuc1rx+XUdHpow4CdF9Klahy6RfI0UXpLcE3k87C5JnIJW
	yoSvSTuok+V9JTvOhXDAmIkqr5WRTc6vX1zNUU5JECLWItBtgJVLsFMv7UzYUe/JfuxLwUkS34mO5
	TjaHPnNiCpPc/A25sSZ16iJHmJfLx3JTZEKNfIRlXdVKyJcDTdkrZOFTlrRU/FJ57K0IiBrghqT5V
	velrqi/A==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8kqI-0000000Co1O-25XO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 20:42:29 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so3347338a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023344; x=1790628144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=Hr+7T75/9t3xU5pu4IxYfE/7IYUIkB27etvPZBe+oa2H4xMIz5Xh9XjlNFjzqm34yc
         4haYHJnteZ3+Q+ZqKNVB3BIiAeg1UxTJzv4Cc3E6tnkgeGM7hi/XdY6rOP6+uS6tcnMt
         fB/nEWBja5JpdeVsA22tSj9ZlcB/HQLeUKhUkgGeWAbSYGqdnqjJmGGZBass76+G00KU
         IjPd+cDCeHnZ3CH4u0BWkZInQVy/MfL3mKe1N4QNfIm6QPcljdG+0PV9bAYr6bAmoHZY
         XRPomTy5S48q6l/UaJicnf8gXY3elX1qOcA7tZnI+/Wnznr7pbPdYxJqd8DCHYM8VLJB
         RQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023344; x=1790628144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=Cnx5g1IT5xC7QWwUtSjIrGN32nD1OY/plArWA4kpLfbI8+vCO+7c44JMUWR+UD5s+b
         DkAJvgddxnIjUy7QSI7+5R3oEG+TMN32hAZ70mKUhiBZsPnTl+74MW1H3OBQo4ER6eKf
         NjPNO9CVO5gTP2D0gtxAICp26pw8ZXuVh0UoARwcugCWECr6tN96uJL3kYQUnde5vILQ
         0SKuV9636XfXLzt/l8Xh5Jnpg9VJmrGSluSNTcyW+vL/3RnwX8e4QjHkfSxnEzsS3lb8
         YBzSbh4VJY1//zQQivUbmshQxOJfchqwwkh0088azNSNYh7mAwEZc/IUWeHTsuNhuxzC
         5NTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQRiZHPkPMGbWF9ZDtyIau4mkumg/oPzr9yKr4L1Es+be+eXCefBB5QX1ywDn9nLbdSFAi70K35sFc5DrKeWJt@lists.infradead.org
X-Gm-Message-State: AFuF++n3burotk8bA9Y2tQj/hDJGO5bqgtpGLdRE8oirbWQrBk9OE5js
	vnvcpz/w/xiq8NeP8ePuYyuzQ2zprM2SrPtzmq1cNa78qBlGDF/CSevG
X-Gm-Gg: AYBFou1JmKm3y5GoPAUd0xYlK8+1yV7KJtINZyibfzcpFqtU+xIWdOkXigMOIa2SgAv
	eq6zpkT6S/UzG2CDgnwuXTcX9uL56ZwVG8pbAaeIu/CTtMOpD9aNM6IBo054togBuo3/dBk3UNa
	J7nID90kjuM93pBOBwCBjsc8BX0gzYx1nSzKh3a2sNSYWclfnbjwfMqZJUtDzdZ+IqkDqE3PiFQ
	unfArOL2xuZ1MdKGlIs58/CYwdbYfquJ9t2ee3gUrXi3gDaYqQ77fx1x2XoDX3InfVahUWrlF0z
	MAADCMRy5sX99g1bL1KlOE2XHZAKvrP85dsfl2HSK/EU2X1bauuT0n0TQ6sg+8JxDQJ0/Tg9Jyn
	+uE6jSxY2+GwAlFCI3QuxdNi2WaVxGfiayVrF7hAdhgFGQAlNtFmxehP9gi1AiyNinpEEZhZe0X
	pU39Pk8knlNfp+BGqadUjmRgznO7B9l6xM3rmyjKN704VoLIRNO12w7tf9l6PO7HYdvVpcSCQp3
	7VUQGUd6Kxb6PpXcsSZ
X-Received: by 2002:a17:90b:4c02:b0:39e:2036:8243 with SMTP id 98e67ed59e1d1-39e54eb71f7mr17140919a91.25.1790023343451;
        Mon, 21 Sep 2026 13:42:23 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm967996a91.2.2026.09.21.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:42:22 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Mon, 21 Sep 2026 20:41:47 +0000
Message-ID: <20260921204204.797294-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_214227_266214_F9B9D486 
X-CRM114-Status: GOOD (  13.55  )
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

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Resend of the original posting, unchanged, widening Cc to the SoC tree
(drivers/platform/cznic goes upstream through it). No response to the
original posting or to the ping on Sep 9.

Build-tested on linux-next (next-20260921).

Link: https://lore.kernel.org/all/20260827113241.993923-1-khurana.ridham222@gmail.com/

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3


