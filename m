Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B28CEB2CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAhpvtcxWm9IHGf9A0rzeueRcz+eQkl96FnuXumWLrE=; b=F4IxNdMgSzkUPkTZOL4jUPlbO1
	+kfjt0Ea4SOX7H+0jYmt1zmByHlXYruysa/yGW2uUVZu+SlLIJ2sYa719bScqkQaI0uWDL3/dXF+E
	9ITZ85OksTzlEm2I16XcoyxDv5LXdJ3ydQButYIHxYataT5hZXupBgVCbgjd4GoUe9fmgxcKuepPN
	l5LCLoc+Vv78ZetxSi5xPEDJb7RiOAb/1FgHQkbUql5FfGFzbxJEIiIZGPTTdT1iwKddzYjwLknyZ
	u6tkkPDLhtic5k7oOdc/YJDkcfI5FNfdm2DKrVhL/kL5ZvAOhF20sT8Bud0cMUNBfYPAFW2RDqIsS
	jjZMR4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDE6-0000000DhBV-0gaT;
	Sat, 15 Nov 2025 10:09:50 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDE3-0000000DhAh-1UVV;
	Sat, 15 Nov 2025 10:09:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 205D6410BC;
	Sat, 15 Nov 2025 11:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763201384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TAhpvtcxWm9IHGf9A0rzeueRcz+eQkl96FnuXumWLrE=;
	b=HCsoERdx+wCfcYL76RWyzHFmRdwscfp5+F2x9G6dYsGDNcPDgFrEg3+Inf5WtgfKdVQ9L3
	mKjZvKSI08VhpujHG8cgJQRVc+Tm36KvBN/RIxqmMTbqssa82gB6r4f4o3ITAPQrZdHtIH
	QllMadYz95++2zitEeh3AK1aWMyC+n2abp4SHCFJsG6EJV9hRZhsR2hjj0wFsrViVazJND
	vuJFR9JYWPbEa/vxk+5Y9g24/iUkgqBMzZxZOcsJjxmC7OkOdJcDa5CBcrtSUuoR3+izXh
	u5CDcEhyAmCAq6tNsd3ylzKmNAYjHY8VeLuxOGnk8NtB4MBHFQgyw1jLqnd8dQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aRhQMRjffbeCeArE@geday>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
 <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org>
 <aRhNIcGcQKp2ylqN@geday>
 <85d1543b-ea91-5f0f-59d6-e00fcf720938@manjaro.org> <aRhQMRjffbeCeArE@geday>
Date: Sat, 15 Nov 2025 11:09:42 +0100
Cc: linux-rockchip@lists.infradead.org, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <52931e25-0d6f-ca0a-7c26-2c65ab11432e@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/3] =?utf-8?q?PCI=3A?=
 =?utf-8?q?_rockchip-host=3A?= comment danger of =?utf-8?q?5=2E0?= GT/s 
 speed
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_020947_569578_4A5BA5AF 
X-CRM114-Status: GOOD (  13.79  )
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

On Saturday, November 15, 2025 11:04 CET, Geraldo Nascimento <geraldoga=
briel@gmail.com> wrote:
> On Sat, Nov 15, 2025 at 11:01:21AM +0100, Dragan Simic wrote:
> > On Saturday, November 15, 2025 10:51 CET, Geraldo Nascimento <geral=
dogabriel@gmail.com> wrote:
> > > On Sat, Nov 15, 2025 at 10:30:49AM +0100, Dragan Simic wrote:
> > > > Looking good to me, thanks for this patch!  There's no need
> > > > to emit warnings here, because they'd be emitted already in
> > > > the rockchip=5Fpcie=5Fparse=5Fdt() function.
> > > >=20
> > > > Please feel free to include
> > > >=20
> > > > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > > >
> > >=20
> > > I disagree, I think the comment stands.
> > >=20
> > > Even if we reduce to one line, ex:
> > >=20
> > > + May cause damage
> >=20
> > Ah, perhaps I wasn't clear enough, so let me clarify a bit.  The
> > comment you added is fine, I just referred to no need for emitting
> > a warning at that point, because it would be emitted already.
>=20
> OK, I get it now so I think it's time to send v2 with all that in min=
d
> :)

Please, wait a day or two before sending the v2, because that's
standard procedure.  Sending more than one version in the same day
is highly discouraged, because it doesn't give enough time to people
for reviewing, and may cause people to look at a wrong version.


