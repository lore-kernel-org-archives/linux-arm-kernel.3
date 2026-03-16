Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10629F53D92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncI2adifhgsuypmCH/MRct/0BfNf99PzZtXkj5DX2ZE=; b=pAxufYTRtrqxXA4zQ3Q72WXwOp
	hnoaaIldCj03D+U686LQ0ag2iOnzM9N5csnKyaxfB3RtAvBxc7TEksFMLSbD+SRQwNqfw8tNO3eHC
	INxxMAJeYn/W6uJGZsX0osXWTgt46pKgTihsm1Z44deVAIO4V8gxgCkM76fM46K2LYiNyq5fuh0bW
	wiLL4gmXPTH4ho+KELkG1AgLMbFGYNrQ/UfSlXQyfQeCFnYqLW5lVHPu7SUFgm1MQdHULYGrdTXJe
	br2BNZVq+RFW0kqFe6IwQfdni7+KQi8qolehyaOMhEEh9SExuWb+0fue6BzOMNje92uDeu/KnMuUD
	D4ND4gHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EKV-00000004nPY-44WN;
	Mon, 16 Mar 2026 20:14:23 +0000
Received: from mail-dy1-x1362.google.com ([2607:f8b0:4864:20::1362])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EKS-00000004nP9-0Pq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:14:22 +0000
Received: by mail-dy1-x1362.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso76787eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692058; x=1774296858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncI2adifhgsuypmCH/MRct/0BfNf99PzZtXkj5DX2ZE=;
        b=qDBEhGwadYIZfWr3JAFm7je954/TPAKAM7E6UhyLc8bNIV9D+8OUP2P9WxtmbGPqbX
         DYEwfTkRFf1reX4071QcvRiGlyWySwPzaH1iT9wOnkHTKHNtmzsBMVptyEuFP5i6iYyy
         Ito/jQpvmokieSkUPw1O/WoevKVmo7gUcysU2MyeXLbqDarVNQRrtoNFt2BGX8jkuANa
         +8oKeFz2e/RBenCnp+eZA82WMzJE5T7IYVF3GvzA1b7c6qjfgTS05LHsll5tjKjACW4j
         v9ZlCnYVHZaRmFO3YEEawtnKnY30MTtK3RvPSS83V5lVy9fYCu2aZAVbG444RbY9sES7
         5iiw==
X-Forwarded-Encrypted: i=2; AJvYcCX89d0y9Ht+wkI065EIyGWrh94zS/Y/HvSmjKj3abBJYRAoXrAZGlu7TXEMt8gvtofRTj8DkI6f+WR5lA9Gtn5E@lists.infradead.org
X-Gm-Message-State: AOJu0YzygNfQyCv/LXZdBG5gjMU3L+xy4cx1CF4BV429NurA0Pcd7sIT
	v58X/bJnuGRVT5AqbUrwN78YcpDk7hvGIdicRtvygvE3LMNdD91YDOqwS8eOI5Sdi9teyUVF3o9
	+qxGuO1w9w4ZNNMJGF7/kqBGkMjJf3DB5oq19/U+fHuw7dijHbrhpBtKrnH2C5WRFTEoFMu6oTn
	DG6hM/blC+vDaRSBgmhrao6BVnQuIEdH4NuTbKLLiyr9qvPIIab6p+CsKcWwEsrmyIC0OXHPM5x
	0fDR24u13jaKHxy3TxfJ+FW/po0R3jtOWTk
X-Gm-Gg: ATEYQzz1nh5Wt93jTkT2XQRer5ssIZe5T0XnzlqGMMyTQVHh5DNuhYqqX6890GlacAB
	pRJd78w1YXQjY/m5Mf6Ry+/gHJWm9NxqHxaFUWk4C3J3fbb4DFj+v2353Zw3VxjoAEbPo31I0IF
	wiC9k9gUWlcM8/1qjttBPHz3canvu3wEZp+Ksulr8mszRGU9LJmsxBL1w3SWJT2dgTt2SSpe6QB
	uf7GZvM+4FVuhn8IItZ85hFok6cycvz9VBbjh3Qwe9GIlpyd3V8loqctWiGTxkY20Hw0itIQjBI
	O2O6FY4mKSfB8WaG2lVIbNughhH56xv8OPaokTarCcttAWesdwDu7zysv/1XAlYSBy5UpeqWb/s
	H9ie+OsQ3Q6iJR0pqYmiSX9wJeygm3HZLJsbuspfRsblip7pcDyyy0GNFOt/z4tmVeRr5eLMgZ9
	TXfJ+2COdVEUCWO0dBe2ANpjcjpcNGwv0I2Od7xxXYiiouN1QDjyIl8pO3dbZ5e3fXxg==
