Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72244EE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgXGBSZoBFQqX1EttjH60dA2QMgCjVJpHFXppYJ+DT0=; b=TqLsEyJlP+/ZCaiYnssUsX6M0Q
	tYWg2gNQ6fO29SCNjuOXdWwW4W80iQ73tYMCdN8nIobdd0v4NA3OnPEeThcUftzoQxdJzuJJy4COF
	RzisVOBp8ksTSromY+GLnCeIwMFV7YU2Ieq3f1p9SzEmacUXKjJ3ko/CANwUWbibqyuZQEpQ+vdzl
	VFjIQOnByZJpgJQ/Q72L92HqBhVa58gvjK+yy/8z7g6TXPf7capRl8QsxDBk6FZdvuzmoc8mE7LWV
	PwakDhNEfH6orTMKoPzlll/XQzxwZmovGn6QALEKnBsKJ6AGKDOFjzijD4+pSnPOhxTuJ8mlhOMA+
	4iWT60nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKw-0000000Bf76-4B7u;
	Fri, 06 Feb 2026 18:13:47 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKt-0000000Bf0D-1LmV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:45 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1233c155a42so3203837c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401623; x=1771006423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgXGBSZoBFQqX1EttjH60dA2QMgCjVJpHFXppYJ+DT0=;
        b=QYHDkZB1tGT68fXm/AnZV1ATCrrRLQJHjX77hkIT9DM0s0JeJRJJZX5Grf17hG8iND
         ZUR+wQt1mdVM7T6+oMgCYCbANa6QGfXskE8lnY/slFRuB4L65/Ki9sHM2zyvWAV6jcxL
         wxAgaNUOToGMn+CCe+53il5j6i4lEUAzticRgYA408laelRKaDgZCiFOXRhqA74LlEi8
         hn7lTsask0ixH2184VT+lRGAohXyiilAZAKSkHE3Jtflb0+3fZ8uCULlZX3B3kBHBp0C
         uIg6PLdUQj/1uVDb3Q+TV6xMuB1kjVF7sg9o4RbiK4TgGxPt+OGqNrIhaeuX1r9fJKvQ
         +AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401623; x=1771006423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tgXGBSZoBFQqX1EttjH60dA2QMgCjVJpHFXppYJ+DT0=;
        b=fyq4KYmmGehEogKVqKC/FK+9CVLqjehPqG3Kb3EUh0rRCbQeo64qee5MDZ3ob7yV/1
         3MSSBEaKFZeTrxVJVsK3PN6os3O+2fZz5/Z8DaJzR+kUTvp6eU1n3i2RabaRV30/qPbx
         xkT0E/aEPDc+gtzevvZ2rue4BfXl1tbOPH+iTN1nLNN6N0HyY+H76icnenLRHTtDW33f
         IoJ0cG0RB+FEga0clxuJUx6jJsvbf/DBbm/lpd54g90vlS5G2VS+IIN9zArq0GG/+7+h
         B8iRPvY8SZaWxELUNcF7y8JxlQFxZT4EHtyT+5+u8cSzJgOvZf1QHzMxoTWUD4KqPI/E
         7tlw==
X-Forwarded-Encrypted: i=1; AJvYcCUPUonluK9hkKKU0Lb0XpQlLE4dlU373+KNdrLdTG5Weu1/EBrscsOhfVlN20ECSSsdCy4vmieN8Nq03Hob+A/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+JzKCTUkHURL7rZ6h9Fzfp0VYHZVyi66EXsp48sdGwuMBOexE
	7+m9M1ChJT23xrM3W/i6waxX+aTgOJgsJsSpkH0UpMZ+W2K/U3uLeX3m
X-Gm-Gg: AZuq6aLUXD0JJh17si6H9tkbR1238gJ9qBh5hQfveWof1kGQLDxXdI4265s1fmYdlcx
	ZY27AOPImjNAyB2XomytJ2fK41V79oCDkJX3Ynirr06MM83ixM6b0aFRhmK1Mum8JrBRVrXwl5M
	rjpUYc0T16rbx8W9P7YZd5Gh5WAFyUIxVoXfw4MDmpjHyK4ruGlj/01DUXNfcFn6J4kuFnTlWEe
	019VuRB2Q5Uue+uQao+i2g3m1sv06TyEp0UOInUi8kzzq89wiThW8MjJYPnqaIOqcIg864+q5JF
	CjAlHzZCieCKDLquOxTzK3rWTcvoi1Pkt9SXNRAOGpf8GUKcg/7uCIo41KmgGLKve6KKyE9fe+n
	DV7Nc+cxuyJDRuLEhbOPRCs5BAU3ySfr/Dp6w6KVuP+amQAzAVenYXcw9lLf+M9vdhvkYL030KY
	SsTHqttZR+AHnsPT8fode9n6h4QQIRVQ0SWJY=
X-Received: by 2002:a05:7022:49a:b0:119:e56b:98b9 with SMTP id a92af1059eb24-12704048c3bmr1984751c88.32.1770401622642;
        Fri, 06 Feb 2026 10:13:42 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:42 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH 07/11] dt-bindings: serial: snps-dw-apb-uart: Add support for RV1103B
Date: Fri,  6 Feb 2026 15:13:05 -0300
Message-Id: <20260206181309.2696095-8-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101343_420848_155F1898 
X-CRM114-Status: GOOD (  11.42  )
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

From: Fabio Estevam <festevam@nabladev.com>

The UART used in the RV1103B SoC is still the same dw-apb-uart compatible
type as on the SoCs that came before, so add the RV1103B to the list
of variants.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 6efe43089a74..685c1eceb782 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -71,6 +71,7 @@ properties:
               - rockchip,rk3568-uart
               - rockchip,rk3576-uart
               - rockchip,rk3588-uart
+              - rockchip,rv1103b-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
               - sophgo,sg2044-uart
-- 
2.34.1


