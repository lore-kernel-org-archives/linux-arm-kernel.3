Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BB2CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=; b=ELAtAi4tLuFEXnFFVDGk8dLoHq
	TXNB+gMIFVtik4zJHh/imBQ2JxMMheeKsMYK5xvmk4ME/qsVm71B53Hly9DmtJ02dYUxuWXyP0WF9
	6GhBX+xdNEUY5KOr4gx2UYIAcQltxMGnmMlsV5vuQAEwIHSnD+OrOOFiMGwAGdlGBbynenxAUuwVe
	TfjEd+O6NFzBJnlcO+URtPQHiXXd7X3JmI4eQKW57nci9y+7KxmuWlN0yF953uNRC/zew75uKpXdO
	CAYBDkFowOPUjOUKgFQDZLsnT614sRAUXIIMRU2UL+C10B4KBY+A4CsQooPnvSazHcGB3eL8DaiEd
	ubuMEg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH9c-0000000C9Qv-3olr;
	Mon, 11 May 2026 03:18:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH9c-0000000C9Qi-1BLK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 03:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=; b=ahbFIdMjcedem3bWX985+v3w2f
	PMSnWzw2m3sApKFtp1HTbDwqswrVHiGEha8qOotfudXiB0Kk9lo/WSQmCJkM4cuyzse0maKe2s1EO
	pcJ3ubgttnZGq6JiT0brYnl06k+GEdOZ2Hpx2VvTThxTfo3IHWYvCOLGJ+bkMLCTk6u3RLZFScTwg
	R9D6oZtcB+CJKlTDHDh1yX+Xd4We7GLQ5JjHzN3yLg3SAWjo3b71uPwDh0aNPxELV6LUxkxk2RSVG
	lu0on42kHVp1tKpT25USJe/DBr1aFwNnq4ajrQoWcHj8iJpRy++fer3XSoSedVAwdq1iXMoJ/Q9sU
	nrgVEbyQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH9Y-0000000AWjS-17u6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:17:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ba856db1c0so25854275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469475; x=1779074275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=;
        b=PaAyT9RTEyUewybFIGkbIGn4nJ+6ZdRMMU7hezTZ6y7XDon+ieFJ13ifcIW6oI+kDe
         gbNw8Fr73fll9vzwqJb+yuDIgk4pGtfParfQimDFCL8hM4fSdDYzT8MxekreAYWUGTJB
         ZBycpLbbe8rpJ05UA6oYGRtKXrFMpzkMlXbUKo8BNJhqzSqYK7hI5um2xpdGX8Ogc64H
         /gyPWc3A82bdl+6/+BxGKXXFa/AGh2Bf2z7bNxRf1UzVvCoB7CPJlAW7m1XJpWM2feUz
         47rReqp+8MKM6wHvFZl/DeoMx8eMXuM83NJM0VR5aHElqEsfYNT/eKM3GWR8eb4WjZQa
         YMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469475; x=1779074275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntOIKo0osG/x65q0coO7qdpXbm3g2+4uiTzmeHYRKrE=;
        b=cjEguTWR1W91P+866IW2RloiYhOH2/KlGudD9DHmrq3Iefg9E6kQlESliX8JXYZ9kQ
         2qAGUPE4DelH2pafSUucLI4akRNseamQWS6oovAN2NQXW91vkctomFWB07kK8m1/vX+Q
         Eh/sFUKaR/5JkDcQIatBPufAMbJ7XPnaRmZgTozl3WvYWZ5v7oCQ2JWxAUTu1cPm+4c6
         YTK2bUlXqEw9xQW+XsC5Y8Nc4wlEDk8NBwFfP4b/FKHUFPwPTzxcDxpXxHYaM/8yjtD8
         qsp+yeOb27Ob/k6pZsM4n8BiKKNbLyr+uXUM671m1ifFMY/goRTzjn3RIleD7H46C5CC
         1LOQ==
X-Forwarded-Encrypted: i=1; AFNElJ86hGpNWv/yrfRH219e608kDpwpagtDEbIMm8FtlfQS1ULCF8QFaNjz8/5WdsjREeKFMdY6EOMJJFQT6AX4BuBO@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmb//IJETuFXY5Ma5aii0JShQVrn32nQC/kHP0smR8zs3SkC6
	/yZr2p+deRt525liGBLLJvj4t0p+w6lgDxTPEF+gd+eil1DirapIMigv
X-Gm-Gg: Acq92OEE9lW/SkgP9fwrbKIfyMNjmM4G4eGXeDoVbRw5YnxcYCSjgVQPsATTsCBlgKS
	66e6rw5ybPm8xHX/zG7WNRyiuu6OuPHyt41nXRdXf5u52zVFy0bRBsF90Mmh6nQydu4zGIB9F5Z
	vIyFvnXJBbzSG2Z0Qmxakii7qo1EsPGVK0CIMK+1gEsR96bbiNtwZDVExYv6iGt1zPVc5ymyn90
	3dLCnjBh/wqIVwwQp+Hw+tN44x6o5q5SL6detbwAxkPX0SCzVktfwm5ClxQOp/BHsivGDvZyNUM
	fo/DKx8Rztr6oDHNW1rRzwyGPw+/PkUAWALbAgIcYViA14C6edFzPNJWALdwa6cZO1VW5WR5n3B
	G+a2oMjfNFHlqVaLgw9mYIINhx8ZMCvstMJJBNhrZlOBoKbFadyc8gUqkHElwb3l840yPzjLT9h
	ToAvfAq/jjx7xF+72TFVO+Hc2boUnm/+5f3N2LMrV5iaMZZhf5GIqSfHrAJ8pf5PKaHwdlIVI/Y
	oT/ac41gCKF
X-Received: by 2002:a17:902:c410:b0:2ba:839e:15dc with SMTP id d9443c01a7336-2bc7a9b46a8mr87205515ad.17.1778469474914;
        Sun, 10 May 2026 20:17:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm90267675ad.47.2026.05.10.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:17:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: linusw@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] pinctrl: nuvoton: ma35d1: fix MFP register offset and pin table
Date: Mon, 11 May 2026 11:17:48 +0800
Message-ID: <20260511031749.32643-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041756_890019_2E956CD0 
X-CRM114-Status: UNSURE (   5.35  )
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

Fix two bugs in the MA35D1 pin controller driver: an incorrect MFP
register address for pins 8-15 per bank, and several issues in the
pin descriptor table (wrong numbering scheme, missing pins, duplicate
entries).

-- 
2.49.0

