Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D71EC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=; b=c0JiI2BIHhdHwe
	KA8GB69JJeYwz6UM4ZGFqvzHnVG/F2ceJIKu7KuikMx9yJMLAS8dY5L7o3mxFwveFA+hicsjTqovx
	NrsHB+XjG4x20TL8+JjbAR7GuiInXSaz3zGJLqHERKQW0smwkYYqdGE3daACBcu2W0zZJ3VeQeeP4
	5kri3r85hZ6AxiiMzsclHbllo15M1xWfnuXvM1tM75g6I2isTTVkspQVc2bjagPWO9487c0kXHX+Z
	+GjycQ0CVl1+mGTo/8B993cUdMCQMGth31ACMLsk9ig+/QjnX8CtjsanZfjO1d+AcAm7xaQW85Ssc
	JPrfc6qf0R8Zbf6EaVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkR-0000000F4rJ-44MV;
	Fri, 18 Sep 2026 16:47:39 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bkP-0000000F4qx-3dMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:47:38 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8633a38df87so698102b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750056; x=1790354856; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=I9V0W0Y5ec898gKIZJWnivQX9x/Dfb5wYV0S+ACPLiAf6KoQyO4BOeT09nLZKV6LW+
         +CGBZyrnXs3AS/I5FOdlX75v+8uIsG4jSCbkvyp1K8dCxsYIkrjYQWQvLZ/llzxfVlH6
         KZJ4iF/U0X4y2ziVMe1/2YJLrr1SqqKz5wTo98VSkSAvs9GMCg+jplE8NCNUGCsDsIUP
         /BkC/P3XkawYSefjnriE55UaPbHl70yhHnRkTy8e+Oc9XmGCWX3X82JeiTfWTVvwmW6s
         MqKpbBXXUz3divqERG5MrGyN7NeLYkggnejxvXnzkgCFMo6d24UwWw8LqApGxqJ2qLJx
         8KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750056; x=1790354856;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=tVtQ4X0zd9XBrY4lW1HAbqqvibs47kwqaNodJjrZAzD66Ro936iqjGBgDAYoFdbFtI
         WZnq7vjvOdsfKG0saV9+U/tgXT9ArjJp2ovcqxJ486jSkESUfkQkcvoDhDEwPn1xNVD+
         rI0NLoiAvycWmqpb9SaW2nVFW/Ur1N1jws7PdnW7mO/y9lCtnEgQ3//ujc34gSNDnBqQ
         sKd5WGmUOsleZg/ecni7XprGA/E+8WGdOUV24cY/WxYL8CINJucQLou4dUuInUjtwQND
         LDA+Nrcv5EuwOaG35s0NhgkId0hWWT1AMH5hK18Gzz7szIsMLoXohPMunlkI8Fj1iIn+
         /HvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ2Y0Kxjim4u9UB5wt2bbA4m3TZ6bvt8p3aqEpFzY6nnj2LJHkZCfcQJFcOGR6t98/pIJIMlMlqDSRpMEDA3nl@lists.infradead.org
X-Gm-Message-State: AFuF++mSMbNJNu0qjaoNKDSAD9mRbJCpFFYRUPYtyjAY1QUsQK/sKIJO
	hIw7q/YntzgjS6edbdOb+BCwjuUKijIEZEtiGDjncVBccvYCFKRXCwobBo4rng==
