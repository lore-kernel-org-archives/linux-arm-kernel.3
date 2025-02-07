Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9248C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2tTSDZ2XD8g2DNn6kyimdWtnPTRpKW0MbS5kEtAlX8=; b=z0C9t/1XotzlBI9nw76lOd/FyC
	S60wUK+puPWZeUiRvlBThRw20EBpd21WcGDB/lZBa8QOF1W0Ya46l8BHRtV6iEVKEmWQ/TSZLzpYY
	zSeKBVXvWsbnxa9Upcu/IvBX5xaEHamhyWwPSx1KZ1pXMpj2FZGAn0PpdYjevUWOE4n2AmMWD6dul
	F1LMhrAxzg+c8BFo/gkE7BpunVO3kTJAPCvgnOThR+Z7OuCxS7HmHahXIHIeLUdHdeYASy/IW8rQm
	QSafTzLGDky1J2Cj7+6/0b8l6d1wq5P6A2KR5hhI1ojieHqtPryBoRdz7Zo5L75yHrAhIc6MGyilw
	vTNEA26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzO-0000000B53N-27mR;
	Fri, 07 Feb 2025 20:30:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUaX-0000000B0kn-1X2u;
	Fri, 07 Feb 2025 20:04:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de4c7720bcso1505587a12.0;
        Fri, 07 Feb 2025 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958671; x=1739563471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2tTSDZ2XD8g2DNn6kyimdWtnPTRpKW0MbS5kEtAlX8=;
        b=i2YmerWBZYkK3Q5WLlaSzlERc24DvrQjDoa5OCP7tD2+cSK6mIS616n5JNOQVvu/tD
         taO+uSyA225vlNKeB4GLm4QsstFpvmJYNwJC/l9f1dvEZ3do+Tv8aCQ938sbtp0159ps
         kQEdTX+8v6IUWLS0uojpGejxKAY4q6PUe7bg3MIvxrewWIUIgyXOJaz/V5oO3HYiBtjB
         bsWDNRY45JDIX0GKDEZUmj5TeOIf0i7QE9XtvmZDdTBNsf2JrQXbsAiKZAOyFmLSO2vB
         1I4137o+YVNLKWKw5zeCv6l5ejWBwN4N1DBpAmSSAGxpFDE918jPkVLDDawbq4p2dCtg
         nJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958671; x=1739563471;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2tTSDZ2XD8g2DNn6kyimdWtnPTRpKW0MbS5kEtAlX8=;
        b=h1avQDrxb8iJcjjxg3JV3Qt+ELUARZzHkoE8kG6sLkANA5FT+SOQucHexzxBkBhrdM
         7/kPvQVgKyaqjNckMBL8Tr2GvlbeJ/7KJIwMFKfWBf6wLWqmjFDtusCiloK71+fHlSAr
         StmfDoBjrUXhEjhNZc2/G3bCNg8BZxni9ZSiidbqomh5WvJv0izlaGO+Ph61Zo2w2ts6
         pfKpmZhWv51AOXV6HXneu5zT9CJBbhogN9O/oNHCaT5qV7mwW0Tynzuc0zFPXm5xbfRu
         RMJrcK6dzAi/3we31qL1prLQRiDGLp0Pf5SUGdw8I0FkP1l14iyiRYW6slYVtna0SvOt
         qs5g==
X-Forwarded-Encrypted: i=1; AJvYcCVFRt0Qu5yXDinCtttoGYLAzsnlaPrvExxuk26ZgwqnzhSy+sqQuIVuSvfYahPMf7Qd1EHC5fykrDMio0v9fZk=@lists.infradead.org, AJvYcCWiE8oGYZ6ea4oWWlSfCQsBPbHvqTM0M6B4j41m8I0K+CqoTLFUqOIe7/gjZ+tFQ5dRYnd7hjlspoNwtmg7ceiN@lists.infradead.org
X-Gm-Message-State: AOJu0YyAizsN+XNUp4ay8OOGy2rOicyFIxPfv5Ba4/BD4hXqGfsiZnaV
	voYmVqealC9wkFzVBMR3CUH9imEequ3mcDypjqk/PsU+EhyL349E
