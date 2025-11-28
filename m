Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CC4D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oAfyF823/XbGGGKg2P6nxUijTsKpVqaSaPrfyNHwf9s=; b=NjyOxz6QpFrXY+MSIO43bIYVil
	tKpPMqi7aq/dGgCWRD2Lce1Z/wMzUAWyEYGnjz+3z863Cxz0va3L+qlFkApKH3vY08zycNjmgYJp2
	QN5J+CcTfB7U7wiQg/jpIfeJiMLoYc4vAnXsogn9UMkdJZ7P/TXPk6VJ4vNNbO85c6AU7dePRJXb0
	GANUO6NEPNivEZgVwcWWkj/KUMrOxTrYia370hDG14E8s0wwslwLpr9ucASCY19jJOEcr0XzRfpLS
	tE6dH0lYqKwHIiCBJmZN185H1//O3dwQWRrybYuSPlZUV7ms9yb9/EukJWu0RwMQ6R8eUz3pUGdKN
	ykCv7M8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2dq-00000000kY9-3Y5n;
	Fri, 28 Nov 2025 17:52:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2do-00000000kXk-2glH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:52:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47755de027eso13868735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764352339; x=1764957139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAfyF823/XbGGGKg2P6nxUijTsKpVqaSaPrfyNHwf9s=;
        b=LFDh5403D54BTYh0566ENIKqPWMAVYFUwojtNwcX+E0RuSHjF/+1uMvE+C7llJ+4p6
         JT3saklniDoNxbtxw9WFfEcodqoxMGJubY3N7yrlQxE/GLINyLnzrwRdO+5+C1IoxlRr
         YM77TJiPm7fTaB9zH9B7ttXnQGrenoAFVzu3Mze08R/WBFBGUh3i7mjlUSQHFTzGesK3
         0lmpKzUhXn81v8L1pPv2qTYzNhFFn6BS2muF9M2gAtsXrAGXnV6aHKwgLTDnngfpNGkc
         Cv6ILZ9hU3KceDw7R3nabDMD9eO081bHRNRX0dySzcC85T4qFkUtYG6HX9icdkfL3MPo
         rzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764352339; x=1764957139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfyF823/XbGGGKg2P6nxUijTsKpVqaSaPrfyNHwf9s=;
        b=UXea6cOJK6vLRyW4UbUnHoga3mYaaHwFWJO9uPQOuo+Y+hK6QwzCNwtDZkSUKoaSWO
         bQ030Y/ikkYIDrJybDT6dcgiRjpXR0BVwX7kcfNGF4lSBiY7m/HtygaNclhZ7gbzQFs8
         v7G8rmLjJj/lMrMh3t0sYAV6eyVNZZBrmhsA4NJ2LMTXjIWGOuQuM8xOwayxRWdyzyRX
         Dv4Tl/HGjc8MSAVqmOML1W8LQh68BhK5Lnso1fd1bOm7qdU29JvahwEZOEHT+cHh2x9V
         w+TEYkVrWQbjwfFrJXk+a8MiwKCVHJP4esD6XaTFHRqxixWZorgmQTEzwPGMgsiwImeG
         Ogtg==
X-Forwarded-Encrypted: i=1; AJvYcCVFcumKFUKzh8ZLoXryx1RlymuNRW1NmNBlS6ZqA40SQUacxGRI3guAzdfqjAUGUvYmS09ojxjhdivVpo8Yso0M@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ+b0hwR2nbnv8qjyUPimVG7YrLVIdPpUZCYcgfiC+xkht1Uw4
	v9NPCIj2HeXmCVUlXn0yXdy7IvcRLMNsrXkaJEM4rDrSkk8MuHSXZ/lM
X-Gm-Gg: ASbGnctVUobJ5tAz06RiK0QI1IugEAr2XFuGVA0313igG3FGGS8HaxKtmv3tqqaJDn2
	mpPI5n9fKAPC00kzBlHx+huvIordtkGtCYGnUd3U+32j2OQ3o951LPN44AfehoOjSNepg7S56D9
	RU6cdRtWpPMhepwE5sflaCrBXAZCq/nfLZWup8oQWjnJoWIl6yqd3kvRgLH1d/NxyLHr+DeIoVg
	Knh+ZYXUQBShzRqwmw3Xg4QDkzWsSCbUp0ZjJTNQ/Pepf+k2CMDd5hQf8VdBMFIgMkcWDpL7X7x
	BIggKI6fYpbdudDmwDg5+GQJETzQQJPMHLCATnXf0CHZUN56RtGgNaQObmO6WGDDsWZArFxBSKJ
	4tCTglQNpr6oiBfmHDBXjGFr8VaIC62xC4lk+/EjwI4ezIktsbGDBZwpRkYdir3JUwz7tn71bqv
	nz0sE2Ie+jHg==
X-Google-Smtp-Source: AGHT+IFNrav6emQa7eo4LXuc9QahSL2PszCgaxJFgT0UH28eKJZFTLEzFFZCoVSa6zVdulqINe9u9g==
X-Received: by 2002:a05:600c:4e8c:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-47904af05b5mr178200545e9.15.1764352338440;
        Fri, 28 Nov 2025 09:52:18 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47913870b38sm33438875e9.15.2025.11.28.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:52:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] KVM: arm64: Fix spelling mistake "Unexpeced" -> "Unexpected"
Date: Fri, 28 Nov 2025 17:51:24 +0000
Message-ID: <20251128175124.319094-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_095220_707751_3888BAD5 
X-CRM114-Status: GOOD (  10.70  )
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

There is a spelling mistake in a TEST_FAIL message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/kvm/arm64/at.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/at.c b/tools/testing/selftests/kvm/arm64/at.c
index acecb6ab5071..c8ee6f520734 100644
--- a/tools/testing/selftests/kvm/arm64/at.c
+++ b/tools/testing/selftests/kvm/arm64/at.c
@@ -137,7 +137,7 @@ static void run_test(struct kvm_vcpu *vcpu)
 			REPORT_GUEST_ASSERT(uc);
 			return;
 		default:
-			TEST_FAIL("Unexpeced ucall: %lu", uc.cmd);
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
 		}
 	}
 }
-- 
2.51.0


