Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DBFD2502D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HTc95GbLA62xJohSWgrBkTdSAFSujcsQtyGhNdIQgg=; b=byl1kFNNjKcqMa
	H1Fck1JOLgL3YLByD0FuG2aQHFJ71LOiDncziwC8udfzTsUMEKmHhygdhl1On+xepy0Yef5IqHorX
	LPoSPnRn8Tn0i0EiW0sstbHfXRvLaoXak2PF7Q72Sf5gqeUo4fQbq9om4DaAjR/dqs8VpgUOXm83l
	J1PCX+8NtlJuFy9TBWCWrxPQNiiTv2WGKKrQiWJNOjec9nZW1TO95ay7SohKeOvpCnyyJi3uEHiVy
	70p8n/qt1RyO1oKXgGC12zK/rd7ZAo9pLu0wj8kK+toW6vFpJ05KhsWxcCfLUhnOv9hI0X3zB4rXG
	HNt+YQH85znzeHlTe6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf241-00000004UGX-0sNS;
	Sun, 11 Jan 2026 20:29:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf23x-00000004UG7-3q6t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0E6440600;
	Sun, 11 Jan 2026 20:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2423FC4CEF7;
	Sun, 11 Jan 2026 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163364;
	bh=I1h+NucLnbjVmPVCT4uT86wnetjl/SKcrwLsxIVeUkY=;
	h=From:Subject:Date:To:Cc:From;
	b=HfBjUkCgy0Qsv6xO0RAaKH2pRA1G9OjbIn5sECkRGIEmhTwA8UXIM5KQ2Q09G45UQ
	 DiL2NVtEMWBaWczYBSI0tB2Xy/sL6IKExaCADdrrXzcY1juoKBZaKDDhErPcoKW7Hk
	 1Jk2iO0+K4p/AyPWM/ClQHB14y9mFIozyZJZrapzflpDesjHPDjohdjFE6GE//nbJv
	 9a5OeyvKBfIGAfPnljynNQdB5f2FcAc7Ewoa8BbE/K8D6ZutrP7Mcc2LQx65YklVvq
	 t0vc+Jwh+9kzNrLYP9G0Nd3O9h4qNVILTNp8+gXs09UdBJy/Su2tUwNKC1BpDvVOfm
	 eemWCR7sUbstg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] pinctrl: apple: Fixup and RFC GPIO mode patch
Date: Sun, 11 Jan 2026 21:29:20 +0100
Message-Id: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtw+iO6SrQQG20gzJQiCO+et
 PwW772QOAonmKoXIt+S5PAFVFdgNu0do6zF0KhmUESEOoSdMfKJLsiB9vIGW0XK6K7XRCOUMkS
 28vzXecn5A10+DbZlAAAA
X-Change-ID: 20260111-apple-req-gpio-func-3010ca45a118
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_122925_982400_17338B26 
X-CRM114-Status: UNSURE (   9.35  )
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

This fixes some uses of the "unsigned" type to "unsigned int"
then propose to implement the .function_is_gpio() callback.

The Apple pin control maintainers can comment on this: I
am not sure that "mode 0" is GPIO on this hardware but I
find it likely.

Toggling a pin between a certain function mode and GPIO
mode happens on any sufficiently advanced system sooner or
later and this callback was implemented because Qualcomm
ran into it, so let's add it to the Apple driver before
the users turn up.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      pinctrl: apple: Use unsigned int instead of unsigned
      RFC: pinctrl: apple: Implement GPIO func check callback

 drivers/pinctrl/pinctrl-apple-gpio.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-apple-req-gpio-func-3010ca45a118

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


