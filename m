Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2430BC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NYYsAFSk4SPL13LOyi6D3exP9IGS0u1UBBNKtssYwHE=; b=w0ABBZiHJ1upFgSoW4RaOvmOhV
	sXae1wCl+yM8/HiPXe0fY37i8N0DDcgxbwLnFgPxIZSzZxBF6SKVSQ+uj3YeKPCuVm9BFhl+zXst3
	AuJixul/xZQg93wXUm5N1mV9RTZQxfAIB3G3IFgm3tOLnWtj4AL7MuHDk70s8W9u9YzkWpTbgNxic
	3prwOtSpu1P8HDgIq3a183uAkNouq8idouWZ7KYP+O3Ku0nEywpgJSKG/1QMm2BMjaADtJk8//N0h
	fEfbFq9jSeAPjiwgIjZHXVR8x/XoCF9FNvwqUlDVbdnoLdBv56U6i661XbmJkZ8G26jnqHUJKtdTV
	ZywcWp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55hL-0000000AHGZ-07SJ;
	Wed, 16 Apr 2025 16:33:15 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u551p-0000000A8mv-04Lx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744818617; x=1745423417; i=markus.elfring@web.de;
	bh=NYYsAFSk4SPL13LOyi6D3exP9IGS0u1UBBNKtssYwHE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Z1+w6gVXOebfm0i2U7g1EesZ3ixgFZeCdXVSyPPHv2QZeCLKi6gBc8wr5M8wYsRb
	 7xArNAstabMmAoHp/iqoh77g+9/wxm1gkFRiAiKYH6zY4ztzoFB613Qqxu17FZthd
	 A/R6UusZJkTw6UYU9wkqviU1uwhl14m6ewX1RxmjZXoDTO5AjZhlyaf0SbSZKCDug
	 lm3yQAF/Pld+Ov0jgQQkoszU+agnuw+rji0wkYw/7ThT4T5iNtHa+lm6/zUDjDsUj
	 5MziiycfD2mhtxnOXwxzuXjazwXNi/3jbZDd7ZL8qmdVMLIzwOKtaZ9vp/e93ZG9z
	 3ELlQabga3n9HfBXHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MREzA-1thts508g8-00Rtse; Wed, 16
 Apr 2025 17:50:17 +0200
Message-ID: <93bac949-9356-4819-b0e9-3463056e799c@web.de>
Date: Wed, 16 Apr 2025 17:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Cristian Marussi <cristian.marussi@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang
 <chenyuan0y@gmail.com>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] regulator: scmi: Replace devm_kasprintf() call by
 devm_kstrdup() in scmi_regulator_common_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dYBj2KWx0G8HSFAktsr3w1LGkI1knCTFkFXfp8ifYqYTFIU4e73
 4mYZB1o2JEZDhvB0E+/o2t1QzxRc/zJCkBYConfdLPWDWzsqAHtTDS9t8QR9Kvff6GOKDgY
 YnQD971/45QzN6VCT5x6kKyRydmj5eL1j2QKhX4LP4mR6Ps0Y7hDVXV6hqrDIts+94okzrW
 PSTCStZFIiS6X4B2zz5Lg==
UI-OutboundReport: notjunk:1;M01:P0:kaeKT8pXSfs=;qNL2+lwWG1bWQYIrYAVYJYH6R9Q
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_085021_363172_20AB7541 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Apr 2025 17:38:11 +0200

Use a devm_kstrdup() call instead of a devm_kasprintf() call
in this function implementation because only a single string
should be copied.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/regulator/scmi-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-r=
egulator.c
index 9df726f10ad1..a0b39c83deb6 100644
=2D-- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -223,7 +223,7 @@ static int scmi_regulator_common_init(struct scmi_regu=
lator *sreg)
 		return -EOPNOTSUPP;
 	}
=20
-	sreg->desc.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s", vinfo->name);
+	sreg->desc.name =3D devm_kstrdup(dev, vinfo->name, GFP_KERNEL);
 	if (!sreg->desc.name)
 		return -ENOMEM;
=20
=2D-=20
2.49.0


