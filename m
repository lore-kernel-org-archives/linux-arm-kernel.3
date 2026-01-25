Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D08E63CAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfGeE45ZQ9XIxdIlzx/DpJCq/3CC8DUb6RbVVNebAko=; b=pXfIjrCGiYCmcduXRutWLzHENS
	otkuwyl6IguC6SamY9V9eOiKmVKUVE745angFboOkuV4KWWPbRQxFaXlf8/qkihqi5RrKFS83N4XU
	93VUj9CpcTrz6mn60qJA94p7mACucb5tIioxq+pVZfx8hlrT7jreKQvPGrsY8tr8IlrZG/on2/sPm
	jjAHuS13KG07mxkjBc5Ii6mvCac9xIbs+mWPiVFqdCgEMEmfqhTIgMSqCTH0AkswPFepRvg8tP1/X
	QUSFuCBEqwP+agJH6nWunhLwmc714Mkp077YqoFYOVgHkyDzBKXt1eGUyKLwQooi0d3RZsd2KnmfF
	lDh+sV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3Bb-0000000BKW4-3leP;
	Sun, 25 Jan 2026 16:42:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BY-0000000BKTK-35KV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:42:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0d67f1877so24497305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359320; x=1769964120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfGeE45ZQ9XIxdIlzx/DpJCq/3CC8DUb6RbVVNebAko=;
        b=BbMyxa/mS+e0DL6oVz/dCTTn+VktNy/8TerMNz9ysjmcj0fmUhPKyewhrtL7exWaf6
         Fh9jIdXuhytdCEJNEx6Y9R+R/ul3sIAP4E3UTT8qR5GrdHQGdDy30aAtTNhkJTByClC2
         N6NYAWMNHsWoKV0GIiu/WC75aahGDzpmDG11Bul3JDcej860G/vTJQ0jMj+eBscot+TJ
         W7xJhnBWr1GSpbl6C2AEIb2UFX9TmYHzk95v1c4aBX+XpiJ0n0J8Mka/5UsxQkzOo6AX
         GbrSVtMknnGBbfMHEQjA7BW3aYtqMqVT6b0dr5EYQ6/4JZUyDnznQs5A2qG2rQB+56gy
         0SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359320; x=1769964120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UfGeE45ZQ9XIxdIlzx/DpJCq/3CC8DUb6RbVVNebAko=;
        b=juI0lFEQBEOoe63dChH/jbTUzhPq8kaw8Jk4n1UnbV9pNwnlj8arultIzgnEdT1oWQ
         GWWT4fTkUJuetnE7GOBBxv/YUjILLbJe5lqtmoL3FBXJoXDtPgnec8vUiZX3+QKRUi9E
         4DFEy7O9a/+zCRTSsMaOBswclw6iRdCEWsPbGO1IpA8zlgBeP8ss5c8FVvU5Hw4fa30O
         K9jqOZn4clgjmO/BZhkiRlTgb/+LNe/twaG8olOPpw4T1R649CILPVAml+IxMsDYpjKm
         4dcHLsKFEVMFeAS8dVpOjH5Xy9YPKLaKIP+o9zNaiGQ33PdjOlBFeHZQHGMbsjlsx8HG
         3+5A==
X-Gm-Message-State: AOJu0Yy5VafwmQj+idSKTCd3jGtp6PsoSRkld6W3LC5J5Xs0YzvCe0El
	bi31JoeRdNCovuZZspJm0Xo989BvomQt6KD5qaL3z5S/NVoJbh7W2mYT
X-Gm-Gg: AZuq6aLmcfy802CsJ9ywyNvQ+LMA06aStwBbOiZJR2Mp6hBveGCpys3DcXJpvZRgJpa
	CgEyL8bAxGb36Uc6k208H9t3HoH1iqSABIE5UCd7IRvDAA1P4d42nGHiCU75G3L4CSLAoYBfIGO
	OI4SDv0ixt2axl8P1Q8lVbm1kS/zgvTN87/wv4zReOLBdUHQdWYYmQ5Id9L7I1IDVCqcuLhrxwK
	t4uLNjO159W4YdaXZsGNiF9qWmuus5AYtaVBguoefZ6SQp7mY9gjYMzPTh0MiqPOSlqBIph7Cxo
	x1WwXdzvEUAeW6Yjo3bfy9PK5y7sN/fhf8LMZQyynqonSkybNVOQ8O58nG7HM6n/N8sWLHcPtj5
	gqAGpCrWqAq6SZCzd/S7llnx3MN0/b23T9RwMxbkb53pxBdZIyA7mAfh51GZAs6mIR3KrNQvmA0
	BUp+dcs7cfWjyfFe3ey7KKb0x2N98farM31JLgwyLSOw==
X-Received: by 2002:a17:903:3c6d:b0:2a7:5ad3:79eb with SMTP id d9443c01a7336-2a8452c27bcmr23725395ad.35.1769359319641;
        Sun, 25 Jan 2026 08:41:59 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:59 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 9/9] ARM: entry: remove redundant asm_trace_hardirqs_on()
Date: Mon, 26 Jan 2026 00:40:16 +0800
Message-ID: <20260125164016.331257-10-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084200_784454_17607691 
X-CRM114-Status: UNSURE (   8.79  )
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

When returning to user mode, trace_hardirqs_on() is already called.

Remove redundant asm_trace_hardirqs_on() at syscall enter.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry-common.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 0556d01ef55b..4d1a58e769ef 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -180,7 +180,6 @@ ENTRY(vector_swi)
 	reload_current r10, ip
 	zero_fp
 	alignment_trap r10, ip, cr_alignment
-	asm_trace_hardirqs_on save=0
 	bl	arm_enter_from_user_mode
 	enable_irq save=0
 
-- 
2.51.0


