Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C2CED603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=; b=b9C2nCg2hbN3QwiVTApgh2kF5g
	PuLuJzF1lb4uwQfr1ASKmT37VLieEIereEk6TKVgJfjjod8V2d4YbiRjlZJ872VYIPzpfsyHNdMDd
	mgPnlnqBv5JQh3EWWNbLkuNp3FmrSHCbyDoRHDOZf8tbDHtd2fG2empezL3n1SRmdzGHw6eLXXMj3
	pVhVE5uFPP/7uJUvCt8bx5cvsHUtCpetcdSz/Iqwn+867sUfGzZKeWWxHaUlMVVHtOxXCUVbffjYn
	9nOBoIb3mviUSaCfQn2I7x56cxn5oWmSVd56pFiWRRQHn/mWsZ/eXQJDYsiE8eCNeQ/QIVOPrwj9l
	Rkd9IdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJLB-00000000HWh-1Ssd;
	Tue, 18 Nov 2025 10:53:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJL4-00000000HVL-3DEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:53:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso7671850a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463214; x=1764068014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=;
        b=NTksRLztu0dalx+r/DrSw6MIk6uAOiL7mxrTPse8H1X1g5ECskTWt7IpeyuZSUZBSg
         Oz48BNlq4S1Acp0h298QFh+GG6e6FmtkJQZ9gMJap1s8cNTmpSosfDMZAlWbs3KWE/6u
         cRbqmRJFApcAp8hKbRycWyipeu/U+FKuVecKH2ti0WkJxZBJRXeVe+5BFbnQiDNVsjzD
         0UqEwYV8q1yL2Fwhq+HElhKC+ExksRUvsRisEeYeriCspKtK/w2CYmthguieYjJ77F+C
         cIseT9NYrNyTp/F+YlSnVsKBIqtVkT9Cx05RzqS0Emxd79tqgPI4VlNrJrVfgN6QDgRC
         KkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463214; x=1764068014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrmpJ7r5olEuuHW8bES57a8T6LK6exu5hSOQkrAzRxY=;
        b=aj5HrrmxYwwu8hff5pB1tgrzAqoDyHxc81PCbawmzOpDXHqWyB8kojQ6gFfnqhxzG3
         UIYEma5T26XITZeu5qOJNH5Rdongy+PeAn63FiKSEmxYA28WPqMw2i7PguzQMmxzK/ZZ
         uE1yszquQwI9GNW/B/GjCrf1GvFkgeU7tfSOwwZBCkKdrR+eALtz4cTKESKib3yPDMVU
         87UJkrPMiZ0ZOEPXW5KuDIPJLKgKje0UpsovIuVUNlHKOR3yh1cxGD22ejZvFuzR5VED
         6TpsgKxRzgcEtJ2by+JTWn9KviV5hMsqTZCOPshmVAFsv7PslAc1/wvjXFe5akpiv5qZ
         w0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTJ9wDSJ3yD689JQiePO4lKefsxmFcvIDzM59eqpR+MK1daiUsHd3pXivsds5uLfW9UBqEGtQJ2gJKhQZC+THt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9OCSqygk0lupW8WCE9ST91UNsEFi64jRHIMcr/x3LWqH0KgNA
	gUTw4GnGNW17Dn6UOIeIkGjKmuZU8yPNbemL505/RdGALhGUSIrhb5d8OmWADQ==
X-Gm-Gg: ASbGncu+XJpjp4HDer8EzQDE0jMwN/yK1sXTOfqIhq6FsYaQjuO5nAwQowV7PrlUpnh
	kl2KYG880k4HzN/pXgpLfNkuWliPa1/ElS1wEjBwO7pscAV9ILxfQybJbmZYhOGg85x43fPDJbU
	AYuFoL8XbHlUc2jF6/kPTgHnAjy1GGTjxyjhaLgHd1TJHmNuQRrc6IKDVAssprLbvniTiR6GX4i
	Himu5pJpWUfnEenPIv/HpuzO9Mae9ts70SdhcIAR3Y4TB5y9XiUbftSxDK/8qNBp6YlykdLOuW8
	ubsvCQJ+xV91h0c8uTvV8u3gAfjM//jXpK5h+J5Ql8fsqmCaQLAmByZO9RYDxNkS7/k+kI154nr
	KCLXsbFd/R1OenBhtGP091Wni10vMDe1WxBsVr6y80jjkPfIjO++eGlILh1ISFOjsrCCi4yQcHY
	Mc3dNFne6CFD7cheKfpsNlryC155QjMRxRjT0F9ropk7WZ3zuK4Y0OMK19LdG5PlgCu8UfWeR/P
	0qqxh7WNbbK8OFca3lIj5FHKKbSuECo/Ni4tgdUOcVyG9E+MGwQo/+ky7kiZm5KNvGSTiBHX1fT
	DcMQiX+JL2Vzq28ADsvl
X-Google-Smtp-Source: AGHT+IF2voj8h6VBZFwIEhidYuX7kxZ+HtyxeIJgX87w+aBlexyKiWI8vQ8KfVgjLMBTqVzQwR2WDw==
X-Received: by 2002:a17:90b:564b:b0:339:a243:e96d with SMTP id 98e67ed59e1d1-343fa796a3emr15961735a91.36.1763463213843;
        Tue, 18 Nov 2025 02:53:33 -0800 (PST)
Received: from 2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net (2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net. [2001:b400:e30c:5507:a914:c4dd:879:41e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm16274111b3a.9.2025.11.18.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:53:33 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Tue, 18 Nov 2025 18:53:18 +0800
Subject: [PATCH 1/3] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus
 speed to 400 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-yv5_revise_dts-v1-1-fcd6b44b4497@gmail.com>
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
In-Reply-To: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763463207; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=V8hyqVc8AxjSIpi8Rf3ei8SCie7TL3OVm+o7PWaDSjI=;
 b=yTLo22srLoWN9l+075TqUif2qS7lg3gob+kFc4OjeXJUO/YBHZ72RwuTKPHKn3l6CUs3SlW4+
 J6OpEW19//0Aq9exBxEepLLubirjgzAcXrA2O791MxNZOKzZMQ6ItH3
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_025334_833362_1B22E17C 
X-CRM114-Status: GOOD (  10.91  )
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


