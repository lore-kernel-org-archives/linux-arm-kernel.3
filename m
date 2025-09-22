Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h5lLrTEPfjBEE6+72ClqjipyByMm2X0eEE6L7Qy2HzE=; b=OgQkgrRIrqoXFd
	Nii4KNgau1jc9hSWT+t/s4i3AxUDgGPbMmX2A5CTrXgRQvsEdJqY578OEruJFCYxYckTQG2EbBL0s
	GZS4OHSnyB92lwRBwIcTQsO6AbXpu2kTZoMojazoiD7e9X7UQ7P9jxkwuk35N0XyfSdPIjj1ItpsF
	FsjJkONM53ykNi1kmu1P68MeFT08DlG8mkdIErdB/H+2RLKUuD5kB1iQudzVveTYQsQcLbOrrGcTz
	7tF8BG4BWRFIYEAArBhuu7gyGAna47eBJZWTpLCcGZvps06jQXaroYhbS1DW2Dj03VQhJE5/1TiOO
	36yOUXyzPvEk4q1zd8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvk-00000008wkU-0uON;
	Mon, 22 Sep 2025 06:21:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvh-00000008wif-2Z1d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:42 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-36a6a397477so9163731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522099; x=1759126899; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5lLrTEPfjBEE6+72ClqjipyByMm2X0eEE6L7Qy2HzE=;
        b=S/r51QeHkaYEataSSJLMPyTTTmHi/Y7yefJqjPqbT9SFjK+4Ov8KhELbcsc+mx3Str
         3LT5vH8HMIyl5LZVELwqNdmqpPwTxlJytuLoh5uJ2SJ0DuGAjOYFOBupEHcFQrD0iU6b
         6n2PqgACg4TeEeG+zZ+GbnbJz/FG1TravugxdwQNIN4QhZhh+XGWF02Rx9py7q8/2cKV
         4JUvtcYwp6ITabRGfNLYOX8o5nZvBROxWHW9UlLyBrep5BaENAo7VogUe26HIrPtdxFJ
         qrOTC+jWBJsOm9iOQAU9V78Pu/MVEShuG0M7XfTwn/8el/Zwl59GesPZq9H9K5Ucz3K5
         5hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522099; x=1759126899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5lLrTEPfjBEE6+72ClqjipyByMm2X0eEE6L7Qy2HzE=;
        b=a50mHuRf+MCWoYlg+pXh2c2SydDcTnomh+Rf3TG88UPvHmqHDHSBnK/X9k/cdi10x8
         Qb3/cFO1viVYeC/BCJs/n6p84q7HgXHn1C8OSHubUraKLSWfvMDclGZQqT/GYjgmoxs0
         m3xFOkFBHRKV4do+gwTqQWrfNB74GaCaHc8PehvgTZAz3yx8yMREPB4Iav/Vquf7wfn3
         OST2TnVGwNYFJzWY9UFzds/yGQwYyFTa1VheNAt+JIJpwPIBfpdBiKVoXZWIUcguDgHt
         Jj0aVq7Bt77nRasXhR5kNQEAgnlI1kEZCNQq4VG5YzTt0XzPIcsPNcEzH+R9py0bxH51
         lRnw==
X-Forwarded-Encrypted: i=1; AJvYcCUyhYDWTPo+DePIxCiywSVX+OauVxCPEW9pEqqCXV/DvOmq0xMvJMuAVKfBLIWjGWBWs0IIidDuqIqDLw/hYk8T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Hiy7NhrgoM/AAI4Ueg58ZSXd/s/v/XTrZ2dys5V5n1MkYE9X
	UyAaugd3unM6otAbcop0OpUSCdz06lgIHQ9S3tbwcm98HClEXu4xSa/7
X-Gm-Gg: ASbGncv9z7I40L8LzbIuq10gVqzDewiucwf82Ooy55/42TsmD3/RvCCzR49X5ze0qmA
	0fWUVubWFHtpZW6HNCR55Z4bHuu6ChB1ndE8Gfj9BH+BoqKcYsxbjEP5zayVfm56Utm5XmftX2v
	lOMNjGhyKiQKlFlIEg1lyvHlf1xh1Ag2f1jO7LqTahM8mtTnJ7wmNDY4OkchbUcJxECQiFYd7eJ
	+9FydbQ0AdtsVcc5uWSt+h34tk9Miz5NqbgD22LmcgKah9lGfn9oz+3ypt2vwhMJ8ja4cayNc/K
	Zk6hgG3dadzjRGQV2LYzVAsGtb0qhJxGGcXApU/4tXbI+gyPE+2cqKlhmwkgcBXQM5EoBS+5n1q
	k9qNvEEYnDR3a8LDBWEJz05S/NAr6TKzxJpXXH71BGkpwhAiybiCrpgsUlT+eIdsO1jE=
