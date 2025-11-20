Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C7ACF64BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=; b=q9cJngT2D9d0+BNPeeV/qUZ/OW
	embB4GgiNyNGrIXdqBgVrFdCds5dgrork7eaPxLyDeSnXzt7G7fufilTZFFsK3fYa7KR7xop85E16
	idl/uFrVoaHRqVuGvNV+tsHxArGpS6oBERGWkAJOot4q1uDUdL9xaN4+aPmwQ96eeuiHN+F8/Ru5o
	jAYAC6HRrN+18iOfg7mRpUtDgk82LQi6mpSLNkcIFYLLLHK91JaDOp/koNdOO8+77J1bQNqXYrwkD
	hf+jsJGjyssdzCEt08T9/dtr4ZZpvEvaE+I7pxNWyUINO5nCqONJkU6NAOtmoRc+uEec1AEQpJTsl
	cff9yCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBR-00000006B68-1aXT;
	Thu, 20 Nov 2025 05:26:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBH-00000006B3M-2eij
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:26:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-297dc3e299bso5429805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616367; x=1764221167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=;
        b=b6ojiDqpR6ikGoe7IVd582R6cclylKmS0tB6xrkeKMvzrfTWbjaBaEQbmPvhAP9F9R
         Gq97Y167wSAl4tN1ab/swi/pndIgQxBBakIZ3uBqwR3jPiF3gpflTluFjaSFwWy6lR02
         myWPWnjR+29NaSd+sQH4JdxAirAHevAVmfCmG3M1ogfX+VkfHuvXyUicEkfbEhiiimQj
         /uqYdDMsuIJUw4VlnWcBd/imi8VT85kRr7WGgJ3NE6L97WI+Yt+QS0sbQdkzkdZl9WdB
         3EkT/wNqqdyhSQGHZ5aZNs0e9ba3fhSzzokv1meEk8B8pwuU9x5M0uH9qROQo2PWHvSF
         JxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616367; x=1764221167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=;
        b=Mb7UKEVZle0StPMoVnhrOwu8TJOlfLzG1nxdTTagvSOBuzOFFObupCz/kwAHirLIoY
         xk8hyZw7djzfg3WpjF4Ph9YSKJr5GF45ux6K7CPeuAjtSRMFQMcqyj+Z8tDQHRY4gCVH
         CB2Q5i+B2YKHJxFkSFdkeA3IbHYRfS23Z+QCXN+szc7XmmDthBo7I7Hykr2xXxvvI44P
         qMDVaDHCRoVe7/YylfO8x/dGQLDc8+UVAb3yr5ckw19KQ7YigmF3pN4L7H2ZJjDafeTD
         9LpdDhBMuNiNFc7SAo2G5YIV5BpKBMxFSaObdgkYnuuVsHkc4EiUilUKuUKH5tC8DyYI
         w0wA==
X-Forwarded-Encrypted: i=1; AJvYcCWz96o0AKYyEmfSJsH+ZWbV+21uB5gHbTtiAEGMVERatGWb7MYxj6YCR9BoNFyDYRkn+9qJ8K8EB0KLQqWeTjbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwcQdKOzN9KEjscj5DtNAxCG5ZmqagNQcbmi4sv9vjBRln+LKrq
	4makkXntCLQ+hsU+4hNgv7vhUwwPVplcvL+NsnPLcNFLJ2bQhN+/iUrJ
X-Gm-Gg: ASbGncs6Qc4HBTq0qWFERsSsI1nDt9fxgdTDEXWzQZYxWrM+KnrV6Qt+reY9v/fk1pO
	RojJ/VriAVRYFLAiwfVGN6yD+an0/drCENAxjcsuTvSDAPvuJAXj81URzBq6Q33xbHmX22h8Pri
	Z7xyYZbQHuOmfQS3h9jvbRa9f/GESUjmLySiRcSMSue8RoiPS2yT61ISzFPmiHxNJjR3+mfZFJi
	eb5VegE5+Kpn7SuMcVwKxFhZLm0XROj9Ft8qSl8HIgQhi/PQX6el1zfqYOzEoxtlyChlwYv/huz
	2vo7ozkxQSn/Zv/I8WX6aLpRIOUNkVJC/0QItX3S31wUpgvcyPngPLx5kTg1sBj3+JsOwyVGVzA
	fLdCzsaNkmlRCdurdTho8RkE/ilqc5wHvWTfE+qc3gmBJWQWIH0nURQzA4Rsu2D+HTDhmtmMomW
	EOFZDiPOWGUcJvN8MzgTZx2viWm9o0sfYiJadgpgT/2VxY2t42v59nBlPp666S8OwlXcJZ5wmoP
	/3mwKhj0jsUCZwblIhYzJhq/BcCvPYbcmyOecNdzXBOA3VR6XlBChEBRMAqlDOioN16mwDHNQeA
	OflR74YR7n8=
X-Google-Smtp-Source: AGHT+IE0C4Gi/8UKiKUiQ7+Veji85cevN0GQcvp62+0plkZpI6JLPQDYbGS70t9JxUT+e0asq9HnEg==
X-Received: by 2002:a17:903:2a84:b0:294:fb47:b623 with SMTP id d9443c01a7336-29b5b02e987mr23648385ad.11.1763616366824;
        Wed, 19 Nov 2025 21:26:06 -0800 (PST)
Received: from 2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net (2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net. [2001:b400:e301:38bf:be0d:b72c:6bec:2812])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1221342a91.9.2025.11.19.21.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:06 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 20 Nov 2025 13:25:58 +0800
Subject: [PATCH v2 1/4] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-yv5_revise_dts-v2-1-4d7de701c5be@gmail.com>
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
In-Reply-To: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763616361; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=V8hyqVc8AxjSIpi8Rf3ei8SCie7TL3OVm+o7PWaDSjI=;
 b=0bsl4Rx14cAtCjmaDk5pc8Kupx+kOZS/805VJ8qDzXtiYCPgERiNuvmWmSRspeQkoS+bmAwIv
 ia6LJNmRmjxAyG6ryOy5JCxImsZ4z3ABZNrKDM2pwquLgjAYog+BKoX
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_212609_616086_6D5FB258 
X-CRM114-Status: GOOD (  10.88  )
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

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.51.2


