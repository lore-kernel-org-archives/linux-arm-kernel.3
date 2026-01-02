Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62215FA372E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gp/pH0zKhkxkA62RfQkWYKiIcEXEvhrGjKjOOk9sD+s=; b=zF/fk8v2j9X6Tek14PyirSOiYy
	w0fuvjW4KAwGhZpQ5QkQXOEt4/OjcgGYzQZu97nqtpILSDWCucvnNn6P/A507ise1T1XTFtxwWUN5
	t0ZE/xKoyw5gCSkedh1/3SsP6dk+0LIkwrcS6Dgqz65Q6afwzRgX/VaVtbLXrkaE+6FQsZ6GFhoBN
	tStTAae5AOESakAiCEbV3DBFoSF+ndj8Jg6NQILYwUDptFY7eZWcHIkyYedShDSC8J588tp7eZfF9
	CvVbVhLX2JaDC2xZRGzXLJcy+yIQV4paqUIUUDlNkd6frPm2utapAWZfYlsZ7N0nsFg3n6oonvxhG
	jZpDAD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLl-000000088Jk-1636;
	Fri, 02 Jan 2026 11:29:45 +0000
Received: from mail-4320.protonmail.ch ([185.70.43.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLi-000000088JJ-0yhM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767353377; x=1767612577;
	bh=gp/pH0zKhkxkA62RfQkWYKiIcEXEvhrGjKjOOk9sD+s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=re7W3ZXhj+mdwH5csuRiJONd7iRTZyPn7ocSsb3oJWjpfmYD94lxGvYAiMokkc6Sk
	 eOaqVe87flopn1hQJcWbJ0jZ5LxKp2aIxb6cFGLesY3B5i0OenGwoJKMwmZ5aqFhgy
	 L+iy0gULy5lHO+Ut5uSWCiXjd0tvVpjC3oxnNtCF+iQPYT6yFdGKYG5J4u/YXxHvwp
	 tH7AsIRrZcEM3DKhB04RpIDNbOfMB694gcyMmMLkmzn8Cbrnt2VY5QVNICqp72fsWd
	 ks9WS5LXbeudt/Mb/FeAdSUT3AjV9V8pS5SvFY1sDa56bEjVgjWl8UiLLjsxDrGSNW
	 mEXvpjZt2blTg==
Date: Fri, 02 Jan 2026 11:29:30 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: e5b2425ccbd1e6514bc36e6cf6fae9f892a47cae
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_032942_881956_23765F41 
X-CRM114-Status: UNSURE (   6.58  )
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

This patchset adds support for the pin controller found on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
v3:
- Remove unnecessary addition to enum in samsung,pinctrl-wakeup-interrupt.y=
aml

v2:
- Set proper FLTCON offsets for ALIVE, FSYS, DISPAUD, TOP pin banks
- Define samsung_pin_bank_data structures as initialization constants

---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 122 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251228-exynos9610-pinctrl-7d7988fd50a1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



