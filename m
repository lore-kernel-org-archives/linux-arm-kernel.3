Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE11CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=; b=ioU6cu9Phr7YemCUzO0pAFyHz0
	UmqcpaNO4rAaueB5lBD0T9uf6hYN8YG+hy1Tx8aoBfOJY1F3yXBi0Edo6HNZK8pRaX27Q+jDSCfub
	hZ4VGXiOyWPBwZeE2HzehhggqzbZaQrPkWnGdXhd+dX2pYWAuz1BX7qmECDa4ZcswD76wnIDc1g/a
	Fu0zHYreVFljx21wUG7RUd5Sa8A5PBjtGPpZm71X4eCN0opE8o0PRTYJpef65mnJ4onJINTEaNbmp
	ETGMw/f/QoIaHbayaNArSrnRhw5GEuqYS54AzFEcXspqSZE3R4yWMF0/8gR8WWPy/m4zJfEUf9c1+
	eh0LC8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS6D-0000000AimG-17RF;
	Sat, 25 Oct 2025 00:25:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS69-0000000AijY-1DkH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:25:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27eec33b737so37919835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351932; x=1761956732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=gmISQot7INWFhYFJdKz+kUHs21eSnvVoXLyhq4EITCG6cJCMPrzzHY+kXv+YpPjWKp
         Pnh2AvUezD56+Ex5rT357wDm9F0iy177QjuCzTcBayvlguxqjha1O46Y4UEMbLLdLs6X
         2xnlgANJ67w1kkUoEe1/ON0OZXyp8fpwOUGJwGfeguDOzmk3YTVVpmVdze5uASyYlBg7
         ozlb+TfOyF5eTMT4KMWs4MfIm+as9SdGA9f8qMucyHBF+ApNxbhioHUs+pn0a10CDUGZ
         K2ofXlciHdgn+GX4/9k4rSw74D244QktWKUyaGRMxa/4Qp2L5nQRUzkVnJk/pMEo4SOK
         iADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351932; x=1761956732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=LdHaCPXkfWNPhJ1ZwXE8bNztk6QjIS/BU0/+9geS18HGbDE+2BOxJrpR6SaU8ALzOz
         Eer6g9TzNZgWcTGTUAjwuZ4f9xNrWDh8pNMomQlupzM/JGEy498alAd/I93hcskrv19d
         O8Hd/4MoK/6iGJnzHzuIQgnnWUyfCMwTR2dcdQ+gWzfmX6anC5HPJj97ljvLRFW48pdm
         Km0F//Kv7pNkfbiEHb9pp5pb+9N0X36YPoAp9+C8cVaGqgOP2Xny1I3fGMkMgxBuIhIA
         zpAJcWzUp8FKNJylq2z52MczBZ1vK4g2AwZfTjl0pNiZOt6l5hisDK3vatV42POPxky5
         FzLg==
X-Forwarded-Encrypted: i=1; AJvYcCUPoiwwUydL3vBxLwZ2HVaSsTP0U8csQKoPwSinuvqfTjzqN+OyNVANh3iYLft4kM0rKJQqxvCOSoh6JfAAeEgw@lists.infradead.org
X-Gm-Message-State: AOJu0YwteSlsiAcBwm7GwE1rYyqcHnX5hOKcmAxp9tbwaA4O3PkIoYFN
	87a4nhbthaRqjahmU1qllcngOy7yGS+9OWMpdtMf5FSJl0K4ctJOBCpu
X-Gm-Gg: ASbGncvWQZh9pN51ytQ2xvFYRXZfcde+94LENMVtr17kkQDTX13NcFYpSZ8Q+ty8zio
	L2udVt+ZN0o0KxcxF/LMxTPOHu85laJsfwut1EN2BGc78s//PT/bXBrhz0I6FurGkZPkUrS/q7M
	REW+cSEgk0FTprCbe28hCd14Eqg6FKSnhpNdcy6pGb/2BkjoKDKfephnvl1Qk+wrApNzVHdIqs5
	pDnuxej+8CZ+J+DkvcIcqJ6aR6Wq3w2bCIGTfONxd/S8HiNJcXECNNX0Ap+wtf/0lK8xylShqc6
	L1Y7oxGAeOqpJjKo+dEOEvtDDfGTw3uorRF+6r0ztlrAsVv+XzBpHgeOid1uvmhIyrBViGG4bcN
	ETbX4U3Yg0D2TkaOjTLckBjC9BQ9Ph9i8gVbjRJXPAPujxl/cDik2+OjxLqy/6o6kTprpdc5bTi
	8Z2ZKcpGMdoLALXlteW9x0OrW1iR2AXCjfV7pg5jo81Cupw82c3wDHgEGBUqQ+JWvFrj3tjo2UB
	J4ddXevGIVCRtrt+DjM/yFVPYo9XF0Zv2cmvGH113d1ywBY8vsY4w==
X-Google-Smtp-Source: AGHT+IEmYwFaqV8z42kKVpm+csA5lgwwLVTZWeE7isuCiwv14jZl51eAVuMpwZ1A5qrZNvfHQofXdg==
X-Received: by 2002:a17:902:ce81:b0:294:918e:d230 with SMTP id d9443c01a7336-294918ed5edmr33375155ad.56.1761351932492;
        Fri, 24 Oct 2025 17:25:32 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:36 +1000
Subject: [PATCH v4 05/11] mfd: macsmc: Add new __SMC_KEY macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-5-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7uT5j/5uLhmIJrXj0R4mce1dxacTk7SWbXtmDFt
 k1TQ7V0OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNddpvhf8lXBsaJthzWLl7P+442dhqmB2rFujvXrvAzjZq0s8yAn5FhY5v2Wqd
 9hjPq9/XOutZTeMc+OfwDH1vU9kDLgg1Mbzh4AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172534_877445_B8E71AE0 
X-CRM114-Status: GOOD (  10.33  )
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

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0