X-Gm-Gg: ASbGnctPZlPEo4JpIPaFH6prARskoA9vBPGYPzS5a/JF60oUVg3Mv29r1p7XzghPBLv
	GNRCtnwaMnwa/3UwWySnR9EMoZFk25/FboGqZbCdZqjgTjSASyCpUM4qhlsyk9UtENGD5vZZ930
	HmVFsRXfnMNl7ABtAoZkoI/3U2WIKYn6RGMVlL+RFXz4T7cz4nzBnsGuL7Tj0mRs6pBtZ4e6YKw
	rTTwh+6DZt6apGBHl+q+ZK61K8Ddgk458qmefew5oiZohccPr837157+Wh2GDxOxpG9ELm5e+EG
	r7BP5bD5umrtitp9+xB5M+pqYnvt7kHMvCSD1ZbrzHlp8DoAu3Ka+NGfYLRc0f0k4+Aj1K6QJXe
	dCBtjh9xGXb3P5XbLB0j3xgrPDPxRLIqnBU01t+Ae4oHt3p+0WjNfgc2twH7HBnWR6A==
X-Google-Smtp-Source: AGHT+IFwhFFxWKhiLiV5wk2B71s8k88eNWyrwlatwlmZhNRtZGKXQn0gb2lgnlR7Mo2Je7BPaqOlyA==
X-Received: by 2002:a05:6402:2383:b0:5dc:7fbe:7313 with SMTP id 4fb4d7f45d1cf-5de44feb7bfmr6015830a12.6.1738958670962;
        Fri, 07 Feb 2025 12:04:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de39feff59sm2298672a12.77.2025.02.07.12.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:04:30 -0800 (PST)
Message-ID: <78a30eab-cae6-4026-b701-7d7002fe3abb@gmail.com>
Date: Fri, 7 Feb 2025 21:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-13-ericwouds@gmail.com>
 <20250207150340.sxhsva7qz7bb7qjd@skbuf>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20250207150340.sxhsva7qz7bb7qjd@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120433_407338_F225FB61 
X-CRM114-Status: GOOD (  18.85  )
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



On 2/7/25 4:03 PM, Vladimir Oltean wrote:
> On Tue, Feb 04, 2025 at 08:49:19PM +0100, Eric Woudstra wrote:
>> In network setup as below:
>>
>>              fastpath bypass
>>  .----------------------------------------.
>> /                                          \
>> |                        IP - forwarding    |
>> |                       /                \  v
>> |                      /                  wan ...
>> |                     /
>> |                     |
>> |                     |
>> |                   brlan.1
>> |                     |
>> |    +-------------------------------+
>> |    |           vlan 1              |
>> |    |                               |
>> |    |     brlan (vlan-filtering)    |
>> |    |               +---------------+
>> |    |               |  DSA-SWITCH   |
>> |    |    vlan 1     |               |
>> |    |      to       |               |
>> |    |   untagged    1     vlan 1    |
>> |    +---------------+---------------+
>> .         /                   \
>>  ----->wlan1                 lan0
>>        .                       .
>>        .                       ^
>>        ^                     vlan 1 tagged packets
>>      untagged packets
>>
>> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
>> filling in from brlan.1 towards wlan1. But it should be set to
>> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
>> is not correct. The dsa switchdev adds it as a foreign port.
>>
>> The same problem for all foreignly added dsa vlans on the bridge.
>>
>> First add the vlan, trying only native devices.
>> If this fails, we know this may be a vlan from a foreign device.
>>
>> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
>> is set only when there if no foreign device involved.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>> ---
> 
> Shouldn't mlxsw_sp_switchdev_vxlan_vlans_add() also respect the
> SWITCHDEV_F_NO_FOREIGN flag? My (maybe incorrect) understanding of
> bridging topologies with vxlan and mlxsw is that they are neighbor
> bridge ports, and mlxsw doesn't (seem to) call
> switchdev_bridge_port_offload() for the vxlan bridge port. This
> technically makes vxlan a foreign bridge port to mlxsw, so it should
> skip reacting on VLAN switchdev objects when that flag is set, just
> for uniform behavior across the board.
> 
> (your patch repeats the notifier without the SWITCHDEV_F_NO_FOREIGN
> flag anyway, so it only matters for flowtable offload).

Or should mlxsw_sp_switchdev_blocking_event() use
switchdev_handle_port_obj_add_foreign() to add the vxlan
foreign port?

Then all foreign ports are added in a uniform manner and
SWITCHDEV_F_NO_FOREIGN is respected.

I do not have the hardware to test any changes in that code.

