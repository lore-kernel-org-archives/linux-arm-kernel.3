Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448FEC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=; b=oR/z/ipYa9z6zHd1q4q10h+U68
	oXKiuq+EVE+pXZAnYeBwD6lL3KjD+xCG+vfUQ7jLTRDL/Q2pMxbMLu3kOiruaSAxXM4OQYWtdJl+j
	+NRbaUdf6MSsuOgwT+6Ww8HOqzSnXsjNYqNOswCMmwuoxCLbEIDSM1YXKu+1HbokzA0Vev4FgXOdZ
	PjFsw1Rqmb+lRwVSALrSAn9K7CfxFwMdbnHT1+SDOzA/tYMGn15yLitsfqMjcv36QMpHSWK9aasFb
	eu+lPAu5zhftGSKAuV0cDAvGPWSqB6kDIICwBS2KiZ2TGcOc0CT6Eb7BIw8FHhzz3H5SqGTDRYcNW
	1XqTIj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdDq-00000005k0s-1TIX;
	Sun, 04 May 2025 17:33:50 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd68-00000005ilH-0mnK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:25:54 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440668acbf3so5071125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379550; x=1746984350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=tvnAajYGZe7PQicm4IglNLFNkNGCee1ExsjYLG3umvzs99lCEdnZtu6/Oz2oNwCGQs
         dNt9ksnYY1bZ8pFYqwRfrruqFL8kEW66zwTqSuHszs79YA+BZByJzzbO77mqFJBQQ2S3
         m0NWkkL+gI84xWSYWzmB9y2t3wg4JJ0nIIdjeroFbvbIgVKJlqUBF+CXleXCUA9yPrPI
         Ea3Bi82NTdwxGrGC+34JF+lDrm3L0x/JiVxg/25kVAPGWJVa3W66MmQERQGiaYdw/+qW
         V8zoTfbGKyWWO6XCVYFuXlFRDYTOAR5EkjmA/woRcFiQa69/TAp3kF56f0DLVljeJect
         f31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379550; x=1746984350;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=rXEKjZDUkEjOMyFS69SZs2sNTOZCT+GhO9p5wRdG3fZADT7/ip4Zn6QQVJWqZg/nLr
         r1DNB84KiQKgPiimcRbadCS2roEpjvmXOzRhC8gNLH90jDHEH04yGPKYhaQO0U3We+kr
         Y1z5KJ35WiJ2HxZ15gpr8/z7TPv1UlqS8yECAxxopnSuS56sG3M6mHjJUTwYT3w7mmd8
         J1/psnj7FIq3SrxUYv1redHcunrNAWypl+mWHs1R5FW3RQ8wCGybFStG8mYPLW+lOAnj
         vdmp3A+mmktqGOq3lGJoLp43uAfPyeTH55qsfiiVeDwOftTTfX+nDQ9nu/pD/TzmQvGQ
         J1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVw6uk/CSJAiM+V2Nl7u0ARqKwiAsZSeAEY24rvevfT1TlRLg4WejS00x+FcgE+4Qyw7g3GXmyyu+1hlCGGqG6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxZn98w+Z+jwjgkJ7DQkPqlh6etv55B3dLmaAu2FIQjHfBvf8dT
	lx38gzsVBuu328hw4ag0z8EQlL8JZ6nL+4ZgdpFilEvvQgvaVoTpey9xVwNF3xI2lXtAuxBwJ1U
	g
X-Gm-Gg: ASbGncvYAyGToQdUFolsRm0f2o+vqW8utFpa7Huu0T9pDHRSGuOxw7MWGjSUZTokZD6
	m7gaDdOEz+5tWEwnMmQm+z22vGGn29OJqTs1ybFHONlhsuJTbCjZkL0tDAh7xxiXPHWZEWKMVZC
	66nvSOeVRU1l7PqEaufXlCyDqMkHW7gGp9k4Fop5bIcmcS3EfeGRb+cpXmFmhhkWDd5ZmA6yUxf
	/ecUn3NVhRQy9UapdgeCN+JE9Gj/Yj1KpyH2XEoZnfW/EuMlRMcpqs0CfZHReIkZ8p1ofviEPoI
	p5BbHcEPm2brMq/dKAK8A55iQpkiweUghuigsVHT+Fho0QfoJc10nD2U+54=
X-Google-Smtp-Source: AGHT+IGYW712LH8F5aMUoHbcA3Ri3a5MVIOjSwn5ymbnCfmvccr949GTsmCKBwzbaZh0jtas3NwXgg==
X-Received: by 2002:a05:600c:8712:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441bbf4ba96mr30008995e9.9.1746379549860;
        Sun, 04 May 2025 10:25:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm152058515e9.7.2025.05.04.10.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the
 system config ID register
Message-Id: <174637954874.102817.534725446535416368.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_102552_217741_6220B823 
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


On Sat, 03 May 2025 15:52:33 +0400, Alexey Charkov wrote:
> Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
> MMIO address 0xd8120000. Add respective device tree nodes to let
> the system code access it at runtime for the selection of appropriate
> hardware quirks where needed.
> 
> 

Applied, thanks!

[3/3] ARM: dts: vt8500: add DT nodes for the system config ID register
      https://git.kernel.org/krzk/linux-dt/c/a43a6092e33d6a5827114c797a2951c092851931

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


