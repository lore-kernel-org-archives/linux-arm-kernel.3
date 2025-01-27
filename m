Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5365BC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=66BlFs48FVrbjdXsEGOlsg4bI3MunIVf7eU5KlklnAE=; b=KWEHBT3so8wsYx8LHv5NUYD5w8
	YCTDOTBpNL/U7zHqBFx1GxwtLfvjrFChgFQgml4UWq6NCJn3ehYitEUDunB5Q6cuIofbXZUKZxU7N
	du5VU5SnQcBYroxgC3n3iSKonjoSNNFSqPdWgWgkdbRt5t96BIFzM3db00BsIAXkugARQWergGtZp
	dQD4baKsfGMTtI06YSK3z98cA0K2EwEit9W6nc5fFXDE85yKweiBjJisdXNDnPEPDKEIf9MT3I7C4
	+lgdcIYjRVA52jXRrJ9OJVrvTBCJUnn8XSnEBw7M2siwR5Tw8/GHjUOjQ58gv2qM7ExWf0hE8WCWS
	8VjCRNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcORD-00000002I3z-3TD1;
	Mon, 27 Jan 2025 12:41:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOPv-00000002Hyo-0wqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 12:40:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2efded08c79so5932826a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1737981637; x=1738586437; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66BlFs48FVrbjdXsEGOlsg4bI3MunIVf7eU5KlklnAE=;
        b=mqM363Twq3TvgXA/qkt4I6GrXtqqUzHXWZuysa/dYBWf/mLtHtfEuBdk4ws+7AwYkV
         WJqJ4ZDQMUJUc/DBJAOz1f2CsReLKRsQz8VxVSZsghh9apeu7yCEvDXbee+cWwr+T8Id
         MBVMhQ/SfC3bZPPtVbJCihdhFDFDLGZQwZGByZgq1yBo/920E0e6ZAWvsog+pqa3HQi1
         pf0vRzF34KE0nO5VdV9Ocqvra+CqjvQS3gN/O+sQTjP/CXPUpNi8r3i7kNxmMCv5nluI
         /R2Pu50Lh9CZrY0GFS0tmwZyIEnqNiieuxHplgYUIRLBDX0ZzOuiIKGPAG4plpSCcf9V
         hWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981637; x=1738586437;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66BlFs48FVrbjdXsEGOlsg4bI3MunIVf7eU5KlklnAE=;
        b=jPbD3pLUd7gNpaK5lbwC7OROjHmSK/WqQs5Bk5eNp61rbnQCrtqFD1bASyExCbrQsc
         yqpKN1pfIKlKT6OZDLUY7TX9HbKnceIjV6zdPptmv9Xe1M7FEu71LSrYL4ANl7+cEHTO
         BzjwcLe67K1WAKQ59L6DmqyJu8RDJrotmO01+0wUPuB0ZNkbuhigp5Hz486nOtigZxJG
         5q3XpMt8mguyBOEHz7UbU8hVFBwzv+Ppdo8KfFZCoZJkEb46xFnPMCBGU5VajMod27vl
         AEKyBk59bm4TKRR846lX0ttWRThM2Ds5YeE/jpZ+Ub4szgU5l9yPhnkmjt9+2B9AYAFO
         hJsw==
X-Gm-Message-State: AOJu0YxbpHXjIdzlU3gUCt26qZGFcfhEh1kTWn+eLxzZZ6To8ucg0WZ3
	YtpYFHa6b8CcXnfpiorJeF0g9m7KlQZpLxAXt5WHOxIQUJPztS4I6f7gCJCQY9tWNhNgdrSVSzT
	4kg==
X-Gm-Gg: ASbGncu1mtYBUuRWJKxOIzQ8lUmorRpOoP+vEdA8kfVsEfPN5CosL3GIhGq1vBQX0tc
	539PJvNwleo9rq0gFw80LpMOsPwWgSVYhLb6k+wervxZAQdLItSM1Bc0jJnONWZPrLGHtLxBAKY
	aqNg4DKVhA0wclX0m58ggBrTK9BEaGPSwKB+Wz+e0smLX/eJx/IwIj41a/di5WKsCOk0TouDJSr
	VA7niW3bzLa+Jx8htYwLgVM/5qEFskM7tkcMhuEuB6pQBeDcguTPcQD76YtGJjyj6dBC6BQrr6J
	+HXQKj0T3xkH
