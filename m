Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C2D59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF7/ktaa6n7PwbzciOgKkGQIXgDWrklYx6VwJJpF/NE=; b=BJCLHyU3k0lRNBIh7oUBUSdxAH
	eo50U1l9gQpAzKNEsK5pkjG8o2oMZzCN7X5pHklWj9GI/DCOweMqkI1KD6a123IsI+AnJeyRyxQLa
	cZk6EnYScI1kcOh7hvhjH2KWzHLtj6wtvNY4I0hIy2yQs8nsdv3kpH+Bp55ke8HGeLaeXhKbCQW2S
	cJyGnHLudRt4Nc6bH+f9V00oAX/gj22lBMBDD6jOP92GonbIgZYguslb00kU27H0P5zDPDwmdPdFC
	IsCtkyLivaBMIpHpgNY2tJSqSGMiw4bYNNdjBIHhE0/KsOvL3Fz9IsJtUQJffE+n4InLfWiG70UdC
	0bxjfOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lTo-00000004StN-2XeZ;
	Wed, 06 Nov 2024 19:14:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLn-00000004RsR-3GZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:05:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so15889966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919954; x=1731524754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cF7/ktaa6n7PwbzciOgKkGQIXgDWrklYx6VwJJpF/NE=;
        b=XFh3jj4srquusHtH0nZjPBDRClsuAlaM9E055tSMdpt0Mq/ZGWDnfgXoMCNtPyhVgj
         4QubHWwaQWGQnCyLgeAHzggz0CLjoyaJdqhqVNdNjjNVCGm79K56NuVC7XDRQavbUD1l
         C/mF5lEnYHthkFtssboewigVjdAM7h8/orN3Bc3iEN2Bu+0KxzfNw08uc8wQZMXSuvxZ
         SNlyMckPEebpazDRDmvLkzmBsQj3dTLwV4bocF31r2/vVL8H/sUrsGT1+XO+2rbzrend
         +OxhgJGepOKtjYo80sbAjQKLH11Q1iz8bSBcxCPt1Bb64Pv20t2EO5dKXdxUORmlNgUh
         vkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919954; x=1731524754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF7/ktaa6n7PwbzciOgKkGQIXgDWrklYx6VwJJpF/NE=;
        b=ezrWSJCz9o+YFaAUu49nquO6kHtlOUN2qzRQ1RqufxE5tR8d08Dc7mD+iv2m5Mx4iN
         uXk0oEpVSQvaxu7yHuVRWjdbtRJ+bFFcdvZYSE0OXW8IWewQHQFc9Zzg3jRUiRQnUQtH
         FpVhtvZBWm5eK0UaKv1Hr0WPMZFnoAVl9qef12KIDoeciM63+CjO0jKQdHPFbBqw2kpv
         sGbx3Cyy78K4nJ2YGNoBIydIwTcG91V5RLaPXvdikxQI9HsF81db/jMNtjy2OA/D2zGd
         V2K1STF2RfF4N8TdIvEL7PIbdJs1OpGzkmsRHw8vwwWUiEhP16McoEbS/FCPPLqwFICG
         d0rA==
X-Forwarded-Encrypted: i=1; AJvYcCUOcpvXKfWzMviC01wcltzmVzKyXbBhNVmQPuaaxUrNbK5B9HWxM/aONNAxAoaS+UDgc0t/UdtUcBCH/coFTB+b@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZkgCsbaU0HdfjLBOEyXM/vLAQYtw4xMcDCxJNpv8uaqeUSfg
	4aTRJj1TR8T+Sh/c1K5FBvEHLIhBs/3gY1lxjAyA0i4N/AqscfJV
X-Google-Smtp-Source: AGHT+IHb0/KCYL04U0/vg62SxELEsU7lhBB6XVEUFvURcuXb8fhbHoL2HuGK0YgGOMa9LJAnenQfnQ==
X-Received: by 2002:a17:907:26cb:b0:a9a:c769:5a5 with SMTP id a640c23a62f3a-a9e3a6c9183mr3031181266b.50.1730919954233;
        Wed, 06 Nov 2024 11:05:54 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cf906sm320785366b.112.2024.11.06.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:05:53 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:52 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: sprd: sc9863a: fix in-ports property
Message-ID: <5318a47282b8c15a3135fd12dacedb8aa70592e2.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110555_837462_04AC80A2 
X-CRM114-Status: GOOD (  12.89  )
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

This property is called "in-ports", not "in-port", fix it.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
- new patch

 arch/arm64/boot/dts/sprd/sc9863a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
index e5a2857721e2..31172ac44adc 100644
--- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
@@ -288,7 +288,7 @@ etf_little_out: endpoint {
 				};
 			};
 
-			in-port {
+			in-ports {
 				port {
 					etf_little_in: endpoint {
 						remote-endpoint =
-- 
2.43.0


