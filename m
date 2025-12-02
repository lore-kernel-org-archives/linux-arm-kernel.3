Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8260CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=; b=emfKjSlj4H2u/V
	Gb36B35fPQR4OduNykYqoCN/6dN3IF6XqRGLyQdRL/y87t5Ie2DmyFhp9y1hu8Lj5HHqhWi20sZ2p
	Qkrw4jKl+ZdCHe+WLE0YTqxWkq3KX54iW2bftIg96MrMre68umkoNjSWNrw1jXtxB7eQhqlIFVC4L
	nmlJuvK66L1EBwmwg3KhP/Noq5UChCHwRtfjKLkIeQ4g1t3LwIL7hG/zNvxYTEVQEAO+aVuH96aw6
	4LbjP6uXLDkuebEslcSsN2jWkYKmFoweMGXGTb9qZr8yswBjnR7G5x6VcFXLXlxN4O2yDBoobyba/
	ZjIDdj/Hs52nSlV7XV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTe-000000051uu-45oz;
	Tue, 02 Dec 2025 08:11:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTa-000000051ta-1cUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5958931c9c7so6800674e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663068; x=1765267868; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=dvzVAaqqO6LOMCxnoU4Nw13+Fsb8NnkvYKHV4pKTsTSeGagkz7tjhnXsefFhqT9JWG
         Vv2808gGvpm+GRQTEvxNddd8xg4jwumCkDJe69xG06vkSB4YNI25bwzGXbANS8yBdXoM
         WS2Jjy5S7yo0tDJC2xcEDS16CRPSdYEug1WNBiBo8Bl4ZOeDGLWt/zamUeY0YUx+C48Q
         Aj60VsrRDwAU85xHhlxPBbvLnbnqookShkj0mnfY4YgYMfkF+ugf0d5XTbnwUAGcHpcg
         oeecywTDSUql5KD2MEajC9qmUQ4At2yDfu8vC1k9rmRpBiV6vVIIv0UxYB1H6LVV81qq
         aabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663068; x=1765267868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=ncRMzgX80srHTD93zH3M83tq2SjgBm/goLRRfPS0+AXNgGt8iuQGl6mdFTPPJPh5Cg
         D88gMBnYUf1aDAN0UQeH9BJGCfkXGRVZGORUHjzxjmplcmjWo4ycCVPA8e2xhUCsE2r6
         h8qbY2qfIPf8j7AUBaQS3/YzNrc4lm63z0knygV6DhzPG+GO6PBygWk258uyPyXUlOGv
         PXWytbCHXFM2iyogWGroq6UBRV9vE0J0GMcTACYdYZlUixRe9oIKpiy8O0gt3LdtkTYr
         1KX3jLwnMjD9c5x918naWHFrX9lDCTEMF6IjDtUYs6e0v2/OVYrsbYd/g0li0XuLSIh0
         1rFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3QnAXyAnM23FzIRTO71MVcIRHX7ZrngPmHLavaCp94qKSGU43MARs7nAcovnjDZrkj6m7Bf4L9d8MXZGEggc@lists.infradead.org
X-Gm-Message-State: AOJu0YxS9R+GarQic0EJMRjVE054BCqETZPTDE1DoOytmFWjvK+YAA+j
	1FzNg96ntDG917VMVYKjLF7kq0Wk3FHXrn0EJMNMpAbPOdFQnfMHyDKP
X-Gm-Gg: ASbGnctQ3Jw1l48YmKjpaorOVEZHviSSPcRCQbvfbl1B4QDDaeHZ+ztPxvcni+o+DBr
	MtlHeg/SUXUmqcmq362ZvWuKq0gnyFKSzHC4bKqhQqLRfz2+JKKgRCLeX1YFb8Q9Gqh3t/oPbd8
	mr+EfspdBQPijnAKKXQYRrqmVRi/6bxodKmqzdmSN8ivFHjvNFwoDZs8FU7i6X9j+PiIQtI+HJG
	sAC7kCcP0jOHTWqjxanJm/IBsdmwqR3X3TJk105G3X9LtACxdUALpkc4Vs21QZZ8cydBxyrj8zs
	acBQcGhngwFY3Jk2lEOCv1LMQ5KB9S1Cie1GDHDHw8b06Ro+y99H5y7dH4lojoaHL/FSv12feR9
	oxtTs2XK5En8i9nR0CXytPU7ZxgFpNEPM5MldvzocgiZKcnDxDi4iv2GXPLQrLDdpcx1aYE3eYB
	1XX3dBUhhM2qxZNbh4a40Y/R6fUKLWt34+1XhE0jz4gwX7EHzTCoO4H6MF
X-Google-Smtp-Source: AGHT+IGcS7CAMpFll0HDY1O5Zc12OFfNXQCkOaMz5QDXoS3vLroZPpTO+QAD1qGXjYgUcQjKN8+L0Q==
X-Received: by 2002:a05:6512:238c:b0:595:81c1:c55 with SMTP id 2adb3069b0e04-596b4e5291amr9885439e87.8.1764663067375;
        Tue, 02 Dec 2025 00:11:07 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:06 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Date: Tue, 02 Dec 2025 09:09:47 +0100
Message-Id: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp78pYwoet71tdqujVKWQY+kM7X6WyKFAkliF
 Xjst0GN/jCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6e/AAKCRCIgE5vWV1S
 Mv1QD/wMhwHoL7P0C1vQazs6dCzVgyo/k425LFs4zXAn+5CKQ2bz66GMez+ydkttdb5SJBWqSlQ
 8MZcZ9f3oMizlyyRkpWSXhfaxWaNjOCX6MZhXu7nblI3jQQQ0xODz3Sr74G+W2iuGJ74gEO4ye9
 s7+LGvIJ6eJ8DwyRwkYQmaJQA6mRfY6SxH2dMHhPOUNCCRf4QuA4AEnejDhk8QIsqzKZcRpYK4Q
 4+W88jRIDFUF4hwbml/Yc+LtLaTJjdWeLKDVatv+/Dq6/RhUHsF8u723mt3+5li4rUk/FVN/fVq
 0RMarYoOByISWXzB9D8cbcvJt22Voc5ab3yxWBBgRKApHR7v20CGTG7q6LKq0ONKKkmbZl12OGW
 Iwy9rB3SDae4gnConpK+1+qmfZQ61MmlnRhbIBO/P1tIZRHh3t/O80FapUz3uP+WTJqvwqn4Oxi
 CrNZl/bJCNlJrT2OWTJWoTW0D92OD2AfVTsMg+OmDrtlUDthA5U5bDXDotDCwQraaM24TA3KS3J
 69tXDM9D+ThyovYITVrMauPapqr2Sp8Taf6RDm3S8b0gJN9GoDkJunVEfXEn+REu4uBJ1brW1AE
 TLV5T9QspmWzZdq3bT5LzBWgYiTNw0b77foXsHAjZtZyss0T2FzOuJaA5ia5H/M2UGVs+NXV0jP
 Qqk6GHTaggq6Vlw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001110_482213_2D0FDC7B 
X-CRM114-Status: GOOD (  16.01  )
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
Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
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
 drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 324 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


