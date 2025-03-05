Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A6FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip8BXHWoBPBcJfkqwkRkFmQcStg4I9KekSbfrE6JYhk=; b=GFiHLf6AbThEAdANrTnLTWZt5p
	KuCYgsMDNQZcTD0XpbNI7CJiFpUyTCULldT3jeyxV5KCzz4iFclHLIPHTJ3cYn8A/uK4ddmN+mmS9
	YEecbPeBogQUIUpyE6X+gX5lj2uTFGZPsUALeSg2aEHw3R3cEcAMRUF6K7JBv/aSfPxnR3eXAQKvJ
	rhYtLxTSiidqQh6nNxiHJfvUwEGNks0fN5qXSpTPrtXGzeZjnD+71Cisjw6FYJdvAtld1dHfnQ+Gt
	m5LBB5CjSUUN7z1nth+Qg1S0YzZPdFleEhLZm0iNc1L1lKgksWCMpF1GwNf++t0muaPs1UP2Iy5Qj
	XV8ojcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx9S-00000009TRY-1mMR;
	Wed, 05 Mar 2025 22:23:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx5t-00000009Sr1-0jLE;
	Wed, 05 Mar 2025 22:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 547975C6CB2;
	Wed,  5 Mar 2025 22:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E1EC4CEE8;
	Wed,  5 Mar 2025 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741213199;
	bh=odGwjXPuLoI3+Jrcw4b7Ov4gl4KEsYLb21Fg97K0Pb0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bKzBhBHPDCKuhVEaReaQ76MMsX2G1SX6D/bEE6l0Z2qcbL9g+m8ImZLln3Z02uP7H
	 iQqyRHRtaCWtcg0HBo95FpeZ+F3G6yr35SrcUT2ZLRHt8PTRrzIGBdY0WT/wbt/mEd
	 jvhBbaBx5xc1kZLmU+PCHnsngL1rKm5KkpSGkTrBPbmxqlJVSL024qhcSeG/q+iAIA
	 2w7669UcigcbOGvIbi2rsSnBItY2MDB8B9uujNF4gZU0YxuylU/2HcJbiURsRxusd6
	 +fSV2SaFb3BmOwp+qsn3CKmtxNgaC/RrUW61PdmmFVFb5snhFHSafDfFAaE9UMjKo8
	 8HGukhVwTdq1g==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso9892129a12.2;
        Wed, 05 Mar 2025 14:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5mugi2J1ajEHn2BTC92n4F7FSoLLV6Mi7jJtEH/xlGdfSSCaP6gqiA6YHou++b6ItV6MuaRpOSrxJ9muezjQg@lists.infradead.org, AJvYcCXit3SdOzrMIvj6TCaJB2DEOD3uqvYkJO5tIqfo0od49USKtk5wCJV0GXVg1GOfzWKYA4tZiL7kvXEIVbIeUOc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqkSGuJAurkU2H9JXfH/Uxc42Aj01Ic+uDfDewxPT4DY1g0mWx
	voO+ndMwbJMV/UDCqLrlJl+CsWtzrMlATasS0dzjN4qgB7ZAacU4GA7tqW4aV1FHeVvDyAbNG4b
	a7eTvkepYZ3Iqq9RuAOKYTdUhYQ==
X-Google-Smtp-Source: AGHT+IGmcbRnsKh4qmTIrjjZnvbSUllEyKfAIMmiWB3ZMYddCqtDRqGxn1VMbXWC0I5eXo67K8lElFHwxeHn8Rragx0=
X-Received: by 2002:a05:6402:1ece:b0:5e4:d75a:573e with SMTP id
 4fb4d7f45d1cf-5e59f4f8e28mr4935569a12.32.1741213198291; Wed, 05 Mar 2025
 14:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20250305140009.2485859-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250305140009.2485859-1-amadeus@jmu.edu.cn>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Mar 2025 16:19:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgjD69wtJJfLuvBQ4g+JprxQ9mKGPWGgY1dmziehe-Kw@mail.gmail.com>
X-Gm-Features: AQ5f1JoAojNhKXJ10NzfyCQO9G1rFeCcWSk_-mw-M74iUoDe9bMGrTl0QURdgE0
Message-ID: <CAL_JsqJgjD69wtJJfLuvBQ4g+JprxQ9mKGPWGgY1dmziehe-Kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_142001_275675_135C9D07 
X-CRM114-Status: GOOD (  12.14  )
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

On Wed, Mar 5, 2025 at 8:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wrot=
e:
>
> Document rk3528 compatible for QoS registers.
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index 4d67ff26d445..fcfd293b9bf1 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -103,6 +103,7 @@ select:
>            - rockchip,rk3288-qos
>            - rockchip,rk3368-qos
>            - rockchip,rk3399-qos
> +          - rockchip,rk3528-qos

There's 2 spots you have to add this.

>            - rockchip,rk3562-qos
>            - rockchip,rk3568-qos
>            - rockchip,rk3576-qos
> --
> 2.25.1
>

