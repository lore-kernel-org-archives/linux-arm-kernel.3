Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4964DC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=; b=HOJoXZHboKqHGuuZSiVp9j4vr7
	qaAB9/A3gK7Hr4IExyPpjH8Kof4dtkmxnQZZlcOPdpsXwnyLpMp1AJ5t2daSS7zLHI9u137dabldX
	mQkTwQfg2nbS3E3hxLB030+CXrKyUBKPQita9BGQoxP7C/iSI4GHCBTm+RDEknRjKWb7HAYPETJK7
	1YCpP4/IWaLS/SMYCZmPbFNi0mCCEMxqWNB+vz+bx8TtpDz99czd1VMX1nsI8kcIuLLhBJfxoxVYP
	OZo/w/1F5M04A5ljbJ3oTH3vMvgdVeu+uVWtBz8tPM/2RHTgmBRMgrHIZiew5Ec+gb0umm55nin1k
	0mxb91vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WiN-0000000EDHH-0Pcf;
	Fri, 18 Sep 2026 11:25:11 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WiJ-0000000EDG3-2CIf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:25:09 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafd6so53099285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730703; cv=none;
        d=google.com; s=arc-20260327;
        b=XYYn0KBsNRykQl7zt3QvMxLX0ixiXUOd0iIZ2fkfHJqWF8MV/L1nXcz6uCntmPLzk1
         hrwnZN8W2Fr62WuODLk3N4/Jhbki2VKmTH8X/vQ1k40Ctgm9kNFxWUFpEanjgtcL+PgD
         RCw6Qd+Y0uP/hNgTfKIv94KAHfWkuZY1pteZt7on/TxeSA/O3kVuoYYb2hRk2RV30Z42
         NwB1YoBxuY0jT9Pl9tE4hCK8+Xa+Gtb499SOq30Pxo8JhCsf2XuPx+hRsLtd9Zx3jpMs
         dDjOIrxO7fbYTQNtQGuDSwEVHqgIIsyS8+kB1zTWbmMsvRenvgvACGKv9+fV0uIsE99L
         DNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        fh=WWIrjb2ML82WwUvOzNFjX+0Eaoq4TNmj8ZhoQ6s6GJk=;
        b=kpzDzwr3oewzoZPcEsidXapk4MH0CFCbfg220FV2xpLt7pxToE6rXGQOQQSfPrkx+G
         DSYRvmjRhTWrTdh6DOONh9eGDqXQ/Ytq84x2fvyCHLTaPTJmSNM+GUyQeS0XBxlIw4Dl
         Ww2+Fg7v9PDq3OfhfCrAlgn2YjouOIUCy58tHg4kZ/kTtCNskRFNrc8h77E0rzSU5p4m
         VQW3s3Gn8iLlEe1tOWB7yO7j5A3iO/tO5zt5rSiPQ7UK6cn2ytc3BM4Gbojg6IsErPbY
         WGRNLLi/gOn9137vH/jPSrDRJssHeXTBgbiQ1xStaxcqleOpY9dp9R6siEJWHLf6UWPE
         3Ytg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1789730703; x=1790335503; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=yNz1/ttiS5hqCViXiIzWRBXgU5uc6eF8xw7zIk1LBa0gQEe/dB6DqwIfuxfLfITlBG
         vbImdI2wLwkPN9TJFhkXJyuBhFxGm3Xd6NufitGnveKaUK0HK3qvivD4DCcHAPKFOxdq
         Wft36lE7KjMhNU+iifsdxL1PKzmNG+lok9tMzEeRLVM7xR39HvRnzQdJP0kWWHhQzN0C
         kwkY2obSrk17Ysp/aLXcpcaxEdiInXCYtorrg4d9RbqvnJC7jh8Mha11G8XgoBaZ3geK
         dBFADnk/h4cZWmcaOlJE+50tC+9tMJgnAr1zgSN9bZc6AGEn/zu3GbCz9QWXNQTaO8Am
         nE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730703; x=1790335503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxNae09A1OnN2DhU/tJerCjit10PKrqeq902N6O9xkU=;
        b=G2uhcIcFBxDBgh2Ao62++qVyOnzkcXb0A3OZ9el6y6CA6vbBNTW6sQEo5Qo02fcGzL
         HiQTKvwdvDGVurPGkv+KqKK1ojXfqXsrLGp4LkWCJlH6Inev8+DIvv55aUAa/bCvsXVE
         3arrKFEQ+WAKVYwsYuLYIo9R0BdXpI/HCAfvS8aNykQO7iE+Cdenso6ujkwVSVdR/Vrq
         wywcxVf+d0RFGkfYVcYsdUed+tIlIJ+Q0uY4VHR+nT08Aavm8Io0lQgv/6bi44RU0OES
         kWZD4M6ZvRH53vsfZu7k0yX/soxX9Hp1K852dtyoTcpYjBTUwKtvz4amA00FMGtYLk8d
         C8vA==
