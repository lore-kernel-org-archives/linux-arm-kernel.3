Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E286C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1xXAR7sHjfiShKLvtMcClqJDZUo+C9C2NEO/Y0JRUM=; b=b3XTa6z/UFcU2zOXm9rynp2J71
	9J9GL8VdBc26mTxSLTNEK+UJce/gBMRxb9XdhtGuizNDwUCnbzv0+o8rKJEWQrsVMC4Fqn2ifxMJn
	Yn3/DSdkFhgJ6asc4oSgfBXhSMOO0oijmaLv8vI7qrLVl0ZQfpVx5qX055J3MFr/HG4vNJk2+MP5L
	OhtVC8kaqYaANeyUhdK5JTpTfyAauAwt0pR9uUc5GtTXJRfWI5nc1s1KJeOsYjWtDrRKvgvKz1Ead
	MRU0v/QqCcZjCJ4E5IUHafXB+ai3ho6qawhjiVbRHi1uWI3gPy1v6/b2na7QQMduk+bWnkw3NS7aD
	VpjOdxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xVD-0000000AAnI-48Dw;
	Wed, 16 Sep 2026 21:49:15 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xVC-0000000AAmd-0LQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:49:15 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789595353;
	 b=pJ9NxQZPBZXg1WfRUtscZHCShmsrzHGKYjMYGaz+nJ8S1fXELxPtuSj0PTcdGzZGrCcwdomMQa
	  IUEURZjh8AueKG0o5fw1ZIKxfMZsUjGmrKHAEfJYeukUJGJOb8CeKzrl2B8lN0OWECFkOZWVxu
	  UD8WxevyfS47VgZ62wCTylyHeF+JxU8SaVxKYc1gI9I8AMPadNkK69iFr+eRV4jGxZMq9kQXSl
	  6hZW+B0Y23iJm+oqi0LoifFQgXgd9jl4SiST0sH5VR7il7TA4+N1NAeKjyrzUOzWn4BXCD56Hx
	  Jbdr5m+HZf2d1p2CewF2G1zHAl9dQXnGDVDbG4qAIiHX8A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789595353;
	bh=SArq2+UwtiAN8KF2iej4IW97HFnrOvv94ZfX1GMeV2c=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=VGXHsB0l67XBrVEywL3UR199F8gz4EqQQSJPmCYxOxOfbPSpeCv/9mtHs0b0+Z7BYFvMoudyXg
	  SDtzPD0FXueXZKQrKNVZA+9CZXw9bQLv7rqTKxA2DFYThtJ15FogNujyh3k/mcDXeKHO+luCUM
	  1ielPeZS9bM3KawvhSkLJv/h66As2EoZQeT936xU5oTzZ0UJ8V62FY9uT2e7nRfHdvXZdsONdO
	  dTZ2bTUysAcOg+kwVZJ8u1VnPUZHMUDq+L+wyfzoLgELMNRUdlogktfw1SWX/LaNDOJF+f35Os
	  kIE1EkhkdJ/HRkm+GCQ83WD8LRBEzpARHmX3oaGcFiPXHQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=/1xXAR7sHjfiShKLvtMcClqJDZUo+C9C2NEO/Y0JRUM=; b=2XS1ximoAPIdpheFmODcVAAec8
	cJqNzJBG+MteAK+Pc+NkEqMLvdRCeBiNk1HOfaNFrPx2xBAK/wRWy3aG1/gTmNOFtQiniS3OznZVB
	yPB7rmazQJayxDBf5L8+LsW6lNgtjQrk0oOCKFMtpLwu2TQ2+7N9TeUI9yKBoLQq2BPs=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6xV9-00000003oBc-1Unx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=/1xXAR7sHjfiShKLvtMcClqJDZUo+C9C2NEO/Y0JRUM=; b=akkfbjnQKAX39GctHP0syTEnII
	DLYHpi+xCRoGyRpbvM7sB13vwPQrXehzIp2YtpSBCHtIOIu+7xVLEfyYX80mTiU+GUeDYw7PabRsr
	KtMW8JOZbi4InQ9KtQj//etRtThJILkS16sOkj3jS8Sia8fkYxykfu5iqGFUs7yjKpp4=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuS-0000000058P-3B0Q;
	Wed, 16 Sep 2026 21:11:16 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:56 +0200
Subject: [PATCH RFC 11/12] dt-bindings: remoteproc: imx-rproc: support
 virtio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-11-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=francesco@valla.it;
 h=from:subject:message-id; bh=SArq2+UwtiAN8KF2iej4IW97HFnrOvv94ZfX1GMeV2c=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ/MSVkl8zrTvFOW0TZozZQTHX5Tr3Okt99Tdb57f
 s0JnZ2fO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJxC9hZFigZPTpgLCvUXRH
 WHH7rYUSvwtd5q7ZWCf876rHPkMdPjFGht13JldxuRXvP3L6YLFt1pQvnkZZRUwBkqFH/v9mejv
 RgQkA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: de5dd60a1987c0dbfabacf3686e4fc99
X-AntiAbuse: ID - de5dd60a1987c0dbfabacf3686e4fc99
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6xV9-00000003oBc-1Unx-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144914_123714_A2243107 
X-CRM114-Status: UNSURE (   6.88  )
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

Add support for virtio devices description.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..32fc415c7028 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -92,6 +92,7 @@ required:
   - compatible
 
 allOf:
+  - $ref: remoteproc-virtio.yaml#
   - if:
       properties:
         compatible:
@@ -118,7 +119,7 @@ allOf:
       properties:
         power-domains: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.55.0


