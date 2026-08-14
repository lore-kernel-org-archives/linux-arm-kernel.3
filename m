Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75303C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 05:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=; b=r3cuqdnujn8XXHQPKIdo5HVmTe
	xrODAUsfkN8TqQRFLwxxlz7KT7DNJojsE9HbnAtYKLSzt0LneZ9ocfadH4hsS98XNcxSmYlmarlQQ
	w5Fiy6WnH9K4Rg43OP3lu5XI+ubTHHY8sRoSc1iNy+hNGSJA3p0REWXXyaE9DOLg63RporbFdPBau
	zqY+qns7jSncTo/rNL1hC5vDpN1GklrGLij+qLY6rat0YN/BicvLc25WveJTgo7hUpWJ+CQeuH3S8
	ravIg7i3wYpDI5TUgRKPjRB5xQENLIxE4X2EE9JhQeKEdQyUSgy/2HXjLlzhSKcJS6+COnayOpRrf
	5UL67kHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukcc-00000001z8a-41KT;
	Fri, 14 Aug 2026 05:38:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukca-00000001z7u-013u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 05:38:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cf452def93so14754925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 22:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786685903; cv=none;
        d=google.com; s=arc-20260327;
        b=GRd1tiEWUOZwqWKXEBvbEjCCdj0C0Zot4whUvEvn4e1N2eXl2C2F0TSNVS1ZwEw1vy
         S6ewQfA2RSh6w8i2U6VC3g7niq/2imnco0SFNcTvVp9gw1AxGVP+vvvrgOrrYiIWYcKH
         e5pWrS4jc6gJ/Mmp1jaJxSx5rZr2X0Jjj/MYKjz4tTeercHNp3puiCPOmwrhidMBfpch
         HtMstkSINoFdCql+KJpSq9M+3G+PPwy7eZbTrwYvBqrZ1XkwX9PAPOfUqyYrsiqdEbsS
         keUv7JezDecbdoJqTlz4h2yJsiqv7sszBcXSD81di3Yc6sjPXCyvcRTqwtdCZpbDkC5q
         0rGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        fh=CI6+kLgjnvKaJKSQ0KvJumfPPUdppyW5NataNsrCV5s=;
        b=Mxx2TP09vbDeJ6rnwMbyT3Sca2IQ2dKi5bR/IzZUtzYV7rqwKFi6dgiouvLoPl7dHN
         V2ZUSld2egyutVUsLGXeC5Rrib3kq0x6BqfuCgByVgSg1DxZLx9TEiEdKB2hLB8wJYQq
         LKvPe5KFox28rUAG3cFY0DQESndJ8NnhhL59e19BS+WZmWfJG2B2c5EuSb6CNbKHeQNj
         DN4i8uVDZEPkPRnwfBLsHI1Cy0O/oz4wg0dswU7nD6NaPWzs9djz3Rl6hJMf/mQVVxXA
         5LmjzqJTXF1GfMcH6e6+Lyq00ue4KjmOB5CMGjI3Sx4U0oIOJkKWc4C45+fv9VQP7qVy
         C3Dw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786685903; x=1787290703; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        b=IZts0pj/y8+l19Hp0jJuNHCmzKzQDTzClYZhjVp5oCPFHJds+BBGXJOFHyzgLiwOX+
         5EApH7+Sde/N5XZIUvKiURyRvsPUDbNMh8Hh+ymLHpCSioEmg7xISVGqQac2Gu05Zujf
         ySzKKsIhtMG8Mag/hpg0PwAKXFoFkZFhkuFA3TWSCVzIWvZAgz8Kg9SXLaDBxrzX9LgJ
         tpL+hMY/+YG3FHHGa7lmoh2nouHQ+cUa+AbGQK6Oq8c+nWKNG6u3isV3vSGfK006apuL
         QRKptcc/cpE4cF9JbM1Wef7305krsxEhum0rdVt25Sc7WCydqMfhnK/P9VizxzubxnG6
         J4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685903; x=1787290703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bFXrIBCwNXQf5uSzSbdWq2pW0DAs87dD/iRxpbolg+8=;
        b=fOpHAdKYpwbzGGsHO+bwGvF/4vlYmHGwUH28oHBl2KG/Y7CTCsmeCVQzX53T6CjR41
         EV89rAQPf2TcbpIiTHF5Us9dkGM27hxC/mZte6idalIrE5UnYhebge+c9LJcJuVAnqDG
         Mh8PsFCczZwvuEDshOwrEj1zj1JRVxYJ1lUj8043O6ifRmAK1nqJp9wFejFpzJA+W88P
         6mlBfAO+Qm83Wa7r7LA6ZCd2C/0mnA6b0P4p4DZp8vxyAbb39vmRsVN0Kw0MIse4BFxI
         Nr485SJhKkkGeLzlCIW1KQMyHgkzb6AjmKk/5stGhiJDc+adVoA48wyMJ2a5KspNu8K0
         v/FA==
