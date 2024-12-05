Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A424E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v3MPhJwBD5oTf6iFoKflaMZpBPCePKADttJt9GkyJFE=; b=UFjEGzMlXnc15m7ngkTFUlkHpm
	faZuVUEaSctBVOHW7vHYgp1m0wn4l4a6z7coynaeJ6oBH09Ws+GM1HbjBLyZXeFRLpYQ7zgDw4KSB
	XrZp+JLKaQL9/T2+oA6y5jZxkwNGeeQih2Cp1VZ46CRowgFzkau8HNWetYVo2muTDyVCDqbXR80sN
	K/btOX44Teum9ZmCuJXEMkvPBQQ/HwEs/RNwFwKYdtbDiQNf4jir3VE8IOWK8aaLG1fgTTrx4DMjr
	bwrY/cBSmqWX21jmMXavVxM9PcNnyX5rYJeM0dn/o55NZWieIHSxv3cH9S4Fr5FwsXtldJrkdtfrP
	UYZH/psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFsE-0000000GzkI-2wDo;
	Thu, 05 Dec 2024 17:42:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFrC-0000000GzPD-0X2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:41:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so552837f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733420500; x=1734025300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3MPhJwBD5oTf6iFoKflaMZpBPCePKADttJt9GkyJFE=;
        b=KYCGmwi1OYynjYKBnc05JijqEp2KozeqU/OBBybBBm3LEQJv2efsZUqnZHb4bC56FE
         qdDDXD/bRc8DST3rMDdjG5GrmwVmGbf+NLhnlW9WeMvo8w4kYoBW/CaCuxIpDXuf/dHN
         Pgf1ohnpLMgAInhQoO6vytlKRTw4OGhzfPjZqeBsr6qjMAnXVf2VFT7zxfrtHsesrdJK
         AluscEHEy/jq5Myc9AiazVrI+tf4GtSoHtksr6cWf9DRqRti7VDsa1/mGTpRcl899gjJ
         wlrKVKkx3do2VnCKR7k5pxzyBw95NgOEDs7rls9CshHA1eR1vLqYJtq8Wrb/4mmEAN9x
         jaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420500; x=1734025300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3MPhJwBD5oTf6iFoKflaMZpBPCePKADttJt9GkyJFE=;
        b=LUXBCLfCv+T8e5oNMtbVWwtNHFmjGAWX9fu/HdI+bF3Hd2vEza8SuqRxZIR/sBeG6X
         EYHhb0Zfz+TB2cXFQraMwAyvhAShvnQXPNM3XFQ9ZEeuxqFrjqhj1BSvE9f+7i0pBUY2
         1bD7WznSe6gdnxwbP3l3JnxhMDpnRQy4twDHBUmbY/d6umb2hQtOdJ2DgsP99GUsVMYz
         rKGD/8lNeaWfTPkpqOKvADsGU0/5MaUfH/PBAcXFWPK0/VMiz23FDd4o0Runh5NT8bIO
         QrOr/Q0xOcq/xCo+CgB2FZqA9j0CEz5zUBqLkngHCZJOhCQsTJG0RDGFWqlYOv5gxau9
         YR+A==
X-Forwarded-Encrypted: i=1; AJvYcCVHwh7W6Iraju3nYdN4olYl6vN6CLUt6aScih1/wsw9ZBpHPfBzO9iTUQeowBosaXOPUa6rHE1x7jaI1W4o3rDM@lists.infradead.org
X-Gm-Message-State: AOJu0YzqOUWBSkFlLRwFSb7JiASkiR8vdns9mR8i9JAceF82pV0WVKJn
	Hk8hJUVnWf2Sy8eJAE7gi8mScg+BGEg4oINFNHK2elItTZx2rbgGFw8K2zPB+tA=
X-Gm-Gg: ASbGncseAJ1g5a5yRfpQG1G/RinDV6wTr/K82Gw+7VnbbtbyDjb8DfR0tYTBf34KiR3
	HatLOg21Wd7QTniQCige7jC+ynq3MkKNjlkl9/gEb22u8rSkD8Qy/xhp9+18wULmQ0XAWSVATlw
	ul47/x1ujJNw/dJu/P7xZw0UPej+D3ratLYS9aHxtNO9Jk3FQCf8N/3q959tRxhY31x30KDteIK
	/w3v/gfKo+Gt8ToLkEEm3M09NxsIGQvRtlWgiWtHesuW9JHwR3s6TW8LE+25jj0iWkpHVJ+L4Ct
	GgR1PFxf944N7dkpQu3mCSEkxzPdPbPu
X-Google-Smtp-Source: AGHT+IEBZW6n47Yt+s6/TKyzpIN2ITI79WuAEcEJdI/9mAZaVb2ao49SofvZn0pUcMMqVpV+pvnJ3A==
X-Received: by 2002:a5d:5f45:0:b0:385:f607:f18a with SMTP id ffacd0b85a97d-385fd435f13mr9178585f8f.55.1733420500330;
        Thu, 05 Dec 2024 09:41:40 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm30318525e9.12.2024.12.05.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:41:39 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/3] mailbox: add samsung exynos driver
Date: Thu,  5 Dec 2024 17:41:34 +0000
Message-ID: <20241205174137.190545-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094142_178774_B6193CC5 
X-CRM114-Status: GOOD (  11.34  )
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

Hi,

The samsung exynos mailbox controller has 16 flag bits for hardware
interrupt generation and a shared register for passing mailbox messages.
When the controller is used by the ACPM protocol the shared register is
ignored and the mailbox controller acts as a doorbell. The controller
just raises the interrupt to APM after the ACPM protocol has written
the message to SRAM.

I mark this as v3 because it is a continuation of:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments 

Thanks,
ta

Tudor Ambarus (3):
  dt-bindings: mailbox: add bindings for samsung,exynos
  mailbox: add samsung exynos driver
  MAINTAINERS: add entry for samsung exynos mailbox driver

 .../bindings/mailbox/samsung,exynos.yaml      |  70 +++++++++
 MAINTAINERS                                   |   9 ++
 drivers/mailbox/Kconfig                       |  11 ++
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/exynos-mailbox.c              | 143 ++++++++++++++++++
 5 files changed, 235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
 create mode 100644 drivers/mailbox/exynos-mailbox.c

-- 
2.47.0.338.g60cca15819-goog


