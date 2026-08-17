Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59823C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMiX0lpuCdiMpiwzWoB9LVEm9l7oTA1Ip8S52pJKwGo=; b=nyqp0SsHg3WnDesTJq3OEvqREr
	3XSJiX0Xjzo9MFiolDrLUVCw6/uYAt01IhIgo3YhguH3F2Yv3ol/MTmydSyCbB04FB3RnvQBc0rol
	fCWXD8dEa/0rCYyiYnEB5bon5wB8s8mCLvZs+uLSDrvdD442KT7hLstXJyf56bYQmpTsgSTg1/5bo
	O/uu7vF+/VX/U3rVsEdxD0JhAuuicCPBbM2rzr11ifbQFzJ+fSSJz7DWVfM1EamJiV1fSiM8y+YFU
	TLaJetpxXoxgo1mGkrWYiizUWc2KlmGdZ3UhimeftVC4b8ikEXiHRJKQ+ymtWKyNzy34JbmOmSLQo
	2taChQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtup-00000005qQF-0PWj;
	Mon, 17 Aug 2026 09:45:59 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtul-00000005qPU-1P8F;
	Mon, 17 Aug 2026 09:45:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CD2C713802AE;
	Mon, 17 Aug 2026 05:45:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 17 Aug 2026 05:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786959953; x=
	1786963553; bh=KMiX0lpuCdiMpiwzWoB9LVEm9l7oTA1Ip8S52pJKwGo=; b=s
	AR/TxMFWmNopDZS4zzIHNdMQ8KhExf9auUe0Ix6oOyiM/iOBqDLSLS7mAOtEnlbB
	+iXHjnasYcL+ChYyPJitlj1KiHOTkuSdhrii4G48/RzfxkOT+E996zdoSeZqkRYv
	2TLu8UgerFSFgiMaui8rz1W2RuaM5p6euodXKZc9mzScAm9DPmPEq/EWa1Rgjt7o
	+EHJdnxE7rlWgN6xNaVfTkETyb/Knf5rCG85OK4RUo8EkWZCN1e7H9YjzVtkPSlr
	wnbbLfbfxXYc/MFoCRah96QS+2LfIid1A34d5/xaQEAvu+pc41ONxMYBjz8umjpY
	eFUBFgPdttO757nyu6qGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786959953; x=1786963553; bh=K
	MiX0lpuCdiMpiwzWoB9LVEm9l7oTA1Ip8S52pJKwGo=; b=Fr6roOJRV4MVuiai+
	R/Q1cw5k8imuJY83GFFZvG8oz8A0H/aq99jt286HGIHzKMXAzab3Ia4Hro49fAAa
	LoAappbPzQF4Nd8/XMKdc22irHCZLw4DH5OcpYilqAPj9ogjJJGeLPi9A8tNljc8
	pb1wzV1UFmRBXri8xcZ2H2mi3zz8oLddg6vSX1bTLk9buKrtg72Yawc6RvG4EjTX
	ONwQJr9HLsSS1icjc06fn0AhKNYzRF1B9dtAJkGKDH0TiJvzNCU1KwxTAWVLoyi0
	jMbwhtFZvMyqr0L3mdG+xoFx2U2qKl2ljZdjGCVhSU+ZDL7UKhlkNGoUdvDKbdkz
	/r8Pw==
X-ME-Sender: <xms:UNiCaiZYYEdmyxDDQuxbNWP-HldgQn_at4iiNsCY0wRoadhvCeYfqQ>
    <xme:UNiCatm8sezKSR3B8VzowZXUQ6JZT_ZbbUOJDEA3gcBJWmLpPgJvkTO9AcgOYBvBb
    XRUij0HZX-NeM5CglKcHTQXw3yfLcj8GKvpiF2I8iAfRVfd6sXXnwnD>