X-Gm-Gg: AYBFou2p5FVNLI5ezKJVzl5jLcOkznrjF6b5HhDfmJkY6m9LXD7Bo+948Kyl7Smcroz
	TxCpilxfV+gl0BghAAp8rzgYvXy6lNZGe048lnVTM4MVCNa3shBom9sgewIrP7u/8h3m/AcdLZi
	kVKsV3w5fvclEiHCkGCCwk24/mQEE9qs/z/0vLGReyCLxflSzLoI0M9LG43TYjbqsAF7ihChXAs
	1YabljAl52nQwPTSefDiK/4FP4bzeht3kNz6QKeh0fPyFVI7s5tj1UZ4pWQMer+uPvgf8PjoI6q
	A4gqvI12OtaiGZjnZuBbf+2e/1gtuKuBYlOvwEX6XoPiVbChu+qA7Csod5hZKA8Azfc2HUTZwPu
	dKMOzPMZ65juRDCCvMYliM8hii1mgLNZ7XYIbCB2lbnUUYHtsUUa5ekzvjWhNzuo2KZwLlgtgm+
	cbZ+gKWQHhwsJrCLJExQ1tjHGx7W5gpo1gc8dFoc/c+AbChLfLCoJjZp7bW6UFZUg7Qpj7EKKYH
	Vl+MUxFQ9Q=
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr6021748b3a.35.1789750055865;
        Fri, 18 Sep 2026 09:47:35 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/2] soc: apple: rtkit-crashlog: Add AArch32 IOP state
 parsing
Date: Sat, 19 Sep 2026 00:47:02 +0800
Message-Id: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE1CUT9XEYtiMEErUxGJuLvG8
 lu894AnYfLQRA8IXezZ2YA0jmBYjJ0JeQwGlSid1GmFcq58opH9KnEQ45fNzajGiSqdF1mvMwj
 pITTx/W/b7n0/0qGdUGYAAAA=
X-Change-ID: 20260918-rtkit-armv7-crashlog-2dfe86453b63
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9ThTR4usKlllKQeYQGdfTkQcMVtWtvUIwI1QCDrW3UU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWsfexwtBAWkKYwS3MiJyZn7cTBuRWss6Kylh
 VQ5Upp/K0WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rHwAKCRABygi3psUI
 JAnKD/9KcNtXTJThW/oYrX6AuZvPBkFL4cKG1KjGW8UZdPaOwY7mplNnesgBdScWem3kqA3it4z
 yuN10j2LV4F5X+OUWqKW8oQAKhtDnTwZhzZjPaO4H7+zw34dnDj7GVzVZ5H+uvvc02YjidfhLHu
 zKoN4hKN0706khQrDj6f6UCCBR8iNPyS4LyWnuDYzpIZvRnSAn+8cP221UA3lLJZ6ICcbw36nvY
 l6NIKpZ6L0TxRjhQhwq/RdrzLOMu8f+41XVqq/UX/Fqx9Szror5vFiMWHd14DbqtArKudSR9Yi8
 9v206cnl/BbV1IAqawlnzslkxUo19HiIZ3HqveIB69bz5WGliPAv8/JTGqpZtkjqxuJPMIBun42
 hxil79HgAUgVFUs226Agxo0IgDL7z6juaYUlRI9EdAyQ+f5E+pbWw+kiqSuoG+asR/uTZ9bsTx9
 QdvuHwR2TmuXNJck4VwJNhhpqGM4nGr32SdlJ0hRnfycXmB0F1antz3c8l+5IM5gyCJ21zfxxFo
 dMKEfTl6ONzG4OPwxFkM48OcyXRPI5PNslw7U0G/4rBZ3F+CNnibmVuqIFXNhNZfEazvveE8MRr
 OHT364iCn23+MuCoMFZdXzZ7pCP3ODotL+da0UxVMA/mMim7zYqrkDoVbRsECG1B1a2aXZyVuCU
 0E3WPsnO33qh5Lw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_094737_912542_84E58C69 
X-CRM114-Status: UNSURE (   8.63  )
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

Some RTKit coprocessors runs on AArch32 CPUs. When they crash, a 'CrgA'
crashlog section may be reported containing their architectural state.

It is useful to get it so as to figure out what the firmware was doing,
add a decoder for them.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section

 drivers/soc/apple/rtkit-crashlog.c | 139 +++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 21 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-rtkit-armv7-crashlog-2dfe86453b63

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


