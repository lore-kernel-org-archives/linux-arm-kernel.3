Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177D2C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=; b=4mcDZVv+6HRryH0LzRc+sbpyo/
	nCiQb7q5JHF+g0pPYa29pGhAje/nqFnKi1boEBEaTyTJeLSHPNy0BSdmUPqVVyQPw86NXrIBJrpz1
	YyTbihpQq48L9Nsv7+4aVWgZKvbQefZabiGgeiXIYk4yY9dqegrsm9UPRZGt4ZYUZwA69tU2qwp3o
	UYI6TNxADeb0eGwEAI5kLvaj2Q40odf151O+J6qbsDo+d1fa1Vw7QFGsAsIcwVmpyQgV6G0kVibxB
	2Il2qK95aZJTA4sqiaQjlB5LLCH/qD/sWZkxl0eUa7baZjWtsz0MKUmMEhRh+d0wGEqNyvPU+BalV
	xmdSHEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u94sF-00000003mQT-1B83;
	Sun, 27 Apr 2025 16:28:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u94qJ-00000003mI9-0HHm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 16:27:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224019ad9edso58398055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745771218; x=1746376018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=MC8OaGDoz0E9w5OAUDWygQ53zXkjDFuLzHVNbKY5EIX8FsTHUfutGtJRwJB/qvECaw
         1OcXzMRCbzhaHZ7gW5sH4MIn/thfjlYE5w3idZoqtc2vTU8hIkp3m0BiStCN0QK3tJOP
         qjk+crY0g5ISZX/EhCtQya9h0nO50aFOwGXO+ZpN+wiqhza2IOIz+XLhHk6kXiL9ZhAz
         rkbwwPYwA4z/I20TjJNnLPWdIWL6XyUga5m6fpsnoLiGK/QnSNmBDmEiKLDlSYAqNt8D
         RLgcF5XuxAFZ5xghCbYT7oFv7rknKA0VHkn5LpdYTDh4hIzulYlxmEDOxUFBOdoiYqaV
         sBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771218; x=1746376018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Hm8ymC3WlboH6v1puutB+PkeMUv87jriOcmD+BHZJ8=;
        b=uXjqKrm20ODtutw5mv2bYaueFPTeUWGQ5h6uahbyuupaT+l66US4LIzg4YflbdT8Ux
         94VizAnhvDGQkH1maTjmGwdrRvLXK0n7yBcV0N+VCBMZspwZTleqDkPMa1Oh8JETSP7D
         ixQMoDbB3ut6vFTXCMI0ufLH/sBmeg7E/azOQmKR+ttWJAoy/zgrbdf5oSVlB2ZJhgUy
         lZznsFmzcMwNON8mAR7Pc+5k04Li5SBE1yarJ2G+EW5ejhawb0zTpR3MDENK+C0lMEGt
         n22n2XgaQ2Y1nKuTcytApXNrkcnk7FMzskItiiZicICdBgAETI6xBqDQjE4/hWfrY7eM
         aXjA==
X-Forwarded-Encrypted: i=1; AJvYcCU9K7n33hV4PlYpXgrGZneAWnRZoXLY7oDzNHFPdN75pOM3pyTa+qohWUKgnSeAwzh24xVN4w8DxYHjHHA3G718@lists.infradead.org
X-Gm-Message-State: AOJu0YycLXuL+3MMBXvFUd8pYzPyEyAX1pvwtzTbutiE77wEncW20P4b
	DnP0NNcjKFoD5BsSlrMFdg+3CKE1lAtitXNemH0Zqsa+n8WJiC6/1A745Q4OBw==
X-Gm-Gg: ASbGncupVMFwOsnFbUz4xQjZ5PDbJzoF+Id3Y0gJ1WJ/k5b+cWEjozUy0ETL+qeveo+
	UJ5SaO4kdHQSuyN6gOk153AZ/WBoheP6TKQDY3jFYBWlkZhctvJLUMXUrz95QUp1xVk7bgBgoBw
	9q8ghpyWzg5JAYGJxZyFj/KKKzNLRpXRGzZEycJpV1JZhIL+c4DSD5Nijcwa+caifSzHHsxk52M
	zTCnePuaCr7+Mi8IgBAFhm347/OpJZfUpcKLg/+L1LTvLaKKp+h+9ex4sgs/5+cSvIH2D9Om12e
	+cE5uZ4LbpNsopclhz1BbVYxC0sMfmqo0hlOI/84xP9YbCwdH2eg
X-Google-Smtp-Source: AGHT+IGewTBDql+2+UdyTbCLzjXJegcsr5fvdoDv6DORAwSGJR8R6yqyunL8uBX+TIfarA0AmXkmwQ==
X-Received: by 2002:a17:902:ccca:b0:220:f795:5f14 with SMTP id d9443c01a7336-22dbf5f0b82mr130834365ad.27.1745771218030;
        Sun, 27 Apr 2025 09:26:58 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216adbsm65705855ad.234.2025.04.27.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:26:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pci: j721e: fix host/endpoint dependencies
Date: Sun, 27 Apr 2025 21:56:46 +0530
Message-ID: <174577118328.83097.3904673051712701084.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423162523.2060405-1-arnd@kernel.org>
References: <20250423162523.2060405-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_092659_114621_224A1228 
X-CRM114-Status: GOOD (  10.66  )
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


On Wed, 23 Apr 2025 18:25:16 +0200, Arnd Bergmann wrote:
> The j721e driver has a single platform driver that can be built-in or
> a loadable module, but it calls two separate backend drivers depending
> on whether it is a host or endpoint.
> 
> If the two modes are not the same, we can end up with a situation where
> the built-in pci-j721e driver tries to call the modular host or endpoint
> driver, which causes a link failure:
> 
> [...]

Applied, thanks!

[1/1] pci: j721e: fix host/endpoint dependencies
      commit: 10aae64c2fb5148409cc9beba7f849a79fe82f17

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

