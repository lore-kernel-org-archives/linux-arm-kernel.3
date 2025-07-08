Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE242C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J55cKjqJdB/s54ySt3a9A6aU/rgkpjBjIATa2spYydU=; b=wclMJ3MrVYJ04xQjtzSKY3IFLC
	iYnumSJumrLSMOIBw8U4jzJXsaZJqyLYk5IFR+K17RL5IgOu2/omhNm43dzSZ56l58pnCkyww8bKB
	OzAIoUzFA9sjRuGJ5qPxUm+4VMYpBeuWiI+0B81Vm5Z5thLnWBElmogs89UcgglptqzmJu34ePL2M
	jKz20CXcB9Qvo0gZREVbX/LGLuqf+e/BQmnbiiV7C/NFSTMwjIUuW0PvLLZiea3BCSMxMjIYS9h6K
	P+CCyyeapRXGxKNxa6bM5399KMm7nis/hy3GPcnQMWck1+fh9Sv+ialcp27nfO9IqXbbZQ89hPWKB
	p+PP0WMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxnk-0000000433j-2rNp;
	Tue, 08 Jul 2025 02:11:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxjO-000000042JD-1Zze
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 02:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751940402;
	bh=J55cKjqJdB/s54ySt3a9A6aU/rgkpjBjIATa2spYydU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IJYoMmteYdZnYL0OquHwmK0NgiaYNAHFy7ZXSITie3Aff57LFZ10+VjFGYJo5pgh6
	 +2wZlmQU026XtnxYbNM7ivS4pQN6FE6/BEw12mwgCSeyAtxs8F+w2dEQCp85J1J+Gs
	 Kzfn64K3crWXikXXqxFvqxbS1gjLzh+W5ujytZ4weU3fiuJQQE0EXxWVkNK7qfqxj0
	 ijvNj5Vw1L2hDpWPRT7kPn/lt258fmy8dHx/YfWrn7KHZLGg2njfsM9G4S6e0kfMoO
	 DvEu1YrP2ovT4C+zLLvrR+2vEjQwJRzC9WNMNQfPbBmQqd5Nez6vEvaYXMRHJoNOoe
	 zph9f7ARVn9OQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 25621640B5;
	Tue,  8 Jul 2025 10:06:40 +0800 (AWST)
Message-ID: <f66b8b80d057a095dad3b41f224fb633565313ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 04/10] soc: aspeed: lpc-snoop: Constrain parameters
 in channel paths
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>,  Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 08 Jul 2025 11:36:39 +0930
In-Reply-To: <20250704184408.32227305@endymion>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	 <20250616-aspeed-lpc-snoop-fixes-v2-4-3cdd59c934d3@codeconstruct.com.au>
	 <20250704184408.32227305@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_190650_605465_921AE204 
X-CRM114-Status: GOOD (  23.78  )
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

Hi Jean,

On Fri, 2025-07-04 at 18:44 +0200, Jean Delvare wrote:
> On Mon, 16 Jun 2025 22:43:41 +0930, Andrew Jeffery wrote:
> > Ensure pointers and the channel index are valid before use.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 ++++++++++++++++------=
---
> > =C2=A01 file changed, 16 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed=
/aspeed-lpc-snoop.c
> > index ca7536213e0986f737606a52996ffea620df2a7a..804c6ed9c4c671da73a6c66=
c1de41c59922c82dc 100644
> > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > @@ -25,7 +25,6 @@
> > =C2=A0
> > =C2=A0#define DEVICE_NAME=C2=A0=C2=A0=C2=A0=C2=A0"aspeed-lpc-snoop"
> > =C2=A0
> > -#define NUM_SNOOP_CHANNELS 2
> > =C2=A0#define SNOOP_FIFO_SIZE 2048
> > =C2=A0
> > =C2=A0#define HICR5=C2=A0=C2=A00x80
> > @@ -57,6 +56,12 @@ struct aspeed_lpc_snoop_model_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int has_hicrb_=
ensnp;
> > =C2=A0};
> > =C2=A0
> > +enum aspeed_lpc_snoop_index {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_0 =3D=
 0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_1 =3D=
 1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_LPC_SNOOP_INDEX_MAX =
=3D ASPEED_LPC_SNOOP_INDEX_1,
> > +};
>=20
> I don't have a strong opinion on this (again, I'm neither the driver
> maintainer nor the subsystem maintainer so my opinion has little
> value), but IMHO the main value of introducing an enum here was to make
> it possible to get rid of the default statement in the switch
> constructs. With switch constructs being gone in patch 10/10 (soc:
> aspeed: lpc-snoop: Lift channel config to const structs), the value of
> this enum seems pretty low now. You could use NUM_SNOOP_CHANNELS
> instead of ASPEED_LPC_SNOOP_INDEX_MAX + 1 and 0 and 1 instead of
> ASPEED_LPC_SNOOP_INDEX_0 and ASPEED_LPC_SNOOP_INDEX_1, respectively,
> and the code would work just the same, while being more simple, with no
> downside that I can see.
>=20

Yeah, I agonised over it a bit before posting. However, I'm on leave,
and I'd like to draw a line under this series. This patch is in the
middle of it, and I'd rather not disrupt it too much and go around
again with a v3. I'm going to keep the enum for now, but if I need to
tidy up the driver down again the track I'll reconsider its worth.

Andrew


