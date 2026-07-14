Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=; b=xaA58pErGqTPeN4K/ZJQ93TmoZ
	IeozyQMS/md5X3L3/+CNxC9j/+KcKRbUdaY7oavmCkkD7K5/IIL453Z0pWD5skHq/j0cC/bXF1RfO
	aAq8Lem6g/YaceyBEkKSMTFeCLnYHoKp7vitVFXeMTB1xgd14jpxAs2IT+Ky+t7ejEqHz+cdR99/O
	u0SL8+P6oexptNzmx0S5bpbJRM5JzXgQ6F1gUo+C6FQ2D6mSn4YmwUQUU2g86j0JCQUcCfIuoA4gY
	1UK8y2fcwKhLyQGybqaexHfsz7XnQPVnK4qb5M2mnyHXqXeMe8fs63rr3IVMI+XLYyghNixRXEt/g
	HtkHak6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmC4-0000000DRJ0-2klh;
	Tue, 14 Jul 2026 23:05:40 +0000
Received: from mail-ed2-x01.google.com ([2a00:1450:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmC0-0000000DRHU-2kgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 23:05:38 +0000
Received: by mail-ed2-x01.google.com with SMTP id 4fb4d7f45d1cf-69846f25bffso3405239a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 16:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784070335; cv=none;
        d=google.com; s=arc-20260327;
        b=j/lw/8RrGBStB3rQzAtP02nw/wrDwKHe2Th3HKdn0JQBrwCdeaG32CnifBsIYSopx1
         a2xwuV0Mb7jWEtHCM8EFrIKAF2kOUo924YQtGIsm2GaoEV+LvqebrFFUHt1Ct3AziFGQ
         3/u8HbRDd1EPhZaLQZ5q/H9qgcNl1qPnLKzCkCe//Y2RYCyoEJ5wy/JQucgqlClF7l0x
         gJJ5UXj/Gp8rCAmfRnwz7wKxklgE0NgAtEBRetN1CDRISFh5a7YdZhKhoH84N3Bz2hks
         DnWYsuI5PqdBLWAWhVrhDSg6AISNqr1eifKuif+FjXIvTdSYjbFimIeJaPK8GEdUn0PV
         9h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        fh=RQg/1/8J4boHskpWl05fDyqMe3ZWODj+rn049muuF9k=;
        b=BgtEBLX7jGg2rtPzFJz4q8Aj5lIdseeILYwX/ikxRd1W2gFOCxcM3/eYhcpaJg1jTH
         YpzZp+8n5TGcG80G6oAPHK5V9k2eG9F4fZV0lkvsRAr/9Su6BNnDpjwtieQHAyfixvOM
         bl7K1ff7om6PjAHFiigq5lBOM/vzpeU+32DS85HqERY+baPBbeSIF75sc1QLbW96gTHj
         zR17h+CsKe6+xLeQAg5u7omUcuR5ARZxrbO5DAq2irfhtxXljm2B/J/TH47RYimx2mYX
         H3C5ZNlBCC3vBwkCdR6HU6kwnvCryGojSrm8Hyycv2Eui77RZPHHalRLdXunFV9uAJrG
         d+9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784070335; x=1784675135; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        b=Rzsc2+sbGxInP4b0av+mGjxvCQDJWfCYsPbiJhKh5gmvrtmJh0yOZkVSmXFn+hlFez
         ovtWEdBflIhWCL/pi4o52Qozbgej/wXz6dbtgCY/9UqHBcm/NGqjPxkb2qovPshtX+gi
         CjHXJloc6XH0RgzwZXD7fagUrrNUi23O1/GvVZagtHk1QY4K2TSGZXvAo0nFmxlGAQOQ
         nJniQejF/H5iKm4stRebQBrcO9ayJQZUffvwfkft6F4o6ON0fcAYuHZQ76Hk4RXSdLmg
         /eXgfdmWC1VYFoNcw0v4z76uVgrGiPM4xcH+zGPmrgTn5Ph0pLNeaOnP99Hm6Yit2Uvw
         aedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784070335; x=1784675135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        b=M4K9EGDQUNT4zqCQhs6mlHPW5h/puRZMOaltn4VekuJWnyWNDOCZhS4Qw2hBj4T8TF
         yvzu42y46laOoOgCXK1IGmJL0ppMPtgJdsrIpuA6mEaGWkx5ofEKuzKk2xpuet+41w98
         Hx+BZHV4qA+yXzqHMyq2+tMbIh0mne6FEodTps4ZqrpvGN/uVfS1HvzDz5GlZRBPDrsB
         td7KJQROpiX2DG1ttx8pBXs1m0oHgEMUy1F+9o6h+ESy5YvhMwRQJ8xtS+wA0iWQA/18
         MVglagYJPaIfUywAfhK5H8koZ6ufmo+F+lIlnGNp0oO/A9YdxGxLPzrZjWyPAjgnLvTz
         T8ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rom9OVA+1KloJYBk1Ge2B9+c5Invl3qCYoMbodlSZH6siJ5KC+YPSbM4+yDuYBj9pA5vR/GBvOI0Nwo267sA3cB@lists.infradead.org
X-Gm-Message-State: AOJu0YwDqFet2leq+NX2Yy2f7OatkHKuDStM5np0EyMUVfY4MjYMcFz6
	kWImGxQNJTUN2uRz6Cley0e+uS3bTfacq6Fqhn+XuDA//6za/mtILGcTIMw6u50ZYUf5CiPw5oJ
	mrcKmQGiFwXLL5c9dtVuKzBFK5HpvzyI=
X-Gm-Gg: AfdE7ckfrXEeWuQjd42MfcDGshiwo1e/EVSkPORxN2YMWh+Pl/x3jxzmzGotPVcp7bf
	NwNS75HK9qyxsIdZ/Sio8SDmlorRwS61bEzc+OC4LIVfwMDPnR+jXWAZJ2Icw0NFd02P9laEI6s
	AG7VJduykYc1Lm36rCMSNCiKMZjbDBzXtEsE/8oYIyG6pKTlQ5s20OtDn5HHy/+bkAdwvfFzE0m
	W4+8+MyysioYYf3RGdbsjg5IxcAChuOprPrsZ49fGvbdNsRMyd3M2zz6ujKXbfxJiEq3LxrGrux
	pf4yijzfyg==
X-Received: by 2002:a17:907:3d55:b0:c15:efb1:9ff7 with SMTP id
 a640c23a62f3a-c16616ad29bmr332320166b.28.1784070334544; Tue, 14 Jul 2026
 16:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch>
In-Reply-To: <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 07:05:23 +0800
X-Gm-Features: AUfX_mw_zrKoDsMO8kJR8iRpLq9HGKaiImf5TsHlB4TM3nCjyfFFksGlOJoy3Z8
Message-ID: <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: Andrew Lunn <andrew@lunn.ch>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_160536_716674_3F2D9FD3 
X-CRM114-Status: GOOD (  17.11  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=
=91=A8=E4=B8=89 06:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> > Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode=
")
>
> You do not appear to Cc: the Wangxun NIC people. It would be good to
> have there comments on this change.

I apologize; the output from get_maintainer.pl is very long. I=E2=80=99ve
heard that having too many recipients can cause the PATCH to be
rejected by the LKML mail server.

I have added Wangxun maintainer (Jiawen Wu <jiawenwu@trustnetic.com>
and Mengyuan Lou <mengyuanlou@net-swift.com>) to the CC list.

> > Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode=
")
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> Please don't mix fixed and new code. Is this a real fix? Should it be
> back ported to stable?

I am not sure if this is a specific characteristic of Wangxun NICs, as
I do not have any available for testing.

The behavior of the Rockchip DW XPCS IP core matches what is described
in the commit message (even though phylink brings the link to down
based on the phydev link status).

This appears to be a bug (at least on Rockchip platforms) or Wangxun
NICs features.

However, I cannot confirm whether Wangxun NICs behave the same way.
Therefore, I have kept their code as is for now.

Could a Wangxun NICs maintainer provide some feedback based on testing?

If we can confirm that this is indeed a bug, I can submit a separate fix.

I would greatly appreciate it.

Thanks.

