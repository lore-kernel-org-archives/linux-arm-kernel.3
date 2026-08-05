Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2B1C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=; b=PcDqSVXU2g+XAC+w8DqYErHroS
	vRPLPiEVJbkjAE8ETz8rzKGuSz21uBkir3nq9bD6zXWN4/+vKWfcVYTW5TjB7L916DXd3/u2li5Lu
	iBCmgT1R/fFv8YhByNVf0gRMTLGTIbB2SHaEgL10syshMzPcE/f/wYfD+Xuwf4C3QyeBgsJsdKy/o
	UpyfoZN4lxhwP9b8QJwMEauf3GG6EAX7S9D0bOfhwcWyS8vsjftsKnFvU0101ey/BwroX021GznXC
	dunVLZ37x62BLJBX3cQ1FieBvBv0nZc9dUTueGwz3B4wdEET3u8R5gj5RZ1+abXPXmGt4jwiB3+NE
	rffhpUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdjn-00000004CZK-3MSX;
	Wed, 05 Aug 2026 15:40:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdjl-00000004CYe-1T4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:40:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4765eec32e1so56815f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944455; x=1786549255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=sQ70kZ0pQO8tqmA/dpJMLL8z3vaEtcMiPcs7Ab6Q4QedqBZSR7SgN+fcPqUw08IDkt
         SH13SpQ6ThQQYvolVqVWgYMIhAC9aSlYBb9SDjlIuyHWwgg5xIZW/r8fhdFDfwhWUmcA
         0HYscmfs3E0Pt7iCqs/btaaaXzbwB/ByxR6iBt7jFImDm0JIwX0gveT5VJzr7svCLukQ
         s3jTGg+UqTHNcqttjrqxT+eTABW1S0ygR8cOs+9QqTEfarptsOEV/V4bDtm2DfHnqPGe
         wl/g7iIlaZFG3ySYautiP+55qH4DMK46PSq/kP3JJfwScbXLiU92TA0iAqZGFRUugpMt
         YCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944455; x=1786549255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGyZnOMySi65/bdZ5huX6xTxZFcHOTvx87ZG/dFENaQ=;
        b=UV7l7+cDGw9Ot0cF6s4gUEL9CTEH/Zr9t2dzKhdWSQcU8LePywbXAT2mRF48wjcDzX
         PjWkG4w8lsqtzCUMuvGB5iZlHOikRS8jQqEqmmzf0Y/31TCbDalwnlUiCGalKwrHhw8F
         ojahO9i0kEMkGtjmI38/LpbZM9gtWf5Zfmsmlk3NpgVu1dMjLWCHO59HxS6pXxicNpFy
         lHA3v3UFvYWzyU414TMdu4wmgOVb44eixOYtopPWLb474WBj2qPuJ7RAvGVSm8ZY6CqX
         Ec6UpT8hv9C4MF0lvTTuHPxOdc3xBhrGgT1+VrAxGt9lk+lK69q4WOs10fkIkeETsJ7V
         Bs2Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro1p/LjaPrNxRhtNFHMpcg0n9bEIc0PhFciCWvxNgxONqK3fwNkyt5MhUFhxQjmyz7QARt4GpeG3RLtFcfgxXp1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl934S78aQcCNXiyuPBLfd0YewppDfm8nr9MyQJ5RIcyHqQR0B
	Mwv8BIpOJmvtlN8TRMJaqA6r1OkHUE0wt2E5gTK9r/AOf/a0dI9V8ohS
X-Gm-Gg: AR+sD12dMKxvaMMhA3l2FmxdcSxv8J91FQW0dVWJVAPGrb2Qszm39Pcm/kZRsot0E8N
	oAQiWyZXsVsDO31suS15kC+hw9XvmYFAgYA9KOKmuL+15Mhb8hnCY4833HIDkEOSPMDqQ8qeaiC
	iz/jj8fkz/asmJnc/nq+Dp5KnNXZA1aNzsAriIBMv4E5aNGQYtnB0CnIX+UDNmBWg5rt7YdMUGa
	+bjY0A7w3H4AtFnq92RRUrUDOiAq5Wf5AYIeBHLcmkkkxQwiig5+Nvi/Hd8TKpUb6XtCyui/lad
	GVNyfhDKehK7xM3QxD5hThEAh8Fg53HfYBBGPTihPCvoUAj2Tx9NDzoNXWsZCzEZVtR0ouaAg/s
	KQsWDhtqNFVlUWZnk/5vhJtJ+kLCOlJieifTZLeARG3D3HNutWJwW/AS8a4tnrV8acLWR3hhlld
	zTNSHB5tKwnpj1At+vHDL5TfW3M0vuC7AmIxqNsHFDHd3A8tSAfIeZqby+0LtMpSrWz1/BUXw0J
	/8brYFDoLH0e0ZTx5dGrspO/ppD+5bdsxCSt3N0VdvM85IasbE9goxZubjQYD+rBWiH
X-Received: by 2002:a05:6000:1785:b0:47f:91f0:9ab with SMTP id ffacd0b85a97d-47fec484f36mr6647230f8f.0.1785944455399;
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10866434f8f.26.2026.08.05.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:40:55 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed,  5 Aug 2026 17:40:33 +0200
Message-ID: <20260805154039.10161-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_084057_390157_2D73F950 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi Dmitry, Mauro,

First, belated thanks to Dmitry, Sebastian and Krzysztof for the reviews
and testing across this series - much appreciated.

A gentle ping: all four patches carry Reviewed-by tags (2/4 also has
Dmitry's Tested-by) and no changes have been requested since 23 July. Is
there anything needed from my side for the series to be picked up into
the media tree?

Thanks,
Igor

