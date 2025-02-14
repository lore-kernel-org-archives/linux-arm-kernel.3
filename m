Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB673C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=siVlNf7+kZiCwEjKhe9SG338WyTZGu1DUBJ8nqaHKqg=; b=dtlUUmlhGybM9fCEPZ4C3PFK0c
	KwMpIdhk7MKdjRQZOyxyQKDQ8Ty+7MFAYa56yc8WfxyPMEluQa59iulnvUmhl+o4oYWfVl2JhTOHL
	mOy47mHYgqDsNEPAjL6aSdWvPmqlBwQJxSc5oBXuOPF1UOXMRKPU5H2d3XN5h9qe9FVzea9pSeskM
	eBz2MuK5H2M46PT7GIT+APV+ekQtVaOrtu6Z1t84CsRMHPKmlUgI6SmvOqML/GsWbkwXSnM3B3jS9
	n5Ez4JX0F49rZI4AglmZyeGZFmlgSeHFO8wVMrWiIQO2LTbnsyspSpfsfE0Sn4PFpcJEsPbANZqEk
	8bs15cmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinQD-0000000Dc37-3Zfs;
	Fri, 14 Feb 2025 04:35:25 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinOn-0000000DblR-3bFK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:33:59 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso550167241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739507636; x=1740112436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siVlNf7+kZiCwEjKhe9SG338WyTZGu1DUBJ8nqaHKqg=;
        b=lGlnZ9SObE2KMHves9uDsOqYRZMCtfhBadbC1+vgo2tlY5XhGp5SXrku5V9oj5MAwE
         8CGN4LG+0lxLayca/hA7B7ehdU2+0eEDVTv2BrXlzhX9QZjBH/3B1VY4TtUkcCYJkgi8
         bRKllZ3UAStL11QGA5jlbK7QKRiOpxm+POLtZOLJ60BKJVv+SJd5F1hwqtKdvaL/UuEJ
         w6QZ2SEIxkDd4OGLCxBpb57OYTF6nb5h87yVl0c5W1f38cnKGdyN1Dv5qFz/edRh6X3s
         zzPZw3tE0FvHyWZjleaEATa4Uo48dxlkNhWvudty6vavxIv2XVe4FyFDoKesaKt+f2yW
         Y7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739507636; x=1740112436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siVlNf7+kZiCwEjKhe9SG338WyTZGu1DUBJ8nqaHKqg=;
        b=q4wogryJf27Q3jFzezAg/9q7busVBOYCmPX47Vdf/lw/FC5xFIV4SO9Y6Y+kXT58ZE
         KnTaStMcV5jDO3Pf3DeAV1nMXFCqwkYAYrc04JH7EkIpbo9ZUge+SjeGVruYqrEa+48W
         7p/PSzGVRvNfp2HT0u+SIaKTCzlaMVK41CL2i4GDeYtedb6SXYglp9OnWC9R0cxz/4Sq
         I8wyZxns2ASjtdbjJpZarfNBk0B7BzCrvc1oSk8hR09+b0S0N9Zyfv+UBvZMYAuzlPCD
         6CttA0qMTHoDXyvFa30LpRQu2uFzF/Dx/381bo6T85ajdNqHg/vkxYaPv2osAbvKxc03
         ONcA==
X-Forwarded-Encrypted: i=1; AJvYcCU1kTMsGjsD7e2kwxsFhWgDLcau3SkfvPilf7MDa4gAACJruwbckpigtQRKBlF43VtVacre3ijNE4l209e4oeeq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vCoPWewt1QUqU0ndBVEdr5t8LiONUJjlWhEwm/aF6f2rUaWM
	/7Jscb5kzNhuu6lKT3FwQo1uTE4gVwH9exc4aFynhoFj2GC9tHDy
X-Gm-Gg: ASbGncv3uUWlgOFth32QFohWUkxJPKDO9a6hLa9gS1NErN8IOH1jLS/1ZECvFnj0M4b
	1RBEc3EWJ2Nlt84RUwPUh0jkBjLTxIEbYxEb3TlXfJEG8IGKa2ToyMMyT4wHDA+a9pWmjyhD9hm
	rCENhe7rFUtZncJ4txZ/eiizlUz0/1gEC6J4rIWhtRx/Yt4Qc5FmHfD/Yod4qbhplbk5Fv9XCH+
	EfubRlrIaZdIJSoK3+Lkf6Wvs3htNDKeNzyMLHJPHGbuU5HkX+iRur4OHd2naVRRNGscMoF1TK3
	weajRNzSDy8k4bynrhgT60qjvGImZ9z3GbhUGkTUf1ShRPP7JYagozbmbpsvsXeXEInsBR9bwek
	m2Q==
X-Google-Smtp-Source: AGHT+IF7RYcNLcFYj2hbuk8eDkpTmpno/O0WPJ6Z+8th4nlcCQC4glGWXBaW+GS0fZag6OAbmKZLlw==
X-Received: by 2002:a05:6102:3f11:b0:4bb:c5ad:af1a with SMTP id ada2fe7eead31-4bc04fba69dmr3988014137.7.1739507636407;
        Thu, 13 Feb 2025 20:33:56 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e857f2desm422800241.10.2025.02.13.20.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:33:55 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/3] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Fri, 14 Feb 2025 04:33:40 +0000
Message-Id: <20250214043343.263-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_203357_898259_FC52398F 
X-CRM114-Status: GOOD (  13.84  )
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

Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
configuration port.

The difference from other new port configuration data is that fifo_depth
is only specified in fifo-depth in DT.

Exynos 990 data for SPI:
- The depth of the FIFO is not the same size on all nodes.
  A depth of 64 bytes is used on most nodes,
  while a depth of 256 bytes is used on 3 specific nodes (SPI 8/9/10).
- The Exynos 990 only allows access to 32-bit registers.
  If access is attempted with a different size, an error interrupt
  is generated. Therefore, it is necessary to perform write accesses to
  registers in 32-bit blocks.

Changes in v2:
- Added a default "fifo_depth = 64" to prevent crashes when "fifo-depth"
  is missing in the device tree (avoids divide-by-zero issues).
- No other functional changes.

Changes in v3:
- Reordered fifo_depth handling in s3c64xx_spi_probe() so that the DT
  property takes precedence over the default value in port_config.
  This allows node-specific FIFO depths to be applied correctly while
  preserving a fallback.

Denzeel Oliva (3):
  spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
  spi: s3c64xx: prioritize fifo-depth from DT over port_config
  spi: s3c64xx: add support exynos990-spi to new port config data

 .../devicetree/bindings/spi/samsung,spi.yaml  |  1 +
 drivers/spi/spi-s3c64xx.c                     | 29 +++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.48.1


