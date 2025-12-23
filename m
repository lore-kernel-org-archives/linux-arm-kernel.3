Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C3DE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=; b=hPyDL8NQLHoKJILkimWJcPznnm
	7RmgdNU/wmAjgwfUfIuOubp4+rgYuGspyCVmg+/wMlIoUjyAecnKzA6TUd/nHLFkqZDx3ZT8yG/6K
	wlDXLUHd2BZEHhcXeyj9DULzizgku9g9cJLbQjVzhRDLBkYqex2cjR0b5E5ofPUf5idtTQcY6Aj59
	YOUO6+46lzuLHpuaP7IKb6hGsG0gcRQHbJKw9yLaoN9NoShjJJx9BvK9AyEmaEn4xtLyUip2kYWvx
	4PGAULkI1c/gYxKId8eqKPfVcbE/7W4xtxEAefRRQXfE9VlhDy+yuxLo5dpmO7HXCdA//qIFowoTq
	vNPZcBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sI-0000000G33A-2aZS;
	Tue, 23 Dec 2025 20:20:54 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8sG-0000000G31C-0hZy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so5735337b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521251; x=1767126051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=sysKa6BQc+4x9ZvZkb1Mf4AQxWuDxMVpzzD0Zpeb8km+EnuYqYKRPYiiKJVJu2Ino5
         uNnZNa2hWf2FX2BZF4JFTWbBdvGLsxgyFwC6KuQcnKi6xB8NIyFOQsTteuDEyx31STMQ
         +rqCV8kEu0PuPraf5WmSrrxS5Kyomzw6WuvbdenUPp4SX3fAbYcVe9TWSvJs2UMmDymY
         y25p752ylmn5CICc7iLrUTl9B92LxPNOxn4pKb5O0KC6Re4nJ+bOlFaT4p8nMvV6418I
         aMFYy90gUqoaxmRaBzJLIrgE/2sb2KTH28IMA6dY5z7gqNZL+xMPSYT55HNeFxTFxIn6
         iXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521251; x=1767126051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=DAefL4LSnczitEQl+gz0qZbK5NhHsUb7xJl1dV9GJ+VdWw1q+s7muh3qfN0hw/o67F
         OtCjDUzPSDYKQPxa81FUzEmgostyOE13t8l7HIa8fsfqExcyLwlM5RijIA8Am90EqunL
         saGf8ofmZt/UHBqKbfaZTr5/g5KHC4q1qvP3jh2gCkD1Od+RP+iFBOdAUQIhhMXosPQE
         sfRHrnUOVajnWzlTaqetw30/Fn4TsbalKT2JmHz0weOHtVq1XkjovOnXJCDVrmyJ86bQ
         KXVV3qCBctpTtJryhF7SbHvBTzzvhchVTI/MsL8e79FRODcQmzqTekXTizxR7yVmf7Vu
         /Olg==
X-Forwarded-Encrypted: i=1; AJvYcCXGw2YtDkVf+wZm7UYhPdx0GRwgiPgkmurkZE+/7wqMaV+zNUB6jngi5cC6JaG6noJAaX6WWs7lMvwIWDkrYp8j@lists.infradead.org
X-Gm-Message-State: AOJu0YzMbbgtQErcf8T/AloRgEzg1Rq5Z8h0mic5HKRxH4yB45rgkC4K
	6z9I0BhHyfw+qfA7gJ1GSxfrWpIrVi409I5+2JtJ4dns+zcJagq85Q8mZheM7u5vgDw=
X-Gm-Gg: AY/fxX7ARrfJ1E4FqnFiQgcYSZf9N+/XsOY8nzERXPmjCLXNHacG00WXlcmaWKnTQDr
	5WJsHH1xhTNWTgxOq0YR7YkZhMriwYJyOPgMpB5pdg5766wKnx3z2kTsowHMfb/j8VYbspXmjKY
	aiW1Cw3nTWT3IzelLrHKr5w0Spiul6ow7hWLRwALPpavyD0T9OJFkENg76AzdJFtYUAr06jH4v2
	PJwhU55p0jlfu9v+avepg1VZLDIPI3WnZ5LyuvLMT6968iy/g+LjsYtyYoWFDDMMrc7jchl7u+K
	USzibfLy5kOD7u1VFdd7PqRlstWQTv5kvuw6p2YIbbr3he2m0Zju8TYs3DIclvZs4m4GZo7AWvG
	HWFZ/0YbZFleR2P6CXEO6+I814g4ds2gPqWU54IhBnbbrvg5fpQLrFvbQYIR7xmQ5B+iwpRucfb
	ZeOiyNyoO5xDntzhfP+bZoZCh8SohHE+qCI9yjQMJi8prtmB7Ge/RRAz50q2H9wtpHBWxQ9K2a1
	x+HbxdMjioLF5ISfeo=
X-Google-Smtp-Source: AGHT+IHKR6G1JkjZPbcb6JKFu1uGkQq63m4FpssJS+cOb3Ug/zNWJVDVvih5redVT4o6Tq4IHHU3Qw==
X-Received: by 2002:a05:6a20:2588:b0:366:14af:9bbf with SMTP id adf61e73a8af0-376ab2e77c7mr15535010637.73.1766521251186;
        Tue, 23 Dec 2025 12:20:51 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:50 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 08/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Tue, 23 Dec 2025 21:16:19 +0100
Message-ID: <20251223201921.1332786-9-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122052_207359_7D42C3B1 
X-CRM114-Status: UNSURE (   8.40  )
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0


