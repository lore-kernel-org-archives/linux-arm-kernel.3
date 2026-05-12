Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A51CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=; b=HuyUylzOzB4ejZQBicJBo4iVa6
	3g58kAKmg9yDbsUzSAoWP0HXhDIFg7okcgdZvtGzNPZ6htGpmylELzNkWY+tVazflfNLvEBCFKJNP
	EQWhoUY9iz5uIQ8lSkEqg6LJoxAjSBP4niQkYImMdNWhu+3XYmJEfFrU4I9kQ/qYb4uCDmkrERm/6
	F/i7vCEHJI7viFr8h6MCbZIYCB3LXGT7RNcUzFUBlPoR8n95/DAUVtGb4jKk7pOhZCWs4e2jlUgKp
	2iuO9If9cjYaPGVClg2o25IlXjc6zqhIN1CncZY4OeY04pGxFk3NVTF9mykBl0Hx2lSRKYnDKB8C7
	bsWhaWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnDk-0000000GrTZ-3gh4;
	Tue, 12 May 2026 13:32:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnDi-0000000GrT2-2V98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:32:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-83d31ac4017so1984888b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592741; x=1779197541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
        b=d+ela5b+ejr2p1vtVI4LtyTqnxLFgDj/a7vsJFBjE/bO9SJjgbk654aFSzkgq1MZ38
         MaJEYJfsE4t4+K/YYjMhjvk0x6f/V9qjM0RCoTPSMstsnGoV2Y6eQzT6yV6BAAkgz61n
         HFWDO7oHAUopgqJ48K2cP4GfEiSf3e6QmpvSQh1CqKNmuGguQud81bNEmkdqPGicuis0
         Gq2f89V35aA/UgMwNKoVCY+Ay2Tr+fYgPqM/O40rBDd2OH2ygiVH03j22u8hTGvAvzXQ
         mwOnue/mdB/7do7cjFopp68doWUKTKrBSllo+SP23y4/5otq8BYURdGds6M7B17bGIgl
         DScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592741; x=1779197541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
        b=Z/OR2O3v3qo+k+oIC4QCkdZLGLsXLpt3XC1vUtxCpO8EcsXchOzUAvnk9CBgJ5LHJc
         9YWZGA9XQvgLo55ImW+7Zm8z/xLCCtZfTHI3wfnwJjHLSYR4LXY1Zmbh+f/mejsxYQHz
         fL07DijTLt057J2Ujvh2QAh2souPtupw5CPWLUcnvrASkbTfqujyj2KCIiXtRxR7Re5n
         I+epGQsRe8Pacip+ondpJ9L6Z9f7qBYMVLVHxU/6tbDxeatk3cax4h9ez4uOLBG0WqR1
         9IiPmkN2iaBqL35FtutGYzObOQSz0LyW0yBJSM+5/5gpR+kg+LWaqcvM3qnbyktACa6T
         gEOA==
X-Forwarded-Encrypted: i=1; AFNElJ/vS8WND7AJGzNabl6ue0yki21fW28qvS2Yo10noXPzEG11eWqi6Ew3LoJyc/Ocw8LCafEcTQQtYO1o0vlzhE9/@lists.infradead.org
X-Gm-Message-State: AOJu0YzeXN9wO7bx42LfCZt4cHS6yd8uyaWzIkNEEjbcueJNGK1enW5v
	xct5YX4ASYPvPT0D3BPs29QJaHP2h0CZNIF0gWrJfTAKrsIIeWMmeoV9
X-Gm-Gg: Acq92OF/XY/n+/d4chT6cNpsqJnXS/wltAS/v14YNPCuRnECzhzNG0tWUBZ8nWOsZQV
	JkfaerLh46qTnZH+5HoLgyPL8MzR+Tp501s0j7kHYP3M028uCMfjhWEp3RYQ7pbTEgz0zwHW2DP
	ZLh6t400pQa/VgCmYHY4g/88AlhK3fnUzT3rtD7d5av77ZOagchuCOcg8hZWyPUeux/2i2/K6Jj
	cJ/x12cY7MT1jErnane2OywjHr6brh/RsuuhGQjPrH17bqBAJvZo9+D7i4z/Z60USrsa5bqclzL
	GfTf5EVPAfM4E3u36GNaHijVsQoJ8MBpiyEfsZGQludqHby/cmrSCGXEK2wbeaYHU+fi9s9ffTp
	z3DWMLRL33P8yM5WOqzV2wI7MBkvpbJT8+xVZHBGNoTqExdDbame3ixVcxJZflyJzi568waauMl
	5zqnoZJOg7ORBEWoZS7xBJ4MgkyRVfpXSno6+xeFLbru5oHre1SCqD+locCGYNKQ==
X-Received: by 2002:a05:6a00:b48:b0:835:351c:f236 with SMTP id d2e1a72fcca58-83a5d09a78dmr28663707b3a.29.1778592740983;
        Tue, 12 May 2026 06:32:20 -0700 (PDT)
Received: from r912.lan.4v1.in ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f38fsm22849934b3a.8.2026.05.12.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:32:20 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	corbet@lwn.net,
	jiri@resnulli.us,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] Documentation: networking: devlink: stmmac: fix typo in phc_coarse_adj
Date: Tue, 12 May 2026 19:02:14 +0530
Message-ID: <20260512133214.1773502-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_063222_632887_38A4F185 
X-CRM114-Status: GOOD (  12.64  )
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

"Functionnal" should be "Functional".

Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 Documentation/networking/devlink/stmmac.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/devlink/stmmac.rst b/Documentation/networking/devlink/stmmac.rst
index 47e3ff10bc08..fbaa81ea782d 100644
--- a/Documentation/networking/devlink/stmmac.rst
+++ b/Documentation/networking/devlink/stmmac.rst
@@ -24,7 +24,7 @@ The ``stmmac`` driver implements the following driver-specific parameters.
      - runtime
      - Enable the Coarse timestamping mode, as defined in the DWMAC TRM.
        A detailed explanation of this timestamping mode can be found in the
-       Socfpga Functionnal Description [1].
+       Socfpga Functional Description [1].
 
        In Coarse mode, the ptp clock is expected to be fed by a high-precision
        clock that is externally adjusted, and the subsecond increment used for
-- 
2.54.0