X-Received: by 2002:a05:7300:fd0d:b0:2c0:c1e0:2449 with SMTP id 5a478bee46e88-2c0d50937f2mr364297eec.2.1773692057901;
        Mon, 16 Mar 2026 13:14:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2beab25a91bsm699493eec.0.2026.03.16.13.14.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:14:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439c5cce2deso5352170f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692056; cv=none;
        d=google.com; s=arc-20240605;
        b=Bgwxmjk3xZpZoY0VKzh56gAWuRjxEoiF8G18Hg/S9Vn0diemfVpaApiU1JS4FcxqIj
         bzJfsZV1KVcIH+bwDMW4oWUNZ/tswiYrPAsvfU2csLdED1FjqPUzjFtIUb3Tx0AmB5Cf
         XurO7lLeb1aPjGENWqeEB9geNR9AlZ8TBswoCUlpTYchUkbDnOsJxG57URfUwKYd1quS
         Lyw8OJZSsXt8EYefWC3KZo7WKoFc2gCF0pmyCXIVXiAqK9A+GS3AU3bbR7LLqMhybez7
         ClM5c/ehvIECPgaAIjjBk2h5WzEQC59qUQ5tlTz54u2lIiSEOJ8JY9iwBUbgT8dfnqhl
         kCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ncI2adifhgsuypmCH/MRct/0BfNf99PzZtXkj5DX2ZE=;
        fh=bZd2AVj/rtofkqls/2yi1Ai80VdcsUByeiTrrvhMW7Y=;
        b=ergRsPYHll/klTnwn2SPXeygdiiEb5JZW5RmpC5CohNOcoUr5eVklBLIl9jlilQXMn
         hdC+7svwdKd5GYXjejpe73yzRJW95ufQYDWxiFL7RTfR9HmL9TFjGERWZmzUuBiE7DWh
         VM+zWxSbBRy06tCNw2tIKODvk5moghGJ9LG6GW4zDDAxXmRekKNNdJ8vsZtzywQUwW6I
         ilMpEyORuPnMUTJkpBSsC+IxDh2Xv0zutnSOyJeJW+63eT2uyo/JAyQUbWtvM0IVfvp7
         aytj2EagkOiHWrVREreJ+sL54mxJcPtvMHSHMedqREP5YGRGj/ETLhrmracOVUPqnJFB
         AbJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773692056; x=1774296856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ncI2adifhgsuypmCH/MRct/0BfNf99PzZtXkj5DX2ZE=;
        b=bWgEMDWRo2SrkUxBgCZn+9DWAG/JZveKkq+SkS3Xu956SKJOVU+Jnr/dhmNwDhT70z
         FXgP4cdMRob2TAWr5pV6N6JI2v4yM/UDrxh1vaXfJEA6mtsu3XReOXVQDSzQGO92YFzf
         2LeHczNnHfEHrr8ufVheCUNENxPZDJCN/gBDA=
X-Forwarded-Encrypted: i=1; AJvYcCVd/5NsdSirrlJcwVPl7FCBlQTJZj17CMCqjDNhzq3Trhi2JgEMQ5gpQ/+iSoTtH/AXlNAiEziGHla63nBrUIOb@lists.infradead.org
X-Received: by 2002:a05:6000:1849:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43a04db6013mr24504415f8f.31.1773692055565;
        Mon, 16 Mar 2026 13:14:15 -0700 (PDT)
X-Received: by 2002:a05:6000:1849:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43a04db6013mr24504362f8f.31.1773692054993; Mon, 16 Mar 2026
 13:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-3-jitendra.vegiraju@broadcom.com> <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
In-Reply-To: <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 16 Mar 2026 13:14:02 -0700
X-Gm-Features: AaiRm51rhr8AUuKjJ896JXx8rkZIE9TCvoAwPiDICMMkm27V0tquX6eEi5cGDi4
Message-ID: <CAMdnO-+UEb8sVf8=Aj7G6UgY-DxWe3bFYbSbKJRdU4woEX+dWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/5] net: stmmac: Add DW25GMAC support in
 stmmac core driver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	richardcochran@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, rohan.g.thomas@altera.com, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me, me@ziyao.cc, 
	siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com, 
	lizhi2@eswincomputing.com, boon.khai.ng@altera.com, 
	maxime.chevallier@bootlin.com, matthew.gerlach@altera.com, 
	chenchuangyu@xiaomi.com, yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com, 
	chenhuacai@kernel.org, florian.fainelli@broadcom.com, 
	quic_abchauha@quicinc.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f1ca0e064d29dcd3"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_131420_296162_29765615 
