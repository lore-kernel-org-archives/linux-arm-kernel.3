Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96D0E75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55Wdlxhr6LRYHaQsgdonHzFOxbh0VPJ42HcRCsxXoWA=; b=I3h7qv7lyVRlSEsjBpV4jOT5xh
	UTbZJNurwApkSRnbnDUCACFUI88FnMo6NFWtxo97rohEXneCy/qb8RcNfTRcYgWbAIuLJO0eLW48Y
	ZDuweel8OpeK1bh3SNdeRpw1/barjXe0DSASfQM4YWga6D4ujGsLCpKp1hAU1WV9AHXFTuSbBUhcX
	sAY3QdheyGOPJd9DYy4o0bSe5TVFzQqwG0z3/KtTdEPqv45rN/Cup0U19dPG+e4KZjVLUCgsSgsy7
	WGaFs+mqin0VGETlP564T/AU1MLxzyClFtrZMwfsNXix+aUeGSvTogCZQ/6KwxUb4nwlMz1yAX+Tp
	pNsXDU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMKX-0000000Ghkz-2F2L;
	Wed, 24 Dec 2025 10:42:57 +0000
Received: from www3141.sakura.ne.jp ([49.212.207.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMKU-0000000GhkX-1YKQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 10:42:56 +0000
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5BO8cq3U007035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Dec 2025 17:38:52 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id C4441109D5746;
	Wed, 24 Dec 2025 17:38:51 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOYzVlgpNVHq; Wed, 24 Dec 2025 17:38:47 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 8874910A0ECCF; Wed, 24 Dec 2025 17:38:47 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766565527;
	cv=none; b=gzgMwxS0W8KiSRcwpjGyWYl9uHWSmex6mi7qhb/VcYSN42rLkbn/KW+1zx1FBUlPGm18FXA4GQPrFMQG0HOs0492neUW6GPQ63cIn+sA5WwES3unYsmPtOoxpp322GGw/xSB9AzVcsYqY5sSnSxJm85ylou6ORQx4DgPIkgVAXI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766565527; c=relaxed/relaxed;
	bh=55Wdlxhr6LRYHaQsgdonHzFOxbh0VPJ42HcRCsxXoWA=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=BCPNHvQwYypZlGR9D9qFIdmE2/FwFiEYOipg55d/jvQL7RBN7kVwfzL3kfcQQCi7YgJIR2F45lFilGgNsh6czrydO3wTLqNOToA0SB4Qs2CzmD5lKXErHWEKVZPsb/qfqz2HfyKdO9070RGFwh4pFzLLToHS5njdaMqyVot5Q+U=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 8874910A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766565527;
	bh=55Wdlxhr6LRYHaQsgdonHzFOxbh0VPJ42HcRCsxXoWA=;
	h=From:To:Cc:Subject:Date:From;
	b=dildJhKGDsFhkveq50tYibePfrP+nFZutqRS2kMXGNw6oO3sqREtQiZYTxDUxWqQZ
	 +RTPh3MrGJiG/cKuKIH6hr8e8xUjYljCw6mqcijSimqa7G0bwdSAC2Xz57S1A4+fZv
	 sDt/UWSBzUswPLoKJqdBWCB5hVmqQm+yuhonR8Dk=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: dt-bindings: hwmon: aspeed-pwm-tacho: fix typos
Date: Wed, 24 Dec 2025 17:38:45 +0900
Message-ID: <20251224083845.2727976-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_024254_946832_449E4F21 
X-CRM114-Status: GOOD (  10.56  )
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

Fix "upto" -> "up to" occurrences and add missing "be" in one sentence.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b=
/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
index 8645cd3b867a..d1db4adb2df7 100644
--- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
+++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
@@ -1,9 +1,9 @@
 ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
=20
-The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan T=
acho
-controller can support upto 16 Fan tachometer inputs.
+The ASPEED PWM controller can support up to 8 PWM outputs. The ASPEED Fan =
Tacho
+controller can support up to 16 Fan tachometer inputs.
=20
-There can be upto 8 fans supported. Each fan can have one PWM output and
+There can be up to 8 fans supported. Each fan can have one PWM output and
 one/two Fan tach inputs.
=20
 Required properties for pwm-tacho node:
@@ -28,7 +28,7 @@ Required properties for pwm-tacho node:
=20
 fan subnode format:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Under fan subnode there can upto 8 child nodes, with each child node
+Under fan subnode there can be up to 8 child nodes, with each child node
 representing a fan. If there are 8 fans each fan can have one PWM port and
 one/two Fan tach inputs.
 For PWM port can be configured cooling-levels to create cooling device.
--=20
2.47.3


