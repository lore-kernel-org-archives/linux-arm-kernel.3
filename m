Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5F6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NjHOGNG4+d7HZdoD4W/KYIfSNIi2J/bMo0iyGxOFrQg=; b=c5iKzprVdGi/Cx3dgwL52FWcNC
	ZEK2+JlYn/NqOYBip6t7ObRd9RQ1hmQwoovgAwGxYiKDEzkYNhhp8c6ySSyhpKw2WyR+a/b1qeQ3n
	n5jHAC+wlwvdaliEnGWp2ngEzNk69jynaQcmZPuXknE4P4ipP5ZBu9DbLmDVoWZgmMD5DTAguKNgb
	8Wv1Fb8aNDY//9NkHcOAvRilSqqNbfFwUdB/WR0j01wS3P25JN9Q+D6S8B0jxGpdvKLqXr1i1TMjf
	abdVrUp564WhW/kxkrtbP3qFP/+56f5gkDa+hJ5OlDH6K3/W7tIAyApolecWneyIFat89AmioNSpH
	zew38NfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXVl-00000000h8b-2SdZ;
	Thu, 28 Aug 2025 07:57:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXOU-00000000fvH-1Mxk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 07:50:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7704799d798so537816b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756367401; x=1756972201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjHOGNG4+d7HZdoD4W/KYIfSNIi2J/bMo0iyGxOFrQg=;
        b=bllXgeDL8To+fO/7bjJhDWFlwovO6UDAIoKeNAh40iEnQuf7iy44I7/Aat+yxWD+9S
         S+OSytd4KfOBhw3Nxki67ejCsHnquoNr+7A3oNMYVFxa2Lt2ccH9Uzjjus9OTw/JndY+
         QkkuZ4PXgkBVpObBaruARic8d4HSqqK0clu8/goilg6i8k4vszhipXRsCp//o0wO8FBE
         0iLzPtlTmLqf4Zo6yB1oOWI2v3jUwetzCYvO0JiDDoyTLM8XKV6ZFkTS4mDPdNYYOTry
         O+HQn94V+DOx3GHRYq0ckg1O9jE0vKyPeJ76ErG1Lbp5VDKkDghmwD7SdFOxzRGqUevT
         kA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756367401; x=1756972201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjHOGNG4+d7HZdoD4W/KYIfSNIi2J/bMo0iyGxOFrQg=;
        b=E8H0JMCWYVWPB3+RcuynFtOcTTjES2pXt6c15diyjZIZJsoE/QA0QycHugJoHUMW5I
         lpDm1EOLzHeGTF1RFa21PuGH18KUyWC11IKjs4oYeLd4QMfGI5PdolZX0prirH7ZFyh0
         TjDMdLE2XozPDSwYtiDPX8SH2Qhs8tjRTvDxBd+5WE8Z2AaP9vfOQdwgC6GB6TnXuWXP
         Hz+rTAOFU4iV6+i+CX+FnvFlIfCzGLiORvYGz62XdUpFnCaop36+HuWvlKNHJL0CLZ4U
         yyJmZ9Wc6N4A3mrorAcl4A8A3nRtT2QmH8zguGRyT6g1eFSugFsDYVPI6PLCQwSg7oik
         BxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6wFXAGz5vM0P/W23E86pidhW0Ui6lD5oH2CNLUPTzRfLnWP3mIL/Rwj7Eh3VHrSWK68BeKBnxs50OWhJcGwJS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx17qQzpWsimIVUOO3bZnJRnw29Ds6Ro/Y32w/j8+mms4em5igC
	zNe+gbh5Bp8h1kdFGjRZFf74vmDMIRv2MhUpoXWa7S0CPojE6cNllcq4
X-Gm-Gg: ASbGnctBSIpYZFVH6P2AS3DsZYvvwUDJVCRjPOEKKowFKKCe8AgDCeagJf0Lx/NiEJk
	X3L03QCWovFAxDnIxU5XwNk5tO4cDohSZArZT5nL4nb9rhK9ItZAKU50HO1oAOvkJJrgVqnlgv9
	zElSn0mfrqx/Si5wwbYdXsoyiVS0BCYqcHypEZWiP6jXqEWlZIy0PLFt0WwpIJklugbRPy+G5Yf
	8lBs0MeHhrQVoe/nk/puaVJwlokhikr2PzhxfFZyjrGlOoGxGEbf97VJ8NLSCeA4MWN53w9wgyq
	QVZZ41VysyMmCOHGvMLuL3V+d9mCMydzHzAtvZcy+yHaNeyV7Q7jJxoqHED6wkP4Il0BCUUby9V
	3CGKE3ckpcqfQY/oIlzXXyxXJdgkiMAFwv3SXAXk34hqpfELqPywDiDKfmO9zdRcXV9v45NJOmD
	SZRc9EOwFXm50wpIMWRs1JZBd9Ku0bqnDOd7KKw94=
X-Google-Smtp-Source: AGHT+IH5WPqqBozEMKrHMq/PF8PPjFfc9CCGsxQOZ5GAqhbwcMu0aIAwPYCwwEm/tWUHMLGYhvRR/g==
X-Received: by 2002:a05:6a20:8093:b0:243:a0c3:49ea with SMTP id adf61e73a8af0-243a0c34c2amr6067769637.36.1756367400761;
        Thu, 28 Aug 2025 00:50:00 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35e-4238-7ad6-5c9d-99c8-92d0.emome-ip6.hinet.net. [2001:b400:e35e:4238:7ad6:5c9d:99c8:92d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb9d226sm13272038a12.41.2025.08.28.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 00:50:00 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Thu, 28 Aug 2025 15:49:50 +0800
Message-ID: <20250828074955.542711-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_005002_368100_E13FBB0F 
X-CRM114-Status: UNSURE (   7.89  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

v2 -> v3
  - Patch 0003 - add HSC mp5990

v1 -> v2
  - Patch 0002 - add power-12v-memory-good

v1
  - Patch 0001 - add power monitor support
  - Patch 0002 - revise gpio name

Base: tags/v6.17-rc3-39-g07d9df80082b

Peter Yin (3):
  ARM: dts: aspeed: harma: add power monitor support
  ARM: dts: aspeed: harma: revise gpio name
  ARM: dts: aspeed: harma: add mp5990

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 31 +++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

-- 
2.43.0