X-CRM114-Status: GOOD (  23.09  )
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

--000000000000f1ca0e064d29dcd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,
Thank you for reviewing the patches.


On Fri, Mar 13, 2026 at 4:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Mar 13, 2026 at 03:22:03PM -0700, \Jitendra Vegiraju wrote:
> > @@ -42,13 +42,18 @@
> >  #define DWXGMAC_CORE_2_20    0x22
> >  #define DWXLGMAC_CORE_2_00   0x20
> >
> > +#define DW25GMAC_CORE_3_20   0x32
> > +#define DW25GMAC_CORE_4_00   0x40
> > +
>
> Do these live in the same versioning numberspace as DWXGMAC and
> DWXLGMAC?
>
> > +int dw25gmac_setup(struct stmmac_priv *priv)
> > +{
> > +     struct mac_device_info *mac =3D priv->hw;
> > +
> > +     dev_info(priv->device, "\tDW25GMAC\n");
> > +
> > +     priv->dev->priv_flags |=3D IFF_UNICAST_FLT;
> > +     mac->pcsr =3D priv->ioaddr;
> > +     mac->multicast_filter_bins =3D priv->plat->multicast_filter_bins;
> > +     mac->unicast_filter_entries =3D priv->plat->unicast_filter_entrie=
s;
> > +     mac->mcast_bits_log2 =3D 0;
> > +
> > +     if (mac->multicast_filter_bins)
> > +             mac->mcast_bits_log2 =3D ilog2(mac->multicast_filter_bins=
);
>
> The above seems to be common amongst the other two setup functions.
> Maybe there should be a helper for this?
>
Ack. Will address this in v8.
> > +
> > +     mac->link.caps =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +                      MAC_1000FD | MAC_2500FD | MAC_5000FD |
> > +                      MAC_10000FD | MAC_25000FD;
> > +     mac->link.duplex =3D 0;
> > +     mac->link.speed10 =3D XGMAC_CONFIG_SS_10_MII;
> > +     mac->link.speed100 =3D XGMAC_CONFIG_SS_100_MII;
> > +     mac->link.speed1000 =3D XGMAC_CONFIG_SS_1000_GMII;
> > +     mac->link.speed2500 =3D XGMAC_CONFIG_SS_2500_GMII;
> > +     mac->link.xgmii.speed2500 =3D XGMAC_CONFIG_SS_2500;
> > +     mac->link.xgmii.speed5000 =3D XGMAC_CONFIG_SS_5000;
> > +     mac->link.xgmii.speed10000 =3D XGMAC_CONFIG_SS_10000;
> > +     mac->link.xgmii.speed25000 =3D XGMAC_CONFIG_SS_25000;
> > +     mac->link.speed_mask =3D XGMAC_CONFIG_SS_MASK;
>
> Is there any point populating link.speed10 and link.speed100 ?
> You're telling phylink that 10/100M speeds aren't supported in
> link.caps, so these speeds won't ever be used.
>
Thanks, I missed this. Will remove 10/100M entries.
> > +
> > +     mac->mii.addr =3D XGMAC_MDIO_ADDR;
> > +     mac->mii.data =3D XGMAC_MDIO_DATA;
> > +     mac->mii.addr_mask =3D GENMASK(20, 16);
> > +     mac->mii.reg_mask =3D GENMASK(15, 0);
> > +     mac->mii.clk_csr_mask =3D GENMASK(21, 19);
>
> This will be the third instance of this particular mii data setup.
> Please consider adding a function to do this setup.
>
I will move this code segment to common helper function.
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000f1ca0e064d29dcd3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEINUVUbysjL9+gNiqoYke75wxwIG38bARO/RSYDlx0FPlMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMxNjIwMTQxNlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAGJKXuHd/yrg
KBUq3NJEURVlpyjgbXxGZoZHN/WYFfWn9Fame9GPeqi5wKVkzY+e9fxAmFEqYsqprsMAYC+6jSbi
D9+lIoyMHnztR+Hm5lpx3Eeuw8U+CTe9oemrhWUwhrEBeM4eOG0IX+I1mAOc4/dF77isMViu/icB
JlJSc+qasb+6nx9+h8xX0lJ7aXATk9LEVRMgknpCd+bn8YOjy/+OOmWgggrjg0zIegeHMdnaYAMk
8oSzYo9TYTep+9L5bxi10AS055EwBPFm7vH2M7zGwO+OwYHDhC0MFS1OCXykY35TbNZMvtOLqdw6
xXgqmo2CFadjsEIcc7+Ucs+Fzfs=
--000000000000f1ca0e064d29dcd3--

