Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C4FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fi7edW2fKbyqZ3kHK/AlGvcaMEfMr3O/Cmh61+xdw30=; b=x/gXNalat+I+NJyvtZpw9ikxs8
	0iCprMLMy1WJkO6yt2CFl+6GAzTU9JBZkdr2f2eI3C9It65zcualFUfBvUAu06W1e4DFcpN3hgk+P
	3p+5OPDsId0+6MnAGgSlN0dZyaYYr/4YZqoN2nNK8fTzeT3ovxzJ/p7G+AWBQ3/wlUneRqXD7QnNG
	yUcDb5peAmfxrWK3aq75vXbPRL/uKBXSkrV/oWNIDebIacJ+ApBUfjOOlES+4aHsXcbKFlkyCUZub
	hCFm9V/7FsENLWN43rj+Hx0ETTZCPus/7dxpjNXU/FoEwQNg5byv/QKiIdnD8Tc2d0h7Z5Ob18L49
	GZTCJ61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqwJ-00000009W9z-3YE1;
	Mon, 03 Nov 2025 09:33:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqwG-00000009W9a-416I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:33:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2952048eb88so40990905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762162404; x=1762767204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fi7edW2fKbyqZ3kHK/AlGvcaMEfMr3O/Cmh61+xdw30=;
        b=CdWGd7Dhy2Exk70qjTXNvXCX/wiJ1yQWqfepOewbGz9NbVaNYd7GwYU5qCIFB47vWq
         PBUlB3Af3XUCXnYlBvxBv6MMD+YmTIw3r/BD702Ga8fENKXDnefDm2YvZCq0WiZ9qvKs
         S9bXeCvmRMR1CpLkJcO7Mrsc0vJYpBZ1v9BkFJi96hPuQoeru9OeVPf2qGjx+fLeOa6h
         NsvmSc0nfOw6I0vUiTm4wI5PWGxpmqDVPBD3i8qnyiSFa7ntv3Dys8HmA5QyiCbx1djC
         5BF4lFZANnsH6cE+3VsU1qfn3T/R5WAYXK96ViI+rztS7tRPvk9+kBWU43ERIR4jpczI
         Rozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162404; x=1762767204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi7edW2fKbyqZ3kHK/AlGvcaMEfMr3O/Cmh61+xdw30=;
        b=sy6v84TnhJWXdLZ7hi6s4fmHt9gPtRNPkggl/zKXXkOulD24q01Gst1F6GObhVHJjF
         sKlJOIR5XL0eh+wZw0O8xdV72vE2Qts5MP/aeilbhXWPb6impz1vpabojYqhlQsP9FmK
         aDlIVJHR0luOUGCvRlAHInwQT5osS3LCdXNE4ULrvIVmgeTTbrgMqOfs2nzU7N5Wk2rD
         ReRgSr6AbFKHX08A53wL1qho0QsP9jvTJh1AgQgL0tQWnwrq33mw2QSOpnlpZA+J+xbx
         L5RkufDaq4ImyEkoeJaafhr3Wh1xh/DymhphEHNyyDQcfi8dyyqBqYGLFmJj3+pUpQ1E
         Q1dA==
X-Forwarded-Encrypted: i=1; AJvYcCWWLnJVmH0upqbtqVsUHKUy2U5NxjEIXixlo9q8Fq/sAb+/B4lFUQKnwdd77q31zHFIH1J6DZ+zmEYFUPgNGQjs@lists.infradead.org
X-Gm-Message-State: AOJu0YySeU+DZmQvcIOHCjg09w7vGKXycjFQOisgHCrVJGhz2Y++UKxc
	0B2LV+XxzR8ZMwZOK7G6HAlGlw6We2ALQjytGiEX/itNHIPn9oQpVBfJ
X-Gm-Gg: ASbGncsrLf6lfbzzOv97rPV2zAgWx7zA+e1Qiy3XJraODSwyZMlT3Gb70nB/XHY9qMx
	mszhXsOQ9sjj3SWzCfYd6rCAFD7/0DfL7iOnqiFqwGR7XIkJmOGDKxzHbR5tMvlrN0XHNdco3IF
	oZSQkhOpRbfp42dcqJgSeVhD/4jo9iza7yZqj2zUnyuWGKDad0PdTZisA2IlQVanWtW6t66ZyZW
	G+DjBrnBDLIBCfO2t1Bb3pssHH/SffX2+Eyj3ZkzuH13RcIzR7jUk1h4v8q/+xN7t1xzmhlJlSd
	2od39FvekeIFYbn8+3aTH213/qvGjf5QPLofkXMmDIp4p9l0KhvJDssz3J35ziKMlZqNBGrhX2K
	plejDb/dgZsZyGZ3OMBvg9lfSmFv5KWDSorXB/y7I5zr54NuzUvDKAtjibxskDXM6lplsgQ==
X-Google-Smtp-Source: AGHT+IEhVI8HLKKsPHJmLdcgQIX3NyE6Qj62NyZlp0rKKc1HR0bkXg6Og36M1Mf5WeEiO70N6uA3uA==
X-Received: by 2002:a17:903:11c3:b0:290:c5e5:4d90 with SMTP id d9443c01a7336-2951a524561mr137993865ad.42.1762162403672;
        Mon, 03 Nov 2025 01:33:23 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696ea51sm112351435ad.57.2025.11.03.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:33:23 -0800 (PST)
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
Subject: [PATCH v3 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Mon,  3 Nov 2025 17:33:18 +0800
Message-Id: <20251103093320.1392256-1-peter.shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_013325_001462_52DC2A0B 
X-CRM114-Status: UNSURE (   9.27  )
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

This series adds Device Tree support for the Facebook Anacapa BMC 
platform, which uses the Aspeed AST2600 SoC.

Patch 1/2: Adds the compatible string to the Device Tree bindings.
Patch 2/2: Adds the initial Device Tree source file.

The Anacapa BMC is based on the Aspeed AST2600 and includes the standard 
peripherals required for BMC operation.

---

Changes in v3:
- Rebased onto the latest upstream kernel tree (Linux 6.18-rc4).
- **Fixed all indentations from spaces to tabs to comply with the kernel coding style.**
- **Updated the Device Tree Source (DTS) content based on review feedback.**
- Resent as pure plain text using git send-email with --thread option to fix broken threading and corporate HTML issues from the previous submission.

Thanks,
Peter Shen

