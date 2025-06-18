Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A90C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=; b=Izr78MnoHCgeTXFpKGI46VY8uu
	s19jiUjJjpCnVL0ZjlbOX7THOO7mVVq3VJ2rz/NsL0iV+mG3vMwwn+YhtMcnkr1qSS05YX/OzHElf
	hFsyEDPK5KYOyXYcYBwQlcEt7q3ucm2SmN+cr5d5+s/MTewyQ4kDcwdwl+Ue4M9gIITSUlo++Jvfg
	iWkfAlUrG8bc4XHPTM8AqXWJuH+Gljpd6glQinmOT4rLbJR548IpwduWxarQpaNLbHBUScalgoS8V
	CCnztK2KUFwq6EosZIOAlDKtlcGV/gwUpsbiZIVRDYmacLqcLDkccVogJTz3HGpmlfeNI2Gwp3v+r
	RrXlPjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqBB-00000009oTE-0DHW;
	Wed, 18 Jun 2025 10:38:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpaC-00000009gcz-3DFb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso3294769a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240791; x=1750845591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=GMBEOXAn6OXvMN6cmgdXdrkgFFXI2HbQRlyBsP6DwqMlLg1X3wc7C4lKJFsbsuKgaL
         /XKEHr9ECIZo+zYEClV2WloYn9GUC/iLNARDWJBpXh2rQ/ZEATbSFm7P6dKM4Fp5f0U9
         ghq9gTmoHSqtUwbOTpwGzaHPsdy8+aIyONr08+WqyrbOcdUSIgXUZPDDCXo68KsMb8g/
         7ekxVg4SIHg132KCyDQISfl719gQ0XIg7lLNZpam5mC4RCGHZZrhBbLAVp5/vX7vKaQ6
         PH9FfdZbPmq9AUPgt77DGhiTyLM7b+6vyifYRgckTxu21L91jdkqbvn0eAYCXT4dm3gd
         5ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240791; x=1750845591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec22XHKjG+ejR8ND9PWg/+TxLajWfEjpKEPLdRkBrqE=;
        b=EOzfjdikRLqA1ALdwDfBPuuGRhTCwabFksCROSuJ4dr52YMTvn7nfQetWn2sgGDwOw
         AYOuRddyxOXNIVXj+yr/UE6QdfwudP88/1lgMp2FpVpJck1y6ehow0EO8Krd5mJILGOM
         DVPbhorJGGYZDd/AgdlmzjlSeH88L7DWJMk9jUeHuVYZPbvNovAJi+sdw/nIOCwCeAdN
         U2gr5/17VyzRbqfHAO+HHbOHmuf00N2VJ2upzzFaTJhLhil13ieVKxLicnr6icZgHNmH
         nbggauJYBEESv3p5Z/fv3nkkIJ9DOBF1R7Sjq7Ipbzpx+LSviqOIcqAEBxIr/J6jP2is
         0ouw==
X-Forwarded-Encrypted: i=1; AJvYcCU0tIAttrSO39pAh69WNBLcQyt2/fEi4KUYURd9YVFwIgtQZPn8LPHkJbtHspB7Lt7gwiYsTL21opm3hW9ar5z8@lists.infradead.org
X-Gm-Message-State: AOJu0YzBQUHXupSpibFCNdx4Y4RHCJJ37AT9W5tyDpmg/PnwUdB0/yGH
	wNOjQwq56+dFm/8xUmQnNdk/7MsKtbaunY9KQbWtcOmBlsDKJHfrtCwI
X-Gm-Gg: ASbGncu1aByxuJOGXA0uEF/owHFvlXBgcmZR4eID9bwVEkydtVkF278JtGhHknKN94T
	6xUXDHZsKSdFIWUxfsmzDL2UDI2uOOj/KeaOJRREH+p3kW7Erls6ArhYRCa+cZY9TS/GUi2oq7K
	zZh/5zOV4FJB/DfKAh/r7tF0Rm4WcmMas/tFYcxgieBuCtfJ6z8F7NWzvFCftz8+6AS3acFDuVk
	RmHQLK67ql2/TPyI8HCrj7eFdXQmniZweKVQs45hqeWQYmqtSXfk7gciZ8vJz2tqza3UnX9PhD/
	ZX4M5oUoYZ9MBYaKukEfmdVplB+GbdODlmPgL2SVTl83zwiYoLLjXy6urqIQ9BtnPFtotBErMuA
	=
X-Google-Smtp-Source: AGHT+IEwMDBbeSHpT0wB215NsckLc9ZFcIVd0MICCrwqb68KTljLkYsjJiAX5ubzR9DASWsy55435g==
X-Received: by 2002:a05:6402:26c5:b0:607:f513:4800 with SMTP id 4fb4d7f45d1cf-608d08b5dcfmr16192558a12.10.1750240791306;
        Wed, 18 Jun 2025 02:59:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:50 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 18 Jun 2025 12:58:49 +0300
Message-ID: <20250618095858.2145209-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025952_813641_EFEA5BA3 
X-CRM114-Status: GOOD (  12.16  )
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
index f53c72e5c572..1c97624833eb 100644
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
2.49.0


