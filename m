Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7A4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=; b=0VBjxkCvtF3wwL
	YnnR0SrEGDc7QRXVhKY6ZRuBkV8PDFox8UIOok2ZWniOBn8G9hGFjuy2TGxTrWQDiDakr6+s8bYXA
	34ppxQw2DJU0A36yzoew83aSDi9EEDM8SXJ0LzHiPRr2NQvIAOYSXgiBhgh5gFbzHDknLgNKWsiEy
	IA6c2LSp4+kwS03dFw3v9HOOZMA1lFUXXrIRDjT5UCBCpIPvsOEXIrqpxek79IdNS9P0GabRl9j38
	iA+OiQ6YqVbG1ElJw3NzAwZmRmhe5Kw9q/dfHODF2VHN2pGyN6FLYZWzekg+FPHiC+Hi0VnMvssf1
	q7sbMvigud0ZIYpBNK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9a-0000000CB4P-0Kd6;
	Mon, 20 Oct 2025 07:18:02 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9X-0000000CB35-0tFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:00 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso42422861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944677; x=1761549477; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=DE8U4Ff7eNe8ZOOCAqUDZwbw3TS8m5XlgTTREVHFqw739MIDL3z/WdU40XnWlnZdU1
         I468LA/6zWs6Oolns6FknpvsHZ5qHvpfxIhQOBdoPatAULXGOI93eyt+C9Qe26HMTrt5
         2hGwGYlRdPjB9rcq4Xzllll0MsrXFGLIlJuVYRElopytGbbmIuAjWP+xtAmNtqYKZlmw
         ITtfGlCA0aQG4BiBiw667T+lvqzNeN65MIKAQAKcLdulMElRWmzA6BRLCl2Vr5klhR7M
         Wc8odZl8EqYF5TrF0njzIau1wgAal3EGtwSmD8wpSDRLidsWCHPfIHn6kaDa0h4Nx4aX
         6OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944677; x=1761549477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=qBn///RizGFv5lVIP3EaSR9WyDeK0geE+99+sDWlxLaLBnKo4HctsUupPubEfVpL5l
         AMrcXawDQFGC9L90E5HmIqJNsVdlHuSqRK05eUI2Fls52X1Zyk7SQUjjnyOApUaLl2Ds
         w6pXFnSEFHFb6Oe8PXcfddgv86J5nxuI6vz9NYep33ZwRt/uH4URRqdiNhvzUw+dOfl8
         HeBeJyMrw+ZRjnn3yUQO3I+0tOo0nXxdizkKkKbZcvE9wxHWfoAGY2AopbSoThyKvdMA
         s0YEiWnp8w7YiPNo7COzAk1Ot99zhji9NCxMOGg6zxAZ9G1rzZ3iZLxHup/Ot0ckcbMp
         gLIg==
X-Forwarded-Encrypted: i=1; AJvYcCWURkYOrA7+ZfCBJercPcYCqFYkG4qthgAD+JXbxCjAiWa7eHW4vKKVP82EY2STMR6qrk+V7NQcTeuZT0Cqnv8C@lists.infradead.org
X-Gm-Message-State: AOJu0YwQZn73N0jBDhlszG9VdilrYN7M9vNTEonLiH2q+Nyn+DR+ysMn
	60bPtLPhZY2pck2q2Z3gUTLjENfTjVJ1ce/G2cnsJ2oJ1mHhRYAVTUtu
X-Gm-Gg: ASbGncsXGGzcu44iU07uDHso7rRQkRJp3PiHXGP7SJI2FNjoq0ICW5TOdQjZ7J+0+WU
	GQRXmhwxqmXDgrR5q8oq+brUMeJSWeEiNd9oVpD6j1g9mKgaxafIpEkEiwrroFK21tqHYWk7ShH
	sc+/EzSccatPpWnmXeoq3EKy6EVNfdq37wKf9/21jvvZBt8kSfNFGORN4tsFKM2aLjPRXqF75Sl
	9iK4cFlbN04JNJZjz8V+HpyMT1UjbHZht6z/3w8lU0hkXRjnasM2MoC57JxLUf9me7Lsg6J68h+
	n6FE0zDbBO6Fpy0awA0C4gGsa+0b7Q4wSu7o5P2RFwWfOnLs6u62QBp+HwbtBx27PV2NBWde4HI
	mIF+JNsbXGhLcaqwDvdhp64rXgd/aumb+E94GFHiTWiOgartyQyE0GLhdyQ08GRxPRgisgLIG7o
	n/u3fWL+9xyoSsPqo+VoXQMy2tQ+HNW4uQ620I+YQmH22+J5JBejsNAa8=
X-Google-Smtp-Source: AGHT+IFIUr81RYs1HnZHUDaeh17UXtMO+MIIH4Sl+yVvk+zd3TV85RaBPn3bfogTKTF+CcTwgZ/zgg==
X-Received: by 2002:a2e:be88:0:b0:36d:a459:f0a4 with SMTP id 38308e7fff4ca-3779782374emr39869861fa.5.1760944676478;
        Mon, 20 Oct 2025 00:17:56 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:17:55 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/5] I2C Mux per channel bus speed
Date: Mon, 20 Oct 2025 09:17:23 +0200
Message-Id: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPi9WgC/02MwQ6CMBAFf4X0bM12Cw315H8YD6WtsImAabXBE
 P7dQgzhOC9vZmbRB/KRXYqZBZ8o0jhkkKeC2c4MrefkMjMErEALyQkt7z8TbwCUdB6NLx3L71f
 wD5q20u2euaP4HsN3Cyexrv8G4t5IggPH2urSKAFawrXtDT3PduzZ2ki4ewLg4GH2GqXrSpXW6
 UodvWVZfl4u8ojWAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIEheq7Rqmcp7HaHOoJV1mtgdBS1lD+tswqa
 CBMXmGlcneJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiBAAKCRCIgE5vWV1S
 MtfnD/9lcCqltRfYcuFLqJaGS85PuVBltcB/MmI4glYwIypiT86qEbIRd/znRNdYvwN5eUJw9m/
 1smtKC9UIIZ0brBXY+kGiNagQ3TZMxVu5tkMPuYWwRsr9Ew8bIQgZ7KDrzKHGjkvLGSg04lV21g
 sahrz1WrWqNkiPYqx+cs14PLmDCejJ+I4cA5CdWItiGHuFWnP5a+A1Y9ybeNYqviGmTZU22v2kO
 rsud7o993aMfWsb2qKz08cPr51wR/qIhoqdLK5vwlNOWXovKcPAYj+xA+w4++hV45tXM/UDnkOi
 DJ0MCxAfBGt1+tX4HgugIDJbCoWZ9m9wwyB9rABvR+Lc+AmvQ9z4uuAHOZl+xehPq1hrG/G34HC
 L3GhqXsuq7DVMdmS/OTF1gXskhLY5vYb+mWWUTiC1/CAlm4Ww7948aiJfZi3byW2cFSq2JSdcpv
 se73CpFn3fAI4jnTqNeOq+UN+JiaRdAaHFSAy+PWTap5YGwEFKaczF04MgpWheKBIcVt19l90IE
 hSYoqKrnOfjvcvWuLY5IrYuCwlEU7/qG4SNjpMNNjOoZcjfErHNzlKiNmuBehPq5bymf1f8eYD7
 uWm6x9IJJSEjc4bGO2cy6mc7bpVr2e7T70dT0uPI/XoOJDpcnnCzYzYr86CLLs5x+2fBTinYFR3
 iUOLAlBmvPYXRHA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001759_308086_24BF2F99 
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


