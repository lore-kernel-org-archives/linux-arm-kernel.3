Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3243CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UKwny4OCS6po6kCIfAEvgf8DBaHp7r7k6YYOJQPkEo=; b=u5Q+f4jV/Xxu4/wd/kugHoBVgm
	1QRosu2PK24zRIx96B8+P3l50/vi6tv1kGLpbpBYZIO58j5Hl5EegHeFNr7LHHBDNFqlUvo1YVhIK
	TtIcBptR2xOHbqyMseZ4gJ8P/TM/4obVh9NXCajCbw0pCBhp2AfoyG0Lt/+lhegUQYI5MBzTaa+5N
	50hQXqbyZjMwS90uOV6rmpxU7LnsV1s5MUlINXJuhGLrNWJ3o9dTwTdqvIKK617gYCZBdXCLp0EC8
	N8jpe7t5lJNKSijeZFJxeQRByLppMRwOYrvxdWXvefoEZsgNa50ElddI7NGh9h2A58+6KuezSPk5l
	GCxFYBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6C3-0000000E9SL-01TX;
	Mon, 15 Jun 2026 12:13:31 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6C0-0000000E9R6-4963
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:13:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so2224957e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781525606; cv=none;
        d=google.com; s=arc-20240605;
        b=jY/Gapmoz6bPT27gQXD605TekCRXzUrWIVybvzTkEWiWYnMZbV9CUO5QXYk7sTISOn
         S54tSJ3WMv3nC8uxoZJZSPn3Jcb4OhTcYHOJM2in/7ZvwFioIgOt00d9csxv/yim1Hbj
         UJaMqkErYbXmMqXIWCgykxqY6eKt+0JqHkUUxiqQUD8sp8J5DIViymt65sX4NdFaOFpv
         fAnjG/OJPeMbdHgPRcCXZkQPtpzNhYcOa7vEFbjJYnXev7Roigkqyw1vmSz89n3umK4f
         8PLWRRjq2da3v1HePYnDTi+oB9yJt54uNq5yNshr4LwMwD6kNciBuqdrdNWk2hrHFcfp
         nN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7UKwny4OCS6po6kCIfAEvgf8DBaHp7r7k6YYOJQPkEo=;
        fh=8VYxwf10JcuMMPLKnQ9UbwedSWmWUc7Sa7b8XBUL9Uk=;
        b=RsEwUN6uIrl0bfFAVm1lIxRQd/FbbgKD+n2qRj/78G+NRuyMZtTZoT2Wpe33rWFEgJ
         Ks2CPNPF4dXWMRVRa1tGl+yqJzLLKqD6Asdv8fiKkhYaVJPg+QsFmHW/YNfutk3GeisI
         cWxj16yxWq6aWYgof02jqcx90UamKIZEwL5SjO0ua3d5QYJ+lQ131sCGX/CsKlkGvt/R
         YgCZ0TlC6rk49L0tMrp/JcxvHhldHbaHr9FF1PmXjuV0ipyxDXY21aHnOMoRKZRogrkZ
         Khp+dUgkh4U10lDt4vpDuGe6/edjQtMhAa3lbY3itJnvQ8cnKYH8A5aQ6TQmxy7dR4Gb
         2cSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525606; x=1782130406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UKwny4OCS6po6kCIfAEvgf8DBaHp7r7k6YYOJQPkEo=;
        b=rKZzH1wMBVbgTjN35EOSJ2Pq8VvW5bg7FE65UQ++lOLOkOfU6bub8sd7VSZOibBptn
         aYQVVLE98V1xvlJEgIpkt9G4fE0Kk2CiNQ1WwnxBZXFznOEgKAm6zH5X1mcl2tTQce0B
         39u30NkQmha6liG3AAmIZ2nXkPzcc2JO7G+zxxYhUqArfwCaqbI9QRxRygkQESeolPad
         mCk7HUxC0gQdijQrHD/7tt5IKKQBxc7+HTQKnCRPHb0itmlAlGDy9NsCVyOn6OUXulMe
         NJKv8LAe3R5HUoNBJwxq8lT+W7Sa4jS2/35FrztdkHhQjN4o7Xt+vRr5r74cxcG6kxy/
         iOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525606; x=1782130406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UKwny4OCS6po6kCIfAEvgf8DBaHp7r7k6YYOJQPkEo=;
        b=cBRVYYCQh598a7JeozaM9NIwrMtyP5P8KNzIk3c63ijGkozwj7nJfiC7MdO+Xt1vEg
         GgdBC3dQm1STA+7qyI75RwHs6BHtsfXfm7Nhwob2iLTyIgkRiN+je543795kCu2Q8vuT
         EPNsSVBhjLfsTaM3R3fdg7TfIgcvZ3oPQjPwqjDPc6b93G2UmvlmtJsORFRvvj6PnUr2
         D2kNQcbRYZFK0qsYDy/Sq1da9tDjLpaTVl9+WTpuMZ/M2XGJMitgnXF8VRve6HbfPXPC
         OmZHuOKRWpMetApsFAItwEZMV0Y2fYVXBReO7Nj/Tz9GNSKKgZGQwIvNjgfQheGPlCmM
         MkZw==
