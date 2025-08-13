Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378AFC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4F86Ss5ZDMwE+bMtUpttaC71xy+/6MJqMSZw67R4Rmc=; b=a6MTl3y+9AL10duUsqh69dev53
	l6+wAYRlosdmD0diO4CqdFsqDH1ApCeVPW6+wP6SgKRQv+xy+d9wfMPegis3AQdN/AQJYEVmY4Msd
	9euGg84wiCniZGlzXBTvJTn1j7VzT6oWm+l67g3DYU7dNw4YN+6it+cRdOdPt6O9+XW3TJFWR6J7N
	Eng634CR2HdTR8NlOyV1FRZOtnPT1YuCeWPO0PGnC75XBosko6Xu8JD2/Q1SRr1glLRtpGijnNKN8
	3LPK/tw8ofTGUIWT0cZi/1K33Pc3KFSzDQL+ovMdia0RyKpGkOy7sl/Q0KFf13SmRUhWnCzbWYfqc
	fhlVl9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9XS-0000000DVK9-04Ir;
	Wed, 13 Aug 2025 11:21:02 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8qa-0000000DOyr-289Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:36:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-615957f4884so962971a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081402; x=1755686202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F86Ss5ZDMwE+bMtUpttaC71xy+/6MJqMSZw67R4Rmc=;
        b=rp/xStLRdIMI66KLBZWj6ZabIF0s5ObYHMd854u0mXQHCTvU4gu/VIf1fNRQ2eSNGy
         OSLR+Cir9fl+jBR71XdkizwwptkJBGaC73laWXIftv3rR7Aj2s9ujI8zTRlRlrgoQ1FX
         MZIrWWxis96EZR0nTClpVHyLgQZSXo6E9sDsA1yACttu2RPSxdqKWOlcWBlvmTaSGxfA
         HWKFgM27EdJaTPlNKwJF2laW1nEMOarlc04uMaqDq9NV0EN55Ck5msh9+P9/RSD4vRYW
         o/IWSxIsrpqd67XyzUkPjPsEcz2fcuN/2B9MeweMz8TYXSTzqW1LI+VoJVLYfXqNbzHt
         JFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081402; x=1755686202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F86Ss5ZDMwE+bMtUpttaC71xy+/6MJqMSZw67R4Rmc=;
        b=V/bKyM0CGy4aH8tO1UUAK6o3c01koC5X7HsKSvIMnHhwHWvLTFeK0BYe00jT8YX2V0
         ISJkj2dmOTt1SA6u7dqgIDNdoP9OjdQZWFjt/ElzMhEAEwqgFy8lL8HfPNxCVuvy7zpo
         spvj+Ur8B44N5ivhPy9D1zHaZ7W4azHS0teIRF61Rsp9RE1JOQ3KKaBlwW5gCqokKc2T
         l6/bZ0siwRU5MEQrsguG0YCO/tajJaRpku7FYaurhsl98NDqry1qKWCZoKW9UVFCMzee
         gpyCQ6xn4oO1oUoZ3ITDnSOURFyv3zOOC2o6hxUcflDwMCnZxCXKyzv/ltkuD4WUS9lR
         /yLw==
X-Forwarded-Encrypted: i=1; AJvYcCWXwvWFMScLwvs3FfPyrEwP7+rk6j2eCVDnn0CoXmsMpq2eeBr4VIUlqRIFmP84Tz9osIUIHNtZ1sc4bEULPCHq@lists.infradead.org
X-Gm-Message-State: AOJu0YzCIboJBbCQ3hGqrG5l4xbxeMqnjMi/zkdrNad0SvXTMOna2HTG
	H8iyCA8yIWr02KGkZZpmHZNziaxR0tDZ7YY/5YMIQzgtUaYQAuKIaLuFj9b69kiqDbjzasljqKK
	wsaWR
X-Gm-Gg: ASbGncvV9hDJHIIn/C4L94l8cJblh+WyVRts0IKRlW1BzIOgsmSiCX0cHF8yHO9HOKl
	JspWyllxVjbFBvX53hlBPFmKc7UtFQ7W5dQpS6yZs4MADPR9VZWCwjY3iOydBBPrUMa21SCGBiq
	JK/feHe/4LY+a1IpWH5k+DKamMu1/CUJBIvv2+5Si9EUaARJH74sywoSCXVz3LVD8U+N3hXYFn/
	6G8hokBl2yN+Dhk9D9+ZNR0Bc2XyfnkRTHmlm+xZ2vl+aQW06zvUORYK59Fe3cBT/cB+YBzMbse
	UgJXb3jxwKka4KeqToFxCRG4q0IeHjdhcWLSFuhZYo4j0JUCLSNLpCDXphDeZJ3MhDDP1qKnTXd
	Vy2iXR8leEDKqSW93sJ9+t/mD1TxbXcjh6I4+HK0baiA0Ixwx+g==
X-Google-Smtp-Source: AGHT+IEt6eCGHIHdgJ5Hbdvmi361TPvwrKg2DTzTL0d0QkRcJbr+DkoNmxRzQ+Jj9IKe7RsN66mllQ==
X-Received: by 2002:a17:907:1c0a:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afca4cff92dmr105537666b.5.1755081402373;
        Wed, 13 Aug 2025 03:36:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0e7sm2367644366b.114.2025.08.13.03.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:36:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-mips@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250729205213.3392481-2-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <20250729205213.3392481-2-florian.fainelli@broadcom.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: memory: Update
 brcmstb-memc-ddr binding with older chips
Message-Id: <175508140104.40429.8279921018476182386.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:36:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_033644_561383_587BCDDE 
X-CRM114-Status: UNSURE (   8.53  )
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


On Tue, 29 Jul 2025 13:52:12 -0700, Florian Fainelli wrote:
> The older MIPS-based chips incorporated a memory controller with the
> revision A.0.0, update the binding to list that compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1aba1eab0bd896928ae20dbf1f60a175a6e1ad0f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


