Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D456C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=; b=TipeUIwjd8YC1sVzd7xbGXxLZ9
	9jyszlqyCDxlXNRdBhJ2y+zqFfY+vhlsrSHk8TyPTbHhmFHxN+TIXDnJnhPsLAq0g/W5BMLLZOaQK
	/rD2RL9L5t1BG6D0ByTlRrjEFqPMAzwnQcek1hzCi5Z8p2SflPWsxdEX2oHoDP7sEiGI48wB4VF0q
	u5Nn8q8Hr9bpGoXunFz0FABuNEODdEAjWcj3kG3mO+/URDB2oBehwT+HUQC7+/GVFUv2b5T8NDC61
	vwGNkPoeJt4HzsbjLlsZ2cuBh1x/0tpAz/4WzVqFW2nitr2hiSh+ggoql9uYrMbN6RqDa2lXe4WQW
	mfoCFpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxz6-00000008YRM-39Nx;
	Wed, 02 Jul 2025 13:58:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPB-00000008QwN-3ovb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=; b=luI0bqM7xrhCZhkpMFUqfdprNy
	cHFzKIjohHgzxGA5ZbEpGPixynZfgk3Ov+G5LDJ3vAl6wDPOv8G49jN0akjKDAHDABxcNha1DQsex
	t22n8A8EyTDdAdBRYhLZPAc+G6gz86bvYw5usDFk40kZGIpExliedijkxRfdhFaY/Lc5vsGTxE/KZ
	FZ6uLIhyH3WIYby5X130WT1/IL2SXXDg1nS25PgFfyrpw8gtgRqTa7x/qL9QEmj1mOjMvdD/5rpC+
	FBQ15ZdAWBXPvIwgtPLvMUmENuzdv+MVg035RLHAB/oY51AQUwCWcep+eRs5oHKeqdi4jQHHYcvrP
	HV/oeirg==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP7-00000007PGb-2weR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1535578766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462496; x=1752067296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=OcHzIsx7Yox37P/q5GyhhOMT7li/KIWOqdUJQe7hlPAb+UYwh2BGp+bgqNGdJ6stCa
         j2UpSl+XSCltq9eZGsh6tr0wLXZmt0kURyH8b+NvHf25Bem4xkpj6cTl89N5bst6Eo3C
         HloTTOYzDmDqn7KBiNY3RMbXPchkg54AwyYQWYpGkjOofXfDG5INMzV7/WZjlFQCbuBo
         P8Z+0Q9l0+mjm3S9gnn3sGfpMynAT0uGLvuz2QcAlKi9tPi0Fg43Zi3xfbGurQKb/65y
         koWXMhz8rF6GNUXXT8r7sA4xBgK87BcxR/xYrZVoQtvHsyq2/ZrWKLUnUn3k2XnZnXF8
         s/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462496; x=1752067296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=V2OBaHFtllClZslx8ZBH7/PX474HrspZmQfvEPAeGM+8xhp71NzJrVdIVDDWeUWywy
         UqU61i3pSU/mjG342UArkchhaqWo+baiJ5mwl28LJyeWOs+5oJMahHNc20YgJg0dWKPu
         XYbJv0qaNpOQHDD9uZdB870J23HsKeMDKjAV+MtbyD3hqpvm1EDQD5xLPtcKAu84lIcY
         OQ+zhYsbsyMPc+HPPfpAjURNOS3I6Rfgdurzhyy6++UgTszmBBD8JVlwX3DXyIfPDZTs
         RuRfMBUET6pfV3t+ObdXq7SV2+U8odFFhqbn1Yxcr9w1KKtk90bIX2oaSrprnawou6mF
         hzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS8UpyTJ7WxA/liRd6BQsqUeWE4yYHncHBcW2Y3V2hD9w7Av0yWbZns6uAvUTkm8YoygSzFd/8C+UeMYqBURZT@lists.infradead.org
X-Gm-Message-State: AOJu0YzN0Z7fXa5FB2tMFyPQ3MyEr/wRqgo9ccyj9veBSBzYt/4QknzX
	9t6ePCckd+eTqfdkPd1EMgjY4D2kU7KqTTn4uAVF13jtZwKuyp7yF+DM
X-Gm-Gg: ASbGnctVYgxwTpB9aKqP40Tdh/CIV8HwmoFRBa0fXrK36zsdYwiLyVVeRXoIuTCCrVY
	IXnUD3o7fVQSSAg2nWfFCM3vp49Oxza7yimbBK1BXleuE/yaY3E8GGNRsyccsSvjTB2G20NtArt
	MZ3lbiYKSwKq0n3xUzldemTTEygbd4ymqPXVrxssc+kyRaqjjw64d5v6vedinggzHyd2AEQaeFK
	6lAkamrK7cOvwyHkI7llXgpgbQdVczvl4hgzMoDPIkRHxXh/x8BdBydcfmOhVH7dibZGKexYc5Z
	ZJPU2QqpzdVyVf0kJsZslSGXaoqYC6DuGUUIY17i03M9oNogQiy4EfShLYBM/jyCZwofNefpFlE
	=
X-Google-Smtp-Source: AGHT+IETdXmWWO8BsapYdgRGQMH68L3eMnzhyeMCs3h5X0X+TL6jJaRfOlE9/LRKrYaPCn1JnQs1mA==
X-Received: by 2002:a17:907:d643:b0:ae0:bf99:6c5d with SMTP id a640c23a62f3a-ae3c3c55d50mr229980066b.26.1751462495739;
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed,  2 Jul 2025 16:20:37 +0300
Message-ID: <20250702132104.1537926-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142137_839371_5D9909CC 
X-CRM114-Status: GOOD (  11.12  )
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.0