X-Google-Smtp-Source: AGHT+IHF5DNe3flJ6FiaAnZ0MCzodBxytK9lAnP/8PhSe4SRX4JUFirBe6Je3qK5XyJdksPNiUzhLw==
X-Received: by 2002:a05:651c:556:b0:36a:1e4a:a3b9 with SMTP id 38308e7fff4ca-36a1e4aac34mr17785091fa.43.1758522098976;
        Sun, 21 Sep 2025 23:21:38 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RFC 0/7] I2C Mux per channel bus speed
Date: Mon, 22 Sep 2025 08:20:55 +0200
Message-Id: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfq0GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Nj3UyjZN3c0grdJAMDM+OUVKPEVJMUJaDqgqLUtMwKsEnRSkFuzkq
 xtbUAhmqzYl4AAAA=
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zFtLVcaN8AVG5mTTYVcmEefIdazqWW51ehPhjn82GYg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrJIlZZ5BbpTRin9vUd3CQ+TLwiZ5wiSDt2E
 r30mcyo96KJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDqyQAKCRCIgE5vWV1S
 MiE+D/4wpCm8XHYdhhQW/Eo8ZkK3Vdr1X5BvcE16VcIGRV2FLr3/l+XDmI/uY4TIlS4cgGRjHuS
 okNslUvKkkygOo4BPHMyOniCKYNSD7oXNZc5vM3mQeA9m28FqtTbj/SK3i186jLocWMGUihvYeO
 0yBO/vwjr4TNlI1Az7/uGDt8XkjSq9JQ3zQwxyNvHIorC69OKn+9SD2AY1PS/rGv0frcea3NB5p
 DBpeIpyf7z5tHTvWvb5RObq1alrjyrWfmGy7YJrQMyXCARkjwXLWtPiR896E4w5ssujKKdYNoFd
 O016DHhA9ocy1jJ4HgEm/5oA94InzRv8srqwHLx+x3r8zpXgiRahYlfhDUDASuO82tTAZunVi2/
 KBGADBc5YV7xrhomCybSlcFWoSMJFaTVo6/vUEP18RQhJErmC5uzZBa0UrU1MMkVHRXo/MT3MCf
 lfsBDD6AtcXesXv6qECU2mSGdIofeTE5Eo5claApOaj8JmH0/TTYfmgMiibuPcIVjDDsDesMecH
 eA0o238/65NuLOBqynNUkjSDf3Eo8QdhvxtayiWrGdS+MP5dZbYRfkMkqVtgVOHbH6fVdFLDGXC
 nG3TY0ZF/T5pheNMtswoldHL4LYOL9UCsdmk08F1m52KyL7jj+WGL3qMGA96GtSJepMhWaso6JO
 ryv685KOSmLJrcQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232141_692527_5FE3A55D 
X-CRM114-Status: GOOD (  16.27  )
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

This is an RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.

The benefit with this approach is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #7.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce idle state to the mux core.
Patch #3 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #4 Set idle state for an example mux driver
Patch #5 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #6 Implement set_clk_freq for the i2c-davinci driver
Parch #7 Update documentation with this feature

[1] https://elixir.bootlin.com/linux/v6.16.7/source/Documentation/i2c/i2c-topology.rst#L240
[2] https://elixir.bootlin.com/linux/v6.16.7/source/Documentation/i2c/i2c-topology.rst#L298
[3] https://elixir.bootlin.com/linux/v6.16.7/source/Documentation/i2c/i2c-topology.rst#L322

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (7):
      i2c: core: add callback to change bus frequency
      i2c: mux: add idle_state property to i2c_mux_core
      i2c: mux: add support for per channel bus frequency
      i2c: mux: ltc4306: set correct idle_state in i2c_mux_core
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst  | 176 ++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c    |  37 ++++++--
 drivers/i2c/i2c-mux.c               | 127 +++++++++++++++++++++++---
 drivers/i2c/muxes/i2c-mux-ltc4306.c |   3 +
 include/linux/i2c-mux.h             |  21 +++++
 include/linux/i2c.h                 |  13 +++
 6 files changed, 357 insertions(+), 20 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


