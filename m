Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250C7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMpWtxvVnB3sDu3M9k8udEVrpO3wTQipx27cDHb5FFw=; b=ePsNoUK6Aier+OQDiA7hoe7ga5
	UVWlW7JYnMdBK4xx3NL6p2x5wVEhO6spQloI1CUNOdIeFVid2lEwJxHd23EJ6akjRm4Bvv9ZzgzS1
	asdl2FtRE8ar0NnpzjlMDPIW24uyNog3YIAnSRyWPo4Nxf/BpTR6k/LKT+YfbPKzWE7y6nudi2QFP
	df5PIayxUAuvfPhSuYIMnyVq1jEQ50NWqlfdKEuScIUv5B646oEnCz2j5rBbZS2fxPcEKNnceLmjY
	L9netiYSzx7JVOTBunoVbF04J+W1mFwU9qd/+wy5pNzPBkRibS/cscJzIYdf7Ro2Myky8kSXGFobO
	JROwCNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHju-0000000Grjy-0htS;
	Fri, 07 Nov 2025 08:22:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHjr-0000000GrjX-2rlN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:22:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7af73974a4bso313067b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503750; x=1763108550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMpWtxvVnB3sDu3M9k8udEVrpO3wTQipx27cDHb5FFw=;
        b=SnvamftPwUDjX7CU0w5pEhXdHsy8pgPWmnhnePBo+t4U98sJO9S5BvkOPW8X7D1Rsi
         taCFrKFG1wN/EkND54Kg1V1CppukfdPQxqZ86OVySnjK+IkdEjaLBxhU33Ty6sXmgIjF
         m00YXTDBjJhzJlJV136pzF1ScUI+M8CbqQ+x0pzWSWLGU30fKm9/S36614Bs308Advoh
         L3FoJCXTC3kfuFq6OENjwweF7lSqxoh6aHwNAyEIlz075+RpAzlsHbCnmKeu/vT8AAVC
         LCWAnqH4Bcai5+6Q2d6tDQkQt/B6dIvsdDG2clz2LjTQXX5Tic7PT35xb/c1H9HQmRo7
         M+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503750; x=1763108550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMpWtxvVnB3sDu3M9k8udEVrpO3wTQipx27cDHb5FFw=;
        b=nXZf4YPqWzZhKYNH+CYhQmQGLSOThe9cJuFb9Mk9iW47a8ggwax/EMpodgia671Mlf
         msmPqs5G6UStNhcHj/aThSD8vNC/REYM9XMOBe1dWcS2ll8Y8IcnQPpGftzv07+1F7Zu
         wRJnG7JM1njWSmVwf7YwbfrBs4wrMUWz7XMLXsCxT0uYAwSPp1bU+2zQvVkC3E4KBzsA
         l/kHVZaxcNWPf/G8Yi1M68xfeljZWVxfUXP6XBwHlYDlWv+jQBEcKtJlOpqzifTqRKi1
         NTFiT21X6cP6shVOt7mkCrvKa1SjKePkfuSU2oIuSASIjcdtS4627jEINg8P+mJDPF12
         cDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JtqgDY7aISEIVWUPTOgV3+HnFLP3XXIjcaQlCRi8UWu2Ejs559bhgzWgu+4Tz+Fv5P4hh9ZvFLQvnph7KX+I@lists.infradead.org
X-Gm-Message-State: AOJu0YxfZ6fkoBpJ13aX7MQ8o2ZKoZmdtRWimnHQg0a1aloh7KLbvGCv
	0IfaELy/s3G77JODNHoxH7Sxoxo2l6GusK4VHUvpdJNiY8yCYoWdONCK
X-Gm-Gg: ASbGncugMCQ+VZ/6HnnMtdhLA+UGtXjRIttHulEwks7OT7++Vym79tdwZ+fx0JW21Wa
	LClc0ArxxxFToBizM/TLJDV62jQ6s5nH4oimxiSxdzQrTT6WtLntQTlZosa9Xdu7jO9Y6PvhM4M
	rHN0hqNwiUovqCIhps2DF8jIZudUedsl20QkdOb1bBBnexBl/3R0jm2w6/9btyRDMV9aZlM9zHa
	vQWyHQYBfSWJqFpZ0GG8TtO412fQ0fHBaV4DNHHlYfJVuWKe00dwAWa6y/FtHMBEgvMS8IYTPQU
	5PnBXZHBgSqXLlD+OeudDLHI3HLxXZ+ozfc5F80uz1qZd1f6572cTgZPzBLiLdjNFynCYp+oIEP
	0SQR9Sdz+CiQhWZawQEMo9YIYIJuziTzfmhDYdr8kqglua+DU85vTRTbkzHujvSoDrz4=
X-Google-Smtp-Source: AGHT+IEjlE5AsnLv0b9J+7cxEwQxpex1D5LYp+e+gM7rZYr6pY5wGjltZgYlA4C4hvMPP7ucQVOe4g==
X-Received: by 2002:a17:903:a90:b0:269:8ace:cd63 with SMTP id d9443c01a7336-297c95bb193mr13342035ad.30.1762503750491;
        Fri, 07 Nov 2025 00:22:30 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5ce87sm51494325ad.29.2025.11.07.00.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:22:29 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Shen <sjg168@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com
Subject: [PATCH v5 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Fri,  7 Nov 2025 16:22:23 +0800
Message-Id: <20251107-anacapa-v5-0-peter-shen@sjg168>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104-mellow-denim-dogfish-4affdb@kuoka>
References: <20251104-mellow-denim-dogfish-4affdb@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002231_722589_FA6D79D4 
X-CRM114-Status: UNSURE (   9.30  )
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

This patch series adds the device tree binding and the initial device tree
source file for the Facebook Anacapa BMC, which utilizes the Aspeed AST2600
SoC.

The patches configure the necessary platform peripherals and aliases for
OpenBMC usage.

---
Changes in v5:
- Fixed the final DCO mismatch (Broken DCO/email chain). The email sender address (From:) is now corrected to fully match the Signed-off-by: and Author: address (sjg168@gmail.com) to comply with DCO rules.

- (V4 Changelog) Corrected all previous style issues: fixed block comment styles, line length issues, and removed un-documented/unused device tree nodes (amd,helios_cpld and eeprom@53).

