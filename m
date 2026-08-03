Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC570C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=; b=5EAkW9jFjpxCylIqDcUkiHflzd
	ni7xtDO6Um1+fxuMnpJfdOT20nc5uaUu+2PI+cWjjec/1HKNHwv6I4Vgp4tGQTPYvXtA23L2cu+PL
	XArH1CXXY6uPiQKEQpP/2qNzhTRI//eAdmATIRONuWN4cCSR6RGoa7+j77RRDAFyDESCT/+81R2sN
	1hm0IYu1la7QTiZSWIxhznk4ScIJ3ZUM1QWhpIHaoq1LrNp+dbpWZJNi93hv6w+Qz7vLDxkFm89sZ
	OnYXN74WsYFx6s6VW6/lWOjG9FDZ4uEIcx0HerjdeXEiYXPYBcHQ+6iPs77ELonJbVa3VegiAxhnH
	SYClxtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquj6-0000000HXuZ-0V5z;
	Mon, 03 Aug 2026 15:37:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquj3-0000000HXtw-181u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:37:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4956242332dso19824775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771431; x=1786376231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=WSYWhkpy4Q6lYkDqjRq8EJwUslsLyTsnzOvw8OqHSWwIS5kv2WA/b2l9iwYN/97x1C
         RM/Lpsy+0jVJzpsoO+iWvO7ewf2ISeLAWc7SITps12c2pJgt92zqn4csXGmhFFPU84U1
         RX+XGmWnx8TUcvTRT2b1M9glaQoA/esINJqkUurdVJnI2xYl6oyCm2606c0/KucxU4Kg
         oGfoEZSCz+Pilmw+tDV/Rh5EIxfsrNlqTKtyaYu0RJ6koF0tDpyZayZLs+OfAGiHxJeK
         Rlh+mOcW0QAIRtclTlYk1av/2AWvkhkr3h3WWX8//nmbouxjrMpztHPXhXzJNt8BKGDT
         n75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771431; x=1786376231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JR+n4XOC99wox2307V3vRuKtHHH2tWYkjolStlp9b8=;
        b=XNnCK8LaI1kVLCYZGqOMwMihBARNlnJhYVNuiB1oFW7YRdZvLm/KPYyMhvlqfaZgzt
         Qa2v0+G8u2wieUSQcpqJsk6Zdo2M/RRu466nS6tsAqN98DAqECVwU70xwKPhESPQo968
         7ZbLRb9LVs+fc3OOAsS0eY6cuIsngxOT7NFzVlc0TO2BdbIqP4yhVrwKwdAKNXSKEoao
         ZGITx8nmXDYW+rgvR2+paF9OMFo5LKVbhXZBeI+azCnPRy53ll4UvwbCV47ajcT2RF9u
         vBfsB7xNjprUMKSKbRzvJGNiVd48K91f2MwvtXKCarHD5SijyqBj+W5fzmxl7puCT08L
         H75w==
X-Forwarded-Encrypted: i=1; AHgh+RostmojWQUlPqdZZmOGdsEnDjKw4sMwVhR60P3MtMCRagiP1yXwJNim90D1nH7PQyFlNOvYlvbvu9XeVPTTrdFe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2SznOaFNZztO8GeapuHvJ4Y6lhU5CI6P6P6NUzLSEzJLMC5b
	aESsM+jdsrU/w3UqfxiFZKMADC08ZuPgNBI6Vp2vVfD8bUoDLp73DH1a
X-Gm-Gg: AR+sD10NuZg4GlTFsqjws97niJ14s5wGjoDWzHakzu+/VO7m4fk5OMhRgFpLxFBy+Y8
	jZuD1kg+Nzfez/wVwg+B2S6Qw37CDaXOlnLmuuEXQuXAlBztnkE+0RUyaYwogD4zolDbG5gfYAe
	1gMsxjkPbPddL5fYHSk81djOvwKb4GOnoy58HJuKA/m5gT/GbJc9iacKUJuIXu0mf2n7l7PtVd5
	fAaDt/t0NxfWnAqyjKLgxJ0JIB0LzxwNHbzu4PxUziOkjasmx54vSxVmtTAvC85VxxJwAdufPZc
	ADKxpgH3N4Kpyrkgfm5m3JmGVIRhHFVGUMN3405uW9LiF5KPsH3PZOadjQwwNbUA+iwr6cVRhdN
	dClwxp6erkabEf7iFJ0JMv8EyRZhwfvTbQ+B19vql54L1QW+48DMZSIf9D8I8CvDV0q3Tkw7Zho
	QGGnfSx/hy4SkFBREdv4JhNzA85q934erOd+gCIajG56/pOAdsBaG+/TYGhIFehZ+vngtdFCZUO
	SklEjvyyvXW3UVAswNZNKc=
X-Received: by 2002:a05:600c:c170:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4980c673ca5mr280126695e9.14.1785771430446;
        Mon, 03 Aug 2026 08:37:10 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc6d82sm751455e9.1.2026.08.03.08.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:37:09 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: wens@kernel.org,
	andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon,  3 Aug 2026 17:35:19 +0200
Message-ID: <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com> <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_083713_323579_8E0A9DE7 
X-CRM114-Status: GOOD (  14.45  )
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

Hi Andre, Chen-Yu,

> So can you please double check this?

Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are right:
PJ10 is not needed on this board.

PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the A523
manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-PJ15),
which mainline already has. My claim came from a stale comment in my tree, from
when I was chasing the dead RX. It is gone now and my rgmii1 group matches
sunxi/for-next. The Tested-by I sent on 22 July was already measured on plain
mainline without PJ10, so what revived RX here was your withstand fix alone.

> Those settings differ from what's in mainline. What are the results with
> those delays?

Measured on the same board, DTB-only changes, TCP for 10 s per direction:

  A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
        TX 0.938-0.940   RX 0.929-0.930 Gbit/s
  B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
        TX 0.941   RX 0.929 Gbit/s
  C  the Ethernet path exactly as mainline has it
     (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
        TX 0.941   RX 0.929 Gbit/s

All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop at 0
over roughly 1.6 million packets each. So mine are just other values that
work, and I am dropping them in favour of mainline's.

> ethernet on the A523 has other problems. The performance is really bad
> (even RX), and there are errors or packet drops.

I do not see that on this board, not even with C, which is mainline's Ethernet
DT unmodified. I also checked the YT8531 auto-sleep: the first packet after 5,
10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.

The kernel is my own 6.18-based tree, although stmmac and motorcomm.c are
stock, and this is one board with one PHY. Chen-Yu, which board and which MAC
are you seeing it on, and how do you measure it? If it is another board or
GMAC0, I can try to reproduce it here.

Cheers,
Juan

