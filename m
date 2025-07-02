Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402EDC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQrj9G+pYLe79Y4PNdw8/vBJhfuXZd5KMGob89u/rGQ=; b=sds0klrmzwzAZcLuuHfr14ElaG
	3KWchQGU95TAkecZDjjiAVVGfbeLWoY1iClHFH9SsUO7Q2V07xlcy3rEVc7wC4SPQgukmT6aF1hdi
	wu0X+RG4AWY3QlgmOvgZ/LIXfp+dfEpqAJHyqIqdBavbwNRViLMxJ+RmoCK8XU1xwpAbQ4iQkjeiP
	7qoi/VZ4vYexiH2cjNNO0Et6ix+m2jSmi8s7zwz3Tfk6oePLk80bomWadM+4AASrp495C6TAd8XuQ
	m+jZ0FDBMfBBtVJyX0A8ZxR5JA5OarlfJgIn775eo3i4fHs1Zj0nVbQYfj0LTF295P6lEnVcNKpUS
	d29am7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpnD-00000007Ffw-2nKX;
	Wed, 02 Jul 2025 05:13:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpe2-00000007ERy-3r0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so3001444a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432670; x=1752037470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQrj9G+pYLe79Y4PNdw8/vBJhfuXZd5KMGob89u/rGQ=;
        b=ZxVzW6nQckCHrEX08rgKpsUbSZ13vB7ZTZ+tXC4QmzrUjDKKNCgL4eigOjgN0NshQL
         P43rUJbo82URmhgHL3VydTYhQglaAREA9JtAMk6YsrVbB5LPljaSVjv++dqOO40pzxP2
         8HLwl2+9iE/bmcDmy/OzvhXH8OLslULl64PjJ3AiMmlTDHCb3rlE0f6r1LCzMhCPeVMz
         +HDp9zREVQH7Lot/mhDVgUoM0cYo8ZWpX/CItJ6acNrdpDbhiJDgzHR5VXDpP3warD3x
         M6g+H/MAfvyZA7ufETNVhSraDuZElAFh36ivYCmu0Rx8PNB4Dn/kvQKBWPqLFx2yTcly
         7Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432670; x=1752037470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQrj9G+pYLe79Y4PNdw8/vBJhfuXZd5KMGob89u/rGQ=;
        b=JikrMQQfzkcgYVvKEZjlUQ7KYxZO2F+FkmyfMjEbfkY9u2/zN+OFK/1mry5aiaw3zE
         bX2ki2UBaXwO4D+V9KsVzRtMDNh5iic9eyW0+I3nXct4vm6uY2oXqK7Mg3JLJmWdnLf3
         nF7O4BC57prS70EWvOsOrbh7hwABG3lvVuCsfvZpApaqF210l6cEblFlmMTfWpGhA+HW
         OFdlZD7FMmPTIsFSHTTwp4ckl0bEOYWKiOT/h8XpNvpbNw5qA5zhdzt63E+XDvkfDw7c
         Gpv38x2LoOw4RcG74BT0hLaj7wME19zuvRpQgz6OqycdG8FaDNX9LvXY7pGIz2w8Af6i
         MICA==
X-Forwarded-Encrypted: i=1; AJvYcCVYdYEsobS6+6YgjOSKW20VsZDgeky6Kx4Zl11X7DTIQAeJOExP+MIFFQcxpil+leTOtl68LWaYdaWuEAqaWwrA@lists.infradead.org
X-Gm-Message-State: AOJu0YzzKawFnPTfzGoTS8AvCNV8eJpwur7KffX1ibz4TsttpBlWvVd6
	sipsyvU0x2vDNLzCKNKSchu6W4W4xB3ZzJVYtT+EYO44zM6csNC59EBT
X-Gm-Gg: ASbGncsSLHKaLMPYcjnch0W4Llx1cXCrSW9xsf8CitNfuINyJryCKpZfwNmkKi0Lygq
	nITK2jhvlDz/3/7y753eR1L8pxPDjqJDTaKz78ety0wkpwo+5x01T3cqIQWhpg9gVtACGI2y4zB
	1W/X3reJv8Nmdlp56kVlw/nADBCgkDgRUlPDNt59+tMZYIo06W8oDHXa7tNCQ9y/M6DKVXRCNsT
	uMW8gPn7cvPwLW3foeEAdx6wpwcgwb1Dud3UJRnukxKem11k1UGY1oWgLgmbwH7RR9mN+Onn3nW
	1drgMebs9rZRqIMjyCnxcUxXQXFOoMgYVDvkFeJC4O4Cx2EvlkFbHkmQAgqjs8Tx8DEuA6xKRaS
	XXMhPj/c1AG6RxRS+Skywe5zaX3gn4hMZrW2lQxOqXp4kJ5XfWA==
X-Google-Smtp-Source: AGHT+IG/tQYmoUziIZcUILlZBz8yZIswDYIZla/dao7Lol524L9vULDjUhgzMHUYch+zfG8/Vy8Ryw==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr2059561a91.19.1751432670269;
        Tue, 01 Jul 2025 22:04:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:29 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 3/5] ARM: dts: aspeed: elbert: Enable eMMC device
Date: Tue,  1 Jul 2025 22:04:14 -0700
Message-ID: <20250702050421.13729-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220430_958718_FC25AAF0 
X-CRM114-Status: GOOD (  11.44  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Enable eMMC device in Elbert dts because the eMMC entries were removed
from ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..ff1009ea1c49 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -201,3 +201,15 @@ fixed-link {
 		full-duplex;
 	};
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1


