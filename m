Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E016D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og10cQ2AKXwLHtpmBqpI3IKqC/LwCXYrdUjyv4hhwO4=; b=ruHcbPBf9aa+ccc9f2/SWbzRvr
	Gzlowg//8CqvVf+G4KBmF11D/xmveOP/oYuIFONaO9sh9mkuqjZxlMo5CaUiFQG9iNS8+vWEguvE3
	uKgMrvXgPVrZrQqd8+flcgcU+kqG3rL0GLzSWrRPjLL7Xd46wXO4U+iaFIBbO2/CjHrMjvdjFv5+L
	QmokfnJDEm4grtT1d5+AAf9TkohQTHfdGlFUVHitxB13KMj2RoR1PWhYo/sRtZPhWqxFr5X3XyHuo
	e7kdbXUHCFlXTa4qC30BqXCjn26T3H1KRQYQDLfbmWA1Q5ciVToQf5AhkjrmdGuYLbXEjzDqio+SV
	vSjvHoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYEq-00000009lZO-2PdJ;
	Thu, 14 Nov 2024 11:42:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXDn-00000009ZGK-2Npz;
	Thu, 14 Nov 2024 10:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580626;
	bh=7z7DS9Ubxs1hLpEVtRZIePudtqICDZaRxk+SoI9jC08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f50kCmH46IKuu7T6njlBeu25xb7nVvZOhSuqs7pdQWqbyVAbg4mBC31HldF37Hx0i
	 iT71kExscNycwFwduSWzVli9UGV1w17KLLmrZHxDXGrx0xb4ORhH4mSzeDJ0ozoh8J
	 sYc7T5xG34QNwTaYHIr1Ph1f6pcANgEPJDMfvvpSTk9MI14iwwwQQ7RHUek1ivnnxw
	 AgqpViiKZPWUKgxmacI5opFIEgoytWlCh5m23VTFPLy2chSndbaYncp/S+Mrhv0nvZ
	 kKBk2wscAqKV4c0IuuR48uj00e6CIU+h4JiaMLzuljnkoYcljdt2gGPh+C7VwISQin
	 PSv6i3KBTVkaA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AEA817E35E9;
	Thu, 14 Nov 2024 11:37:05 +0100 (CET)
Message-ID: <bbbf291f-7a6f-4fab-9ff2-fe221460d18a@collabora.com>
Date: Thu, 14 Nov 2024 11:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] of: dynamic: Add of_changeset_update_prop_string
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023707_808193_E2911A59 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
> 
> This shall be used later in the DT hardware prober.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