X-Forwarded-Encrypted: i=1; AKwUvBx0J5vrWy8YyO5QLr436laE8jghWssM7jUlCkt5osRneQnOx+aKfOAJRH8PrcY0XFrLHoiKWrelFi97dAfKpBev@lists.infradead.org
X-Gm-Message-State: AFuF++lkON/G136rGDp7KytG0wFgRw7Ovn4by98vM9WuBs93qHOChMWW
	cUW5aQVBcPgOJ39+z0rx10lSguUTPm1FoT0m8uWCol7P1nV1cduZq0TazGLRRvHv7Vu0l3DAeUj
	8ZcIXdUEWNtj8zuyO0P/t5nsCezHki9ByjWnKoyoOKQ==
X-Gm-Gg: AYBFou0VAeh7DXFr9+jweRoLokLtbMCFAEP9tBoTbKtji29rHiJ7D3EF2mOpdwHEHY2
	woQJ+DeGUXcgLpz9FUy0PHHzfSCye7Ae6V42dvXHawndV4KOF93E5AbyQD8L8CqpAV6F5HsPyhd
	qUAZQR09OHsqPFPbQlA2lym6a5hEdUjHY1rovkP2ySOwcN7NHIlCtf2aOwQ5lkIiKYQoUjqJUVs
	5KXblKUD4uuFdqTsflhXw9GVoaDs3avFWHsA7bw4mqIxuZaHwb5WaL3chtWIpj+uYJCI0GoQQWG
	7zA7RAHTNi2ZtQqPuq/2VrCqA5Uebk+eKEKrkn47DBZp30yrIIF3QGZzeqnHzjva5w==
X-Received: by 2002:a05:620a:6288:b0:93a:14c:3296 with SMTP id
 af79cd13be357-93bdc64eb85mr265730785a.15.1789730703288; Fri, 18 Sep 2026
 04:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260904130858.27803-1-royalnet026@gmail.com> <20260918100543.23974-1-royalnet026@gmail.com>
In-Reply-To: <20260918100543.23974-1-royalnet026@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 18 Sep 2026 13:24:51 +0200
X-Gm-Features: AcwNN1UuXA_zYpic264Z4jBxnVkM0kgrR6zKknS_YOh0Jo6_SD-EuICl1_jx1Us
Message-ID: <CAPsqS2QXQda2ftbEJb_-Qeva9ay4+4ysdpUtj8jAvbyAsYiAJw@mail.gmail.com>
Subject: Re: [PATCH 0/7] accel/rocket: DVFS for the RK3588 NPU
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sidong Yang <sidong.yang@furiosa.ai>, Diederik de Haas <diederik@cknow-tech.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jiaxing Hu <gahing@gahingwoo.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_042507_838215_A52FB460 
X-CRM114-Status: GOOD (  13.85  )
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

On Fri, Sep 18, 2026 at 12:06=E2=80=AFPM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> Hi Tomeu,
>
> A gentle ping on this series, two weeks on.
>
> Conor acked 2/7, and Nicolas's review of 3/7 means a v2 is due.
> Sashiko could not apply the series, for the reason you gave Jiaxing
> on 31 August: its prerequisite, the slot-search fix (link below),
> is not part of it. With that fix first, the series still applies to
> today's drm-misc-next without conflicts (git am only, no build).
>
> I can send v2 with the fix bundled in, so Sashiko can review it,
> or wait for your comments first, whichever you prefer.

Hi Igor,

Please resend with the fix bundled in so you get a Sashiko review.

Thanks,

Tomeu

> An LLM helped me draft this mail.
>
> Thanks,
> Igor
>
> https://lore.kernel.org/r/20260904125936.26234-1-royalnet026@gmail.com

