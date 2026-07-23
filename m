Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246DC44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=; b=TOQCHhq6AR4L4NLqT1Xo6X+CJW
	+b/BI5ZU+ix2XgGrwx527HMuTTupwm9nC3WtRhaLH+sVaKhp3YgrgkTazIgPMlNPoQQCoQnevCMQ5
	UVKc61h7VFL6cbc3zIJGezvFMJMWMTIPOB7dsk2/cD5swylx38KshXtvPRMx7bBtWy6LRKLyCk8uV
	1g8cpuvvR8nyYdlJDy4+osyyE2q7GmrWSoR9/j9SpbYyaBOq3Q6jGvGEK0KTxmn5+TxrohM2DfyPe
	UaYSRRt+RPSwRbTKEkYOpHhvfAuZDCNObB0W/95hDJvSgMkbcRA43ka8IErKJd7nL7PCfGXt/lqbP
	E3PCzYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhaX-0000000D0WM-2N6z;
	Thu, 23 Jul 2026 00:47:01 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhaU-0000000D0Vp-0xpW;
	Thu, 23 Jul 2026 00:46:59 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id B17A2130030A;
	Wed, 22 Jul 2026 20:46:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 20:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784767615; x=
	1784771215; bh=OJHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=; b=l
	qS8ZdsvHfjDg2wvyG+Ep/sVaJebLS7C5PlXP+Q2i0DKw1qJxmgkJ8UuPSlnMir3g
	hhUGiLVEgw+AsQHDDi9U28Gf0W5tqySHP3AqfBB0Bn1dSOr0aCn30SLRA+eUqGyM
	8dP3Afb7v/v93wfQ0SkJXUKQtRbMGaAJ101MZu9pwMq5nLlaA3pinTgShBYPiYzz
	RU7Ws/bnGklaBPmrQHs8/lr5TXLmJudGbD4Um1mHjLtbeIobXgDEqOgmmtfoj+lp
	ujCUaZWuJS06D4ht2ZuAm5h938Z22pUpC92vBE1WAEe1kPBak28qH9oF4Giomul4
	RLkhDZvuo+qp/kThAQhzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784767615; x=1784771215; bh=O
	JHKUYMFKaoMIxRVzHh5k7kdywBvMNCAGk+h8PoY7yc=; b=E+QVGlWgS2Vm5PeOE
	wcpyw+ILTgsCfRB8LdWIEq2yFlMBhiC+B0LwVDRqxhrAbPmDuaODB5eHNx7yVx85
	O0cDAXDxf9U7G/MpUb6NMjqOCFAKiINRI3LVmeqUf2qRjTadKsfryRTKQQE5AcPZ
	lTUVI6ZFph7LGLY+C4qRDN44LTHBRKy0cAEZ6nl8T1CocL1BcwaHpM6WrjTqdRi4
	PTm7286LwQgRtrfNjr+NBOyz+qNghUUf4tqqgMAxChV0pAbRyVU337YbAIPIQfpB
	bI5L95PuH1ymptQ24vYrpfPFP9fneUCv7IwYvJQ7IA8BDva5VzYoS9EXkx0qVTjH
	pKPjw==
X-ME-Sender: <xms:f2RhavNAZu00QFN0kLfWDtBOwMLBnbNn7cyezesFnBglAxpNFNf6kQ>
    <xme:f2RhapYdT6i9aWuR_LOUOz7QZPHj5ZrYEIFhdiDKNh0T0cJ3yXhAVUnh4exkWMkSp
    nmuZQ7oxyZb4aigP7iNXXG-FObr7Vq4fBxJPQrCHeJe1rvRvJ3r_gg>
