Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE9CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=; b=XHSSnuHyymnrGDld7TFST84k5V
	PKqNLuPsNjYWF+zONxkZAOJ6sJ2YkjmHRDjTDe/04zI0xUksRBPug2CBtxlVBoiJdx9R4DZzAUWlt
	YhDtr/e/xT1c9/YPrexwao2vq1cE1AnnBz0OnfTVCv7AvyW4AKne47DRBkAxKk6gkccIwNsfxuwSR
	pYHY9jJHS64QJ4A00PRInAFwuiT3TetRDnSwORr5ReoCWuoIHak+8vFGCPHDAyjl146/QMnsLFHBo
	vZCn7ypP54c1eWs/Zl+P0X+jPG9qtGdFT76j3eLzWMjXt0lG+vigeC/4rHHnLQOmP+G4KHaU86DSi
	XmGPGVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXST-0000000CHUw-3kw1;
	Tue, 13 Oct 2026 08:02:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXSR-0000000CHTV-3s6Q
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 08:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=; b=SGXku2M8DdkfB+U0LnEOBcXm5K
	w4FM7R9KzuROHi+ICXdxTycNmNqlsaC8u1ZdadbRO+P3e+laL+Sv8zXdEVt9GwqyeybwCt2Ik5Pyc
	Nurmi0C8yy/X7ips8oHra/h5siWnZanfq10r+BqiiMxsjlxspmYgrFyt/F6XbtaAtS6E2culg0zZV
	Pp9DBkLISDgsSBNwH2J+ObNB4AlIzdYq0nEzof82Be9a6cZOmv6LVIiRHoRZytpJAKdJ7acvtELOY
	OfyxcmAlEerfoozKm+DxGdf3QESIXmFUBCnBdv2PRsOfYdeVrBqlPBvdWu4kNfCWN2xuOLROjE1ur
	83yXPT1A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGXSO-0000000FEg3-11Zr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
	b=EO3d3dgHssZdEF9EWkZ3I9EgQCR/R6yIN1JaqO70pxBD7HOUPRntQqZpcEc+R6aoFUMSDI
	nzEAHo1JFpfggO7PUYDZzUqgqZ7GEoV2rc/4zQpdfzK61rX9vE6sAK1fRTrMt9QqxXNwp9
	Gi/tHl5STvE0KRgVpwSwPzSqv5L5Ftc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
	b=Vndo1C6f6GC5mkQB0CQAs6Ol0zYte2SI35SUoSUFZmvOSyiQdxK93YtoLA23VLPRjYhWu7
	v9FkW8CTI7If/+V28+Mzfms5T5S2etoRNoZ41cYN7zR0kTvD2oKGSiiWUohyj7mqzcjLuA
	i7qVbma6Pj946LLlv1fyDzVkANBUx3Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
	b=EO3d3dgHssZdEF9EWkZ3I9EgQCR/R6yIN1JaqO70pxBD7HOUPRntQqZpcEc+R6aoFUMSDI
	nzEAHo1JFpfggO7PUYDZzUqgqZ7GEoV2rc/4zQpdfzK61rX9vE6sAK1fRTrMt9QqxXNwp9
	Gi/tHl5STvE0KRgVpwSwPzSqv5L5Ftc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687--p4L6Z4nP5G02TVGIXDkmA-1; Tue, 13 Oct 2026 08:01:53 +0000
X-MC-Unique: -p4L6Z4nP5G02TVGIXDkmA-1
X-Mimecast-MFC-AGG-ID: -p4L6Z4nP5G02TVGIXDkmA_1791878512
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so3019688a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 01:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878512; x=1792483312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
        b=ldRTuSU93HxYBWYjOpguhqcgGC6uLvCSjCg28DfMetA4OJK0WXbokRHpfzQgoOJjLu
         4eDJTvz6P/X9sFq/XrtGrfnbDWirdpwPQ38Vv2vMkBG0vkW688BB+dpzG4Dtpuf5wlT2
         jmMR+aqzLaKQHXFa7By10tWASWW/VEm3jJLVjNU4Fy3QuTwBJSgbONNt3A1yfdPBNIv1
         NWqLqAB8vmgrm9Lgzuv00Enf+UcYQMOekLGWOEvXI1cLnrcg0cHEI2nmN/HCi5oqNsc7
         zE5cxAtgAWmkX7YvMj49Qjvx5fNtt4ZQ5kfbedXKFpbKlLbL5QdPx3WI5n83tJfCW/Gg
         J91w==
