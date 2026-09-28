Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C26FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=; b=Lrg6zrcfQMI2I781XNqgndEpgq
	ajcWVE8pgl5/yJVJPMrU9Hc4wNakrYqfroGWaKglK002TWMZBPPxB8FY9KDZHeHBFOOyufPNa7BMv
	WQn7zUL33Up/wX0oZYmUwM37dLgAXRUdbpHAiV8RwpG6Rx86ta7xQAan/zzhF/E5MYsFM7DRg2OaT
	3KMbzm/cE6tojFJbttw//7jPQK4+Cvco60zo1EbGHt8kr/KfniorZBHFV850TD1k6P4KO95XCv+n4
	xpovNAHjcthGVwjOo8/QRcE2omUhT1NThjuF/AJIjJTHTORQJ6dfVoNQ4Jd8ODJdh2TY1YAFOIF94
	KyytyfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAUX-00000000YTt-1PTE;
	Mon, 28 Sep 2026 12:29:57 +0000
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAUT-00000000YTB-2IKv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:29:56 +0000
Received: by mail-pz2-x2a.google.com with SMTP id d2e1a72fcca58-881a3a28e72so527833b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 05:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598592; cv=none;
        d=google.com; s=arc-20260327;
        b=E704+rirGHS2opkl4cf0gA1C1ENw1cuhfRvfkfzRJ4nGjJ4gMLJqsoFHkoewbReV4r
         Na7MhmwKqknSjmyOAVGYSt26ZKIpNZ3AC0nH3WJdJ0xvR5T+QcE2gLbxZJo6SMbkZuzc
         y7g2ts9Tsah/035JwP9dT2tmExtRPlO57/lH5k9TiKqjdyfVBgHCE3f4wRryBGIPg+Un
         /fZINYAyRGh0N25hGGaW+eCcQ7T1v1UJpo7K1sXJoJKrEXtaorPzFqsA/EgJwcZdKpOV
         LYMkKleDZWv9laOy/wWnJq7WxJxXX8jCqOWkgdkkFtNxwGcH1QoEe5WvwZMyssLPaz8z
         zngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        fh=WlVzq986OfTeKR5FoAJP31aP0SdSAJgAf73K31YzisE=;
        b=rY0pqASowUcnaaPRppsjgM36GMxmEnRZ210O42t4BeOmPKX7X94l1WAPsU9dmUkNUc
         WBNdPaLissQNBwTUMc5iyNcuHGbIO18BDlvjVm0s/LS80IiO7gq8lA2S2Oxp/7zvv/uu
         Jrx7U60O+uN+n4CgpVGgEpRJKhJh0ILVfIB+IqAWtZ4Z1DNMlynZHF+TFNmZhfHFotNK
         VnzNsLvl8SsKJCgisyvW2PmiH0TP+kOWjCfES0isnKz1ImC2HBLclByJbINT0zSLTtS9
         piRrUtEwwsP3UPi5a9ppiZTw3+zTOIAQgjVaRoqiDMqID4MEXMIO3Kguu3ijdAbLpXb2
         x/Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790598592; x=1791203392; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        b=BwKSorKutATuIdyFz3LYL36DiKYGEjr57ePbZP4r3HHYRzoVh2iiysWIurgCXtgLlT
         lf+fQhe/V3AY4+EvAikJvrjqpQ38Hnks4p64CbLMSAl4ZhiLHvWCligy5W6NTP0QQH0i
         +OvGdQTtCVPfI6W6bIt3EKAinLf/uNcXpEMU2H/xuR2G/bM0R63rY1VZdnetdyKSXX8A
         apWOi4MIQSuHyLMtpg7ms/DG48Z9LBwsG+J/j43DC/SgZLcw8j/73J+yAwMRCizbX7XH
         sPngSt+aUyh3By8y485iDWml2DmaF4co4BPF1qDRx0iUGdMyU19dpnCSA7LF2WWYeMmE
         tx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598592; x=1791203392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkBawcJZORsxZeSYcvknPN1o23VT6bn/NSzgx7OBRD0=;
        b=12ZKVuv7DrZh6K4oTJJlru6U30yrjFV0Qq/Ho5DZHrifzr8K8ZVYxnztVimQmyOr5c
         b1auQ7+dWvr4QEmePNOVf0JpOqFBb737omX3iZRdfMQubY3qUNL36xWFitANV7nMYopX
         u6aKvFqCQsKK0HbCG5IOJaiumbGgHppqvCzKmbiTm44+tZ8uLlGROj8etZbwS1KQIdlz
         lOmXgfh39mih7pkYwT3qhkDft3TYy0JwWUUytSgzjBocsfpBO6znS5I+90lKZUYZV5eD
         jopVgIsx3v2CAn1SHdpmjRskLfL7xud4CZP6KoPSi1QPuRs096vNfL0qptkcdiVXRw3m
         IrFQ==
X-Forwarded-Encrypted: i=1; AKwUvByawNM/0QVGl8Bp3x9/TWKSpflCinwTNoIPc7tYW2feQeMQwZ8Mu2Hp/GV3VLV/3ZZtynXhjTOaC0wkO27AtY0q@lists.infradead.org
X-Gm-Message-State: AFuF++mwAz86C0zbs15xhhJhZffxEz+ILlX4iMGJpxtUeozcEIb4O+Lk
	7HOnKiCYkqGf4Qebqr1yESpBlz927rPrrRys1hqis6z70hq7BVw69j3cSHLirgqCBPGD57hROm8
	bUF82HA5dN3UT5jvv27B8lQhwTW2SThjpk1PR8yDGbiG8YqTXs6Ur
