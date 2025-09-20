Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1379ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15ctJlWd5TiNnXgBO40s7vu6haL/vdED1g3JIoksqkA=; b=H1c4DZW5zyF+2bZoUrA8DVSH+Y
	AA0eP2EHz2e/SoFHkS7Mz7BSEug51gBQuMzRkjD7Z8SEkShrQjVbiqTLM8M9zlJ+b7lThNugfnuQf
	2+4Ijud/WBxpeOzNYwOHFZwn+DWEiAa1bX9kzK6wILTnPxwiyB2BEDUrBT1gXOp3R9h6OHy2VzEJd
	4v1WSCt+UgRpk7VLwrLjSZpa9/nP/eswhb50YKJjumT7j6lTdl+vxT2q1MCsOLl5j0oyPYwaHpj6L
	o8wiVHi0pk/pwexQyge0tvLm7u5m8pqIUsP766J6KdnnrvdQGljEx7NoJHVbvhmp4eTvWwbsaarHZ
	Wqtqxmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwuU-00000005LMj-0d7F;
	Sat, 20 Sep 2025 12:41:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwuR-00000005LMO-0nQj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 12:41:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1624991f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758372104; x=1758976904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15ctJlWd5TiNnXgBO40s7vu6haL/vdED1g3JIoksqkA=;
        b=TEiPO78EG24fkn4ttfYaOl0AiBM7TrI+nVVLmHAWKt0kDeXUvuQi2Xtzqs57Sijcke
         mw+2Nr/arlrLaVnYmF8yjAUswfKE5kiAHsxq7c1ZXuDuj8e4WKxDMQbFyg6516kfmsun
         mH6tt2hir4uiJ6zeOP7ZFyF7Zl/FGsA/nsEy/mRDBcqoWaO/TY75cSChgAWRNCoegTqK
         6obfJ5lP+LBjIwA5CFQaCKCuq7IQ45+UNaLuVdfnueHVB0rl8CjWA4usGbU4xKoo+3tE
         MbiQYHBngne7noFcOgmgSJXML3ZbESo7ARhuY9xcDU/PtQOYgWO35agBxigQuMWP8KkT
         969w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758372104; x=1758976904;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ctJlWd5TiNnXgBO40s7vu6haL/vdED1g3JIoksqkA=;
        b=Sc98KtjkYEt49e8zQUosWsHKmlQjamRcG2pbOPF91kU8houoMKg8PCgYTUNdbGocNI
         GJZDzQ1/1yNPkv8tnw1aQSpVAzXaSKvCSixSBrjlweVGtyhTisowX8PO57vOuMwb4MAk
         CwFBtDfpt2KQLXw+0kKUaV2X7SKY+NwnJKU3E8Lk5bncuyzb2snKXANFBPR4qDmQ0/iJ
         IR2XfOdBQ7PB8zkk8iChu2CJI1n4225PRSirzl+eGcA2HttVNyL4ebhNBSVl64RgyLL9
         n7edph0lVeupQhaSob/jTroX4dz5TykQiNqYiLe3Z8DKe2MmU565wTITvpun9m5GYgvO
         JJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWSRLTaeRbXwGsBbQUw54Msu5giBOxl00N9PIP+rhl1pkM/wXFT8uMglCFvsh53GV5q4vkABdzz5AJi9jAIUuBk@lists.infradead.org
X-Gm-Message-State: AOJu0YxWw8OmiSgLLC2LTUGFR/jzyvkHyVKwcGwp8J6vaz+XMdttkBq2
	CSQxBKpESJjStGRmL18pQfZee4Vkw6+9p02fgWyO0yczXJ6cUAbkqq5taEOkZQ==
X-Gm-Gg: ASbGncuTUma/AXpBtFoIkt52wuLOL2qmn6ZyUbI9SkoaQ4ogmIFsw9JTJEF9KAd0J2s
	sE68Ug22nr9cROC+ia81InGkFmR5nfqWydeaKUn2I1HwEMkzxlmcUtf+Kh9ceftlIhobj+YiC31
	Ci6MVSYMnWazUmxzhJ4+57QsNUnpPCVqBFSH1LqnB/KKWrxPx7NZbo+ns8i2GZR+S0P6KyJYWTI
	d6J+9ZzLG0Nj21z2Im1vDXXLoRfjYX+fJyHDHoHhuTGbkx0RA0U+iptRUh4iSVbTUZBBAOExNdS
	cyue6gvMSdVziou0wuupzdq+WncmsCPgLczcHzAI/QT3zRy8tELY5ZaeEJSat4bag2nQ+eABXbJ
	ipjweXYSwq3D0sjWE33Hg/VEa80A6SUhj4ben3W2U5fTDiIH5GQmwDVEyC0+Y2bNQxXXrIlJ2zO
	Rrjf4=
X-Google-Smtp-Source: AGHT+IEWFUq3RVye1lwnKV9/BW4Qg2WZ91sgKbGmwNaa5auZ6g4qL3atHwoQRVeYQ1Kh21j2Fa3FNw==
X-Received: by 2002:a5d:5887:0:b0:3d7:eb95:b1e1 with SMTP id ffacd0b85a97d-3ee83cabba5mr4475853f8f.32.1758372104261;
        Sat, 20 Sep 2025 05:41:44 -0700 (PDT)
Received: from Radijator.localdomain (93-140-182-131.adsl.net.t-com.hr. [93.140.182.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac271sm122747095e9.3.2025.09.20.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 05:41:43 -0700 (PDT)
From: "=?utf-8?q?Duje_Mihanovi=C4=87?=" <dujemihanovic32@gmail.com>
X-Google-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
Subject: Re: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Message-Id: <175837210249.5177.1897822800832448116.b4-ty@dujemihanovic.xyz>
Date: Sat, 20 Sep 2025 14:41:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_054147_249379_7FD08A08 
X-CRM114-Status: UNSURE (   8.42  )
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


On Sat, 13 Sep 2025 23:21:02 +0200, Duje Mihanović wrote:
> This series adds some hardware support for the PXA1908 SoC and
> samsung,coreprimevelte board which has accumulated before the initial
> support series was merged.
> 
> 

Applied, thanks!

[1/9] arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      commit: da8cd97da58ac1bada6384eb7327de2502e76b03
[2/9] arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      commit: 37780045c78d0134373c612ed5a6cf18a1c77ee2
[3/9] arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      commit: 4a9e21b88c9a6bf3afa68d9a3eef8c72c53a69f6
[4/9] arm64: dts: marvell: pxa1908: Add PWMs
      commit: b7061793892ed1e947d65a53510dc217411bbea0
[5/9] arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      commit: 1c01dc7da1ca9ddb55cf35a7b8baa362ca393787
[6/9] arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      commit: bce8c4671a45d9fc8d0f4539ed758a1aef9e1aa8
[7/9] arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      commit: ef2ec06ed37e8d6134b2df28ce123e7a3096076d
[8/9] arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      commit: 01bd34653bfc17679e04a7d554e9b7f917e1b3cc
[9/9] arm64: dts: marvell: samsung,coreprimevelte: Add USB connector
      commit: efab3844c6f18327886c5c2e0e40acccaf976a89

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


