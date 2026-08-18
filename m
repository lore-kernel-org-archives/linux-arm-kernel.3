Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E8C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=; b=nqKrelNbn2NTVO5htpOrNlDZf4
	hK3T9bwFHbN5vEKBdBrkWhHHafmGDwBVZ2ODhc954Y4Qsa7NkWtQUoNyfVoGhgaj8WbkS8XXa9WhS
	vbj0M6/joECPiKRBx9hLzhYIYAJKraWnzwStP+tAlSntvLRgzYIelIrG2TlD/SMjBXNARj8jbb5Oi
	BwVnXaAvNWyEjdKcPYByfXjpOmyatfdNhzrtjrhKHbDe45Vm8Fy7cyHO9+qOPlgIjV30aweAblSz6
	862f25/WrtxjkisrXnO5/0kftaoKk4eVQ+tBkN0VBHXORiEl9rjFndPPXW5eLvANCPbFcdbnQcxnS
	9w38islQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIGm-00000007sEV-3yb9;
	Tue, 18 Aug 2026 11:46:16 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIGk-00000007sE8-2hpf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 11:46:16 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8201447e8cdso78951167b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 04:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787053573; cv=none;
        d=google.com; s=arc-20260327;
        b=sRz/fCrbdZNrIOXzxPieEzb3Nw2CeaduhtO1IEZ2bsKTC6pNAhfyASYv3rcmN7zxoA
         k/MvMhneiqj3zud6GlEq6N0CsF8T7G6i42mYgu/+l3W7EBrmoxhf4aTtKxhmYALnt0qo
         AgGxLRtUMHjKxeLBoLYZdUSvIy2bRXIP6akMtg4oODgvadEw/sHLMYvyaspzWsrTzzq6
         SYFB4LLIdHe9mX7gbnM5DqX5PPOeZRyRafFem5V2poNRYwll7gIq0JCZCoZYpe1Jk09S
         fYIzZmrevbMJS3NPrMNAfR+m/HCrvNdWgZ5bmu6ImBpaG/unOl5bbwBWNNeB/CKQ1Y7k
         ESmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        fh=NZbeR5Xbg2tK5HY1BRT0HbV1LLz9rJX5wWYCKOsw9e0=;
        b=h3ZWQhapg6WoFvp12XpjAoyvIs09UO0HMCtg35LQGXtpnNu0LECntWqi2gAAwnOWKv
         jg1pnNXXxa2jURx0oLjUioSVDjFmZ4HdfIkWj2cTASrh48YfjVBreAlTAsAdj8KnlpFx
         8KyIgMwF9G8UA6fA0fqyGInki6x109jaz2r9cgC2JaJSq9TPUr++GQi3s15CheqF0Qyz
         bmKCjmsPIn39WEcg3o5PnDW8NQVt+ifnH/l2+5tiriLB2ZlqvG5I5JK+KFDAds3vxUBe
         mHmfLNY3gt7l8yb9MBJ7fZ4lOLmlu9mjqlkRqHkYUc3BSLTYIDhJpFufgVb5gGxrHVSi
         Bngg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053573; x=1787658373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        b=KOhaaTse4CWbpVwj1jX/WM8h/x19Z86KkUMzxVNZol+Jcw1t5hPugaDFaTaDWv/L4X
         5t8rtA65EExy8K3l83h3Wt7SGps2rmlfgc5uaKTdoHQxH8/Bs5M/6WDw7r2Y7EzEHlzB
         d6e1MOxfWZE3PmfYAIFTGXjwVQjCtW7by+hzoLkFKhU5Teia3NRI8/QiDyO7QCYdwGBa
         7v/E5iiznfkIE3WkSeCDC/XhpRqaWk3Yq7es7Gh5NT7REv5qdIzkDnLDqGJVhOXU+oD4
         7gOKRhE+KV+HapT+HL4qlSErrkbDO6XM5kpBERr6vqZwGpAMf6WlprEY2DQhmrBujoV5
         XK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053573; x=1787658373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpxp/zN/k3pa4zTW7PgrgIqgWRxXynXakWrls+B4H2A=;
        b=oBLsZiKek6YNfloCOUVp7Rjsd7zAQVfqCipa/LbiGKZthAkP0JzXTLzeQ0WdmdRrkA
         9iDUmeTXaUclGCMNX5ZxQeh6qAPfgqq8oNns6Tfrpz9VTngJ3n+h5yjQpDpJBF001FqP
         kIyG09CXU+o/uf7bapz1VPJyt5cr80LFd2OBpqSjcDHtP7GF1Kd1YTBGGBCNDDBiMT30
         m2TYAY9B/+8Kftd/gi4EJVt1ADhWthVveu0rA6kSKVYUkjtR/F2p9/Za9xoqk6/fj8Dy
         BwM6eg+/q2WGgUZK73Hrfbuq3V0gY2OgBZxQcI2gRGNcgIMEIPITE7PqMkXVDwTBO+RY
         05+g==
