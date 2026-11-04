Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C264606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aFFCX+v0;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=QcFwN6/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=T5hixkUYsoVhbq+pfMR+Tlt/h1LbVABTKfHKw161M08=; b=aFFCX+v0AZ3DX7fT0xLap1Tx7U
	SrQBQ93fgMxMQgs+MqOZjZFcguKGV2jxYj07N0F9jW7NQP2J5aoSXPfW6xNFrKQTl7B4+FO33sG0s
	rihn/VohTFrW4KYR0fL64Pt3Mx0mkBnbIy3mXuK23BeFV6TcPP93pIa4HkFkdtIJwT0PtSVdYpdyr
	9IKlAtpxab0h8BBj5w16Lu3hKloeebMNJCkGBeaHKd9VKQIp8argK4d1dffCNr1z3hf9HFS0GUlgL
	/e/AqdBNiFt7c70k3qTC9lJNn5pq/0iOxet6jOoM38rCmQ7PbbykRY2ibpEs0FAlqqIDZrWUREVpF
	GtVqQ8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5T-00000007DXY-3Y4n;
	Wed, 04 Nov 2026 23:08:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOk5Q-00000007DUp-0IBK;
	Wed, 04 Nov 2026 23:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=sBmcSlXO+5ghD+tdjwD3ULgEcdtciNYZ7X7GzWVXW4Q=;
	h=From:Subject:Date:To:Cc:From;
	b=QcFwN6/khmMWJFxJXIV4VLDmy6RdKzZcBa9R/a1OliI9WZOEsnceGWd4nsxGP3KbC
	 mooAFqHLYT41Cfy6Q+6WkAwbiX/JrJ8JtLf3ILmmnQHaU5J5GyH/kYs0IgJZEIkzxj
	 RCDYmKls6LlUxa3yvwlQMEKfuNa6CAmdCcxcnqCTL9sxwqGyFVge4WXAW6ulAp8V4P
	 7Y/KiSZ5w12XSJvYXRTVcUAEhxwCEsdCJwX8qs9zlPW1LFi7abl55TYkXNfl+N+Auc
	 y2gOhlTHqZewKn3WCeWlWPIrl2bsg/T21a1vCSlYzlOYowIBWjf8L/rR4BGmFklzfA
	 INcizRHdPAFZQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 943AF17E05A6;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 576B448002B; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/4] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Thu, 05 Nov 2026 00:07:56 +0100
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf4V07Zi2WB6u/A/jgpapVJGSFhoJ4
 d8tmLhwpctzc+fcmYlHZ9CTYzITh8F4Y7sI6S4hqqm6K4KpIxNOeUZLWkDfTOCsuqvG9GC6zsL
 oJQfVxgy0eQLWdSakyHVRHEjU9A5jvE2cL2/2o7yhGlbv2miMH6ybth8CW3t/zAUGDHRei1KlT
 MaTk7JtW0nrqr2yD7JOBv6RMkrZD1IOFJAyqQUtU1Hit3RZlhdw8rv0OwEAAA==
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sBmcSlXO+5ghD+tdjwD3ULgEcdtciNYZ7X7GzWVXW4Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXrIAHNh8u7a5iUg7BEu8xsZX/zLLidc
 8BCQa30eflbtokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qavmoQAIQ8hE9uq5pgAFBAuXP8C2nGlE4UIcbWSEXrJqw5XkXhcF3M0gIu2F/4CBgWRz5uU9S
 3LOlYz9CWa76ZJxZQZD5fF0hxvIdZxhkxazgRt0IB/eVa+7luPruk+2Z6F67RzbGinWjlBQxpOS
 dw28zNF3jwwDMbfcpO6cCM2G/YN7dXfSOlkN9dDBm+WlBPIGYWTDrGr8HMvgnJ0iWvRTagfWGYD
 zG/DWyQ69LRlNRi39Y8I2nK55uQKwxK2qwxjc6pAJd3Nqr0iZPTlxoHb4z4D2jegCxO2xWIBHDu
 phw/bYGV3ZtNoJ/liS5k5Y6Ni6SeTG7m5PL364rFSkfRfrzg817ltuD6lYLbPCC4wh2z5NaPh+S
 9Fl9FKfT0uuIPkYWPf6oj9TO1H1pcMhCQSq/hPPgH8J0LMhHFupodwWojX4sA/uyVPJd7knRSz4
 L8k5oLMYbSqOcPxS+IVsPfOnniBfrce9cz1f4pRAeenKqWsBCD6B2NqgE4bRwA7LbG49ifSxm7F
 nnt80t9i/WxV8PY746PdTsRdxeof0G//h7adZva8WhdAfNAVyD+0nW+RKiTbb9tFSwD/tIbAA+Z
 a6uQMINd/nQ+zDlJQQISBe6BqWQux8HIx//cC20KFavQjJ/WhB+CxOy3ILt70nbJtm1lUjDwvrN
 WAAqbYk+nj/saTUM+0DE1XQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_150808_286683_29C521EF 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.

Changes in v3:
- Link to v2: https://patch.msgid.link/20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com
- Fix do_suspend negation resulting in SError on RK3576 (Sashiko, CI testing)
- Ensure PHY ports array is initialized in clock enable path (Sashiko)
- Cleanup properly in clock enable error path (Sashiko)

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
- Move suspend exit code from rockchip_usb2phy_power_on into a
  separate patch and reuse it in the clock prepare function;
  move is done in a separate patch
- Updated commit messages with proper rationale
- Added one more patch dropping useless assignment
  of rport->suspended directly after calling
  rockchip_usb2phy_power_on/off
- Add one more patch unifying and simplifying the debug
  messages for phy init/power_on/power_off/exit

---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>
Cc: kernel@collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Sebastian Reichel (4):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: drop duplicated update of rport->suspended
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 92 +++++++++++++++++++--------
 1 file changed, 66 insertions(+), 26 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


