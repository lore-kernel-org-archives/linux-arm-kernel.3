Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39ADD25039
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=; b=FquPoGNZ+XapBElLnSSy6Mnhi7
	CFSPncGIqwF1T8E5pUWNSD2XefANR7ExINtN8RM9p3PApbptqmZQwgU62fRj7F/7mTLb24I4nj0IH
	eK/tDwfGUPkjXfIzS8jgsCjpd4C3/OiCSvJakVfhnGxMwgZA5IbbvOuwbQaXl+MopQvHT+TEbutHh
	vMIRJfkbcXDAsItTtp5TLeFsSKkVep1xf8mfGq+BjZpgbUvOA9qCMe/2KR7LdStRf9GF/YzbVLwUq
	bzX5JsRNj5AoiPWKlCzzxTe5VPJlrdgTo4iRLlmuLn+AGtAOponu3RPWKQJJQ1ecZ4sr3tWw4Q9no
	3Ac6HsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKt-00000004sSQ-06nQ;
	Mon, 12 Jan 2026 07:27:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKr-00000004sRO-1xAI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:27:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so4702844e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202851; x=1768807651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=;
        b=ILCGU4lk7Z0cBofRfUY+or+ogDz8uP2ip7//vwIZ9z14I14FJg/TZsXk81WKE0VmfD
         lYX5vbX9Bb1Dqvif3DNRKe9u2pe0MPc9w2CE2Rc/hRq6LTDGdacfNleIKXd/2pdSLnHt
         eMtVDOBu49ly3r/kooh4YPy7Mc+M/1qzSPQGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202851; x=1768807651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=;
        b=xQ8ftxYbpwi1PuclR3YpLm7V5cuLlbYV3zMJfUxZujmPJqm9IXOywCoWRi3fgYrfL6
         IqDjydcPaav85IpHEu+RlYpyhrcqhVBIPGSIQ7u4X1uAOeIlfxhA/x6upnYNoiwlz4hw
         fTDCrY4aXOUG78ugddb86WXrEK/7im7emM/fi6p7FUievARl0hekXEqgQfpC9lWcXAE6
         qD56/8O7thyEG1kbHEcGZ58v4JekHZyI16E5yvuM0GaqMu34SGvfzw3ZMqQ0adIB3pR/
         6k+FMV9x1aSpwpeyKu0ypjCVxpLLvde5HeC8LrS4SVuddZampMGZGevskPX0Xnp0Etqm
         p+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQRV+bbT8hn9dpsq6oWt+W8ms3dQfIjfgyX19NuKe70diXGTUUXpPkoWDNwsTvNXzUO5V3noM1iziD9AL2raL@lists.infradead.org
X-Gm-Message-State: AOJu0YwKhlrS0Az+r4b4bjfZrEmavzAzwH1jTUYjv20VAWQOVL7b8LEc
	zF5RBufzP7N4uIf6A/yZKJZFdjVx8hddAbX0inCrA4tref5BQBPzCulcsMhTusnYrSZNiaxoEUt
	eKpnViIuT0qpJmoQFZhumq792ZUDxXLsyAyU1gDgQ
X-Gm-Gg: AY/fxX4PLt5Odj2b+Deub8K+yo+J2ouk37YDyuqGgw3Y/0I3BdYCrQnhc0VXO9vXWYB
	keWjBFFjgyWBl5tvejbu2s6bN/NuS+oCKVGdIf0ntiNsQChmwiURqNtfjG4a9fnR3U9L3Oi82/z
	NaENSydIUdkQJaTdlC1X8ss6f0mHEpz/opIRZlvLc4pQyC+f0WeUWp5mfpGDshoqpqyKwxXwnyx
	BTMHAkOp+H7Lb0TZUplCfnGoVv6/TUe4sis4+z7fHHmll8EbLcbln9sbRvJ4GroAIU/Ud8EOGrH
	9zBmw7KIoJZhHC9LynjRfIqF
X-Google-Smtp-Source: AGHT+IFDiJ4ikKcCwIxZX4SezU35LBnUxDwbkGK9Em2aOhPxq3XtpkeM0bppBuO5WEJf5CT7uQpxTxcD+yOpL8T7LO8=
X-Received: by 2002:a05:6512:3a83:b0:598:ee60:8af1 with SMTP id
 2adb3069b0e04-59b6ef04a41mr5556612e87.15.1768202851300; Sun, 11 Jan 2026
 23:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:27:19 +0800
X-Gm-Features: AZwV_Qior6rX0_9acmsyDt7cjn3RepUbmW4kOBhOOEjHOmhFq4_xiNmMvJriwDA
Message-ID: <CAGXv+5GxHgdLc=VibTi4+q8uyk+hqBQAqxfyz3NnBtCFbj9urQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: mediatek: mt8173-elm: Fix bluetooth
 node name and reorder
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232733_510273_92F08579 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the node name for Marvell SD8897 SDIO Bluetooth from
> `btmrvl@2` to `bluetooth@2` to fix a dtbs_check warning.
>
> While at it, also change the WiFi one from `mwifiex@1" to a
> generic "wifi@1" and reorder the nodes so that wifi@1 comes
> before bluetooth@2.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

