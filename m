Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFFBCDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=; b=IJf1UjYNo7JL5U0emXvYBdluSl
	fj58XzXeAsdB9ibCTHIsq2jLj0p3dp0YjDDzTUZeJcb5UIKGqoIlefgQApH01rBpUZhPqRvinqxRv
	zG3PDtrb/vn7Sn76ZhXqzFGETXom6cE+l2WgJJV1pDGj77KE59r3/uh/brfOtHoNwCi2fHHQW9X03
	vggDBtlxQFHzsdmB39qPFvAjGXwMf2mh/UtqbhwwcVMM+nUt+K5MSjb/U6Zikc7lmYWMF/4rliWWP
	Yxp/9Te67CVWEzuGwKSHMxKtjkDTTVirvYFdE5vmNkqAjus4zPQvn8WTJfVa1NCmTSUgVM9Ylwc1P
	CHVEcfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GU-0000000Ahke-0DWD;
	Fri, 26 Jun 2026 07:46:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1GO-0000000AhfA-0Tpd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:46:13 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-469675e37e8so346985f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782459970; x=1783064770; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=;
        b=Ay2Qnwgq1mOtQ8A2j51AErdtBL6alT/vzdwQDPNhMVYn+6WYQ8rmmlQlXTMWPujcpF
         QQ1jJsqrxmfGk76p2JU3Os6AcHfi3S1f3hQRwFkxcX02PlLId9z1AeMYfHTX/4kT6Hyy
         8PQEVPVDBtfkCX2MSuTdGRfEZ8ExXKwtIB/oVdTMjFwM0et2RUV3a2bARVpFtJmaAm1A
         PcH+PX7QkjCZ/U0RO/aIpgbQNlCEieYAETTt0UxTqoLomtjt36LvsHU2ORoKEK/Qw4+6
         5Fyqh8STfLKlzj3OV/EZMIXqWrnleXBUrC2G5U+4TLpiT0d5RIDFdhie8PTzDVvbXpVz
         X0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782459970; x=1783064770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnfFrOcHXwa5bmm+nV3SBHa/UP6ZPQaBfRpC1K8u2Oc=;
        b=ZPDLv9Arc/W4oFS5j3iLxkhjfHvaQhLFVeIyD5T7e0sfv+bxCalh81tkjtxjgTeweY
         hFlrg9CuytsfzaVunSCYhpu5UtFXWTuLXjw82oZtfsaMG8A4l6uw3co28hW+6P2VU65z
         HG1aS5LLKcIO6j/+6poSwkqUXbNR+JODAd11QVGZvvvhiQGPPt8zrmBBuQ+al4b28qf7
         ROQYzoiQUDIxAkBpLlfKIz6OgP026E594/VjhxRXirJj0B50OCoiSDpXXlYx815CFhP/
         lPJQ9+AZtmdAencDHiY/GgpJMko8xYM+UCu932Muswi+STnzxAZREVo7gM18lig8Iewv
         tMuw==
X-Forwarded-Encrypted: i=1; AHgh+RoMU/cfslCqH+nI+yGqU1U4cRXtYLBjxABk5y2jv4IasCidAMWw61sqVtt0kHaV7uRvJmfVUxWLLa+VHzzfnyJb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5FeRJO9NtCwSFYAvb+L6ivkb55gAxznm1oGEWmz33apRfyvQM
	+DO7CGRDntKFAIdtXyhGBUjjc1KMJcZeH5/XKx/wCwBzyWsL+zif5hKiSey4VOxlQvVLX1yYVBy
	gmrhY9vjjCJp80+pegv2SHiJJDAuBWQ==
X-Received: from wrua15.prod.google.com ([2002:a5d:4d4f:0:b0:46f:90fd:5da3])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4688:b0:46d:d693:88ca with SMTP id ffacd0b85a97d-46dd6938909mr6707494f8f.45.1782459969666;
 Fri, 26 Jun 2026 00:46:09 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:45:44 +0000
In-Reply-To: <20260626074545.433234-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260626074545.433234-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626074545.433234-7-sebastianene@google.com>
Subject: [PATCH v6 6/7] KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004612_160258_1E72B4E5 
X-CRM114-Status: UNSURE (   9.03  )
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

Allow the host to send FF-A notification queries to Trustzone and proxy
these messages from pKVM.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index c22fe4514741..712811e89435 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -678,8 +678,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
-       /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
 	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
 	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
-- 
2.55.0.rc0.799.gd6f94ed593-goog


