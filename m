Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187691048926
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 01:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYm62l7h9IssC8pYlAqoKgXtyHZXXq6P9yH72X8r6sw=; b=yEDUWRfqaZu+AZZAjGbLdfJZPV
	E05RFE+/KAOP6dr5xhaLxt+goO2tPDofuy18NTLKAGh/F2kMSYuZ6vsV1IdKB6ESrF3Ifl6am2nG/
	EpxZB1kGVfXPF1DcMlB8m4xJjDof7gNpvCAou1mbt5pq+6UAOvM6b3WQ5gNp4b4juE4dr4vzBefn1
	zIh0GE3Y5mD08rVwthoLHrpEwv3ssleqP3yA8YqoZarnd+82f6icj7d6zR+js4yxwR0/BmPPKzS0P
	cpdLDhnbSJOkd6RFXC6jfvmL92VrTQknj3/pLqnAukPEfdM9fgmKwCHEccJ584hb1H2ttoGPa56dj
	QaAI2g4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Qe-00000009P4Z-0DQp;
	Sat, 28 Feb 2026 01:47:36 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Qb-00000009P4A-1g9l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 01:47:34 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-127423bea4bso1499848c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 17:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243252; x=1772848052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYm62l7h9IssC8pYlAqoKgXtyHZXXq6P9yH72X8r6sw=;
        b=FtZR3NhX/ilwOzPAxyb1KBgUJj3tHe8wiaA666IIov9a6y47sYEENeQlnYCVvRmgdB
         njvszNER48NeRPSxBPqJ9+OGF8bkDFferYtFhqUQlmKuMMISQJEftwyqrfVJ2dn6A6WA
         /K7SebTul3hhwOFSa0Yrm2vHv+UR9BrGdaEEbPjZ/6m35vW76dIVpiXjyOxWgiVxK+EA
         sFORMh+OVy9tgKU1A5HaUMDFA1GmTwWYftDZp4X8Jb6SPy0Owud0MJ0S0KCx5sCRpffY
         8ISPAp+MhxGg43aj7d8q+/dmriUQtWxwB2imV0dCNQqC1+Fzgm3k1crmHXV9rLbcNTQ/
         475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243252; x=1772848052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYm62l7h9IssC8pYlAqoKgXtyHZXXq6P9yH72X8r6sw=;
        b=Okm4OzJ2qwuWsr2aAZFE++g2SPVVG9J3WyGU6eVXIsZllwOZ9w5oZ0EHacQYf3YNFX
         bYZs9gWWQq0MbucWunx9P1JrvgguoqQPiN0oTcrgjQTk+C4DkP6fmbPL6zXhHHkjU/l1
         BITtP/jVmbPm3eV6vKTJCGy3eT4GdhvnJM+TNefh9KWzit/yqNkfHfPBs21ebunncmgW
         4Ls4h5JC3Z6CCyVdjnt2B/ttBiSc591Odf9FWX9XpDrVLgsH82j7uxRZ43vVWZI/LB56
         v7HmRcycEyEcHqJcGWWPVrgheqV5TVrVhXL9lpxH6NZUZI97DWR+b+vhQP3Hj2SOojQm
         MJIw==
X-Forwarded-Encrypted: i=1; AJvYcCV1ffizHysnxkuvB//iJb+xebgR6EO4GpEvb+D+HXwReH0gBM/BIhqxasdioxHUaLmYroxI/ZENEVMjRFmpohPR@lists.infradead.org
X-Gm-Message-State: AOJu0YySZtcBY6B9AcLuwY6wJGtyzoxXezH6S/SNsOW7a/H7jH0YpjHW
	G0hWuihiHQ+rUxf79gpy/1mXNRqPnr4LgaXey1Uqbyko6P8ofisFlae4zsdyqWhmK+U=
X-Gm-Gg: ATEYQzwO4x4ul6BJoLypR8jOQXzAYgVI11+7v6laBUacVOfZwUq/A+qgwjKLzrCgPRN
	vRG6SA/616+giYz3GAxsW1WDfHXAmg9r/zC8Bn0iLRexXGc7K8JqouYweL7AWjydDBu+EE01brY
	BeCIsX87Vk3/bJItsjLc2pAhl4BmVYSn5uA5NTL6j3szwtGdwibCbiHlFJIceao6r4PfpfRAxwn
	OHr9UloeYxep9YTtDmkiSXQecCd9cnzwbo5Y6Xl7gOC3vU7Hl1lDnhJ+gG7ZWIn5fvbQD0yTl4h
	/1q1o8Gm/odJ956TloiIH0rNHhzcBSqQVRtJ5hxJGg7OXImiXIUkQnQsPyVf7bi4QMqgkIwQlgo
	+7z6Q8qFBk9a8MF4tycKsqm0TJlw5CkgSp844ElvyJhtINJjdIgTOa9vo8vZ6dI7FGepkcYRiOQ
	LHGN2foSDFh82Oy60za2Zxn9On0N3HOjI3x8/wrNi+iWBRnXGjAQPKLATE0+UXPr6fcMfP4w5Z
X-Received: by 2002:a05:7022:20d:b0:121:9f05:7e4c with SMTP id a92af1059eb24-1278fc5c3demr2053905c88.16.1772243252369;
        Fri, 27 Feb 2026 17:47:32 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm7734470c88.13.2026.02.27.17.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:47:32 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH v2 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Sat, 28 Feb 2026 09:47:24 +0800
Message-ID: <20260228014726.258796-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_174733_444127_241C4F62 
X-CRM114-Status: GOOD (  12.82  )
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

> This series adds support for the TaiqiCat (TQC) A01 — 
> a set-top box based on the Allwinner H6 SoC. 
> Originally released by Ultrapower(UQSoft) as a blockchain terminal, 
> the device has been discontinued and is no longer officially
> supported.
>   
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

My apologies for not including the Changes section.

Changes in v2:                                                                                                                                                                         
- Replace "UQSoft" with "Ultrapower", and add relevant explanations.
- Link to v1: https://lore.kernel.org/all/20260226084850.417731-1-jerrysteve1101@gmail.com

> 
> Jun Yan (3):
>   dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,
>     Ltd.
>   dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
>   arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
>  4 files changed, 369 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> 
> -- 
> 2.53.0