X-Forwarded-Encrypted: i=1; AFNElJ+WLQeANZMBuhKp2Cc/5Ivg0nUiZxCWmZALgMLHlrPboegz+wCgngvClVkjbfXLIH7zmpBFnEKXuLCfUpGZxnfe@lists.infradead.org
X-Gm-Message-State: AOJu0YwG0zeVh5v/oWvm+7VvOkBWwp9j8HGo5mxgW42WN344SAZRrnoc
	OxKL9kR/HpGpwixcUDOUZEcvukWQoRCDcCwZlyGPIJrLBBcsLmNAmKt4LAVEDlnZRjXKu2IvlN2
	6viXvLM664YhVNKWmiosT/vvRGbEDNfs=
X-Gm-Gg: Acq92OFG0R/4UODX3x4bwVSQpizMF5FNflpum2zEyr4a89FTe8pzwXpgRuf8dLJyN4V
	jgWscwaYEzH7dUG/VSlg/axKq27aLiiLePI9GSVZFogpzkgWJC4WGgU33e92q5SCT4CFot9Fwss
	J73nW2CVaoCVA53GarIIOaQ1uPrGJCiBngQxH2DWNFkoPk/WxHFSl8UtznHaacXaYVkMurLH49r
	Jsu8otmxVx5UhQj5VA/y/ErAB30nXL+WsJ1Si8yCrGj5V9cA0QXafOzk2c/UvFg8GMZBWnERym6
	nxk7yBXt2Aita2frKxQV0jQ3DGwcwKGcN/YA7kSCy9oLW3Qj2cSziB60G9R8C6t/yx/JXEJDrfX
	KDAiASBE=
X-Received: by 2002:ac2:546d:0:b0:5aa:6155:d645 with SMTP id
 2adb3069b0e04-5ad2db842d5mr2873491e87.44.1781525605862; Mon, 15 Jun 2026
 05:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DgENq8RU6s2CPnKsf53i=7zoBeO38m_BtV=w54hr2hgQ@mail.gmail.com>
 <b7c92302-d675-4610-a815-b353ff365e36@kontron.de>
In-Reply-To: <b7c92302-d675-4610-a815-b353ff365e36@kontron.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jun 2026 09:13:13 -0300
X-Gm-Features: AVVi8Cey7mHTp1zCpZEvEwDbCezZO7jucn_FYBT_wDOzuts6YZNGLsTJyi281u4
Message-ID: <CAOMZO5CQ-qfqFMBtUbew1xmvnV=csdC1PGWz4AYb1cB_Y=xMag@mail.gmail.com>
Subject: Re: i.MX95: EdgeLock Enclave secure storage
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stefano Babic <sbabic@nabladev.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_051329_043974_FCF6D810 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Frieder,

On Mon, Jun 15, 2026 at 4:18=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> There is no upstream support for OCOTP access via ELE. The
> imx-ocotp-ele.c driver (despite its name) does not currently use the ELE
> but the FSB to access the fuses (and is therefore limited to read-only
> access).
>
> I have some local WIP to add ELE support for the OCOTP driver. I think I
> can post it soonish.

Thanks for the clarification, appreciate it.

