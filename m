Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24168C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik+PKrYUz12n/bOV4S3ZmMhIipJ7tfQZAjp79yKcBVw=; b=03VGFPh224MKcCfZoc7LtgXCNo
	d4Ahk0XvEBoPPZllfw5qtk7RkyIFUHpg7YTUsAYqRI0Iup+6zBprRsyxv0C7k3/nMNe6X9W5LM2wY
	pHpAszV/F1yNF0lgN+2l5YAZNVdUdPP92bjjpdNjjttEuN7Ei7LHet3CZ25RpnZFL860rOWZBLGPc
	SKLqxbRRxx6pBoX58ze7wv4oPpeUNs28P6EBSQvqWu/Q0fJ6Cp/xXbIM8JfQ3xUXUaYweq18u46B5
	afCPQwvx3ZLruxCFcCdRryxnrQqd2L9n+j9lSeWciFYbMw+9vMaEjq4ow5qvfMUS2Tte8c7K7cqz/
	KMaCsKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u950w-00000003mqL-1wbf;
	Sun, 27 Apr 2025 16:37:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u94yz-00000003mjS-1Vqs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 16:35:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22c33e4fdb8so41599195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745771756; x=1746376556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik+PKrYUz12n/bOV4S3ZmMhIipJ7tfQZAjp79yKcBVw=;
        b=OsgPBD54ymYeNzT3z497pPGfcs5NroD0xPuvXtaQ3n6Lkdom97iLFifRal+SiRcx4b
         Lrhq3kG2J6PJ/XDZHiLKLfpLXTvVB7o5O6FV2L5YueBvC1LXd9iYAhmSVHpPkq58XrQ2
         27e2anLNVXGzSVBoXyquEOZ9rek4JUVBr2v5l93aY1njKbPfZb88AMU7OIRSvRLdNzvI
         OAnQknWYNtA4efaI64kJ9OnY3wDYydSFITUY3OPbZBEosM053VVq7LvnzGTRuDzlXHRX
         YgfmF/ote1GJ4U2000JsXnoLGNOa3PHl5zH7FQDoUVvBzmM+W315JaxuZtejqk10ZI2M
         p9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771756; x=1746376556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik+PKrYUz12n/bOV4S3ZmMhIipJ7tfQZAjp79yKcBVw=;
        b=MQF1CDjXZ5O8VCW0Z/HvASzPiegys/c1vLSdhKmwh5WgiMtb8k11U9Z1AW/nIWmCA4
         v/Sh74U8iRZD/QVgsXCq7c6Lf/jHIXECFkn7yiofkbWZnsRTi1D1A+FEkctZ48dfKkUv
         uZnm/6d0IJCNWT5CMW+ubTh03LOVtAfmVwr6MsR8jQ9zStT3GwMTkOmbb7089LylHMke
         1NTgMNFeiwmaisb+tp20jZAR5xy3QVD6lvgxkohSpC7ylfM88BSmwJt/rCeEJUMW7soj
         kAjtseTosjwWi9iiq5UydvR7Ntpitlp0t4wVWCY+yE71AKfDmN45lu1uErHPgIexdRji
         5vbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdMecUx36Qw5N6sHUjVKC4NJRpvZX7h28HKHvlmt2EOgIP2cbu/OZrO165iJmYgDi/vsdPyKj/TnD6uP/tZf6@lists.infradead.org
X-Gm-Message-State: AOJu0YxiF3g/o1OuTYP3jJIraU9MERUMUoucqryI6EJl7uHT2kwG6Dfa
	z1hjbB8bOjCeIiTxMjnoDsj2d7/u7PExS29kuST7xm2O9cMGZd6/PAp+0ESitw==
X-Gm-Gg: ASbGncvUiCnJihFX5B22XjW0mDAtWUiiVmOJ6676Hrh2xI+2kCFMSVJfVD75qERurbd
	rVrLLhPHTQdMFwNsQnx01m1y4Jf13GpxKEsN/NX/BJktSmxK3WbjkA77wSfpmbgFojnSmvt9eca
	MehLrcfNY751Svbpo83RsfiYH79E8poYHCBGnAt/rqokHW8W1WPi+4TrDyvXqMyw2neEU2epRAO
	em1cXvbU9aU87EN8CnGf5XqOz9flrB39qleBsSmoSvL5rn+fyD4V12Bx1J+Q4sjYP/O2NzX7eKw
	RRN0U+eH/KXVTQgpDqCxh4JL7KVAgJFH4R7plb3gI06e1aZJ+X/f
X-Google-Smtp-Source: AGHT+IEAjFA93KKywEnB4RlSwgSRb34pemnKDnzT+Il8EQ2sIWnFIevqhAIcyqRFAwl1jP0V/maVcQ==
X-Received: by 2002:a17:902:ef0b:b0:224:1005:7280 with SMTP id d9443c01a7336-22dbf62c74dmr150793215ad.38.1745771756017;
        Sun, 27 Apr 2025 09:35:56 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7851e0asm5329424a91.48.2025.04.27.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:35:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Zhiqiang.Hou@nxp.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: ls-gen4: Use to_delayed_work()
Date: Sun, 27 Apr 2025 22:05:46 +0530
Message-ID: <174577174111.84046.1840850940994966437.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414074241.3954081-1-nichen@iscas.ac.cn>
References: <20250414074241.3954081-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_093557_413993_16A36CD7 
X-CRM114-Status: UNSURE (   6.88  )
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


On Mon, 14 Apr 2025 15:42:41 +0800, Chen Ni wrote:
> Use to_delayed_work() instead of open-coding it.
> 
> 

Applied, thanks!

[1/1] PCI: ls-gen4: Use to_delayed_work()
      commit: 5e2664f9e108f66046869ed4990043421919465f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

