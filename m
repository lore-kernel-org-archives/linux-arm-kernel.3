Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EBAC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=; b=GiS3pcXnsK6EONGga8PazPrLQz
	rjUKX2yDckCq9o5j+6K1ZRMeDeRy/3OrehS7GTVp/fcqEX8FLWx2KAX1P/YwdiSpMhpH3l/zUjaWM
	xiXM5pLaamoSUhYFra8UNBG0tPI1jQfucrnCRq5Q2XGnd35jOatMvbEbdQqzp0uti5BFHE60McseO
	VyN9WrGQckNDPxWDs26jeHP4vtQgOWsifoIAfkddd8H/fZEYJqWt+7/z3rsD1Jv94uma4I41qjW9R
	62BA/CvnjnbOaeZWYLtVLzCShKJfOGjk56rvQC6+z0jzz5xKmfJoSSTiZYuCqSNAdNe7Of6QCMRD4
	874z6Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVx-0000000DG2l-1SV5;
	Tue, 01 Sep 2026 19:51:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UVu-0000000DG0m-04ZV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:51:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-482fc3327fdso216124f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788292278; x=1788897078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=HLoPqXAoAYqm/B40st+VRjBzU0pfYwjKCqRAZmxbZ/ovZ2tZiq+TXXnYMy+6Hy/L1I
         nH+uWpf2OSkCuZ0cQ1cLxaGsnaIchSXjbwRWvxuQ5A+yTOzFclE0zdRopzi27xFGHxmG
         PvHxMU3W36wSwDStJljBCKAxjZxeMkffmVcAQsh16WBUmLkaeFCq6tX6/YLQ5s0A5zS+
         ZoVz9vQEiPMteIvysNPFBr3sHcj9qkyhDcIJuQs8YcqumRd16FPEf4qrV/ZeF05dbN37
         Ye1LiPhl8tqLR7z+QUassfUVOr1rY106GOnrkTgKA3HUXyn5IjLrq87CAvQZsE6eRR4i
         FY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292278; x=1788897078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwLey5dTW4uM292A2Vd7bSxkboLRHGDZjGIzXx+42J8=;
        b=IUx79ZeZUAmMNPeEMmVTjyRqLIYZCSa/esj602Rs11faaFmhM0+zs8dOSHea51MhVu
         OUviVK1t/bLIkaBdKwNgOxksKPiVmvdYNlKktdWxBnpC6VKmDIDpf4CUcqw6NDrBGYCX
         VqGagDFp2HQbX6CrJlcmKl19HSGflKT1UoumiFZ+sc2+N8ciCfFDsHDiIaTkQQ3fH4Ux
         sKq4C4f7bK2B7Vh1yufDQAQH94bZ01ztPsqNtcAqJSubhMaZ64zyUNH+drBwloXahowl
         SNq+ixImGaSsvj8tOSGG0mdiMotBEwfmnozmi05LFBNm5RvK59lblMWxDkfWbHifullj
         s9Wg==
X-Forwarded-Encrypted: i=1; AKwUvBw7988K1rhaqW1IGt2s0zf1VbzPB6tcjDUX688TFsOHfLP+j6ON8IDLhvUkL3DV00nGqh2a7lB02tejmsf6N2PR@lists.infradead.org
X-Gm-Message-State: AFuF++luup3ezNnXcTGcHTZCaMCjrkksdPWZVrVmVCpABcCPgw38tif/
	jb1MAuVbHg9e6rHAl/062CMJZO0rV6THjyyOZhZGDRvDautbQON7/RvfkL8D9WDVXwA=
X-Gm-Gg: AYBFou2EEIlV04OLnMEdKsee97qG5ubaxKtE/otKsAikF9lCQKCMt6M21PARYqfLhxr
	QEvfIQbdWmUxCW6PGMGgStlg+ou5OO++Pf4l/PfNNsDs83V6SnbA9QnkOW35nJ/2ULz7Gt+5Lt3
	oeIBbLlZ0d/Ue3wu6vx899xg4ihfvRUuh0F3pLo3FGuO1+f7xqZ7hocmZ9VOzCwWCpjyo8hs3sp
	YpnEsh9Lf7oToVH7bQgZ2Ue68KD5CXAUcz3hyZNxn1D0Yks1hqfTugB75AKIUiAlsCNNOw7tdyX
	vnnPkOhCl0sCRJM1CzbQ4lH3Ks3NrQVH2mp9juVGsRq3itBtSQL36eoNoTE1kto9XvEKJVZPWXJ
	KjuA5JWr2F4UA8dOgnj7U20pxU8dPzcAZA99XoXpSktd2Hjhj89pxS8l2YckZBiiTefec5Zhswu
	AQT/TTt8zfxRJttGK03s4mJDYsDHE7AmAdlIA76MsBA0ahaGXcBg==
X-Received: by 2002:a05:6000:648:b0:484:4189:6b09 with SMTP id ffacd0b85a97d-48441896b75mr15334529f8f.17.1788292278109;
        Tue, 01 Sep 2026 12:51:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm1316681f8f.35.2026.09.01.12.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:17 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Tue,  1 Sep 2026 19:51:12 +0000
Message-ID: <20260901195112.37184-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
References: <20260827211652.63504-1-f@lex.la> <20260827211652.63504-3-f@lex.la> <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125122_056167_23FE5A18 
X-CRM114-Status: GOOD (  10.19  )
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

> For a 'net' patch, I think it makes more sense to restrict the lpi
> interface to the chip revisions with support confirmed.

v4 will gate lpi_interfaces on a per-SoC capability bit, so only chips
with a confirmed LPI exit get it and the rest keep the current
behaviour.

MT7981 is confirmed on my bench: with tx-lpi armed the PHY's MMD 3.1
shows Tx LPI asserted by the MAC, and thousands of LPI exits at 1G and
100M against a BCM5720 lost nothing. Details in the v4 cover.

Qingfang, which SoC did you validate the wake-up values on when adding
EEE? That would be the second entry.