X-ME-Received: <xmr:UNiCaogg30bTsW3guDAoQ-25OuJHzEM_hRK_jyVWG0e0AEaiV4Q827v3bqOdkEx7OXfkGFJ-Wg>
X-ME-Proxy-Cause: dmFkZTEW/5JOkdI3iXwa6dLGZb2VIfdQ9j3pTYauZ3twR3nWWZHun4Wug0NVbCvnVLGFzF
    qLCeelooNbSVomgngrCbN2qyOwXWXWTPuLsmf8+i+1vXwulmrRcfcDlFRvuzUIYM7gogH0
    fEqlCuYDu2h38EKc6+PeMHzjIX5Koyql5vFR6fLjqDdLAFYpYRe0JBMB7Ii3Axa2BcPleq
    TUUyYnZFPRz3CxWeWhgopvJCgcH3QiMljuEhIrisY+1cotyf30xbcGRC59KJZaAFy4fOtk
    G4z7rcGaXdOcfa4iidylBWK+jpPPzpwesm0xHDYJF85xyGbTzN0kLKDQ1HSzYwnnyQa/Ku
    WPa8Wj2WsuAA6qbnYat/CASXOerAXUMLyjexRJ2HMK/VUiew61buK8OOa46/BiO1Y7yZSE
    oyvUe1sYppRSj6DTAHQtbXyoEWYeOKLmnb2jWLMCKFNiHuXbiDzS/UbQGPtj2MRzY9Fm2T
    PDauUqNnNHBzpqf6dXzG98RWEK5ECC9vXMQnWtXppYxHQQajRpLNQRLEdMSwCMrs2u9uGw
    xs8xKwdvfaQWWMq6Wgr2ikw1GMnqf0Y0L4p1Buwmln6xTUN7vlq27PDJ/yRv70UV7eM8hn
    x27IRKDNuEPYelcNoMzTC18SIVsoI87JmO/TT6VHqBNz1yalCs40HSJfTxiA
X-ME-Proxy: <xmx:UNiCavSPE_SUk1Rm5_rdC9pw-jdAC9PO8NN92LpvUGZv3VT7O3GDIg>
    <xmx:UNiCapbG58N5zAj_1ArJZHGh6QyZyNUUdS39cCv8YerIzZxubudsjA>
    <xmx:UNiCasQkR8MH9ovVvSh5CBbzpnvKAIJtfG1ONtKv8yEijSS49QKhKg>
    <xmx:UNiCao_azbybFVzAh3KAVdrgaFK8BOfJ9A8GznMInH8CH_2LjEMbpw>
    <xmx:UdiCah5ZbuC6Y7SdsYZR2HhCgWM8T22xo3A81LkIRqPJWlMfwPuac-ys>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 05:45:47 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: royalnet026@gmail.com
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Mon, 17 Aug 2026 21:45:44 +1200
Message-ID: <20260817094544.1159366-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_024555_821308_66CE0247 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Igor,

Here are 88 and 120 on RK3576, with the 56 from earlier in this thread as
a third point. A channel counts as matching when its maxdiff against the
reference is at most 1, which is how perch.py scores.

  oc    parity form    modulo form, ROCKET_DPU4050_MOD32=1
   56   56 of 56       32 of 56, timed out, lost 32 to 55
   88   88 of 88       64 of 88, timed out, lost 64 to 87
  120  120 of 120      96 of 120, timed out, lost 96 to 119

Under the modulo form each count keeps whole groups of 32 output channels
and drops the remainder, and all three of those runs also raise the
driver's job timeout. Under the parity form all three compute the whole
output at a maxdiff of 1.

What the three points cannot tell you. 56, 88 and 120 are all 24 modulo
32, so the twenty four lost channels are forced by the arithmetic and are
not corroboration, and the rule is untested at every other remainder. A
count of 40 or 72 would say more than a fourth one at 24.

The modulo numbers are read back from a job the driver declared timed out,
so the obvious alternative is that the job died before writing the tail of
the output. The log argues against it. At 120, nine of the twenty four
wrong channels carry enough varying output to fit a line against the
reference, and the surface reports 45 constant channels of 120 with 37 of
those pinned at the output zero point, so the lost region was written
rather than left untouched.

ROCKET_DPU4050_MOD32 occurs once in the whole Mesa tree, inside the value
expression for 0x4050, so at a given count the two register streams differ
in that word and nothing else. That is an argument from the source, not a
measurement. I meant to measure it at 64 output channels, where the two
forms emit the same value by construction, and only got one side of it.
Without the knob it was 64 of 64. The run with the knob did not complete,
the entry hung after the 88 run had timed out.

One confound to disclose. 88 both ways and 120 under the parity form are
one boot. 120 under the modulo form is the next boot, on a kernel that
also carries an unrelated power domain change, and the NPU rail reads
enabled in the first and disabled in the second. The Mesa build is byte
identical across the two and the modulo form times out under either
kernel, but the 120 row is not a single variable comparison and should be
read as two.

If you still want the RK3588 side, ROCKET_DPU4050_MOD32=1 against your own
build is the comparison.

Jiaxing

