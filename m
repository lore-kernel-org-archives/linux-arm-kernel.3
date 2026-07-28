Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCA7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=; b=RLDVQY/ss+uItI1kWK9nkgAo+F
	YZ0v/8Y250Pp7hAPR7Nt5xi8+US1El5T7l9T7Ieq75KlayMcdZuMDvbS22h+MOxpFNgHa7CzFdYrc
	TZWWUylZns0uE+jCI4b3ZMYLxqhMq9t9FxJtIEQCAhQZiH8yHZkJezu+SodBcUvhGQCZ6KqAI8Oui
	gb9yY1KMEprt3W+Mh37gMaYb1n4p9B8GOPj3xSLxHjlPEYKd+RhWVJtNR7k7EsPddLJBGFQN+QDUV
	84zARGZpSRCiL75tBr2xqDzNKm0tt0toDQIjlicjpy+UOaKxaMMJSMZoNtaORf1M2mOzB9pWsoyWW
	KTAb8QSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXtX-00000004Haa-3TP1;
	Tue, 28 Jul 2026 02:50:15 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXse-00000004HVg-1ccJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:50:14 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-80bb41f7f3cso32915027b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206959; x=1785811759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=QrvK1JCH/ZAx3KVRINFxBRIR5F4+JDf+tZ3Ev2pKWd7LmqOe8Qk0uj8fKAPj4hAGYN
         YRz9PhogmhcxnBvSRkEb1yhUXXK94pv8xVKuguKBvBIusN3+30gUfTW1K05t/PWeXv8r
         YwybzblQlxqPWcVd7n/N/blwq4CwGGoDySLwdBVq8a8Gzq0/kIyF7cgdUICiOjZGX598
         UHNOqPXhQ9hyczJzEIYvxRdX/6o49C6qhh8Fv2KnwD2B7eRRKFZF6j5/EFJwXD/Tv3fY
         pTAXfN7TI67esmK+gPljS0IwNLQLg39OB7gy7Ls/YQAzkuFcTH86Nx2BjiBePxzitAva
         MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206959; x=1785811759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=Z7mnu8d0rL4BX+ArTLJHtxpJ6+98x/r6Rmj+mJkSmDjBO5yDWWqRZnkuEL+sRH3SnM
         XvTRv63yxVqlWZPTpjL06Qg2HSiwLu+azxuuMZtPdQglcPryYf/MWvj6bvChJiKAJ0HA
         Oiz7qN77r55MRj7vQ6baf/iYew16vxTFvm7HusjbDdIy8DbcPH44XjsnJ00q7IbuWOb8
         j8dryn/aec8Bk4bkrNA3JMHrdh0j0gKK4HPDS+QdTzs7tWf9kwMHq/xDHSCwvGjJq2T4
         9sl6toeFUoAsxiAwDNDKTuHVIHP0s5MabBBIKly2YY/J5cQXBNWZnHuJksw8eHE8qZC+
         kGVg==
X-Forwarded-Encrypted: i=1; AHgh+RpvA8rik4upFtVQKesbGDZndi7gn5KzL7D4dCu+wTxyzqXV1Y+EkH/GHdcbkWFGKabBfkUVi704xcoUMCEKOwWT@lists.infradead.org
X-Gm-Message-State: AOJu0YwlbX+KhgnbWv9JLP3evik4tK9aJW+wS52f1W0qaSvuiBdla4H7
	6cEWNkk5Nal+YlLnAoFGfL1mPapi7JzwUqwHLmzsGr0GtA8dNLY4DwL+
X-Gm-Gg: AR+sD13bcZ5RM4KqwrUscMirfvRtb2SXWZCeer+gEqEWKP5lMWm3Bk8UfOM+4SBIpmF
	4k/A2vgr1/onK9tbKIkzsX/VxZLa1iGMQNEdzAVIAgO0nYdyXelfsRCCyr0ZWMgjNAlZ0tZTz1c
	gOX50por3upH3ileG42WdJKxXIo300vd+URH8n40/cUCxv7ipNq7cpL57Us3nZ1N4oTUckq0gW+
	WGzmh7/jf+H/bpY9t3fOfNWjKwM7we6NQTbIsTWVu0UN3hgqAHZpelHZaN29kYZSl6gMlUUxmsE
	MGZeCM4EY3uSFFu8g2PRwoF65XE1m8OjjlhXcSty8IyTO/DU2B8j/Ixu5v5VBbqD0175+C59/H0
	hRF1Kan2PZGCbnP6lLOhv4DZLzJQzm3XhaZxfKrWWswrh7RDoFD/Yv2FCKZP9ap8LNrfZeG0PDO
	zr0G9VEnsGc34eIfHjZXchp10BEc7GH6zMJOHb
X-Received: by 2002:a05:690c:7244:b0:81e:d009:1956 with SMTP id 00721157ae682-81f991fa998mr2277897b3.12.1785206958757;
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
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
Subject: [PATCH v4 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Mon, 27 Jul 2026 22:49:12 -0400
Message-ID: <20260728024916.993224-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_194920_436464_5E9A5074 
X-CRM114-Status: GOOD (  11.96  )
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

Hi,

This series adds support for the CIR receiver on the Allwinner
A523/T527/H728 family (sun55i).

Apologies for the hasty v3 respin.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

Changes since v3:
- 1/4: picked up Krzysztof's Acked-by, no other changes
- 2/4: add /omit-if-no-ref/ and rename the PL11 node to
  r-ir-rx-pl-pin (Chen-Yu)
- 2/4: take the PI8 pinmux node from Andre's Avaota patch, named
  ir-rx-pi-pin (Chen-Yu). Added Co-developed-by for Andre, and
  his Reviewed-by is dropped, as the patch gained a hunk and a
  node rename.
- 4/4: drop the moved hunk. Andre stays the author, with a
  bracketed note for the move and my Signed-off-by added
  (Chen-Yu, Andre)

Based on v7.2-rc1.

v3: https://lore.kernel.org/linux-sunxi/20260722233604.3001063-1-utilityemal77@gmail.com/
v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 53 insertions(+), 3 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0


