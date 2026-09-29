Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=; b=JYdO9ezt7D254zy7CJkv2O2/tI
	uNIGih0xqpLYcRSlwpPLyZUVEyUEhRwaxBG3K24wj7zzKNJqQ1cLP2u+04nPce6M+36TF756evdC3
	nBmowO+OYnoT4WaSY4hduJ+Np9mTbGwaFJ3zYBJDSZkXD9nCbEl/W5MCFicoP8H5kUTEaW2vcnwDw
	8Xsl64rrEY6vr2JfHoNcl/EDNOakz0TZyM5GHCMMK5db9iyklBTnDPK8iXecERWerPspxrGBIiXzd
	0uMNCddAcYEEOE5hL0XtuKFugS7Q0Um5Ackbhr6de/DZQ8YnRhnFWcqvYxN6yBl+VWIGsepHn5NMN
	a30XSv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZlF-00000003wMU-2RXw;
	Tue, 29 Sep 2026 15:28:53 +0000
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZlC-00000003wLc-2UUp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:28:51 +0000
Received: by mail-yx2-x2a.google.com with SMTP id 00721157ae682-8ab3e848918so9581997b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695729; x=1791300529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=KSVEumxGPeQJkmd58a4lO0WxPAE+GYWlc6pjH8tZx5GI8icRbPJ+LL9vM0olsK6YAT
         +gUvSUD1G7chHWkkGYTIJpO8aCAhcMUWlvisu5wP//EMm3aYRtQW97wyjTsSG7h/x49z
         GiuH0IfxqESZNJfOzvH/YdoplZgOY7sUQVkWlLSRRcPIYrfGDIhzyYmxyLlrZCldmYwd
         LWvhKC4ZCPxE5EcjCHMqvPU82MHfNGANKcYHMCVlwC+/ayGYaEGa+gnQW9WOqDUy/GJ7
         ImarDDTRA+bHmIK2xlqkIkDWxtrD2aLcgzR0x0rJbzlFr34m3O3PhrUmnxhRGuzbZ6pR
         YwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695729; x=1791300529;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwlExALEuIqma+phYwZ53l5lEw6aiZrSHMRC6Erf8OA=;
        b=fsKD0r6GH3s7TZCPhf1xVkD7L1UVV560jCPvx2c/ySaunvHDjeoxTzzBhNT0hn/P6V
         8RlZMaXU9W7Glt6tW4U4VE1DuXfRD9dkNzkf0Y6JdbxCPPw+xTBTdnAE6GgOo6DjhrLd
         4mMPex/JOiXNn7/ffgcw/lr4jA2Fy6Ki5OtfvbOt9ESyWGtnpiX7MhlmmR+paehkWAXt
         QIOrlPyELsa9NwpLPnRQ4jEAzjZUSOvgGlCX3i6oFdaQ0AlJsrKY+PlDSpqqlZoCekhF
         m0Amr8EtY5+k+PfN2UU+XKrWSHZIR7xQiHDjQZqL0ZiFkX1mQl4zGI5ghb7i9pL+bYeJ
         R+WA==
X-Forwarded-Encrypted: i=1; AKwUvByHxsvdR72MJCENEXCG6M9EZqffLgwn2xBtg56H0Dt+CyKx78dJ/8NCgM3GyJy4qcsJS7NQy1Z5iy+aVyyL6oFT@lists.infradead.org
X-Gm-Message-State: AFq9FYL/wPaRffcx6CSvkpQNl/i5Rjz187p2g/JOwD2kj5hrGjyquZE8
	HLevIC6Jo+ZzJ+xDfnyD4ux9UPiY/Dx/NXCt2BtMQ2PfffpAvK7jt9pH
