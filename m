Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOKFHb10;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=; b=tOKFHb10wEt9d+PZvz7mCL8fkh
	4ztIXxwrkoPgcYE1eac2ImFVpKgDq5TN5mWVtM7M8sCbeyNRbx5zojpHOedP4cBE4dsl5Fyw6DA5L
	z7HnoXUVDjWMijeagrJ0dWEvD8+A+i1kUjwxbqmDqHTqrPGdnlGXNYv4AYWZtJ3PFwpr9jrgfbb//
	zEaw6eNxf5oebCq31uQo3OzKXHYPki4bNw1gM7KHky8vHlJAwH2/1h5wMfZGqiElPGL7fBKG0Wc7S
	2QDVyfg3PSNgKtFqFAlEhU5fTOT/FCAzXodJhkekllflaIAJ0wc4y0PtnQGmEF/RESZHuoDNkSNKv
	ppPlFcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIx3V-00000008YV3-2b3O;
	Mon, 19 Oct 2026 23:46:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIx3S-00000008YTm-2MvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 23:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792453568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=F30W39f+TIXr/Fp5w8uuXB9BQWFgNgayBKcU8lpItwX4Cg808rbuFGNJl54mVfJwMwu1+O
	+E9RwfNhVXOOIqQF+HIAW6fvWCgqPYyJRmvG7+Pg64bdlOrt7fRfnbf6KXvf7jW0BgCY4k
	XH3MmN6IIcQg0Gsqa6ZupKIZqrvinSo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-qcq11L8TP56qnaUSlzfM0Q-1; Mon, 19 Oct 2026 23:46:07 +0000
X-MC-Unique: qcq11L8TP56qnaUSlzfM0Q-1
X-Mimecast-MFC-AGG-ID: qcq11L8TP56qnaUSlzfM0Q_1792453566
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-535066512b0so81887591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453566; x=1793058366;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=R7BvHnZZIoMag+w+wR2qsgCuEkGC37r8bD+HkeglU3FpV34z0/AlWlh5U0QUvvr+Vr
         2NuxPpDFk4HOd8Bc9oLpHOk2LCNo3tkDEqp1j6b2nefHTZtZZfuHIUYIbU6FXwgIWYdb
         BmCwqN9XSIHIRg18lhOVfq/CBgK1w0XdW0vw5JkJoMVBMI4WHJ5zpZH5m4gOsu+JPBkB
         OASrqiJpngOCsNetJBbol+Fk/oMordfNv1e7WUTWymBl1SqrG7AEnOb5KiSb7HQ9PCIH
         OH+wrjkZiQUgxrNEnSC6pTNhEfCXKX8ujJrKSZEbFqZSBYG5fBS1/rMfswQOzWzHwLcV
         CtIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+beaPWboYUh8MCQgkvjwJtVsaO/X3lgcbtjjUzqD1BtDVaeH3KDw0CgECu8JxfJFZB1G8GWTVLBzUOKqB/65m@lists.infradead.org
X-Gm-Message-State: AFq9FYLyozYfV6TujQDm8oYuMOWANUuGydf0igUY3kQddXYLJlqhh9rx
	lsucn5uAj023CR95Q37UHjnrrNrZuZ5nqK0eXgtEkd37c22lKKGpGRMGQ5nXROatKTHbfwSRAIE
	SLxe4DtzGpd2gyEu6JhFg7w7BiSBfjRxyhqXP3gondvbLDlJpSGj3kxWWjxpv520Xlxfn10sKqV
	jbR+z+bnzitt0=
X-Gm-Gg: AYBFou17xQ5FOWhNbfFmGyQvB6B+c/vqIk7PuxtLEO72l3e/H+Ww3tUti/IXBouKk3U
	qqyVhafBstXr3fZFg0b6MSRf/nTa/wchL8Ha1f+mpfznA4xs+13GnOQIhSYqquhKciaAGjfl9ha
	+EJAeyZ4jVbieWkirWSA2PQ79FqJtGz6+vgDH6vAqLekgNmg5e6cVNJhIvKHswHyUrYEZ7/WnV5
	BMGlPNFDqv4Ro/A+YwI/GJtZhoNz0fgmh/1rbcicyDuhQDHajDkuX0XOxo+g0UhiZCC1rTH/OtU
	uxze49g8A7KxAS8Rq9EEmW7I6MRCwNkLbDcx3MAIZLZm9LH1aCGj67xJUy/cBeTdnC/FFO5Dg3b
	tMZ1fWUCvGw0MjAJmzFBqgS1RqOA3B21tdmZugW00aXFgloNCzW1J8fc3BSrSSWwK6SpBLtmlrh
	5jdOqhko0=
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027491cf.46.1792453566397;
        Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027101cf.46.1792453565913;
        Mon, 19 Oct 2026 16:46:05 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm66755561cf.14.2026.10.19.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:46:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179245353543.117654.7478218308853360546.b4-ty@b4>
Date: Mon, 19 Oct 2026 19:45:35 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Zr0ZL61ygpUZIVKFPvP8VcvRE1XoRbIaNzvBa5Hves=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKurd5U80jc7qBgokvY8r53frNq2yaIPGd6+GGbZZjne
 n214wyBHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzky0pGhs+LnM6uiHrk9rr4
 0/4fMZde/7r+b8/7skUtx49bnjbmeXiY4Tfbf8k6TpPFLxOWNKb+9OppWtzn388WYsB+4mNltFr
 8V14A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YVMIaysz4zPx4A21DmECLdpObVw2nG4s6Y2jKuKtpls_1792453566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_164610_685647_6AD9F68C 
X-CRM114-Status: GOOD (  11.27  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[4/4] clk: imx: pll14xx: support spread spectrum clock generation
      https://git.kernel.org/clk/linux/c/1ca4bd0c6c0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


