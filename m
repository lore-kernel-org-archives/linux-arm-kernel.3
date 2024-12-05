Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC57E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mSVWv3kzGyP7Ixr3DcJKWQ/Cs0NKKVxGUdtaJxvtNOU=; b=oOhYOtV0lNQKah+Oy+2pgKShdm
	rlXU7S8TxpgI1Kh0CYGOtiLqpIsGQ0KOktNjSbHZK0cbalXkxFQP2h+OGZw+EBeuFEfd7+dpqcN2q
	Mwyb/BOYuP5Hrt1B+2ZU6dnsayiKMsbCh0y7TNgpXx9Az8cYGf5bCkkmn7z2ZkmHA9wRIGSg5NCjn
	8uyKCML8mPDBllxKBLaVSg2ue26Cq4bYISPVTvPkTwFdYFoj4emhQBMyBMBvZmvYmKsDpCnb/Zpfx
	CkRvqUw06Y1gU54lzpXBzzMD43Bfzwirz0GcIASU1t9W9iCxg3jq92QTRRIkqJ1+r1ioxhn5Rh6nQ
	j/ugUy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDrp-0000000GYca-2jqY;
	Thu, 05 Dec 2024 15:34:13 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDqB-0000000GYBs-0CpS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:32:32 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-29e71d653fbso586339fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cornersoftsolutions.com; s=google; t=1733412749; x=1734017549; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mSVWv3kzGyP7Ixr3DcJKWQ/Cs0NKKVxGUdtaJxvtNOU=;
        b=qf0U/abdfXa/eaLBSAe8sNpRQ4MgFW/CWZayDiOxwxlXURPZHZUCff5XHaBRy8t/dN
         1uOlUV18x/V4h5iX7RPKUudfH0cBgQwc2U9Mx5yhlNwCo6dv5c93CscAHiwc3DK3Vdib
         41xlSBW6nULXVyZFLrzpDMqOzv4OANiVsgrHY1qUnyBKbWbsK2GUtGFCyK95m8mueAiB
         fDI90YWNChwZaUGm5pGeC1RgShWlu3hSDcEwnAHNFKsJPNcxiQmqaoonyMVWCCBA2OJh
         PUOpZJZT6kAuFcbKeXYLJt07f5aAk3Vx8RSTpU4uFUi3rH2+KE9sXYEEjAQFX9a0lvL/
         XQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733412749; x=1734017549;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSVWv3kzGyP7Ixr3DcJKWQ/Cs0NKKVxGUdtaJxvtNOU=;
        b=Lz4nro18b5sr5Q5guWl13o2Gkj756qXNKea41Ev/LzJaACUSTE+UfALRhxIrmQgNXr
         pY1T9J3gH9Gg5RNP0TD8VKj2SXTWb62zVK0fOFD3NIMaRC89UTeYbdQ98o9983Zr6JY6
         ygS2j64PIr/9G9PKLeMnIlo6wLIhbdnhEQSmOmj0fr3QRifgcjFeRFEwwElheUsk2HPf
         c91XLQSLdnHCrTw/nsHT9GXudl/yCpCFQqitrDIgyWnPkkwglNcwLXX2lkMhKXObUpSE
         GHObY2Jz4F8W/t8PILO/XGgDgYduOyKrDw/ANpCbfbXY9dUfAtYW21VwVQL52zr7h5sL
         Niug==
X-Forwarded-Encrypted: i=1; AJvYcCViWTV11YG3XCcshvDG6wjJmPrE3K+rAAYRbucwyqacqmUDQJn4AXWC3wLrRj3OwsFbmLFe9HD6gcWZ+7Ml7c9z@lists.infradead.org
X-Gm-Message-State: AOJu0YzOTDrMEEww1VzhkQIiN20bMPBM4JBu7gXdHrxbag5ePGMA9hPT
	rfoUGFqRfWfkRi6kmMCB1COimSzpleeAc4xThAxCj5zTEltbgvJhoo3u6bIzSXCoJv+hq/3e/5u
	auFurSinsrn+IRSwh89RknGXPjJQ6L/EZzMuPiQ==
X-Gm-Gg: ASbGncs+ynmUmrlYkFe1HQrI9zEIRqi9DMFu591n6ABqqtdGdIf4Z4kKk5igux9ZQDZ
	0u1MFDSYU86hp0YOYzn+TVUQd3YIuFltf
X-Google-Smtp-Source: AGHT+IEXh3wkarBLzAyKqYC0kT/Y8r28C1neLlKp6rQpRD5NvnZVxaGgz+SOmihpuXwnZlzhFMNga5hrHKjeRZiwzUg=
X-Received: by 2002:a05:6871:606:b0:296:ee2e:a23c with SMTP id
 586e51a60fabf-29e88560c9bmr11677702fac.5.1733412749132; Thu, 05 Dec 2024
 07:32:29 -0800 (PST)
MIME-Version: 1.0
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Thu, 5 Dec 2024 10:32:17 -0500
Message-ID: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
Subject: [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add description for
 dma-cell values
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	dmaengine@vger.kernel.org, alexandre.torgue@foss.st.com, 
	mcoquelin.stm32@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, vkoul@kernel.org, amelie.delaunay@foss.st.com
Cc: Ken Sloat <ksloat@cornersoftsolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073231_194194_7232B948 
X-CRM114-Status: GOOD (  10.87  )
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

The dma-cell values for the stm32-dmamux are used to craft the DMA spec
for the actual controller. These values are currently undocumented
leaving the user to reverse engineer the driver in order to determine
their meaning. Add a basic description, while avoiding duplicating
information by pointing the user to the associated DMA docs that
describe the fields in depth.

Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>
---
.../bindings/dma/stm32/st,stm32-dmamux.yaml | 11 +++++++++++
1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
index f26c914a3a9a..aa2e52027ee6 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
@@ -15,6 +15,17 @@ allOf:
properties:
"#dma-cells":
const: 3
+ description: |
+ Should be set to <3> with each cell representing the following:
+ 1. The mux input number/line for the request
+ 2. Bitfield representing DMA channel configuration that is passed
+ to the real DMA controller
+ 3. Bitfield representing device dependent DMA features passed to
+ the real DMA controller
+
+ For bitfield definitions of cells 2 and 3, see the associated
+ bindings doc for the actual DMA controller the mux is connected
+ to.
compatible:
const: st,stm32h7-dmamux
-- 
2.34.1

