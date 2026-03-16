Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA6EF30295
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 02:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uVE8EHBWMVmiuxrDtBRiYzF9KN88X0W28eYNYUUIxFI=; b=DUjsb4Jy3QFgTBz2giLvGp+BZQ
	0/JWN88QStKXkAlIkxSQNGz2FT7oqSeHKFTjpoiu0DD9upsUXWJ7AqhR+qDLsFWDVIG3DN5i6yqKy
	Tc9YHIAivclomOh9mtly2vBg2f1iwQ6RGTnVJHRcLbZh0E/0PSyDaRNylQhq02UGKM73GC2Zrdg/C
	bHTqhBLQJ2qZcQB1XAYRBghV8qeHCynhH0GSZTFhXY26BX1Ef8CD+L7Dsj4oATItprR5a9w5dzHJj
	OmmAD8eypevuYiXFKzhfHw+rHhccMxII8vggpBWfmvuHBKiJciOQbB57RBNINRFW5l6+cGAiLI4+j
	wcXg89sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPc-00000003B1C-47f0;
	Mon, 16 Mar 2026 02:10:33 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPY-00000003Avj-1Ub3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 02:10:29 +0000
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so153720a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 19:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773627027; x=1774231827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVE8EHBWMVmiuxrDtBRiYzF9KN88X0W28eYNYUUIxFI=;
        b=HXwIBHacC+Evc7Ksh6ex/Fmg/drijv87G+JmRHeh7+yIEDOk9066UO6DbldBP6iRLt
         aMREQV2RFZ5W/hT1Be75oGl9duNZzA+0PlkViZbp6g3sciHXBi6rx2Ag8Hwn5dx/X4Uj
         ZsW5ChfH8KYWJWJLazheKNbVtOCD/GyFOh8LhaMnS1yvzOibc5KWKpxf93A34CHPwSpy
         ls3X2wKNOEAXBezeL7ekfeDxZOh/ISkx7F7/ujydVyNSVcGeAkXlqjSU+e3XK7K/7FBA
         F7Kadqxiy7I26fAafSbQKVz/kdMWSIgBT5ubNV+7Fqzyajo0njs93YcLZ3apQpvg8vgt
         3N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627027; x=1774231827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVE8EHBWMVmiuxrDtBRiYzF9KN88X0W28eYNYUUIxFI=;
        b=tCA9DOzLpKA/rtFRtbnEt2PftZdNE3DvqXDNmbgghy8zwcKil4twQ4dyEnEHMhfez7
         j15p0oki9A63RY6nFJBzSgwgOGarpGe0uuGItuxUFcIncBdsSLMFaUOZl1K++snfUlYo
         R1Ybhdc+0znufGbPpS45Hl+yRx7XwKfS+nAbV0YFhBZg5R5mnK/nMBYNrUASO1Gjidek
         a6uqSaGuE68GIDe6Ls4MNBTdudeJOfCVaMsKjFMsjZQjFjjqgintp0dq138dx37dCwGC
         B/tVy/qfQRAVLiLhezZpLYx5lI/WvW2uitNqOc5a/9jxpZJ45P1pPGKR03a5kxBZtTwG
         yq5w==
X-Forwarded-Encrypted: i=1; AJvYcCUJQ0/EguK+T6Fr+ZewWWj8ju0H4FRY19ZzuXieEYYjbb4wZV0raM5K0rtwQQZPyRAEQmyS9+a0DT8FLt8bHQnb@lists.infradead.org
X-Gm-Message-State: AOJu0YzHFOcLd3Fq1EcfHNFs4V3qZOR9x3RxucoiMED5rsxv7qth1Ytt
	Gji2x0jwbioIn2YCFiTrKwdnIJgW9m4pawLf3KeikAdSQjUjqn29Bo3z
X-Gm-Gg: ATEYQzyyG4OnVFb9VccFRaBFuFj1R7qUwJ3BdeD1kKJ4AtCg7q+er63ngScvHxalOM3
	rXwOuv57ASyNAy/rcDnkeCadBpBuPPR72vHRj7sG1ozeQOGDzawQdqjFPKlA/EUdqo2T5Mqxrw0
	4esVo+UoI684XleMFr1YKZG1wgCAJmmbi23b1SPLL/+MjwWgh3b4mPWIW/P6uLbCyXVDYmYxgim
	J93dmq2UiPMWPAc0YQMcMPlLH9aNMf+tEjc+2zDoeN6ErA+7UgeecCcQFtN2qSxXCT40o3yzk4e
	sTIjXqvSHQEg5RWNRS4ebusnBmhwKOJYuuGHKcjeWLgedaYwOqQ0fJUL02zYlKpaaVaiOK3F4lH
	zgpg1ugOZW1BcQGLEy4RY/9p6fC7/4b71yeKvRVA7ydDmSLgGmdAjWZ89HVbBcbrZt2v/G/0Pr2
	sJ8dlL5jlilqaC3enC2piLyKd4AL/+i3EjteORfbP0nLFvgYlAuPet25zk/hTlYMvo
X-Received: by 2002:a17:90b:4e8b:b0:35b:a53a:7d0b with SMTP id 98e67ed59e1d1-35ba53a7e94mr399741a91.20.1773627026902;
        Sun, 15 Mar 2026 19:10:26 -0700 (PDT)
Received: from luna.turtle.lan (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffdfb7sm17705805a91.14.2026.03.15.19.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:10:26 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH 0/3] stmmac crash/stall fixes when under memory pressure
Date: Sun, 15 Mar 2026 19:10:06 -0700
Message-ID: <20260316021009.262358-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_191028_416975_8DCDB310 
X-CRM114-Status: GOOD (  12.54  )
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

Hi netdev maintainers,

This is a pair of bugfixes for the stmmac driver's receive pipeline. These
issues occur when stmmac_rx_refill() does not (fully) succeed, which happens
more frequently when free memory is low.

The first patch closes Bugzilla bug #221010, where stmmac_rx() can circle
around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
a filled descriptor (due to OWN=0), and attempt to dereference the buffer.

In testing that patch, I discovered a second issue: starvation of available RX
buffers causes the NIC to stop sending interrupts; if the driver stops polling,
it will wait indefinitely for an interrupt that will never come. (Note: the
first patch makes this issue more prominent -- mostly because it lets the
system survive long enough to exhibit it -- but doesn't *cause* it.) The second
patch addresses that problem as well.

The first two patches are minimal and intended for stable. The third is a
general cleanup that removes the `limit` clamp and *solves* the issue of the
loop mistaking dirty entries for filled ones, rather than *avoiding* it.
Because this final patch changes the range of stmmac_rx_dirty()'s possible
return values, it's intended for -next, not stable.

I look forward to your feedback,
Sam

Sam Edwards (3):
  net: stmmac: Fix NULL deref when RX encounters a dirty descriptor
  net: stmmac: Prevent indefinite RX stall on buffer exhaustion
  net: stmmac: Remove stmmac_rx()'s `limit`, check desc validity instead

 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.52.0


