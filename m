Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2508CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XkEhPQwNtmSlycuLC3g8JLSdLRDEM4aNuSFfkt353w8=; b=UqiT1Xq4qbjInW
	wddSkZiRe40esaizDVvkGIp8VuFDO97amFmA4XAW9ja5RYHhsRuFD70KRqysQPWxKEuQhmc6RQdFD
	dGKKImS8HzLP4bLm9VPiDgaRwHNxz5xFxbDAFTi4BlRibspP0x3o2HmuXsNG4efp5uJGPB8zygxCp
	FSeK7ziSk1X/11YsRKBW/VCdXJwX/a4AYPKkXKNmb/fRSJBgYeieIs8s+Y/7Oljbbq3rBqcertS8E
	p9OWVyiqdMQE5/o8fr4F2EDabomLODSp4HtCobbUV+GEnwaardFu8g9wy9JZdLWYGpQFjHFVN8Jqr
	FQJiYyxUjSd6KkdrTTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVc-0000000Adof-1p8u;
	Thu, 02 Oct 2025 14:42:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVZ-0000000AdnQ-3Iro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso1242173e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416131; x=1760020931; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkEhPQwNtmSlycuLC3g8JLSdLRDEM4aNuSFfkt353w8=;
        b=XKIT6p/+yUbO5p1cSFc1vLPuH8xnskL/F1UrHOFzBKCIiwyGhCKUganWdWwsBw9vOA
         YMLwPcRtsB4/d8ueAW3X58CNEuTJs8ipNLugaBSDx1BqomA/UrOyacA+dVR2dafG3DlX
         JlaTItXeLVQt8sbwM4/hrNw5qX7werLv71P0KLPxOEDAE+naxepN1vlxmMt3sHecNcqr
         Ljf6pHPav8PNGY3difgRFk8sMyFH51wS+i5Vivt5oX6TOyeWe6zVshozoB9TfzBXII3i
         5W9QtBmAa2f6+ZlDFoIsH3FlfJDx7nTon/Imm4U7fGXf0j1BFxeLJJWd+AhqWAmZvn7h
         rFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416131; x=1760020931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkEhPQwNtmSlycuLC3g8JLSdLRDEM4aNuSFfkt353w8=;
        b=vYJr6xOyQLEIzQ5WF8e05yJ+5rGA+Z7C1xv92KAcQANf0y8ZDR81d0YTIyVHCB3OlK
         1nyBbCnqSiofOoBcsVDMNFdcJ8wL13EK84tho3SzFfqGN+seshiAyFqHiEEQAMj3JizB
         KdLBYWzf2wpDJ5jAP2rlsLUjdcw08oERSwcZQBrkEF3TDYkyqZcv1WacKmKpZM3CMjVV
         3J+kdPBTTZgYFiIp3dSctj4LKsc6cXCoccIWkARrPZTKMvB7JfJo6zflv0rqTcHI5m00
         1mAstmb/TU9x46xailfXmSu5RLURVyw5qqZGOCsqd/mjg5EQsc8qeoTPptdmSaAIlsn9
         gukQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS0fgvqFa3kulbLFSvaQPmudTnc/NFiznapyKAL+4vQVgMaOtI0+kjwDv4G+Ky8VDIpIu8roGpF+LD8naKOIyk@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8lPDKWuS8YMH7RTlayW1oqZcRNeZTFm0zOMNj0HEia8jpBo6
	DVQBG9VE5V/PZiH+GmEUmqiSVH4AB9BdA6laSfh7Jzlz+o5BsJyA3TdbIu8vW4Oy0go=
