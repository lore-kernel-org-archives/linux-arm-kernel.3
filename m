Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677B7CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=; b=zb4sL1uxnVrr2nEoCboAEyaLJ3
	0XkYwtn7U7cnl2Hy4zh7iJOQ/qDK/dX+2x4F0PpcYuxnAkb9/LpP6NC63B7SKII29yvLaB/LFlJY8
	YsuwVrEhSaUc9m5K9vJ9GqwgrxUousvPQ0qyZFXCPQf0EVtL6A8GN9T68KVyJLcOJWpismAfe9Idh
	UwmJeQfZEKV42/4224PnenRmBs87TUfpqAtUlLit4WknvbEwD88/ZVc41+CaQNW7cCyr062taa8SF
	AZ6lsbRISMbMlyxP/7nNqFgGqJ/TV0p76Iy81seLl/gvWmKhszE/mrdtzSWUR+dagw8Yj7TKKmgq0
	72I6LB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPuq-00000002jfu-476y;
	Mon, 08 Jun 2026 02:40:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPuo-00000002jf7-1N1C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:40:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1945347b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780886438; x=1781491238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=hFwRFTRh7vuKCGbkIDph7z5xtfsD9mCe1KrdlTWUSvmKSvvOcF4yivuDd4mSvRgqpw
         8NsfK69N0EKe6EZcbkpUQXNdNcG7ndUHNntUJ2tQTPTWJLczPobCPF+BBGlfz1tjjabn
         KU//N/nguYf29J2K4lQn1NGq9ne1GvVoavgCJi8Fc4icHHzmhq9uvSIOIGT7LIZvFGH1
         zODCZ5GibNeV2TFNeBULad1CzCxlMvb26U6UTBgHWjU8pGeBis7j+SVJlE5uQT9GdVVb
         CGpc/E+iQpmQx1pCHTyIs+oh2Xg2NroOEvD+VyCeHPrc4MlCBAQc1zKRsJLdJ79khcZH
         fvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780886438; x=1781491238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ctvKOED8Rs2Y8iHtAz2kdUCrMqrD3cqKZ8ykp6Je8z4=;
        b=C1lCKMoApGNUmgs/T5BGA0cHSUxPZt4ZSberLPxzZp2Y4+0+QyE3mfteuauoLChl9F
         Cxu3VE4Ji7ppDcPaz+/D1pMKAJ45ZNFSZdN7f9XMBuTr6W0NwbsJVmMSSmLwpBtBWEil
         /Z7/MxBdTHxwClI7iPn9akzJmiuG2k2GXB7vW4ACGFIbWTiK9S436xFKJ76O7tf8xNW3
         HLf1MKSxXGmoqf4/l9pLgQ3+0Uk60MZiK6vCwmnJ18P131rAVxyV/SJ3zpWzji/UrSZH
         dDVL8je328T5gHwV2l2FRNW9SkcwtnZUHO+WHE74gzV0qx32t5DKaNGaz9h0lBh77cav
         UWFA==
X-Forwarded-Encrypted: i=1; AFNElJ/GYCsOoFIwzjcmV4HelFXfoILCxaJfRjeJaZfdUhdY0Q7T59rWddNMGM/nrqf49ODdwllPA5jkTbLY0URSBgln@lists.infradead.org
X-Gm-Message-State: AOJu0YwhFNqKEZTzlAAnMGaHwSaP1nQftB+dEiDNaLwLKiah9qo49Kvd
	ilDzCZ2BCpdO1q+neu/51dVsnRkJaTqaAwZpxY/MFc0n/fNjUmywTADikNdbmQ==
X-Gm-Gg: Acq92OGDZIY5y/jA7BkXt4Fugdj08AOgR1K0rySymnKZ1jOrxir8aPfA13y6wxDGEG8
	aQsQCHsvJpvlEpeKGo6wsHdDwt6k8gc1RmbrGoSZppmJ5k1A1oEVjrRnNs+dqzDCsLoQFdCrJnh
	cnBtoU8AZmJU8nP1zSoLfwySUzhU+o1Re+uWWIhGnkHJDwHfAz02FLiQp1uBSC6r1+X5H0BPW2B
	4RQLc93/6qNDJ91ZTWGSv84FbhayS7tAOiDwfcZDOV4A2X8+NjJ7pe+6s2dBfT9L+0HCU45FSzd
	nad3wZPDWlXVfQ1tZrvcPLDjGNVv9MqGlS1OR9s78CNNX4N4CUSd9+q8qo4QgaBdod8FMaxxEKD
	eG7DFvKMygGOoBAJZbSs4fhZMxNgO08j6tn25rbwndVGA8gZIclTzCTLJP4+Srs5JBg+8ucdLNJ
	BheUzEbFunOguVWIEtIhHUWJyvweYtg0MuE2lU2AUSu2NowhY3z+ePtDns4Cc/96/rO9IXRJ+CV
	g==
X-Received: by 2002:a05:6a00:1994:b0:842:2efa:5fac with SMTP id d2e1a72fcca58-842b0a84dfamr13614984b3a.0.1780886437636;
        Sun, 07 Jun 2026 19:40:37 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm19310520b3a.26.2026.06.07.19.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:40:37 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 08 Jun 2026 10:42:08 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ventura2_initial_dts-v5-1-37ee5bcf58b6@gmail.com>
References: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
In-Reply-To: <20260608-ventura2_initial_dts-v5-0-37ee5bcf58b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=J3z5h5jN99f1BFk7jnvt5xoq1tLRgjc3X0kRzaksvsA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqJiwEHsoVl4XOLzeORZ91RcLER02EI4M9I/iHZ
 9PYK+Fuq8+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaiYsBAAKCRClg0K3CVbE
 gbRdCACPE3XhgkbTVANCrtQpf2oP0lX8RvR/Vhcd6UN7TXYrajkCg7mmzR+0rYrPKVh2vJZKo1i
 tsQxFq2BgoJMTuWQPfPk202YQfqyXHM5D+sL5lN+/GkZO+z+i4sYn7/9QD4CI3xZZdYsSDpLS9x
 YdDQFBsHiU2IA6yAxK4abG0mR9RJoS65tafdFx45hv52vug+S3UajteRji1GOS6eElc0jOb9ICH
 aMpx9wbfKzQUFFQDmH5SKXNF7y8tWMWPRHuONs0BUsmp7iCcMc/P3KV8xIWxc9ot+NQwUAAf2Mo
 wTKdD7/sMe5RSsjdKuhp3YDGeMnNiO7KyHJwv1p7VxnsCKTw
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_194038_371215_4B1E9D0E 
X-CRM114-Status: UNSURE (   9.09  )
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

Document the new compatibles used on Facebook ventura2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..d48607c86e8e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura2-rmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
               - ibm,balcones-bmc

-- 
2.34.1


