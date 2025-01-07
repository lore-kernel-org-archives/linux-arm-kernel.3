Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5CAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=; b=r/mew7Z0f4JR4XxYvLGkqeU8HK
	T+JdMy3/qJMOyIgfwCws4UxnhfB/Xq75wtiidnkUWPtYs6UMSBkdExuI9q6S0AsFH2CBuCXzPmjN2
	xvhfzlsnchZGpmdutCUi6ALYPXGcEnKEX7R6ekuQ2cTqYBc3sKVJ+WAZ5wpdNTGA+Y9BD6XrjldlQ
	anVOgc4hhquudKlAQUYHNjmuJWV2nJwrlupdKeF8GPl166bGN9UUmN7wApg49zpQ9YNwlgcGXaJdf
	nVPAM50DyjeFJVrlSmsLkwf5rkZ9q6rQtvIRm3h3mDsBAqti5MfpcVsoVKh9+6vhSh1m0GnmR7ZIT
	itTEX/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7wg-00000004bTy-3Kcy;
	Tue, 07 Jan 2025 11:40:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7r7-00000004Zp3-3v6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:34:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3863c36a731so11833039f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249680; x=1736854480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=;
        b=NeNYZ86ON7ELx8paxzkETWnjjo/XGkAzf/DTluF7MxFWuzw3g+zFR7UOA3Tc9xDvx6
         F5wXlSBx/EcwRkczjClhXoJj5nrtiigy5SRe7R5xZBm5v/uKykiQpSjsKpltL/CfjzFd
         HBCqIi3eS1Sw5ZmowSv5drSOPBqzlqTLnndp5b7306u2Q0qltQqzYtwRJebzZbiNOy47
         1tqbNWBJg+tC/4XjWBptbd6Zm5k+X4do0i9qF8bVG5aZU1pNgLYHg63Cy60YOENHkoES
         AqWIokzdwwk/SQoFJ9t0qSjSovZH6Pc8w/yX4F5BnOrjmt4wzwWMZn/tka/f4bN5XNH1
         LPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249680; x=1736854480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYKAYFSavL2qrh7QKasXIoDw8tHxDZ9ErXkuN1nzLXI=;
        b=X4PXsrRDstmNSQQkAd+odkx/aHeHYo05SeueL0voUH0no6GIKjbUE9hw5CnLBU48C4
         MxJ4TYagh0ItO4PW5v8rDCYkqLKLGD0x9aYDC1ztuUC1RkhwTgeG2Z02XUt4g8g+Vy0t
         qEawYR4gbefDHEFkFCGfwl8QOi3BAlYvAXwKjKzIDHzDn+GJnOlpm9cbQEqv3kKBVMBZ
         bmxKoT+30irbOpWNROfqkGH9Bcl7TVInAw0CqIjG3ZYbbRoOmb91iZV9Fg5eKImpEuVo
         0e5Fn1jhbsI+D8qoweaM+A/53t/JuPP+OrUdviLuJb84bWRXtNMuag2z1vHy9b15sq68
         yQNg==
X-Forwarded-Encrypted: i=1; AJvYcCV044PovMKuVxDhpCZLs1Ja9xTu0TBfoyYEbN9NhAr9XMKL+6A86mMPa56BAu//3ffoT0bFhYvdQzuu/ypFUHB1@lists.infradead.org
X-Gm-Message-State: AOJu0YydEbvipEjmTMuaZi9D4FnwWr/suIMfSP3lFZS7BCp02ozFMjoS
	cO3b3h2yXcSW8uerhqy1Iy2qJ26TmzRb7kqhEqh+YXjHwS7u9D+v7NUKFr+Qdk0SdkUlBuWB1rY
	x
X-Gm-Gg: ASbGncs4U0jARoAJ2SY3NTiemPnzmZtE8HGk2QWZsUrYKvu+KvQPV2ThzQxjNYXEH4h
	DKeUBoFZOU25pVFofzGJLV0Gkhsnjh+Ieil5qSN1nlh+uZa/52QoNrbAWp78Y0ojfwLkEIj2Jhm
	xEHqxzTiTqypvvgjDlgUSeVDFbIL7ZSIuqLW4pZZ3TG88klJKmbnklFXyh3kRWJm4OD2Q+XOzKv
	ee1Y+chjx+dbgEH+1l7kR+ZxIPKox9P+PrfGz6/+qvZUOINGUycklVf
X-Google-Smtp-Source: AGHT+IEWzbMoPmYqwdpQNkR1Kz5LG27JaD30WaVdSux7OQkOmE0VOl2PoerHtsX2D+CBixf6WOUzdA==
X-Received: by 2002:a5d:64eb:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a221f1fddmr44591980f8f.23.1736249680458;
        Tue, 07 Jan 2025 03:34:40 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:34:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@arm.com>,
	Mark Brown <broonie@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg file should be sorted
Date: Tue,  7 Jan 2025 11:32:41 +0000
Message-Id: <20250107113252.260631-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033441_969014_8A6B5F82 
X-CRM114-Status: GOOD (  13.52  )
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

From: James Clark <james.clark@arm.com>

There are a few entries particularly at the end of the file that aren't
in order. To avoid confusion, add a comment that might help new entries
to be added in the right place.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d22..4ba167089e2a 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -48,6 +48,8 @@
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
 # item ACCDATA) though it may be more taseful to do something else.
 
+# Please try to keep entries in this file sorted by sysreg encoding.
+
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
 Field	31:0	DTRRX
-- 
2.34.1