X-Gm-Gg: AYBFou3n+rE3Llo/oGnYMcc32pvBYVmPiW5y4/0wiC5XXyZDuqIarBbeY9vqNNytZOD
	HNBFGMZXR8BPuoAZFMIAErjb7crdeXFiqXlWyv3uYAnFDl1DqcMW4jemEsM0knqEgnuVTCAbnkK
	Tn1ze5R4fVB08QUDmka7k1w6y3jT29rWYWyCsFLgPp0yr3smmXCn5oPL48wIwALpG/hgogLEvMp
	2kFAhytD2//gIE5lR0mYiSZu2xh4Xb1YTIOWSiKCK4+NnJXAL8VAOyILsWHpPIN1mOVTDY0HDZB
	kdN/1sY57dEoZIqakuV9lVrU3LYUh1HDBivDa76Ci6LtYfiu2xBEzDbDV9CPhqvB7wAaZmvx+fH
	8fwjuj91O0gDBBpsbhLPZ++GRB6fBQ5pDAhs=
X-Received: by 2002:a05:6a21:6f12:b0:3dd:a196:3091 with SMTP id
 adf61e73a8af0-3de0e953993mr11609993637.65.1790598592229; Mon, 28 Sep 2026
 05:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260922125112.2111256-1-robert.marko@sartura.hr>
 <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577> <CA+HBbNG2nGXpXC63AVUJX3KaqzJG+Q=-Md92eTpq7Y-O4CHMzg@mail.gmail.com>
 <20260928110438.unoxnyymg7zwuuqk@DEN-DL-M70577>
In-Reply-To: <20260928110438.unoxnyymg7zwuuqk@DEN-DL-M70577>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 14:29:40 +0200
X-Gm-Features: AclHuK_nzNTo2nwU3xgEirfWnjz5VEDaxc01jJkDIRwQ-q74rDelYXQzHvCKWN0
Message-ID: <CA+HBbNHNdz3TpJRAYt08CnYtA081i-SXxO8ia+tbHvbcx+KAJw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: lan969x: correct RGMII port mapping index
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Steen.Hegelund@microchip.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_052953_601917_0B21827B 
X-CRM114-Status: GOOD (  38.68  )
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

On Mon, Sep 28, 2026 at 1:04=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Hi Robert,
>
> > On Mon, Sep 28, 2026 at 11:18=E2=80=AFAM Daniel Machon
> > <daniel.machon@microchip.com> wrote:
> > >
> > > Hi Robert,
> > >
> > > > Currently, the lan969x_port_dev_mapping does not check for RGMII po=
rts
> > > > and just returns the physical port index.
> > > >
> > > > However, this does not work for RGMII ports as they have dedicated =
DEVRGMII
> > > > register space with an dedicated instance per RGMII port.
> > > >
> > > > So, check if requested port index is an RGMII port and return the c=
orrect
> > > > DEVRGMII index.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 ++++++=
+++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.=
c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > index f3a9c71bea36a..bf5320c7a6ca8 100644
> > > > --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > > > @@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct spa=
rx5 *sparx5, int port)
> > > >
> > > >  static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int por=
t)
> > > >  {
> > > > +       if (lan969x_port_is_rgmii(port)) {
> > > > +               switch (port) {
> > > > +               case 28:
> > > > +                       return 0;
> > > > +               case 29:
> > > > +                       return 1;
> > > > +               }
> > > > +       }
> > > > +
> > > >         if (lan969x_port_is_5g(port)) {
> > > >                 switch (port) {
> > > >                 case 9:
> > > > --
> > > > 2.55.0
> > > >
> > >
> > > The mapping itself is right, but as far as I can see nothing upstream
> > > uses the returned index to access DEVRGMII. Every caller of
> > > sparx5_port_dev_index() pairs it with sparx5_to_high_dev() or
> > > sparx5_to_pcs_dev(), which never return TARGET_DEVRGMII. Those paths
> > > are also never taken for RGMII ports. The code that does access
> > > DEVRGMII, in lan969x_rgmii.c, computes its own index with
> > > RGMII_PORT_IDX(). Sashiko, correctly points this out.
> > >
> > > So I don't think anything is broken today. Did you see a problem on
> > > hardware that this fixes?
> > >
> > > FYI, we carry the same change downstream. But there it was added toge=
ther with
> > > RGMII MTU support, which reads and writes DEVRGMII_MAC_MAXLEN_CFG() u=
sing this
> > > index.
> >
> > Hi Andrew,
> > As pointed out nothing yet is broken, hence no fixes tag.
> >
> > I am using it downstream as well, for the MTU change support where as
> > you pointed out RGMII code
> > uses it to get the correct index.
> >
> > So, I thought that it would be good idea to send it upstream before
> > eventually getting around to sending
> > the MTU change support as well.
>
> It wasn't clear to me that this was preparation work for a future feature=
. As a
> standlone patch it does nothing. IDK, to me it would make more sense to j=
ust
> send it together with the patchset that would actually use it.

That is fine by me.

Regards,
Robert

>
> /Daniel
>
> >
> > Regards,
> > Robert
> >
> > >
> > > /Daniel
> >
> >
> >
> > --
> > Robert Marko
> > Staff Embedded Linux Engineer
> > Sartura d.d.
> > Lendavska ulica 16a
> > 10000 Zagreb, Croatia
> > Email: robert.marko@sartura.hr
> > Web: www.sartura.hr



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