X-Forwarded-Encrypted: i=1; AHgh+RrXUNqzY7OLP5UAWbAiGy933E391xlR2qg0qYsq6kS2uURMjvsIU5y8mZ3zul0mLO57D2eL32oHFsyAUygzY2WL@lists.infradead.org
X-Gm-Message-State: AOJu0YyQT/AOTuU6xm7cYgu8vNkgZlbgpjkqs/yXH6ysOaIa2ggsGXdz
	dfxfnByYywljH2pyDddJBmQuhwD7y3LqkKrxynyuYh/Qx65/1WU7uCl32tCvci+iyrwtmzpEgoG
	LUbw4bijk2ze1Ux8gFymUoR/XUbpkPo0=
X-Gm-Gg: AR+sD130RbLqzItn/4ykYwP7G3tzeMeFfnuN8oMl7nBprmEB6eBzRYxSujaMZ7MUgk+
	uwrgNr9SJQLDSWGMs9xoX/S/DSUKiTK8j0Yp2sR6a7UzgRaqw5nab5esPYJMOTu8EgAsdnWsgzU
	/slqWscqhcOnoqe3566YQp9H59kzjE7cpOSyj08NC9HKjqWF/VJSlm5p1b9HswE/c5D8hT8LqG7
	1XSp+Z/ze/mW8GqlWJJimbb4+u9RwXtLFTY48GAWBjMxgaTZn/mqHmOm9bNzvWq0C+Z5Q7vFFZI
	vXQHpDpBOoXjKu60i4jjjQIZArL5Z5mnWTBuR/F8d9+NW0+zyvFdG5UE7jDCo2818cGrioWKHJG
	2XbRbVVDLDlzhmsp/CNW2EHQYMVs62OV+3m0kiaJhjkRGeqDok6/gaFPzpwrPvRKdU9ciUkZ/14
	dkfxwDn6nH
X-Received: by 2002:a05:690c:9991:b0:81f:d505:8ea4 with SMTP id
 00721157ae682-83712da9d13mr124393587b3.18.1787053572846; Tue, 18 Aug 2026
 04:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com>
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 18 Aug 2026 13:46:01 +0200
X-Gm-Features: AcwNN1VKHMPAdBOZimFFX4MmmZLiUZP40Jjbh2uMpcUo_B2LLCgJ0plyHTDZ4p8
Message-ID: <CAOiHx=ne6o8j2jLWB_R57z_9KFwF=ZMw-2JVWDn6QNYs3CTyag@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	netdev@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Semih Baskan <strst.gs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_044614_701592_7DB7B059 
X-CRM114-Status: GOOD (  24.17  )
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

Hi,

On Wed, Aug 12, 2026 at 3:28=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
> their limitations. Warn user when CPU port 8 isn't used and add EAP
> setup workaround to avoid non-functional standalone ports.
>
> Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to fo=
rward to other ports")
> Cc: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> ---
> This fixes a regression so it's a net.git material
>
> V2: Print warning on switch setup instead of on actual EAP mode change
> V3: Proper subject prefix & shorter comments (long one comes with 2/2)
>
>  drivers/net/dsa/b53/b53_common.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 3f5b9592794d..5fd8362d0430 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -332,6 +332,14 @@ static void b53_set_eap_mode(struct b53_device *dev,=
 int port, int mode)
>  {
>         u64 eap_conf;
>
> +       /*
> +        * On Northstar setting EAP_MODE_SIMPLIFIED with CPU port 5/7 bre=
aks

This isn't just northstar, this is any dual IMP capable switch

> +        * standalone ports, see:
> +        * https://lore.kernel.org/netdev/ce4d9b7b-aaf6-4796-94fb-8c3d6a1=
dcd4d@gmail.com/
> +        */
> +       if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
> +               return;

This should be moved below the 5325/5365 check and just
!dsa_is_cpu_port(dev->ds, B53_CPU_PORT))

> +
>         if (is5325(dev) || is5365(dev) || dev->chip_id =3D=3D BCM5389_DEV=
ICE_ID)
>                 return;
>
> @@ -1281,6 +1289,10 @@ static int b53_setup(struct dsa_switch *ds)
>         u16 pvid;
>         int ret;
>
> +       /* Discourage users from using port 5 or 7 due to limited feature=
s */
> +       if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))

This should be

if (!is5325(dev) && !is5365(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT)=
)

dual IMP mode is also supported by external switches (e.g. bcm53115
and bcm53125), and if for some reason someone would try to use port 5
only on these you will have the same issues.

> +               dev_warn(dev->dev, "switch to CPU port 8 to use all switc=
h features\n");

I think this warning is too mild; it should be something like

"Using port 5 or 7 as CPU port is not a valid configuration and will
prevent the switch from working properly..\n"

Best regards,
Jonas

