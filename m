Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9229DC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=; b=0b9fEOU6aPL2crxw6k+N1JgBbN
	wHSDq5wSNXsoTJ+eYNnWiVOrZ8TQYnJFxLT62I8rQXTE4Kv9xRoYMy5K3MTvkpEIJybZRLBIxoKkd
	saoAZ+g92Vj2OPE8wpTe2CCcjtWUcogmI20SJZAjb8wGZQBhabmfGZJ6waRWdeQv2+g73edVnZWVf
	Mvb+7IaqsQ3yiUktQzgZV9p3foUYHgEGKE3NduPqvtEdi4gyfRNjFyPVMDog8sgkCQIrbOdIDQRbt
	q5nELbz1VJULzJ8IBFVLZtuv5LaPxuj4O8ILaqSTsofMESXN2WO4okD8IikS7/yKsb9jDqqJvxG9S
	jVVXOCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLp-000000083cj-2zuu;
	Tue, 08 Sep 2026 05:26:33 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLn-000000083bq-1XsO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3584120a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845190; x=1789449990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=sqNb93V/Ufoy+nZGJOg/UURnWUY/9R9jOhMD558o365dXO39Q3shJKqk2OIBEdul6P
         dXViTQ712Xjd2kz3g+uW3rMqM6sJ3GkRjB7YxfB/01pLlmqSZ3BHjSwOfdmgL5+zIknV
         sA4p5vYK1uw++fX181+TGXk88PlrHEZ0ZlKebm0XW6vVrNEq28ORLR83qeukLTn2QVvC
         6/zpp81tn/ADoPrRmp0oQFYUx/00FmfHv0osphQ3b8kE71NRjkMSK521pdKxLcFFRpCq
         DzxivvJLhjuqtUarNqrSJSmHzCLDoDV7/k4gd4/vb3rG9MKzmUzYL8Fqhk5BwYMUDpTE
         V+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845190; x=1789449990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zu9iHcXdizDpFWecT5UwdG94ytd2R6b1yXHPwbk4xyI=;
        b=HiD5O0b8BvCuM5c1QF4PZH5HVElfAfmKIk+eqZjeQlA2y4O/4I4QPvM38iLcdmcffu
         uVO4m2Hj/zNLwWUcRFCSwYrineZm3175+ROQ3P2NPVSKm0nwaz7gFyOXk9SrdZYPM++D
         o5ubsebfxwyCiglGbjTbtbSHF4i6qUwYu5hNKygjQ4UFDwa3FycJGm7Ditn+8TriorcP
         KsOiKTebBIVysmfHdAfnFmnv86ToY1Q6zoP8uSlUeyS/krL579u0dU/JTljWRwpmkBhE
         QvbEfhMqyUAR5oQgH7RhUIHSkd7T60iN0k9rphlOlBPf4KHiG8V/6O3qmsiEKT2IwmmT
         ehiA==
X-Gm-Message-State: AFuF++m3THt9EKnnzXXMLID9ag4ZBGBJMmUgxnMqYuD7xGGo7qRLTY22
	Ez1yaZwZk2xHnDv3VGUCwPPXasfXprGUik3ZLmyPRmzMDriWY2kLlhGB
X-Gm-Gg: AYBFou1XnOcK/DJpp22ED8gURFZWqJm+jZEthJNkzL7wZJ61tyqYvMDNnfqWnCTGO5W
	HFowpz5JSU8iYgIb5ud+otlq8bZzWi71TXEOUeTyikyhlH7vUFcLX6Eq4Fofg9y7npwC8xSfCMA
	eXdKfFTXigufVGMaJ5FHb3bV9s08yWW0laKvIg1EHvzGs9usmX/yWWJhMcE1N20no/UN+kRxx8S
	PFwjtp68T4C/DgTEmv7O4NhMeA9SNgyOubqg2GKB+G/J+l9S1E5YL9DERl4ETTg2ABG85HLAFyx
	wBaxdhLI4jcR5C6DhlR6KD4Fhtc8ZXa0HagObj9vTDjaOmV/Z05Hg8Js6DD2YEDpDXdkVYkCpUf
	1v82SJeTq5omZdv5FiYZ+EX66ryhc/hjc0s7sNpXhEYSsFW8Gz28q4hxzzSUSoRV0Igx/SPuDN8
	NtFYEBO0qYYhzDihEPcr6ZvdoBWV4LdGOMdTUWrtPqpMCV/CQtEmR657WQc6CnmmIXgc08yczl6
	TOf8LtTAAuYdQ==
X-Received: by 2002:a17:90b:1d45:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39b262995b8mr40136940a91.25.1788845190456;
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 02/10] selftests: net: fix repeated word 'use' in comment
Date: Tue,  8 Sep 2026 10:55:54 +0530
Message-ID: <20260908052602.27497-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222631_412811_AF934A0A 
X-CRM114-Status: GOOD (  13.05  )
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

Drop the second 'use', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 tools/testing/selftests/net/xfrm_policy.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/xfrm_policy.sh b/tools/testing/selftests/net/xfrm_policy.sh
index 3eeeeffb4005..6294e49a46e0 100755
--- a/tools/testing/selftests/net/xfrm_policy.sh
+++ b/tools/testing/selftests/net/xfrm_policy.sh
@@ -242,7 +242,7 @@ check_exceptions()
 		echo "PASS: ping to .254 bypassed ipsec tunnel ($logpostfix)"
 	fi
 
-	# ping to .253 should use use ipsec due to direct policy exception.
+	# ping to .253 should use ipsec due to direct policy exception.
 	check_xfrm 1 253
 	if [ $? -ne 0 ]; then
 		echo "FAIL: expected ping to .253 to use ipsec tunnel ($logpostfix)"
-- 
2.48.1


