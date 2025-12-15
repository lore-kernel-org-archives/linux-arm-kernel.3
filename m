Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DFFD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFvkp8sx9x7p+ety3YU1OWBYrz0nSL8Cjejt5tXhoXY=; b=dUAnB31cfzqXqJ9djRI6ldfWUf
	SAmrd6l8im64tsYxfuiIXzs8w6Xl3d/EWGCvi5WHn5EiAznKuPV/UgFbkx/fM9sl3rSmliVKyN+iq
	AorSHOzXBL3eLLgwLRua/k+IWvTyqIWjEo9eGtTuHcoxiOCc5/GYwSSxj/55ePYrz4+VEjNf8Uxfd
	rQ/praTu2uL0gND62FXcX34X5JATHXC2jBkfL78yHMMs11AkOJem9G3KP0ZFprsNo89zPD7+nFuT6
	TIZbz2/32U9HJKwhvxJBJOgCcw8QdIVCAmq5qq/l8CV9Y/xMFYUx/mg1tJjM52STWNKZcQW/OMivU
	i15guA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7ik-00000003coy-1FMT;
	Mon, 15 Dec 2025 12:30:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7if-00000003cl7-0pwt;
	Mon, 15 Dec 2025 12:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765801797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NLE7W6B1mOuoDcXwW1XAoLLAmagS6oyKJKxl7CaU1nywuPYY3WFykZQnYFo07fQYOEEGdZvjsMnJTZwpjGw+sJ5HMZSJ/npyFcmP/rfXed9xAelll1JkW2b2RPGc+oBK9QNxwo+O5WVsNZ+B/ztKm4RAmxkLTY/ABFfNYGuwuuk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765801797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YFvkp8sx9x7p+ety3YU1OWBYrz0nSL8Cjejt5tXhoXY=; 
	b=GjE8xM3YZHW8+IBDQMM7+Lr9wDE8nQikU8UfVwX8Z47g7i8UTmS5hc854UZMJyjXf40Lw7c1mP3xqmrtaPmbeGU8fmzOMdzTgRdJtAHbsP37rEkYXBAPbC7PtZGl3OynEafhF+KZa6/o4QW9+v3fM8vLLosemFHWFgM/uk580Fg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765801797;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=YFvkp8sx9x7p+ety3YU1OWBYrz0nSL8Cjejt5tXhoXY=;
	b=WlgM9zOdeK7/1T9h5CDUKt9jGDi0MbmpLvxiZIH86qNNrjY/Spwu376r2z1gVMFe
	BAqtFRIFBORKjIbyCWx/kd61UBCFCxfoEJwpq4ePIzOqWX3rx9dBYZjSPoqn4FzSSuc
	22YsFV0ckstqo4BcsYs/f2ZinvAJJZ2QkFOjJBHU=
Received: by mx.zohomail.com with SMTPS id 176580179655941.66611173233514;
	Mon, 15 Dec 2025 04:29:56 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 13:29:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
In-Reply-To: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_043029_490352_4EA22042 
X-CRM114-Status: UNSURE (   8.91  )
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

adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
property. This makes it impossible to model devices that have ADC inputs
that should generate switch events.

Add the property to the binding with the same default as gpio-keys.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
index 7aa078dead37..e372ebc23d16 100644
--- a/Documentation/devicetree/bindings/input/adc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
@@ -42,6 +42,9 @@ patternProperties:
 
       linux,code: true
 
+      linux,input-type:
+        default: 1  # EV_KEY
+
       press-threshold-microvolt:
         description:
           Voltage above or equal to which this key is considered pressed. No

-- 
2.52.0