X-Google-Smtp-Source: AGHT+IH35HYMHbP7gwr+hk7IggmfFWRoiNIaJxd88A8EOD62aN7eYdWW5S+2d4Rsjs63mXxlmd555A==
X-Received: by 2002:a17:90b:2e4e:b0:2ee:fd53:2b17 with SMTP id 98e67ed59e1d1-2f782d97276mr57017655a91.29.1737981637154;
        Mon, 27 Jan 2025 04:40:37 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa455d6sm7058553a91.10.2025.01.27.04.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:40:36 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Mon, 27 Jan 2025 18:09:35 +0530
Subject: [PATCH] arm64: defconfig: Enable gb_beagleplay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-defconfig-beagleplay-v1-1-22a60085e313@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAIZ+l2cC/x2MWwqAIBAArxL7nWCWJF0l+vCx2oJYKEQh3T3pc
 wZmKhTMhAWWrkLGiwodqcHQd2B3nQIyco1BcCH5IGbm0NsjeQrMoA4Rz6ifJicpR2NGpQS09Mz
 o6f636/a+H1hMYQtmAAAA
X-Change-ID: 20250127-defconfig-beagleplay-de4553bb3882
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, d-gole@ti.com, lorforlinux@beagleboard.org, 
 jkridner@beagleboard.org, robertcnelson@beagleboard.org, 
 Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=icRpRzWFZCeIziEPfagk2gQf/GODTrhYcZ6aARwW04U=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnl37AiWFK/mv2Ocpgn+Hi1q6BzejqEzOizic7Y
 +X3VNYfzEmJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ5d+wAAKCRAFzvXHieVa
 dBgQD/9hIRxB7jGWLcjZDKCSeMuXKyn5HPfgivpFFbCzaIz8VFjFSycGN2X7vqrPwOfb9zXtF8J
 hr8reb81JjvnjeYD1BRxoVxWJeCtDyslu848X2vpGbF7HCzwQNaVNBrpPemxmw/uBOx8Xnu3pJh
 B/M/xc2su+6OLyK29/Of4TgI0xfsR9boZHfS2631DYqYkTIBoPIvZzQ5+UUenzOsNx7w4pqPd6I
 ABzP2OsEwwcyH+ER0KVf0Os0P8A6KTDqJ1jBIF/Ubf/burKho29A4l6J9GEdgdNLe5dKCGYNHDp
 Z3lr/9ac2knVNajFd7mciwXPLoWUJzWC+ZCCGIlPkjsrpyIWR6fQqSlcJv5xYVptlttYTxSiJFU
 YBakIzgj3Y7utqOV9lJ33+t34BzZW7tCfkKn6RlIXhy/j5Udj66kGC9N6+fYavUSnH07TMUj8nG
 q7XZIRYdUPaMdMwANrXQcMVFyVBUIdWCgO+GGhOMgraxhzezYHhtCLZ/eHr+1OxQ1Ia+XKRyCe7
 5o1cqlbJ8Yk6WHJfo4py6mKQOUSmKT+wPaoWVo1i4TyrUikpSNfUsPDXuRmcRMGWW0VDVH0xtOm
 DhNuvp7Zmb3xsF+hSrNkrPpLrgxm42Dw9QWzrgCEZtDx5l13Dj7GqE1NbMl8bxcBcvHLKzkAKtR
 5NLp4k9KSXDdBEg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044039_538516_14DF4329 
X-CRM114-Status: UNSURE (   8.81  )
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

Enable greybus driver for Ti CC1352P7 over UART.

The driver communicates with Ti CC1352P7 co-processor which acts as
Greybus SVC. Additionally, it also provides firmware upload API support
for Ti CC1352P7 over UART.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Enable greybus driver for Ti CC1352P5 over UART used in BeaglePlay [0].

[0]: https://www.beagleboard.org/boards/beagleplay
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..24353b0aa3e0ae1786ce99706a52cbf25d037d3b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1760,3 +1760,6 @@ CONFIG_CORESIGHT_STM=m
 CONFIG_CORESIGHT_CPU_DEBUG=m
 CONFIG_CORESIGHT_CTI=m
 CONFIG_MEMTEST=y
+CONFIG_GREYBUS=m
+CONFIG_GREYBUS_BEAGLEPLAY=m
+CONFIG_FW_UPLOAD=y

---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250127-defconfig-beagleplay-de4553bb3882

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>


