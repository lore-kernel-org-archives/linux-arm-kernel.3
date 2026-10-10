Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDFCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=; b=sDi92uWOJn79xEAgqr2XbreoYO
	2bTvJsz+dMOaFQ+VRqruuVqPqHZjpSd4I7J2EL0swIWlkgZ4JwzfAQSXJByHKCWORfry+rdFu8AdQ
	ZSyhUdYVOeh9+XAItBzl5vsQrgkK1Vavb5NLUFhnqH5j3grmpkyNGLFr9nrPsWVemoIRHXUIBSLzx
	qKm6DX+QP/086DSg6KbuXNSckZaw7wW0+LIwZL2sEIMpn1+jAggxq3q8PgKTtoiGAeC8+c5Jay1a/
	oQkac8BPHIvdHslqyOK/m9Fhs+Lymw5V28jNN2FjxHEf4T9ItoQftVNDLpjH2Q8NOvkHv2JA3EUnG
	EWDQmNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfkO-00000008VRM-2RHY;
	Sat, 10 Oct 2026 22:40:56 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfkM-00000008VQJ-1omP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:40:56 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-677dbe051d4so657329d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672053; cv=none;
        d=google.com; s=arc-20260327;
        b=ifArXEOATl53HYJ/5eadpVg57yenV9dsyyN9zFvhTrOaC9B+zIDpBn7M4y6cLzqodh
         l2TrJY5fhT+pLK/nYyQHa2JWyhTx5QZz8Omg/xAz71lkbseFtNZ2ROig5Ivck9vjD8d+
         wghaen9Oq8kX6qWY3qi5ZGWkAf706OMo7/flQ2v2RxfSCVJ+Adv3sBxHCQEmyh+ZFqc8
         zUDDPXbmejch35aL35hyGVw0bkYgTv+2FllfIR+HKtA6DMexC9vEmwOqSvm+uZuP4Ne1
         KT1s68IWByBk2OFspZQsBaQLbzencLvsb2pC5EzTGTHnAjjNKBlPaTrQ1RRiufXsIhO7
         urDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        fh=KBv4SmiQhesVq+n9+kTgc9v7uyszALOXw2XedoofEMg=;
        b=DOCQniB63HIDMXBGg1mput7guSa/9zAKu2D9LPEZ/jjLNmoWhEtCmtRDmBDXHcg003
         ZVDN47EX5cLdWuNWwOSJblPIuu2sp2Oyjlbks99xuJnuN7rtiwPLf4nCnoBQnoZZNjxf
         WTsGcVSKwD4YJI9bE8nu8BrH5nBb1gPWfNUYuvmvjXyLhIqjyV5rSYin7G8Ln7Hf0WYD
         Wb3HHToUs6Gj2J7+xK7/r4EhjxPN1FiKH4HF0zWCVGSf1K9pN8gn/qpJIWQ/zXqbmwjr
         RBnyND6PkQICV+THo5yKHKSiZxx4RF+hPoqtoixGxEcptMjSqK9r8Et8R7H/KLgFLrfq
         tAdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672053; x=1792276853; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=Z9BkCL38bZPALarNIkNHjtdJDn+UfTzr7AiuY571jjbvc3Cos0qfkI0HI9S4peTXjG
         TsvUg7GzdYlg7HHFoOMfAGilKPuEN3gR4YOsPQArRz3xLQJeqstbYvBumLlID8SN+N16
         ZxAWJ62iSwL2Ny39w8d90ezSIykl8rUDO/lV0HrNhLVIc25d5rMvfdgW9VfzRLM8rzJ1
         +8tjIjrzRMHkH6xaY08JuooGfqPT+ttPLpVNoNsxi4eLkeIDmqHHvGpQpKq0tOk+BW1+
         s/3RSaHRn2qVhwFrklGLdqZCmKGG0HaMvuf34xVG99tQKJcOBXK3u/0AqmVF6DiX6nQi
         kx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672053; x=1792276853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=h9wQ3UI5TD7JedApSjAvV76MUMvbGy0MYtn6/HtR3zHQ5SqKklFJAm7mYXmTyh/3yg
         4fzeNptJPUe03vY5PdEQOYc+oMzRPkzRHHb1fpnsbefRFB7ShyItMk+JVkL9LitgK/24
         NDD5eqdYpwB9SRlbgdJNvzvuLwhJsbDD31R6HS76rhxaNIqfhDYK9ZTx4+hmCssRkwOJ
         t4m730eaWHpPEFKfb0plTJbAV+I9QRWyevTqiKdJtfF0JjFKb6jDkrNUwSd1vBvRXFjG
         TCE5+TggbZOtWnf6gaSy0pUtOFQttxxkYfUi++3CO18AhjmNXals9/9MNYcZakRn8tIO
         AmRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkbS54q716Yqi+mUMMv3YAc/Lpvnsax18zyrVMStvPj4cl/6oV0aC89IXF+tRish1n6SkXwCcqAn81CTtBLk3+@lists.infradead.org
X-Gm-Message-State: AFq9FYLPzOL0F+BQoCd1BI8unGxYHVOXcWwz8PqKoqXl9WKuwsLCaioI
	OL8lt1FiacmeegwmZfzAeD06G1YQX4yzEs3wn0xelghjbHT7vYWjTues+0lfxNnMWGqeVIdUrDh
	A13j6XwA9QPNP3buGW5fiA3ZXPoycHSI=
X-Gm-Gg: AYBFou163SRONg0Ts+MrHdeVP0w0QEY5bNcc71fAL7TaBiKzQ6ClKn8/h/Ehz8JMCAb
	VoN+iAS9TsPTm7bEYjln7MdPTKKAnahTmYkFV0iHu6Vglko22RT4FHEGWPLKsdezR8ojZlVpRpy
	F19kV3/+bTMtrSdmGfHKdpvJ6xzGA2fXTY5BzKA3uY4KW85Ta/w4eL2Vd6EptfotH2/jHtqdHDX
	F7c1tLQBWRRKlP2usDFZTEUUDaH2m4BkI5Mx6n41AYdISUB5xqwjBacOjsRAzuaa1wiBmpFyZt5
	6FCNjuDqBQ6ugzqjGp479il9WITy0EtqbMTJi7UIJJkgKi/RJ6OD2Sj2LdwU5RBKtwIMjKlMcHd
	HQpZ6CpLCiV/C
X-Received: by 2002:a05:690e:12cf:b0:667:e855:ecdb with SMTP id
 956f58d0204a3-67935edbdd4mr1914994d50.3.1791672053242; Sat, 10 Oct 2026
 15:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-4-tanure@linux.com>
In-Reply-To: <20261010105900.247342-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:40:42 +0200
X-Gm-Features: AclHuK8sus9eXHW8D0kCsjiICdQbyK-pql4xQRfUyDiKVkCN64EjzyryJR6PDrA
Message-ID: <CAFBinCCaAT8+YjSwg0=aFF8mbN=j-MQ=oWvfwUakVE8O-eu93Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_154054_481275_2C04B631 
X-CRM114-Status: GOOD (  13.41  )
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

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
>
> What it does not share is how the controller reaches memory. That path
> runs through a pipeline stage with a gate of its own, and no other
> device has any use for that gate. Nothing claims it, so it is switched
> off as unused and a transfer that has started can never finish.
>
> Without that gate the controller cannot do DMA at all, so it is
> required rather than optional: a clear probe failure beats an
> undiagnosable hang later.
>
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