X-Gm-Gg: AYBFou2Tz0spmCnXL/qGsgxzjrk9MBLX8P3H+sJX2QzB8QE0QpJLIGyQC04Fs0g1PJT
	ResxjsNgY04AieKzHL+mMVif5jCiFMlIxWqe7w5TcJu6b7h5jDsZSxFadXW1rmoP1Haj95DVyqB
	fmAzqVK2Tsak3Y0eLPNFUzenXPmd9ylD/CZ+Z1wmbXcyGKJHyfo1I2SP7cZrzLZXYJhRITGmtm5
	yXYaPtPl6/4UAUCDmocZOxkwcVCXoout9YL/hbS2ooeMCMIprVy3CuurvPJ6akdDyjuSI3OSif4
	fqgEKcsba5VRN6qm13KuW9V8oqAURQYR5lPi74xf36ZIGKzqBq18fPlFQA60NHWVo/P15/WXWvV
	kIziS2YKRxJwmD91rYsozPTYJiRlSib8T0QwfqEnI2abEmWifp2+zIg5A/7FtpQ1vbE/Z0EZScZ
	d1Tb9kzTBpP/b4cV2Q3fMhdnUygJfYdkn7ZvU0+YAknZdbxtRLAQbF5dke6JZuCYpugMsHKruuz
	wEKuefm+DuCpbvv5lnfwHTjlpEwo/o5m2tUxZU5Yjs6vLxw4XEi
X-Received: by 2002:a05:690c:e3c3:b0:868:505e:b96d with SMTP id 00721157ae682-8a64c3432b4mr71353467b3.2.1790695728518;
        Tue, 29 Sep 2026 08:28:48 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm60998327b3.24.2026.09.29.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:28:47 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:28:47 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Shiming Cheng <shiming.cheng@mediatek.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 daniel.zahka@gmail.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 nbd@nbd.name, 
 dsahern@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, 
 steffen.klassert@secunet.com, 
 lena.wang@mediatek.com, 
 shiming.cheng@mediatek.com
Message-ID: <willemdebruijn.kernel.20906a8caa141@gmail.com>
In-Reply-To: <20260929100256.23192-1-shiming.cheng@mediatek.com>
References: <20260929100256.23192-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH] net: gro: mark frag_list GRO packets as SKB_GSO_DODGY
 when a list element exceeds gso_size
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_082850_645041_E9DA8EF7 
X-CRM114-Status: GOOD (  22.53  )
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

Shiming Cheng wrote:
> When RX LRO (or similar offload) is enabled, the TCP/IPv4 GRO path may
> aggregate traffic using frag_list. The resulting skb is later segmented=

> via the frag_list segmentation path (skb_segment_list()).
> =

> However, some drivers can hand GRO/LRO-aggregated frames to the stack
> where individual frag_list elements are already larger than skb_shinfo(=
p)
> ->gso_size (i.e., an element itself contains multiple MSS worth of
> payload) and may be non-linear (nr_frags > 0). This shape is not
> naturally produced by the software GRO aggregation logic for devices
> without LRO, and can lead to unexpected behavior in the frag_list
> segmentation path.

Did you observe this with a specific driver?

We don't want to have to support every crazy driver scheme. The right
approach may be to fix the driver.

To understand the geometry: the driver passes a GSO skb with frag_list,
where frag_list members may be any size, not just gso_size? I.e., these
do not conform to SKB_GSO_FRAGLIST rules?

I don't recall immediately what the acceptable behavior for regular
GSO skbs with frag_list is. But for starters such a driver should not
advertiserr SKB_GSO_FRAGLIST.

> =

> Detect this condition during frag_list aggregation and mark the
> aggregated packet as SKB_GSO_DODGY when a list element=E2=80=99s length=
 exceeds
> gso_size. This forces a more conservative segmentation/linearization
> behavior downstream and avoids relying on assumptions that do not hold
> for LRO-produced aggregates.
> =

> No change for normal software GRO aggregation: the new check only
> triggers when skb_shinfo(p)->gso_size is set and a frag_list element
> length exceeds that size.
> =

> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
> ---
>  net/core/gro.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/net/core/gro.c b/net/core/gro.c
> index 29b4d02bf519..e70ecf19b0a7 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -259,6 +259,9 @@ int skb_gro_receive_list(struct sk_buff *p, struct =
sk_buff *skb)
>  	skb_shinfo(p)->flags |=3D skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;=

>  =

>  	NAPI_GRO_CB(skb)->same_flow =3D 1;
> +	/* frag_list element larger than gso_size (already coalesced before l=
ist-append) */
> +	if (skb_shinfo(p)->gso_size && skb->len > skb_shinfo(p)->gso_size)
> +		skb_shinfo(p)->gso_type |=3D SKB_GSO_DODGY;
>  =

>  	return 0;
>  }
> -- =

> 2.45.2
> =




