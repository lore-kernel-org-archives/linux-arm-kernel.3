Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ABC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NFNMZyiz;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uVZrAn9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=; b=NFNMZyizvfdr6l
	PgZ8mcSoeOC1WKU9mSVOqjPalHnD2fyjGwNILQw0XJB+kZ5Mr66RJCJUy4dRi8pB8bzYpXSpp/oSN
	Uuk/8ADqQPc4MBpiAwcsqYQ1HbgZ0N8YAJ8nFaQLFtZXPmXPgM+34vYjW25RorbfuW3vjBNe3UmmS
	EBpRI+SzjlyfU4qWjpnEAkf4bLRULDipL1cItqAP+1Oucqi+Hw8WQzZsxXWXgaAKlr2qe6oAdrb5Z
	0j8yyTARDgeSnewkOqJ8f92PKx9DiJnmISqunaUYFw84Ql6m+E4SWsE0Vv6UB2QRc4cqfftevTNkD
	tP3S+n+h+6QQTUieMotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8o-00000002oTj-2n84;
	Mon, 26 Oct 2026 16:01:42 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8e-00000002oLB-473G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c3fd91337baso430930466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030491; x=1793635291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=uVZrAn9nKfwTWLnCqQcVPGs0xYjFY563grEZbSjjP4djelj31DHFINwL8dvRGVu7/w
         +ouMqPFVf4ItfcS1xjecmQH2fXB1eRXSpvtO2+SbIgH3yMnSrfh6tV1GvdN4ExxFYUeA
         YvxoNT3NzJ9Ifvjsz+G27KPNSL80E3o0RxEtP9ryn9hUGPpNxOVVwD8KcbrbYNkUPeFF
         969NB01NJYbEccMzq/lv8YxIyLhTHAyXMkPTBxS7BzzY2l4W+L8ZbP7nGmrZ/hTmw4kP
         EnlTmh8OPUxKfJ6yOTtMPAtLp7+XKqnC2tgz8sAGLZRTT76E+TU+loowznK3qJGX6nJe
         VJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030491; x=1793635291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=XtTeaCKpKizjxhQIl8khqWg8aANZfQewQv1xqVLSA9yNbX/M/VzkKtmEUX6PNgm0G3
         PftHbjtVvJA+vDwROZLqPAV6mCAVx1lGpfgZi6za7z78OqdQw/QfJcgPDmET1aVsIZCG
         iCFjHY4xIayMdPZlLBW0XkPK9GKSCi6hugg3GVc2XYcBGG4RwEDM6mR+xH29NgCttWgA
         kpAxNFNVoJQmzsiq72nx1RmjQ3EX3NLABJ9FDRzFTkgJn9n3aElxJ67NAl7pPgrf6uEE
         yZJSMFoZ3PABs3n12gmq7T7d1wWIu9r/6bQqM8xD/WEVLecSvK3eTdcYIWAgG+gboJrG
         +aUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/lszU/kLOR7jNDDLxwsVyFWJFbcf20nUHS+JsRquA6izhWnxAPDMNRkijW+d0wg8zuo9iHAhxry8G1ZXlyl9I@lists.infradead.org
X-Gm-Message-State: AFq9FYKp1q0dCSNj+EOI4j+CIQgIIqfaTsenqjVuQBbV3sROFj6cHMQO
	dnM1I5QgpfEOpi8u65+eyBV9p0P4j8d8B9WhBq9zjySn3YhTGB2grVQu1ipFjh/b27o=
X-Gm-Gg: AYBFou2NooxDQqShvf8pHuOcWcGRLpqHEgWjy2DJD72DDYyhHzIj7vH8Gt90DQhmwu9
	L6M9tGOOfAyWtjet2zROfh91Tk3rg2kG2AaP76fhlPLRspMVfet2vMxr+wmYFhQCqry5AqjDpLt
	FDZmxnn9vgEI8sFGmpU7uZ5yftO9Y7WRwL0ZQgnDaYXvUZFePM+kqVmUiav8verEm79mnRtj+fo
	zGqeFgyuh/MvzoSploRdHxrMFvMbtdDhrItJbbDXrqTv9EA3eoEHx4lSjQPDIadP7C32H5kVfV0
	1GoKEeUg/vMqYi08Ij80cFWWA5hYgVcJbhFeGvTw1SpUntBGUqBYWt6idsymIMgOq+fENk+63Qn
	23vbRkQfi5EXqhfQ+57SNgxejeZ8H01K9Q/l0A3qzNFYeFSHy1KwYgsqZwmabd38/U9heHnJ8+a
	MhiiYRIfNhqSLCTb1VPuPoEythCMdp0Rqlv5u1n1tofju3h3t0rHphu43da09FdfXtCbydGAd7l
	Kzx1vi/Kac4uHo39r1yQsTxWejIEp1sCmqkiO7MQpiBebqjLpZfBQqs+nWKaycIp0kmf3uz51b7
	uqsRU2Zq/BeTztrxEXVMebEKlYK92INkBzYkQ2EIVSiny640Za5FtR/yArelHxmQt4L13cfyuI/
	zOkKG7o3+r+PE2HGn84he3ML1xJAqvxx2
X-Received: by 2002:a17:906:dc95:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c46bde24eebmr834629766b.23.1793030491260;
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:27 +0000
Subject: [PATCH 10/15] MAINTAINERS: Use linux-pm mailing list for Samsung
 Exynos ACPM thermal driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-10-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=927;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BUTSbzEDMtAp9xedXXWiQmdqZWmXBU0Yaz6LK7Awqpw=;
 b=QC+yB04KHzmX5XUlB+M3WHYVAVTzsEU7atGXSGu9B/dV19AW24NT684VZEvIKwYcRbj6F20Un
 wPF2S4wqf9pBCDVZf1GnUpDmH22JyWeQwySA4zYEGDPNhN/tKZ9uvFY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090133_058575_76E0597D 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List the power management and thermal subsystem mailing list
(linux-pm@vger.kernel.org) instead of the general
linux-kernel@vger.kernel.org list under SAMSUNG EXYNOS ACPM THERMAL
DRIVER.

Fixes: 05657c7822f2 ("MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e9fe9c2a39b..6da7c884373a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24382,7 +24382,7 @@ F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
 SAMSUNG EXYNOS ACPM THERMAL DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-kernel@vger.kernel.org
+L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml

-- 
2.56.0.257.gf7497c7d27-goog


