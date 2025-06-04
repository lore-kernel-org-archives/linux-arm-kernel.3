Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8ACC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY2YvXvO6SpBozJIZln03+FM5s6N30mas6ebICNvM5o=; b=T9QGkDDNzDxP0PIaMmu5A5uhMR
	s2vL9lCfkLKv5uZKwTLu+0kSmannDI2K3fjF1TMBKKSdXRt8SzpBGZ7RS1Afm5a+XpG/sxDmSV5R+
	II380kM/worncgOYFrtLy9tVDYl0l6gyyegMJ1gKiTDQYM4W8JV9PR7s3sds5eFhiPEG2w9rlWrgN
	Ox5kDSQLGxgaAmY28Zf5vwNBlFKnBsVqcWHxbENIbLMLiAYBWAigiVLiDwTyjqVja1jSoRFbThjT+
	PvFtigHPv3MdxnKmlGX5sjwRsbMKXBeF1wH9zggXIE/pZASrDEtNdA/kMA05R5ntiXx24tVZ/tsXL
	xF/Pvegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsGF-0000000DyPf-0qxT;
	Wed, 04 Jun 2025 17:50:47 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsE8-0000000DyEH-08ab;
	Wed, 04 Jun 2025 17:48:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749059313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hlqeOy8FbLIuiwIeAi3dRqxN20x8vQuLUu89fHdLag0HYFs+icUfSpYeqzIUC1xRI/k9y+gHWdCNxzJDnOeva/O30ZCZwkS+Kjf/dacrQV9eAaWbynPQDrfflfBC9MUYKqOtynA+aq3/oz5au9knmPd4m/A/Ng0v/UuZyThg/SM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749059313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IY2YvXvO6SpBozJIZln03+FM5s6N30mas6ebICNvM5o=; 
	b=UjyGwmOvgYaG9eqtUlBbjJ3wdMZjP2a6Z5OBeUkHHdzaWxHxtR7n+VCjBqkbeWgJf+0TGv3G4GhfIowdQ5llJtV+Lcy4+kTFxTqWmkdCPSOGRjAYfl3RUODi+60ob7jZ7vzmSpHGYOLfkYs9zaRxLrUuxnPuIBAUPI6Bo1h7edU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749059313;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=IY2YvXvO6SpBozJIZln03+FM5s6N30mas6ebICNvM5o=;
	b=Ydg3gfYKGZFsdTO27i5dKmUwwPPdmOjfwdFoXVIP26gKoy5V7Nh7DUy93R7TCh1M
	ehTKUWRX0R93Ch+NjwKik0n4oLELLZlPG+dLZLKqsnBUNK4kUOmDlC4KBFbmMAJSv6i
	IOn10Jcwmfvw4wAvv5Xc4/nlQJhBOfTotQiVAfeE=
Received: by mx.zohomail.com with SMTPS id 174905931053884.90868394515064;
	Wed, 4 Jun 2025 10:48:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 0/2] Cleanup in rockchip_sai.c
Date: Wed, 04 Jun 2025 19:48:27 +0200
Message-ID: <3339020.AJdgDx1Vlc@workhorse>
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_104836_138180_CB1D306B 
X-CRM114-Status: GOOD (  10.38  )
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

On Wednesday, 4 June 2025 05:13:28 Central European Summer Time Pei Xiao wrote:
> 1.Simplify the condition logic in
> 2.Use helper function devm_clk_get_enabled()
> 
> Pei Xiao (2):
>   ASOC: rochchip: Simplify the condition logic in rockchip_sai_xfer_stop
>   ASOC: rockchip: Use helper function devm_clk_get_enabled()
> 
>  sound/soc/rockchip/rockchip_sai.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> 

Hi,

for the v2 of this series, please To/Cc the maintainer that will actually
be merging the patches, not just me. You can get a full list of people to
include as addresses for your series with the ./scripts/get_maintainer.pl
script.

Ideally, you'll use a tool like b4[1] to make your life easier here and
do this for you. That way, Mark Brown won't yell at you as much, and the
responsible people have a higher chance of seeing the patches. The b4
tool has the `b4 prep --auto-to-cc` option for this, and it'll warn you
before `b4 send` if you haven't --auto-to-cc'd before sending. If you
are using your own SMTP server to send and not a b4 relay, you'll
probably want to `b4 send --no-sign`, but a dry run with
`b4 send -o some-dir/` is advisible beforehand so you can look over the
e-mails being generated.

Link: https://b4.docs.kernel.org/en/latest/contributor/overview.html [1]

Kind regards,
Nicolas Frattaroli



