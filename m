Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1997DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/6qIpnhPVhhfHCgsZiPzBiGzVmZr69CeS6pHxnA2to=; b=XjwipotjBBcSxD3BubsRi/WQKN
	DzV7nAqIKSeiGPEqfPGSa2ii4A4dRI99ptrL33lDwwsvTeW/RjzbAjxwZ/e/D0wAOpVTFlYyLOF7q
	eVN6scyDSgW8xqea1MVs2+imGyMOKjHfM+eRZ+SjpX8fwPVPIXvYiGkY1Pm/KvVWwd3Gox1GbrJhQ
	NEpRxQy9N9O9NE0J3xer3/xEC3xA2OPp3XuHA6QUjymyZjf+YZRH7/A+oMvXYWlaMyBty9Hzc51Q2
	XBwlI0kKuZSros6k/9MNshTwWfOQ6TrxmhxBgSedCZKyaxGuIAMbq5iTz5DY02EmiwUSRn7R+mGXY
	vfWWY/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weISN-0000000FQhr-3PpT;
	Mon, 29 Jun 2026 20:19:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIS7-0000000FQbT-0cNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:19:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37fad5eca09so1578348a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764374; x=1783369174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/6qIpnhPVhhfHCgsZiPzBiGzVmZr69CeS6pHxnA2to=;
        b=DZRmDovDOcGNJJgsLLNsqVsbq8AqNBlZ6PJqURpf8mUx18bIiwZIAncdqjmMHr/bcp
         P/E/TlN5FiSvAWYxHp5jB7kx5uULBO5ea/E/zi7UKpSRq0KULrmu2dmfeXwrtLMyLNYC
         c5jcuezpRxD8Zf7bZg+3S45U+u/KQ2GaPuXdMO+dEhYcEEOoxf5O6S6XZf8A0UlemX17
         LVR4X11Jimb6b1TozH3pnhXvYonXDIJMbEZxL61fRsIrKIsfgABBHnPfUrmcCzq2p15/
         UfGgdc7DYdYuwYMDwdLU0r8VtlbYx+yFJhhxxh+K61gutLu/BHOeCCt4KIKa5121m6Be
         qTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764374; x=1783369174;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/6qIpnhPVhhfHCgsZiPzBiGzVmZr69CeS6pHxnA2to=;
        b=MASp3fa6qrxjdr2odh7+KDr6iQYWltLHK5iGb1mQ6Vge/yXQKqb0AcJ9ebJ85Kj8tJ
         GkoEAO4BeuAdoapUx34bTsdIPX5kxygE5Th5Hdr2eD7hI4vgh2ZswSLhVQtR2ipC0QYA
         l01QNE8wFvV8/RFZbQwnmQQsk7eB7+Of+ukM5EttqfwIMb+9K6amLSl1ulZko56V+VDc
         H0Lgj8CXoxGXocWLKHj78WM9fgrRel9ToxKdzSvDsCNaa9/h7Lzy3C4/fEoqfpRypU+v
         8/2sP4jMGUjQPVgCPvZcgYEujQbg87ILErC8WHrGRbFvscsp63qSIXDZUaL+TWPyb1D4
         tuYg==
X-Forwarded-Encrypted: i=1; AHgh+RptoS1uPMPbC+FHUml6Q/1gHCHAKRfPawr3jUzBDYw8cN1DshTQpSt8R08DcfmxNlOqn6WP0oBXZrUbLKd1Vyfx@lists.infradead.org
X-Gm-Message-State: AOJu0YzjAOuwj08sR+X/aRtSsR3hOede0j65ycsU2q7XVUEz7fuu26gO
	bHLOuBvPY/GSIwDzpxyghmZjg/vAkD0FfvpuDJ4rrq8+huiSps/m+qrNK0E7G/3rbc2rw3Q1jgz
	tkIitnT04RQ==
X-Gm-Gg: AfdE7cljNAoynyrX+L3LBkkzpmAzu4sfi3RvZcnLZniW2UJqh/lhIsYTOg0szDyTUEE
	iH9ksZYD21Xr7fPcjeONUuGCvR6ZhfkeIrLEy34YKjiyG1L8Hux9UzquBl5bU2dHj/69mmYiif4
	9LkD2KPytLiz1jHXrfRNqKEQoUDt6phjCT9u0QhvLGuLedJMu7qgAsQXFv5kIrbELM8fh6Oxpmx
	1nTFeniC+J7eesneHFCPeCecQOzBXE0Kt/6DQDjwPv9oEuRv6zPbydYbaf++u/J1mNsP6ONlxhS
	4rd5Td9Ic9HTHt9oUz5Rfh0UzYH6ZdD9MkFYcEKFsDGvo0UeAd1hDY316hPIKeYfNIV/oJLpSCn
	/WVJSnlQ6OcMqm/O4I7Y5PMnHa+L1Wd4yqmMg/ot8uLrREvG62ZrDPKYKkUuDcF5xe5/MU7vXay
	2L8ulHDqPZLqcxUkZuHDyb
X-Received: by 2002:a17:903:240e:b0:2bf:2ea3:af30 with SMTP id d9443c01a7336-2ca2e43099cmr4771235ad.4.1782764374247;
        Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ca37a7103bsm126315ad.14.2026.06.29.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20260616175152.1373709-1-andreas@kemnade.info>
References: <20260616175152.1373709-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable things required by
 iwd
Message-Id: <178276437349.1055800.17884672250163835354.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131935_208121_9F8EEE7A 
X-CRM114-Status: GOOD (  10.01  )
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


On Tue, 16 Jun 2026 19:51:52 +0200, Andreas Kemnade wrote:
> Several crypto related things are missing for opreation of iwd, turn
> them on according to the list being printed out.
> 
> :~# /usr/libexec/iwd &
> :~# No HMAC(SHA1) support found
> No HMAC(MD5) support found
> No CMAC(AES) support found
> No HMAC(SHA256) support not found
> No HMAC(SHA512) support found, certain TLS connections might fail
> DES support not found
> AES support not found
> No CBC(DES3_EDE) support found, certain TLS connections might fail
> No CBC(AES) support found, WPS will not be available
> No Diffie-Hellman support found, WPS will not be available
> The following options are missing in the kernel:
>         CONFIG_CRYPTO_USER_API_HASH
>         CONFIG_CRYPTO_USER_API_SKCIPHER
>         CONFIG_KEY_DH_OPERATIONS
>         CONFIG_CRYPTO_ECB
>         CONFIG_CRYPTO_MD5
>         CONFIG_CRYPTO_CBC
>         CONFIG_CRYPTO_SHA256
>         CONFIG_CRYPTO_AES
>         CONFIG_CRYPTO_DES
>         CONFIG_CRYPTO_CMAC
>         CONFIG_CRYPTO_HMAC
>         CONFIG_CRYPTO_SHA512
>         CONFIG_CRYPTO_SHA1
> 
> [...]

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: enable things required by iwd
      commit: 118c9c57c9a4b28209489521da229b58b43458ec

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


