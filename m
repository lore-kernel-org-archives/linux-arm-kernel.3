Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F9EC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iK9MEaYcWVmSY9o1Sifwkzjfyq959QpeeaqLNOopIGc=; b=yl7R2bQLuOSaOXzfxcFTdp+t4j
	YscRKU8qC0TmntnPhdPxT2vrtNmjox3rkssqTRQBVrMeeL99oCzRU7xbQUBXjsKrPmtYlK20T9vTd
	p/m+33L21UAyyzvGsD2w0SlvAisXtUT/e28Y1DyaIgfD+Xx8K9usZRc0HqS7jTOOOYU2Dbiml3zld
	jjY8+yarWW509GE+/r/9/6e6SuOTR18TdWgLLRhpsiZAbErFfCKbnw6JSeyeUkQGog429STSnZu2a
	bAdFHYohlFUJJrYn8zJtf5BIHTWDiFzyFnI//jEA8nZug8u0LCox/FINFSaD3uN8hlvovy2p/dlER
	mJAsS4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXX9-0000000FjIR-2soG;
	Sun, 02 Aug 2026 14:51:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXX6-0000000FjH7-3unE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:51:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so11894615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682278; x=1786287078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iK9MEaYcWVmSY9o1Sifwkzjfyq959QpeeaqLNOopIGc=;
        b=FNVCK84Y2nZSOYUkr8LDhwOxvtNDzUHAZcAsPbU1xzcSDTg9HEPGo3UFNS5FP/gS2W
         4MVTq6eBEp4vsFw1W4DsodBSNFzt/ZT6SXm/xG3dYM52nGQOxSlwOrID4F5ae0Tq90r7
         aQC8BVPt25A95VvKLMv4uSt0SdM21iDcYtnniFlgpghN2K+ik86dKnFeZ2Tp2rXnvf9N
         p2Rc44/unVY4Pau4+dZvqtlqMF/Rv2lvp6pe7H/uDGvhfmlgpA4MWGgGsrFk9wWLF4EE
         Pgu2fzJwL4tlGW7QbPeR5OA9TFav8C5FzUvj9ZbBEDeEUrbrrFDhF6BjttfRG2lhsfuH
         g2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682278; x=1786287078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iK9MEaYcWVmSY9o1Sifwkzjfyq959QpeeaqLNOopIGc=;
        b=qv0owh2qrm1N8PCPNsnRBvvsPNx2E2ECbHXCxrhMj1dxRAeHlzAIN/YnjCfJGIKR1+
         +kAgWrsCNgW8exUCJ+6uB3LZzkcPDQXuK3JfMcIknKTuu90rP6rrwYj+oAONonVirNoV
         s9/Ln7ZGynxJqw7pOWvfcFzZ9Q/z2pbZ8ehZMiLLAPC3FtJDTdqwb7M2X9aSrkmcVuKC
         KcPtg5pgHhCyAxyqTN0Q1SwOUbBcQAiRrlvW4IcFFcg2md3eoXQxfuLoxvL1LQh2sDDU
         FMW0R3wh8CSKz4238DMtH181b/NYEj0x0VPfXAmguxNzdV4A5aDcAHhuGqxR4cw8vo2C
         l+lw==
X-Forwarded-Encrypted: i=1; AHgh+Rqlfq0cuZ6GV8o8sW+Hnxk5zhVG5hVxShL68ORHxYAciKMYUw7YwiMUO+Cq04nktjaeHfyHHbjf/wSZw/zx0xtA@lists.infradead.org
X-Gm-Message-State: AOJu0YzdAcqjRcgMsqRpRK0JF0wI92dNMhyVxXAQFde/nRGsRWdUuzWb
	8CQDe99I8UtTUx+ro7TJumKMRy22b0E+Qb3dL7dCI2JJiIIx1m8W6psd
X-Gm-Gg: AR+sD12UhXc1fFuBLwPQfokyooiabQHGy+vKP/qYWY6Ja8Y0HCF4r7ICrDtM0gFNqhh
	f9wzDd3tRmNMVLUqMQoXPvhoaoEItKqKheLrf33n7Ga0vDQ+oODGuyV3+DJEXHonmJfJfTI5qYK
	eGmDUWFVK+xOlx4U96cz2nwIznnDPpyEFI6xXW2gl/89iGDrHoVON7XujwfFcanmf27Kl6ieKZV
	J7G8GgTLhKLxCqGRJfwbFxS1jmykDvFZn3mDZdxXGqTb1RJMK1i9GsuPzjxxyDk6IUcmDxh6rB0
	gbRxra817ITLuZaON9+kH0saWietmYtIOptoRdZMjB/tvNgrV9DceOuO7vl0BEpHAvEfyl3j4jS
	W6qqx2xFaFGEZq2w6/BncbEuhOuUcSqkJOHwjrRYEtLZeYLDNoS3Q4X+2m+9vAs0d2Y0GeqSQIV
	/a66KGna7BE2ngD0H2g4xpKwW0cpx5am26Wzrgy3EJjnWksra5BjkOlwOI9O+SyckbtejxiQD64
	OVYXmjdoP+YY57HsvYFh1GjTs9b1bYU6GTNQXZLEgNM0EeBOb922E5WD5Uaqw7bui1G/qVS7+4Q
	c4hiJ/hB8Bbc5/p4+zzj6m7/IJqngL0D9wDPZoYzW3iM2t5I8LdpHSp6aK2Dtx7Ak0S0MNrr2EQ
	1734CEr9Du4prXrD0iz3Tmt+f/hcBnPHBoS8uPN34//VGzICKas1reEryIRIfjLn+b07/x4U=
X-Received: by 2002:a05:600c:4d97:b0:495:52db:7e8 with SMTP id 5b1f17b1804b1-4980c694ef0mr83665505e9.19.1785682278217;
        Sun, 02 Aug 2026 07:51:18 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:16 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 0/3] Some minor RPi5 bits
Date: Sun,  2 Aug 2026 15:50:51 +0100
Message-ID: <20260802145109.728793-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075120_969365_0895AD80 
X-CRM114-Status: UNSURE (   8.77  )
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

These are taken from the downstream kernel device tree. They
are small components that already have upstream support, from
older generation RPis or existing arm IP with just minor
changes for upstream, tested on rev C and D variants.

Peter Robinson (3):
  arm64: dts: broadcom: bcm2712: add arm PMU
  arm64: dts: broadcom: bcm2712: Add thermal monitor
  arm64: dts: broadcom: bcm2712: Add USB OTG port

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
 2 files changed, 72 insertions(+)

-- 
2.55.0