X-Forwarded-Encrypted: i=1; AKwUvBxkkcBaQGkDp64fDKxqPBnFxAr/Hv2/vhk3O6eh/ykSEquydy4rDIF06928GdZv6z2W0rZo8lL9bVEG3zPc6syo@lists.infradead.org
X-Gm-Message-State: AFq9FYJNRWuxf5uzaaQC1fECmCaOn0VTIiIZiVo1mwUmli4umcviSDZ9
	M7h0pFBiGuojbOo7gcpTJQ9ZgRMgXkGCgjCB3+HIYqVyR07S/3Fb10JnykpEV7zjaoQpgIS9vLO
	Q4rZmYyPRUL36Yvhis+vI11jwQ9MaJNNdDgZsEQkK3bSq+zF6+R/2ZyDUJIXG89KUOf2nys4Bj0
	4K
X-Gm-Gg: AYBFou3z3zgbVjvd99Sycx+7qB6QKmLjwMo5LD4+0iWsjkWNJ+AbRUun5vUeeCETus2
	zlGKwcgTXzU9lkmzn5mEOEou4maX7fCcFQwaZMjWJmRKqpskQ5pd8yCjUSlWzC7b9H/vshaHuGI
	ZD/8pIOEowTMXa5Ro5MoWS1/oW/bIIhTYUUuIUIgBlPXs54pchZm5gwQ5Gq0tx36xnpZTmenXY5
	5/PCMYkMWb7epGAEpPdIp3E11UlvogFfZc8o11jhvqMJjeDcfi2V0dQFS6JmAoxfmQtX3xAv4bt
	aMO4AmQswn/us4LHwFqVbQnorQpU7DfntiMMVOQxV3Rd1lgrJUwMPZ9QsAPPg7CvG1RrcqbXt/G
	vOCoIS4uXzgOdvKWeKxz+I+PpVRAS7GjHkLsV8GGV7p9ruZd6AWcjB/SReyc4UhrFTf+yBP9vDw
	==
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522586a12.3.1791878510927;
        Tue, 13 Oct 2026 01:01:50 -0700 (PDT)
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522525a12.3.1791878510286;
        Tue, 13 Oct 2026 01:01:50 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm3308846f8f.21.2026.10.13.01.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:01:49 -0700 (PDT)
