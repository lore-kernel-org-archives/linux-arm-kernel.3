Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B8ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 21:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV9m1lbbNAGh6h3l1sH9V9DqLA0qIHvnUDzEmR+6feU=; b=ZqJyDgsECuMUkW+a7kypJTW+F9
	nn/TDYntGWx1jWe58by03ZsheQO6OLVE4OP+bXmVjaGd/9aqMtiwJ8Zi4e/TpFR8+lVG9TY/ybOHD
	u8GtAj9SI6joa7JBDkJX8laBRf6FFpp62ZpoBbWQTH2As02QxEaDMysZcN8ATLPiUOkmJtN8aEW+l
	A9sr8E7pNGU1kLjFSYe8tHnG7iMejJ73OTakLqN8d1NzT1zDUgvXZHAmnrpL29sS+fzg3nFtqbc/p
	Cv5GC+tUDoEXUKmzQIPrQ050s8gyiBpEob0Cp34x1lHm89QK2kj1/ZNdU3B2EaYMvN8tSV9zAFM/a
	ljCxw5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XFT-00000003zIb-10zs;
	Wed, 24 Sep 2025 21:42:03 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XFQ-00000003zGM-11dI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 21:42:01 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C229FEC0166;
	Wed, 24 Sep 2025 17:41:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 17:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758750118;
	 x=1758836518; bh=eV9m1lbbNAGh6h3l1sH9V9DqLA0qIHvnUDzEmR+6feU=; b=
	MJzCc31pfP6WqYiHGZRDNwdiGIv61wBAFzdRCll0clFjAu6u+AFHfTgyQ0L9ditT
	shy4TzaGKqX7cz3VKPOGm+RLn91UfRoMbyy+8LxNz361cqA71vBGSScMlrFc5W7P
	D4sW7SgY1IHsE75YpSsabCcDmspHxqBXIowrpp4iJYN6GwiX3dj/jqsmQnEttMMh
	M7NnOpj8ozEBfCcZiy7b6e46lL+QVAE03fHTUPh4q6QP0dIYMMw+n3dcn5Qdmaso
	XjK60u2TWXFrlakQR6TmPOI58Uc2rxCHUhRtvdCReNqQ84fpN77aysgr9wNUS569
	h3JpQKHJ/CVzZGPrOU0Ypg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758750118; x=
	1758836518; bh=eV9m1lbbNAGh6h3l1sH9V9DqLA0qIHvnUDzEmR+6feU=; b=I
	h/yVxHh6EZOciVQB+SokLGJkDt4QvGdJ1qJsYD5wY3tRSxUz+M0mFNH6f5K7oq+E
	lv+3uuF2iLIwhyzsdkGdfIQqmODQHPjUh7tzPdrIumDlHo7J0/HZLhAt4t1PKbDY
	HhV2FzcgmaAPVoYJl4xFAMKsnO7PQ3cXp3KvMHyTIul1K2027AsMqUzvajKd8BFx
	9EBPNeJ89c3WBzzDAtcfpN3ITZMWSzpdeuUphvCg4HKiqKzvwzf0g/LFwxl0a4Kr
	6eQKWYzViXjc/bx6I/kAaW+JTBHeF8MksCy0K54axPgzYMsRtWjAFswmC4oHPknq
	FQdOy3GNCb/ltkIz6c4rA==
X-ME-Sender: <xms:pmXUaABkbcetRg8_mL63nPWzJ-GCGc0aflloz3E-iIvuzyImhEFFhQ>
    <xme:pmXUaNVn-jyDrKmbBOURmorRs3SYgrJyMzVCxTsiiWOIzSecDq33YYz9FUg9e4bmg
    hA4s6sM4kqNZfz1Lo8UKBu3kFW2DCiSPsTK_AYzKNSfvWLCzaBeO2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeguuhhjvgesughujhgvmhhihhgrnhhovhhitgdrgiihiidprhgtphhtth
    hopeguuhhjvghmihhhrghnohhvihgtfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pegsrghlvghjkhesmhgrthhfhiiirdgtiidprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:pmXUaIn0VCkiaeulDJrvkImm0TwOVGbsfy407f_dk99be99qoteJuw>
    <xmx:pmXUaKE4-SdrNlQp01E9yXmdS3eWU5SF0lYvb0dxHVnA1uGZlaRdXw>
    <xmx:pmXUaI6eraskte5Nqh-p786Q_W4FHrR-sWkkaMF2hwIZwrwQP_OC5A>
    <xmx:pmXUaKmE9_IwYZEN1N1pi2kUzRDcOi2Y2J22ZczgDb6myy_J_9N_fQ>
    <xmx:pmXUaMmQ8JIt9Lzebn8H0vliZ4m6aGvM2sI2mhyoX_rVD8CHd6Mv7U-m>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 23A7B700065; Wed, 24 Sep 2025 17:41:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2mPhEQg0_sB
Date: Wed, 24 Sep 2025 23:41:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>,
 soc@lists.linux.dev
Cc: "Karel Balej" <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Message-Id: <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
In-Reply-To: <4685744.LvFx2qVVIh@radijator>
References: <4685744.LvFx2qVVIh@radijator>
Subject: Re: [GIT PULL] PXA1908 DT changes for 6.18
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_144200_757952_947ABE81 
X-CRM114-Status: GOOD (  10.36  )
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

On Wed, Sep 24, 2025, at 18:52, Duje Mihanovi=C4=87 wrote:
> Hi SoC maintainers,
>
> Here's the first batch of PXA1908 DT changes for 6.18.
>
> The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a=
25c6c:
>
>   Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

Hi Duje,

It's really late since there are only a few days left before
the merge window, and you unfortunately based this on -rc5.
Since my branch is based on -rc4, merging your contents would
backmerge all of the upstream changes and somewhat mess up
the git history, which I try to avoid.

If you can send an updated pull request based on -rc1, I'll
try to do find the time to merge that, otherwise please
rebase on 6.18-rc1 once that is out.

    Arnd

