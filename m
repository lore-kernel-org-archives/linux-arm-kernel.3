Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C38C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=; b=nIjZT6ZpiqUUZBeAnMUy/fiFIB
	VlP2I17olWap7oa5SLUeghjcFwYHd4AQmEixQupvgk8bpLoQudNIJfFU1Atia92LsixvRFEbfqPiH
	9xvn3UDPBNLoT4oZxGZqYjzPSD6/3s6TkExdLqofS1xp1MZhi7nhcHb0nRg1h7ufYUhVoGpPfNOOi
	8Jj4AwrxHFiz+72SiJhqvnG2PMJ4QWeBfrQHBn7TQGVnEjA98tbz+5Je52uI25UGS4bxxh4i/ee6q
	WEnWkBF/ySTGxn+vy1h8ElSnbhyLmprldwY0ZF2KI8KThjq1aQBq24K8Gp5zuXoflTa8erkME2w/a
	afpWlcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Jv-00000008ZBJ-3Vwf;
	Wed, 16 Jul 2025 20:01:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7r1-00000008Uri-381d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso32869666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694306; x=1753299106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=b84faKZjWTGm8WyMK1zT5xTvctD7hVhNhpx6pO5mfXqb6DGFp+lB8uBLm+3cmax4FQ
         FUDCUvNdcf49bbymZAA15iw7k92bu+eKYOotILv5iTIDLkv73sExi1GcsjLKAxEIDUN+
         CQsEHXXa5d9UUB2+UH38pCWj0xoqWXsYPLbBS1SYgJlS5t/ihsnkE+dQaoWgOCJthPrj
         s3gqWqZGi1K0cfNEGrQQICeSA+A/8qkwiciM/ACkjr5YCu9x8e6d/zvqvL2XqCpcGzPx
         6c6X/p6avQKcOBfByEoc1QVwa9mleiJrNKxksJyGHXXlcNYgUGtcLYwkmjrnuoFlhtK/
         rvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694306; x=1753299106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=kAo1zC/jKshSnFVa52TQogSNnUwoIK6vuhApg3YJr7TzNo5ml2/iofpFhlWZrQjrDu
         CZPA2qMpk90SpdfJsmwBfq1g2OhrIS/WZ032wk20Kt3DNKaaa+5oTM0vi+C9MLWhQ42Q
         rnQH01v4KtvfvJh7BMMribPn5RNIRAH4K9jvsls+ixTVhxfA2dGGkWlHBNacpxrvxbMP
         Z86AxE04NcyUjtKPc215wRIrU9mFB4gWHA8elZMEdtkrPDbvYj05haqv/EvQ05dTjt1Y
         lQQi0qxyvQkdaiuiAn0oKQUDRxh12gojllFq0whYJNkuLavP463SyfIm9p81g+oRglDJ
         CKAA==
X-Forwarded-Encrypted: i=1; AJvYcCVQYj1MBxRgNsr2xDZtfv1liFTifkT6aVzcUGlIlY0YHr50S0daFjb1smMxInvT/+Y4ioesgTU5qwzzmHwVq7rm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuw8hOSgpDEVSu8uGvPKnuauq6F8zDHjLclc6IMebvdPf5LTCg
	TnVUCrzONO+3ey1DyMsUsU7WUrkMEamp8HVsZx7SIxjlPX+vAUzle99k
X-Gm-Gg: ASbGnctS3AINGXLOTRGc08ku0abU/5wHRFWLQN7xJtozvX0BrjapIZkCl2e48BZqvN9
	8/4pCKgOYl5rFTFC/NSGNpESBsJ/wguOpkESR0BPylj6n8SksGZF1ShRHQXKaYYXKBFIzAu8WwP
	kBrOZC81+jR4QPCEtl2wUHCUvMTZDCj0x21qsa6GnUtE01NhuERDKxSErr9QsfHQA665gp5wg97
	TzIVh3WzSaPRiw4bVOG97i9bO9yTNDqMSRQrct/FnTS6q8sR0g0oH7/k03HAUv1qq/a73eFxXLJ
	Wq9TXFSvkDNWixfSbsDWcwoIupLGiE7P7Cq19onWXyXOXhf9I6ZXBsRoCPtBSDECwbB7uulL/9y
	Ewbzk7QbldoIx2UiCUjvUjfwFT24cgUCHR6M=
X-Google-Smtp-Source: AGHT+IFaK/OXpvsJKvME49U7HD+Bha/pUwWnsP3IoA6+d5T4dj66SFhtOG3KA8dw/D4IcnhUOjtIwg==
X-Received: by 2002:a17:907:60cf:b0:ae6:dfa0:ec12 with SMTP id a640c23a62f3a-ae9ce0f930emr389145166b.41.1752694305979;
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
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
Subject: [PATCH v6 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 16 Jul 2025 22:30:56 +0300
Message-ID: <20250716193111.942217-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123147_781718_40A0F436 
X-CRM114-Status: GOOD (  10.44  )
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
index b345305acc4c3..5dcafd46344cc 100644
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
2.50.1


