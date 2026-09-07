Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5429C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgNVIw8B8D8cs9XgDbUZbP9oPGN4jX1fGCXxaqN5ORM=; b=VOIX4NEjfyrXC6v4WS+E0TYaWm
	dlkZfUuUFnlJHKUWJW1CX3aKLEV3Oxdei7vpPQTIMG7YOgnJ3d9nTIn5/lxZgQAAVsuLfYdtAJXEP
	Bk9V7RGyKkAsjc+CRtVbVVjmYJL8JBN0FNkQZu6808E9VkiNzQPCPHOJhwWkfgxLnkRy3Qmoov+Pi
	bOEZQrcMTqynWc054za3HNWeSwUHYLOW01n8mlgY53kL+eTsqJt7CYA+NLYe5k50ki+nONzY6aS6C
	4FYCmTAKahQkru/CJ9JPy2eSD/3DcN1CAY8rsA8FmOlcucNRkO8S5TRAwD4sngi3lv/cr+GZc3fvU
	ZCWXUClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0f-00000007T2u-0vVc;
	Mon, 07 Sep 2026 17:19:57 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d0V-00000007Sva-1qDc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:19:51 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49564d4b849so13256785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801585; x=1789406385; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgNVIw8B8D8cs9XgDbUZbP9oPGN4jX1fGCXxaqN5ORM=;
        b=GtAd8Szh2jbEfbW7lNnK5ukvhrKntI7j2SmZvswDnFNZAAihNhH2BeRFXMBPYNXxID
         e9Ul8H02UJIK9ApfCiuHtIwUiAtd6zgnH78IKNSlPX74FrKp2vicCmviIikGUxFdoGej
         W7j1n26Hz/sahFBAn25lofIXtXhKldiZ1kyPu7AhpXqq3iRRywlvLm3D5sNwa5hUFMEx
         a9J9pvUY4z/TTJEKMaPh8t74YG90ZRCcPoScL3fmGk8O0mqxowStirTzeTNT2nAZ8Wz4
         bZe7vB8GFQpEICQfcEkbx4JfneqL9ZC/nPQLca3bDaMX6nwhw7STgkAuGZSPfzABHpBX
         WYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801585; x=1789406385;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgNVIw8B8D8cs9XgDbUZbP9oPGN4jX1fGCXxaqN5ORM=;
        b=memDd+1N8b9sQeznTzD7J5JheRYXq4LrfxglpTVJdDY2usPjfcaW2tCEpVCCAZK1lB
         opvmznUsL1gaFflwEnhGobJsqKxtamjCYhO1nOt5RuPr8Y7v4sUEIJlJq6x7kbHkBZM9
         iet2lzVYsHER6HMe+md+6DQv4rNi+qsIV4vfr3KgGJCC6S42WOzASYwL5KromnIWF3PH
         gadHst/GnUWdzctC7/rcb5ehN9Dds82BPZtZi5Z0473sXjar//w7Pms/ft/r72XCyVhI
         5xOkb9JoC22ZBH0mYGKqyw5lUo8n+AqF07uaAmkusldow7baSC0uM4D+ZVZ2tlESyiWY
         S8SA==
X-Forwarded-Encrypted: i=1; AKwUvBzt88gdSW4qUSoyoQPqlQJ9RaNcWqEGad9orcbWPnFLin3JkySXaJwm4Gy9v2KiWk8Zql5kolJS/0lQlt8w4R8d@lists.infradead.org
X-Gm-Message-State: AFuF++lef6hdFpdGUb+DrVvPl1NzjClBNtePNSFWqxOsf/elSN61NBk+
	UjpAldGGhhASdDXEzJQu6VOrAluDSM5cOaFhkPeshxyMl7vZUV2I7DeTH88SEzRdVbsusTlAJag
	SzXDzrgYavy0STFAqo9G4fdMgKvr2QA==
X-Received: from wmbgx24.prod.google.com ([2002:a05:600c:8598:b0:499:bb2f:becf])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:864a:10b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49cfc8960ccmr150937795e9.5.1788801584621;
 Mon, 07 Sep 2026 10:19:44 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:28 +0000
In-Reply-To: <20260907171930.4037166-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260907171930.4037166-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-7-sebastianene@google.com>
Subject: [PATCH v9 6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_101947_480830_A3E4C041 
X-CRM114-Status: GOOD (  10.36  )
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

Allow the host to send FF-A notification queries to Trustzone and proxy
these messages from pKVM.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e11fb06df63d..2281ac2e42fc 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -694,8 +694,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
-- 
2.55.0.979.g7e5102b832-goog


