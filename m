Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKNd8Utd0S1iOMbLaDsMsRnvMHExlXsqwy9xXjHFvX0=; b=y/MqQjTMxx5Cw45ztw4ksJIkkt
	ndKJToG5ThWtCcmI1ljpDpl50DYymyY/NL1+TlilaMuhHeGm0bBfXe+4aMA12wu6iYksCMW+rqQZH
	+ScNl/9fvsKrw5UOTmxOgqqxynl6Hy4yXLH9IXzw1F+o0iTvIiQ3vlxzDqRd7fmQXmSz7v7ieK8fj
	EQFMlXjCU39e4VCIYK6xv0h/ZcAwSIGKLd/tqkRS21XF9H6J//vnE9PSFMUvyiRfw3+ySv4P+tYOB
	ZqZABhlt0c6EuQR4QMlwusTXR7L/G/B0J6pNcqkN97Oq1iM+4w0/VSYgQc9tmud0YgR+/4x1eEmwD
	cuOAdgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsCL-00000004qGA-3gYS;
	Tue, 09 Sep 2025 06:51:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvjSG-00000002TlJ-0cjQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:31:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77238a3101fso3511813b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757367075; x=1757971875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKNd8Utd0S1iOMbLaDsMsRnvMHExlXsqwy9xXjHFvX0=;
        b=MUSLfrH5H/1lwSUNWVQ7ufwrlLzid+7Qfuk8TF4iihB/0s8Z48IielEZl3RFcyS86x
         TTf3T8nqvcr9I8vC/2y23pkthzeBk3FjEfn2z5AuZnCHdrlnnuuZvMnhsZqWkluFkW+G
         fcLx0qUZBjirfEaVNam2R0g9D7eGSbqTAyQdW+stbt7lLy2pUyyl9vQ1AvLNURK6x3cc
         ROSyI00YgrYO6RGi5vOQvYTRd7wiuqaaOYVosYJZJakjSfGEkkq8auCj1k3qEEzl6aBU
         xBPSQbS6QCr5+gISiIGttH6SnN7Qu+Syp0oKaEROujllHYscsOFjN8EuWt/AInSQUfE1
         prNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757367075; x=1757971875;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKNd8Utd0S1iOMbLaDsMsRnvMHExlXsqwy9xXjHFvX0=;
        b=lHgl2X+Mmt1sjiLTdGlMbsURIVM5l1UylEAA0zLDFk9HQqt9Vz+P8UegTmuGAVS6EC
         I4lpuyoUenmdgwMJ99KzJ9egzXlnlItNDBfbisHhWyv0t6aLjpKxQtq4wrLVDsPalE+T
         H6Z7SNMzy2u7VtQ/qW/e51nPObjnoSqZsDmOsXC9OweEARq8em4i4aeYxeQK3CK4bjds
         YbjuVi5knzTJriHQAIA/VTrjvVlm6OwvvfiVIgmG8SFhm/z46qn+Dc9bLkRMOFbyD/B6
         elOKJx7mmRjimc0zNqgNiSqACC0YDUGfEWrjagZGoWFbupG+h/SB/b/Bs/sCeeBvI2Z+
         f29A==
X-Forwarded-Encrypted: i=1; AJvYcCUj8mKV3M9dTdVbOKYWBQA5m4faDN3VB4Rj5Ni+2AqRccGoJB3KGJVC4QAofMwugh1jPD6bwJLvyj3DaEjC/pvB@lists.infradead.org
X-Gm-Message-State: AOJu0YypoLFFBjEa100i0EisR3e1x+NoLK5ug3bgFIOrE/E7cpBUa9pb
	hadIOZjlwpfH+OHrX0BLiRLFPq3oP/u3DpCWmykzWXeMVEpv9aMFGN2E9tPibOwcSj0=
X-Gm-Gg: ASbGnctKF4asdn1h/AgMLDFIt4ar46NrC/eXQHzaqmlkmThXjDPrsqxk6qobclQXXlM
	A6BM6yL2a5gQt6u1Tv3oaXpT5GZ8fq2iOPWQO7xfo/BYdfP9E1sK+QGtlywnqcKrX25sF6ZHSuO
	9t2r14zQxlu1IhzpXp0P/0Ek60HJp1y1iYyCbLzge7N0z9xsR37oZWQv0HNjK6NxzebQm5tsNmP
	+mVkveG5yASZMOhFRiAGkTUBNNBopYzQJQYL7EZCaJtwTrrBMpSvXYNBMwR0lC+TTFetbYWlBzX
	6AX15Q5mEZXiuyAO95Ej3NbcWzETN5i/qPIlx2Xp2xTUs2ZRmw6yvvXWokLPGdpvh/d013oFFvC
	UeXRnmrpQ0QaSyfYg/uka
X-Google-Smtp-Source: AGHT+IGhrOxpMf6LbTBWclaXkVMnyNyqohYMIOP3702meJeC8Lm0mbOHYZII0e/BiROhb3SVuf2esA==
X-Received: by 2002:a17:903:3ba4:b0:24c:b83e:51b1 with SMTP id d9443c01a7336-251718dd5a6mr112236075ad.44.1757367075042;
        Mon, 08 Sep 2025 14:31:15 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm174700905ad.39.2025.09.08.14.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:31:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: rmk+kernel@armlinux.org.uk, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ikjq5kqm.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikjq5kqm.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [resend][PATCH v2] arm: omap2: use string choices helper
Message-Id: <175736707409.1080146.6329024650426367782.b4-ty@baylibre.com>
Date: Mon, 08 Sep 2025 14:31:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_143116_303814_D4A23324 
X-CRM114-Status: UNSURE (   6.99  )
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


On Fri, 18 Jul 2025 01:52:01 +0000, Kuninori Morimoto wrote:
> We can use string choices helper, let's use it.
> 
> 

Applied, thanks!

[1/1] arm: omap2: use string choices helper
      commit: 21e2e1abd4321a220a11c2963ff60214fd73c3e8

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


