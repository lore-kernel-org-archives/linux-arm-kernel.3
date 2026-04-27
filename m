Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE082FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/QR1R5o6VCM5Z4T+4o9C/Uwm/kY5zS3IqERo7Ty4MIk=; b=YWt0K5d0LXUPHm
	ayAIfQEYXVn4WMcLyUh31cqFFrLNNXdkXl0GCZ4gnkYpB+Rt8Zj8ed833EWHt0PoXhRoWUTB2Vxds
	QG2aANFzWA3SQrpCLw275PaSL6WPbczzLv/Cmbd9laQj2S8GPXDGGKWoPnhVCylHKZ88DYq95UwKJ
	H9XbYvjArrEsCWh11zhpE7R3jqpxjEzSwt8t17FMN1Bvll/J5IMxkD8JSgKJnPxZCnIQ6JZh5I6Vg
	HFVxMdx9I7+SVVIrBX8ZBxphcprgTxcho7n3ie2xKV4vAdHOVWV+Szo+tPi+EY1f7NYBFsJu2EXXN
	NiWaLCEhCqTVIXvfXkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVU-0000000H9QC-3LuX;
	Mon, 27 Apr 2026 15:04:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVM-0000000H9O1-1wtc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso86629845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302250; x=1777907050; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QR1R5o6VCM5Z4T+4o9C/Uwm/kY5zS3IqERo7Ty4MIk=;
        b=UwXvidQEncoOJJepGRKX1pyZrFRHpw2xz8TOe3wfTkZQxajFaHDhea+UHUBzxwr0fn
         VM/jrjfPB6wLOKKcs9r4IbBfK8iXx4KYCoaXlIDQocO25N+SBJj8+YhRL3sASI5jU3Ec
         /IkaFi4ew0vjuxuHtZMAzHa8TuU3p0kHTynll3QP5dUHFSiQlOpnaBfAvXYegB06a65d
         iqcMh7uizIYC865UwriD8881N5SuAUam8qb1gpEk4nY53BJGchzafag0gMumIhYxqnYq
         NMJKu3zgFipdtLaC1TDv3nErUpkDZjzW89dsDSnGdrG625KFRrXsrI/ZVUgawg44+jKE
         oXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302250; x=1777907050;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QR1R5o6VCM5Z4T+4o9C/Uwm/kY5zS3IqERo7Ty4MIk=;
        b=E0gh+tqxSNwYxD7deyXNmT0YC8XiWxELxvg10dFuSOrKQlF/+9n3Uaak5DkM06Femg
         DNiFTWBEHJWtqVLZDWWMSNDRa8eIbHLeviiQsdkyikIBJjddvYTgXqoJ8sjX+0lj7Yi/
         i4QlGFmchHts1Ul6+IZklXVGUDaITlzEVR7jdBbHnrqUXfGoi92v18do+LfQRT+uWdrL
         GQhHRniZUoj2iIc66uqvaypUa/De8AiyS98ytos5RhZ3b3qEh+j0+Du23acyuLdMyZBI
         Zd6qxjGiPv4KwQl2T/+smyKWSksm9I6NkGUuFQnL/EV/3uKh1AZjfpIuU8OVsojypS6s
         P7jQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2oVS0xZpMcf9j7ivDtU0PMEj57Sh/of7J1meM8dYuBKRNFjMf892+F+P6x+TZRijqo7NbI2zr107ZgBnxKfQ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxuxMTLz+UQwHEeo+RflvM1zlF19O6mkbamWIUMKEhp3BKBJ4EQ
	/qdaOW77tcf3w0RACbr4q/xYjGwz6WL4LIJWMPUSRCRQeYtZHNkIuY4FkVVFSCCTWkQ=
