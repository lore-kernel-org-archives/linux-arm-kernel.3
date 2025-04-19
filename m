Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3623C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lTgQTvZYqN0TLCj43/V6Q2NyHBYHePk/+H2FCWatKs=; b=wqW+FYs59jvTvn5S1CgIjSSstj
	UNy0q+w+MFdaEgtzlaiP+xKczsg8vTQWTMvV8jRaKWbSog/vzQMi8UOZBL6VYpfcD3NuGbsv8LnOT
	D7+12MkfzcZgKwCibtLJrjAXBIUQAF6N7NP4we/ukdgnPWSNrBBN7yLieLXY43MT1ZgtmpTa+B71A
	hYMzv4CWRfUziX6LAfxB/j3u/NuL1/nxBE4ze612B1LusdCgd21/x0yC0+ysHbdQs7CiX1+wM45ln
	ObT0lLGk3HJJVhNx61A5gevuxSLKaAoQ2cqBOpgUbvzNfG9ky/l9ZIe5Vn2H/pQin6eyamK7E0/k4
	RwKHEngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u61Kl-00000000uMt-25vF;
	Sat, 19 Apr 2025 06:05:47 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u61Iq-00000000u83-1ehM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 06:03:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso1529165a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745042627; x=1745647427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lTgQTvZYqN0TLCj43/V6Q2NyHBYHePk/+H2FCWatKs=;
        b=BIan4GlcbBUMsc3rq2ddp8JtsjP16M7329jPqbRMkasDEwMth/UCaKmbYOeJvBUotw
         ndYVxX3QIC9hqwTfv/Nn9ys1mjN1mqd7W8D+ed7f/Yz/JUHmjL8vsue7ZgmV80ogmhvJ
         CQ/v4voAr3Svwkulhm1fA2O7HO4UQkXhAnpL+4cfr4uVKt7JA1HQgusDaBPpIm3NjCUK
         E0/sYtZOhcu7FmytT7uj7BPnaZApdc8mCCvOSBiaLgFnTiIT5mtAcrBShsFDNd96HQ5Y
         DOKmxFd/SHOF4w8Wwov4cKGK75w6RgsvdlRGzitEAl77Chye7QYMnLXGPOcKMHcH7W+n
         lrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745042627; x=1745647427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lTgQTvZYqN0TLCj43/V6Q2NyHBYHePk/+H2FCWatKs=;
        b=KbTqVmg4oBDn2vHwgwTPdYpfAWZvOwwXGRTxCrvzsEzdflELjPv3MGtH40nhNSAudg
         UdEnBowcloxVFWflBkmA/J9x1bV+Q7lgA8jDAEaSGosW/rBqEFfXGRLZsTxbDhRpXDat
         o+iYCIDw0fTp4MDmoK9tCm7Il7HfqBZQB/9GVZdMoA7c/kuaUikUzibDegHkzBf+3Ru5
         4+zzV8woShwdhIhtzEtZURvur9PyuqtUIZ/2yrghZixzKGAcAQhTMdAJjGeg4horhQ+s
         uKRNdTagBV2zPC+mjZVOFT2g/m8p8bMot8HXqi/k7eIYUGao3/tah2/0YOoaD8fPtTfs
         M+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWmmUEOVud+8mnB0HPONGoJ4BWZhhl7K8hVzvV2kBFfMompGS9eh/LCJCU81QeKkOQTdfbnZRqaaKwg4BDviYD9@lists.infradead.org
X-Gm-Message-State: AOJu0YwUtJpNvubHSGt1MgMyKWiGTCJHj7ulLf3g+lY6vUrp+mCMBjkE
	He3oyP7tQT2DmO5X1rkNGXo0MqEq0QXlxL4r7pI9XjOZFIIc+ABnfOEDbMwRXg==
X-Gm-Gg: ASbGncv47y/vNJioDw0trD/iFbxg5J7jQ823dWRZnj2cGHF9Cx5dvLPJZKAII958AsB
	Y73C+XYv2puxnkMqp4m9AneN0Ojn88Mp8ZPZu/mZ9Howef/GhWDDFz4rWJxiAux01f36oyMlDmR
	l0AJ9HMnM0zmUn/p3N+anKzAIEMDkQhpjAgXU9xpyIoGU9G3YXG0tnQfaFn1OcX9vcXWhuMlUn9
	6Nb9W46BEr2/R1bsVUFKyw18ttqD8Iu0PvtA72jXOnqI9QzUNFFELmYHVeFtK2ZrlVOCCOIx3Fr
	huk+HC25umD2GvLKYggPdiv39FAwOi811osCzY6/H9ehYEoy+XZqNEZzXKmo+K1b
X-Google-Smtp-Source: AGHT+IHe7z+mwljypPJwxHYQDW6Or2SxhxqJIzdabeYhZVRypfM4toLH9er4he0mUfYtnDMuCNfesQ==
X-Received: by 2002:a17:902:e546:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22c535a7ec7mr65152705ad.23.1745042626951;
        Fri, 18 Apr 2025 23:03:46 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf7ecsm2609173b3a.31.2025.04.18.23.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 23:03:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
Date: Sat, 19 Apr 2025 11:33:32 +0530
Message-ID: <174504243663.11666.13632057141942882562.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107153255.2740610-1-robh@kernel.org>
References: <20241107153255.2740610-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_230348_447206_8EB38F44 
X-CRM114-Status: UNSURE (   9.00  )
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


On Thu, 07 Nov 2024 09:32:55 -0600, Rob Herring (Arm) wrote:
> The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> but it's still just normal "ranges" as far as parsing is concerned.
> Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> instead of open coding the parsing.
> 
> 

Applied to controller/mvebu, thanks!

[1/1] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
      commit: 506d34571e2f204c991aefe3f1300175907594e3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