X-ME-Received: <xmr:f2RhavVht6xTFW_3UB3sDP1NcG7ZWF3IUvuCVcvgxL-L0NIydy-eRnm0SirmmzkBAfbo2XDaEklIk5gscvmFKck4NfAYVzN0Hdq9Z0rlYbGc>
X-ME-Proxy-Cause: dmFkZTEokqfq+D3jpgPBuTiBa0dJJRdul8tMci1cvXMe3NbvnPtDgyeMlSfDNY2VQZCYm2
    LXht2BNYdL8iUtCGHSZhcwG7q/Kwl3zIUaoC3BGOdInsGrs3nFYGV0l20ZTGRKX33xkdxH
    NrkbmddZ2CiaNePh2o3WZ/+U94U7XFDTfdNEN9WbkyGOyRxMeS4dRBw6ne/XhrYOCTO3Jl
    ClCrSi9gz0eIQPQAjjkl3Sb4QSzuiMuP32yq/tuzWd8kGBQfEHsoAml+J1LR2BOOYVtNmX
    Rs6na04Rv82XA/POUiW/BzcYn+UppGRk2cBhE7PHgbgeUCkSX0KVVP3s4tZcULINdIF0tY
    +eQ/XxpkNyngyjE20TnzMlQSgfnmZAsk4QO4SUKbHdtLgwmnDzvZMr89cLT+YAQlPLD8kS
    HQVwsOjoN6yIJS5W304CtQIY7BaKdW4qVsOlS4nAt5IX7bCfaAn7WAXpCd6ffY4G9D65v3
    nwnIDTNwlUMBM6CuBv4cKSpF2ZQZafXm/Nx2oGwLZnZKlULKUf7/XJ2NjHpaL9F2Jo66Ih
    QdREgIHQ6LOsNQLAZgFnecJztYOxUo7sX1tIRFtjMJpPsu1YU5mr7/dWYU4HyRF1xfU0Jo
    sNImIILq/J0mefNqxkxyFzL5JQ4O2a9ibKnqCiOKT330qChgE6JzmSPn5kmg
X-ME-Proxy: <xmx:f2RhaoBGnUNe0OzkAL9F4YZcdVP-gTXibNIx88zoEyfctr8ues4L-g>
    <xmx:f2RharJ0MXZglop8uPFkV2YEPJF0suvzDuDi6YoOM_1kWdke7YS2cA>
    <xmx:f2RhamtrkAiEubMyvmFs98MHBE-H_gQacrbRlRpkGmNSHuWCmNRVqQ>
    <xmx:f2RhajXpTlEUBhTfzZXCDc0fO5IKWCqRXGeOqRy2ZSj3j5ZRCpJTKw>
    <xmx:f2RhatQrWXI1KlMxZrJ5bfuWMOaSqZuupZls3oGhvNT5ZuGxRb7rj-w4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 20:46:49 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: nicolas.dufresne@collabora.com,
	detlev.casanova@collabora.com
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Date: Thu, 23 Jul 2026 12:46:42 +1200
Message-ID: <20260723004642.2075233-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com> <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_174658_455161_9FBE9D25 
X-CRM114-Status: GOOD (  15.54  )
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

On Tue, 22 Jul 2026 20:29:53 +0200, Nicolas Dufresne wrote:
> This is really nice to see interest in enabling encoder for this chips
> set. I'm adding Detlev in CC here, as he's actively working on RK3588
> encoder, which is quite a similar chip.

Thanks, and thanks for looping Detlev in.

> So Detlev driver, which finally got P-Frames support few days ago
> (he'll explain why this didn't work initially for him) [...]

This is the most useful sentence in the thread for me. RK3576's VEPU510
and RK3588's VEPU580 are the same VEPU5xx family -- same vendor HAL flow,
identical reconstruction/reference-read (recn_refr) path -- and that
reference read is exactly where every P-frame stalls for me: the first
inter frame of a session hangs the encoder watchdog fetching the previous
frame's reconstruction, even though the reconstruction is valid and my
register writes match the vendor byte for byte. So whatever Detlev hit is
very likely the same bug.

Detlev -- whatever you can share about why P-frames didn't work at first
would help me enormously.

> While this isn't invalid [...] the community agreed direction was to
> introduce V4L2 Stateless Encoder specification [...]
> [...] we decided to look into making drivers similar to how we do GPU
> drivers today. This is possible today thanks to the Vulkan Video
> standard.

I'm not attached to the stateful interface -- I used it to get something
running on real silicon, not out of conviction. Before I commit to
reworking, I'd like to be sure I understand what "converge" means here,
because I see two fairly different directions in the thread: Paul's V4L2
stateless H.264 encoder (kernel-side reflist/rbsp/RC core), and the
Vulkan-Video split you describe for Detlev (thin kernel module + Mesa
userspace). Those differ a lot in kind and in effort. Which is the
intended target for the Rockchip encoders, or is that still open? Is
there a branch, early code or spec draft I should read beyond Paul's
series?

Either way the RK3576 hardware enablement and the reference-read fix are
shared with RK3588, so I'd much rather contribute the VEPU510 side to a
common base than maintain a parallel one -- I'd just like to know which
base that is before rebuilding on it.

Thanks,
Jiaxing