X-Gm-Gg: AeBDiev5yZOu5zAo+hnZq8aGw/I9FD/BsmAjajU4RikJPyyeJNu/wmy0fqBf89GZRH6
	10zJaT2llgRAOmCxfB4nzhYtracdUq1awKQ2rJV+HY71UfFd0HgiFiONaiNLnstSguAjabgHi6p
	2cOV9ip4lVy1vYDQm2u8XMGJkR4uPjKYPac7m/Ev6+uPRlQ67ojCM5KqyUOUPR54MOnDK5SGPjl
	OVIuX8kWOary4A4XkF1GoswyNx7LqvixQLYc9k0nRsoz3BFJZPTCkNSyCqhzyp36eElh80+uhGq
	2i4/sf7PFIQB7jHQ2kAKlQA8ayQywrCf1HdfFHm7dyWtGllQPaFxzp7Ypu9GaFzKtzqX8iE/r7t
	VcU10R1NWZhfktGywvouscNkIorxcrEb1ihwRarKWOCIafYf6iXNcLnJNiMGD18NRuUkl1yeYxW
	UD3M9x50ux5NwFASybk8395RzmzRNa2qXsWvhE8ybNaJELyu4nlE/SgLN7wHiBwRF1kTQ4Hbway
	f9w/T2jmBeGvXOKMQ==
X-Received: by 2002:a05:600c:c101:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a54a6b3aemr309871915e9.17.1777302250228;
        Mon, 27 Apr 2026 08:04:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Mon, 27 Apr 2026 15:04:05 +0000
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV672kC/42NSw6CQBBEr0JmbZuZVn6uvIdhMUALHXWGdBOiI
 dzdkRO4fJWqV6tREiY1l2w1Qgsrx5AAD5npRh8GAu4TG7RY2DOewHfTC+78JgX1OvIjgtAUZVb
 whFVbUJ/nlTNJMAntxbS/NYlH1jnKZ/9a3C/9S7s4sIDoyrasbY05XZ8cvMRjlME027Z9AUguS
 enFAAAA
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=2292;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FkIFbqu0c8XIHL6u/4dr6OiK07WQv3wNMNPw/3F+U1Y=;
 b=MixsNd6wkgvvQDOhSDRPyCx4QCoo4FWY2Wr+553OosW0lyVFKYqMz0mugD9UWVPKnlCfr9Yka
 +reAExTwe1fCmfPhWLr4XOxnRsRzANdmqq9eAyzbaFJK7dBW5ZpAgkX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080412_570684_B6DA175E 
X-CRM114-Status: GOOD (  11.96  )
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

Fixes for bugs that were identified by sashiko when proposing the
GS101 ACPM TMU addition.

While the bugs are sane, we haven't hit them yet, maybe because we
don't have enough ACPM clients upstreamed. The fixes can go either
as fixes at -rc phase, or as regular patches for the next merge window.
If the later, we'll need a dedicated branch, as these patches toghether
with the other ACPM thermal preparatory patches will be needed by the
GS101 ACPM thermal driver. I'm thinking a dedicated branch and a tag
will do. I will respin the GS101 ACPM thermal driver series once this
fixes set gets in.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- drop patch "firmware: samsung: acpm: Fix sequence number leak and infinite loop"
  The patch freed sequence numbers on mailbox failures or timeouts. Because
  the message is already in SRAM and tx.front was advanced, a delayed
  firmware wake-up will process that abandoned message, stealing the
  sequence number from a new thread and causing silent data corruption.
- fix mailbox channel leak when `acpm_achan_alloc_cmds()` failed. Did it
  by  moving the `devm_add_action_or_reset()` call.
- new patches, last 3 in the set, they fix some more sashiko reports.
- Link to v1: https://lore.kernel.org/r/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Fix memory ordering race in RX path
      firmware: samsung: acpm: Fix out-of-bounds read and infinite loop in RX path
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  3 +
 drivers/firmware/samsung/exynos-acpm.c             | 77 ++++++++++++++--------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  3 +-
 3 files changed, 56 insertions(+), 27 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


