Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE65C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0UN1zEQHh+3iAICbKR3Qfw/BEbHddaeGqLeTAPFJgLU=; b=mxTS9Xjq3ccvjZWXm3eyClkszA
	+D/kPAAbBeq3YcC6qUbxz1tzvd7kSDuOugXituoNDrtdchsZVfnomVkOsN4b7J+dTmt7g6WFzNK/v
	aDRuAbGh4rKjvHlqVnoQgQ8Y8v3v6/lrowGKb4wIKSEg6XtYrs88ibDVgNW9UmwKifG/iVAKTxChp
	odnj7ps2yWpfi1V1GTaqRhLFHhr8R9PsOm6HhcDRgo1+xh6IcZ26RaUQldjT5Gk+DM7dLbzdBKH4Q
	2yKHrxRnLnYwSdr3lqU3t9UcO92ciG4S/MF7HLf9asPytaE8SmBVszePhaG9GeF80XPwr7dTNoM9+
	BR+s+Rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ihw-0000000C7tT-05Ci;
	Fri, 04 Apr 2025 15:11:48 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0igA-0000000C7Xo-2Obu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:10:00 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 0780B1140160;
	Fri,  4 Apr 2025 11:09:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Fri, 04 Apr 2025 11:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1743779396; x=1743865796; bh=0U
	N1zEQHh+3iAICbKR3Qfw/BEbHddaeGqLeTAPFJgLU=; b=BFcPvZNMxp2G07QEFC
	FtfCRHKf+y7LDSSgX+wqoiMVxUXkaLaRkdFb47Ukfi8p7xvPeKPy58b2e+NNiTe+
	Ag/exsVsBFEqP4MjS8AH6KqTlprvCJzecQtlMH8FGak7IpjI4xEezbdiKdOUOLe/
	rijhD7a12hlTpSY6Cx6L6FPRae+eJ2SLhBW0yC0Pvdb+Wb7pEL7YIwhBcP48D/CY
	3v2tnT46KknvqnCcjig+ofeZEdnWtSWkRTeGNJPb8hqaiJQu2unKeT5Lu+lg7JsF
	k5THmSjWw3vpB+iOKojLG38HX0mOe2MwWDfF2H/pJjX2uxM4pkILkZEJD6m3QoxS
	hQJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743779396; x=1743865796; bh=0UN1zEQHh+3iAICbKR3Qfw/BEbHd
	daeGqLeTAPFJgLU=; b=RY3UsWRb+2UHgffX4xV8KUskbOLVlIBBE6Zi/G0i5h4L
	CPdOkfqzBnhAcLlTK+EDb5yNJ9R/8vpdORrElVWVHjILQqq16p18Hba4wyWbz2EW
	7MrTseMQb5i2RH/60amsC6x5oGF4/wwBzeSZRnVugIQBo4MhM/H7XNrLK+AnJHbI
	qHS0RJ/tZlpQNQPBwgiRoSTrdgVm8777HUaSVycpkAkJUq7coUAI5onPwNcDIP9W
	tNM4UbGVzRhMDi6HvC3m+emo+mGdrcGg1NaE/zp9Slh2O9twOpVJLgyVQ7eUSGLD
	QJD7JiSSOtFigQaYCfceTDj6yxiFNRZgotF99/+W2w==
X-ME-Sender: <xms:RPbvZ2MvkEFU3wDt8I_5tJMnPUqqbN3E1xNgw6sUKnYRrPC1lLaqVA>
    <xme:RPbvZ087MUYdSuFHlB4jcRNttrnvZ3JQW5xiTRzVqT8svOMhBs85gf63mMMJyMEOK
    8-UdNrJo-20ShyE3jA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledujeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepudfgfeeuheelheehfeeigeeigeeiveevheelteel
    leeijeeikeekvddthfejieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepkhgrsggvlheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtohepihhorghnrgdrtghiohhrnhgvihesnhigphdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RPbvZ9SSc0SvdTZwEYcJ1NaoSvJmt7rBZrYYbUcXv91eAFCFIMH96w>
    <xmx:RPbvZ2toc3OhQomFrsi6iWeeCwJNulPM-FUSyjVk37CluQhcQ81p-g>
    <xmx:RPbvZ-db2yB5F3Z44XPWC_YRW7PJ9kfrarFTNENa4A_8PmXfttoNnQ>
    <xmx:RPbvZ61H0p1E6P8uzNRolZOp8tDb-W4E7e4UFNZSlB_QU1OwfuG_PQ>
    <xmx:RPbvZ8utDE_4OumfRF9zjijdevK9Kgw_cCjKo0eSPjxRanvNK5GXru2E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 60F592220074; Fri,  4 Apr 2025 11:09:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 17:09:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Ioana Ciornei" <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Message-Id: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
Subject: [GIT PULL] soc: drivers for 6.15, part 2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_080959_003392_E692842D 
X-CRM114-Status: GOOD (  12.23  )
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

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2

for you to fetch changes up to af34290cdc60a289e43f38a87621a3e9dd63c67b:

  Merge tag 'omap-for-v6.14/drivers-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers-2 (2025-04-04 14:37:41 +0200)

----------------------------------------------------------------
soc: drivers for 6.15, part 2

This is the promised follow-up to the soc drivers branch, adding minor
updates to omap and freescale drivers.

Most notably, Ioana Ciornei takes over maintenance of the DPAA bus
driver used in some NXP (originally Freescale) chips.

----------------------------------------------------------------

I had a hard time deciding whether to include the platforms/cznic
driver changes in the pull request or not: The driver changes had
caused some build time regressions and I actually made fixes for
all of them but wasn't quite happy with them either.

In the end I decided to send out everything else but skip the
cznic driver since my fixes (finally sent today) hadn't been
part of linux-next or properly reviewed so far, and the merge
window is basically over. Sorry Marek, I should have been
more active in making sure they branch was in shape. Let's
make sure we get a new version into linux-next after the merge
window. I have uploaded the current version to
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=cznic/platform
and I think we should just rebase that and squash my three
fixups into the original commits.

Andreas Kemnade (1):
      Input: tsc2007 - accept standard properties

Arnd Bergmann (2):
      Merge tag 'soc_fsl-6.15-1' of https://github.com/chleroy/linux into soc/drivers-2
      Merge tag 'omap-for-v6.14/drivers-signed' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers-2

Dr. David Alan Gilbert (1):
      bus: fsl-mc: Remove deadcode

Ioana Ciornei (3):
      MAINTAINERS: add myself as maintainer for the fsl-mc bus
      MAINTAINERS: fix nonexistent dtbinding file name
      MAINTAINERS: add the linuppc-dev list to the fsl-mc bus entry

Jiri Slaby (SUSE) (1):
      irqdomain: soc: Switch to irq_find_mapping()

 MAINTAINERS                              |  6 +++---
 drivers/bus/fsl-mc/dpmcp.c               | 22 ----------------------
 drivers/bus/fsl-mc/fsl-mc-allocator.c    |  5 -----
 drivers/bus/fsl-mc/fsl-mc-private.h      |  6 ------
 drivers/bus/fsl-mc/mc-io.c               | 20 --------------------
 drivers/input/touchscreen/tsc2007.h      |  2 ++
 drivers/input/touchscreen/tsc2007_core.c |  5 ++---
 drivers/soc/fsl/qe/qe_ic.c               |  4 ++--
 include/linux/fsl/mc.h                   |  2 --
 9 files changed, 9 insertions(+), 63 deletions(-)

