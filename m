Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9096C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd3Q7e8yxSyHuD7DdiU5ycutPk9NojNxmVh9qMkLmQ8=; b=MRX00TNyGGitYJuLkJEb4shB+T
	WICZApObWVp0gQQcbJBU67scGkp78I1j734cwoqIIFwR2k3B0KQfcnVYp7+nF1AZt8mjUEVzS9F5w
	GyDo5XXpuz6ufafatm6w13E5DtG+sLRLHala74iWXsM/h5HyRqOna+JS1PaSoWDG7A885Cw8jdgoJ
	c1N4QapgETYydpjyfAeUrumbluD/NYcSMuLonrapBiuXhPKDsrlAqRRcaHAJ25jyrtvpFQldOBaTW
	t0WT/WNykRyeumD+hzI2gaRgZ1jaC/ET+JszpzsRfGILCfl9rIyLhvR70ye1DNy+AX2KxB4TuoxB3
	DeKsBpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbMb-00000004Zry-09DY;
	Tue, 15 Jul 2025 08:50:13 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubat9-00000004Usr-3Wip;
	Tue, 15 Jul 2025 08:19:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b31d578e774so5188979a12.1;
        Tue, 15 Jul 2025 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567587; x=1753172387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd3Q7e8yxSyHuD7DdiU5ycutPk9NojNxmVh9qMkLmQ8=;
        b=GIJMaFCWq2kESpJ/BbY2PtFPPDN9Rd08QQd1US5Koz9qS/+Z9wf6pRYys5/qa8rlrT
         K82/w4D3PAmTKDHIYV29cOnKf05zdcGQsz4zZw4FG40+6sBvoFnd6Pf5h4H0KV9iPRs2
         y7nwO0il4y+ziHruxBx9fF4+hXqQW7r7tlHBQZ1li+58+N/UhmGRn6lTKfEzCf8Mq5Mk
         dbl/TgXfm5Ifum3kOdIF06WM3nYaQYl+YR9lVIr4kbADloMBvhy+tbDhD1cOGViCyBe9
         MZrVmBsdbZj5AaGd7TY0h/82wyXlNAoa/gKLwjmjCq64SZxhruGJfzwn0nESqSdblvnd
         Dh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567587; x=1753172387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd3Q7e8yxSyHuD7DdiU5ycutPk9NojNxmVh9qMkLmQ8=;
        b=ezzzFTdLRJKphZvpOMDrqDtKWSbWuYY2YSZFwhE/ukslyNrxOONY58kBlsyBCcHwmq
         3+/VzD/4dgaYFrIGZJTWf9Mj4NuQpsKGUTFW6lbaxLLE96tC7DY+o5Oy8O4oMo0mouOY
         kTtgOtTU6SD4Hs2BbdpYnIqzj+uHdnzvtg2IqFDzKzh3wYVr28KQEi09zgxfqDsUsddT
         9DPoJ79VY4vhrrqPTrq3TBMMOo+n4lVb7EP4wJwF/4TCV+wN0UQ1qPocdGyRdbYWMnSM
         /4TsTJ6E+eHZ6kDF2T3yOJuaOX82p/2k5v7TbPvcM/np9Z9AcUPwajkdXKhzJ8KJhJU8
         ypog==
X-Forwarded-Encrypted: i=1; AJvYcCUiGbOm0RvSXvCTjoM0dLKCzbI/Kq3WNTCmEKRc9aWESRWqkt+bh2ilo0p6PDCJwIIauDT62lkWXEhcggvbxXU=@lists.infradead.org, AJvYcCW9N33koVvO0aUnj6LwfUG8OzEg1KCtCMnLY4vg8tb90o6PB4PpcEbayFNlfO40EojTElp2xAu/uoSoFEbTewdA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjh1Jgi7c8VCmLoKM3LByhsPqcfg8DQzXIUklR57A0vTCqViLp
	6iQK8cZrNQRUvANEjGxptZ/EK/320kqfUqZVN2ocAblagFfbVa4nYKzBIor+Ch8r4S0GjohZaHz
	NwmypXQibA9bT3ovNdTv2o6GzAzGM+VA=
X-Gm-Gg: ASbGncs+KvbFzub+YLpFainrb42+6Ms5WxDAOSKm7ojy/7/gP1dXFyo0OyatJ8CLwH/
	AICrQwgdveM1vE2b/YCYEnSeTaN5BzBWROgKuq0lXtSTApewD21p/ZfWybDPyUbikc/hwD5YeG4
	qXnG8UWVI33kDS9NHsMPYbLElMpx1uCiAWBnUSpbnQeCcvNDFKq+kWzRJL3wxk6ftnotjRTuIY6
	ttU
X-Google-Smtp-Source: AGHT+IGWXqaNFBkxVhxjoAh37jIlv8IOlz+RFpSYTmKmB9oiEiFNbWlyvsTEKG4zuAWGwP4uJ+VRZLGBGphF2VcEpBY=
X-Received: by 2002:a17:90b:17ca:b0:30a:3e8e:ea30 with SMTP id
 98e67ed59e1d1-31c8f9ba0f7mr4097681a91.11.1752567586749; Tue, 15 Jul 2025
 01:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250712210448.429318-1-rosenp@gmail.com> <20250712210448.429318-2-rosenp@gmail.com>
In-Reply-To: <20250712210448.429318-2-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Jul 2025 10:19:34 +0200
X-Gm-Features: Ac12FXxwU_5cXPbe6k9-QU1wlgWyLzCeGzXcdBi-Vlkd5rOu3WF_rrVJJ5NIIf4
Message-ID: <CAMhs-H9NuX6m0zOM+6ZcX5r0aq_oxbYkbpCTAB4sT6sea4=Osg@mail.gmail.com>
Subject: Re: [PATCHv4 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011947_881650_E2726AB3 
X-CRM114-Status: GOOD (  11.39  )
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

On Sat, Jul 12, 2025 at 11:05=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> While this driver is for a specific arch, there is nothing preventing it
> from being compiled on other platforms.
>
> Allows the various bots to test compilation and complain if a patch is
> bad.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

