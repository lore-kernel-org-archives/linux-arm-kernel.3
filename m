Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB1C61DC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=; b=muF2UFyEs9H0W1JroaqZQyAQpi
	nuykZSWDNAp0hqBzwLVb7JXiAZe8xc7K/aXQ+ogJ/i8xZ6rcSI2Xe06mJXF+vvBDfNog2p+9PNGl0
	jI2hPQRG1WNryfnbqbjSKtZ/Pa8bbxlNY9URC25OKbFfBc4c9hVHK5gmjXL5Kb0zf5XQyt3VPh1w8
	IPdMcrj8JjEwraShcmqlN+ZlpH5Mgp1ddEVMPG1Fw8u690VFX0iZ3QRljDLdwH6VqmDB4Dlhm5+40
	zG620nUxv8RMeCDefgHeHuMCX/Fsjr9xY0+8NJq+l+sOfCkbjOfjhRBoTQTcBMOgFxmdcP55L6KRP
	hIV0S72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzX47-00000003nvG-0YYE;
	Thu, 27 Aug 2026 10:10:35 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzX42-00000003nuh-0I27
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:10:33 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso122602e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787825429; x=1788430229; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=OOhgC5valSiuU0h8jC3muZ1mibuJ/bNNRS22PqakF5KH+1KYF7Yat7iNM8stQp3s5I
         czmP/dGtzFw+sPY4wetjo0quQ/kfYs0khTPSObQxg+m9udjzHmtFY0fnTcgiETBpYA2C
         gUP3xdMKS8bJp9GAq08215mmvditwcj/TYMfNxwGSRZiCzJfCuIa0CmwDjH+bOuRbpyH
         Gf3RBpDJLJGVu98sRGfN9EQ+qSmE4j/QEu7pTKaU9Hz2hqftK8XsiJF5b0haFdQ9+VOY
         iTYFl5aWMgNkArPcHAiYAFjt7X06oYX1QX8PQ29DKt9hHI+EMElo59MnfCWIZd8HNrD2
         jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825429; x=1788430229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2VYW4aqfkfpWJPJy6czTou4ysrQ4Px2fgIJDxc4EcU=;
        b=F0wydmXtQC73d0vl1S1UqzYjgX8syo0XHr2aiOrpmkylzm0us55yIj98wonT3TxBD4
         53GLpm+f2LoinILJ6UxRihh0iz1n6p2uSOn3MZn0Ihi//TOCfcGJsYKoCC0ennWNnlyV
         PglUuIc2nDn7wqlFVTNUPtAJZYxuoXLpQFDAWavYOvbcS9pheV7i1FzvDagnXn7p4zbY
         CEBN642OEugSdjbGutZND9Xy7syoAV0igB21lrRG5bEgb11iCmVflc1uNk6Tj9ASUCZC
         7tlqoPDqWuX0RK3KpWJ2Yil5qm3NtgfM9Iq7YCSvKQnaPac0Nn5RA1w7cbPfBhoRgvn4
         rotA==
X-Forwarded-Encrypted: i=1; AHgh+Rpnrp8oMC1RjRoL8T3+MTqx5k8k6dpR0i2t8q72llPHThfa3EhtgavTfeiu1tReFo+r6/ZFUpRtcc+xafdFfgdc@lists.infradead.org
X-Gm-Message-State: AFuF++lCw8Ij9jdHnjodxgt8McGQw2kmSnvhMlihN/p9xeGoVBE6+ets
	v/FeikkK/35AsREi3HUqrHluuzqTBqpecVz/phieKz6GRy9XzuPiBszs
X-Gm-Gg: AR+sD11qz0tPslEi6NYvLy180BhOrAsqHU+59OWODtPvfcbpqfTorguZRdvJEvU7d5z
	NYr9YANtKcV8g3I7oZULZP2k9YSQNHPWqQoDNMM62jwRhhTcA0vHlJ8QuBN89WcK8OzyFJ7vTJz
	twRAn3MI/CMGd7E9X/zWUeMk9UVYt0EB2RdtjN0KAtPPEl1ahs7gyTJKFYJa+mEz9yyQMbXJ5Ws
	hNCj3OIYVc+KMVjLXLWoyBVx9Xj2i+SWtZHrNLjSs08LdwI/BnwDXhXjLRJlqEuXES6+bDH1tez
	NNV8pBVDiY1rB4ctq96EpEtDsHsQsUXluZVX3hcov5OTGcYXs1358XJX8msiPQDxCJybxuNK4eC
	IohyqDp1DRngw1rMz2u4FvmCG5CWu54y5Y9XWaMguj9BuzbXROa3TTddsaD3N8YMI/QLoi+D9GF
	CTBhTMTOCBBKe+pF/2FBa2r3LHDsjEofvykXA3k8XA3zhYse5uCBJlXfp2g6gZVCqtO56vWUHEU
	mRB557/9h86G+F1t6XMyaL9icb9bu7jf/O5GQ9r1P2RNwSDizl5grrCyKxBgA/nS2Fl1HQ=
X-Received: by 2002:a05:6122:c91:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c65bc6afafmr4514953e0c.2.1787825428571;
        Thu, 27 Aug 2026 03:10:28 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c660014355sm3372142e0c.9.2026.08.27.03.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:10:27 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu, 27 Aug 2026 07:10:09 -0300
Message-ID: <20260827101010.12487-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com> <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com> <bb7eada0-19fe-4602-a2e7-554e914b8205@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_031030_120106_96EDB80A 
X-CRM114-Status: UNSURE (   9.94  )
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

Hi Andre,

Thanks. "After -rc1" is exactly what I wanted to know, so I'll wait for it.

On the P.S.: I wrote it from my own notes and ran it through an AI to fix
the English, and you're right that it came out worse for it. English isn't
my first language and I leaned on the tool too much, which got you a
forty-line report of something you already knew. Point taken.

The reason I was on your series at all: I'm porting the Radxa Cubie A7Z
(A733) and building a Yocto BSP layer for it, so console comes through
pinctrl. The board isn't here yet. Once it arrives and v2 is out, I'm happy
to test on real A733 hardware and send results either way. You posted the
RFC as untested for lack of a board, and I'll have one.

Thanks,
Vinicius

