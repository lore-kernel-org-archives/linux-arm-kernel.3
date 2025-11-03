Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F4DCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF3tE7PvrhPTALHjWZmN+099uKS6CXrFf6F9PXA5mFA=; b=GwcjdjnoIbwd0G2+MHzDbribUc
	ibRAwI0L0da0SM+OWj8lEwRLrLS8pYln7xZ1jJybTI9xwO7r/L6m7K9a1/j6x0I/Sa5Oozm2qexdC
	10h3GEjjoyGeL/Fu8uQN3G4jFXXki+mAR4O+HgJJ2juIH7iMl1QOX5y96Nv2iXXdbum72mF3Vc8bd
	LGBmFwiQVZkW6B9J6hHyh1vBzJicVgl0PGyaH9LCd15vOwCdrz1ETKwnyZBmJT+IgJ+34pciGkIoV
	797G+2xreKRtsb/+P4B8y3FDcnZG6boPbelBSRYdVHuYwcogiqRF5WFRve1DJcpJx6xT/Cw9X2UCB
	egNwxplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqwp-00000009WDs-0epJ;
	Mon, 03 Nov 2025 09:33:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqwn-00000009WD5-1W8e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:33:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b98e6ff9071so741244a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762162436; x=1762767236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jF3tE7PvrhPTALHjWZmN+099uKS6CXrFf6F9PXA5mFA=;
        b=FQHwdeV5xmBmxivt5tBse4+XuvfDmeFwjA6d7IOtPXjP2Tt8C5/XbIEvx2h2mnLPU9
         5sIrauVxcDPmAqsfAxJcFAerqbLCYsz6HV5gyUMsAG3IcmNvONdAnW6sI9EJfqAAvYrM
         h6gML302DdOl5ZyBdYJtcQOF/S/ENoxyZCgIumXqmmH6p/ow2QzKnssXFLLfDzN/S2Z/
         L+b05EaicmSyMRyYV9pbwbMUMXCeBAPer2uu0TYNP9Yb3l0tiC+qCCwzILpiFgekiyd+
         kLoDUdArigr3INoEKgzyxOvOvalmqusBgTA65peYWoQ5KEMw6T+8GpRY5tT3AiDzmUeY
         lh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162436; x=1762767236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF3tE7PvrhPTALHjWZmN+099uKS6CXrFf6F9PXA5mFA=;
        b=czVggHvEqWXRd2vhvc/tcdNngyd7R0UHWJEchvHAgJOrMFjxzPn3PXnaP2KXVTZRNQ
         y2R56xOwzrwaZ2DVzl7lpBiOCdlcNxTJZPdy6x7lDl1wFxT+V3f7hyMh3aOFa0Vyg4UQ
         fmB7Mi3pt992fnKfd66ePqtXA/ktuL/68GjeTPbFTG8AwpOoJqfvdOxxtmuXU4Uixu+T
         uS7IFZWVhWlJEFZ1bNch79IX7OgMXqXnnjPYejWUons/40cIUh2pA0/w5bZCF0uksskd
         mZNHqQeo1JIwc49dHbftcyEu3gWDx0YCawmhh3ErRbmv++7j/hpWHw4lY5XtFrvnpXPT
         Xxrw==
X-Forwarded-Encrypted: i=1; AJvYcCU2haeyZ/bI1Sp47m+LgB+Z8WvIc9bJdy+LayP7LtsM3Dqf0iVW7rW0BPQwQV9kALnk1I3T6LS7IOuzZfn5XNH8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd+UkRZP3MoIcqgg7B4a6addK3Du9iex0yFRC22/kNFP7Dq304
	MaXc/5qVbhzXlB2L8EtYYtbK5r0KpC6in8qjL0mz2TQlbYPG1NxrAAqV
X-Gm-Gg: ASbGncvtLJGdSCIsu5eyHxzyupXKDdh0ilBp3ZLS3WRiuQumJU5Q/G1tNSQ2we6Re4T
	BPP012DJ/i9loqSEiv/y5mAiXqIwIjx9bDXx8IsP5YARv2gaRDaY3NjWpBC8WP+D4zI60m/hfmT
	tFU/R+jqP+Rq26rjU62gRHTpw+vwGS0bDOEwKb1rfybK0aqpgZWmEvk+yUr+zVH9uZtwwsAs3Pd
	Z4YW+2Kqn2ld3z5wASXNFVKVGv7sNRFMUl6i5hXbqWGZj1lXbp6mKMZqaEnSmq0EZ+8a7GmgBKw
	481UmAu8H4xDlYqWScZgWaHFPuQbsAsO33WvevCo/xxvlB3+7b/6H07kcOxJOkCtOEZaz8Qb+Js
	eHNsYY7uLuNfhl2BtDOIt01lDLBzrO8fsJy9qYhIxLYpJCPgn5TMCCrO34wUZiHpSHY2ldlCpK8
	5Fxcmc
X-Google-Smtp-Source: AGHT+IENCvGrL25P0O0Fc+MRrko1aTk7mSWYGPtk8oKD7ItaFZLfQ0P2sXgV2rrZRmkjGd+q+PpjRQ==
X-Received: by 2002:a17:902:f606:b0:295:7423:530a with SMTP id d9443c01a7336-295742355fdmr75326455ad.29.1762162436497;
        Mon, 03 Nov 2025 01:33:56 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696ea51sm112351435ad.57.2025.11.03.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:33:55 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
X-Google-Original-From: Peter Shen <peter.shen@amd.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
Date: Mon,  3 Nov 2025 17:33:19 +0800
Message-Id: <20251103093320.1392256-2-peter.shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103093320.1392256-1-peter.shen@amd.com>
References: <20251103093320.1392256-1-peter.shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_013357_404607_0A102789 
X-CRM114-Status: GOOD (  11.01  )
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

This patch adds the compatible string for the Facebook Anacapa BMC
which uses an Aspeed AST2600 SoC. This is required before adding
the board's device tree source file.

Signed-off-by: Peter Shen <peter.shen@amd.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..bcb874ebd9d2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
+              - facebook,anacapa-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc
-- 
2.34.1


