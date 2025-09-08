Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C9CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JFsZ9+YKTnrhkakgaIYMEKoDfFk5f5bJk4s8F2eCHU=; b=a+JVeaWR35vyBuFouby5cysSdK
	ul5uLOEHMSRT6bvO206K7gkCdGdLYYjpZNjlBgDu+DtFnNdAZFOU5l3rcUyQX8toepzGbCmUu+QSq
	rPT9DaKe87VTSUdHVZmffdy6KqBvhlau6vQb2LBGPc5Mr4Ov1TPM+BLVTbfKUvrguI59+WHcEyeAn
	ewzgxgC+UvPL7bjBhmc02kFRWrQiNoss487FenXpxyDztBoFap2o7Q1LVGdKRaK9qrbxkPei2XmIi
	Mb3wEt47cFOPlkIRFFS3qvreIhdOJ4tgLb2kHxf0M4zxDpeh535ueR9qHHkFnmFox0t/fxuJFxwmk
	7qN82BAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvawU-0000000H03M-3Xpt;
	Mon, 08 Sep 2025 12:25:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZoD-0000000GaaC-3kkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:13:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so34872485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329996; x=1757934796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JFsZ9+YKTnrhkakgaIYMEKoDfFk5f5bJk4s8F2eCHU=;
        b=RFMX1kQNn0eMn2GyNQaHhqWseVIVwJo2X+S03V0cznhvHcBGLftxcR3X54LG0PDcD0
         qDpz/mObRgseb5upHCCohUYgPlI9gXYVG2WLeNlKUiM1dSdXqD411AzkgHh1SZXVV/e0
         92jRoaEJ9rNpnBMqCjr8G0mzSMflksMvKKKpw/NKfUA+ziKHC9gjdkBLbF5QCz0FvV3H
         LYruNB9FXUNuLichfnsXNVoRimtff91LJAdteqw3PMntcGx+0J+5Tq0JpvUkH0o5bYgB
         lfUf5ZyhzQptNhgKQJBjtRtpr7E5IjwbreJLuD9NhNn57g3c4z6iURgj7sL8zQvXvGZT
         6sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329996; x=1757934796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JFsZ9+YKTnrhkakgaIYMEKoDfFk5f5bJk4s8F2eCHU=;
        b=Un1Sc7rMd/iR5WbaJ2oOgoj6o4qf+6rN8BheGmJk5h8Drwr49NV/G3T27hFc4OOxxr
         0SDkWPQXM0tQLCG7/k4/SoxiGcojMQ36MDAEKZffPPBrIW9SPqecOX5Z4EfB5qBHYCj0
         8lggyveKqLoSuplNDYnWD1esWc1QlyH51TDXMS4WHe6E0QMfRf0XDmbuWQiFpRL7szZU
         8+oeRYheQ41ygeyyQ8iAFWjw/ro/Z3eiZGA5yhwDxLBRR5JFSgyaZcKR/AJ9/8brLgjf
         I95qp5s5vFcSpqMT/wO6qWkXB7KYIW0LwlJHJ7UICk0g3+Avefa2bE7gjirhcuJ9w5Bp
         d30w==
X-Forwarded-Encrypted: i=1; AJvYcCWHplxH9miB/xkGPRq4sDoFQrv7G7ed+f7N0AtAvmF3tvEnGrclmfO783jxv/AdIOnd3QrgdwBPPnyYZ87Txa7V@lists.infradead.org
X-Gm-Message-State: AOJu0YyHsyaDKVvdHZaLZHGG1odWR/aYcjjk2QZ2+k7Zz6Cpq3Dky41J
	AJG3zKxp9BoyrhTuGB/t5at1eVZ+ZxL15W6PdMKIbK9gvf6yPxMUSR2L
X-Gm-Gg: ASbGncvY/ETW8hvExdtEg3N/msnsxcWxHv5y8+1GawGY+V3cMk1j1yqhRv6RJSUKdw+
	Mf1/obHlCU1Rt6XGdsgm/xwG4/ciRZS8R9EebMMAPSlJTO2/vsUg+c0EqskZucKhQab1Z+xY5w+
	0ExtTi9rAEz6R92k8h7wHpDiZTb7y/nZUH5yrKkbRl1t4c3jgcjeBKtaoR4ygJiJlABq55M4Nq+
	PnU7rchbv3Wk0QwRZOY0nVtPlyzt8o+R6B4udpdaj02QLXpzo9/Q3LG/Ry4W+8kmkyAiSuXtqN/
	0zLCMvsnSrC65ZAt+OrGC80f2GQMudeVPuwXO/kzrd4sgeYCeFokn/tJCxtSHa3BWXAfieJFK/Y
	KrYOC7UdpBM91AdaZmfOVE43v
X-Google-Smtp-Source: AGHT+IG5uQOiOoQhJJ/mhTQdnV7nSQkKRpmjvrrmU/zTkJX7X66L4LIULBGIcjgXcCeKAsh4gyVJsw==
X-Received: by 2002:a05:600c:3586:b0:45d:d56c:4ab5 with SMTP id 5b1f17b1804b1-45ddde9583bmr63031115e9.5.1757329996041;
        Mon, 08 Sep 2025 04:13:16 -0700 (PDT)
Received: from gmail.com ([147.161.145.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm141671515e9.4.2025.09.08.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:13:15 -0700 (PDT)
From: hariconscious@gmail.com
To: shuah@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: HariKrishna S <hariconscious@gmail.com>
Subject: [PATCH v2] documentation/arm64 : kdump fixed typo errors (review comment addressed)
Date: Mon,  8 Sep 2025 16:41:19 +0530
Message-ID: <20250908111118.46666-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_041317_932244_0C1B440D 
X-CRM114-Status: GOOD (  13.02  )
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

From: HariKrishna S <hariconscious@gmail.com>

Signed-off-by: HariKrishna S <hariconscious@gmail.com>
---
Changes in v2:
	- Review comment from Jonathan Corbet addressed

 Documentation/arch/arm64/kdump.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/kdump.rst b/Documentation/arch/arm64/kdump.rst
index d3195a93a066..36701262ccaf 100644
--- a/Documentation/arch/arm64/kdump.rst
+++ b/Documentation/arch/arm64/kdump.rst
@@ -5,7 +5,7 @@ crashkernel memory reservation on arm64
 Author: Baoquan He <bhe@redhat.com>
 
 Kdump mechanism is used to capture a corrupted kernel vmcore so that
-it can be subsequently analyzed. In order to do this, a preliminary
+it can be subsequently analyzed. In order to do this, a previously
 reserved memory is needed to pre-load the kdump kernel and boot such
 kernel if corruption happens.
 
-- 
2.43.0


