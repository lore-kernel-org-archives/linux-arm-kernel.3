Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3110BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dmw8BUMis3U7evEGAA8fT1j+khq5yYTTfzGiGGo+D+I=; b=WjgD9M2doNBnlYzwjYk4Y/yAUd
	lgWDLut92lJnONIFhqEq1wESwpOPo8hZiM6AnYRdMa9a899GniKAeGz439yPeYUQTgAyec0tHZusp
	paceUm3HCD6xaqogLy5YtsesO5ZeXjzWgBQ9Hala6QgLRoRHOYapa2csDR83P5rXmlXvRgtUrfz9L
	XF9MSh3P4HEM9fpOlkYwkODRLqmX56ZrqC12qsIN6IB8g5/aKwFzJTPVYr9CZvfO9KAqeDDT6Sa8k
	76Myx7tUTpl7mHfjCP0wPTlteiZD8I+qbfz9X9xokwdPsDsrJ2AikwDsLmWEdIYJHVc5pqXWCiXTf
	o4/K+kNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHa3-0000000GqbD-1uGh;
	Fri, 07 Nov 2025 08:12:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHa1-0000000Gqam-0jcr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:12:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so667904b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503140; x=1763107940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmw8BUMis3U7evEGAA8fT1j+khq5yYTTfzGiGGo+D+I=;
        b=htMmE0emPGdHq0fZGnDvpOPaz/EHhpjGQEgI9tQAGQ7lqpv71O5F2grV4XKH9Hs3A3
         5NsVm8dSXQJWOOsDVnWfutcrQIrQP6XTEvpC1csya76IHg2pyFttGM2Lf66W/sf3AMU2
         9NpTpZxB9GVjQE9JZGoxsV2ffXUtVAvLc+NTwtIyFN45+imQ2JA9YWUIC5qjk0U3VnUH
         j727CYamJrl+LF6FspPoPN/otMnRsRcFv6AtHNpypECuByhHm8fmqHgrTdojst3lU6Mv
         VpclrR6hcZ8ybbixuWjYmfgatonCeQm83xXCZd2KHEapmssijO6by670SOMQwyxt6MsA
         XrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503140; x=1763107940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dmw8BUMis3U7evEGAA8fT1j+khq5yYTTfzGiGGo+D+I=;
        b=AYyUsp12vZvPT4icQw9aU/SqliN9BavGzBe1HcWr/UiPyMmZRDWvNWF95Z7wHlHFfK
         HGpNVWxwbGsCfTpmwlZfCnKDHdw9Hkcr1R7k+ZSldApANf9xaDuK5Wrv7wj6xti0ZEF5
         ZAPRQx9/mPAU0TYYSORjukHOLJW9VvehRkgUbU1uC19/cB1zjx/4CB4QSX+hlPo8MV8l
         WohciHyRlnQ293rSe2Mp4dHlX9YaiDlnSQUcHNq7l1CoLCwNuvyFWlfk8J54Dm5FhtQY
         0j3hfE1F21TY0m7hFQlvnE2Nwix5QoZw4mQKMaboU1its+vEjYfD42w7nJFtaGgXWbCU
         MD8g==
X-Forwarded-Encrypted: i=1; AJvYcCUja8dK3ZlITEyQciTaJL4TwQEawycyS682Nek1QWpoebesiKaZfhVcCk9ugDn250OI6TDLn7mzvYMnFI0JPNbE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw902QppYooSAwDoZE3E9V0LuQF2EwDBiH17qviqcptzPyRNz+T
	xn2+YnXLcJQ9GGCQTfUoFN4E929z8dTh49g/ZFs0I3NdpMfNFNgqEsRQ
X-Gm-Gg: ASbGncvK6hGoznbxO4G9VzEKB2/MmyoqO9NilJSR2nYTNX+mKg72wt5V4wMRgi5xUey
	EheipmExz2hFs6TMFb7s5rsl60+V+dFSdbFZPBrEo751BNNeNP7eJFCEp8UNTEwDfzDiPhtPZcN
	0LkOL5RkCLJnzhuFTzV2UJGJWGzsv8vRw9cbxHAAzfInXKQ9t1oxrFt436o7i0o6iB/fOFyQFj7
	c1o1Ns4UvLot5k7RmQNS71PT0x39dUM7sr2h1X7Q5PDSI/7p5htc1S1pl9Lw/7UGPy63ltyQzG4
	HKT5kyPpWkiSa/yketh9r2p28i+BFMK6lpNqcoGqCglhgblY1RU7oElNG5lzl/en6rduCyablj5
	eV/Gk+J3V9GnA0Z+1xx6u4ZbZpK3X8AUIqIAB9G8vkeKKJlAlzsOi+tum35PZXWZ7RvkxLA==
X-Google-Smtp-Source: AGHT+IGs1b/E15BQQr7IRWhnvMwkUWjaQl+1pAkJ+WBKp4CDaO9Vgbztv4Mt1ZD4fKUVL35oC8br3Q==
X-Received: by 2002:a17:90b:2e07:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-3434c4e4544mr2792443a91.1.1762503139944;
        Fri, 07 Nov 2025 00:12:19 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba900fa571esm4450338a12.26.2025.11.07.00.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:12:19 -0800 (PST)
From: sjg168@gmail.com
X-Google-Original-From: peter.shen@amd.com
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
Subject: [PATCH v4 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Fri,  7 Nov 2025 16:12:10 +0800
Message-Id: <20251107-anacapa-v4-0-peter-shen-amd@sjg168>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104-mellow-denim-dogfish-4affdb@kuoka>
References: <20251104-mellow-denim-dogfish-4affdb@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001221_214908_1CA29976 
X-CRM114-Status: GOOD (  10.02  )
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

From: Peter Shen <sjg168@gmail.com>

This patch series adds the device tree binding and the initial device tree
source file for the Facebook Anacapa BMC, which utilizes the Aspeed AST2600
SoC.

The patches configure the necessary platform peripherals and aliases for
OpenBMC usage.

---
Changes in v4:
- Addressed the fatal 'Broken DCO/email chain' issue reported by the maintainer. The Author and Signed-off-by fields in all commits are now unified to match the sender's email address (sjg168@gmail.com).

- Addressed all remaining checkpatch.pl warnings reported against v3:
  - Fixed all block comment style warnings (converting to proper multi-line C-style format) and line length issues in gpio-line-names.
  - Removed the un-documented "amd,helios_cpld" compatible string to eliminate the highest priority DT binding warning.
  - Removed unused and commented-out device tree nodes (eeprom@53).

