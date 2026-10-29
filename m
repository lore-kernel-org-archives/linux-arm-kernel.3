Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rD6copkE;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=P1dTualS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=btdWeBzs1dLrYh9rnPOS9gIutLtzVR7+pVu+RcU5mUs=; b=rD6copkEdLUFZV
	gdBdJP5d7Beuu04I9S/l4FGC9kxPmAZL+PQSqWYbyLChoBGW7+uaIzMInVAtHvsQOdUl++NFH9KDV
	YqtCV08VJNtruLrig4iTo+1lojtlon47Gz3hhOl9TKOH7oNyJ8T0QnXOwY/uekzQmibrgxJWcdksl
	Xofkp58x3POCoZdXxZbR0UkgHQx3M69BpGwElUekscbCuqhzdyWv4WgnfTOxTWRQnj5UILQ3/O/dZ
	l62ebuRDANrPy5kpe3xqm4Boj3Oo+NM2AS2MPW8IidxElGFa0EV3/mhhFqTzI0lKm8Ox2dgB1Ij6w
	lRT9kC0ETEkokKmgK8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNFF-00000008xg5-3JdK;
	Thu, 29 Oct 2026 10:20:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNEB-00000008wlK-44XI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:19:25 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53FD4802;
	Thu, 29 Oct 2026 11:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269029;
	bh=SPcuBBIR7dKdQ904VlxD+Px2WmT4SWS2nZXwa2GCBF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P1dTualSNMa9V+40wcuRxg6QCe+n+q2C5l7Nkmp3LuWwuCJjoRmG/qEPcQUD1jJvz
	 CBgyeH/pCTA+yNz5MXgScOWLqFR/p7UNzZ9X1HniNcuytIbriq7OmpPt5QUBTOduPL
	 O/FzooMDEXZluMw5xmCsg7tJs+zX1+wJbcY6iJB8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:58 +0200
Subject: [PATCH v4 12/14] drm/tidss: Add support for AM62P display
 subsystem
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-12-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=uuSl7ff1pNgQFmffpORCS5nZ0IwUw27z/aAJ8FR0KuI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2ZSCOHpzQsjksQQlVbXmtz3xUmnUuL0JWuv
 kdh2YBstPKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmQAKCRD6PaqMvJYe
 9TmZD/4177GjMXvjJ7KlMltzauFk21xGKGnmfoeg8erkfXJ+mq9j/PELLqBt3r7e+do0/75xQoS
 MQ+a9rdzHCp4itzOFFg6Yeiovp4hm9DlV8Ribj1kbCv5dhDi3jlaPOnUXRT2H70LVcYEFqDSNAB
 KT3PRDwZ2em+ZduB96aYg0HCTlJaCdnfCfHCwlmD3KXDjbVKKK8+mML2xb+/gAaKRHB6bHUuccv
 TWBYZmk0i3KO7JHz/XiBK40iiL1EAJ+uBh6Q5fa1/TcU2EOylAJYXpNCGuQ5LK142XyfPXkIsoh
 dVlJ6xob4ottaTZQG9ZJ98gnRvUXQHvAUna4jwfY9rhBfZzTk8Yi+sLKDjbp1xuKRawDXgmQ8Qx
 JZsxsuQiNmymuN7DSrF6nqrtCm6AyXx86FPoYPm3b4B1iTv/VtubVXM42FvYXxKjFQcU+tf1ck6
 Txngu2bsqcW9XIymQQV64DMUv2jTHP/bB1osMJeNYuq/o5SJ+/3pKF9AmtJZwmEQOjfGFp8idc5
 UUOahF1SvLG8VvpqPaALzT8XYMhstXNkr57w+7ZQ8fJfjSGxEM1WPJw/AarlEGav+r0Wqa8a5uc
 lnoNDhNZyz1Xg7gQq9NOjFCxhWAStpbLETGJJzHlFET6niVkeHsizDLMKRUo8JKsd57Z3LbyJu1
 4f+cDTEwOJ2HYBg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031924_267268_6ED95440 
X-CRM114-Status: GOOD (  12.18  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 44b0b009c29a..8e3cbfb5ef87 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -240,6 +240,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0


