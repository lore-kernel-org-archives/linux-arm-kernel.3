Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A0FE9B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=87f//Yej2+AUh9A9iH8uD4m2fZ6NHMgB/zE+EasfNio=; b=39OuuovHQfakpw
	kK/l1B0DCWj/TrO5rjOVmGbbW+fSOqsoBND8FzXVg7thNvWoJce8V+BXjocr+cBMo0ILziTbtkFeW
	bsyadjOt1wFTZ/WQIDx7yG5hSUhOViyvqBFVifs7kmiPp1iAJ2/mO6XGtsrIuEr+AxANJyyrGpJXR
	k62z7etBMdfHX1l2FZaU5QJ9309Zy+N4Db9S9RwlRdyJKOoUkQJMVk9CQMWPL0pUnZ8tQtQya5w2i
	EUXHOFwzFwOmFtDhXUK2uEJ8XfuvpaK/Q82TbCkPjNesOui6lGaP1pdeD/gyXZTyoqrTN3h01fYsl
	clFadPXfOk1rcn8oiG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusG9-000000026s0-3GzK;
	Tue, 24 Feb 2026 13:15:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusG7-000000026rU-1jjU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:15:28 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so5738411b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938926; x=1772543726; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87f//Yej2+AUh9A9iH8uD4m2fZ6NHMgB/zE+EasfNio=;
        b=hpOl8bQPrzmf3YAi1gAZpkIdx01G63/hv9NxKV6oWskjDrDWe1ogpzQi7aGK5zj9JP
         /xFZhxsBN97U7JCZNW5IM4vYeThSww6oNL+tCFWmkKlOEiDSx/n//ZkJkxAHN6ZKj5q8
         ZJGhaL/bN1APKNOdayxagECB/6ixoG+iH4Amdufd1sp6HaDbe+1BVgDIYsadExOu+AdE
         QBx4QWQ5XPXZkijnpVZS4RGTAqFBtZf9LiJXUMpP5vKsQD64bIYB6+k1RGCIR8GzaEDt
         Lx5VjyFW3OYqB0sjaZkpt31B30gUF8ikSBOZ/Zv37oqTx6WgmwqdU1owXN3BiV41TL6S
         TV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938926; x=1772543726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87f//Yej2+AUh9A9iH8uD4m2fZ6NHMgB/zE+EasfNio=;
        b=GaGQAvLFS+sXehnZefq/HbU+qonnF1zuvcGlWuD54Kp+bF4oQa+cjerQ1a1R2CPY8P
         0WG8psLQgMjYZ0q/TTNcUJKiOTnRVDt7qB5oV4QrONuAq3aVwLVe69ceoNiPwedc34i/
         vBoKaUCQwMxzx6/PncevILFJk+0VyFJnnW855qtBp4+jWyerKOQ/siRPOgunuH00c6Fc
         oIK5K0DVArX6JyF6graSc3QCTEm0FaFlcKLKgmiOjYJ9kUxSxY4A+dTnFyrIVuAkkYqf
         KE96xR9PCGI81EoZbbzUuNusjrQJux9S4q9wNugaFuwPsMrFjounn5ZgMWSpM2+BpTQu
         mVoA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQm1GPCxtGNO3LwB8K+lNsG/LtQdCcP3LSlCaVsiVQgHLTPQwDQZlLZUsfQbvqyq/VLsNMUUKSYhHnRdnOi7F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6TgymePkm3N8uAW1ybp6K9qmRqCjS/5VWC11SxZcLTfkMstMZ
	KuLzRhQiVGfr+4YSmzozDLIQcovrEndypZmKsOil8nPQY77H3UzSofZi
X-Gm-Gg: AZuq6aLsnpkWCFyPFHO6n9YZHjmL7Izg7SPcUfRSf4uRKYR9EHt+PMqM6V1usjtFZj/
	lbwdzeTxoqRxd1ydkw22hZbZfMszzlaW21JnVzS3IgbEXONnNn6m7euugZuLM9LDiQlwIhZf1Ig
	ky2fyFK80eaTtwQi7r83w45CFun5cUDxS7owuRsw9Pasbs+yxwt9f2goUb2VlpL+NIOe0QIIiAt
	yIK5aC0UcucwxfcnYxyJc6h3wl4OhonMK7wqUQmByjOqM8G8YaQl2oLFhBKlwnJ3MTlfCyBcAIg
	0oR7OI4PHbj0I+8Bdoy3T0Xn9VAjSWfolwjm3mIZjxKSwjUVuZQ5FnqS8PnUuEMWBRfjXaQJ5rE
	aX2xsbPjzW1MmjgL3xW3JNdzbNWbp1WU5cskJ/kIgqSYqgOsMqAf8Qsy5szNzFcsF+MrN7aAWE8
	EQKJWP9ddEeHv0Lm/7o3BHRfad6qkCHWYXmAf/QEFvyw==
X-Received: by 2002:a05:6a20:1595:b0:2fa:26fb:4a7b with SMTP id adf61e73a8af0-39545f88edfmr9797900637.57.1771938925786;
        Tue, 24 Feb 2026 05:15:25 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:25 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/4] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Tue, 24 Feb 2026 13:12:57 +0000
Message-Id: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqjnWkC/03MQQ6CMBCF4auQWVvTaYlSV97DsKgwhUkomBYbD
 endrbhx+b+8fBtECkwRLtUGgRJHXuYS6lBBN9p5IMF9aVBSnSQqI+zqaRLPeBf67BpjsUaqGyj
 /RyDHr926taVHjusS3jud8Lv+FCXxT0kopOjRajJaSu3wOnjL07FbPLQ55w9oFK+jogAAAA==
X-Change-ID: 20260129-atmel-usb-37f89a141e48
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_051527_461137_C0354A2E 
X-CRM114-Status: GOOD (  10.13  )
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

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- Drop the separate YAML patches for OHCI and EHCI.
- Add the compatibles "atmel,at91rm9200-ohci" and "atmel,at91sam9g45-ehci"
  to the existing generic OHCI and EHCI binding files.
- Link to v1: https://lore.kernel.org/r/20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com

---
Charan Pedumuru (4):
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  77 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  81 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  27 +++++
 5 files changed, 218 insertions(+), 138 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


