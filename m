Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412DECD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9sfLcW2APM8y3IVh9/744JaGOXv0hWh6z9HQ9rarp8=; b=M+jOdV/VQfDpLpcKmt8xJQICV0
	h8UhXR3yoZNct1YawMA+w53rmxJy/98rqKjFNFRvPpFS+QdbRTgA6w5f/TnAjJj5gZpnY5LwSnR1J
	5w2yeHJ3S0+NKKoOZ11hYqhP3oAnAo16DEh9XiNp8736zcZcb3MfrHdH209OBlB0WAeJwhpyGNXwq
	k6UtkmrhNf0KLN02NgnIIIS29UiHOKjnKZ14QSfK23dL53crcVhtq2gKGmBy/hVzTbkc5vrgInABb
	uV7ovU+FxmI0RfEYVJKFT7QOYM4MqVXKvHx2pcc/rk7lnfW47NZW8hRxez5Pm5A7LFVQ+55HVark/
	yHuNbRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9J-00000006nvf-0Vti;
	Wed, 10 Jun 2026 05:06:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9G-00000006nv1-1ots
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:06:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c3184c71so48779895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068001; x=1781672801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9sfLcW2APM8y3IVh9/744JaGOXv0hWh6z9HQ9rarp8=;
        b=fTUZubWSKhBXyTtrobC1Bx0TEpqx6QGdvzKrZduCKYbs/XhfXl0J8UI6tnzp22hJSi
         uahSXCG3aGNVv9/W61PlaJV3w+nAwrVZnok3bfh0v30CDSrfE21StT7YOmZXBCM7Pdqi
         lBYEPCArIUym6m0HlbmrmSbO6/jhiWlx641GvWmC8v8BJ18/bUAYYk80GIJLDz8x3wK6
         /QUDLVZ4mOTL4PetfpqA4PsSrFbXfB+4mZmSRJ/DUhvHJeYmwtWmxoJtsW7gRKZ3lQyL
         sdQ2CwYwNptybKlkrysMzIUD7WOdNlt/JqKJO1VaaNNkImjED7fC+GgNEb2Xznhl92xg
         3g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068001; x=1781672801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9sfLcW2APM8y3IVh9/744JaGOXv0hWh6z9HQ9rarp8=;
        b=W0DQKXuRZMfWCmjFT6unP72pyG5947TozMv+DSEZNvjxbdv31h2EimjfgYge3IHETY
         31Efi0jlXOPjs8umGBi2CtKN46/EfBq9Jw8KDYx1e9ob5B43oDDygumopIsAX9aDua7/
         Ztv9CI4KlQsKFihUmTOram1XQ8EZ4lZJSIHIdUxl24XSAMs0M6vXbzrHyBazo/ikl6do
         Gwgno92Lc3gHGVt7wHMDgCL4fWZ3cmxbnnxvhIwSVhjNwv83gCdjo5xAjDFfbSZmbLyI
         bWDmgfEzo4Mv1gcMF9NYsmjM49kVyzcs27BEzqC7APMSFee2zxARTNwlpyBvDiD6mj9v
         R8Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+rolv7QHfWJMf1Bx01Ji008UDiF1+qTyY98sxGl3qUqQwAcF1ZqD9UPJNwJW6Ej48vIXU+IV3X+y7yTPDNWuN2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xvFxMcoXjKo6VYlOx9TMc3rBxovvZ0a6064AIPV2rg/CrC1C
	pNlQ0q4egHnK6neLl9gc1OgHqj2ZoCfY/2pe3ZOqJ71IJDp6YeHuqxpy
X-Gm-Gg: Acq92OGTTUNoGa2HntLtxk3TyNh8Zs8u1qH8rVBgh4Sgi95v7URiuoXYYvaDxP40YNN
	VksPCnGxXBgNQK4B4dgvThRWv2FJ04Pm6yVym2FeeuNhk532usl0QhytMfL/vCpnyGvijnMoTym
	Ys5qx6ngbeldZuJIb+7hcAiQrl6yHgfHJpwndsmzmFXPugEsM48DTbrNlL2n1TykIYf3C7GV4YO
	UQch1cAeCKSWlFfVE2WWEj7IjC+rLhSQcZXIH8foHQ3Vuzh8qnJjRWIsTjQxNZ+am+ZkaAYaCx0
	djh+B95QxY3Re5+SSWGPP+lN+Wryj8N/SalZVycBG3RfdVkDLd0QN/+EGaC/9G6FmyEai4OE1Sf
	Qm0azapia4N1GM1uCnf/ajASKKT0bGIkxqyL+HCPQExPNX6Od+f4IHgXJjq+IHbgASiHfCofS70
	ZvvkWtDKChY+b5gv6cxzvzKeVKNQOEBIXmy+sMK1J8buYH1yLmwo22XIkrbSSttzVYP6d8LXkDE
	6FP4u/D60muhA7+e9AMqBuLqdKgwnhFAcNVTylAiqWGZd7y9SoHcA==
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr221524105ad.27.1781068001214;
        Tue, 09 Jun 2026 22:06:41 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:40 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] ARM: imx: fix device_node refcount leaks in src.c
Date: Wed, 10 Jun 2026 15:06:23 +1000
Message-ID: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_220642_475772_73532180 
X-CRM114-Status: UNSURE (   9.19  )
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

arch/arm/mach-imx/src.c leaks the device_node references taken by
of_find_compatible_node() in two __init functions: imx_src_init() leaks
the "fsl,imx51-src" node, and imx7_src_init() leaks the "fsl,imx7d-src"
and "fsl,imx7d-gpc" nodes (the first one twice, because np is reused for
the second lookup without a put). of_iomap() does not take ownership of
the node, so these are one-shot device_node refcount leaks per boot.

The two functions were introduced by different commits, so they are
split into one patch each. Each drops the reference right after
of_iomap() consumes the node.

Found by static analysis tool CodeQL. The series is build-tested only
(arm, imx_v6_v7_defconfig); I have no i.MX hardware, so runtime testing
would be appreciated.

Weigang He (2):
  ARM: imx: fix device_node refcount leak in imx_src_init()
  ARM: imx: fix device_node refcount leaks in imx7_src_init()

 arch/arm/mach-imx/src.c | 3 +++
 1 file changed, 3 insertions(+)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


