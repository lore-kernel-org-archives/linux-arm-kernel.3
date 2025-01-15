Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77067C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J7daUrtsODw4NkaaLjzd/s3pUHtf3ua4xDuRfkTRUk=; b=mMVIVBQVzWcXZMQc8V0s4ZHmYC
	l+NBL5cVcDZiKSTbDTfNGGhYcFXKU5yjMzjabLVq6ZcJ3/EIknf+Yn6KI1M0ZRo8+Tgb3sbXMlgFq
	F2ORxLjfn+ZYQZc9rtZ3PekXkDMrJxCw2Ppp0cx2WtlSZstot14yzyuPsNv4eO4FlUOjJrBG/3X3b
	PTwDXEOdQK43YdnLHciA+ANoX+5h1Z43dLZwgu4GythLoFBk67TfaffkbPja0Lxgf9itJYhsoprhi
	AeBUYlls+RSebUhDJ8yY0OEUqN7Ga+zjFYJ70Xyu7xB2/P+GDHgl5iQ0jxkiE2g9S5qnUf/rTm5Lc
	cED+oWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3QE-0000000ByEv-3eVb;
	Wed, 15 Jan 2025 13:27:02 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Oy-0000000Bxxh-2qMF;
	Wed, 15 Jan 2025 13:25:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so11438374a12.0;
        Wed, 15 Jan 2025 05:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736947543; x=1737552343; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J7daUrtsODw4NkaaLjzd/s3pUHtf3ua4xDuRfkTRUk=;
        b=aheT84zC9reT9LODZYJU9eQYcIJAEPZSSrXC4smEVPJQWm6itWIi/dQdQrf20J4w1o
         cMa1Hdcc2vdQa4qSmsr1Nxkv3xgwSyE92ZUhfv1zbblK+wbWjbO8vv3XJnpr+ACHR7Bn
         FvDyaZKvwXOKbnug/XFaPCIhbRmzHal2VMVYN0p6uhz++3IU2typt/2zs3+ztsupCUjA
         y/V5SGZsIfDL2Kzdo0PdPFv0GBfEzQrLpIB0Kq/+ytsQAhwrimICrhL1dc/sBP25t/l2
         SB1t2df6v+43EyYO3iHs9P93m7yVw1oL6ONr8mqyUmg5WRczRlUinKggi+bPMzyUEiwd
         lviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947543; x=1737552343;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J7daUrtsODw4NkaaLjzd/s3pUHtf3ua4xDuRfkTRUk=;
        b=VuDpVonDULlSHpkmvcKG1E/GPi5jHyHdg6tm549ntZkTxPvTBzSvQPKxnG42+XECtj
         Mb0YYwOtFEX9rS0eliYuhGsJqksERYQJihP1dBwrpF6uAb6o6kRVmacDR0f/L7cz0USf
         47QJMhZHxorynwyi7K8tx/C9J3bKP4ao13NBpa6bdxIgzyelqQehZPRMWzpOXpVNW7XT
         yqcRFk+Bz7JfDdNloBzOuY58hzQf+pGvzD/eL/lLMydn5Dhcvf27Z5Xj0HpS2TldLRCi
         y2EtODJsw5WIXE2WWRjo2ojq2OVKHjXkzU4vs/sFV2AGPxu/Pcfh3nv+NyW5GV2pCIkO
         fAFA==
X-Forwarded-Encrypted: i=1; AJvYcCUEubpMRwX1kM4dz08NGpDGF0jUI+v9vYKoibSWl5+JvniObRkB+Ukrm9Gc642vLdCCLNxBqFhcIDukLcnmyob0@lists.infradead.org, AJvYcCUUCy5NM8Xa8idx9U1ZgGYXrGIlvtzMVKZnj5ow4GXicj8+nqPNXqm49YqAddSeAblfsUod0wc22myAnqCp6JY=@lists.infradead.org, AJvYcCXKTKgtIVKbHgg9cN5EevxFyBEHFaJeoVdpBeOHi15DYVEWmr9Gr6epU5NI/MuVHHh10QO+t7kg2K1J@lists.infradead.org
X-Gm-Message-State: AOJu0YyM5a1Q3R7hVW4HrbEmgTZ9v7PRd72nbcREpAU1IMBhlgpi7RkB
	w7sCSN5/QmRGkxBaPrMuCIH7+78Afu6il/ErAv9LWfLemtecxCS2
