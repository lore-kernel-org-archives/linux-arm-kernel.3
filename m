Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11832C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=; b=fqkAJkYED4/JD8nmKGDN9eAn/O
	xGrl98hYuJLQuyxdnYXKzqqlD8gBkAPFD9Ym7coXljBS/5zEXa11s7vnFsyukuJKeI/rJakvqoaq0
	HMKOnfk1+0ANq+MmyXUfQjGLLR4ptMs8ec8kwCDCMQkxS6LtXzd2GkNHx66RhPdKMKqtJpa40ppQE
	MhcvCIWF+JqbrRaKjGnqkBAQ0/77/TdvrT59YW+cWYx+QKa5vmcVzJ0BNWWT7GvSfR1G5FLjNE9yF
	7Pg8KpUDbaGHZDczjRHUU3awed/Qn6yi7y1TU+QxNtgB5O6ofzOq0E6tdx6dmf5UhbJuwwUSVtJOg
	SFUWxckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvtA-00000006utF-32hU;
	Wed, 16 Jul 2025 06:45:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvZC-00000006sVy-12ol
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:24:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235d6de331fso69212535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752647073; x=1753251873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=Qm5BysuCU4PQtZEUFWBQ6TiHiKZgY2F4lZJ92Nc9QxF0HoFHNeyDNZoPjmqwgKGLSf
         d5MhPsgpyqf+REqp23buYRskrKgV6iEteyqbmaaPJNHBOyFH9KbLNezoEgQ8SHR45VwU
         LO96iUppeIRkZeKidL86UVyntZGkytJEHAedMFRtaX3z4ezi0jF2v776DyqbgD7+LirW
         kGToAVip2f9fFDKm9amFWoS0n74Ba1PDjWmKNBBP/3x20ja5OjrdLdXg4FRQvShQFQTe
         nuICMLLrhiaRteubP3lDpEeeDqyBgnwONBbNGeuDgrv2Zn4DBtDQyCB4n2m1rLfWGFPM
         846w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752647073; x=1753251873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxTTJcqEHv+qBmIyyfl+JxjRyKaE0U2wO1Y0rWsQE80=;
        b=iVXz7fnh1ngg0N46xSpzjcBJqRlNHQjDmArhGw1FPYjNLWJw4TFuaE5IaNMUYKumT2
         y1uMzUQx0BAdV8rtqNk/3zSGf6lKlUx22HGM29WYnvv/m5EEnAsCKlYUHfUXCmidJRdf
         4hTOjMYZgFGa03MbvGOC9sWgrDhEejyEfG/qccSoY11+b1+PtKHCUo4+WBi79SXPlVG+
         M1sP4LwYjsy6/4KkkLsPx15gaoIZhCj4w/rmsTfwn+D/Ph0qnTh7T8s3/j/EnwU9NBMb
         0/tmnhd7K+zIGVUyGv2OvbeBEeVnIi0Ae5Qg/v5hJbLvwpj4MzQitQ9i9yOS9kYhookT
         wVjw==
X-Forwarded-Encrypted: i=1; AJvYcCXBtWpKOrSFVciihlQ9yHmdfnKB3hLgFMwLFlVPZtx2bC1vPV3SelSi1xDKqofsthBT8TrNtURG3DyutUym6yqO@lists.infradead.org
X-Gm-Message-State: AOJu0Yza76mygQHPsuqr1Lj9oJanvdyrxZrUUqrCCqaKsNHM2JE942hc
	XHgsV87KhIiF/eeyeZZgk6OXv0SkvF8JIvaQh9RGinRV/eEPqR8b9gr52TebPg==
X-Gm-Gg: ASbGncthRCI8U5Lmpwv2BQo8hls1LgeOkoAfeQKgjAgGy/MyODoNIGJ/wKbBa6wxXcq
	sjeVgQncAL6gkYYJsEp2Zb1bcdWhKMPwjKorMfB+VihNYW9YBTvOwKmQKzm/hy8VpOUShPcaro3
	gaNsrBU8W+Ba9Xk/+TUOpdtUW8ht+TDQsW2WDXdGzG/dVBwZwc5kckGjdGZaq0+olaZDOBLQhW1
	YbqfvntGVC+1AcmZqMOhd1ENHm/xMXZwiT+MdqwGtlEhdcQNT5oTKZ/J0WR4zoUNciEcFWYPVbR
	o3vOeIgo2Rzzv93rDbmeCtbbCouaLksMQABTY99HFEWDxazNm86tDafaxm2ez/FunGrvZuKWQBP
	tsF8Gqz73u24nIuGnZjzoEvUaISZAiuWl4QYesBiRw6qfG0CWJ/1IgSPcQdoADGTltBo=
X-Google-Smtp-Source: AGHT+IHc5NRKT72vFJzQaq8CRt6yzwQTtLIRVCztcB9Pta9EPy2rcxZm3nlBUajC1g6t9FPJlhNKzg==
X-Received: by 2002:a17:902:da91:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23e2572b0cbmr22515885ad.29.1752647073057;
        Tue, 15 Jul 2025 23:24:33 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4286081sm119060955ad.1.2025.07.15.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:24:32 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 16 Jul 2025 14:24:14 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-add-support-for-meta-clemente-bmc-v7-1-d5bb7459c5aa@fii-foxconn.com>
References: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
In-Reply-To: <20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752647065; l=933;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=UnfBA/U+nB3GVshcJhQl74M74uA3eyzQykqLq1TeLXk=;
 b=uAGS6CnELOpU6XAlzzaTHDoipk4QLYLE9trQrVHONlb/CLuMwRHB4D/O1SVydCks4Rl2mJXTd
 /g/SJfibj10D0/IMv3qVW0N1R6r8ze/SrE7p++wIzy+wGWphNbb2J3j
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232434_292604_96848728 
X-CRM114-Status: GOOD (  10.19  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


