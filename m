Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1FFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=; b=NfS/vTbnkFq234JUE6fPKKxnsO
	OmA/7Aewmdy7+D2pKhT3AWQpyRqsY8IS9pvcjCJEelVJOJVZ5+qLPpdGspyr59V2e/pyvurw+mDHa
	uymU6goXiwuFvktAYn3pHAF2NLJCM/8SdNeddBiGt3KFFT1d3SA+nintuZrd2a4ZaVYsiUzvcFcMu
	XYbtr/H0a9r82bry5FPvG2DSp9keClC4MPhaEEOpnV6SFE6cBVcCpfuIRoxjxEIUMNs4m4LeoxRQn
	n/YG39Qm8rtVY78/1CqNQDViRkf5VHNPAAzxb9HVpUTqBa4NXaYkWgR2wk6o6QAa68RsON8VsMWmv
	o/K/eeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGL-00000005Z6u-3aGM;
	Thu, 02 Jul 2026 21:48:01 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGJ-00000005Z5d-2RKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:00 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6647bc8f900so2593086d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028878; x=1783633678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=cq9YnyDAr1zhoEBuTUT3XORsghNA10D0AnaoP1O5tNMonQTmVA1Z4n9NmqcG9+Lqjw
         HeTvZt/5mRSyv298+f5lBSzNv45m3aVpS26GLqd07aR64lImXKwczyfxLaBjkPdRdlL9
         6T5LgJFodsYlsQd69+TJhDM6yJsc24Q/HexhEq/h6AN1NAaEzBtkI/Gvwzg8gmqPA5B0
         xe9vpDqjk4mFB7CzqE9BvRnpwZsJCx+4E3wqzCH2oOR1Kwue/C22H4Luyrrt2H4Hj0uv
         t0V2MQ0Bf5tdEwrIkaNvVMjJhahSgPELeUE8YOm7Zl3Q5RUnIP6C6rycOQUBzPAFXgcB
         zKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028878; x=1783633678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=oxOpPeWxc1q5wIuOFG0b3ejOGYav6IzAx1sF20k1O7dsfluh0PIH8RZZS2vHq1NkOR
         VqXaQpCAlk3YHEwyc6Rg8MDzRM28i/TcB6/eHLG/GNX8wGukDA/RdTLn+tev8KkGdvqd
         XQgc8u86RRnBz7sSX85VzCW28KC8Pq0tnKAkvT6xqwuUzobTcSyi9QB8rkd1lYoRcN7c
         ufzon/jcqDL/o8BQim6+v5G1+5A+/C+G0doOaSrpAvlp821P9JLuuYxhpZjEZH63aeZs
         yIA5LKHYB7T72BXsheUxQ8um/QuUHQpjP1mhASZeM+vLXx4qUwzMWldHHnEARJprCtxm
         OeMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe5tDjgnPgVlOIVk13HEjdwaq/ZgNr1IlPXOJWIO/jCrs4O6DZ4CSr+79Q3OYQO8Q5cEBMsyPnQjRo6nZV6PMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxycm4tLgXx43JND9itG3HrzqWPxh7Cy/R/gVTQblttxcxyxLy
	7PsySvJAob1bXuDc2CtBtVreB3SAeC7yQoeZFiYUvORds/Wu4Ve4nTTb
X-Gm-Gg: AfdE7cmuA2/5nRjGroe110raZwrDv61u6Asq2zKl7vC3bnnyQZPYgKZjl6Z7vP/Do6M
	nvuZo3MK08WU1Hl1OyKby0Q/o6MwW5gfzuJZNUbQmUYD+G1Gl1Q0xQPTDfNjR68Ex23a1o6E2/T
	Hol01Ysxsq4aaBXSvcC7Sn6/i6SKFXMndMG07GX/4rCDuUDy2ps6+Qiffz5IR93xe6yapQPOVzF
	dbtz6jWziOEHRLm0Ms1Yt0zUCInhOBlCwrQ9nIr3mc2ODZ2Pr2FxkIyeV8Os4yduhUOI0yAxw8o
	ZYZQP5ytSFpGz6Fuxk9R8qEkOU6EXfd+tBwg+0N4L6mtobV0Fr3Ssv4uihKbaG3jFOiwKkPwZJV
	IZjWB+6NBzpdXLmzcu+QB2VSX1RC3E4sz0mI6tM29pX+/R7WmofmBdwcBTpqOFLwSJ6ltWuaBkq
	na51wnQjY2LcAnn5gf8LFjxxJZ09iJ4asNApdmileH/+xaqTw=
X-Received: by 2002:a53:d018:0:b0:664:f107:6cfc with SMTP id 956f58d0204a3-66521a8b7ecmr6972277d50.36.1783028877506;
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Thu,  2 Jul 2026 17:47:46 -0400
Message-ID: <20260702214750.3428694-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144759_653055_293F40AF 
X-CRM114-Status: GOOD (  15.36  )
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

This series adds support for the CIR receiver found in the Allwinner
A523/T527/H728 family (sun55i). The only board in this family that I
am in possession of that has the IR receiver is the x96qpro+, so it is
just enabled for that board. The Avaota A1 may have it, but I don't have
hardware to test, so it's just enabled on the x96qpro+ for now, but
left in the a523 DTSI for future use.

The sun55i family carries a newer revision of the sunxi CIR IP that is
not backwards-compatible with the prior hardware. So a new pulse
capture mode field in the control register resets to 0 by default,
which captures nothing, and the sample clock divider became selectable
instead of the fixed module clock / 64.

Solve this by adding the two new registers, enabling the setting of the
pulse capture mode register and the selection of the clock speed.

The new compatible is therefore added standalone, without the
usual sun6i-a31-ir fallback (it won't work).

Tested on an X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable.

The series is based on tag v7.2-rc1 on mainline.

Justin Suess (4):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  media: rc: sunxi-cir: add support for the A523
  arm64: dts: allwinner: a523: add IR receiver node
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  4 +
 drivers/media/rc/sunxi-cir.c                  | 76 +++++++++++++++----
 4 files changed, 87 insertions(+), 13 deletions(-)

-- 
2.54.0