X-Gm-Gg: ASbGncuf4kYs/PEjS1/vTYSBDylAVXxkx0+Qim7goKE31eINle/4Sje/XT23HnGv/Kn
	InjJ0X43EyVRCNrA8U1AbvVA5St2BLumUk2O2ZhCG5dApnecd/nRSa+kbIl4RrLJxzpw9IenbOh
	myfQxCW0IWAlAjBC8/oE/+sTxwHCJ+nFXZ7tzcqC2lsCcorQPV0IpsrGZsxCTIuNVtBeFaaCfpv
	AoYsHGmWgqyse1hr/imeEwTUEvYQvqr9srY7v/B69fc6pY1RMEfmyQt1weVlrLo0y9rJLMgA8QY
	dQpxV9RtPHc/+Sla1hbZV1wB2J7ePZXu/HISicwQkn8PPV28Zpr8sB8nJOs6ETw0dwPsMTBPJbC
	K179tyTx/LlzWIiQ5Q6pY79/gKAndSeeQt3ca2N34ZvNzUgEluZ2YPeBVtJm4/k/0hvFJLdXvcb
	Tvawtt3CTc244W2e4=
X-Google-Smtp-Source: AGHT+IEJrVmC9w57f3G5Kl4iwhrNotYoJdOTKctK4lxmuohghlxTqkB5k3mcuvU7EJGSvorrZ8awuQ==
X-Received: by 2002:a05:6512:ea7:b0:57b:5f02:e9e9 with SMTP id 2adb3069b0e04-58af9eadd91mr2337387e87.7.1759416131104;
        Thu, 02 Oct 2025 07:42:11 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:10 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/5] I2C Mux per channel bus speed
Date: Thu, 02 Oct 2025 16:41:31 +0200
Message-Id: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABuP3mgC/z3MQQrCMBCF4auUWRuZTGqxrryHdBGTsR2wrSQaK
 iV3NxZx+T8e3wqRg3CEU7VC4CRR5qkE7Spwg516VuJLAyEdsNVGCTk1vhZ1RWyMZ7JceyjvR+C
 bLJt06UoPEp9zeG9w0t/1ZxD9jaQVKjq6traNxtbguR+t3PduHqHLOX8Atnmbq54AAAA=
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=39T0ma2tQY2ash6Qo2ada6hVH3JsIkkZza4MfO3ZBHI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8jY8sNNc0W7j8+Y80la2dbww0CwGRU2EPcx
 iK+iv54Ty6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PIwAKCRCIgE5vWV1S
 MtdpEADCljn+7Mdpkj70JlrseklPeiZHTd2xkmb6vlLy+z8HENjFXbtsU6NJjeswQ2kPPcJxlY3
 2KC0ukpz1U+3e+iLYJmFRxA39N8xEWhYET6juCq57IDIwUsJU7e82ZDsGsPnJykYYJ/F2I0peC5
 a68188K9FFLFR4q1zT5kANMW4ODO4Mkps1ohqYWjNAabOoazrEZL4g5HuzJe1UPHoC/1D/7u2X0
 BDFjWcRKvbiIVT4t7pyvNRws7iCp9VCU3g7u0C6uzOud/zzhHVg2sjM7PCqa5b6WpKkbEmPxSBV
 wQX2NAV1dTcFoXst5RavMMtdKPcv1JIxYGCpZ+4wAQAJGr+hDS7sJP+lZi3g15qIJzCDJyyPy26
 eQXldCCW4BZ/Ht6KFmrneaMeyKG3pJ3b8RKWzEI0D0KxYCvMEf0F7XitMahVf3+hkuCZ3T0XIKa
 vWWpYh6qSC7H1RlAL8CakxoOrW/+muBNEJP1bRyA1cq7VxX8eFzWgeY+ptSpzNHYDF9JOwgCN8F
 +cPFfC+6IHMO7v7MzifND4uvVXIiLIZY7FUam/wZtClm1zMXHqBAUW1OwPaUfBiHwNqwQgdK5C0
 ToEo7rK7JUQZAWIWvnQSWV+NsZmGsHaWsccya3JAWbK9QZqw09u1e0ITEEu5i6bOINIO8qO2pzQ
 coHzCHjqmE1S8Ew==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074213_867612_AF2923A0 
X-CRM114-Status: GOOD (  16.28  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev
- Removed idle_state from mux core
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 115 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 323 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


