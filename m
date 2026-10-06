Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E08BCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=; b=ClVXxWwiZoa++nFsaPNn9DnNsp
	E2B5S7mZQTrP+kybq6AljIgCdW5JWyX6BRL+sbEGyWpEzlj72OJTkiVjRAC5TEgRD3UNqfJFtI0Gz
	S8K9uWgj+jgtKeHghgCLon9Pt/dRZwQI3QTgVpqVYT1dGDf2yxzE8f8h34T5/eDVfZS5UIEzo/Ndm
	qOkgaIZo5o+9NBywDyRh1PEg5/SfgBUjwXyPwr5F3EufWjqgXGvJKunc4XczyGCV0Jvz1tJL9IlNj
	Z6WFBUsC4Icdp5Dl43vaOqVefSDu5UcGa4w382E73gojl4o1fM+e3Wh8VYwwiM/h3uQVjnR/MrClm
	naUM70jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3NC-00000000dQ3-3CKX;
	Tue, 06 Oct 2026 11:30:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE3NA-00000000dPK-0u84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:30:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49e73611928so4000625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791286214; x=1791891014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=Lrtg9AazGQY6hCxmFzRp3PavwbEotFEFmku2bsDtFwqv2apZ+RXPSg+82SoIH5JH1C
         rwusKJLkM+mssrI31C63hVidQCcKEduhoDxjYmjwqrplVsAhqhTmfHYa+PgOKoqPx7fs
         8LGSm4lbjX7z2zbDW/289CcE1NX/sD25V3U2qOvSEd9nBGg9Y8vGKlKvecAMTGJ2YdF0
         ao/gdXB1FlHiCiEOrw0Tx4WfamAtJa5umIHlcrQLNnD9BZKz7kZ2sheEmrN05sDTg4a9
         HyeZsIYEXyw6Yff7FEDFgcSk6+kwqZBisXWbusAXAL+gxyAYp3XV3KmzuBMjpZkwZlle
         DWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286214; x=1791891014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7aYTQPeC1hyGc3Y0A2cCz+2IUa1ZlgF2Fp8Xves7iA=;
        b=Nlncl4ia52c3k20jelTGeOR/dFNrjEQr7jbX4SW3KMeLZ507l2yfcbnwlPJlJF6fQp
         DIwIjfNoVSmGJIDAdgPKgzXv50YKXok8r53nkKvk9NHXfM1/BtsEcIgMQgE6Is26HB0W
         FHE2/hbo3ygUo1acAguSKYn+opBudck4Y+9EmGCxVKM2uB4uNIU5hcUDC8kkSz1PhQwC
         zIwOKke8PQjJS5Z8SdTLHiYhC+cLjZPXb5NDSjYbmEO8wPLZMnwd3rffSuwqwZo+NDhB
         Zc1HYCOhAhi1aEny+KiN8ppIzyNKv1pl9VzD/8pIR8J8K3qD3P6CxlO7vzBcCYIaTuWV
         N6pQ==
X-Forwarded-Encrypted: i=1; AKwUvByqj7IM+ed1R5VmUwcQ+pLUondhC2kTCqcvRHoRXoD+FjOXPSoRARUNZhHZHbIbCZwhvKMAl5v2V2yglSLb5Shr@lists.infradead.org
X-Gm-Message-State: AFuF++mHnHbG/OaCDL/xQikHmQKS1ksiNzbCegqMwlid/TcYKNHBq1Wg
	0gpLmWpY88yZD64PVt52xKmi8DoAn3ge59DEyn4eMF3VFcldVIW0+1fhao/ehw3k1/c=
X-Gm-Gg: AYBFou29kdtyGFHH/X58HBOO2IWPr7SzSdqmeZc6dlYkgQnJOVaM8DERkvHVbrmaAxp
	UirCPR4CpJxVCTLcIXmihoT82e6bpojVxeN7yLkIPHIq0q/t8/TWRAeU9E+CYHAKtSkcApfsSOm
	9alNiC/BgqzYvnwybTaA2Lo6FZoVvVLD674KqXkxY+o5UI+lNkOdeZvdel8m+vmdqZ6px4dG211
	q/bEzByCZnVMjeTJu1nmg+JQR7z9n11n+5hCloCTvmIQqjeScA+SJ4evh6gm3dEG4cjoe4/+DpR
	5aaT4iIXj6a91F1eyaABDakOGExC5c+eZjsa0uYxptW4jGJ1KUrEyNdd12ygcZlDmAD9LtCl3Ao
	iNmmTMLLTDXhRPicvnDHZvDKmzIrBmOAbOXU4yGPX0qNVFeAFdm9jY0YCbV7Dxw7yIPSYQlae5H
	VgJlxANpmmMUsITp9Vut1hEe0XI5CKugTD3Fhl1UWxZ/GucjgasA==
X-Received: by 2002:a05:600d:864d:10b0:4a1:661d:da2e with SMTP id 5b1f17b1804b1-4a178a3053dmr37160135e9.14.1791286213774;
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm3173964f8f.1.2026.10.06.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:30:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev-bot+sashiko@kernel.org
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/3] net: phylink: wait for PHYs that are known to probe late
Date: Tue,  6 Oct 2026 14:30:10 +0300
Message-ID: <20261006113010.741565-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120736418.434549.3034364543286173403@kernel.org>
References: <179120736418.434549.3034364543286173403@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_043016_258418_DBC2D68A 
X-CRM114-Status: UNSURE (   7.34  )
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

> should phy_may_probe_late be documented as
> incompatible with mac_requires_rxc, or checked against it?

No. The deferred attach still passes PHY_F_RXC_ALWAYS_ON, and before
it the PHY would only have genphy, which ignores the flag.

The other points are valid and will be fixed in v6.

Aleksei

pw-bot: cr

