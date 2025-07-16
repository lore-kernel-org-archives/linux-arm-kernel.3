Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D58CC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=; b=gIoBukuRjKq5A/D9JNc2/Ks+qw
	m8vFm4Yt+sh3nVKKkhrgVuYTKbuvIckL+6ZXKxoFQ4vNOzJK0yikQFw7PxzmRNcpOneeDLS2IHr/2
	x34dELiavqfAPsdE9D1ycf+GiakOokUX8eaGvvMwYP/DNoef2vYvpDYr0mKjN/8zu1AIIVJyaSS1N
	o8z6SvJUFeBFYLTfvHrTAPn6QazqTMO+ZIvz0a+fgR3UjJ/8dOKH1vlHtxPuwQR+NsdUQO1wiQcT/
	kfdLJ9wekXZHrZm5BZZAPumB6ntjKsmlgQJjycXikpVdG3U0l3HTTfn//Rr8nGFyRVoFIi3o2Rn1D
	2YeTPW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Ol-00000008Zb0-1Qvz;
	Wed, 16 Jul 2025 20:06:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7r6-00000008Uu2-21ku
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:53 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so35766566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694311; x=1753299111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=igH5q/7iUiZxC2IURc5p0avONsYh9PaOnwTEC6mAhIhB2xyjQjBb0F4FqrsleK/PnN
         zCKb7NluH7znzsVu6OuTxWT3fL3xoZ75dawoiko3aTMie2SrqsxevmRaJ2wbCaeFL8SO
         iCuE42lbirJhFTmlAhPctL/WKT9gQaakS6OnL5gw9ylE8Q5qcoYHUj0aCj45hqism7mY
         mxA1AzcNPF8STD9C9ILjJY7wfJEHDINIdmP6ZMuoYeo9S7CVUa17yxUQzT9bB85DEFCp
         fHVTUg2WrcfW/hE2fdsM0O1fbX/YC+4zIWr1IMkrlH31zCPqR1W00G/7sp2xoScZigsc
         PIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694311; x=1753299111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=cTbu+AMACM/vQ3bvOXQONTLhfOxdFWLMBTGYRMpc6vQfb+H0g95tQZNVpFaTHrZt1x
         GNP75kYcbYq+T7NAwPswM/D7mPOB4fPBElIALQgqntWT5BL0d5nVaY/ncqmtke5ZZS5/
         LB317/8uk3CeZutdyk66kuUdH5zkB7s5x97afNr1KMX295I/rA97hgySFHUxm39d5Hoq
         n/kJ/gxEzGUxeEAWkXm6qsq+WUovNzth64b/f+qp1VtapdxggaLgSNxYnMyaUPULByLg
         eEzLsS91CzkctkHXY3FuePk6EXQDGKf+grj7LjnmUPJXGNGVJyCSS4KqNhHMXJcqX+Nm
         XeOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ13/OTpaN8tCw7+BWCScq9CWcZqobrG7Z2oLQKEQyo40+pH1E1wNFVBj3UKQtPEZdmRUSTDAkmEYmSYYEiH4L@lists.infradead.org
X-Gm-Message-State: AOJu0YzvlFada/SSGZg2s7gns9r3ec6WSj1K5CLzGJA/jLUECl7Vk1jO
	HIcX4ta8E2OlgAQ2FxNLQlk59+1NDc0qrYq7D7gW58athE73B+MI57Pz
X-Gm-Gg: ASbGncvMDHU1pLw1nN3tFTZ1mP7BYhsV/H9pVZKxcAz7ulsoAPiBoEHOibHsMtZm/mM
	LUFpew+E5uiOWBMnDQ9Ay1XYvySXct4nqnGC5evCwz4LMWbeQkx28jqmqzaDR35rCYBjk+0hVfI
	qXP9oZ13hfHvuW6+5heOXGtW3itaY2Umm30H90mwq345NIH/AeZSGjuN7wvkMdHg5tUjCdyp5pn
	3hZjizbQmcF9oniZg9jvjcKnWV7x/1bdT+8AOf6Yg+dNhLbpSmpIgU8vhptRTCvW7cihRHDa7GA
	EsJvFyfxDS/me7gKEwdsDGHjXzh6Jqxy1dLhGgjFB+Yfup9Q7xHL2L/d2s/9i83tj7CEU7ZIqQP
	EAL33y5SwSG3LVF7rhXqt6MAZ1EsiN7KHuXU=
X-Google-Smtp-Source: AGHT+IHD/AwWxhtp/H4zB8WMrDAL/c1Jp0cZ6659LBasVTEyBTwEa2yNp3U+zRNJMI5sOrDoJGRF4A==
X-Received: by 2002:a17:907:d40e:b0:ade:c108:c5bf with SMTP id a640c23a62f3a-ae9ce10ca5amr316243266b.43.1752694310837;
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
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
Subject: [PATCH v6 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 16 Jul 2025 22:30:58 +0300
Message-ID: <20250716193111.942217-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123152_520455_836948A6 
X-CRM114-Status: GOOD (  12.41  )
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.1


