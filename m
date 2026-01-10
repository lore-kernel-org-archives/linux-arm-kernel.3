Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566DED1A63D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFPW0Msly5Teyp9k0y7qo0QpVArg3QHX3RWO1QKXN5s=; b=T0Y28sJzG8rGB/GiTkPaMa+F96
	EWmkYms3pG9mFG27OmfaQiLunMni4XkC6blLKVdeD3v62iTvAt+49NRXwFf7b46M7kwaCtTs/R/f+
	uBeyLUx88mInNZqI+6UhWxgYfMweSNJfh662Xic+UXK6qrrSmCEoO5MBee24uCHAeL8i0LOCZmPTr
	1aEkxLZrSrxOF7vyTovA9TsIi4X70BMppyWo7yGRVH/WcqnF9Rq9CRjygzyqEXMDPO/SCX2bU7T6q
	6ZdDt3FCSypGbGfzXvh71Ng2xBBrafTJzoIm6qp2J9do56Zeq0CBQ3VpCypotspRGsg5WEPLjMoRl
	TGaE6bKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vedOn-00000003aiP-2Mrm;
	Sat, 10 Jan 2026 18:09:17 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vedOj-00000003ahq-0pPj;
	Sat, 10 Jan 2026 18:09:15 +0000
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=IoWcLW2a;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 60AI8U1I007153
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 18:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1768068510; bh=EFPW0Msly5Teyp9k0y7qo0QpVArg3QHX3RWO1QKXN5s=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=IoWcLW2albxW2UQHMl8qeYHGt3GvqCpnIOECqMXpZr22MDii53p+5+phCdnsF1tUn
	 ddlqu9sVIBVPc+XrVIJXnIwTCfGlWcTJSs6DYDvAQeDmHNoIrFYBzTdH+yx3tOtagO
	 lpUTYcnfagBK2rT7j/aIGlhpLPPkhvsQDRyo5GpA=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 60AI8UOx320195
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 19:08:30 +0100
Received: (nullmailer pid 22846 invoked by uid 1000);
	Sat, 10 Jan 2026 18:08:30 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Daniel Golle <daniel@makrotopia.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Eric Woudstra <ericwouds@gmail.com>,
        Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH v2 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
In-Reply-To: <20260110180433.bfg2hxbdjkfllkiq@skbuf> (Vladimir Oltean's
	message of "Sat, 10 Jan 2026 20:04:33 +0200")
Organization: m
References: <20260103210403.438687-1-vladimir.oltean@nxp.com>
	<20260103210403.438687-6-vladimir.oltean@nxp.com>
	<20260103210403.438687-1-vladimir.oltean@nxp.com>
	<20260103210403.438687-6-vladimir.oltean@nxp.com>
	<87jyxtaljn.fsf@miraculix.mork.no> <87jyxtaljn.fsf@miraculix.mork.no>
	<20260110180433.bfg2hxbdjkfllkiq@skbuf>
Date: Sat, 10 Jan 2026 19:08:30 +0100
Message-ID: <87zf6l49y9.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_100913_906474_F0569648 
X-CRM114-Status: UNSURE (   7.13  )
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

Vladimir Oltean <vladimir.oltean@nxp.com> writes:

> I've integrated your test and added one more for RX. Do you have any
> further comments, or shall I send an updated v3?

That was everything I've found.


Bj=C3=B8rn

