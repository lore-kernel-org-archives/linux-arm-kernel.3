Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B4D41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3+In9zGTnNVCdfWyUqUmvhLH5cDZ41X5IQo0vghvEY=; b=1ryrHuLDYw3hmVhn31+VtE4qbe
	GOujtvo3qNcjFsHCJdaonUQ2Q0wxmAy8PUypTcc4eS7hho/9OmrTDX1sCqKIqITDqaybgTaAWwgEy
	iBJ+wLge+m9DDg4vvdheJmHMZJisF/WsbzFdiRon+rk7Be0cn/aCtyev6eXjeKTDvlW46NHYesM8s
	QPZ/QhD0DOK6MV4359G9LFRrXg30kk7Y6z9SXaQOPJ/RImVe83YbZYfmNNaKtc5OpNhXRvemlwpUk
	Yiuj2ldML70WOc8dOfmRekP+/OT8bOActKKOdLLYRzoJXuhV7gUItMDFVvHMQbybJiWRwhhwxDOXk
	odXSY/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLik-0000000CF8U-0eGa;
	Thu, 15 Jan 2026 11:40:58 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLih-0000000CF7Q-0W2q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:40:56 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1233b953bebso1971305c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477254; x=1769082054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3+In9zGTnNVCdfWyUqUmvhLH5cDZ41X5IQo0vghvEY=;
        b=Li5YsyZeE47FwPX7nEUW6XQ4S+C5r/RdmZTuc50rMJCsESDO9VW7tSMKvQ2r75fURM
         EN6I+DvsZEz1TnorQpV2gIxUAhuX4GrubWE/EoVLomHo5cKPLuSpQbx3zkd7EgOu+7hz
         RGRG0lR8VBW8uG/5pHMjtBO6cXykIjdWst5SoiM2NNaXOndCVES4CnR4VZa7SxPBPRIv
         B+Rewhlrleq89JkFGRqKJse2YBZfK8OsW2LKyRIF9TH/ubo7EcLkf+iAIS5mbhO6eLnA
         tKGJ+alEhbA44OBBS/Ul95jGGqzJM6xFAgbz8XzP9Qjz5+6ocabo9euNX69Ry2RAEy6S
         gYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477254; x=1769082054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3+In9zGTnNVCdfWyUqUmvhLH5cDZ41X5IQo0vghvEY=;
        b=aERmWU/8UKF+gzy4V8phSC/L7mlKN1WrA8tgCmKFLnFF7PSDt0AznVU7PIdherQyMv
         9TAs2K7RnvqoOW+WT9aA2wLOJNQH6gr7jX3Ieg6ewISBsTrVMHVswJ7hH61ma6qaF4nr
         2IZXzX5L3Kz+OnYUgkSlXVjZYKUuHyUXpcJ3FREBpKnq7/w32ChD9HtgEcTBPE1YJQ8x
         u7gpoOiJ99KmcbXa/cLTUB9AtbXbeagA3glzCommeqRaiUypLsFaanFO2M8ruNp+zm7+
         nhK8xkNETj1tEvQos96Ou94EXJhOcOoJJ//gNtXuRU7NzunV/dVaBfJvyfr+K7BSq0mz
         pCYw==
X-Forwarded-Encrypted: i=1; AJvYcCVVyOx5w3NE9NBVCAJtTthi8AiJ3TSKAy7ijxld5TUJzYCFsOEfHmNXJwisRYUi0bAylVnkBj8jksVLEZNm/W9j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5AlGEoVVdzmp4p2aonk/gk2qFlcgXkuDa+WA9s4/H0LjOycWX
	Gjt8C/rxg1006uea0KjDXm21sUGR9GE592ZU7jYQ0vuJsEkGdRK9euAjXwkx0udjpIU=
X-Gm-Gg: AY/fxX57FBqDVLa29rn4TObtfDKZwyo0+JYVOekGZ2Hb+AYPWXDB9AO692dx9oGv1wu
	DxWIFbwvUoCq7nXkDuMIIxqnQmpC3GtgM80b9ONayvuZheALibHUQnL7zFToix2wXnsPZZwtPap
	px4yWUq1dl4rBpu60mele24X9Vk306Fa8455xKf8MNpldcpGPsQthgzhQlvBABVyDixFoSd0l/E
	JCKblkclDYOLXQ1SHaBr4DLnqlu+bc6NNXEbrG+Bonyn0b07XMFHYXuwMl1cFjuRzS5jptY6wSJ
	Yv2n36T9RODa8WUu1MDUojfNoPtxkJ3FmyfvbG++XpUMSYm1GZ9mH3uNraqlIJohIpRSYmApP3l
	IRPh8HXdy96ftAMyrix+pI1m/5lJBRm+GP9XCyRxK8GJUy7dxYzjgNhFALx2VqhmDtQt6sH6XP+
	UHCjaJsNJi5uw4DDk2D+jpWkdhHCtCODM7UlVf7DSJR5mj1bMNf2t1nGKTRyTVsj4jz1ceb9XfK
	UZhYyih
X-Received: by 2002:a05:701b:2715:b0:123:3461:99be with SMTP id a92af1059eb24-12336a38feemr6811395c88.21.1768477254152;
        Thu, 15 Jan 2026 03:40:54 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:40:53 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 02/11] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Thu, 15 Jan 2026 12:37:27 +0100
Message-ID: <20260115114021.111324-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034055_179626_57DDDD98 
X-CRM114-Status: UNSURE (   8.32  )
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.52.0


