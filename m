Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A18DCF6BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMHhwOjApnNmIM/IGLBoV1hrqPEAl7/n8Dd5Zu2tbRI=; b=YCZiipcQtsciIYyw5u1VisFg9i
	969mc+ExiFwR3zThLUPmqGxDXgQq9XR7zpWHy2z0PQujDAWyZdnRSCy0wbNyX3xj7zIrh1CZ9gLyR
	0N8tMnFtV0+PQkgfNDx9gHJ+AfXLkQtjX7Umon8kIe5XjGWFxUmiyRiJsIv48Pa/tWLtuelJC24FQ
	7t80Fz5QMZ3uh6uKTn/GRco0BCnVgbPNuPP/uXaLQ92K1s03fJXVx/wQo62hJuCR8SkB9K6slN1rr
	xH0+tauKc42g6DV/MXkI9FhTwFXzhSWYOkGRBSaJ7qghtshO/eGxaYvfm1zmQufECPcY5rRnhMaD7
	kJIEdl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOfA-0000000EMvn-0f2e;
	Wed, 07 Jan 2026 08:13:04 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOf7-0000000EMvC-2jCG;
	Wed, 07 Jan 2026 08:13:03 +0000
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=ankoLIDO;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 6078CTcF325307
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 08:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1767773549; bh=GMHhwOjApnNmIM/IGLBoV1hrqPEAl7/n8Dd5Zu2tbRI=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=ankoLIDOlBbWRMEwsPRzbCSIiwL+79ngKEnXu1Sw/jG25R6BG0iCcr78w5FCqaLGe
	 qL/S5kvI5XRfoQJA0iBOuWGsaC+rhmo2TMFDiqI9zl8XQfc9y9CM/Fniri9jDTFzTJ
	 IVvvoNkkDHUzvcXmdsNBSxYtQTJfH5vU5ssD3dH4=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 6078CTBl1975768
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 09:12:29 +0100
Received: (nullmailer pid 651874 invoked by uid 1000);
	Wed, 07 Jan 2026 08:12:28 -0000
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
In-Reply-To: <20260103210403.438687-6-vladimir.oltean@nxp.com> (Vladimir
	Oltean's message of "Sat, 3 Jan 2026 23:03:58 +0200")
Organization: m
References: <20260103210403.438687-1-vladimir.oltean@nxp.com>
	<20260103210403.438687-6-vladimir.oltean@nxp.com>
Date: Wed, 07 Jan 2026 09:12:28 +0100
Message-ID: <87jyxtaljn.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_001302_021549_AB69A425 
X-CRM114-Status: GOOD (  14.35  )
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

> +static int fwnode_get_u32_prop_for_name(struct fwnode_handle *fwnode,
> +					const char *name,
> +					const char *props_title,
> +					const char *names_title,
> +					unsigned int default_val,
> +					unsigned int *val)
> +{
> +	int err, n_props, n_names, idx =3D -1;
> +	u32 *props;
> +
> +	if (!name) {
> +		pr_err("Lookup key inside \"%s\" is mandatory\n", names_title);
> +		return -EINVAL;
> +	}
> +
> +	if (!fwnode) {
> +		*val =3D default_val;
> +		return 0;
> +	}
> +
> +	err =3D fwnode_property_count_u32(fwnode, props_title);
> +	if (err < 0)
> +		return err;
> +	if (err =3D=3D 0) {
> +		*val =3D default_val;
> +		return 0;
> +	}
> +	n_props =3D err;

I tried using this in the air_en8811h driver and started wondering if I
have misunderstood something.

The problem I have is that fwnode_property_count_u32() returns -EINVAL
if props_title is missing.  So if you have a node with the legacy
"airoha,pnswap-rx" property instead of "rx-polarity", or more common: no
polariy property at all, then we see -EINVAL returned from
phy_get_rx_polarity().  Which is propagated back to config_init() and
the phy fails to attach.  That can't be the intention?

The behaviour I expected is described by this test:


/* Test: tx-polarity property is missing */
static void phy_test_tx_polarity_is_missing(struct kunit *test)
{
	static const struct property_entry entries[] =3D {
		{}
	};
	struct fwnode_handle *node;
	unsigned int val;
	int ret;

	node =3D fwnode_create_software_node(entries, NULL);
	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);

	ret =3D phy_get_manual_tx_polarity(node, "sgmi", &val);
	KUNIT_EXPECT_EQ(test, ret, 0);
	KUNIT_EXPECT_EQ(test, val, PHY_POL_NORMAL);

	fwnode_remove_software_node(node);
}



Bj=C3=B8rn

