Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+QB5oAaTd71HtR/hfa4+42MYQULAvj4CXOLQvU0AhE=; b=UA092wT+D1aidrBnKSWsPBJzWs
	9lR2pkfIc717nc0EPwgDUbSyrp23+b7SieZcG4zmbuSzWcmKJZkaF/rVfq/PJdiT1SsDiGuGEiYCG
	+gx+2uzfX1vcZgOuEx2oclUlqkNTUxWoA2M7/vOg5Pda/7Mc2lmEz7LIMwUGV+H0Bb5GI6sNbzBfz
	lfYu4YblMMoaLB9aeWt83h3q+1VAwrswkvKjVMgElWPSScLXANP5/+eFWNrYt5+P7GcH3XPQM/93a
	DMBz+XB7MM0GBbfW7KltLj/frjzpd4mbigVpOh2xH2F83ELGg/nyE8asJdZPqFEh7npimhexyDD9X
	rMasw6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaMO-0000000GCIS-1ZQy;
	Sat, 25 Jan 2025 07:13:40 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEk-0000000GBj4-2GRh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:48 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E6D81140114;
	Sat, 25 Jan 2025 02:05:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788745; x=
	1737875145; bh=v+QB5oAaTd71HtR/hfa4+42MYQULAvj4CXOLQvU0AhE=; b=p
	4Q7DEp2m0ci9sGnZcssfEytvThRtk7s/9Wndjl2zS2IfDZUwAmresYORUn3jUdyl
	+g3ZmI8JsFtUaOBdBxbJjw4YOdGHw7aNZLGf4hB5jvfHgKzM6Fix9s17esxQfzHZ
	9p7Wa+8+ITkqSXe9Bfo0uubMM0lAqhN+vWNZxqBeSZdRYTqH9BjRP2wlzc9gvxJ1
	tavVFSS7FciLiLZRXW3zQjlr1XEpu+QZN7F9hHR5CMoOzrQivdxaVcZejJsU7R2P
	zg1Qr8TmasbpYR2N73sUJ131uJaI/hxZAfGro0cLR5ohicdtP2pasRfjwKt4TXxX
	dRlX26hb002t3de+u53Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788745; x=1737875145; bh=v
	+QB5oAaTd71HtR/hfa4+42MYQULAvj4CXOLQvU0AhE=; b=p0hWQ6m1elopHi6Z1
	yxmwExmG0ou4W+seSd96PE4IgmnyBPOrVa9oW4OIMd+85Sd+34FNWWDfGfIXNRaj
	4q9OwFF4CslTo6YJ2obc5K6QYWVcKJ7C4GtoxIK/ycMLS1rmXEF21Y033tjZTF0C
	WCydRH6+Zp4lPJNDNzzEel2ME+zoObBT8FDiYt5+UWGKdLi7zVPZOSA0qP5KEyHo
	bAtCqCwf5cVMZkDhifcnoElSw5c6kSPvhK9qE+pXp3VWJHjTdv47FAs+sVGUCt4F
	HsOQbywq1yIC7vz+mPWoJ+3K6J9K/3G1gc4DRqG15tC8nbGUtsVSufOZhzqo9tyj
	oREjg==
X-ME-Sender: <xms:SY2UZxJ3egeqmoUl77CSrbhQOtZP5Qx_rEk5tymsOvRLYno5Es7NzQ>
    <xme:SY2UZ9L6rN6jVpXuy8t1enbf65mc9av4SMVXi2aSiEGVdsVvSRATiTJX3jbAsXl6D
    yzyLJzW_5TtnuqSIw>
X-ME-Received: <xmr:SY2UZ5vP94UO900pRjVelGLrb_SoByT9lR9aoWwM0kdJdHOCN6v53yhM95JKX0xDVo7_HGQVXjtjAdArteMgNem15asZW5En2uzGKLckG4zd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepjeevhedtjeeuvdeiteelgeehjeegieeuveev
    ffetffdvudevfefhudejiedvgfdunecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhes
    thgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgi
    esphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghp
    thhtohepfigvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrh
    grsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:SY2UZyYT0MBDM0IdaIEFSMhaFN-xspwDrgtUnoLsPYYKbjm_7XfYlg>
    <xmx:SY2UZ4YPGOGR_2adnDzQ8M0SBtODfbA3-jRg9bIAwy1vllQITE2mCg>
    <xmx:SY2UZ2Ccn3ndP1zN9yXEMzTR17dTe1H-3h4TYpN9bdbvux_KZI-Egg>
    <xmx:SY2UZ2ZmkQoyYIxUzLkgb-pUL1E58PffOV8YdYwEy1NfXa_Aa_Mp1A>
    <xmx:SY2UZ4qM7LIe01HJGOkdyHc2dEoAUGvhED07RkkwiZ0fPobjsusYifde>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:41 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 5/5] ASoC: sun4i-codec: change h616 card name
Date: Sat, 25 Jan 2025 20:00:15 +1300
Message-ID: <20250125070458.13822-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230546_634957_62DECE18 
X-CRM114-Status: GOOD (  10.53  )
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

Adding jack detection requires sound servers to act on the emitted
events, which are described by ALSA Use Case Manager configurations in
userspace. These configurations include the card name in the file path,
so alter the card name for the H616 to remove spaces, making UCM
referencing easier. Add a long_name to maintain consistency with the
other drivers.

The corresponding ALSA UCM patch is here:
https://github.com/alsa-project/alsa-ucm-conf/pull/491

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate patch for card->long_name
- Note UCM patch link
---
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3701f56c72756..68e2d82228a0b 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2012,7 +2012,8 @@ static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
-	card->name		= "H616 Audio Codec";
+	card->name		= "h616-audio-codec";
+	card->long_name		= "H616 Audio Codec";
 	card->driver_name	= "sun4i-codec";
 	card->controls		= sun50i_h616_card_controls;
 	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
-- 
2.48.1


