Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AECC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrErDogymc+1QBf5WlgcxlP49fo756YQqZ8IekTnlxI=; b=AfrwMfj53BER9ofOuvCqjGCCUn
	8yVhvdGhmhGQAu3yBhllzAIPMoEGI+moLcjhki8YSwSTjqUqnneO00ptJsHtBjvphrY+UdoEQ+KFT
	7MHc4ehmsUXfk4F65BHqekKcB6LuXlLAo+cb306XPmhCCH77VAds3LQiWlFtNcIZU82/eFqYNEesL
	PkR68VpdFmPWSWeA1ctSWxJd6YzrUeXcDZs4J83ZjbaDp8UGgUpfjtdR5N3Ds+CClr9HBsSFzriSy
	UvY5dUxALkywJXK0jzer+0D/OT8eqrblvEk3ZhblVedAXKBaiYLYjlh1Yos/TJ9X3cuZq86wjH1PW
	MM0Q4d/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtMH-0000000F1B1-2Afr;
	Fri, 16 Jan 2026 23:36:01 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtME-0000000F19p-3Thh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:35:59 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3702655eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 15:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768606558; x=1769211358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrErDogymc+1QBf5WlgcxlP49fo756YQqZ8IekTnlxI=;
        b=OKKkDLV3NTJeY3RJzxO8O/Ru9QYdzr+Xy/h6stvPlr+C5SjbsfULqCo55XL5it3rxy
         bRb8dusvnxtPMUMs5GyrYlTMwu+0J2fWAYsY5cH+3vtyISL/BkmnZlA/t6w0VWwgtFC4
         4tnGgUh2JeplYkQRQwAtXi4vQw1PStgUOzkl0SAvEugzyZK9Ri3nWBMpN08R4n6pWz/t
         Jd2OG8vhoMuKiatG08KnXULkIst/2c1jKVC7ZPLTq1vTAYNV8BPH0x3Z/WsqYU5PQs1l
         bHDnjd4fhhL5QTBQH/Sxka7JDhYDM8MrSHGZzMdqZVD8n26icmeV+dqwgalxMpx405Ue
         exFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768606558; x=1769211358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrErDogymc+1QBf5WlgcxlP49fo756YQqZ8IekTnlxI=;
        b=M93g4VHIabFKxmy17puXtbX0YE/+6bSurnbpgBZU/hnzVlCeCZyaEY76nyNbH56/ss
         WbG7KaSO6Z2hm/039DHXk+SIkPukUzcRixG9+Tpo5YD57zQJCk12KwuDB0VKqj4PDVA8
         kJPhO0Hu+W4Kqy90VCbBkvQ9nGh6ILiDv4EnrkQeSErG4xRBi2G1Pb0izzu8qSW6ZrfP
         5uqTTqy9WWLEUkMDEaFfpo5+3gA3FIgbDb4hCOjJULG53ymvABml/9wuJ/f1b7mIwwgV
         IlAfeoleaMHyoQ6uNjq1rvR3JF1cKNWvMsLrkch+loW89W102cR+TafjEvnN1t1+ljsP
         gf6g==
X-Forwarded-Encrypted: i=1; AJvYcCV8Amo/831L/zF30JwsMc6Mdb0T5KIqa8u8U7rGM1pclGWH5/4oD/VQ06R1NJJUwCZPAyQFMpHEpIQMpkgdR16W@lists.infradead.org
X-Gm-Message-State: AOJu0YxQn/4nfKtr9ywMbJpoh2x1PWivrOWFDXMugVyJFGJU8xhMGKOf
	RlzhT7cyZIZP94AFfiZFc/qkOah/Ks3+0lk+J0IQDW7A+uTxOvOcdJLvqxDdokNZzuo=
X-Gm-Gg: AY/fxX42mZ9B+iB3/lIJDt1hSVC/XxhsUG9Xcyfq/NOF4gJVnalqTEgoKLUq+h3EcQ/
	iNlpJjo+IMWFhffeNu/hZg5nb45eWgvJXGUBH8njBGvmVXSZgEYUuD0lEe8PPjrIC8RJM/c0hFh
	E3gnIjbF6QVtjZdEhKE+4vpHA3tO0GwES8+3wS3mKkNuLeBRIRgQCfEPgl+r0iNdJ4D2dZGEwvq
	lfzZokHvz/chNT3ZGh9bEgLiXpmtrhIeG9hQ02EAMpl32LGnGeYEYwRD4PiVME4j9tg/glXzZcQ
	hsbvs935NNoBo1QeQi1NG4C8SRIHd2NzCXJxg4uC6VSOqqJClB0FIYAUWEFWd46Kyxndw17ob7m
	LuRwMy+q5iJ+ciXvIVFqVD7boqBRn3bRvPT1J+gVStckeaFDuPLvdL1kO7zdE3PfHJapqk0vPSt
	WwSfi1PrSbGcc=
X-Received: by 2002:a05:7300:5712:b0:2ac:1506:c781 with SMTP id 5a478bee46e88-2b6b3ef90a8mr2941587eec.10.1768606557892;
        Fri, 16 Jan 2026 15:35:57 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6beeb4b9csm3269419eec.30.2026.01.16.15.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:35:57 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 3/3] spi: dt-bindings: xilinx: make interrupts optional
Date: Fri, 16 Jan 2026 23:35:35 +0000
Message-ID: <20260116233535.260114-3-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116233535.260114-1-abdurrahman@nexthop.ai>
References: <20260116233535.260114-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_153558_867893_7B627C13 
X-CRM114-Status: UNSURE (   9.97  )
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

This makes the driver work on platforms where interrupts are either not
provided or broken.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/spi/spi-xilinx.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
index 4beb3af0416d..8296edde61b0 100644
--- a/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-xilinx.yaml
@@ -23,7 +23,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    maxItems: 1 # optional
 
   xlnx,num-ss-bits:
     description: Number of chip selects used.
@@ -38,7 +38,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 unevaluatedProperties: false
 
-- 
2.52.0