Message-ID: <91736242-7836-4eef-9415-738e48a63a52@redhat.com>
Date: Tue, 13 Oct 2026 10:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/3] net: phylink: wait for PHYs that are
 known to probe late
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
 <20261006124731.1528963-3-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-3-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8gV0Bp4obmPmDElrgs6-PaJGFfY_CJqqf08u3tzogJE_1791878512
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_090156_822306_FFE7AA01 
X-CRM114-Status: GOOD (  55.50  )
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

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> A PHY that needs firmware from the host and whose driver has not bound
> when the MAC sets up its port is either taken by the generic driver,
> which cannot drive it, or not found at all; a MAC that connects once at
> setup, as DSA does, gets no working PHY on that port for the rest of the
> uptime. The case this reaches is a driver built as a module on a
> filesystem that is mounted after the MAC probes. Let the PHY declare it
> with needs-host-firmware and, for a MAC that opts in with
> phy_may_probe_late, poll until the driver binds instead of failing. A
> driver that has bound is not covered, whatever it does about firmware
> afterwards. Neither is one whose probe has already failed: the driver
> core does not retry it, and the poller cannot tell that apart from a
> driver that has yet to load, so it keeps polling.
> 
> Deferring the MAC's own probe is not an option: it keeps every port of
> that MAC down until the module loads, and forever if it never does, and
> those ports can include the one needed to mount the filesystem that
> holds the module. Return 0 rather than -ENODEV, because DSA reads
> -ENODEV as permission to look for the PHY on the switch's internal MDIO
> bus, which is the wrong device.
> 
> The deferral is opt-in because it returns 0 with no PHY attached, and
> some callers read 0 as a PHY being there: ucc_geth dereferences
> dev->phydev later in the same open, and enetc, stmmac, mvneta, sparx5
> and lan743x do one-time PHY setup at that point that a late attach
> would skip.
> 
> The deferral also needs an interface mode known up front, as without one
> the MAC would be configured for PHY_INTERFACE_MODE_NA when started
> before the PHY supplies its own. It is limited to PHY mode without an
> SFP cage: in-band, the PCS can bring the link up with no PHY to gate it,
> and an SFP PHY can take the port while the wait is armed and drop the
> wait on removal. The poll runs only while phylink is started, so nothing
> touches the PHY of a stopped port, as at switch shutdown; a port that is
> down attaches at its next start.
> 
> Wait for a driver that has bound, not for a device that exists, because
> the generic driver would otherwise bind and cannot drive such a PHY. If
> the real driver goes away between that test and the attach, the generic
> one binds instead or the attach fails; when the driver is gone after the
> attach, the poll keeps waiting without counting a failed connect. The
> attach-versus-unbind window itself is phylib's to close and is not
> closed here.
> 
> A connect that fails with the real driver bound is retried a few times
> and then given up on with one line, because silence from a poller reads
> like success. Each retry re-runs the PHY's init and, on boards whose DT
> gives it a reset line, pulses that reset, at a cost that depends on the
> board and the PHY, so the retries are bounded. Stopping after the first
> failure would leave a DSA port, which connects once, dead until the
> switch driver is rebound.
> 
> Until a PHY attaches, report no link modes and refuse the ethtool
> settings that would configure the MAC alone for a link that cannot come
> up.
> 
> Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch): the EN8811H
> behind lan4 has its driver on the root filesystem, the switch sets its
> ports up before that is mounted, and lan4 was lost for the uptime. With
> this change and the DSA opt-in that follows, lan4 attaches once the
> module has loaded and the port is up. The retry path was driven there by
> a local debug parameter that fails the connect after a successful
> attach: two injected failures were retried a second apart and the third
> attempt attached, and with failures that never stop, four attempts ended
> in one "giving up" line and no further polls.
> 
> Assisted-by: LLM
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> Changes in v6:
>   - defer only in MLO_AN_PHY and without an SFP bus
>   - poll only while started: phylink_start() queues the poll,
>     phylink_stop() cancels it, the poller's STOPPED test is gone
>   - a failed attach with no usable driver is a lost race, not a retry
>   - commit message: ndo_open argument dropped, board sentence updated
> 
>   drivers/net/phy/phylink.c | 232 ++++++++++++++++++++++++++++++++++++--
>   include/linux/phylink.h   |   5 +
>   2 files changed, 229 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a7d086cdc9b2..ec76138f1065 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -98,6 +98,16 @@ struct phylink {
>   
>   	u32 wolopts_mac;
>   	u8 wol_sopass[SOPASS_MAX];
> +
> +	/* The poller writes these while it runs; arming cancels it first. */
> +	struct fwnode_handle *late_phy_fwnode;
> +	u32 late_phy_flags;
> +	struct delayed_work late_phy_poll;
> +	unsigned int late_phy_poll_ms;
> +	unsigned int late_phy_waited_ms;
> +	u8 late_phy_retries;
> +	bool late_phy_warned;
> +	bool late_phy_gave_up;
>   };
>   
>   #define phylink_printk(level, pl, fmt, ...) \
> @@ -1831,6 +1841,18 @@ int phylink_set_fixed_link(struct phylink *pl,
>   }
>   EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
>   
> +static void phylink_late_phy_poll(struct work_struct *work);
> +
> +/* Synchronous: the poller reads the node put here. It only trylocks
> + * rtnl, so a caller holding rtnl cannot deadlock on it.
> + */
> +static void phylink_late_phy_cancel(struct phylink *pl)
> +{
> +	cancel_delayed_work_sync(&pl->late_phy_poll);
> +	fwnode_handle_put(pl->late_phy_fwnode);
> +	pl->late_phy_fwnode = NULL;
> +}
> +
>   /**
>    * phylink_update_pause_state() - Update the phylink pause frame configuration
>    * @pl: a pointer to a &struct phylink instance
> @@ -1989,6 +2011,7 @@ struct phylink *phylink_create(struct phylink_config *config,
>   	mutex_init(&pl->phydev_mutex);
>   	mutex_init(&pl->state_mutex);
>   	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_DELAYED_WORK(&pl->late_phy_poll, phylink_late_phy_poll);
>   
>   	pl->config = config;
>   	if (config->type == PHYLINK_NETDEV) {
> @@ -2068,6 +2091,8 @@ EXPORT_SYMBOL_GPL(phylink_create);
>    */
>   void phylink_destroy(struct phylink *pl)
>   {
> +	phylink_late_phy_cancel(pl);
> +
>   	sfp_bus_del_upstream(pl->sfp_bus);
>   	if (pl->link_gpio)
>   		gpiod_put(pl->link_gpio);
> @@ -2337,10 +2362,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>   }
>   
>   static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
> -			      phy_interface_t interface)
> +			      phy_interface_t interface, u32 flags)
>   {
> -	u32 flags = 0;
> -
>   	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
>   		return -EINVAL;
>   
> @@ -2378,7 +2401,7 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   		pl->link_config.interface = pl->link_interface;
>   	}
>   
> -	ret = phylink_attach_phy(pl, phy, pl->link_interface);
> +	ret = phylink_attach_phy(pl, phy, pl->link_interface, 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -2390,6 +2413,134 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   }
>   EXPORT_SYMBOL_GPL(phylink_connect_phy);
>   
> +#define PHYLINK_LATE_PHY_POLL_MS	1000
> +#define PHYLINK_LATE_PHY_WARN_MS	60000
> +#define PHYLINK_LATE_PHY_POLL_MAX_MS	30000
> +#define PHYLINK_LATE_PHY_RETRIES	3
> +
> +static bool phylink_late_phy_pending(struct phylink *pl)
> +{
> +	return pl->late_phy_fwnode && !pl->phydev;
> +}
> +
> +/* Stale the moment it returns: the device lock this wants cannot be held
> + * across the attach, whose own failure path takes it again.
> + */
> +static bool phylink_phy_is_usable(struct phy_device *phy_dev)
> +{
> +	return phy_dev && device_is_bound(&phy_dev->mdio.dev) && phy_dev->drv;
> +}
> +
> +static void phylink_late_phy_backoff(struct phylink *pl)
> +{
> +	pl->late_phy_poll_ms = min_t(unsigned int, pl->late_phy_poll_ms * 2,
> +				     PHYLINK_LATE_PHY_POLL_MAX_MS);
> +}
> +
> +static void phylink_late_phy_poll(struct work_struct *work)
> +{
> +	struct phylink *pl = container_of(to_delayed_work(work), struct phylink,
> +					  late_phy_poll);
> +	struct phy_device *phy_dev;
> +	bool again = false, lost_race = false;
> +	int ret;
> +
> +	if (!rtnl_trylock()) {
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		goto requeue;
> +	}
> +
> +	/* A PHY arrived by another path while queued. */
> +	if (!phylink_late_phy_pending(pl)) {
> +		rtnl_unlock();
> +		return;
> +	}
> +
> +	/* Stable here: whoever clears it waits for this work first. */
> +	phy_dev = fwnode_phy_find_device(pl->late_phy_fwnode);
> +	if (!phylink_phy_is_usable(phy_dev)) {
> +		if (phy_dev)
> +			phy_device_free(phy_dev);
> +
> +		if (!pl->late_phy_warned &&
> +		    pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS) {
> +			pl->late_phy_warned = true;
> +			phylink_warn(pl,
> +				     "still waiting for %pfw (needs-host-firmware)\n",
> +				     pl->late_phy_fwnode);
> +		}
> +		/* Past the warn it may never come: stop paying 1 Hz for it. */
> +		if (pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS)
> +			phylink_late_phy_backoff(pl);
> +		/* The first run is immediate, so count the sleep ahead. */
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		rtnl_unlock();
> +		goto requeue;
> +	}
> +
> +	ret = phylink_attach_phy(pl, phy_dev, pl->link_interface,
> +				 pl->late_phy_flags);
> +	if (!ret && phy_driver_is_genphy(phy_dev)) {
> +		/* Lost the race: the attach bound the generic driver, which
> +		 * is the outcome this poller exists to avoid.
> +		 */
> +		phy_detach(phy_dev);
> +		lost_race = true;
> +		ret = -EAGAIN;
> +	} else if (ret && !phylink_phy_is_usable(phy_dev)) {
> +		/* The driver went away under the attach: wait for it again. */
> +		lost_race = true;
> +	}
> +	if (!ret) {
> +		ret = phylink_bringup_phy(pl, phy_dev,
> +					  pl->link_config.interface);
> +		if (ret) {
> +			phy_detach(phy_dev);
> +		} else {
> +			/* Only a major config programs the masks bringup
> +			 * narrowed.
> +			 */
> +			mutex_lock(&pl->state_mutex);
> +			pl->force_major_config = true;
> +			mutex_unlock(&pl->state_mutex);
> +			/* MAC before the PHY, the order a start uses. */
> +			phylink_run_resolve(pl);
> +			flush_work(&pl->resolve);
> +			phy_start(phy_dev);
> +		}
> +	}
> +	if (lost_race) {
> +		/* Not a failed connect: the next poll waits for the real
> +		 * driver.
> +		 */
> +		again = true;
> +	} else if (ret) {

The above `if` chains feels unneedly complex. I think you can simplify
it consolidating the out/error paths using more labels.

/P


