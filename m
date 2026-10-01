Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D78ACA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOCW1Z2wBojhvp1lOH4gOljTn+CsamNekhb34DbTEaY=; b=lUFbWgQgDVm5FrFlo2H3FGCagu
	XG9x+9XoorP8HhHBC4x6VqXASaeCXcaEQR4AaqWQ2GRIClOS9Yyp9wKtoZgjR5XMV2ef0o0CIuyds
	8laxer4Xx95h+OfQ3JdriP6qs7OOQ2uICvMhB+C/Ga9+vv/tCPfJmEFXfIpCG/7lMkS81Fdlo8lcL
	F736/s1Fp/+ucjc9FJFO8QSGar8aOhC0rgdWtd/x0sZSBiRoKqfNfoNOYksa3unNjT+IRgx+/aG2Z
	6jnZH9JBImdwXSmzzjVpaJMJIxQUtF++H/MTlvlv+SX2WlX1DfYR8p9Z8emLyEoXKLZPitc3U4k1l
	5DUhjAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKhw-00000009sSQ-2Yje;
	Thu, 01 Oct 2026 17:36:36 +0000
Received: from out-67.mta1.migadu.com ([95.215.58.67] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKhs-00000009sRW-3kKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:36:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1S97aZ5lqXhW4kBuXjOjGy0qBmexZE7CglrgJsyPvnY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876189; v=1; x=1791480989;
 b=odnn4PryHsC0nYms3mMv90uyM8xf5QG4S0v9waDv9rO5gQCHfTUwvjKMX+czmTu78w9M/aUn
 EelOtEyRcK41BsT5PDu3QuiGXB/uVWc5LI5EvPOyaS0w0CJqH5kDqbD+h0b6Gcc0cnXZij0MF3I
 gZvBunhThb8dXCJgeV88koMEG3HKbLzA8ksIjvYQgiK3JnokucsTVdt14oRk0JJ/ZKfIOiZXRF9
 NsTzZp7YIfNubqktfEKQLjsL7cxZ4uMvp3aleZ899ZBzIOOTk5IVf6lrCYbH+r7pkHlMcoEm2vB
 UXt3khhFZydrZkcv3R14b+G6WYI6adtmCbM9zrE209aNw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e9cad268562f180b;
	Thu, 01 Oct 2026 17:36:29 +0000
X-Mizu-Trace-ID: e9cad268562f180b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/3] media: rockchip: Modernize PM_OPS
Date: Thu,  1 Oct 2026 19:34:50 +0200
Message-ID: <20261001173610.158931-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_103633_506148_14ABE150 
X-CRM114-Status: UNSURE (   8.52  )
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

A bunch of new PM_OPS macros got introduced in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Straight up copied from that commit message:

    These new macros are very similar to their SET_*_PM_OPS() equivalent.
    They however differ in the fact that the callbacks they set will always
    be seen as referenced by the compiler. This means that the callback
    functions don't need to be wrapped with a #ifdef CONFIG_PM guard, or
    tagged with __maybe_unused, to prevent the compiler from complaining
    about unused static symbols. The compiler will then simply evaluate at
    compile time whether or not these symbols are dead code.

So convert the rockchip media components which used the old macros to the
new ones.

Diederik de Haas (3):
  media: rkvdec: Switch to modern PM_OPS
  media: rockchip: rga: Switch to modern PM_OPS
  media: rkisp1: Switch to modern PM_OPS

 drivers/media/platform/rockchip/rga/rga.c           |  9 ++++-----
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c     |  9 +++------
 3 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.55.0


