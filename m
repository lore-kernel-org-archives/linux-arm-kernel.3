Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F104C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=; b=LTRsGmJR6qdDriCh8sB8oy7XTP
	0Vrn5K+3k9HVLfSfNCk8uCvofbg2C25l/+a3hBuwfe/LITcjuDb+2gQZYLv05+145eSvMF4NhoyeK
	Wx/VBe8QXS2NvCAXAtGuB+ofPqsq2vWhmSMam2vu2TRkKqmv9Mf9TvOb797m+qwqSF82Niz29+Yp1
	xV0IVQDiVc4iZ2WWK0bMLk1cq1dyjNbyDih8Tl4S+sbPzslvREMgFz7moxIYxQS7PMNbSIRQgNs6X
	JKOir39dbLouufEF1GLqYi7eOZfdj5oIcprGBssasEKXGu8DwDSETuUzRa1GLCS3wreiEmCE9VuAt
	2fx3y0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMMC-0000000BPIr-0wKo;
	Mon, 10 Aug 2026 09:31:44 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMM9-0000000BPHR-2Jmk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:31:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1487643b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354301; x=1786959101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=OeFu54aK4y96EUIdCpAaMoNr+VKRCQGn1GcykcGfI5SdaH+RCHiwhZuldeHK2OkRkj
         o9AboctZYZrkeHzm34EYlRi+v/RK3MYRFtY+pHBx9JWiii0o8wt/P5LO/ZZ/i91sEKKF
         yJFD8dg+1Pla1b1ByjD40X+Rg0iayddOBR1ar8LBagSwtjLZOsziAtQ2L+RkmWEy/3el
         3Z4uiXG3e0hj+7f/8/QdvaBCC78NG0KOE6PRNto+OzMRmXeQ2SaKlkJ62+aZja2YbaYh
         pkHE/1uL2M5FSMUSo657NNlFwd3mK0QUOBe5GQKr6jNJruf1y/5GquAi+LKkl3Z4/cwI
         1dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354301; x=1786959101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=lMJKy+VYU8vO2EW0SvELh1PCJUAy7Oxl6yJmjjloRQ2hHKFM9vHwG6SnPP/zCwEEed
         emjem9cVjyIjdoljDy10PbSWfW4bEnOkJyIWRJVDy4X4lm8ASlwUEePOXmy3HSqlNt5w
         F7FJQnPpmw4pw8hb865vFNdj/TCjrkNyaVyw/swLu61dSX30QOSSN1r/zflLv760xq+k
         3vtediBCbU5boTAqBe3rbhr1UzoN6t/Uztyo8hfeUVu+VtMQAs6BG4Qdjn8OzHlfcE35
         dUnvoDH3kmLtfEqLG+UcP75h9GwcGWKk65JD840kyTX2ptQmPKnoEX2FVoV1fwly/qmJ
         QvkA==
X-Forwarded-Encrypted: i=1; AHgh+RqoO6VRg70x/706jRaP0IlxZd+UzuVfGE6iXAi/YqH8Dbz67xpbq9xfSlCrkzSu2xeQJ8AGI2nTcjfmU9QOvjds@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwPKlRKPwiJIYiT9pP3tUfRbwql8OGoEvkiXOMxoHFR3B/zRn
	MF6g8SpUbDEScMruF+ynK337/7pwzmmMMja1ncxb3KeoWHqAWSWxH3eX
X-Gm-Gg: AR+sD12vbQ8iNKvWrTChJOYVVSrw7H3kgsJurrcHoab+od9wrbIRjUuZvNP6vQo5M2V
	Q6Zg8YH5hhHA52t/ewOiOeO6iNgVGTrduVc7fUrODg0Ib+3JBY9ilDBkWaugRleSmtk7JemYuQZ
	IB/x0sjPfzdUcRoOZJgtMz4QuJ5H6IHdmcTRIAEqMxFf/o/Hoj2PkXgoGyvvZyXLpLzsgRuU863
	+rBzWARYZ07BKWxRrTlBkfRqsrBCjS55Ek2IjdrdUdM/TPJhTbFPSp82AcljFeJgBtMipnp+unV
	twFOjiPVpk9RTb10LYNiaTp7BaH82HG5rVbJRZKzZKcS3nX6lniU5h/hE3NvKU8Q6rdlsPCtyeI
	MNbJWk4cfnHT7AR+QcSbYanqnhSlgJT8zK+BnXzETlAHBdZDNQYaRFMb3b6LK0ioFnmsbrtDy99
	gXSW8uQ8hLFIxeSUPZxiTJ/YzsFgrllsuFd6yIcV7qOnVWS1ALPNW7ZhRoZ5TToGI3Z0M4mNxhv
	EZyLl05DsiJqdxWgomppru4IKgtLVOPFoxiGKZpfyW2r/6D+MGuYAmkf6icRS1bGsnneg0n6QbJ
	sC5c
X-Received: by 2002:a05:6a00:3d0a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f6b7ef419mr18218663b3a.9.1786354300606;
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 16:31:11 +0700
Message-ID: <20260810093112.47807-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_023141_604015_7EA78B32 
X-CRM114-Status: GOOD (  13.00  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-1-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..9e529398c607 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto phy_shutdown;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0