X-Forwarded-Encrypted: i=1; AHgh+RrGMgexP1yGcWgYVFsNj9gkPhHy11grveHjSH/1dukYvCGdCHii1XDVNDeoadAy7s61BRJAIfkpaduyNpU1ezQA@lists.infradead.org
X-Gm-Message-State: AOJu0YxySnqcvZkobDBWHeE+EaBDJpEu5ZV9HVmap/0Q5y1jNVyKAsgN
	U5oggza3WcXv9bOgb62d4JVYMwemqHAp1/Cszsg0sVX/QpW1R4632SzEuU9V7o8FpT7FFK7G9AL
	uDBs8WplviigJQZ6W4DK0l0o1Ol+2wvQ=
X-Gm-Gg: AR+sD12u6H9ZXcDsrEFpboP0ykvs0ulzt7E62mgoBw+pHeLh+jgM7+ao8/Y8v68l/qi
	TnSUMpcG4p+HvnkknODgwseC9vhAUe5s9E/4uzZgPzD5yf8S3vqM/B9qZTVuvtzCCk/3WmH5XwW
	m9usZ25ydQYcZAlry3XLQjZBLgQB3xMaIVQ66uu+jy717n1p5NfO2MOf9XeDSP2/l+glMzS3mFY
	bFlKCgcAx0F1kDXe130MnhtS5qSTs/bB3C4nxchzorL2J4vFc27RvDE5xJ8fRsQrloCgDJeYyW1
	lpdqaxoL7MiEdVLYDfRsiH/pMKjuL1JFMNKoWRJ84Ow/ig==
X-Received: by 2002:a17:903:15c3:b0:2cf:b9f9:18bb with SMTP id
 d9443c01a7336-2d3afdacabfmr29441175ad.4.1786685902925; Thu, 13 Aug 2026
 22:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com> <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
 <20260813190813.63fjmjmciry6ubaf@skbuf>
In-Reply-To: <20260813190813.63fjmjmciry6ubaf@skbuf>
From: Semih Baskan <strst.gs@gmail.com>
Date: Fri, 14 Aug 2026 08:38:11 +0300
X-Gm-Features: AUfX_mxL4JRFHzU19Y1xhgEzNg2PbVC97aaf1LW7NSX7i3h8ym5DbVvC39-eL8I
Message-ID: <CAAsRjRkQuR8u+vxhZXOzKpVDMUM-tG2AoiTr+qGg05ewjD+4yA@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	netdev@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_223824_052073_EEFD6DA2 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Vladimir,

On Thu, Aug 13, 2026 at 10:08 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> Where is the code that configures this GMNGCFG register?

b53_brcm_hdr_setup(). Setting up port 8 ORs the 0b10 value into the
GMNGCFG management port field. Setting up port 5 ORs the whole field
mask, which sets 0b11, dual IMP mode. The chip has no IMP1 only
encoding (0b01 is reserved), so there was no single port value to use
there. Nothing clears the field. That gives 0xc2 whenever port 5 is a
CPU port, and 0x82 with port 8 alone.

> In the previous version, Rafal included a patch so that gmac2 uses the
> same MAC address as gmac0. Is this better?
> https://lore.kernel.org/netdev/20260811193658.14304-2-zajec5@gmail.com/

Yes. The IMPs never learn: b53_setup_port() disables learning
everywhere and only bridged user ports re-enable it, DIS_LEARNING
reads 0x01e1 on both conduit configurations, and the ARL holds the
host MAC only as the driver's static entry. So one MAC across gmac0
and gmac2 cannot flap anything, and the bridge MAC stops changing
every boot.

Best regards,
Semih