X-Gm-Gg: ASbGncuva0RBxKtEHl3lj8LLbJE08LFC7Fm2pCD7eRESw4+Cd73ZY58a8xiI5ClsIJb
	vut2bzOexybaK9MgZdCkbv3F+zb9VIG4eWC0hK328+9e5OXcN7xei9p/NIuEWqnpVmftdDZzYrf
	mHWL/YpGmGOt6MeQPrPaTDWFozdXOu0/AVQe9ZXc/p5655zpLcXEpp5YxfyEeyBLWWt9tZN4Yzu
	7H1FehtMjULqjheNziACvDmvSiKJeAO339u7O8jJLPjSjVXfBhEf4REQLUVuh/wg/2Dd95K+dI6
	EJtoqQZIGiqomcwMYpShfxR2kd6TU8AE1QPlkQ==
X-Google-Smtp-Source: AGHT+IEJFePPg9NnmpiIivTBGg+UDQYzhd1hyTCg3WlD4AaxxxCknAyEcJXeSZ7Quwxou31mkxCDNw==
X-Received: by 2002:a05:6402:278a:b0:5cf:ab23:1f07 with SMTP id 4fb4d7f45d1cf-5d972e1ad09mr24730872a12.15.1736947542796;
        Wed, 15 Jan 2025 05:25:42 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c496sm7498120a12.16.2025.01.15.05.25.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2025 05:25:41 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for
 rk3328
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
Date: Wed, 15 Jan 2025 14:25:26 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>,
 Michael Turquette <mturquette@baylibre.com>,
 kever.yang@rock-chips.com,
 linux-phy@lists.infradead.org,
 wulf@rock-chips.com,
 zyw@rock-chips.com,
 Dragan Simic <dsimic@manjaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 frank.wang@rock-chips.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Alex Bee <knaerzche@gmail.com>,
 william.wu@rock-chips.com,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Trevor Woerner <twoerner@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
 <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_052544_717735_9A142243 
X-CRM114-Status: UNSURE (   8.78  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 15 sty 2025, o godz. 14:15:
>=20
>>=20
>>=20
>> pls find:
>>=20
>> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
>> and dt: =
https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9f
>>=20
>>=20
>> and compiled .dtb
>=20
> It all looks good.
> Do you have any CRU errors in the boot log?
> Can you check for the presence of clk_ref_usb3otg in
> /sys/kernel/debug/clk/clk_summary?
>=20
>>=20

cru errors in dmesg - seems no any.
here is my dmesg: =
https://gist.github.com/warpme/ecf38482cc88fb68471355d011ecf974

For clk_ref_usb3otg i=E2=80=99m getting following:

root@myth-frontend-e67a8de4c815:~ # cat =
/sys/kernel/debug/clk/clk_summary | grep usb3
    clk_usb3otg_suspend              0       0        0        30770     =
  0          0     50000      N      deviceless                      =
no_connection_id
    clk_usb3otg_ref                  0       0        0        24000000  =
  0          0     50000      N      deviceless                      =
no_connection_id
    clk_ref_usb3otg                  0       0        0        24000000  =
  0          0     50000      Y      deviceless                      =
no_connection_id
                   pclk_usb3_grf     0       0        0        75000000  =
  0          0     50000      Y                     deviceless           =
           no_connection_id
                   pclk_usb3phy_pipe 0       0        0        75000000  =
  0          0     50000      N                     deviceless           =
           no_connection_id
                   pclk_usb3phy_otg  0       0        0        75000000  =
  0          0     50000      N                     deviceless           =
           no_connection_id
          clk_ref_usb3otg_src        0       0        0        37500000  =
  0          0     50000      N            deviceless                    =
  no_connection_id
                   aclk_usb3otg      0       0        0        150000000 =
  0          0     50000      N                     deviceless           =
           no_connection_id



