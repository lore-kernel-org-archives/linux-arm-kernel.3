Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=; b=ruzGVjQfeVB/41A8YQFToXZ4M2
	O530RwLq3YVApFtEyh6VH6jL+tK2msNn8QGgfuWZep+G7x/jNU3lgDEK66VeHHhl+jlUrDT2YXeu6
	4njWYJlWakocAx5hWrXTu/hxADS/TyXp7LLBFOX+nyszqFy1xQSk6EHY6g6Rw1m6sRIJ3wfZaJRRU
	ZA1DWqI6n8PtFfQe/lpGsUPfvNiiDdc6OeWhJvk6yayZzsxXCXtckrz+pp3v6Q5d7X+l4ivLzTGll
	2WC4QVdv9V4e9AcBcElWERbnLLwQwLA03/8UMMLfyKFsEVjNtq4jgsb0S7NIwc95v2UWcV5GoQI2+
	UZUUgo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnKG-0000000D09C-2jtR;
	Fri, 18 Jul 2025 15:48:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxj-0000000Cvoo-0fAY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:28 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1624389f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852325; x=1753457125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=L0ixrbSbukjxwJqYlAfKNziFcg4ew810rbFYu8vJx1JeWH2SFEU+tXOPEA8rk+yFqb
         IIXWEgSfGkvbdwxcoUgM0lWfDzCixH5DLBK6/7nZsOmTnw7Rd2H8rGzDi1SwQFqBkzD7
         8FCU+D8V9D6uftoLVr0NzFSEsarAy5XLft8pDHgZVPVZ4SJaCCEQy4LApE5Zq4qvNo7e
         XwyE015i06xlWi1duDOA+w3PJQiNY+Q5lC5uFZw1RpXTiiD4H9zzppM3WwK+Ec32iI/U
         ge3VtsHQXScURgteJQkYbyotrw7XTdZWz9DJ6RJMLtuv56Vszj/s+XIlNoqyK+nSo4ba
         T0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852325; x=1753457125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=el9PDmSKQ3poFmq7sVvkFmzBapfvW4pN+yU6L4Z7MTy0vcssh0uB9Bc/dskoAzw2/L
         SfFsKemvI8H3vtZFp5nqnefERMV4nrUTY038wyY7jN3ZQsjsk4UpXba2Y8AmS2LIEipS
         YmJiAWz+aojys2rXwUX8LCSbtRA3eOZNautLUN3f67PxkH/m5PIzw/w5dHsOC70892At
         g97rMSTFw48lWTTIqS7nxa1I4v0/RqKQZ31A/EQ1SRXNzgPhIgus+FxKYO15dqD00cY7
         w+VaPh5NmKOaK2x+8lXjhFTzt0TgNqB+oKOXRN+3oYivAMSjDFbN8svxMMCjCoDtSfh/
         JZZw==
X-Forwarded-Encrypted: i=1; AJvYcCXoHP/L29/zq89ZdFLfHW1HyH0BeHmMlPQxVVt43l8oJVFBhkaW6f4cKjok645Mkp/GTIBdmBGpgQ/biHs2/8AG@lists.infradead.org
X-Gm-Message-State: AOJu0YyD228hLx/vLr/OYMOsRFf86SNIe2blG7EVy/7TqimvR/t5+fo1
	RhNJYIQZ5sKc3tGS8DCSfPN78YfslJjOy9KJMLCVfjtr9iPoIfNI2boVn0g0iQ==
X-Gm-Gg: ASbGncug4BCdpFfC6vaqMyyAEZsX5GQB2nVenEikJFJEJEZCt5j53pd+PUbFoq8FD1W
	3ZNLvJjo/nPIU6sksibXXHEDqvdHo3a1wmqPVyJAqV0Vnl0PtZsmf0XZckWwIa+tQlCulqn1U9Y
	/NsF+9vI0qAHevUanpXg0JbmiSg6nhvKenDzlN/ZbxvvckD/uwTTvuS9IxVgzSuDlb5SOO3hgEn
	NtlH0y2sUxjsNdMgBfR9WoPFvijaQvGWCNrVWTETajkwbzBG5p1f6EUYxZZyEguvMJwBLPy0rmj
	0ly6kndLAr/AB0kKOLTRI06vMmXMP1YzYSh+eISiWbBrEpoHjmc9V60r5sJZAsURJymaBlzMBMy
	j6YR2TNMWFEuRqCkPuOKVPnXsavz45IQ3wzQ=
X-Google-Smtp-Source: AGHT+IE57tXda7EJpVP1rw8lpnwZGNJ2JrkTW5ITWytpCAQC/qr+BkMYkue1GB1N87LJiGAHo75/RA==
X-Received: by 2002:a05:6000:1449:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3b60dd886cdmr12074749f8f.51.1752852325423;
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Fri, 18 Jul 2025 18:24:42 +0300
Message-ID: <20250718152500.2656391-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082527_202597_E9293047 
X-CRM114-Status: GOOD (  10.82  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a5..02a44db982852 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.1


